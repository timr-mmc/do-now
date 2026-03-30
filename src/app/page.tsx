'use client'

import { useState, useEffect, useMemo } from 'react'
import { createClient } from '@/utils/supabase/client'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
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

const CATEGORY_STYLES: Record<string, { bg: string; border: string; text: string; hover: string }> = {
  'Number': { bg: 'bg-blue-100', border: 'border-blue-400', text: 'text-blue-700', hover: 'hover:bg-blue-200' },
  'Algebra': { bg: 'bg-purple-100', border: 'border-purple-400', text: 'text-purple-700', hover: 'hover:bg-purple-200' },
  'Measurement': { bg: 'bg-green-100', border: 'border-green-400', text: 'text-green-700', hover: 'hover:bg-green-200' },
  'Geometry': { bg: 'bg-orange-100', border: 'border-orange-400', text: 'text-orange-700', hover: 'hover:bg-orange-200' },
  'Statistics': { bg: 'bg-pink-100', border: 'border-pink-400', text: 'text-pink-700', hover: 'hover:bg-pink-200' },
  'Probability': { bg: 'bg-teal-100', border: 'border-teal-400', text: 'text-teal-700', hover: 'hover:bg-teal-200' },
}

const MATH_STRANDS = ['Number', 'Algebra', 'Measurement', 'Geometry', 'Statistics', 'Probability']

