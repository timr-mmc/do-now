'use client'

import { useState } from 'react'
import Link from 'next/link'

export default function QuestionBuilderPage() {
  const [userEmail] = useState('')
  
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
            Create custom questions - Starting Fresh
          </p>
        </div>

        <div className="bg-white shadow-sm rounded-lg p-6">
          <h2 className="text-lg font-medium text-gray-900 mb-6">
            Ready to build!
          </h2>
          <p className="text-gray-600">This page is now empty and ready for a fresh start.</p>
        </div>
      </div>
    </div>
  )
}
