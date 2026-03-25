-- Migration: Add question flagging for beta testing
-- This allows teachers to flag questions with errors during beta testing

-- Create flagged_questions table
CREATE TABLE IF NOT EXISTS flagged_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES questions(id) ON DELETE CASCADE NOT NULL,
  session_id UUID REFERENCES do_now_sessions(id) ON DELETE SET NULL,
  flagged_at TIMESTAMPTZ DEFAULT NOW(),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Create index for efficient lookups
CREATE INDEX IF NOT EXISTS idx_flagged_questions_question_id ON flagged_questions(question_id);
CREATE INDEX IF NOT EXISTS idx_flagged_questions_created_at ON flagged_questions(created_at DESC);

-- Enable RLS
ALTER TABLE flagged_questions ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotent migrations)
DROP POLICY IF EXISTS "Anyone can flag questions" ON flagged_questions;
DROP POLICY IF EXISTS "Anyone can view flagged questions" ON flagged_questions;
DROP POLICY IF EXISTS "Anyone can delete flagged questions" ON flagged_questions;

-- Allow anyone (authenticated or anonymous) to flag questions
CREATE POLICY "Anyone can flag questions"
  ON flagged_questions FOR INSERT
  WITH CHECK (true);

-- Allow anyone to view flagged questions (for admin review)
CREATE POLICY "Anyone can view flagged questions"
  ON flagged_questions FOR SELECT
  USING (true);

-- Allow anyone to delete flags (for unflagging)
CREATE POLICY "Anyone can delete flagged questions"
  ON flagged_questions FOR DELETE
  USING (true);

-- Drop and recreate the view with flag counts
DROP VIEW IF EXISTS questions_with_flags;
CREATE VIEW questions_with_flags AS
SELECT 
  q.*,
  COUNT(fq.id) as flag_count,
  MAX(fq.flagged_at) as last_flagged_at
FROM questions q
LEFT JOIN flagged_questions fq ON q.id = fq.question_id
GROUP BY q.id;
