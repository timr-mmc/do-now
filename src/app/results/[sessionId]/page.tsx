'use client'

import { useState, useEffect } from 'react'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import Link from 'next/link'

type SessionQuestion = {
  id: string
  question_order: number
  proportion_correct: number | null
  students_correct: number | null
  total_students: number | null
  questions: {
    question_text: string
    answer: string
  }
}

export default function ResultsPage({ params }: { params: Promise<{ sessionId: string }> | { sessionId: string } }) {
  const router = useRouter()
  const supabase = createClient()
  const [questions, setQuestions] = useState<SessionQuestion[]>([])
  const [profileId, setProfileId] = useState<string>('')
  const [sessionId, setSessionId] = useState<string>('')
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    async function init() {
      const resolvedParams = await Promise.resolve(params)
      setSessionId(resolvedParams.sessionId)
      loadSessionData(resolvedParams.sessionId)
    }
    init()
  }, [])

  async function loadSessionData(sid: string) {
    // Load session to get profile_id
    const { data: sessionData } = await supabase
      .from('do_now_sessions')
      .select('profile_id')
      .eq('id', sid)
      .single()

    if (sessionData) {
      setProfileId(sessionData.profile_id)
    }

    // Load questions
    const { data: questionsData } = await supabase
      .from('session_questions')
      .select(`
        id,
        question_order,
        proportion_correct,
        students_correct,
        total_students,
        questions:question_id (
          question_text,
          answer
        )
      `)
      .eq('session_id', sid)
      .order('question_order', { ascending: true })

    if (questionsData) {
      setQuestions(questionsData as any)
    }

    setLoading(false)
  }

  function updateQuestionResult(questionId: string, studentsCorrect: number, totalStudents: number) {
    const proportionCorrect = totalStudents > 0 ? (studentsCorrect / totalStudents) * 100 : 0

    setQuestions(questions.map(q => 
      q.id === questionId 
        ? { 
            ...q, 
            students_correct: studentsCorrect, 
            total_students: totalStudents,
            proportion_correct: proportionCorrect 
          }
        : q
    ))
  }

  async function saveResults() {
    setSaving(true)

    for (const question of questions) {
      if (question.students_correct !== null && question.total_students !== null) {
        await supabase
          .from('session_questions')
          .update({
            students_correct: question.students_correct,
            total_students: question.total_students,
            proportion_correct: question.proportion_correct,
            recorded_at: new Date().toISOString(),
          })
          .eq('id', question.id)
      }
    }

    setSaving(false)
    router.push('/dashboard')
  }

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="text-xl">Loading...</div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white shadow">
        <div className="mx-auto max-w-4xl px-4 py-6 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Record Results</h1>
              <p className="mt-1 text-sm text-gray-600">
                Enter how many students got each question correct
              </p>
            </div>
            <Link
              href={`/display/${sessionId}`}
              className="text-indigo-600 hover:text-indigo-700"
            >
              ← Back to Display
            </Link>
          </div>
        </div>
      </div>

      {/* Results Form */}
      <div className="mx-auto max-w-4xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="space-y-6">
          {questions.map((sq, index) => (
            <div key={sq.id} className="rounded-lg bg-white p-6 shadow">
              <div className="mb-4 flex items-start gap-4">
                <div className="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-lg bg-indigo-600 text-xl font-bold text-white">
                  {sq.question_order}
                </div>
                <div className="flex-1">
                  <p className="text-lg font-medium text-gray-900">
                    {sq.questions.question_text}
                  </p>
                  <p className="mt-1 text-sm text-gray-600">
                    Answer: <span className="font-semibold">{sq.questions.answer}</span>
                  </p>
                </div>
              </div>

              <div className="flex items-center gap-4">
                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700">
                    Students Correct
                  </label>
                  <input
                    type="number"
                    min="0"
                    value={sq.students_correct ?? ''}
                    onChange={(e) => {
                      const correct = parseInt(e.target.value) || 0
                      const total = sq.total_students || 0
                      updateQuestionResult(sq.id, correct, total)
                    }}
                    className="mt-1 block w-full rounded-md border-gray-300 px-4 py-3 text-lg shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                    placeholder="0"
                  />
                </div>

                <div className="pt-6 text-2xl font-bold text-gray-400">/</div>

                <div className="flex-1">
                  <label className="block text-sm font-medium text-gray-700">
                    Total Students
                  </label>
                  <input
                    type="number"
                    min="0"
                    value={sq.total_students ?? ''}
                    onChange={(e) => {
                      const total = parseInt(e.target.value) || 0
                      const correct = sq.students_correct || 0
                      updateQuestionResult(sq.id, correct, total)
                    }}
                    className="mt-1 block w-full rounded-md border-gray-300 px-4 py-3 text-lg shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                    placeholder="0"
                  />
                </div>

                {sq.proportion_correct !== null && sq.total_students && sq.total_students > 0 && (
                  <div className="flex-shrink-0 pt-6">
                    <div className="text-center">
                      <div className="text-3xl font-bold text-indigo-600">
                        {Math.round(sq.proportion_correct)}%
                      </div>
                      <div className="text-xs text-gray-500">correct</div>
                    </div>
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>

        {/* Save Button */}
        <div className="mt-8 flex gap-4">
          <button
            onClick={saveResults}
            disabled={saving}
            className="flex-1 rounded-lg bg-indigo-600 px-6 py-4 text-lg font-semibold text-white hover:bg-indigo-500 disabled:opacity-50"
          >
            {saving ? 'Saving...' : 'Save Results'}
          </button>
          <button
            onClick={() => router.push('/dashboard')}
            className="rounded-lg border border-gray-300 bg-white px-6 py-4 text-lg font-semibold text-gray-700 hover:bg-gray-50"
          >
            Skip for Now
          </button>
        </div>
      </div>
    </div>
  )
}