export default function Home() {
  const router = useRouter()
  const supabase = useMemo(() => createClient(), [])
  const [user, setUser] = useState<any>(null)
  const [checkingAuth, setCheckingAuth] = useState(true)
  const [banks, setBanks] = useState<QuestionBank[]>([])
  const [allQuestions, setAllQuestions] = useState<Record<string, Question[]>>({})
  const [slots, setSlots] = useState<QuestionSlot[]>([
    { slotNumber: 1, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 2, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 3, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 4, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 5, category: null, topic: null, subtopic: null, bankId: null, question: null },
    { slotNumber: 6, category: null, topic: null, subtopic: null, bankId: null, question: null },
  ])
  const [loading, setLoading] = useState(true)
  const [loadingBankIds, setLoadingBankIds] = useState<string[]>([])
  const [creating, setCreating] = useState(false)
  const [showAnswers, setShowAnswers] = useState(false)
  const [refreshKey, setRefreshKey] = useState(0) // For forcing re-render of random questions

  useEffect(() => {
    async function checkUser() {
      const { data: { user: currentUser } } = await supabase.auth.getUser()
      setUser(currentUser)
      setCheckingAuth(false)
      
      // If user is logged in, redirect to dashboard
      if (currentUser) {
        router.push('/dashboard')
      }
    }
    
    checkUser()
    loadQuestionBanks()
  }, [])

  async function loadQuestionBanks() {
    const { data: banksData, error: banksError } = await supabase
      .from('question_banks')
      .select('*')
      .order('category', { ascending: true })
      .order('topic', { ascending: true })

    if (banksError) console.error('Error loading banks:', banksError)
    if (banksData) setBanks(banksData)
    setLoading(false)
  }

  async function loadQuestionsForBank(bankId: string) {
    if (allQuestions[bankId] !== undefined) return // Already cached
    setLoadingBankIds(prev => [...prev, bankId])
    const { data, error } = await supabase
      .from('questions')
      .select('id, question_text, answer, bank_id, diagram_data')
      .eq('bank_id', bankId)
    if (error) console.error('Error loading questions for bank:', error)
    setAllQuestions(prev => ({ ...prev, [bankId]: data || [] }))
    setLoadingBankIds(prev => prev.filter(id => id !== bankId))
  }

  function updateSlot(slotNumber: number, updates: Partial<QuestionSlot>) {
    setSlots(slots.map(slot => 
      slot.slotNumber === slotNumber 
        ? { ...slot, ...updates }
        : slot
    ))
  }

  function getCategories(): string[] {
    const allCategories = [...new Set(banks.map(b => b.category))].sort()
    return MATH_STRANDS.filter(strand => allCategories.includes(strand))
  }

  function getTopics(category: string): string[] {
    return [...new Set(banks.filter(b => b.category === category).map(b => b.topic))].sort()
  }

  function getSubtopics(category: string, topic: string): QuestionBank[] {
    return banks.filter(b => b.category === category && b.topic === topic)
  }

  function getQuestionsForBank(bankId: string): Question[] {
    return allQuestions[bankId] || []
  }

  function getRandomQuestions(bankId: string, count: number = 4): Question[] {
    const questions = getQuestionsForBank(bankId)
    if (questions.length <= count) {
      return questions
    }
    const shuffled = [...questions].sort(() => Math.random() - 0.5)
    return shuffled.slice(0, count)
  }

  async function createSession() {
    const selectedSlots = slots.filter(s => s.question)
    
    if (selectedSlots.length < 2) {
      alert('Please select at least 2 questions')
      return
    }

    setCreating(true)

    // Create anonymous session (no profile_id)
    const { data: session, error: sessionError } = await supabase
      .from('do_now_sessions')
      .insert({
        profile_id: null, // Anonymous session
        title: 'Do-Now Session',
      })
      .select()
      .single()

    if (sessionError || !session) {
      console.error('Error creating session:', sessionError)
      alert(`Failed to create session: ${sessionError?.message || 'Unknown error'}`)
      setCreating(false)
      return
    }

    // Add questions to session
    const sessionQuestions = selectedSlots.map((slot) => ({
      session_id: session.id,
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

    router.push(`/display/${session.id}?anonymous=true`)
  }

  if (checkingAuth) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="text-xl">Loading...</div>
      </div>
    )
  }

  const categories = getCategories()

  return (
    <div className="flex min-h-screen bg-gradient-to-br from-gray-50 to-gray-100">
      {/* Left Section - 75% - Do-Now Creator */}
      <div className="w-3/4 overflow-auto p-8">
        <div className="mb-6">
          <h1 className="text-4xl font-bold text-gray-900">Create Your Do-Now</h1>
          <p className="mt-2 text-lg text-gray-600">
            Select 2-6 questions to create an instant Do-Now activity
          </p>
        </div>

        {loading ? (
          <div className="flex items-center justify-center py-20">
            <div className="text-xl text-gray-600">Loading questions...</div>
          </div>
        ) : (
          <>
            <div className="mb-4 flex items-center justify-between">
              <div className="text-sm font-medium text-gray-700">
                <span className="text-indigo-600 text-xl">{slots.filter(s => s.question).length}</span>
                <span className="text-gray-500"> / 6 questions selected</span>
              </div>
              <button
                onClick={() => setShowAnswers(!showAnswers)}
                className={`rounded-lg px-4 py-2 text-sm font-medium transition-colors ${
                  showAnswers
                    ? 'bg-green-100 text-green-700 hover:bg-green-200'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {showAnswers ? '👁️ Answers Shown' : '👁️‍🗨️ Preview Answers'}
              </button>
            </div>

            <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
              {slots.map((slot) => {
                const categoryStyle = slot.category ? CATEGORY_STYLES[slot.category] : null

                return (
                  <div
                    key={slot.slotNumber}
                    className={`flex flex-col overflow-hidden rounded-xl bg-white shadow-md transition-all h-[400px] ${
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
                                onClick={() => {
                                  updateSlot(slot.slotNumber, {
                                    subtopic: bank.subtopic,
                                    bankId: bank.id,
                                    question: null,
                                  })
                                  loadQuestionsForBank(bank.id)
                                }}
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
                          {loadingBankIds.includes(slot.bankId) ? (
                            <div className="flex items-center justify-center py-8">
                              <div className="h-5 w-5 animate-spin rounded-full border-2 border-indigo-300 border-t-indigo-600 mr-2" />
                              <span className="text-sm text-gray-500">Loading questions…</span>
                            </div>
                          ) : (
                            <>
                              <p className="mb-2 text-xs font-medium text-gray-600">Select Question:</p>
                              <div className="space-y-2" key={`questions-${slot.bankId}-${refreshKey}`}>
                                {getQuestionsForBank(slot.bankId).length > 0 ? (
                                  getRandomQuestions(slot.bankId, 4).map((q) => (
                                    <button
                                      key={q.id}
                                      onClick={() => updateSlot(slot.slotNumber, { question: q })}
                                      className="w-full rounded-lg border border-gray-200 bg-white p-2 text-left transition-all hover:border-indigo-400 hover:bg-indigo-50 hover:shadow-md"
                                      aria-label={`Select question: ${q.question_text.substring(0, 100)}`}
                                    >
                                      <MathText text={q.question_text} className="text-xs text-gray-900" />
                                    </button>
                                  ))
                                ) : (
                                  <div className="rounded-lg border-2 border-dashed border-gray-300 bg-gray-50 p-4 text-center">
                                    <p className="mb-2 text-sm font-medium text-gray-700">No questions available yet</p>
                                    <p className="text-xs text-gray-500">
                                      Add questions to this topic in your Supabase database
                                    </p>
                                  </div>
                                )}
                              </div>
                            </>
                          )}
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

            <div className="mt-6 flex justify-center">
              <button
                onClick={createSession}
                disabled={creating || slots.filter(s => s.question).length < 2}
                className="rounded-xl bg-indigo-600 px-8 py-4 text-lg font-bold text-white shadow-lg transition-all hover:bg-indigo-700 disabled:cursor-not-allowed disabled:opacity-50"
              >
                {creating ? 'Creating...' : `Create Do-Now (${slots.filter(s => s.question).length} questions)`}
              </button>
            </div>
          </>
        )}
      </div>

      {/* Right Section - 25% - Login/Signup */}
      <div className="w-1/4 bg-gradient-to-br from-indigo-600 to-purple-700 p-8 text-white">
        <div className="flex h-full flex-col">
          <div className="mb-8">
            <h2 className="text-3xl font-bold">Maths Do Now</h2>
            <p className="mt-2 text-sm text-indigo-100">
              Quick, effective retrieval practice for every maths lesson
            </p>
          </div>

          <div className="mb-8 rounded-xl bg-white/10 p-6 backdrop-blur-sm">
            <h3 className="mb-4 text-xl font-bold">Why Create an Account?</h3>
            <ul className="space-y-3 text-sm text-indigo-100">
              <li className="flex items-start">
                <span className="mr-2">📊</span>
                <span>Track class performance over time</span>
              </li>
              <li className="flex items-start">
                <span className="mr-2">💾</span>
                <span>Save and reuse your favourite Do-Now sets</span>
              </li>
              <li className="flex items-start">
                <span className="mr-2">🎯</span>
                <span>See which topics students struggle with most</span>
              </li>
              <li className="flex items-start">
                <span className="mr-2">📈</span>
                <span>Use spaced repetition to maximise retention</span>
              </li>
              <li className="flex items-start">
                <span className="mr-2">👥</span>
                <span>Manage multiple class profiles</span>
              </li>
            </ul>
          </div>

          <div className="space-y-4">
            <Link
              href="/login"
              className="block w-full rounded-lg bg-white px-6 py-3 text-center font-semibold text-indigo-600 transition-all hover:bg-indigo-50"
            >
              Sign In
            </Link>
            <Link
              href="/signup"
              className="block w-full rounded-lg border-2 border-white px-6 py-3 text-center font-semibold text-white transition-all hover:bg-white/10"
            >
              Create Account
            </Link>
          </div>

          <div className="mt-auto pt-8 text-center text-xs text-indigo-200">
            <p>Try it free - no credit card required</p>
          </div>
        </div>
      </div>
    </div>
  )
}

