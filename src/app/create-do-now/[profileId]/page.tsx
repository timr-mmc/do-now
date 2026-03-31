'use client'

import { useState, useEffect, useRef } from 'react'
import { createClient } from '@/utils/supabase/client'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import MathText from '@/components/MathText'
import GeometryDiagram, { DiagramData } from '@/components/GeometryDiagram'

type QuestionBank = {
  id: string
  category: string
  topic: string
  subtopic: string
  description: string
}

type Question = {
  id: string
  question_text: string
  answer: string
  bank_id: string
  difficulty?: number
  diagram_data?: DiagramData | null
}

type QuestionSlot = {
  slotNumber: number
  category: string | null
  topic: string | null
  subtopic: string | null
  bankId: string | null
  question: Question | null
}

// Colour themes for each maths strand
const CATEGORY_STYLES: Record<string, { bg: string; border: string; text: string; hover: string }> = {
  'Number': { bg: 'bg-blue-100', border: 'border-blue-400', text: 'text-blue-700', hover: 'hover:bg-blue-200' },
  'Algebra': { bg: 'bg-purple-100', border: 'border-purple-400', text: 'text-purple-700', hover: 'hover:bg-purple-200' },
  'Measurement': { bg: 'bg-green-100', border: 'border-green-400', text: 'text-green-700', hover: 'hover:bg-green-200' },
  'Geometry': { bg: 'bg-orange-100', border: 'border-orange-400', text: 'text-orange-700', hover: 'hover:bg-orange-200' },
  'Statistics': { bg: 'bg-pink-100', border: 'border-pink-400', text: 'text-pink-700', hover: 'hover:bg-pink-200' },
  'Probability': { bg: 'bg-teal-100', border: 'border-teal-400', text: 'text-teal-700', hover: 'hover:bg-teal-200' },
}

