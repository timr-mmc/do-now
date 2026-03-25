'use client'

import { useState, useEffect, useMemo, useRef } from 'react'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import MathText from '@/components/MathText'
import MathQuillEditor from '@/components/MathQuillEditor'

// Color themes for each math strand (matching create-do-now page)
const CATEGORY_STYLES: Record<string, { bg: string; border: string; text: string; hover: string }> = {
  'Number': { bg: 'bg-blue-100', border: 'border-blue-400', text: 'text-blue-700', hover: 'hover:bg-blue-200' },
  'Algebra': { bg: 'bg-purple-100', border: 'border-purple-400', text: 'text-purple-700', hover: 'hover:bg-purple-200' },
  'Measurement': { bg: 'bg-green-100', border: 'border-green-400', text: 'text-green-700', hover: 'hover:bg-green-200' },
  'Geometry': { bg: 'bg-orange-100', border: 'border-orange-400', text: 'text-orange-700', hover: 'hover:bg-orange-200' },
  'Statistics': { bg: 'bg-pink-100', border: 'border-pink-400', text: 'text-pink-700', hover: 'hover:bg-pink-200' },
  'Probability': { bg: 'bg-teal-100', border: 'border-teal-400', text: 'text-teal-700', hover: 'hover:bg-teal-200' },
}

type QuestionBank = {
  id: string
  category: string
  topic: string
  subtopic: string
}

type CustomQuestion = {
  id: string
  question_text: string
  answer: string
  bank_id: string
  is_public: boolean
  created_at: string
  question_banks?: {
    category: string
    topic: string
    subtopic: string
  }
}

