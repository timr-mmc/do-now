/* eslint-disable @next/next/no-css-tags */
'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import MathText from '@/components/MathText'
import GeometryDiagram, { DiagramData } from '@/components/GeometryDiagram'

type SessionQuestion = {
  id: string
  question_order: number
  question_id: string
  bank_id: string
  proportion_correct: number | null
  questions: {
    question_text: string
    answer: string
    diagram_data?: DiagramData | null
  }
}

type Session = {
  id: string
  title: string
  show_answers: boolean
  profile_id: string | null
}

export default function DisplayPage({ params }: { params: Promise<{ sessionId: string }> | { sessionId: string } }) {
  const router = useRouter()
  const supabase = createClient()
  const [session, setSession] = useState<Session | null>(null)
  const [questions, setQuestions] = useState<SessionQuestion[]>([])
  const [showAnswers, setShowAnswers] = useState(false)
  const [loading, setLoading] = useState(true)
  const [sessionId, setSessionId] = useState<string>('')
  const [sidebarOpen, setSidebarOpen] = useState(false)
  const [timerMinutes, setTimerMinutes] = useState(5)
  const [timerSeconds, setTimerSeconds] = useState(0)
  const [timerRunning, setTimerRunning] = useState(false)
  const [focusedQuestionId, setFocusedQuestionId] = useState<string | null>(null)
  const [questionResults, setQuestionResults] = useState<Record<string, number>>({})
  const [savingResults, setSavingResults] = useState(false)
  const [showSummaryModal, setShowSummaryModal] = useState(false)
  const [summaryStats, setSummaryStats] = useState<{ avgAccuracy: number; questionsRecorded: number }>({ avgAccuracy: 0, questionsRecorded: 0 })
  const [flaggedQuestions, setFlaggedQuestions] = useState<Set<string>>(new Set())

  useEffect(() => {
    async function init() {
      const resolvedParams = await Promise.resolve(params)
      setSessionId(resolvedParams.sessionId)
      loadSession(resolvedParams.sessionId)
    }
    init()
  }, [])

  // Play chime sound when timer reaches zero
  const playChime = () => {
    const audioContext = new (window.AudioContext || (window as any).webkitAudioContext)()
    
    // Play the chime 5 times
    for (let i = 0; i < 5; i++) {
      const oscillator = audioContext.createOscillator()
      const gainNode = audioContext.createGain()
      
      oscillator.connect(gainNode)
      gainNode.connect(audioContext.destination)
      
      // Create a pleasant chime sound (two tones)
      const startTime = audioContext.currentTime + (i * 0.7) // 0.7 second delay between chimes
      oscillator.frequency.setValueAtTime(800, startTime)
      oscillator.frequency.setValueAtTime(1000, startTime + 0.1)
      
      gainNode.gain.setValueAtTime(0.3, startTime)
      gainNode.gain.exponentialRampToValueAtTime(0.01, startTime + 0.5)
      
      oscillator.start(startTime)
      oscillator.stop(startTime + 0.5)
    }
  }

  // Timer effect
  useEffect(() => {
    let interval: NodeJS.Timeout
    if (timerRunning) {
      interval = setInterval(() => {
        if (timerSeconds > 0) {
          setTimerSeconds(timerSeconds - 1)
        } else if (timerMinutes > 0) {
          setTimerMinutes(timerMinutes - 1)
          setTimerSeconds(59)
        } else {
          setTimerRunning(false)
          playChime()
          // Timer reached 0
        }
      }, 1000)
    }
    return () => clearInterval(interval)
  }, [timerRunning, timerMinutes, timerSeconds])

  async function loadSession(sid: string) {
    // Load session
    const { data: sessionData } = await supabase
      .from('do_now_sessions')
      .select('*')
      .eq('id', sid)
      .single()

    if (sessionData) {
      setSession(sessionData)
      setShowAnswers(sessionData.show_answers)
    }

    // Load questions
    const { data: questionsData } = await supabase
      .from('session_questions')
      .select(`
        id,
        question_order,
        question_id,
        bank_id,
        proportion_correct,
        questions:question_id (
          question_text,
          answer,
          diagram_data
        )
      `)
      .eq('session_id', sid)
      .order('question_order', { ascending: true })

    if (questionsData) {
      setQuestions(questionsData as any)
      
      // Initialize results from existing data
      const initialResults: Record<string, number> = {}
      questionsData.forEach((q: any) => {
        if (q.proportion_correct !== null) {
          initialResults[q.id] = q.proportion_correct
        }
      })
      setQuestionResults(initialResults)
    }

    setLoading(false)
  }

  function updateQuestionResult(questionId: string, proportion: number) {
    setQuestionResults(prev => ({
      ...prev,
      [questionId]: proportion
    }))
  }

  async function saveResults() {
    setSavingResults(true)
    
    try {
      // Save each question's result
      for (const [questionId, proportion] of Object.entries(questionResults)) {
        await supabase
          .from('session_questions')
          .update({ 
            proportion_correct: proportion,
            recorded_at: new Date().toISOString()
          })
          .eq('id', questionId)
      }
      
      // Calculate summary stats
      const values = Object.values(questionResults)
      const avgAccuracy = values.length > 0 ? values.reduce((a, b) => a + b, 0) / values.length : 0
      
      setSummaryStats({
        avgAccuracy,
        questionsRecorded: values.length
      })
      setShowSummaryModal(true)
    } catch (error) {
      console.error('Error saving results:', error)
      alert('Failed to save results')
    } finally {
      setSavingResults(false)
    }
  }

  async function toggleAnswers() {
    const newShowAnswers = !showAnswers
    setShowAnswers(newShowAnswers)

    // Update in database
    await supabase
      .from('do_now_sessions')
      .update({ show_answers: newShowAnswers })
      .eq('id', sessionId)
  }

  function enterFullscreen() {
    const elem = document.documentElement
    if (elem.requestFullscreen) {
      elem.requestFullscreen()
    }
  }

  function exitFullscreen() {
    if (document.fullscreenElement) {
      document.exitFullscreen()
    }
  }

  async function replaceWithRandomQuestion(sessionQuestionId: string, bankId: string) {
    // Fetch random question from the same bank
    const { data: bankQuestions } = await supabase
      .from('questions')
      .select('*')
      .eq('bank_id', bankId)

    if (bankQuestions && bankQuestions.length > 0) {
      const randomQuestion = bankQuestions[Math.floor(Math.random() * bankQuestions.length)]
      
      // Update the session_question with new question_id
      await supabase
        .from('session_questions')
        .update({ question_id: randomQuestion.id })
        .eq('id', sessionQuestionId)

      // Reload session to show new question
      loadSession(sessionId)
    }
  }

  async function flagQuestion(questionId: string) {
    // Record the flag in the database
    const { error } = await supabase
      .from('flagged_questions')
      .insert({
        question_id: questionId,
        session_id: sessionId,
        notes: 'Flagged during beta testing'
      })

    if (error) {
      console.error('Error flagging question:', error)
      alert('Failed to flag question')
    } else {
      // Add to local state for visual feedback
      setFlaggedQuestions(prev => new Set([...prev, questionId]))
    }
  }

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-gray-900">
        <div className="text-2xl text-white">Loading...</div>
      </div>
    )
  }

  return (
    <div className="flex h-screen flex-col overflow-hidden bg-white">
      {/* Sidebar Toggle Button */}
      <button
        onClick={() => setSidebarOpen(!sidebarOpen)}
        className="fixed left-0 top-1/2 z-40 -translate-y-1/2 rounded-r-lg bg-white/90 px-2 py-6 text-gray-700 shadow-lg backdrop-blur-sm transition-all hover:bg-white hover:px-3"
      >
        {sidebarOpen ? '◀' : '▶'}
      </button>

      {/* Sidebar */}
      <div
        className={`fixed left-0 top-0 z-30 h-full w-80 transform bg-white shadow-2xl transition-transform ${
          sidebarOpen ? 'translate-x-0' : '-translate-x-full'
        }`}
      >
        <div className="flex h-full flex-col p-6">
          <h2 className="mb-2 text-2xl font-bold text-gray-900">Controls</h2>
          {session?.title && (
            <p className="mb-6 text-sm text-gray-600 italic">{session.title}</p>
          )}

          {/* Timer */}
          <div className="mb-8 rounded-lg bg-gray-50 p-4">
            <h3 className="mb-3 text-lg font-semibold text-gray-700">Timer</h3>
            <div className="mb-4 text-center">
              <div className="text-5xl font-bold text-indigo-600">
                {String(timerMinutes).padStart(2, '0')}:{String(timerSeconds).padStart(2, '0')}
              </div>
            </div>
            <div className="mb-3 flex gap-2">
              <button
                onClick={() => setTimerMinutes(Math.max(0, timerMinutes + 1))}
                disabled={timerRunning}
                className="flex-1 rounded-lg bg-indigo-100 py-2 text-sm font-medium text-indigo-700 hover:bg-indigo-200 disabled:opacity-50"
              >
                +1 min
              </button>
              <button
                onClick={() => setTimerMinutes(Math.max(0, timerMinutes + 5))}
                disabled={timerRunning}
                className="flex-1 rounded-lg bg-indigo-100 py-2 text-sm font-medium text-indigo-700 hover:bg-indigo-200 disabled:opacity-50"
              >
                +5 min
              </button>
              <button
                onClick={() => {
                  setTimerMinutes(0)
                  setTimerSeconds(0)
                  setTimerRunning(false)
                }}
                disabled={timerRunning}
                className="flex-1 rounded-lg bg-red-100 py-2 text-sm font-medium text-red-700 hover:bg-red-200 disabled:opacity-50"
              >
                Zero
              </button>
            </div>
            <button
              onClick={() => {
                if (timerRunning) {
                  setTimerRunning(false)
                } else {
                  if (timerMinutes === 0 && timerSeconds === 0) {
                    setTimerMinutes(5)
                  }
                  setTimerRunning(true)
                }
              }}
              className={`w-full rounded-lg py-3 font-semibold text-white ${
                timerRunning
                  ? 'bg-red-600 hover:bg-red-700'
                  : 'bg-green-600 hover:bg-green-700'
              }`}
            >
              {timerRunning ? 'Stop' : 'Start'}
            </button>
            <button
              onClick={() => {
                setTimerMinutes(5)
                setTimerSeconds(0)
                setTimerRunning(false)
              }}
              className="mt-2 w-full rounded-lg bg-gray-200 py-2 text-sm font-medium text-gray-700 hover:bg-gray-300"
            >
              Reset
            </button>
          </div>

          {/* Answer Toggle */}
          <div className="mb-6">
            <button
              onClick={toggleAnswers}
              className={`w-full rounded-lg py-3 font-semibold transition-colors ${
                showAnswers
                  ? 'bg-green-500 text-white hover:bg-green-600'
                  : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
              }`}
            >
              {showAnswers 
                ? (session?.profile_id ? '✓ Showing Answers & Recording' : '✓ Showing Answers')
                : (session?.profile_id ? 'Show Answers & Record Results' : 'Show Answers')
              }
            </button>
          </div>

          {/* Save Results Button - Only for logged-in users */}
          {session?.profile_id && showAnswers && Object.keys(questionResults).length > 0 && (
            <div className="mb-6">
              <button
                onClick={saveResults}
                disabled={savingResults}
                className="w-full rounded-lg bg-indigo-600 py-3 font-semibold text-white transition-colors hover:bg-indigo-700 disabled:opacity-50"
              >
                {savingResults ? 'Saving...' : '💾 Save All Results'}
              </button>
            </div>
          )}

          {/* Anonymous User Message */}
          {!session?.profile_id && showAnswers && (
            <div className="mb-6 rounded-lg bg-amber-50 p-4">
              <div className="mb-2 text-sm font-bold text-amber-800">📊 Want to track results?</div>
              <p className="mb-3 text-xs text-amber-700">
                Create a free account to save student performance data and access analytics.
              </p>
              <button
                onClick={() => router.push('/signup')}
                className="w-full rounded-lg bg-amber-600 py-2 text-sm font-semibold text-white hover:bg-amber-700"
              >
                Create Free Account
              </button>
            </div>
          )}

          {/* Navigation Buttons - Only for logged-in users */}
          {session?.profile_id && (
            <div className="mb-6 space-y-2">
              <button
                onClick={() => router.push(`/create-do-now/${session.profile_id}?sessionId=${sessionId}`)}
                className="w-full rounded-lg bg-blue-600 py-3 font-semibold text-white transition-colors hover:bg-blue-700"
              >
                ✏️ Edit Do-Now
              </button>
              <button
                onClick={() => router.push('/dashboard')}
                className="w-full rounded-lg bg-purple-600 py-3 font-semibold text-white transition-colors hover:bg-purple-700"
              >
                📊 Dashboard
              </button>
            </div>
          )}

          {/* Anonymous User - Back to Home */}
          {!session?.profile_id && (
            <div className="mb-6">
              <button
                onClick={() => router.push('/')}
                className="w-full rounded-lg bg-purple-600 py-3 font-semibold text-white transition-colors hover:bg-purple-700"
              >
                🏠 Create Another Do-Now
              </button>
            </div>
          )}

          {/* Exit Fullscreen */}
          <div className="mb-6">
            <button
              onClick={exitFullscreen}
              className="w-full rounded-lg bg-gray-100 py-2 text-sm font-medium text-gray-600 hover:bg-gray-200"
            >
              Exit Fullscreen
            </button>
          </div>
        </div>
      </div>

      {/* Floating Timer Display - Top Right */}
      {timerRunning && (
        <div className="fixed right-6 top-1 z-50 rounded-2xl bg-indigo-600 px-8 py-4 shadow-2xl">
          <div className="text-center">
            <div className="mb-1 text-xs font-semibold uppercase tracking-wide text-indigo-200">
              Time Remaining
            </div>
            <div className="text-5xl font-bold text-white">
              {String(timerMinutes).padStart(2, '0')}:{String(timerSeconds).padStart(2, '0')}
            </div>
          </div>
        </div>
      )}

      {/* Main Content */}
      <div 
        className={`flex-1 overflow-auto bg-white px-8 py-4 transition-all duration-300 ${
          sidebarOpen ? 'ml-80' : 'ml-0'
        }`}
      >
        <div className="mx-auto w-full px-4">
          {/* Title and Fullscreen Button */}
          <div className="mb-4 flex items-center justify-center gap-4">
            <h1 className="text-7xl font-bold text-gray-900">Do-Now</h1>
            <button
              onClick={enterFullscreen}
              className="rounded-lg bg-gray-100 p-2 text-gray-500 opacity-50 transition-all hover:bg-gray-200 hover:opacity-100"
              title="Enter fullscreen"
            >
              <svg className="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
              </svg>
            </button>
          </div>

          {/* Questions Grid - Dynamic layout based on count */}
          <div className={`grid gap-8 ${
            focusedQuestionId 
              ? 'grid-cols-1' 
              : questions.length === 1
              ? 'grid-cols-1'
              : questions.length === 2
              ? 'grid-cols-2'
              : questions.length === 3
              ? 'grid-cols-3'
              : questions.length === 4
              ? 'grid-cols-2'
              : questions.length >= 5
              ? 'grid-cols-3'
              : 'grid-cols-3'
          }`}>
            {questions
              .filter(sq => !focusedQuestionId || sq.id === focusedQuestionId)
              .map((sq, index) => (
              <div
                key={sq.id}
                className={`group relative flex flex-col rounded-2xl border-4 border-gray-200 bg-gray-50 shadow-xl transition-all ${
                  focusedQuestionId === sq.id ? 'min-h-[600px] ring-4 ring-indigo-500' : 'min-h-[450px]'
                }`}
              >
                {/* Question Number - Top Left - Sequential display */}
                <div className="absolute left-4 top-4 flex h-12 w-12 items-center justify-center rounded-lg bg-indigo-600 text-xl font-bold text-white shadow-lg">
                  {index + 1}
                </div>

                {/* Flagged Indicator Badge */}
                {flaggedQuestions.has(sq.question_id) && (
                  <div className="absolute left-4 top-16 flex items-center gap-1 rounded-full bg-red-500 px-2 py-1 text-xs font-bold text-white shadow-lg">
                    <svg className="h-3 w-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9" />
                    </svg>
                    Flagged
                  </div>
                )}

                {/* Discrete Control Buttons */}
                {!showAnswers && (
                <div className="absolute right-2 top-2 z-10 flex gap-1 opacity-0 transition-opacity group-hover:opacity-100">
                  <button
                    onClick={() => flagQuestion(sq.question_id)}
                    className={`rounded p-1.5 shadow-sm transition-colors ${
                      flaggedQuestions.has(sq.question_id)
                        ? 'bg-red-500 text-white hover:bg-red-600'
                        : 'bg-white/90 text-gray-500 hover:bg-white hover:text-red-600'
                    }`}
                    title={flaggedQuestions.has(sq.question_id) ? "Question flagged" : "Flag question for review"}
                  >
                    <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9" />
                    </svg>
                  </button>
                  <button
                    onClick={() => replaceWithRandomQuestion(sq.id, sq.bank_id)}
                    className="rounded bg-white/90 p-1.5 text-gray-500 shadow-sm transition-colors hover:bg-white hover:text-indigo-600"
                    title="Get new question"
                  >
                    <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                    </svg>
                  </button>
                  <button
                    onClick={() => setFocusedQuestionId(focusedQuestionId === sq.id ? null : sq.id)}
                    className="rounded bg-white/90 p-1.5 text-gray-500 shadow-sm transition-colors hover:bg-white hover:text-indigo-600"
                    title={focusedQuestionId === sq.id ? "Exit focus" : "Focus on this question"}
                  >
                    {focusedQuestionId === sq.id ? (
                      <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    ) : (
                      <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0zM10 7v3m0 0v3m0-3h3m-3 0H7" />
                      </svg>
                    )}
                  </button>
                </div>
                )}

                {/* Question Content - Left aligned, vertically centered */}
                <div className="flex flex-1 items-center p-10 pt-16">
                  <div className="w-full">
                    <MathText text={sq.questions.question_text} className="text-left text-3xl font-semibold leading-tight text-gray-900" />
                    
                    {sq.questions.diagram_data && (
                      <GeometryDiagram data={sq.questions.diagram_data} className="my-6" />
                    )}
                    
                    {/* Answer Section */}
                    {showAnswers && (
                      <div className="mt-8 rounded-xl border-4 border-green-500 bg-green-50 p-6">
                        <div className="text-xl font-bold text-green-700">Answer:</div>
                        <MathText text={sq.questions.answer} className="mt-2 text-3xl font-bold text-green-900" />
                      </div>
                    )}

                    {/* Results Recording Scale - Compact version below answer */}
                    {showAnswers && (
                      <div className="mt-4 rounded-lg border border-gray-200 bg-gray-50 px-4 py-2">
                        <div className="flex items-center gap-2">
                          <span className="text-xs font-medium text-gray-600">Record:</span>
                          {[0, 20, 40, 60, 80, 100].map((value) => (
                            <button
                              key={value}
                              onClick={() => updateQuestionResult(sq.id, value)}
                              className={`flex-1 rounded px-3 py-1 text-xs font-medium transition-all ${
                                questionResults[sq.id] === value
                                  ? 'bg-indigo-600 text-white shadow ring-1 ring-indigo-400'
                                  : 'bg-white text-gray-700 hover:bg-gray-100'
                              }`}
                            >
                              {value}%
                            </button>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Summary Modal */}
      {showSummaryModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm">
          <div className="mx-4 w-full max-w-md rounded-2xl bg-white p-8 shadow-2xl">
            <div className="mb-6 text-center">
              <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-green-100">
                <svg className="h-8 w-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              </div>
              <h3 className="text-2xl font-bold text-gray-900">Results Saved!</h3>
              <p className="mt-2 text-sm text-gray-600">{session?.title || 'Do-Now Session'}</p>
            </div>

            <div className="mb-6 space-y-4">
              <div className="rounded-lg bg-gradient-to-r from-indigo-50 to-indigo-100 p-4">
                <p className="text-sm font-medium text-indigo-600">Average Accuracy</p>
                <p className="text-4xl font-bold text-indigo-900">{summaryStats.avgAccuracy.toFixed(1)}%</p>
              </div>
              <div className="rounded-lg bg-gray-50 p-4">
                <p className="text-sm font-medium text-gray-600">Questions Recorded</p>
                <p className="text-2xl font-bold text-gray-900">{summaryStats.questionsRecorded} / {questions.length}</p>
              </div>
            </div>

            <div className="space-y-2">
              <button
                onClick={() => {
                  setShowSummaryModal(false)
                  router.push(`/analytics/${session?.profile_id}`)
                }}
                className="w-full rounded-lg bg-indigo-600 py-3 font-semibold text-white transition-colors hover:bg-indigo-700"
              >
                📊 View Full Analytics
              </button>
              <button
                onClick={() => {
                  setShowSummaryModal(false)
                  router.push('/dashboard')
                }}
                className="w-full rounded-lg bg-gray-200 py-3 font-semibold text-gray-700 transition-colors hover:bg-gray-300"
              >
                🏠 Back to Dashboard
              </button>
              <button
                onClick={() => setShowSummaryModal(false)}
                className="w-full rounded-lg border-2 border-gray-300 py-3 font-semibold text-gray-700 transition-colors hover:bg-gray-50"
              >
                Continue Here
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
