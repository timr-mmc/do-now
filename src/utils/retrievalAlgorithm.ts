/**
 * Spaced Repetition & Retrieval Practice Algorithm
 * Based on Craig Barton & Ollie Lovell's Do-Now strategies
 * 
 * Core Principles:
 * 1. Spacing Effect: Review at optimal intervals (1 day, 1 week, 1 month)
 * 2. Interleaving: Mix different topics/strands
 * 3. Retrieval Practice: Active recall strengthens memory
 * 4. Desirable Difficulty: Challenge at appropriate level
 */

import { SupabaseClient } from '@supabase/supabase-js'

export interface BankCandidate {
  bank_id: string
  category: string
  topic: string
  subtopic: string
  last_used_date?: string
  days_ago?: number
  last_performance?: number
  avg_performance?: number
  times_used?: number
  reason: 'recent' | 'medium' | 'longterm' | 'weak' | 'new'
  priority_score?: number
}

export interface RetrievalConfig {
  recentSlots: number      // Questions from 1-3 days ago
  mediumSlots: number      // Questions from 5-14 days ago
  longtermSlots: number    // Questions from 20-40 days ago
  weakSlots: number        // Low performance (<60%)
  newSlots: number         // Never used before
  mixStrands: boolean      // Ensure variety of categories
  weakThreshold: number    // % threshold for "weak" (default 60)
}

export const DEFAULT_CONFIG: RetrievalConfig = {
  recentSlots: 2,
  mediumSlots: 2,
  longtermSlots: 1,
  weakSlots: 1,
  newSlots: 0,
  mixStrands: true,
  weakThreshold: 60
}

/**
 * Generate optimal Do-Now question selection using spaced repetition
 */
export async function generateSmartDoNow(
  supabase: SupabaseClient,
  profileId: string,
  config: RetrievalConfig = DEFAULT_CONFIG
): Promise<BankCandidate[]> {
  
  const candidates: BankCandidate[] = []
  const selectedCategories = new Set<string>()

  // 1. Get RECENT candidates (1-3 days ago)
  if (config.recentSlots > 0) {
    const recent = await getBanksByInterval(supabase, profileId, 1, 3)
    const recentCandidates = recent
      .map(b => ({ ...b, reason: 'recent' as const, priority_score: calculatePriority(b, 'recent') }))
      .sort((a, b) => (b.priority_score || 0) - (a.priority_score || 0))
    
    candidates.push(...selectDiverse(recentCandidates, config.recentSlots, config.mixStrands, selectedCategories))
  }

  // 2. Get MEDIUM-TERM candidates (5-14 days ago)
  if (config.mediumSlots > 0) {
    const medium = await getBanksByInterval(supabase, profileId, 5, 14)
    const mediumCandidates = medium
      .map(b => ({ ...b, reason: 'medium' as const, priority_score: calculatePriority(b, 'medium') }))
      .sort((a, b) => (b.priority_score || 0) - (a.priority_score || 0))
    
    candidates.push(...selectDiverse(mediumCandidates, config.mediumSlots, config.mixStrands, selectedCategories))
  }

  // 3. Get LONG-TERM candidates (20-40 days ago)
  if (config.longtermSlots > 0) {
    const longterm = await getBanksByInterval(supabase, profileId, 20, 40)
    const longtermCandidates = longterm
      .map(b => ({ ...b, reason: 'longterm' as const, priority_score: calculatePriority(b, 'longterm') }))
      .sort((a, b) => (b.priority_score || 0) - (a.priority_score || 0))
    
    candidates.push(...selectDiverse(longtermCandidates, config.longtermSlots, config.mixStrands, selectedCategories))
  }

  // 4. Get WEAK candidates (low performance)
  if (config.weakSlots > 0) {
    const weak = await getWeakBanks(supabase, profileId, config.weakThreshold)
    // Filter out already selected banks
    const selectedBankIds = new Set(candidates.map(c => c.bank_id))
    const weakCandidates = weak
      .filter(b => !selectedBankIds.has(b.bank_id))
      .map(b => ({ ...b, reason: 'weak' as const, priority_score: calculatePriority(b, 'weak') }))
      .sort((a, b) => (b.priority_score || 0) - (a.priority_score || 0))
    
    candidates.push(...selectDiverse(weakCandidates, config.weakSlots, config.mixStrands, selectedCategories))
  }

  // 5. Get NEW candidates (never used)
  if (config.newSlots > 0) {
    const newBanks = await getNeverUsedBanks(supabase, profileId)
    const selectedBankIds = new Set(candidates.map(c => c.bank_id))
    const newCandidates = newBanks
      .filter(b => !selectedBankIds.has(b.bank_id))
      .map(b => ({ ...b, reason: 'new' as const, priority_score: 50 }))
    
    candidates.push(...selectDiverse(newCandidates, config.newSlots, config.mixStrands, selectedCategories))
  }

  return candidates
}

