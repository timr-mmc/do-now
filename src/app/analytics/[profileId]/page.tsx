'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/utils/supabase/client';
import { useRouter } from 'next/navigation';
import { getRetrievalStats, generateSmartDoNow, BankCandidate, DEFAULT_CONFIG, RetrievalConfig } from '@/utils/retrievalAlgorithm';

interface ProfileData {
  id: string;
  name: string;
  grade: string;
  subject: string;
}

interface UsageStat {
  bank_id: number;
  times_used: number;
  category: string;
  topic: string;
  subtopic: string;
}

interface PerformanceData {
  total_sessions: number;
  average_accuracy: number;
}

interface CategoryPerformance {
  category: string;
  times_used: number;
  avg_accuracy: number;
}

interface Recommendation {
  type: 'warning' | 'success' | 'info';
  title: string;
  description: string;
  category?: string;
}

interface SessionHistory {
  id: string;
  title: string;
  session_date: string;
  created_at: string;
  avg_accuracy: number | null;
  questions_count: number;
}

export default function AnalyticsPage({
  params,
}: {
  params: Promise<{ profileId: string }>;
}) {
  const router = useRouter();
  const [profileId, setProfileId] = useState<string>('');
  const [profile, setProfile] = useState<ProfileData | null>(null);
  const [usageStats, setUsageStats] = useState<UsageStat[]>([]);
  const [performance, setPerformance] = useState<PerformanceData | null>(null);
  const [categoryPerformance, setCategoryPerformance] = useState<CategoryPerformance[]>([]);
  const [recommendations, setRecommendations] = useState<Recommendation[]>([]);
  const [sessionHistory, setSessionHistory] = useState<SessionHistory[]>([]);
  const [loading, setLoading] = useState(true);
  
  // Retrieval/Spaced Repetition States
  const [retrievalStats, setRetrievalStats] = useState<any>(null);
  const [generatingDoNow, setGeneratingDoNow] = useState(false);
  const [showGeneratePreview, setShowGeneratePreview] = useState(false);
  const [suggestedBanks, setSuggestedBanks] = useState<BankCandidate[]>([]);
  const [retrievalConfig, setRetrievalConfig] = useState<RetrievalConfig>(DEFAULT_CONFIG);

  // Drill-down navigation states
  const [selectedCategory, setSelectedCategory] = useState<string | null>(null);
  const [topicPerformance, setTopicPerformance] = useState<any[]>([]);
  const [subtopicPerformance, setSubtopicPerformance] = useState<any[]>([]);
  const [selectedTopic, setSelectedTopic] = useState<string | null>(null);
  


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

      // Fetch usage stats with question bank details
      const { data: usageData } = await supabase
        .from('usage_stats')
        .select(`
          bank_id,
          times_used,
          question_banks (
            category,
            topic,
            subtopic
          )
        `)
        .eq('profile_id', profileId)
        .order('times_used', { ascending: false });

      let formattedUsage: UsageStat[] = [];
      if (usageData) {
        formattedUsage = usageData.map((stat: any) => ({
          bank_id: stat.bank_id,
          times_used: stat.times_used,
          category: stat.question_banks?.category || '',
          topic: stat.question_banks?.topic || '',
          subtopic: stat.question_banks?.subtopic || '',
        }));
        setUsageStats(formattedUsage);
      }

      // Fetch overall performance
      const { data: perfData } = await supabase
        .from('profile_performance')
        .select('*')
        .eq('profile_id', profileId)
        .single();

      if (perfData) setPerformance(perfData);

      // Calculate category performance
      const { data: sessionQuestionsData } = await supabase
        .from('session_questions')
        .select(`
          proportion_correct,
          question_banks!inner (
            category
          ),
          do_now_sessions!inner (
            profile_id
          )
        `)
        .eq('do_now_sessions.profile_id', profileId)
        .not('proportion_correct', 'is', null);

      if (sessionQuestionsData) {
        const categoryMap = new Map<string, { total: number; count: number; used: number }>();

        sessionQuestionsData.forEach((sq: any) => {
          const category = sq.question_banks?.category || 'Unknown';
          if (!categoryMap.has(category)) {
            categoryMap.set(category, { total: 0, count: 0, used: 0 });
          }
          const cat = categoryMap.get(category)!;
          cat.total += sq.proportion_correct || 0;
          cat.count += 1;
        });

        // Add usage counts
        formattedUsage.forEach((stat: UsageStat) => {
          if (categoryMap.has(stat.category)) {
            categoryMap.get(stat.category)!.used += stat.times_used;
          }
        });

        const categoryPerfArray = Array.from(categoryMap.entries()).map(([category, data]) => ({
          category,
          times_used: data.used,
          avg_accuracy: data.count > 0 ? (data.total / data.count) : 0,
        }));

        setCategoryPerformance(categoryPerfArray);

        // Generate recommendations
        generateRecommendations(
          categoryPerfArray,
          formattedUsage,
          perfData?.total_sessions || 0,
          perfData?.average_accuracy || 0
        );
      }

      // Fetch session history
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

      // Fetch retrieval/spaced repetition stats
      try {
        const retStats = await getRetrievalStats(supabase, profileId);
        setRetrievalStats(retStats);
      } catch (error) {
        console.error('Error fetching retrieval stats:', error);
      }

      setLoading(false);
    }

    fetchData();
  }, [profileId]);

  function generateRecommendations(
    catPerf: CategoryPerformance[],
    usage: UsageStat[],
    totalSessions: number,
    avgAccuracy: number
  ) {
    const recs: Recommendation[] = [];

    // Overall performance recommendations
    if (avgAccuracy < 50) {
      recs.push({
        type: 'warning',
        title: 'Low Overall Accuracy',
        description: `Your class average is ${avgAccuracy.toFixed(1)}%. Consider reviewing foundational concepts or adjusting question difficulty.`,
      });
    } else if (avgAccuracy > 80) {
      recs.push({
        type: 'success',
        title: 'Excellent Performance',
        description: `Your class is performing well with ${avgAccuracy.toFixed(1)}% accuracy. Consider introducing more challenging questions.`,
      });
    }

    // Session count recommendations
    if (totalSessions < 5) {
      recs.push({
        type: 'info',
        title: 'Build More Data',
        description: 'Complete more Do-Now sessions to get more detailed analytics and personalized recommendations.',
      });
    }

    // Category-specific recommendations
    catPerf.forEach((cat) => {
      if (cat.avg_accuracy < 50 && cat.times_used > 0) {
        recs.push({
          type: 'warning',
          title: `${cat.category}: Needs Attention`,
          description: `Students are struggling with ${cat.category} (${cat.avg_accuracy.toFixed(1)}% accuracy). Consider dedicating more lesson time to this area.`,
          category: cat.category,
        });
      }

      if (cat.times_used === 0) {
        recs.push({
          type: 'info',
          title: `${cat.category}: Not Yet Used`,
          description: `You haven't used questions from ${cat.category} yet. Consider including them to get well-rounded coverage.`,
          category: cat.category,
        });
      }
    });

    // Check for under-practiced areas (used less than 25% of average)
    if (usage.length > 0) {
      const avgUsage = usage.reduce((sum, s) => sum + s.times_used, 0) / usage.length;
      const underUsed = usage.filter((u) => u.times_used < avgUsage * 0.25 && u.times_used > 0);
      
      if (underUsed.length > 0) {
        underUsed.forEach((u) => {
          recs.push({
            type: 'info',
            title: `${u.category} - ${u.topic}: Under-Practiced`,
            description: `This topic has been used only ${u.times_used} time${u.times_used === 1 ? '' : 's'}. Consider including it more often for balanced coverage.`,
            category: u.category,
          });
        });
      }
    }

    setRecommendations(recs);
  }

  // Fetch topic-level performance for a selected category
  async function fetchTopicPerformance(category: string) {
    const supabase = createClient();
    
    const { data: sessionQuestionsData } = await supabase
      .from('session_questions')
      .select(`
        proportion_correct,
        question_banks!inner (
          category,
          topic,
          subtopic
        ),
        do_now_sessions!inner (
          profile_id
        )
      `)
      .eq('do_now_sessions.profile_id', profileId)
      .eq('question_banks.category', category)
      .not('proportion_correct', 'is', null);

    if (sessionQuestionsData) {
      const topicMap = new Map<string, { total: number; count: number; used: number }>();

      sessionQuestionsData.forEach((sq: any) => {
        const topic = sq.question_banks?.topic || 'Unknown';
        if (!topicMap.has(topic)) {
          topicMap.set(topic, { total: 0, count: 0, used: 0 });
        }
        const t = topicMap.get(topic)!;
        t.total += sq.proportion_correct || 0;
        t.count += 1;
        t.used += 1;
      });

      const topicPerfArray = Array.from(topicMap.entries()).map(([topic, data]) => ({
        topic,
        times_used: data.used,
        avg_accuracy: data.count > 0 ? (data.total / data.count) : 0,
      }));

      setTopicPerformance(topicPerfArray);
    }
  }

  // Fetch subtopic-level performance for a selected topic
  async function fetchSubtopicPerformance(category: string, topic: string) {
    const supabase = createClient();
    
    const { data: sessionQuestionsData } = await supabase
      .from('session_questions')
      .select(`
        proportion_correct,
        question_banks!inner (
          category,
          topic,
          subtopic
        ),
        do_now_sessions!inner (
          profile_id
        )
      `)
      .eq('do_now_sessions.profile_id', profileId)
      .eq('question_banks.category', category)
      .eq('question_banks.topic', topic)
      .not('proportion_correct', 'is', null);

    if (sessionQuestionsData) {
      const subtopicMap = new Map<string, { total: number; count: number; used: number }>();

      sessionQuestionsData.forEach((sq: any) => {
        const subtopic = sq.question_banks?.subtopic || 'Unknown';
        if (!subtopicMap.has(subtopic)) {
          subtopicMap.set(subtopic, { total: 0, count: 0, used: 0 });
        }
        const st = subtopicMap.get(subtopic)!;
        st.total += sq.proportion_correct || 0;
        st.count += 1;
        st.used += 1;
      });

      const subtopicPerfArray = Array.from(subtopicMap.entries()).map(([subtopic, data]) => ({
        subtopic,
        times_used: data.used,
        avg_accuracy: data.count > 0 ? (data.total / data.count) : 0,
      }));

      setSubtopicPerformance(subtopicPerfArray);
    }
  }

  // Handle category click
  function handleCategoryClick(category: string) {
    setSelectedCategory(category);
    setSelectedTopic(null);
    setSubtopicPerformance([]);
    fetchTopicPerformance(category);
  }

  // Handle topic click
  function handleTopicClick(topic: string) {
    if (selectedCategory) {
      setSelectedTopic(topic);
      fetchSubtopicPerformance(selectedCategory, topic);
    }
  }

  // Handle back navigation
  function handleBackClick() {
    if (selectedTopic) {
      setSelectedTopic(null);
      setSubtopicPerformance([]);
    } else if (selectedCategory) {
      setSelectedCategory(null);
      setTopicPerformance([]);
    }
  }

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

  // Generate Smart Do-Now with preview
  async function handleGenerateDoNow() {
    setGeneratingDoNow(true);
    try {
      const supabase = createClient();
      const banks = await generateSmartDoNow(supabase, profileId, retrievalConfig);
      setSuggestedBanks(banks);
      setShowGeneratePreview(true);
    } catch (error) {
      console.error('Error generating Do-Now:', error);
      alert('Failed to generate Do-Now. Please try again.');
    } finally {
      setGeneratingDoNow(false);
    }
  }

  // Create Do-Now session from suggested banks
  async function createDoNowFromSuggestions() {
    const supabase = createClient();
    
    try {
      // Create a new session
      const { data: newSession, error: sessionError } = await supabase
        .from('do_now_sessions')
        .insert({
          profile_id: profileId,
          title: `Smart Do-Now - ${new Date().toLocaleDateString('en-NZ')}`,
          session_date: new Date().toISOString().split('T')[0],
        })
        .select()
        .single();

      if (sessionError) throw sessionError;

      // For each suggested bank, get a random question
      const questionPromises = suggestedBanks.map(async (bank, index) => {
        const { data: questions } = await supabase
          .from('questions')
          .select('*')
          .eq('bank_id', bank.bank_id);

        if (questions && questions.length > 0) {
          const randomQuestion = questions[Math.floor(Math.random() * questions.length)];
          
          return {
            session_id: newSession.id,
            question_id: randomQuestion.id,
            bank_id: bank.bank_id,
            question_order: index + 1,
          };
        }
        return null;
      });

      const sessionQuestions = (await Promise.all(questionPromises)).filter(q => q !== null);

      // Insert session questions
      const { error: insertError } = await supabase
        .from('session_questions')
        .insert(sessionQuestions);

      if (insertError) throw insertError;

      // Navigate to the create-do-now page in edit mode
      router.push(`/create-do-now/${profileId}?sessionId=${newSession.id}`);
    } catch (error: any) {
      console.error('Error creating Do-Now:', error);
      alert(`Failed to create Do-Now session: ${error.message || JSON.stringify(error)}`);
    }
  }

  const CATEGORY_COLORS: Record<string, string> = {
    Number: 'bg-blue-100 text-blue-800 border-blue-300',
    Algebra: 'bg-purple-100 text-purple-800 border-purple-300',
    Measurement: 'bg-green-100 text-green-800 border-green-300',
    Geometry: 'bg-orange-100 text-orange-800 border-orange-300',
    Statistics: 'bg-pink-100 text-pink-800 border-pink-300',
    Probability: 'bg-teal-100 text-teal-800 border-teal-300',
  };

  const getRecTypeStyles = (type: string) => {
    switch (type) {
      case 'warning':
        return 'bg-red-50 border-red-300 text-red-900';
      case 'success':
        return 'bg-green-50 border-green-300 text-green-900';
      default:
        return 'bg-blue-50 border-blue-300 text-blue-900';
    }
  };

  const getRecIconColor = (type: string) => {
    switch (type) {
      case 'warning':
        return 'text-red-500';
      case 'success':
        return 'text-green-500';
      default:
        return 'text-blue-500';
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-indigo-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-lg text-gray-600">Loading analytics...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 py-8 px-4">
      {/* Print Styles */}
      <style jsx global>{`
        @media print {
          body {
            background: white !important;
          }
          .no-print {
            display: none !important;
          }
          .print-break {
            page-break-before: always;
          }
          @page {
            margin: 1cm;
          }
        }
      `}</style>

      {/* Header */}
      <div className="max-w-7xl mx-auto mb-8">
        <div className="mb-4 flex items-center justify-between">
          <button
            onClick={() => router.push('/dashboard')}
            className="no-print flex items-center gap-2 text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
            Back to Dashboard
          </button>
          <button
            onClick={() => window.print()}
            className="no-print flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-white hover:bg-indigo-700 font-medium transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z" />
            </svg>
            Export to PDF
          </button>
        </div>

        <div className="bg-white rounded-2xl shadow-xl p-8">
          <h1 className="text-4xl font-bold text-gray-800 mb-2">Analytics Report</h1>
          {profile && (
            <p className="text-xl text-gray-600">
              {profile.name} • {profile.grade} 
            </p>
          )}
          <p className="text-sm text-gray-500 mt-2">
            Generated: {new Date().toLocaleDateString('en-NZ', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' })}
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto space-y-8">
        {/* Interactive Performance Bar Chart */}
        {categoryPerformance.length > 0 && (
          <div className="bg-white rounded-2xl shadow-xl p-8">
            {/* Breadcrumb Navigation */}
            {(selectedCategory || selectedTopic) && (
              <div className="mb-6 flex items-center gap-2 text-sm">
                <button
                  onClick={handleBackClick}
                  className="flex items-center gap-1 text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
                >
                  <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
                  </svg>
                  Back
                </button>
                <span className="text-gray-400">/</span>
                {selectedCategory && (
                  <>
                    <span className={`px-2 py-1 rounded-full text-xs font-medium ${CATEGORY_COLORS[selectedCategory] || 'bg-gray-100 text-gray-800'}`}>
                      {selectedCategory}
                    </span>
                    {selectedTopic && (
                      <>
                        <span className="text-gray-400">/</span>
                        <span className="px-2 py-1 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800">
                          {selectedTopic}
                        </span>
                      </>
                    )}
                  </>
                )}
              </div>
            )}

            <h2 className="text-2xl font-bold text-gray-800 mb-2">
              {selectedTopic ? `${selectedCategory} - ${selectedTopic}` : 
               selectedCategory ? selectedCategory : 
               'Performance Overview'}
            </h2>
            <p className="text-sm text-gray-600 mb-6">
              {selectedTopic ? 'Subtopic breakdown - Click bars for details' :
               selectedCategory ? 'Topic breakdown - Click bars to drill down' :
               'Category performance - Click bars to drill down into topics'}
            </p>

            <div className="space-y-3">
              {/* Category-level bars */}
              {!selectedCategory && categoryPerformance
                .sort((a, b) => b.avg_accuracy - a.avg_accuracy)
                .map((cat) => (
                  <div key={cat.category} className="group">
                    <button
                      onClick={() => handleCategoryClick(cat.category)}
                      className="w-full text-left hover:bg-gray-50 rounded-lg p-3 transition-all"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <span className="font-semibold text-gray-800 flex items-center gap-2">
                          {cat.category}
                          <svg className="w-4 h-4 text-gray-400 group-hover:text-indigo-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                          </svg>
                        </span>
                        <span className="text-sm font-bold text-gray-700">
                          {cat.avg_accuracy > 0 ? `${cat.avg_accuracy.toFixed(1)}%` : 'N/A'}
                        </span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-8 overflow-hidden relative">
                        <div
                          className={`h-full transition-all duration-500 flex items-center justify-end px-3 ${
                            cat.avg_accuracy >= 75 ? 'bg-gradient-to-r from-green-400 to-green-600' :
                            cat.avg_accuracy >= 50 ? 'bg-gradient-to-r from-yellow-400 to-yellow-600' :
                            'bg-gradient-to-r from-red-400 to-red-600'
                          }`}
                          style={{ width: `${cat.avg_accuracy || 0}%` }}
                        >
                          <span className="text-xs font-bold text-white">
                            {cat.times_used} use{cat.times_used === 1 ? '' : 's'}
                          </span>
                        </div>
                      </div>
                    </button>
                  </div>
                ))}

              {/* Topic-level bars */}
              {selectedCategory && !selectedTopic && topicPerformance
                .sort((a, b) => b.avg_accuracy - a.avg_accuracy)
                .map((topic) => (
                  <div key={topic.topic} className="group">
                    <button
                      onClick={() => handleTopicClick(topic.topic)}
                      className="w-full text-left hover:bg-gray-50 rounded-lg p-3 transition-all"
                    >
                      <div className="flex items-center justify-between mb-2">
                        <span className="font-semibold text-gray-800 flex items-center gap-2">
                          {topic.topic}
                          <svg className="w-4 h-4 text-gray-400 group-hover:text-indigo-600 transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                          </svg>
                        </span>
                        <span className="text-sm font-bold text-gray-700">
                          {topic.avg_accuracy > 0 ? `${topic.avg_accuracy.toFixed(1)}%` : 'N/A'}
                        </span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-8 overflow-hidden relative">
                        <div
                          className={`h-full transition-all duration-500 flex items-center justify-end px-3 ${
                            topic.avg_accuracy >= 75 ? 'bg-gradient-to-r from-blue-400 to-blue-600' :
                            topic.avg_accuracy >= 50 ? 'bg-gradient-to-r from-yellow-400 to-yellow-600' :
                            'bg-gradient-to-r from-orange-400 to-orange-600'
                          }`}
                          style={{ width: `${topic.avg_accuracy || 0}%` }}
                        >
                          <span className="text-xs font-bold text-white">
                            {topic.times_used} use{topic.times_used === 1 ? '' : 's'}
                          </span>
                        </div>
                      </div>
                    </button>
                  </div>
                ))}

              {/* Subtopic-level bars */}
              {selectedTopic && subtopicPerformance
                .sort((a, b) => b.avg_accuracy - a.avg_accuracy)
                .map((subtopic) => (
                  <div key={subtopic.subtopic} className="group">
                    <div className="w-full text-left rounded-lg p-3">
                      <div className="flex items-center justify-between mb-2">
                        <span className="font-semibold text-gray-800">
                          {subtopic.subtopic}
                        </span>
                        <span className="text-sm font-bold text-gray-700">
                          {subtopic.avg_accuracy > 0 ? `${subtopic.avg_accuracy.toFixed(1)}%` : 'N/A'}
                        </span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-8 overflow-hidden relative">
                        <div
                          className={`h-full transition-all duration-500 flex items-center justify-end px-3 ${
                            subtopic.avg_accuracy >= 75 ? 'bg-gradient-to-r from-purple-400 to-purple-600' :
                            subtopic.avg_accuracy >= 50 ? 'bg-gradient-to-r from-yellow-400 to-yellow-600' :
                            'bg-gradient-to-r from-pink-400 to-pink-600'
                          }`}
                          style={{ width: `${subtopic.avg_accuracy || 0}%` }}
                        >
                          <span className="text-xs font-bold text-white">
                            {subtopic.times_used} use{subtopic.times_used === 1 ? '' : 's'}
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                ))}
            </div>
          </div>
        )}

        {/* Overall Performance */}
        <div className="bg-white rounded-2xl shadow-xl p-8">
          <h2 className="text-2xl font-bold text-gray-800 mb-6">Overall Performance</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div className="bg-gradient-to-br from-indigo-50 to-indigo-100 rounded-xl p-6 border-2 border-indigo-200">
              <p className="text-sm font-medium text-indigo-600 uppercase tracking-wide mb-2">
                Total Sessions
              </p>
              <p className="text-5xl font-bold text-indigo-900">
                {performance?.total_sessions || 0}
              </p>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-xl p-6 border-2 border-green-200">
              <p className="text-sm font-medium text-green-600 uppercase tracking-wide mb-2">
                Average Accuracy
              </p>
              <p className="text-5xl font-bold text-green-900">
                {performance?.average_accuracy ? `${performance.average_accuracy.toFixed(1)}%` : 'N/A'}
              </p>
            </div>
          </div>
        </div>

        {/* Spaced Repetition Dashboard */}
        {retrievalStats && (retrievalStats.recent > 0 || retrievalStats.week > 0 || retrievalStats.month > 0) && (
          <div className="bg-gradient-to-br from-purple-50 to-pink-50 rounded-2xl shadow-xl p-8 border-2 border-purple-200">
            <div className="flex items-center justify-between mb-6">
              <div>
                <h2 className="text-2xl font-bold text-gray-800 flex items-center gap-2">
                  🧠 Spaced Repetition Schedule
                </h2>
                <p className="text-sm text-gray-600 mt-1">
                  Questions ready for retrieval practice based on research-backed timing
                </p>
              </div>
              <button
                onClick={handleGenerateDoNow}
                disabled={generatingDoNow}
                className="no-print flex items-center gap-2 rounded-xl bg-gradient-to-r from-purple-600 to-pink-600 px-6 py-3 text-white font-bold hover:from-purple-700 hover:to-pink-700 transition-all shadow-lg hover:shadow-xl disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {generatingDoNow ? (
                  <>
                    <svg className="w-5 h-5 animate-spin" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Generating...
                  </>
                ) : (
                  <>
                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                    </svg>
                    Generate Smart Do-Now
                  </>
                )}
              </button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
              {/* Recent (1-3 days) */}
              <div className="bg-white rounded-xl p-5 border-2 border-blue-200 hover:border-blue-400 transition-all cursor-pointer"
                   onClick={() => window.alert(retrievalStats.recentBanks?.map((b: BankCandidate) => 
                     `${b.category} → ${b.topic}: ${b.last_performance?.toFixed(0)}%`).join('\n') || 'No recent banks')}>
                <div className="flex items-center gap-3 mb-2">
                  <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center">
                    <span className="text-xl">📅</span>
                  </div>
                  <div>
                    <p className="text-sm font-medium text-blue-600">Recent (1-3 days)</p>
                    <p className="text-xs text-gray-500">Immediate retrieval</p>
                  </div>
                </div>
                <p className="text-4xl font-bold text-blue-700 mb-1">{retrievalStats.recent}</p>
                <p className="text-xs text-gray-600">topics available</p>
              </div>

              {/* Medium (1 week) */}
              <div className="bg-white rounded-xl p-5 border-2 border-purple-200 hover:border-purple-400 transition-all cursor-pointer"
                   onClick={() => window.alert(retrievalStats.weekBanks?.map((b: BankCandidate) => 
                     `${b.category} → ${b.topic}: ${b.last_performance?.toFixed(0)}%`).join('\n') || 'No week-old banks')}>
                <div className="flex items-center gap-3 mb-2">
                  <div className="w-10 h-10 rounded-full bg-purple-100 flex items-center justify-center">
                    <span className="text-xl">📆</span>
                  </div>
                  <div>
                    <p className="text-sm font-medium text-purple-600">Medium (5-10 days)</p>
                    <p className="text-xs text-gray-500">Spaced practice</p>
                  </div>
                </div>
                <p className="text-4xl font-bold text-purple-700 mb-1">{retrievalStats.week}</p>
                <p className="text-xs text-gray-600">topics available</p>
              </div>

              {/* Long-term (1 month) */}
              <div className="bg-white rounded-xl p-5 border-2 border-pink-200 hover:border-pink-400 transition-all cursor-pointer"
                   onClick={() => window.alert(retrievalStats.monthBanks?.map((b: BankCandidate) => 
                     `${b.category} → ${b.topic}: ${b.last_performance?.toFixed(0)}%`).join('\n') || 'No month-old banks')}>
                <div className="flex items-center gap-3 mb-2">
                  <div className="w-10 h-10 rounded-full bg-pink-100 flex items-center justify-center">
                    <span className="text-xl">🗓️</span>
                  </div>
                  <div>
                    <p className="text-sm font-medium text-pink-600">Long-term (20-35 days)</p>
                    <p className="text-xs text-gray-500">Deep retrieval</p>
                  </div>
                </div>
                <p className="text-4xl font-bold text-pink-700 mb-1">{retrievalStats.month}</p>
                <p className="text-xs text-gray-600">topics available</p>
              </div>
            </div>

            {/* Weak Topics */}
            {retrievalStats.weak > 0 && (
              <div className="bg-red-50 rounded-xl p-5 border-2 border-red-200">
                <div className="flex items-center gap-3 mb-3">
                  <div className="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center">
                    <span className="text-xl">⚠️</span>
                  </div>
                  <div>
                    <p className="font-bold text-red-800">Intervention Needed</p>
                    <p className="text-sm text-red-600">{retrievalStats.weak} topic{retrievalStats.weak !== 1 ? 's' : ''} below 60% accuracy</p>
                  </div>
                </div>
                <div className="flex flex-wrap gap-2">
                  {retrievalStats.weakBanks?.slice(0, 5).map((bank: BankCandidate, idx: number) => (
                    <span key={idx} className="inline-flex items-center gap-1 bg-white px-3 py-1 rounded-full text-xs font-medium text-red-700 border border-red-200">
                      {bank.topic}: {bank.avg_performance?.toFixed(0)}%
                    </span>
                  ))}
                </div>
              </div>
            )}
          </div>
        )}

        {/* Preview Modal */}
        {showGeneratePreview && suggestedBanks.length > 0 && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
            <div className="bg-white rounded-2xl shadow-2xl max-w-3xl w-full max-h-[90vh] overflow-hidden flex flex-col">
              <div className="p-6 border-b border-gray-200">
                <h3 className="text-2xl font-bold text-gray-800 mb-2">Smart Do-Now Preview</h3>
                <p className="text-sm text-gray-600">Review the suggested questions before creating your session</p>
              </div>
              
              <div className="p-6 overflow-y-auto flex-1">
                <div className="space-y-3">
                  {suggestedBanks.map((bank, index) => (
                    <div key={index} className="bg-gray-50 rounded-xl p-4 border-2 border-gray-200">
                      <div className="flex items-start justify-between">
                        <div className="flex-1">
                          <div className="flex items-center gap-2 mb-2">
                            <span className="w-8 h-8 rounded-full bg-indigo-600 text-white flex items-center justify-center font-bold text-sm">
                              {index + 1}
                            </span>
                            <span className={`text-xs px-2 py-1 rounded-full font-medium ${
                              bank.reason === 'recent' ? 'bg-blue-100 text-blue-700' :
                              bank.reason === 'medium' ? 'bg-purple-100 text-purple-700' :
                              bank.reason === 'longterm' ? 'bg-pink-100 text-pink-700' :
                              bank.reason === 'weak' ? 'bg-red-100 text-red-700' :
                              'bg-gray-100 text-gray-700'
                            }`}>
                              {bank.reason === 'recent' ? '📅 Recent' :
                               bank.reason === 'medium' ? '📆 1 Week' :
                               bank.reason === 'longterm' ? '🗓️ 1 Month' :
                               bank.reason === 'weak' ? '⚠️ Weak' : '🆕 New'}
                            </span>
                          </div>
                          <p className="font-semibold text-gray-800">
                            {bank.category} → {bank.topic}
                          </p>
                          <p className="text-sm text-gray-600">{bank.subtopic}</p>
                          {bank.last_performance !== undefined && (
                            <p className="text-xs text-gray-500 mt-1">
                              Last performance: {bank.last_performance.toFixed(0)}% 
                              {bank.days_ago && ` • ${bank.days_ago} day${bank.days_ago !== 1 ? 's' : ''} ago`}
                            </p>
                          )}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>

              <div className="p-6 border-t border-gray-200 flex gap-3">
                <button
                  onClick={() => setShowGeneratePreview(false)}
                  className="flex-1 px-4 py-3 border-2 border-gray-300 text-gray-700 rounded-xl font-semibold hover:bg-gray-50 transition-colors"
                >
                  Cancel
                </button>
                <button
                  onClick={createDoNowFromSuggestions}
                  className="flex-1 px-4 py-3 bg-gradient-to-r from-purple-600 to-pink-600 text-white rounded-xl font-semibold hover:from-purple-700 hover:to-pink-700 transition-all shadow-lg"
                >
                  Create Do-Now Session
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Usage Statistics */}
        {usageStats.length > 0 && (
          <div className="bg-white rounded-2xl shadow-xl p-8">
            <h2 className="text-2xl font-bold text-gray-800 mb-6">Most Used Question Banks</h2>
            <div className="space-y-3">
              {usageStats.slice(0, 10).map((stat, index) => (
                <div
                  key={stat.bank_id}
                  className="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors"
                >
                  <div className="flex items-center gap-4">
                    <span className="text-2xl font-bold text-gray-400 w-8">#{index + 1}</span>
                    <div>
                      <p className="font-semibold text-gray-800">
                        {stat.category} → {stat.topic}
                      </p>
                      <p className="text-sm text-gray-600">{stat.subtopic}</p>
                    </div>
                  </div>
                  <div className="text-right">
                    <p className="text-2xl font-bold text-indigo-600">{stat.times_used}</p>
                    <p className="text-sm text-gray-500">times used</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Session History */}
        {sessionHistory.length > 0 && (
          <div className="bg-white rounded-2xl shadow-xl p-8">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-2xl font-bold text-gray-800">Recent Sessions</h2>
              {sessionHistory.length > 10 && (
                <button
                  onClick={() => router.push(`/analytics/${profileId}/sessions`)}
                  className="flex items-center gap-2 text-indigo-600 hover:text-indigo-800 font-medium transition-colors"
                >
                  View All Sessions
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </button>
              )}
            </div>
            <div className="space-y-3">
              {sessionHistory.slice(0, 10).map((session) => (
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
                        month: 'short',
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
                      className="no-print p-2 rounded-lg text-red-500 hover:bg-red-50 hover:text-red-700 transition-colors opacity-0 group-hover:opacity-100"
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
            {sessionHistory.length > 10 && (
              <div className="mt-4 text-center">
                <p className="text-sm text-gray-500">
                  Showing 10 of {sessionHistory.length} sessions
                </p>
              </div>
            )}
          </div>
        )}

        {/* Recommendations */}
        {recommendations.length > 0 && (
          <div className="bg-white rounded-2xl shadow-xl p-8">
            <h2 className="text-2xl font-bold text-gray-800 mb-6">Recommendations</h2>
            <div className="space-y-4">
              {recommendations.map((rec, index) => (
                <div
                  key={index}
                  className={`rounded-xl p-6 border-2 ${getRecTypeStyles(rec.type)}`}
                >
                  <div className="flex items-start gap-4">
                    <div className={`flex-shrink-0 ${getRecIconColor(rec.type)}`}>
                      {rec.type === 'warning' && (
                        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                        </svg>
                      )}
                      {rec.type === 'success' && (
                        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                      )}
                      {rec.type === 'info' && (
                        <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                      )}
                    </div>
                    <div className="flex-1">
                      <h3 className="font-bold text-lg mb-1">{rec.title}</h3>
                      <p className="text-sm leading-relaxed">{rec.description}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Empty State */}
        {usageStats.length === 0 && (
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
            <h3 className="text-2xl font-bold text-gray-700 mb-2">No Data Yet</h3>
            <p className="text-gray-600 mb-6">
              Create and complete Do-Now sessions to see analytics here.
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
