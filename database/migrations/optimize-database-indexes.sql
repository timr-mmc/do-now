-- ============================================
-- DATABASE OPTIMIZATION: CREATE INDEXES
-- ============================================
-- These indexes will significantly speed up question loading queries
-- Run this in your Supabase SQL Editor

-- Index on questions.bank_id for fast filtering by bank
-- This is the most important index for lazy loading queries
CREATE INDEX IF NOT EXISTS idx_questions_bank_id 
ON questions(bank_id);

-- Index on question_banks composite for category/topic filtering
CREATE INDEX IF NOT EXISTS idx_banks_category_topic 
ON question_banks(category, topic);

-- Index on question_banks category alone (for category dropdown)
CREATE INDEX IF NOT EXISTS idx_banks_category 
ON question_banks(category);

-- Index on session_questions for loading existing sessions
CREATE INDEX IF NOT EXISTS idx_session_questions_session_id 
ON session_questions(session_id);

-- Index on session_questions for loading by bank
CREATE INDEX IF NOT EXISTS idx_session_questions_bank_id 
ON session_questions(bank_id);

-- Verify indexes were created
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
    AND tablename IN ('questions', 'question_banks', 'session_questions')
ORDER BY tablename, indexname;
