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

export default function SettingsPage() {
  const [email, setEmail] = useState('')
  const [currentPassword, setCurrentPassword] = useState('')
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [message, setMessage] = useState<{ type: 'success' | 'error', text: string } | null>(null)
  const [loading, setLoading] = useState(false)
  const [userEmail, setUserEmail] = useState<string>('')
  const [archivedProfiles, setArchivedProfiles] = useState<Profile[]>([])
  const [loadingArchived, setLoadingArchived] = useState(true)
  const [showDeleteConfirm, setShowDeleteConfirm] = useState(false)
  const [deleteConfirmText, setDeleteConfirmText] = useState('')
  const [deleting, setDeleting] = useState(false)
  
  const router = useRouter()
  const supabase = useMemo(() => createClient(), [])

  // Load current user and archived profiles on mount
  useEffect(() => {
    async function loadUser() {
      const { data: { user } } = await supabase.auth.getUser()
      if (user) {
        setUserEmail(user.email || '')
        
        // Fetch archived profiles
        const { data: archived, error } = await supabase
          .from('profiles')
          .select('*')
          .eq('user_id', user.id)
          .not('archived_at', 'is', null)
          .order('archived_at', { ascending: false })

        if (!error && archived) {
          setArchivedProfiles(archived)
        }
        setLoadingArchived(false)
      } else {
        router.push('/login')
      }
    }
    loadUser()
  }, [router, supabase])

  async function handleUpdateEmail(e: React.FormEvent) {
    e.preventDefault()
    setMessage(null)
    setLoading(true)

    try {
      const { error } = await supabase.auth.updateUser({
        email: email
      })

      if (error) {
        setMessage({ type: 'error', text: error.message })
      } else {
        setMessage({ 
          type: 'success', 
          text: 'Confirmation email sent! Please check your inbox to verify your new email address.' 
        })
        setEmail('')
      }
    } catch (error) {
      setMessage({ type: 'error', text: 'An unexpected error occurred' })
    } finally {
      setLoading(false)
    }
  }

  async function handleUpdatePassword(e: React.FormEvent) {
    e.preventDefault()
    setMessage(null)

    // Validation
    if (newPassword !== confirmPassword) {
      setMessage({ type: 'error', text: 'New passwords do not match' })
      return
    }

    if (newPassword.length < 6) {
      setMessage({ type: 'error', text: 'Password must be at least 6 characters long' })
      return
    }

    setLoading(true)

    try {
      const { error } = await supabase.auth.updateUser({
        password: newPassword
      })

      if (error) {
        setMessage({ type: 'error', text: error.message })
      } else {
        setMessage({ type: 'success', text: 'Password updated successfully!' })
        setCurrentPassword('')
        setNewPassword('')
        setConfirmPassword('')
      }
    } catch (error) {
      setMessage({ type: 'error', text: 'An unexpected error occurred' })
    } finally {
      setLoading(false)
    }
  }

  async function handleDeleteAccount() {
    if (deleteConfirmText !== 'DELETE') return
    setDeleting(true)
    try {
      const res = await fetch('/api/delete-account', { method: 'POST' })
      if (!res.ok) {
        const body = await res.json()
        setMessage({ type: 'error', text: body.error || 'Failed to delete account.' })
        setDeleting(false)
        return
      }
      // Sign out locally then redirect to home
      await supabase.auth.signOut()
      router.push('/?deleted=1')
    } catch {
      setMessage({ type: 'error', text: 'An unexpected error occurred.' })
      setDeleting(false)
    }
  }

  async function handleRestoreProfile(profileId: string) {
    setMessage(null)

    const { error } = await supabase
      .from('profiles')
      .update({ archived_at: null })
      .eq('id', profileId)

    if (error) {
      setMessage({ type: 'error', text: 'Failed to restore class. Please try again.' })
    } else {
      setMessage({ type: 'success', text: 'Class restored successfully!' })
      // Remove from archived list
      setArchivedProfiles(archivedProfiles.filter(p => p.id !== profileId))
    }
  }

  async function handlePermanentDelete(profileId: string) {
    if (!confirm('Are you sure you want to PERMANENTLY delete this class? All sessions and data will be removed. This action cannot be undone.')) {
      return
    }

    setMessage(null)

    const { error } = await supabase
      .from('profiles')
      .delete()
      .eq('id', profileId)

    if (error) {
      setMessage({ type: 'error', text: 'Failed to delete class. Please try again.' })
    } else {
      setMessage({ type: 'success', text: 'Class permanently deleted.' })
      // Remove from archived list
      setArchivedProfiles(archivedProfiles.filter(p => p.id !== profileId))
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
      <div className="mx-auto max-w-3xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="mb-8">
          <h1 className="text-3xl font-bold tracking-tight text-gray-900">Account Settings</h1>
          <p className="mt-2 text-sm text-gray-600">
            Manage your email address and password
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
            <div className="flex">
              <div className="flex-shrink-0">
                {message.type === 'success' ? (
                  <svg className="h-5 w-5 text-green-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clipRule="evenodd" />
                  </svg>
                ) : (
                  <svg className="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z" clipRule="evenodd" />
                  </svg>
                )}
              </div>
              <div className="ml-3">
                <p className="text-sm font-medium">{message.text}</p>
              </div>
            </div>
          </div>
        )}

        <div className="space-y-6">
          {/* Update Email Section */}
          <div className="bg-white shadow-sm rounded-lg">
            <div className="px-6 py-5 border-b border-gray-200">
              <h2 className="text-lg font-medium text-gray-900">Update Email Address</h2>
              <p className="mt-1 text-sm text-gray-500">
                Current email: <span className="font-medium text-gray-900">{userEmail}</span>
              </p>
            </div>
            <form onSubmit={handleUpdateEmail} className="px-6 py-5">
              <div>
                <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                  New Email Address
                </label>
                <input
                  type="email"
                  id="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-400 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                  placeholder="new.email@example.com"
                />
                <p className="mt-2 text-xs text-gray-500">
                  You'll receive a confirmation email at both your current and new email addresses.
                </p>
              </div>
              <div className="mt-5">
                <button
                  type="submit"
                  disabled={loading || !email}
                  className="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? 'Updating...' : 'Update Email'}
                </button>
              </div>
            </form>
          </div>

          {/* Update Password Section */}
          <div className="bg-white shadow-sm rounded-lg">
            <div className="px-6 py-5 border-b border-gray-200">
              <h2 className="text-lg font-medium text-gray-900">Update Password</h2>
              <p className="mt-1 text-sm text-gray-500">
                Choose a strong password with at least 6 characters
              </p>
            </div>
            <form onSubmit={handleUpdatePassword} className="px-6 py-5 space-y-4">
              <div>
                <label htmlFor="newPassword" className="block text-sm font-medium text-gray-700">
                  New Password
                </label>
                <input
                  type="password"
                  id="newPassword"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  required
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-400 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                  placeholder="Enter new password"
                />
              </div>
              <div>
                <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700">
                  Confirm New Password
                </label>
                <input
                  type="password"
                  id="confirmPassword"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  required
                  className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-400 focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
                  placeholder="Confirm new password"
                />
              </div>
              <div className="mt-5">
                <button
                  type="submit"
                  disabled={loading || !newPassword || !confirmPassword}
                  className="rounded-md bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? 'Updating...' : 'Update Password'}
                </button>
              </div>
            </form>
          </div>

          {/* Archived Classes Section */}
          <div className="bg-white shadow-sm rounded-lg">
            <div className="px-6 py-5 border-b border-gray-200">
              <h2 className="text-lg font-medium text-gray-900">Archived Classes</h2>
              <p className="mt-1 text-sm text-gray-500">
                View and restore previously archived classes
              </p>
            </div>
            <div className="px-6 py-5">
              {loadingArchived ? (
                <div className="text-center py-8">
                  <div className="w-8 h-8 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto"></div>
                  <p className="text-sm text-gray-500 mt-2">Loading archived classes...</p>
                </div>
              ) : archivedProfiles.length === 0 ? (
                <div className="text-center py-8">
                  <svg className="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4" />
                  </svg>
                  <p className="mt-2 text-sm text-gray-500">No archived classes</p>
                </div>
              ) : (
                <div className="space-y-3">
                  {archivedProfiles.map((profile) => (
                    <div
                      key={profile.id}
                      className="flex items-center justify-between p-4 bg-gray-50 rounded-lg border border-gray-200"
                    >
                      <div className="flex-1">
                        <h3 className="font-semibold text-gray-900">{profile.class_name}</h3>
                        <div className="flex items-center gap-3 mt-1 text-sm text-gray-600">
                          {profile.year_group && <span>{profile.year_group}</span>}
                          <span>{profile.subject}</span>
                          <span className="text-gray-400">•</span>
                          <span className="text-gray-500">
                            Archived {new Date(profile.archived_at!).toLocaleDateString('en-NZ', {
                              year: 'numeric',
                              month: 'short',
                              day: 'numeric'
                            })}
                          </span>
                        </div>
                      </div>
                      <div className="flex items-center gap-2 ml-4">
                        <button
                          onClick={() => handleRestoreProfile(profile.id)}
                          className="inline-flex items-center gap-2 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 transition-colors"
                        >
                          <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                          </svg>
                          Restore
                        </button>
                        <button
                          onClick={() => handlePermanentDelete(profile.id)}
                          className="inline-flex items-center gap-2 rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 transition-colors"
                        >
                          <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
                          Delete
                        </button>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>

          {/* Danger Zone */}
          <div className="bg-white shadow-sm rounded-lg border border-red-200">
            <div className="px-6 py-5 border-b border-red-200">
              <h2 className="text-lg font-medium text-red-700">Danger Zone</h2>
              <p className="mt-1 text-sm text-gray-500">
                Permanently delete your account and all associated data. This cannot be undone.
              </p>
            </div>
            <div className="px-6 py-5">
              {!showDeleteConfirm ? (
                <button
                  onClick={() => setShowDeleteConfirm(true)}
                  className="rounded-md bg-red-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 transition-colors"
                >
                  Delete My Account
                </button>
              ) : (
                <div className="space-y-4">
                  <div className="rounded-lg bg-red-50 border border-red-200 p-4">
                    <p className="text-sm font-semibold text-red-800 mb-1">This will permanently delete:</p>
                    <ul className="text-sm text-red-700 list-disc list-inside space-y-0.5">
                      <li>Your account and login credentials</li>
                      <li>All classes and profiles</li>
                      <li>All Do-Now sessions and analytics data</li>
                    </ul>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Type <span className="font-mono font-bold">DELETE</span> to confirm
                    </label>
                    <input
                      type="text"
                      value={deleteConfirmText}
                      onChange={(e) => setDeleteConfirmText(e.target.value)}
                      placeholder="DELETE"
                      className="block w-full max-w-xs rounded-md border border-gray-300 px-3 py-2 text-gray-900 placeholder-gray-400 focus:border-red-500 focus:outline-none focus:ring-red-500 sm:text-sm"
                    />
                  </div>
                  <div className="flex items-center gap-3">
                    <button
                      onClick={handleDeleteAccount}
                      disabled={deleteConfirmText !== 'DELETE' || deleting}
                      className="rounded-md bg-red-600 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
                    >
                      {deleting ? 'Deleting...' : 'Permanently Delete Account'}
                    </button>
                    <button
                      onClick={() => { setShowDeleteConfirm(false); setDeleteConfirmText('') }}
                      className="rounded-md bg-white px-4 py-2 text-sm font-semibold text-gray-700 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
                    >
                      Cancel
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>

        </div>
      </div>
    </div>
  )
}
