'use client'

import { useState, useEffect, useMemo } from 'react'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import Link from 'next/link'

interface Profile {
  id: string
  user_id: string
  class_name: string
  year_group: string | null
  subject: string
  created_at: string
  updated_at: string
  archived_at: string | null
}

export default function DashboardPage() {
  const [profiles, setProfiles] = useState<Profile[]>([])
  const [loading, setLoading] = useState(true)
  const [userEmail, setUserEmail] = useState<string>('')
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

      // Fetch active profiles only (not archived)
      const { data, error } = await supabase
        .from('profiles')
        .select('*')
        .eq('user_id', user.id)
        .is('archived_at', null)
        .order('created_at', { ascending: false })

      if (error) {
        console.error('Error fetching profiles:', error)
      } else {
        setProfiles(data || [])
      }

      setLoading(false)
    }

    loadData()
  }, [router, supabase])

  async function handleLogout() {
    await supabase.auth.signOut()
    router.push('/login')
  }

  async function handleArchiveProfile(profileId: string, event: React.MouseEvent) {
    event.preventDefault()
    event.stopPropagation()

    if (!confirm('Are you sure you want to archive this class? You can restore it later from Account Settings.')) {
      return
    }

    const { error } = await supabase
      .from('profiles')
      .update({ archived_at: new Date().toISOString() })
      .eq('id', profileId)

    if (error) {
      console.error('Error archiving profile:', error)
      alert('Failed to archive class. Please try again.')
    } else {
      // Remove from local state
      setProfiles(profiles.filter(p => p.id !== profileId))
    }
  }

  async function handleDeleteProfile(profileId: string, event: React.MouseEvent) {
    event.preventDefault()
    event.stopPropagation()

    if (!confirm('Are you sure you want to permanently DELETE this class? This will remove all sessions and data. This action cannot be undone.')) {
      return
    }

    const { error } = await supabase
      .from('profiles')
      .delete()
      .eq('id', profileId)

    if (error) {
      console.error('Error deleting profile:', error)
      alert('Failed to delete class. Please try again.')
    } else {
      // Remove from local state
      setProfiles(profiles.filter(p => p.id !== profileId))
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Navigation */}
      <nav className="bg-white shadow-sm">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="flex h-16 justify-between">
            <div className="flex">
              <div className="flex flex-shrink-0 items-center">
                <h1 className="text-2xl font-bold text-indigo-600">Do-Now</h1>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <span className="text-sm text-gray-700">{userEmail}</span>
              {/* Hidden for later deployment
              <Link
                href="/question-builder"
                className="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500"
              >
                ✏️ Build Questions
              </Link>
              */}
              <Link
                href="/review-questions"
                className="rounded-md bg-purple-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-purple-500"
              >
                🔍 Review Questions
              </Link>
              <Link
                href="/settings"
                className="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
              >
                Settings
              </Link>
              <button
                onClick={handleLogout}
                className="rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
              >
                Sign out
              </button>
            </div>
          </div>
        </div>
      </nav>

      {/* Main Content */}
      <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8 flex items-center justify-between">
          <div>
            <h2 className="text-3xl font-bold tracking-tight text-gray-900">
              My Classes
            </h2>
            <p className="mt-2 text-sm text-gray-700">
              Manage your classes and create Do-Now sessions
            </p>
          </div>
          <Link
            href="/profiles/new"
            className="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            + Add Class
          </Link>
        </div>

        {/* Profiles Grid */}
        {!profiles || profiles.length === 0 ? (
          <div className="text-center">
            <svg
              className="mx-auto h-12 w-12 text-gray-400"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              aria-hidden="true"
            >
              <path
                vectorEffect="non-scaling-stroke"
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M9 13h6m-3-3v6m-9 1V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2z"
              />
            </svg>
            <h3 className="mt-2 text-sm font-semibold text-gray-900">No classes</h3>
            <p className="mt-1 text-sm text-gray-500">
              Get started by creating your first class.
            </p>
            <div className="mt-6">
              <Link
                href="/profiles/new"
                className="inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                + Add Class
              </Link>
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {profiles.map((profile) => (
              <div
                key={profile.id}
                className="col-span-1 divide-y divide-gray-200 rounded-lg bg-white shadow"
              >
                <div className="flex w-full items-center justify-between space-x-6 p-6">
                  <div className="flex-1 truncate">
                    <div className="flex items-center space-x-3">
                      <h3 className="truncate text-lg font-medium text-gray-900">
                        {profile.class_name}
                      </h3>
                    </div>
                    {profile.year_group && (
                      <p className="mt-1 truncate text-sm text-gray-500">
                        {profile.year_group}
                      </p>
                    )}
                    <p className="mt-1 truncate text-sm text-gray-500">
                      {profile.subject}
                    </p>
                  </div>
                </div>
                <div>
                  <div className="-mt-px flex divide-x divide-gray-200">
                    <div className="flex w-0 flex-1">
                      <Link
                        href={`/create-do-now/${profile.id}`}
                        className="relative -mr-px inline-flex w-0 flex-1 items-center justify-center gap-x-3 rounded-bl-lg border border-transparent py-4 text-sm font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        <svg
                          className="h-5 w-5 text-gray-400"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          aria-hidden="true"
                        >
                          <path d="M10.75 4.75a.75.75 0 00-1.5 0v4.5h-4.5a.75.75 0 000 1.5h4.5v4.5a.75.75 0 001.5 0v-4.5h4.5a.75.75 0 000-1.5h-4.5v-4.5z" />
                        </svg>
                        New Do-Now
                      </Link>
                    </div>
                    <div className="-ml-px flex w-0 flex-1">
                      <Link
                        href={`/analytics/${profile.id}`}
                        className="relative inline-flex w-0 flex-1 items-center justify-center gap-x-3 border border-transparent py-4 text-sm font-semibold text-gray-900 hover:bg-gray-50"
                      >
                        <svg
                          className="h-5 w-5 text-gray-400"
                          viewBox="0 0 20 20"
                          fill="currentColor"
                          aria-hidden="true"
                        >
                          <path d="M15.5 2A1.5 1.5 0 0014 3.5v13a1.5 1.5 0 001.5 1.5h1a1.5 1.5 0 001.5-1.5v-13A1.5 1.5 0 0016.5 2h-1zM9.5 6A1.5 1.5 0 008 7.5v9A1.5 1.5 0 009.5 18h1a1.5 1.5 0 001.5-1.5v-9A1.5 1.5 0 0010.5 6h-1zM3.5 10A1.5 1.5 0 002 11.5v5A1.5 1.5 0 003.5 18h1A1.5 1.5 0 006 16.5v-5A1.5 1.5 0 004.5 10h-1z" />
                        </svg>
                        Analytics
                      </Link>
                    </div>
                    <button
                      onClick={(e) => handleArchiveProfile(profile.id, e)}
                      className="relative -ml-px inline-flex items-center justify-center border border-transparent py-4 px-4 text-sm font-semibold text-gray-600 hover:bg-gray-50"
                      title="Archive this class"
                    >
                      <svg className="h-4 w-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4" />
                      </svg>
                    </button>
                    <button
                      onClick={(e) => handleDeleteProfile(profile.id, e)}
                      className="relative -ml-px inline-flex items-center justify-center rounded-br-lg border border-transparent py-4 px-4 text-sm font-semibold text-red-600 hover:bg-red-50"
                      title="Permanently delete this class"
                    >
                      <svg className="h-4 w-4 text-red-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
