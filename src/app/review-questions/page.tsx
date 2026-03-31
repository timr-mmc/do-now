'use client'

import { useState, useEffect } from 'react'
import dynamic from 'next/dynamic'
import Link from 'next/link'
import MathText from '@/components/MathText'
import { createClient } from '@/utils/supabase/client'

const GeometryDiagram = dynamic(() => import('@/components/GeometryDiagram'), { ssr: false })

type Question = {
  id: string
  question_text: string
  answer: string
  difficulty: number
  hint: string | null
  diagram_data: any | null
  // context shown when viewing topic-level or flagged
  category?: string
  topic?: string
  subtopic?: string
  flag_count?: number
}

type EditDraft = {
  question_text: string
  answer: string
  hint: string
  difficulty: number
}

const CATEGORY_STYLES: Record<string, { bg: string; border: string; text: string; badge: string; hover: string; activeBg: string; activeBorder: string }> = {
  Number:      { bg: 'bg-blue-50',   border: 'border-blue-200',   text: 'text-blue-700',   badge: 'bg-blue-100 text-blue-700',   hover: 'hover:bg-blue-100 hover:border-blue-400',   activeBg: 'bg-blue-100',   activeBorder: 'border-blue-500' },
  Algebra:     { bg: 'bg-purple-50', border: 'border-purple-200', text: 'text-purple-700', badge: 'bg-purple-100 text-purple-700', hover: 'hover:bg-purple-100 hover:border-purple-400', activeBg: 'bg-purple-100', activeBorder: 'border-purple-500' },
  Measurement: { bg: 'bg-green-50',  border: 'border-green-200',  text: 'text-green-700',  badge: 'bg-green-100 text-green-700',  hover: 'hover:bg-green-100 hover:border-green-400',  activeBg: 'bg-green-100',  activeBorder: 'border-green-500' },
  Geometry:    { bg: 'bg-orange-50', border: 'border-orange-200', text: 'text-orange-700', badge: 'bg-orange-100 text-orange-700', hover: 'hover:bg-orange-100 hover:border-orange-400', activeBg: 'bg-orange-100', activeBorder: 'border-orange-500' },
  Statistics:  { bg: 'bg-pink-50',   border: 'border-pink-200',   text: 'text-pink-700',   badge: 'bg-pink-100 text-pink-700',   hover: 'hover:bg-pink-100 hover:border-pink-400',   activeBg: 'bg-pink-100',   activeBorder: 'border-pink-500' },
  Probability: { bg: 'bg-teal-50',   border: 'border-teal-200',   text: 'text-teal-700',   badge: 'bg-teal-100 text-teal-700',   hover: 'hover:bg-teal-100 hover:border-teal-400',   activeBg: 'bg-teal-100',   activeBorder: 'border-teal-500' },
}

const DEFAULT_STYLE = { bg: 'bg-gray-50', border: 'border-gray-200', text: 'text-gray-700', badge: 'bg-gray-100 text-gray-700', hover: 'hover:bg-gray-100 hover:border-gray-400', activeBg: 'bg-gray-100', activeBorder: 'border-gray-500' }

function getCategoryStyle(category: string) {
  return CATEGORY_STYLES[category] ?? DEFAULT_STYLE
}