/**
 * Calculate priority score for a bank candidate
 * Higher score = higher priority
 */
function calculatePriority(bank: Partial<BankCandidate>, reason: string): number {
  let score = 0

  // Base score by reason
  const baseScores = {
    recent: 70,
    medium: 80,
    longterm: 90,
    weak: 85,
    new: 50
  }
  score += baseScores[reason as keyof typeof baseScores] || 50

  // Adjust for performance (lower performance = higher priority)
  if (bank.last_performance !== undefined && bank.last_performance !== null) {
    score += (100 - bank.last_performance) * 0.3
  }

  // Adjust for time since last use (older = higher priority for retrieval)
  if (bank.days_ago !== undefined && bank.days_ago !== null) {
    if (reason === 'recent') {
      score += bank.days_ago * 5 // Slight boost for 2-3 days vs 1 day
    } else if (reason === 'medium') {
      score += bank.days_ago * 2
    } else if (reason === 'longterm') {
      score += bank.days_ago * 1
    }
  }

  return score
}

/**
 * Select diverse candidates ensuring category variety
 */
function selectDiverse(
  candidates: BankCandidate[],
  count: number,
  mixStrands: boolean,
  alreadySelectedCategories: Set<string>
): BankCandidate[] {
  if (!mixStrands) {
    return candidates.slice(0, count)
  }

  const selected: BankCandidate[] = []
  const usedCategories = new Set(alreadySelectedCategories)

  // First pass: prefer new categories
  for (const candidate of candidates) {
    if (selected.length >= count) break
    if (!usedCategories.has(candidate.category)) {
      selected.push(candidate)
      usedCategories.add(candidate.category)
      alreadySelectedCategories.add(candidate.category)
    }
  }

  // Second pass: fill remaining slots
  for (const candidate of candidates) {
    if (selected.length >= count) break
    if (!selected.includes(candidate)) {
      selected.push(candidate)
    }
  }

  return selected
}

/**
 * Get banks used within a specific time interval
 */
async function getBanksByInterval(
  supabase: SupabaseClient,
  profileId: string,
  minDays: number,
  maxDays: number
): Promise<BankCandidate[]> {
  const { data, error } = await supabase
    .rpc('get_banks_by_retrieval_interval', {
      p_profile_id: profileId,
      p_min_days: minDays,
      p_max_days: maxDays
    })

  if (error) {
    console.error('Error fetching banks by interval:', error)
    return []
  }

  return data || []
}

/**
 * Get banks with low performance (weak areas)
 */
async function getWeakBanks(
  supabase: SupabaseClient,
  profileId: string,
  threshold: number = 60
): Promise<BankCandidate[]> {
  const { data, error } = await supabase
    .rpc('get_weak_topic_banks', {
      p_profile_id: profileId,
      p_threshold: threshold,
      p_limit: 10
    })

  if (error) {
    console.error('Error fetching weak banks:', error)
    return []
  }

  return data || []
}

/**
 * Get banks that have never been used
 */
async function getNeverUsedBanks(
  supabase: SupabaseClient,
  profileId: string
): Promise<BankCandidate[]> {
  const { data, error } = await supabase
    .rpc('get_never_used_banks', {
      p_profile_id: profileId
    })

  if (error) {
    console.error('Error fetching never used banks:', error)
    return []
  }

  return data || []
}

/**
 * Get retrieval statistics for analytics display
 */
export async function getRetrievalStats(
  supabase: SupabaseClient,
  profileId: string
) {
  const [
    recentData,
    weekData,
    monthData,
    weakData
  ] = await Promise.all([
    getBanksByInterval(supabase, profileId, 1, 3),
    getBanksByInterval(supabase, profileId, 5, 10),
    getBanksByInterval(supabase, profileId, 20, 35),
    getWeakBanks(supabase, profileId, 60)
  ])

  return {
    recent: recentData.length,
    week: weekData.length,
    month: monthData.length,
    weak: weakData.length,
    recentBanks: recentData,
    weekBanks: weekData,
    monthBanks: monthData,
    weakBanks: weakData
  }
}