export default function QuestionBuilderPage() {
  const [banks, setBanks] = useState<QuestionBank[]>([])
  const [myQuestions, setMyQuestions] = useState<CustomQuestion[]>([])
  const [selectedCategory, setSelectedCategory] = useState('')
  const [selectedTopic, setSelectedTopic] = useState('')
  const [selectedBankId, setSelectedBankId] = useState('')
  const [questionText, setQuestionText] = useState('')
  const [answer, setAnswer] = useState('')
  const [isPublic, setIsPublic] = useState(false)
  const [loading, setLoading] = useState(false)
  const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null)
  const [userEmail, setUserEmail] = useState('')
  const [editingQuestionId, setEditingQuestionId] = useState<string | null>(null)
  const [showRawLatex, setShowRawLatex] = useState(false)

  const questionTextRef = useRef<HTMLTextAreaElement>(null)

  const router = useRouter()
  const supabase = useMemo(() => createClient(), [])

  useEffect(() => {
    async function loadData() {
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        router.push('/login')
        return
      }
      setUserEmail(user.email || '')

      const { data: banksData } = await supabase
        .from('question_banks')
        .select('*')
        .order('category')
        .order('topic')
        .order('subtopic')

      if (banksData) {
        setBanks(banksData)
      }

      await loadMyQuestions()
    }
    loadData()
  }, [router, supabase])

  async function loadMyQuestions() {
    const { data, error } = await supabase
      .from('questions')
      .select(`
        id,
        question_text,
        answer,
        bank_id,
        is_public,
        created_at,
        question_banks (
          category,
          topic,
          subtopic
        )
      `)
      .eq('is_custom', true)
      .order('created_at', { ascending: false })

    if (data) {
      setMyQuestions(data as any)
    }
  }

  const MATH_STRANDS = ['Number', 'Algebra', 'Measurement', 'Geometry', 'Statistics', 'Probability']

  const categories = useMemo(() => {
    const allCategories = [...new Set(banks.map(b => b.category))].sort()
    return MATH_STRANDS.filter(strand => allCategories.includes(strand))
  }, [banks])

  const topics = useMemo(() => {
    if (!selectedCategory) return []
    return [...new Set(banks.filter(b => b.category === selectedCategory).map(b => b.topic))].sort()
  }, [banks, selectedCategory])

  const subtopics = useMemo(() => {
    if (!selectedCategory || !selectedTopic) return []
    return banks.filter(b => b.category === selectedCategory && b.topic === selectedTopic)
  }, [banks, selectedCategory, selectedTopic])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setMessage(null)

    if (!selectedBankId || !questionText || !answer) {
      setMessage({ type: 'error', text: 'Please fill in all fields' })
      return
    }

    setLoading(true)

    try {
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        setMessage({ type: 'error', text: 'You must be logged in' })
        setLoading(false)
        return
      }

      if (editingQuestionId) {
        const { error } = await supabase
          .from('questions')
          .update({
            question_text: questionText,
            answer: answer,
            bank_id: selectedBankId,
            is_public: isPublic,
          })
          .eq('id', editingQuestionId)

        if (error) {
          setMessage({ type: 'error', text: error.message })
        } else {
          setMessage({ type: 'success', text: 'Question updated successfully!' })
          resetForm()
          await loadMyQuestions()
        }
      } else {
        const { error } = await supabase
          .from('questions')
          .insert({
            question_text: questionText,
            answer: answer,
            bank_id: selectedBankId,
            created_by: user.id,
            is_custom: true,
            is_public: isPublic,
          })

        if (error) {
          setMessage({ type: 'error', text: error.message })
        } else {
          setMessage({ type: 'success', text: 'Question created successfully!' })
          resetForm()
          await loadMyQuestions()
        }
      }
    } catch (error) {
      setMessage({ type: 'error', text: 'An unexpected error occurred' })
    } finally {
      setLoading(false)
    }
  }

  function resetForm() {
    setQuestionText('')
    setAnswer('')
    setSelectedCategory('')
    setSelectedTopic('')
    setSelectedBankId('')
    setIsPublic(false)
    setEditingQuestionId(null)
  }

  function handleEdit(question: CustomQuestion) {
    setQuestionText(question.question_text)
    setAnswer(question.answer)
    setSelectedBankId(question.bank_id)
    setIsPublic(question.is_public)
    setEditingQuestionId(question.id)

    const bank = banks.find(b => b.id === question.bank_id)
    if (bank) {
      setSelectedCategory(bank.category)
      setSelectedTopic(bank.topic)
    }

    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  async function handleDelete(questionId: string) {
    if (!window.confirm('Are you sure you want to delete this question?')) return

    const { error } = await supabase
      .from('questions')
      .delete()
      .eq('id', questionId)

    if (error) {
      setMessage({ type: 'error', text: error.message })
    } else {
      setMessage({ type: 'success', text: 'Question deleted successfully!' })
      await loadMyQuestions()
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Navigation */}
      <nav className="bg-white shadow-sm">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-16 items-center justify-between">
            <div className="flex items-center gap-8">
              <Link href="/dashboard" className="text-2xl font-bold text-indigo-600">
                Do-Now
              </Link>
              <Link 
                href="/dashboard"
                className="text-sm font-medium text-gray-700 hover:text-gray-900"
              >
                ← Back to Dashboard
              </Link>
            </div>
            <span className="text-sm text-gray-700">{userEmail}</span>
          </div>
        </div>
      </nav>

      {/* Main Content */}
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold tracking-tight text-gray-900">Question Builder</h1>
          <p className="mt-2 text-sm text-gray-600">
            Create custom questions with formatted math notation
          </p>
        </div>

        {/* Message Banner */}
        {message && (
          <div
            className={`mb-6 rounded-lg p-4 ${
              message.type === 'success'
                ? 'bg-green-50 text-green-800 border border-green-200'
                : 'bg-red-50 text-red-800 border border-red-200'
            }`}
          >
            {message.text}
          </div>
        )}

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Question Creation Form */}
          <div className="bg-white shadow-sm rounded-lg p-6">
            <h2 className="text-lg font-medium text-gray-900 mb-6">
              {editingQuestionId ? 'Edit Question' : 'Create New Question'}
            </h2>

            <form onSubmit={handleSubmit} className="space-y-5">
              {/* Category Selection - Card Style */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Category *
                </label>
                <div className="grid grid-cols-2 gap-2">
                  {categories.map((cat) => {
                    const style = CATEGORY_STYLES[cat]
                    const isSelected = selectedCategory === cat
                    return (
                      <button
                        key={cat}
                        type="button"
                        onClick={() => {
                          setSelectedCategory(cat)
                          setSelectedTopic('')
                          setSelectedBankId('')
                        }}
                        className={`rounded-lg border-2 ${style.border} ${style.bg} ${style.hover} p-3 text-center transition-all ${isSelected ? 'ring-2 ring-offset-1 ring-gray-900' : ''}`}
                      >
                        <div className={`text-sm font-bold ${style.text}`}>{cat}</div>
                      </button>
                    )
                  })}
                </div>
              </div>

              {/* Topic Selection - List Style */}
              {selectedCategory && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Topic *
                  </label>
                  <div className="space-y-1.5">
                    {topics.map((topic) => {
                      const style = CATEGORY_STYLES[selectedCategory]
                      const isSelected = selectedTopic === topic
                      return (
                        <button
                          key={topic}
                          type="button"
                          onClick={() => {
                            setSelectedTopic(topic)
                            setSelectedBankId('')
                          }}
                          className={`w-full rounded-lg border-2 ${style.border} ${style.bg} ${style.hover} px-4 py-2.5 text-left text-sm font-medium ${style.text} transition-all ${isSelected ? 'ring-2 ring-offset-1 ring-gray-900' : ''}`}
                        >
                          {topic}
                        </button>
                      )
                    })}
                  </div>
                </div>
              )}

              {/* Subtopic Selection - Chip Style */}
              {selectedTopic && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Subtopic *
                  </label>
                  <div className="flex flex-wrap gap-2">
                    {subtopics.map((bank) => {
                      const style = CATEGORY_STYLES[selectedCategory]
                      const isSelected = selectedBankId === bank.id
                      return (
                        <button
                          key={bank.id}
                          type="button"
                          onClick={() => setSelectedBankId(bank.id)}
                          className={`rounded-full border-2 ${style.border} ${style.bg} ${style.hover} px-4 py-2 text-sm font-medium ${style.text} transition-all ${isSelected ? 'ring-2 ring-offset-1 ring-gray-900' : ''}`}
                        >
                          {bank.subtopic}
                        </button>
                      )
                    })}
                  </div>
                </div>
              )}

              {/* Question Text */}
              <div>
                <div className="flex items-center justify-between mb-2">
                  <label className="block text-sm font-medium text-gray-700">
                    Question Text *
                  </label>
                  <button
                    type="button"
                    onClick={() => setShowRawLatex(!showRawLatex)}
                    className="text-xs px-2 py-1 rounded bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium"
                  >
                    {showRawLatex ? '📐 Visual Editor' : '🔤 LaTeX Code'}
                  </button>
                </div>

                {!showRawLatex ? (
                  <div className="space-y-2">
                    <MathQuillEditor
                      value={questionText}
                      onChange={(latex) => setQuestionText(latex)}
                      placeholder="Type your question... ^ for superscript, _ for subscript, / for fractions"
                      className="w-full"
                    />
                    <div className="rounded-md bg-blue-50 border border-blue-200 px-3 py-2">
                      <p className="text-xs text-blue-800">
                        <span className="font-semibold">Quick keys:</span> <kbd className="px-1 py-0.5 bg-white rounded text-xs border">^</kbd> superscript, <kbd className="px-1 py-0.5 bg-white rounded text-xs border">_</kbd> subscript, <kbd className="px-1 py-0.5 bg-white rounded text-xs border">/</kbd> fraction. Type <code>sqrt</code>, <code>pi</code>, <code>theta</code> for symbols
                      </p>
                    </div>
                  </div>
                ) : (
                  <textarea
                    ref={questionTextRef}
                    value={questionText}
                    onChange={(e) => setQuestionText(e.target.value)}
                    required
                    rows={4}
                    placeholder="e.g. Solve for $x$: $2x + 5 = 13$"
                    className="block w-full rounded-md border border-gray-300 px-3 py-2 font-mono text-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500"
                  />
                )}
              </div>

              {/* Answer */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Answer *
                </label>

                {!showRawLatex ? (
                  <MathQuillEditor
                    value={answer}
                    onChange={(latex) => setAnswer(latex)}
                    placeholder="Type answer..."
                    className="w-full"
                  />
                ) : (
                  <textarea
                    value={answer}
                    onChange={(e) => setAnswer(e.target.value)}
                    required
                    rows={2}
                    placeholder="e.g. $x = 4$"
                    className="block w-full rounded-md border border-gray-300 px-3 py-2 font-mono text-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500"
                  />
                )}
              </div>

              {/* Public/Private Toggle */}
              <div className="flex items-start">
                <div className="flex h-5 items-center">
                  <input
                    id="isPublic"
                    type="checkbox"
                    checked={isPublic}
                    onChange={(e) => setIsPublic(e.target.checked)}
                    className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                  />
                </div>
                <div className="ml-3">
                  <label htmlFor="isPublic" className="text-sm font-medium text-gray-700">
                    Make this question public
                  </label>
                  <p className="text-xs text-gray-500">
                    Public questions can be used by other teachers
                  </p>
                </div>
              </div>

              {/* Submit Buttons */}
              <div className="flex gap-3 pt-4">
                <button
                  type="submit"
                  disabled={loading}
                  className="flex-1 rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? 'Saving...' : editingQuestionId ? 'Update Question' : 'Create Question'}
                </button>
                {editingQuestionId && (
                  <button
                    type="button"
                    onClick={resetForm}
                    className="rounded-md bg-gray-200 px-4 py-2 text-sm font-semibold text-gray-700 hover:bg-gray-300"
                  >
                    Cancel
                  </button>
                )}
              </div>
            </form>
          </div>

          {/* My Questions List */}
          <div className="bg-white shadow-sm rounded-lg p-6">
            <h2 className="text-lg font-medium text-gray-900 mb-4">
              My Questions ({myQuestions.length})
            </h2>
            
            {myQuestions.length === 0 ? (
              <div className="text-center py-12">
                <svg className="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <p className="mt-2 text-sm text-gray-500">No custom questions yet</p>
                <p className="text-xs text-gray-400">Create your first question using the form</p>
              </div>
            ) : (
              <div className="space-y-4 max-h-[600px] overflow-y-auto">
                {myQuestions.map((q) => {
                  const style = q.question_banks?.category ? CATEGORY_STYLES[q.question_banks.category] : null
                  return (
                    <div key={q.id} className={`border-2 ${style ? style.border : 'border-gray-200'} rounded-lg p-4 hover:shadow-md transition-all`}>
                      <div className="flex items-start justify-between mb-2">
                        <div className="flex-1">
                          <div className="flex items-center gap-2 mb-1">
                            <span className={`text-xs font-semibold ${style ? style.text : 'text-gray-600'}`}>
                              {q.question_banks?.category} → {q.question_banks?.topic}
                            </span>
                            {q.is_public && (
                              <span className="inline-flex items-center rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">
                                Public
                              </span>
                            )}
                          </div>
                          <p className="text-xs text-gray-500 mb-2">{q.question_banks?.subtopic}</p>
                          <MathText text={q.question_text} className="text-sm text-gray-900 mb-2" />
                          <div className="flex items-center gap-2">
                            <span className="text-xs text-gray-500">Answer:</span>
                            <MathText text={q.answer} className="text-xs font-semibold text-green-700" />
                          </div>
                        </div>
                      </div>
                      <div className="flex gap-2 mt-3 pt-3 border-t border-gray-100">
                        <button
                          onClick={() => handleEdit(q)}
                          className="text-xs font-medium text-indigo-600 hover:text-indigo-700"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleDelete(q.id)}
                          className="text-xs font-medium text-red-600 hover:text-red-700"
                        >
                          Delete
                        </button>
                      </div>
                    </div>
                  )
                })}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