export default function ReviewQuestionsPage() {
  const supabase = createClient()

  const [viewMode, setViewMode] = useState<'browse' | 'flagged'>('browse')
  const [categories, setCategories] = useState<string[]>([])
  const [topics, setTopics] = useState<string[]>([])
  const [subtopics, setSubtopics] = useState<string[]>([])
  const [selectedCategory, setSelectedCategory] = useState('')
  const [selectedTopic, setSelectedTopic] = useState('')
  const [selectedSubtopic, setSelectedSubtopic] = useState('')
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(false)
  const [loadingFilters, setLoadingFilters] = useState(true)

  // Edit state
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editDraft, setEditDraft] = useState<EditDraft | null>(null)
  const [saving, setSaving] = useState(false)
  const [saveError, setSaveError] = useState<string | null>(null)
  const [saveSuccessId, setSaveSuccessId] = useState<string | null>(null)

  // Fetch categories on mount
  useEffect(() => {
    async function fetchCategories() {
      setLoadingFilters(true)
      const { data } = await supabase
        .from('question_banks')
        .select('category')
        .order('category')
      if (data) {
        setCategories(Array.from(new Set(data.map((r: any) => r.category))))
      }
      setLoadingFilters(false)
    }
    fetchCategories()
  }, [supabase])

  // Fetch topics when category changes
  useEffect(() => {
    setTopics([])
    setSelectedTopic('')
    setSubtopics([])
    setSelectedSubtopic('')
    setQuestions([])
    if (!selectedCategory) return
    async function fetchTopics() {
      const { data } = await supabase
        .from('question_banks')
        .select('topic')
        .eq('category', selectedCategory)
        .order('topic')
      if (data) {
        setTopics(Array.from(new Set(data.map((r: any) => r.topic))))
      }
    }
    fetchTopics()
  }, [selectedCategory, supabase])

  // Fetch subtopics when topic changes
  useEffect(() => {
    setSubtopics([])
    setSelectedSubtopic('')
    setQuestions([])
    if (!selectedCategory || !selectedTopic) return
    async function fetchSubtopics() {
      const { data } = await supabase
        .from('question_banks')
        .select('subtopic')
        .eq('category', selectedCategory)
        .eq('topic', selectedTopic)
        .order('subtopic')
      if (data) {
        setSubtopics(Array.from(new Set(data.map((r: any) => r.subtopic))))
      }
    }
    fetchSubtopics()
  }, [selectedCategory, selectedTopic, supabase])

  // Fetch questions when topic or subtopic changes
  useEffect(() => {
    setQuestions([])
    if (!selectedCategory || !selectedTopic) return
    async function fetchQuestions() {
      setLoading(true)
      if (selectedSubtopic) {
        // Specific subtopic — fetch one bank
        const { data: bankData } = await supabase
          .from('question_banks')
          .select('id')
          .eq('category', selectedCategory)
          .eq('topic', selectedTopic)
          .eq('subtopic', selectedSubtopic)
          .single()
        if (bankData?.id) {
          const { data } = await supabase
            .from('questions')
            .select('id, question_text, answer, difficulty, hint, diagram_data')
            .eq('bank_id', bankData.id)
            .order('difficulty')
          setQuestions(data ?? [])
        }
      } else {
        // All subtopics in this topic
        const { data: banks } = await supabase
          .from('question_banks')
          .select('id, subtopic')
          .eq('category', selectedCategory)
          .eq('topic', selectedTopic)
        if (banks && banks.length > 0) {
          const bankIds = banks.map((b: any) => b.id)
          const subtopicMap: Record<string, string> = Object.fromEntries(banks.map((b: any) => [b.id, b.subtopic]))
          const { data } = await supabase
            .from('questions')
            .select('id, question_text, answer, difficulty, hint, diagram_data, bank_id')
            .in('bank_id', bankIds)
            .order('difficulty')
          setQuestions((data ?? []).map((q: any) => ({ ...q, subtopic: subtopicMap[q.bank_id] })))
        }
      }
      setLoading(false)
    }
    fetchQuestions()
  }, [selectedCategory, selectedTopic, selectedSubtopic, supabase])

  // Fetch flagged questions
  useEffect(() => {
    if (viewMode !== 'flagged') return
    async function fetchFlagged() {
      setLoading(true)
      setQuestions([])
      // Get flagged question IDs with counts
      const { data: flagData } = await supabase
        .from('flagged_questions')
        .select('question_id')
      if (!flagData || flagData.length === 0) {
        setLoading(false)
        return
      }
      // Count flags per question
      const flagCounts: Record<string, number> = {}
      for (const f of flagData) {
        flagCounts[f.question_id] = (flagCounts[f.question_id] ?? 0) + 1
      }
      const flaggedIds = Object.keys(flagCounts)
      // Fetch questions with bank context
      const { data: qData } = await supabase
        .from('questions')
        .select('id, question_text, answer, difficulty, hint, diagram_data, bank_id')
        .in('id', flaggedIds)
        .order('difficulty')
      if (qData && qData.length > 0) {
        const bankIds = [...new Set(qData.map((q: any) => q.bank_id))]
        const { data: bankData } = await supabase
          .from('question_banks')
          .select('id, category, topic, subtopic')
          .in('id', bankIds)
        const bankMap: Record<string, any> = Object.fromEntries((bankData ?? []).map((b: any) => [b.id, b]))
        setQuestions(qData.map((q: any) => ({
          ...q,
          category: bankMap[q.bank_id]?.category,
          topic: bankMap[q.bank_id]?.topic,
          subtopic: bankMap[q.bank_id]?.subtopic,
          flag_count: flagCounts[q.id] ?? 1,
        })))
      }
      setLoading(false)
    }
    fetchFlagged()
  }, [viewMode, supabase])

  function startEdit(q: Question) {
    setEditingId(q.id)
    setEditDraft({ question_text: q.question_text, answer: q.answer, hint: q.hint ?? '', difficulty: q.difficulty })
    setSaveError(null)
    setSaveSuccessId(null)
  }

  function cancelEdit() {
    setEditingId(null)
    setEditDraft(null)
    setSaveError(null)
  }

  async function handleSave(id: string) {
    if (!editDraft) return
    setSaving(true)
    setSaveError(null)
    const { data, error } = await supabase
      .from('questions')
      .update({
        question_text: editDraft.question_text.trim(),
        answer: editDraft.answer.trim(),
        hint: editDraft.hint.trim() || null,
        difficulty: editDraft.difficulty,
      })
      .eq('id', id)
      .select()
    setSaving(false)
    if (error) {
      setSaveError(error.message)
    } else if (!data || data.length === 0) {
      setSaveError('Save was blocked — make sure you are signed in. Check the Supabase RLS policy (run add-questions-update-policy.sql).')
    } else {
      setQuestions(prev =>
        prev.map(q =>
          q.id === id
            ? { ...q, question_text: editDraft.question_text.trim(), answer: editDraft.answer.trim(), hint: editDraft.hint.trim() || null, difficulty: editDraft.difficulty }
            : q
        )
      )
      setEditingId(null)
      setEditDraft(null)
      setSaveSuccessId(id)
      setTimeout(() => setSaveSuccessId(null), 3000)
    }
  }

  const style = getCategoryStyle(selectedCategory)

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Nav */}
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
          </div>
        </div>
      </nav>

      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold tracking-tight text-gray-900">Review Questions</h1>
          <p className="mt-2 text-sm text-gray-600">Browse questions by category, topic and subtopic</p>
        </div>

        {/* Mode switcher */}
        <div className="flex gap-3 mb-6">
          <button
            onClick={() => {
              setViewMode('browse')
              setQuestions([])
            }}
            className={`inline-flex items-center gap-2 rounded-lg px-4 py-2 text-sm font-medium transition-colors ${
              viewMode === 'browse'
                ? 'bg-indigo-600 text-white shadow-sm'
                : 'bg-white text-gray-700 ring-1 ring-inset ring-gray-300 hover:bg-gray-50'
            }`}
          >
            <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 10h16M4 14h16M4 18h16" />
            </svg>
            Browse
          </button>
          <button
            onClick={() => {
              setViewMode('flagged')
              setSelectedCategory('')
              setSelectedTopic('')
              setSelectedSubtopic('')
            }}
            className={`inline-flex items-center gap-2 rounded-lg px-4 py-2 text-sm font-medium transition-colors ${
              viewMode === 'flagged'
                ? 'bg-red-600 text-white shadow-sm'
                : 'bg-white text-gray-700 ring-1 ring-inset ring-gray-300 hover:bg-gray-50'
            }`}
          >
            <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9" />
            </svg>
            Flagged Questions
          </button>
        </div>

        {/* Filters — only shown in browse mode */}
        {viewMode === 'browse' && (
        <div className="bg-white shadow-sm rounded-lg p-6 mb-6">
          <h2 className="text-lg font-medium text-gray-900 mb-4">Select Questions to Review</h2>
          {loadingFilters ? (
            <div className="flex items-center gap-3 py-4">
              <div className="h-5 w-5 animate-spin rounded-full border-2 border-indigo-200 border-t-indigo-600" />
              <span className="text-sm text-gray-500">Loading categories...</span>
            </div>
          ) : (
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
              {/* Category */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">Category</label>
                <select
                  title="Select category"
                  value={selectedCategory}
                  onChange={e => setSelectedCategory(e.target.value)}
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200"
                >
                  <option value="">Select category…</option>
                  {categories.map(cat => (
                    <option key={cat} value={cat}>{cat}</option>
                  ))}
                </select>
              </div>

              {/* Topic */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">Topic</label>
                <select
                  title="Select topic"
                  value={selectedTopic}
                  onChange={e => setSelectedTopic(e.target.value)}
                  disabled={!selectedCategory || topics.length === 0}
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200 disabled:bg-gray-50 disabled:text-gray-400"
                >
                  <option value="">Select topic…</option>
                  {topics.map(t => (
                    <option key={t} value={t}>{t}</option>
                  ))}
                </select>
              </div>

              {/* Subtopic */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">Subtopic</label>
                <select
                  title="Select subtopic"
                  value={selectedSubtopic}
                  onChange={e => setSelectedSubtopic(e.target.value)}
                  disabled={!selectedTopic || subtopics.length === 0}
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200 disabled:bg-gray-50 disabled:text-gray-400"
                >
                  <option value="">{selectedTopic ? 'All subtopics' : 'Select subtopic…'}</option>
                  {subtopics.map(s => (
                    <option key={s} value={s}>{s}</option>
                  ))}
                </select>
              </div>
            </div>
          )}

          {/* Breadcrumb trail */}
          {selectedCategory && (
            <div className="mt-4 flex flex-wrap items-center gap-1.5 text-sm">
              <span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium ${style.badge}`}>
                {selectedCategory}
              </span>
              {selectedTopic && (
                <>
                  <span className="text-gray-400">›</span>
                  <span className="inline-flex items-center rounded-full bg-gray-100 px-2.5 py-0.5 text-xs font-medium text-gray-700">
                    {selectedTopic}
                  </span>
                </>
              )}
              {selectedSubtopic && (
                <>
                  <span className="text-gray-400">›</span>
                  <span className="inline-flex items-center rounded-full bg-gray-100 px-2.5 py-0.5 text-xs font-medium text-gray-700">
                    {selectedSubtopic}
                  </span>
                </>
              )}
            </div>
          )}
        </div>
        )}

        {/* Questions */}
        <div className="bg-white shadow-sm rounded-lg p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-lg font-medium text-gray-900">Questions</h2>
            {questions.length > 0 && (
              <span className="inline-flex items-center rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700">
                {questions.length} question{questions.length !== 1 ? 's' : ''}
              </span>
            )}
          </div>

          {loading ? (
            <div className="flex flex-col items-center justify-center py-16">
              <div className="h-8 w-8 animate-spin rounded-full border-4 border-indigo-200 border-t-indigo-600 mb-3" />
              <p className="text-sm text-gray-500">Loading questions…</p>
            </div>
          ) : viewMode === 'browse' && !selectedTopic ? (
            <div className="flex flex-col items-center justify-center py-16 text-center">
              <svg className="mx-auto h-10 w-10 text-gray-300 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
              </svg>
              <p className="text-sm font-medium text-gray-500">Select a category and topic to view questions</p>
              <p className="text-xs text-gray-400 mt-1">Optionally filter by subtopic</p>
            </div>
          ) : questions.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-16 text-center">
              <svg className="mx-auto h-10 w-10 text-gray-300 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <p className="text-sm font-medium text-gray-500">
                {viewMode === 'flagged' ? 'No flagged questions' : 'No questions found'}
              </p>
            </div>
          ) : (
            <div className="space-y-3">
              {questions.map((q, i) => {
                const isEditing = editingId === q.id
                const justSaved = saveSuccessId === q.id

                return (
                  <div
                    key={q.id}
                    className={`rounded-lg border transition-colors ${
                      isEditing
                        ? 'border-indigo-300 bg-white shadow-md'
                        : justSaved
                        ? 'border-green-300 bg-green-50'
                        : `${style.bg} ${style.border}`
                    }`}
                  >
                    {/* ── VIEW MODE ── */}
                    {!isEditing && (
                      <div className="p-4">
                        <div className="flex items-start justify-between gap-4 mb-3">
                          <div className="flex items-center gap-2">
                            <span className="text-xs font-medium text-gray-400">#{i + 1}</span>
                            <span className={`inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium ${style.badge}`}>
                              Difficulty {q.difficulty}
                            </span>
                            {q.flag_count && q.flag_count > 0 && (
                              <span className="inline-flex items-center gap-1 rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-700">
                                🚩 {q.flag_count}
                              </span>
                            )}
                            {/* Show subtopic context when viewing all in a topic or flagged mode */}
                            {((!selectedSubtopic && selectedTopic) || viewMode === 'flagged') && q.subtopic && (
                              <span className="inline-flex items-center rounded-full bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600">
                                {viewMode === 'flagged' && q.category ? `${q.category} › ` : ''}{q.topic ? `${q.topic} › ` : ''}{q.subtopic}
                              </span>
                            )}
                            {justSaved && (
                              <span className="inline-flex items-center gap-1 rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-700">
                                ✓ Saved
                              </span>
                            )}
                          </div>
                          <button
                            onClick={() => startEdit(q)}
                            className="inline-flex items-center gap-1.5 rounded-md bg-white px-3 py-1.5 text-xs font-medium text-gray-700 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 transition-colors"
                          >
                            <svg className="h-3.5 w-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                            </svg>
                            Edit
                          </button>
                        </div>

                        {/* Question as it appears on display page */}
                        <div className="mb-3">
                          {q.diagram_data && (
                            <div className="mb-3 flex justify-center">
                              <GeometryDiagram data={q.diagram_data} />
                            </div>
                          )}
                          <MathText text={q.question_text} className={`text-base font-medium ${style.text}`} />
                        </div>

                        <div className="pt-3 border-t border-gray-200 space-y-1">
                          <div className="text-sm text-gray-700">
                            <span className="font-medium text-gray-900">Answer: </span>
                            <MathText text={q.answer} className="inline text-gray-700" />
                          </div>
                          {q.hint && (
                            <p className="text-xs text-gray-500">
                              <span className="font-medium text-gray-600">Hint: </span>{q.hint}
                            </p>
                          )}
                        </div>
                      </div>
                    )}

                    {/* ── EDIT MODE ── */}
                    {isEditing && editDraft && (
                      <div className="p-4">
                        <div className="flex items-center justify-between mb-4">
                          <span className="text-sm font-medium text-indigo-700">Editing Question #{i + 1}</span>
                          <button
                            onClick={cancelEdit}
                            className="text-xs text-gray-500 hover:text-gray-700"
                          >
                            ✕ Cancel
                          </button>
                        </div>

                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                          {/* ── Left: Edit form ── */}
                          <div className="space-y-4">
                            {/* Question text */}
                            <div>
                              <label className="block text-xs font-medium text-gray-700 mb-1">
                                Question Text <span className="text-gray-400 font-normal">(use $...$ for inline LaTeX, $$...$$ for block)</span>
                              </label>
                              <textarea
                                title="Question text"
                                placeholder="Enter question text…"
                                value={editDraft.question_text}
                                onChange={e => setEditDraft({ ...editDraft, question_text: e.target.value })}
                                rows={4}
                                className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm font-mono focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200 resize-y"
                              />
                            </div>

                            {/* Answer */}
                            <div>
                              <label className="block text-xs font-medium text-gray-700 mb-1">Answer</label>
                              <textarea
                                title="Answer"
                                placeholder="Enter answer…"
                                value={editDraft.answer}
                                onChange={e => setEditDraft({ ...editDraft, answer: e.target.value })}
                                rows={2}
                                className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm font-mono focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200 resize-y"
                              />
                            </div>

                            {/* Hint */}
                            <div>
                              <label className="block text-xs font-medium text-gray-700 mb-1">Hint <span className="text-gray-400 font-normal">(optional)</span></label>
                              <textarea
                                value={editDraft.hint}
                                onChange={e => setEditDraft({ ...editDraft, hint: e.target.value })}
                                rows={2}
                                placeholder="Leave empty to remove hint"
                                className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200 resize-y"
                              />
                            </div>

                            {/* Difficulty */}
                            <div>
                              <label className="block text-xs font-medium text-gray-700 mb-1">Difficulty</label>
                              <select
                                title="Select difficulty"
                                value={editDraft.difficulty}
                                onChange={e => setEditDraft({ ...editDraft, difficulty: Number(e.target.value) })}
                                className="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-200"
                              >
                                {[1, 2, 3, 4, 5].map(d => (
                                  <option key={d} value={d}>Level {d}</option>
                                ))}
                              </select>
                            </div>

                            {/* Error message */}
                            {saveError && (
                              <div className="rounded-lg bg-red-50 border border-red-200 px-3 py-2">
                                <p className="text-xs text-red-700">{saveError}</p>
                              </div>
                            )}

                            {/* Buttons */}
                            <div className="flex gap-2 pt-1">
                              <button
                                onClick={() => handleSave(q.id)}
                                disabled={saving}
                                className="inline-flex items-center gap-1.5 rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 disabled:opacity-50 transition-colors"
                              >
                                {saving ? (
                                  <>
                                    <div className="h-3.5 w-3.5 animate-spin rounded-full border-2 border-white/30 border-t-white" />
                                    Saving…
                                  </>
                                ) : 'Save changes'}
                              </button>
                              <button
                                onClick={cancelEdit}
                                disabled={saving}
                                className="rounded-md bg-white px-4 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 disabled:opacity-50 transition-colors"
                              >
                                Cancel
                              </button>
                            </div>
                          </div>

                          {/* ── Right: Live preview ── */}
                          <div>
                            <p className="text-xs font-medium text-gray-500 uppercase tracking-wide mb-2">Live Preview</p>
                            <div className={`rounded-lg border-2 p-4 min-h-[140px] ${style.bg} ${style.border}`}>
                              <div className="mb-1 flex items-center gap-2">
                                <span className={`inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium ${style.badge}`}>
                                  Difficulty {editDraft.difficulty}
                                </span>
                              </div>
                              {q.diagram_data && (
                                <div className="mb-3 flex justify-center">
                                  <GeometryDiagram data={q.diagram_data} />
                                </div>
                              )}
                              <MathText
                                text={editDraft.question_text || '…'}
                                className={`text-base font-medium ${style.text} mb-3`}
                              />
                              <div className="pt-2 border-t border-gray-200 space-y-1">
                                <div className="text-sm text-gray-700">
                                  <span className="font-medium text-gray-900">Answer: </span>
                                  <MathText text={editDraft.answer || '…'} className="inline text-gray-700" />
                                </div>
                                {editDraft.hint && (
                                  <p className="text-xs text-gray-500">
                                    <span className="font-medium text-gray-600">Hint: </span>{editDraft.hint}
                                  </p>
                                )}
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    )}
                  </div>
                )
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
