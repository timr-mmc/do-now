'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { createClient } from '@/utils/supabase/client'
import DiagramBuilder from '@/components/DiagramBuilder'
import { validateDiagram } from '@/utils/diagramValidator'
import type { DiagramData } from '@/components/GeometryDiagram'

type QuestionBank = {
  id: string
  category: string
  topic: string
  subtopic: string
}

type SaveStatus = 'idle' | 'saving' | 'saved' | 'error'

export default function QuestionBuilderPage() {
  const supabase = createClient()

  // Question metadata
  const [questionText, setQuestionText] = useState('')
  const [answer, setAnswer] = useState('')
  const [hint, setHint] = useState('')
  const [difficulty, setDifficulty] = useState<'easy' | 'medium' | 'hard'>('medium')
  const [selectedBankId, setSelectedBankId] = useState('')

  // Bank list
  const [banks, setBanks] = useState<QuestionBank[]>([])
  const [banksLoading, setBanksLoading] = useState(true)

  // Diagram
  const [includeDiagram, setIncludeDiagram] = useState(false)
  const [diagramData, setDiagramData] = useState<DiagramData | null>(null)

  // Save
  const [saveStatus, setSaveStatus] = useState<SaveStatus>('idle')
  const [saveError, setSaveError] = useState('')

  useEffect(() => {
    supabase
      .from('question_banks')
      .select('id, category, topic, subtopic')
      .order('category')
      .order('topic')
      .order('subtopic')
      .then(({ data }) => {
        setBanks(data ?? [])
        setBanksLoading(false)
      })
  }, [])

  const diagramValidation = includeDiagram && diagramData ? validateDiagram(diagramData) : null

  const canSave =
    questionText.trim().length > 0 &&
    answer.trim().length > 0 &&
    selectedBankId !== '' &&
    (!includeDiagram || (diagramData !== null && (diagramValidation?.valid ?? false)))

  async function handleSave() {
    if (!canSave) return
    setSaveStatus('saving')
    setSaveError('')

    const payload: Record<string, unknown> = {
      bank_id: selectedBankId,
      question_text: questionText.trim(),
      answer: answer.trim(),
      hint: hint.trim() || null,
      difficulty,
      diagram_data: includeDiagram && diagramData ? diagramData : null,
    }

    const { error } = await supabase.from('questions').insert(payload)
    if (error) {
      setSaveStatus('error')
      setSaveError(error.message)
    } else {
      setSaveStatus('saved')
      // Reset form after short delay
      setTimeout(() => {
        setQuestionText('')
        setAnswer('')
        setHint('')
        setDifficulty('medium')
        setSelectedBankId('')
        setIncludeDiagram(false)
        setDiagramData(null)
        setSaveStatus('idle')
      }, 2000)
    }
  }

  // Group banks for the select
  const banksByCategory = banks.reduce<Record<string, QuestionBank[]>>((acc, b) => {
    const key = `${b.category} — ${b.topic}`
    acc[key] = acc[key] ?? []
    acc[key].push(b)
    return acc
  }, {})

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Navigation */}
      <nav className="bg-white shadow-sm">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-16 items-center justify-between">
            <div className="flex items-center gap-8">
              <Link href="/dashboard" className="text-2xl font-bold text-indigo-600">Do-Now</Link>
              <Link href="/dashboard" className="text-sm font-medium text-gray-700 hover:text-gray-900">
                ← Back to Dashboard
              </Link>
            </div>
          </div>
        </div>
      </nav>

      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold tracking-tight text-gray-900">Question Builder</h1>
          <p className="mt-2 text-sm text-gray-600">
            Create questions with optional diagrams. The live preview shows exactly what students will see.
          </p>
        </div>

        <div className="space-y-6">
          {/* ── Question metadata ── */}
          <div className="rounded-xl bg-white p-6 shadow-sm">
            <h2 className="mb-4 text-lg font-semibold text-gray-900">Question Details</h2>
            <div className="space-y-4">
              {/* Question bank */}
              <div>
                <label className="mb-1 block text-sm font-medium text-gray-700">Question Bank / Topic</label>
                {banksLoading ? (
                  <div className="text-sm text-gray-400">Loading banks…</div>
                ) : (
                  <select
                    value={selectedBankId}
                    onChange={e => setSelectedBankId(e.target.value)}
                    className="w-full max-w-xl rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  >
                    <option value="">— select a question bank —</option>
                    {Object.entries(banksByCategory).map(([group, items]) => (
                      <optgroup key={group} label={group}>
                        {items.map(b => (
                          <option key={b.id} value={b.id}>{b.subtopic}</option>
                        ))}
                      </optgroup>
                    ))}
                  </select>
                )}
              </div>

              {/* Question text */}
              <div>
                <label className="mb-1 block text-sm font-medium text-gray-700">Question Text</label>
                <textarea
                  value={questionText}
                  onChange={e => setQuestionText(e.target.value)}
                  rows={3}
                  placeholder="e.g. Find the area of this rectangle."
                  className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
                <p className="mt-1 text-xs text-gray-400">Use LaTeX math with \( … \) for inline and \[ … \] for display.</p>
              </div>

              {/* Answer */}
              <div>
                <label className="mb-1 block text-sm font-medium text-gray-700">Answer</label>
                <input
                  type="text"
                  value={answer}
                  onChange={e => setAnswer(e.target.value)}
                  placeholder="e.g. 60 cm²"
                  className="w-full max-w-xl rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              {/* Hint */}
              <div>
                <label className="mb-1 block text-sm font-medium text-gray-700">Hint (optional)</label>
                <input
                  type="text"
                  value={hint}
                  onChange={e => setHint(e.target.value)}
                  placeholder="e.g. Area = length × width"
                  className="w-full max-w-xl rounded-lg border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              {/* Difficulty */}
              <div>
                <label className="mb-1 block text-sm font-medium text-gray-700">Difficulty</label>
                <div className="flex gap-2">
                  {(['easy', 'medium', 'hard'] as const).map(d => (
                    <button
                      key={d}
                      onClick={() => setDifficulty(d)}
                      className={`rounded-lg px-4 py-1.5 text-sm font-medium capitalize transition-colors ${
                        difficulty === d
                          ? d === 'easy' ? 'bg-green-600 text-white'
                            : d === 'medium' ? 'bg-amber-500 text-white'
                            : 'bg-red-600 text-white'
                          : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                      }`}
                    >
                      {d}
                    </button>
                  ))}
                </div>
              </div>
            </div>
          </div>

          {/* ── Diagram ── */}
          <div className="rounded-xl bg-white p-6 shadow-sm">
            <div className="mb-4 flex items-center gap-3">
              <h2 className="text-lg font-semibold text-gray-900">Diagram</h2>
              <button
                onClick={() => setIncludeDiagram(v => !v)}
                className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
                  includeDiagram ? 'bg-indigo-600' : 'bg-gray-200'
                }`}
              >
                <span className={`inline-block h-4 w-4 transform rounded-full bg-white shadow transition-transform ${
                  includeDiagram ? 'translate-x-6' : 'translate-x-1'
                }`} />
              </button>
              <span className="text-sm text-gray-500">{includeDiagram ? 'Included' : 'Not included'}</span>
            </div>

            {includeDiagram && (
              <DiagramBuilder onChange={setDiagramData} />
            )}

            {!includeDiagram && (
              <p className="text-sm text-gray-400">Toggle on to add a labelled geometry diagram to this question.</p>
            )}
          </div>

          {/* ── Save ── */}
          <div className="rounded-xl bg-white p-6 shadow-sm">
            {saveStatus === 'error' && (
              <div className="mb-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-700">
                Save failed: {saveError}
              </div>
            )}
            {saveStatus === 'saved' && (
              <div className="mb-4 rounded-lg bg-green-50 px-4 py-3 text-sm font-medium text-green-700">
                ✓ Question saved successfully!
              </div>
            )}

            <div className="flex items-center gap-4">
              <button
                onClick={handleSave}
                disabled={!canSave || saveStatus === 'saving'}
                className="rounded-lg bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white transition-colors hover:bg-indigo-700 disabled:cursor-not-allowed disabled:opacity-50"
              >
                {saveStatus === 'saving' ? 'Saving…' : 'Save Question'}
              </button>

              {!canSave && saveStatus === 'idle' && (
                <p className="text-sm text-gray-400">
                  {!questionText.trim() ? 'Enter question text to continue' :
                   !answer.trim() ? 'Enter an answer to continue' :
                   !selectedBankId ? 'Select a question bank to continue' :
                   includeDiagram && !diagramValidation?.valid ? 'Fix diagram validation errors to continue' :
                   ''}
                </p>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