export default function CreateDoNowPage({ params }: { params: Promise<{ profileId: string }> | { profileId: string } }) {
  console.log('🚀 CreateDoNowPage component loaded')
  const router = useRouter()
  const searchParams = useSearchParams()
  const supabase = createClient()
  const [banks, setBanks] = useState<QuestionBank[]>([])
  const [allQuestions, setAllQuestions] = useState<Record<string, Question[]>>({})
  const [loadingBanks, setLoadingBanks] = useState<Set<string>>(new Set()) // Track which banks are currently loading
  const [questionSource, setQuestionSource] = useState<'system' | 'own' | 'community'>('system')
  const [userEmail, setUserEmail] = useState('')
  const [userId, setUserId] = useState<string | null>(null)
  const [slots, setSlots] = useState<QuestionSlot[]>([
    { slotNumber: 1, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 2, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 3, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 4, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 5, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 6, category: null, topic: null, subtopic: null, bankId: null, question: null },
  ])
  const [loading, setLoading] = useState(true)
  const [creating, setCreating] = useState(false)
  const [profileId, setProfileId] = useState<string>('')
  const [editingSessionId, setEditingSessionId] = useState<string | null>(null)
  const [showAnswers, setShowAnswers] = useState(false)
  const [sessionTitle, setSessionTitle] = useState<string>('')
  const [refreshKey, setRefreshKey] = useState(0) // For forcing re-render of random questions
  const [selectedDifficulties, setSelectedDifficulties] = useState<number[]>([1, 2, 3, 4, 5])
  const [difficultyOpen, setDifficultyOpen] = useState(false)
  const difficultyRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    async function init() {
      const resolvedParams = await Promise.resolve(params)
      setProfileId(resolvedParams.profileId)
      
      // Get current user
      const { data: { user } } = await supabase.auth.getUser()
      if (user) {
        setUserEmail(user.email || '')
        setUserId(user.id)
      }
      
      // Check if we're editing an existing session
      const sessionId = searchParams.get('sessionId')
      if (sessionId) {
        setEditingSessionId(sessionId)
      }
      
      await loadQuestionBanks(sessionId)
    }
    init()
  }, [])

  // Close difficulty dropdown on outside click
  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (difficultyRef.current && !difficultyRef.current.contains(e.target as Node)) {
        setDifficultyOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  // localStorage cache utilities
  const CACHE_TTL = 24 * 60 * 60 * 1000 // 24 hours in milliseconds
  const CACHE_KEY_PREFIX = 'questions_cache_'

  function getCachedQuestions(bankId: string): Question[] | null {
    if (typeof window === 'undefined') return null
    
    try {
      const cached = localStorage.getItem(CACHE_KEY_PREFIX + bankId)
      if (!cached) return null
      
      const { data, timestamp } = JSON.parse(cached)
      const age = Date.now() - timestamp
      
      if (age > CACHE_TTL) {
        localStorage.removeItem(CACHE_KEY_PREFIX + bankId) // Expired, remove it
        return null
      }
      
      return data
    } catch (error) {
      console.error('Error reading cache:', error)
      return null
    }
  }

  function setCachedQuestions(bankId: string, questions: Question[]) {
    if (typeof window === 'undefined') return
    
    try {
      const cacheData = {
        data: questions,
        timestamp: Date.now()
      }
      localStorage.setItem(CACHE_KEY_PREFIX + bankId, JSON.stringify(cacheData))
    } catch (error) {
      console.error('Error writing cache:', error)
    }
  }

  // Lazy load questions for a specific bank (with caching and source filtering)
  async function loadQuestionsForBank(bankId: string): Promise<Question[]> {
    // Build cache key that includes source selection to prevent mixing filtered results
    const cacheKey = `${bankId}_${questionSource}`
    
    console.log('🔍 DEBUG - Loading questions for bank', bankId, 'with questionSource:', questionSource, 'cacheKey:', cacheKey)
    
    // 1. Check in-memory cache first
    if (allQuestions[cacheKey]) {
      console.log('✅ Questions for bank', bankId, 'loaded from memory cache (source:', questionSource, ')')
      return allQuestions[cacheKey]
    }

    // 2. Check localStorage cache (with source-specific key)
    const cachedData = getCachedQuestions(cacheKey)
    if (cachedData) {
      console.log('✅ Questions for bank', bankId, 'loaded from localStorage cache (source:', questionSource, ')')
      setAllQuestions(prev => ({ ...prev, [cacheKey]: cachedData }))
      return cachedData
    }

    // 3. Not in cache - fetch from Supabase with source filtering
    setLoadingBanks(prev => new Set(prev).add(bankId))
    
    try {
      // Fetch ALL questions for this bank (we'll filter client-side)
      // Note: Once custom-questions-migration.sql is run, is_custom and created_by columns will exist
      const { data, error } = await supabase
        .from('questions')
        .select('*')
        .eq('bank_id', bankId)

      if (error) {
        console.error('❌ Error loading questions for bank', bankId, ':', error)
        return []
      }
      
      console.log('🔍 DEBUG - Supabase returned', data?.length || 0, 'questions for bank', bankId)

      if (data) {
        // DEBUG: Log first question to see what data we're getting
        if (data.length > 0) {
          console.log('🔍 DEBUG - First question data:', {
            id: data[0].id,
            is_custom: data[0].is_custom,
            is_public: data[0].is_public,
            created_by: data[0].created_by,
            question_preview: data[0].question_text?.substring(0, 30)
          })
          console.log('🔍 DEBUG - Filter settings:', {
            userId: userId,
            questionSource: questionSource
          })
        }
        
        // Client-side filtering based on source selection
        let filteredData = data.filter((q: any) => {
          if (questionSource === 'system') {
            // System questions (is_custom = false or null for backwards compatibility)
            return q.is_custom === false || q.is_custom === null
          } else if (questionSource === 'own') {
            // Own custom questions (created by current user)
            return q.is_custom === true && q.created_by === userId
          } else if (questionSource === 'community') {
            // Public custom questions (not created by user but marked public)
            return q.is_custom === true && q.is_public === true && q.created_by !== userId
          }
          return false
        })
        
        console.log('✅ Loaded', filteredData.length, '/', data.length, 'questions for bank', bankId, '(source:', questionSource, ')')
        
        // Update in-memory cache
        setAllQuestions(prev => ({ ...prev, [cacheKey]: filteredData }))
        
        // Update localStorage cache with source-specific key
        setCachedQuestions(cacheKey, filteredData)
        
        return filteredData
      }

      return []
    } finally {
      setLoadingBanks(prev => {
        const newSet = new Set(prev)
        newSet.delete(bankId)
        return newSet
      })
    }
  }

  async function loadQuestionBanks(sessionId?: string | null) {
    const { data: banksData, error: banksError } = await supabase
      .from('question_banks')
      .select('*')
      .order('category', { ascending: true })
      .order('topic', { ascending: true })

    if (banksError) console.error('Error loading banks:', banksError)

    if (banksData) {
      console.log('✅ Loaded', banksData.length, 'question banks (questions will load on-demand)')
      setBanks(banksData)

      // Load existing session if editing (after banks are available)
      if (sessionId && banksData) {
        await loadExistingSession(sessionId, banksData)
      }
    }
    setLoading(false)
  }

  async function loadExistingSession(sessionId: string, banksData: QuestionBank[]) {
    // Load session title
    const { data: sessionData } = await supabase
      .from('do_now_sessions')
      .select('title')
      .eq('id', sessionId)
      .single()

    if (sessionData && sessionData.title) {
      setSessionTitle(sessionData.title)
    }

    // Load session questions
    const { data: sessionQuestions, error } = await supabase
      .from('session_questions')
      .select(`
        id,
        question_order,
        question_id,
        bank_id,
        questions:question_id (
          id,
          question_text,
          answer,
          bank_id
        )
      `)
      .eq('session_id', sessionId)
      .order('question_order', { ascending: true })

    if (error) {
      console.error('Error loading session:', error)
      return
    }

    if (sessionQuestions) {
      // Preload questions for all banks in this session
      const uniqueBankIds = [...new Set(sessionQuestions.map(sq => sq.bank_id).filter(Boolean))]
      await Promise.all(uniqueBankIds.map(bankId => loadQuestionsForBank(bankId)))

      // Map the loaded questions back to slots
      const loadedSlots: QuestionSlot[] = Array.from({ length: 6 }, (_, i) => ({
        slotNumber: i + 1,
        category: null,
        topic: null,
        subtopic: null,
        bankId: null,
        question: null,
      }))

      for (const sq of sessionQuestions) {
        const question = sq.questions as any
        if (question && sq.question_order >= 1 && sq.question_order <= 6) {
          const slotIndex = sq.question_order - 1
          
          // Get the bank info for this question using the passed banksData
          const bank = banksData.find(b => b.id === sq.bank_id)
          
          loadedSlots[slotIndex] = {
            slotNumber: sq.question_order,
            category: bank?.category || null,
            topic: bank?.topic || null,
            subtopic: bank?.subtopic || null,
            bankId: sq.bank_id,
            question: {
              id: question.id,
              question_text: question.question_text,
              answer: question.answer,
              bank_id: question.bank_id,
            },
          }
        }
      }

      setSlots(loadedSlots)
    }
  }

  async function updateSlot(slotNumber: number, updates: Partial<QuestionSlot>) {
    // If bankId is being set, load questions for that bank
    if (updates.bankId) {
      const cacheKey = `${updates.bankId}_${questionSource}`
      if (!allQuestions[cacheKey]) {
        await loadQuestionsForBank(updates.bankId)
      }
    }
    
    setSlots(slots.map(slot => 
      slot.slotNumber === slotNumber 
        ? { ...slot, ...updates }
        : slot
    ))
  }

  // Ensure the 6 maths strands are used
  const MATH_STRANDS = ['Number', 'Algebra', 'Measurement', 'Geometry', 'Statistics', 'Probability']
  
  function getCategories(): string[] {
    const allCategories = [...new Set(banks.map(b => b.category))].sort()
    // Filter to only show the 6 maths strands that exist in the database
    return MATH_STRANDS.filter(strand => allCategories.includes(strand))
  }

  function getTopics(category: string): string[] {
    return [...new Set(banks.filter(b => b.category === category).map(b => b.topic))].sort()
  }

  function getSubtopics(category: string, topic: string): QuestionBank[] {
    return banks.filter(b => b.category === category && b.topic === topic)
  }

  function getQuestionsForBank(bankId: string): Question[] {
    // Build the same cache key format used by loadQuestionsForBank
    const cacheKey = `${bankId}_${questionSource}`
    return allQuestions[cacheKey] || []
  }

  function getRandomQuestions(bankId: string, count: number = 4): Question[] {
    const questions = getQuestionsForBank(bankId).filter(q =>
      selectedDifficulties.length === 0 || selectedDifficulties.includes(q.difficulty ?? 1)
    )
    if (questions.length <= count) {
      return questions // If 4 or fewer, return all
    }
    
    // Shuffle and take first 'count' questions
    const shuffled = [...questions].sort(() => Math.random() - 0.5)
    return shuffled.slice(0, count)
  }

  function selectRandomQuestion(bankId: string) {
    const questions = getQuestionsForBank(bankId)
    if (questions.length > 0) {
      const randomIndex = Math.floor(Math.random() * questions.length)
      return questions[randomIndex]
    }
    return null
  }

  function refreshAllQuestions() {
    setSlots(prevSlots => prevSlots.map(slot => {
      // Only refresh slots that have a question and bankId
      if (slot.bankId && slot.question) {
        const newQuestion = selectRandomQuestion(slot.bankId)
        return {
          ...slot,
          question: newQuestion,
        }
      }
      return slot
    }))
  }

  async function loadLastSessionWithNewQuestions() {
    setLoading(true)
    
    // Get the most recent session for this profile
    const { data: lastSession, error: sessionError } = await supabase
      .from('do_now_sessions')
      .select('id')
      .eq('profile_id', profileId)
      .order('created_at', { ascending: false })
      .limit(1)
      .single()
    
    if (sessionError || !lastSession) {
      alert('No previous session found')
      setLoading(false)
      return
    }
    
    // Load session questions to get the structure
    const { data: sessionQuestions, error: questionsError } = await supabase
      .from('session_questions')
      .select('bank_id, question_order')
      .eq('session_id', lastSession.id)
      .order('question_order', { ascending: true })
    
    if (questionsError || !sessionQuestions) {
      alert('Failed to load previous session structure')
      setLoading(false)
      return
    }
    
    // Preload questions for all banks in the session
    const uniqueBankIds = [...new Set(sessionQuestions.map(sq => sq.bank_id).filter(Boolean))]
    await Promise.all(uniqueBankIds.map(bankId => loadQuestionsForBank(bankId)))
    
    // Create new slots with the same structure but new random questions
    const newSlots: QuestionSlot[] = Array.from({ length: 6 }, (_, i) => ({
      slotNumber: i + 1,
      category: null,
      topic: null,
      subtopic: null,
      bankId: null,
      question: null,
    }))
    
    for (const sq of sessionQuestions) {
      if (sq.question_order >= 1 && sq.question_order <= 6) {
        const slotIndex = sq.question_order - 1
        const bank = banks.find(b => b.id === sq.bank_id)
        
        if (bank) {
          const randomQuestion = selectRandomQuestion(sq.bank_id)
          
          newSlots[slotIndex] = {
            slotNumber: sq.question_order,
            category: bank.category,
            topic: bank.topic,
            subtopic: bank.subtopic,
            bankId: sq.bank_id,
            question: randomQuestion,
          }
        }
      }
    }
    
    setSlots(newSlots)
    setSessionTitle('') // Clear title for new session
    setEditingSessionId(null) // This is a new session, not editing
    setLoading(false)
  }

  async function createSession() {
    const selectedSlots = slots.filter(s => s.question)
    
    if (selectedSlots.length < 2) {
      alert('Please select at least 2 questions')
      return
    }

    setCreating(true)

    let sessionId: string

    if (editingSessionId) {
      // We're editing an existing session
      sessionId = editingSessionId

      // Update session title
      await supabase
        .from('do_now_sessions')
        .update({ title: sessionTitle || 'Do-Now Session' })
        .eq('id', sessionId)

      // Delete existing session questions
      const { error: deleteError } = await supabase
        .from('session_questions')
        .delete()
        .eq('session_id', sessionId)

      if (deleteError) {
        console.error('Error deleting old questions:', deleteError)
        alert(`Failed to update session: ${deleteError.message || JSON.stringify(deleteError)}`)
        setCreating(false)
        return
      }
    } else {
      // Create new session
      const { data: session, error: sessionError } = await supabase
        .from('do_now_sessions')
        .insert({
          profile_id: profileId,
          title: sessionTitle || 'Do-Now Session',
        })
        .select()
        .single()

      if (sessionError || !session) {
        console.error('Error creating session:', sessionError)
        alert(`Failed to create session: ${sessionError?.message || 'Unknown error'}`)
        setCreating(false)
        return
      }

      sessionId = session.id
    }

    // Add questions to session
    const sessionQuestions = selectedSlots.map((slot) => ({
      session_id: sessionId,
      question_id: slot.question!.id,
      bank_id: slot.bankId!,
      question_order: slot.slotNumber,
    }))

    const { error: questionsError } = await supabase
      .from('session_questions')
      .insert(sessionQuestions)

    if (questionsError) {
      console.error('Error adding questions:', questionsError)
      alert(`Failed to add questions: ${questionsError.message || JSON.stringify(questionsError)}`)
      setCreating(false)
      return
    }

    router.push(`/display/${sessionId}`)
  }

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="text-xl">Loading...</div>
      </div>
    )
  }

  const categories = getCategories()

  return (
    <div className="flex h-screen flex-col bg-gradient-to-br from-gray-50 to-gray-100">
      {/* Header */}
      <div className="flex-shrink-0 bg-white shadow-sm">
        <div className="mx-auto max-w-7xl px-4 py-3 space-y-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4 flex-1">
              <Link href="/dashboard" className="text-sm text-gray-600 hover:text-gray-900">
                ← Back
              </Link>
              <div className="flex-1 max-w-md">
                <input
                  type="text"
                  value={sessionTitle}
                  onChange={(e) => setSessionTitle(e.target.value)}
                  placeholder={editingSessionId ? 'Edit session title...' : 'Name this Do-Now session...'}
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200"
                />
              </div>
            </div>
            <div className="flex items-center gap-4">
              {slots.filter(s => s.question).length > 0 && (
                <button
                  onClick={refreshAllQuestions}
                  className="flex items-center gap-1.5 rounded-lg bg-purple-100 px-3 py-1.5 text-sm font-medium text-purple-700 hover:bg-purple-200 transition-colors"
                  title="Refresh all questions with new random ones from same subtopics"
                >
                  <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                  </svg>
                  Refresh All
                </button>
              )}
              {/* Difficulty Filter */}
              <div className="relative" ref={difficultyRef}>
                <button
                  onClick={() => setDifficultyOpen(prev => !prev)}
                  className="flex items-center gap-1.5 rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
                >
                  <span>Difficulty:</span>
                  <span className="font-semibold text-indigo-600">
                    {selectedDifficulties.length === 5 ? 'All' : selectedDifficulties.length === 0 ? 'None' : selectedDifficulties.map(d => `L${d}`).join(', ')}
                  </span>
                  <svg className={`h-4 w-4 text-gray-500 transition-transform ${difficultyOpen ? 'rotate-180' : ''}`} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                  </svg>
                </button>
                {difficultyOpen && (
                  <div className="absolute right-0 top-full mt-1 z-50 min-w-[180px] rounded-xl border border-gray-200 bg-white shadow-lg p-3">
                    <div className="mb-2 flex items-center justify-between">
                      <span className="text-xs font-semibold uppercase tracking-wide text-gray-500">Difficulty</span>
                      <div className="flex gap-2">
                        <button onClick={() => setSelectedDifficulties([1, 2, 3, 4, 5])} className="text-xs text-indigo-600 hover:underline">All</button>
                        <button onClick={() => setSelectedDifficulties([])} className="text-xs text-gray-400 hover:underline">None</button>
                      </div>
                    </div>
                    {[
                      { level: 1, label: 'Level 1', stars: '★' },
                      { level: 2, label: 'Level 2', stars: '★★' },
                      { level: 3, label: 'Level 3', stars: '★★★' },
                      { level: 4, label: 'Level 4', stars: '★★★★' },
                      { level: 5, label: 'Level 5', stars: '★★★★★' },
                    ].map(({ level, label, stars }) => (
                      <label key={level} className="flex cursor-pointer items-center gap-2 rounded-lg px-2 py-1.5 hover:bg-gray-50">
                        <input
                          type="checkbox"
                          checked={selectedDifficulties.includes(level)}
                          onChange={() => setSelectedDifficulties(prev =>
                            prev.includes(level) ? prev.filter(d => d !== level) : [...prev, level].sort((a, b) => a - b)
                          )}
                          className="h-3.5 w-3.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                        />
                        <span className="text-sm text-gray-700">{label}</span>
                        <span className="ml-auto text-xs text-amber-400">{stars}</span>
                      </label>
                    ))}
                  </div>
                )}
              </div>
              <button
                onClick={() => setShowAnswers(!showAnswers)}
                className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
                  showAnswers
                    ? 'bg-green-100 text-green-700 hover:bg-green-200'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {showAnswers ? '👁️ Answers Shown' : '👁️‍🗨️ Show Answers'}
              </button>
              <div className="text-sm font-medium text-gray-700">
                <span className="text-indigo-600">{slots.filter(s => s.question).length}</span> / 6 selected
              </div>
            </div>
          </div>
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
              <button
                onClick={loadLastSessionWithNewQuestions}
                disabled={loading}
                className="flex items-center gap-1.5 rounded-lg bg-blue-100 px-3 py-1.5 text-sm font-medium text-blue-700 hover:bg-blue-200 transition-colors disabled:opacity-50"
                title="Load your last Do-Now structure with new random questions"
              >
                <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                Load Last Do-Now with New Questions
              </button>
              <span className="text-xs text-gray-500">Quickly create another Do-Now similar to your previous one</span>
            </div>
            {/* Hidden for later deployment
            <div className="ml-auto flex items-center gap-3 rounded-lg bg-white border border-gray-300 px-4 py-2">
              <label htmlFor="questionSource" className="text-xs font-semibold text-gray-700">
                Question Source:
              </label>
              <select
                id="questionSource"
                value={questionSource}
                onChange={(e) => {
                  setQuestionSource(e.target.value as 'system' | 'own' | 'community')
                  // Clear cache when source changes
                  setAllQuestions({})
                }}
                className="rounded-md border border-gray-300 px-3 py-1 text-xs focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
              >
                <option value="system">System Questions</option>
                <option value="own">My Questions</option>
                <option value="community">Community Questions</option>
              </select>
            </div>
            */}
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-7xl px-4 py-4">
          <div className="grid grid-cols-1 gap-4 lg:grid-cols-2 xl:grid-cols-3">
            {slots.map((slot) => {
              const categoryStyle = slot.category ? CATEGORY_STYLES[slot.category] : null
              const slotRandomQuestions = slot.bankId && !slot.question ? getRandomQuestions(slot.bankId, 4) : []

              return (
                <div
                  key={slot.slotNumber}
                  className={`flex flex-col overflow-hidden rounded-xl bg-white shadow-md transition-all h-[400px] lg:h-[calc(50vh-6rem)] xl:h-[350px] ${
                    slot.question ? 'ring-2 ring-green-400' : ''
                  }`}
                >
                  {/* Slot Header */}
                  <div className={`flex-shrink-0 px-4 py-2 ${categoryStyle ? categoryStyle.bg : 'bg-gray-100'}`}>
                  <div className="flex items-center justify-between">
                    <h3 className={`text-sm font-bold ${categoryStyle ? categoryStyle.text : 'text-gray-700'}`}>
                      Question {slot.slotNumber}
                    </h3>
                    {slot.question && (
                      <button
                        onClick={() => updateSlot(slot.slotNumber, {
                          category: null,
                          topic: null,
                          subtopic: null,
                          bankId: null,
                          question: null,
                        })}
                        className="text-xs font-medium text-red-600 hover:text-red-700"
                      >
                        ✕ Clear
                      </button>
                    )}
                  </div>

                  {/* Breadcrumb Trail */}
                  {(slot.category || slot.topic || slot.subtopic) && (
                    <div className="mt-1 flex flex-wrap items-center gap-1 text-xs">
                      {slot.category && (
                        <span className={`font-medium ${categoryStyle!.text}`}>{slot.category}</span>
                      )}
                      {slot.topic && (
                        <>
                          <span className="text-gray-400">→</span>
                          <span className={`${categoryStyle!.text}`}>{slot.topic}</span>
                        </>
                      )}
                      {slot.subtopic && (
                        <>
                          <span className="text-gray-400">→</span>
                          <span className={`${categoryStyle!.text}`}>{slot.subtopic}</span>
                        </>
                      )}
                    </div>
                  )}
                </div>

                <div className="flex-1 overflow-y-auto p-3">
                  {/* Step 1: Category Cards */}
                  {!slot.category && (
                    <div>
                      <p className="mb-2 text-xs font-medium text-gray-600">Select Category:</p>
                      <div className="grid grid-cols-2 gap-2">
                        {categories.map((cat) => {
                          const style = CATEGORY_STYLES[cat]
                          return (
                            <button
                              key={cat}
                              onClick={() => updateSlot(slot.slotNumber, {
                                category: cat,
                                topic: null,
                                subtopic: null,
                                bankId: null,
                                question: null,
                              })}
                              className={`rounded-lg border-2 ${style.border} ${style.bg} ${style.hover} p-2 text-center transition-all`}
                            >
                              <div className={`text-xs font-bold ${style.text}`}>{cat}</div>
                            </button>
                          )
                        })}
                      </div>
                    </div>
                  )}

                  {/* Step 2: Topic Buttons */}
                  {slot.category && !slot.topic && (
                    <div>
                      <button
                        onClick={() => updateSlot(slot.slotNumber, { category: null })}
                        className="mb-2 text-xs text-gray-500 hover:text-gray-700"
                      >
                        ← Back to categories
                      </button>
                      <p className="mb-2 text-xs font-medium text-gray-600">Select Topic:</p>
                      <div className="space-y-1">
                        {getTopics(slot.category).map((topic) => (
                          <button
                            key={topic}
                            onClick={() => updateSlot(slot.slotNumber, {
                              topic,
                              subtopic: null,
                              bankId: null,
                              question: null,
                            })}
                            className={`w-full rounded-lg border ${categoryStyle!.border} ${categoryStyle!.bg} ${categoryStyle!.hover} px-3 py-2 text-left text-xs font-medium ${categoryStyle!.text} transition-all`}
                          >
                            {topic}
                          </button>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Step 3: Subtopic Chips */}
                  {slot.category && slot.topic && !slot.subtopic && (
                    <div>
                      <button
                        onClick={() => updateSlot(slot.slotNumber, { topic: null, subtopic: null, bankId: null, question: null })}
                        className="mb-2 text-xs text-gray-500 hover:text-gray-700"
                      >
                        ← Back to topics
                      </button>
                      <p className="mb-2 text-xs font-medium text-gray-600">Select Subtopic:</p>
                      <div className="flex flex-wrap gap-1">
                        {getSubtopics(slot.category, slot.topic).map((bank) => (
                          <button
                            key={bank.id}
                            onClick={() => updateSlot(slot.slotNumber, {
                              subtopic: bank.subtopic,
                              bankId: bank.id,
                              question: null,
                            })}
                            className={`rounded-full border-2 ${categoryStyle!.border} ${categoryStyle!.bg} ${categoryStyle!.hover} px-2 py-1 text-xs font-medium ${categoryStyle!.text} transition-all`}
                          >
                            {bank.subtopic}
                          </button>
                        ))}
                      </div>
                    </div>
                  )}

                  {/* Step 4: Question Cards */}
                  {slot.bankId && !slot.question && (
                    <div>
                      <div className="mb-2 flex items-center justify-between">
                        <button
                          onClick={() => updateSlot(slot.slotNumber, { subtopic: null, bankId: null, question: null })}
                          className="text-xs text-gray-500 hover:text-gray-700"
                        >
                          ← Back to subtopics
                        </button>
                        {getQuestionsForBank(slot.bankId).length > 4 && (
                          <button
                            onClick={() => setRefreshKey(prev => prev + 1)}
                            className="flex items-center gap-1 rounded-md bg-indigo-100 px-2 py-1 text-xs font-medium text-indigo-700 hover:bg-indigo-200"
                            title="Show different questions"
                          >
                            <svg className="h-3 w-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                            </svg>
                            Shuffle
                          </button>
                        )}
                      </div>
                      <p className="mb-2 text-xs font-medium text-gray-600">Select Question:</p>
                      <div className="space-y-2" key={`questions-${slot.bankId}-${refreshKey}`}>
                        {loadingBanks.has(slot.bankId) ? (
                          <div className="rounded-lg border-2 border-indigo-200 bg-indigo-50 p-6 text-center">
                            <div className="mx-auto mb-2 h-8 w-8 animate-spin rounded-full border-4 border-indigo-200 border-t-indigo-600"></div>
                            <p className="text-sm font-medium text-indigo-700">Loading questions...</p>
                          </div>
                        ) : getQuestionsForBank(slot.bankId).length === 0 ? (
                          <div className="rounded-lg border-2 border-dashed border-gray-300 bg-gray-50 p-4 text-center">
                            <p className="mb-2 text-sm font-medium text-gray-700">No questions available yet</p>
                            <p className="text-xs text-gray-500">
                              Add questions to this topic in your Supabase database
                            </p>
                          </div>
                        ) : slotRandomQuestions.length === 0 ? (
                          <div className="rounded-lg border-2 border-dashed border-amber-200 bg-amber-50 p-4 text-center">
                            <p className="text-sm font-medium text-amber-700">No questions at selected levels</p>
                            <p className="mt-1 text-xs text-amber-600">Try selecting more difficulty levels above</p>
                          </div>
                        ) : (
                          slotRandomQuestions.map((q) => (
                            <button
                              key={q.id}
                              onClick={() => updateSlot(slot.slotNumber, { question: q })}
                              className="w-full rounded-lg border border-gray-200 bg-white p-2 text-left transition-all hover:border-indigo-400 hover:bg-indigo-50 hover:shadow-md"
                              aria-label={`Select question: ${q.question_text.substring(0, 100)}`}
                            >
                              <MathText text={q.question_text} className="text-xs text-gray-900" />
                            </button>
                          ))
                        )}
                      </div>
                    </div>
                  )}

                  {/* Final: Selected Question Display */}
                  {slot.question && (
                    <div>
                      <button
                        onClick={() => updateSlot(slot.slotNumber, { question: null })}
                        className="mb-2 text-xs text-gray-500 hover:text-gray-700"
                      >
                        ← Change question
                      </button>
                      <div className="rounded-lg bg-gradient-to-br from-green-50 to-emerald-50 p-3 shadow-inner">
                        <div className="mb-1 text-xs font-semibold text-green-700">✓ Selected</div>
                        <MathText text={slot.question.question_text} className="text-sm font-medium text-gray-900" />
                        {slot.question.diagram_data && (
                          <div className="mt-2 scale-75 origin-left">
                            <GeometryDiagram data={slot.question.diagram_data} />
                          </div>
                        )}
                        {showAnswers && (
                          <div className="mt-2 rounded bg-white/70 px-2 py-1 text-xs text-gray-700">
                            Answer: <MathText text={slot.question.answer} className="inline font-bold text-green-700" />
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>
              </div>
            )
          })}
        </div>
      </div>
      </div>

      {/* Create Button */}
      {slots.filter(s => s.question).length >= 2 && (
        <div className="flex-shrink-0 border-t bg-white shadow-lg">
          <div className="mx-auto max-w-7xl px-4 py-3">
            <button
              onClick={createSession}
              disabled={creating}
              className="w-full rounded-lg bg-gradient-to-r from-indigo-600 to-indigo-700 px-6 py-3 text-base font-semibold text-white shadow-lg transition-all hover:from-indigo-700 hover:to-indigo-800 disabled:opacity-50"
            >
              {creating 
                ? (editingSessionId ? 'Updating...' : 'Creating...') 
                : (editingSessionId 
                  ? `Update Do-Now with ${slots.filter(s => s.question).length} Questions →` 
                  : `Create Do-Now with ${slots.filter(s => s.question).length} Questions →`
                )
              }
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
