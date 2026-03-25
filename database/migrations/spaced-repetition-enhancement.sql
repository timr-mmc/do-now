-- =====================================================
-- SPACED REPETITION ENHANCEMENT
-- Add features for retrieval practice and smart Do-Now suggestions
-- =====================================================

-- =====================================================
-- HELPER VIEW: Question Usage History
-- Shows when each bank was used with performance data
-- =====================================================

CREATE OR REPLACE VIEW question_bank_usage_history AS
SELECT 
  sq.bank_id,
  qb.category,
  qb.topic,
  qb.subtopic,
  s.profile_id,
  s.session_date,
  s.id as session_id,
  sq.proportion_correct,
  sq.recorded_at,
  CURRENT_DATE - s.session_date as days_since_used
FROM session_questions sq
JOIN do_now_sessions s ON sq.session_id = s.id
JOIN question_banks qb ON sq.bank_id = qb.id
WHERE sq.proportion_correct IS NOT NULL
ORDER BY s.session_date DESC;

-- =====================================================
-- FUNCTION: Get Banks by Retrieval Interval
-- Returns question banks used within a specific time range
-- =====================================================

CREATE OR REPLACE FUNCTION get_banks_by_retrieval_interval(
  p_profile_id UUID,
  p_min_days INT,
  p_max_days INT
)
RETURNS TABLE (
  bank_id UUID,
  category TEXT,
  topic TEXT,
  subtopic TEXT,
  last_used_date DATE,
  days_ago INT,
  last_performance DECIMAL,
  avg_performance DECIMAL,
  times_used BIGINT
) AS $$
BEGIN
  RETURN QUERY
  WITH ranked_usage AS (
    SELECT 
      qbuh.bank_id,
      qbuh.category,
      qbuh.topic,
      qbuh.subtopic,
      qbuh.session_date,
      qbuh.days_since_used,
      qbuh.proportion_correct,
      ROW_NUMBER() OVER (PARTITION BY qbuh.bank_id ORDER BY qbuh.session_date DESC) as rn
    FROM question_bank_usage_history qbuh
    WHERE qbuh.profile_id = p_profile_id
      AND qbuh.days_since_used BETWEEN p_min_days AND p_max_days
  )
  SELECT 
    ru.bank_id,
    ru.category,
    ru.topic,
    ru.subtopic,
    ru.session_date as last_used_date,
    ru.days_since_used as days_ago,
    ru.proportion_correct as last_performance,
    (
      SELECT AVG(qbuh2.proportion_correct)
      FROM question_bank_usage_history qbuh2
      WHERE qbuh2.bank_id = ru.bank_id 
        AND qbuh2.profile_id = p_profile_id
    ) as avg_performance,
    (
      SELECT COUNT(DISTINCT qbuh3.session_id)
      FROM question_bank_usage_history qbuh3
      WHERE qbuh3.bank_id = ru.bank_id 
        AND qbuh3.profile_id = p_profile_id
    ) as times_used
  FROM ranked_usage ru
  WHERE ru.rn = 1
  ORDER BY ru.days_since_used ASC, ru.proportion_correct ASC;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- FUNCTION: Get Weak Topic Banks
-- Returns banks with lowest performance that need attention
-- =====================================================

CREATE OR REPLACE FUNCTION get_weak_topic_banks(
  p_profile_id UUID,
  p_threshold DECIMAL DEFAULT 60.0,
  p_limit INT DEFAULT 10
)
RETURNS TABLE (
  bank_id UUID,
  category TEXT,
  topic TEXT,
  subtopic TEXT,
  avg_performance DECIMAL,
  last_used_date DATE,
  days_ago INT,
  times_used BIGINT
) AS $$
BEGIN
  RETURN QUERY
  WITH bank_performance AS (
    SELECT 
      qbuh.bank_id,
      qbuh.category,
      qbuh.topic,
      qbuh.subtopic,
      AVG(qbuh.proportion_correct) as avg_perf,
      MAX(qbuh.session_date) as last_used,
      CURRENT_DATE - MAX(qbuh.session_date) as days_since,
      COUNT(DISTINCT qbuh.session_id) as usage_count
    FROM question_bank_usage_history qbuh
    WHERE qbuh.profile_id = p_profile_id
    GROUP BY qbuh.bank_id, qbuh.category, qbuh.topic, qbuh.subtopic
    HAVING AVG(qbuh.proportion_correct) < p_threshold
  )
  SELECT 
    bp.bank_id,
    bp.category,
    bp.topic,
    bp.subtopic,
    bp.avg_perf as avg_performance,
    bp.last_used as last_used_date,
    bp.days_since as days_ago,
    bp.usage_count as times_used
  FROM bank_performance bp
  ORDER BY bp.avg_perf ASC, bp.last_used ASC
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- FUNCTION: Get Never Used Banks
-- Returns banks that haven't been used yet
-- =====================================================

CREATE OR REPLACE FUNCTION get_never_used_banks(
  p_profile_id UUID
)
RETURNS TABLE (
  bank_id UUID,
  category TEXT,
  topic TEXT,
  subtopic TEXT,
  question_count BIGINT
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    qb.id as bank_id,
    qb.category,
    qb.topic,
    qb.subtopic,
    COUNT(q.id) as question_count
  FROM question_banks qb
  LEFT JOIN questions q ON qb.id = q.bank_id
  WHERE qb.id NOT IN (
    SELECT DISTINCT sq.bank_id
    FROM session_questions sq
    JOIN do_now_sessions s ON sq.session_id = s.id
    WHERE s.profile_id = p_profile_id
  )
  GROUP BY qb.id, qb.category, qb.topic, qb.subtopic
  HAVING COUNT(q.id) > 0
  ORDER BY qb.category, qb.topic;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- INDEXES for Performance
-- =====================================================

-- Index for faster retrieval interval queries
CREATE INDEX IF NOT EXISTS idx_session_questions_bank_profile 
ON session_questions(bank_id);

CREATE INDEX IF NOT EXISTS idx_do_now_sessions_profile_date 
ON do_now_sessions(profile_id, session_date DESC);

-- =====================================================
-- GRANT PERMISSIONS
-- =====================================================

-- Grant execute permissions on functions to authenticated users
GRANT EXECUTE ON FUNCTION get_banks_by_retrieval_interval TO authenticated;
GRANT EXECUTE ON FUNCTION get_weak_topic_banks TO authenticated;
GRANT EXECUTE ON FUNCTION get_never_used_banks TO authenticated;

-- =====================================================
-- USAGE EXAMPLES
-- =====================================================

/*
-- Get banks used 1 day ago (yesterday)
SELECT * FROM get_banks_by_retrieval_interval(
  'your-profile-id'::UUID, 
  1, -- min days
  1  -- max days
);

-- Get banks used 5-10 days ago (1 week ago)
SELECT * FROM get_banks_by_retrieval_interval(
  'your-profile-id'::UUID, 
  5, 
  10
);

-- Get banks used 20-35 days ago (1 month ago)
SELECT * FROM get_banks_by_retrieval_interval(
  'your-profile-id'::UUID, 
  20, 
  35
);

-- Get weak topics (below 60% accuracy)
SELECT * FROM get_weak_topic_banks(
  'your-profile-id'::UUID,
  60.0, -- threshold %
  10    -- limit results
);

-- Get never-used banks
SELECT * FROM get_never_used_banks('your-profile-id'::UUID);
*/
