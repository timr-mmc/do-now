'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/utils/supabase/client';
import { useRouter } from 'next/navigation';

interface ProfileData {
  id: string;
  name: string;
  grade: string;
  subject: string;
}

interface SessionHistory {
  id: string;
  title: string;
  session_date: string;
  created_at: string;
  avg_accuracy: number | null;
  questions_count: number;
}

export default function AllSessionsPage({
  params,
}: {
  params: Promise<{ profileId: string }>;
}) {
  const router = useRouter();
  const [profileId, setProfileId] = useState<string>('');
  const [profile, setProfile] = useState<ProfileData | null>(null);
  const [sessionHistory, setSessionHistory] = useState<SessionHistory[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.resolve(params).then((resolvedParams) => {
      setProfileId(resolvedParams.profileId);
    });
  }, [params]);

  useEffect(() => {
    if (!profileId) return;

    async function fetchData() {
      const supabase = createClient();

      // Fetch profile
      const { data: profileData } = await supabase
        .from('profiles')
        .select('*')
        .eq('id', profileId)
        .single();

      if (profileData) setProfile(profileData);

      // Fetch all session history
      const { data: sessionsData } = await supabase
        .from('do_now_sessions')
        .select(`
          id,
          title,
          session_date,
          created_at
        `)
        .eq('profile_id', profileId)
        .order('created_at', { ascending: false });

      if (sessionsData) {
        // Get average accuracy for each session
        const sessionsWithStats = await Promise.all(
          sessionsData.map(async (session) => {
            const { data: sessionQuestions } = await supabase
              .from('session_questions')
              .select('proportion_correct')
              .eq('session_id', session.id)
              .not('proportion_correct', 'is', null);

            const avgAccuracy = sessionQuestions && sessionQuestions.length > 0
              ? sessionQuestions.reduce((sum, q) => sum + (q.proportion_correct || 0), 0) / sessionQuestions.length
              : null;

            return {
              ...session,
              avg_accuracy: avgAccuracy,
              questions_count: sessionQuestions?.length || 0,
            };
          })
        );

        setSessionHistory(sessionsWithStats);
      }

      setLoading(false);
    }

    fetchData();
  }, [profileId]);

  // Handle delete session
  async function handleDeleteSession(sessionId: string, event: React.MouseEvent) {
    event.stopPropagation(); // Prevent navigation when clicking delete

    try {
      const supabase = createClient();

      // Delete session questions first (due to foreign key constraint)
      await supabase
        .from('session_questions')
        .delete()
        .eq('session_id', sessionId);

      // Delete the session
      const { error } = await supabase
        .from('do_now_sessions')
        .delete()
        .eq('id', sessionId);

      if (error) throw error;

      // Update local state
      setSessionHistory(sessionHistory.filter(s => s.id !== sessionId));
    } catch (error) {
      console.error('Error deleting session:', error);
      alert('Failed to delete session. Please try again.');
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading sessions...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 py-8 px-4">
      {/* Header */}
      <div className="max-w-7xl mx-auto mb-8">
        <div className="mb-4">
          <button
            onClick={() => router.push(`/analytics/${profileId}`)}
            className="flex items-center gap-2 text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
            Back to Analytics
          </button>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">All Sessions</h1>
          {profile && (
            <p className="text-xl text-gray-600">
              {profile.name} • {profile.grade} {profile.subject}
            </p>
          )}
          <p className="text-sm text-gray-500 mt-2">
            Total: {sessionHistory.length} session{sessionHistory.length !== 1 ? 's' : ''}
          </p>
        </div>
      </div>

      {/* Sessions List */}
      <div className="max-w-7xl mx-auto">
        {sessionHistory.length > 0 ? (
          <div className="bg-white rounded-2xl shadow-xl p-8">
            <div className="space-y-3">
              {sessionHistory.map((session) => (
                <div
                  key={session.id}
                  className="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-indigo-50 transition-colors border-2 border-transparent hover:border-indigo-200 group"
                >
                  <div 
                    className="flex-1 cursor-pointer"
                    onClick={() => router.push(`/display/${session.id}`)}
                  >
                    <p className="font-semibold text-gray-800">
                      {session.title || 'Do-Now Session'}
                    </p>
                    <p className="text-sm text-gray-600">
                      {new Date(session.session_date || session.created_at).toLocaleDateString('en-NZ', {
                        weekday: 'short',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                      })}
                    </p>
                  </div>
                  <div className="text-right ml-4">
                    {session.avg_accuracy !== null ? (
                      <>
                        <p className={`text-2xl font-bold ${
                          session.avg_accuracy >= 75 ? 'text-green-600' :
                          session.avg_accuracy >= 50 ? 'text-yellow-600' :
                          'text-red-600'
                        }`}>
                          {session.avg_accuracy.toFixed(1)}%
                        </p>
                        <p className="text-sm text-gray-500">{session.questions_count} questions</p>
                      </>
                    ) : (
                      <p className="text-sm text-gray-400 italic">No results yet</p>
                    )}
                  </div>
                  <div className="ml-4 flex items-center gap-2">
                    <button
                      onClick={(e) => handleDeleteSession(session.id, e)}
                      className="p-2 rounded-lg text-red-500 hover:bg-red-50 hover:text-red-700 transition-colors opacity-0 group-hover:opacity-100"
                      title="Delete session"
                    >
                      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                      </svg>
                    </button>
                    <button
                      onClick={() => router.push(`/display/${session.id}`)}
                      className="p-2"
                      title="View session details"
                    >
                      <svg className="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                      </svg>
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </div>
        ) : (
          <div className="bg-white rounded-2xl shadow-xl p-12 text-center">
            <svg
              className="w-24 h-24 mx-auto mb-4 text-gray-300"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"
              />
            </svg>
            <h3 className="text-2xl font-bold text-gray-700 mb-2">No Sessions Yet</h3>
            <p className="text-gray-600 mb-6">
              Create your first Do-Now session to see it here.
            </p>
            <button
              onClick={() => router.push(`/create-do-now/${profileId}`)}
              className="px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 font-semibold transition-colors"
            >
              Create Your First Do-Now
            </button>
          </div>
        )}
      </div>


    </div>
  );
}
