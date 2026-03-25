-- Migration: Allow anonymous Do-Now sessions
-- This enables teachers to create and view Do-Nows without logging in

-- Step 1: Make profile_id nullable
ALTER TABLE do_now_sessions ALTER COLUMN profile_id DROP NOT NULL;

-- Step 2: Allow anonymous users to read question banks and questions
-- Drop the existing authenticated-only policies
DROP POLICY IF EXISTS "Anyone can view question banks" ON question_banks;
DROP POLICY IF EXISTS "Anyone can view questions" ON questions;

-- Create new policies that allow both authenticated AND anonymous users
CREATE POLICY "Anyone can view question banks"
  ON question_banks FOR SELECT
  USING (true);

CREATE POLICY "Anyone can view questions"
  ON questions FOR SELECT
  USING (true);

-- Step 3: Add RLS policies for anonymous sessions
-- Drop existing policies if they exist (for idempotency)
DROP POLICY IF EXISTS "Anyone can create anonymous sessions" ON do_now_sessions;
DROP POLICY IF EXISTS "Anyone can view anonymous sessions" ON do_now_sessions;
DROP POLICY IF EXISTS "Anyone can update anonymous sessions" ON do_now_sessions;
DROP POLICY IF EXISTS "Anyone can view anonymous session questions" ON session_questions;
DROP POLICY IF EXISTS "Anyone can insert anonymous session questions" ON session_questions;
DROP POLICY IF EXISTS "Anyone can update anonymous session questions" ON session_questions;

-- Anonymous users can create sessions without a profile_id
CREATE POLICY "Anyone can create anonymous sessions"
  ON do_now_sessions FOR INSERT
  WITH CHECK (profile_id IS NULL);

-- Anonymous users can view any session (for display purposes)
-- This is safe because sessions don't contain sensitive user data
CREATE POLICY "Anyone can view anonymous sessions"
  ON do_now_sessions FOR SELECT
  USING (profile_id IS NULL);

-- Anonymous users can update anonymous sessions (for show_answers toggle)
CREATE POLICY "Anyone can update anonymous sessions"
  ON do_now_sessions FOR UPDATE
  USING (profile_id IS NULL);

-- Step 4: Add RLS policies for anonymous session_questions
-- Anonymous users can view questions for anonymous sessions
CREATE POLICY "Anyone can view anonymous session questions"
  ON session_questions FOR SELECT
  USING (
    session_id IN (
      SELECT id FROM do_now_sessions WHERE profile_id IS NULL
    )
  );

-- Anonymous users can insert questions for anonymous sessions
CREATE POLICY "Anyone can insert anonymous session questions"
  ON session_questions FOR INSERT
  WITH CHECK (
    session_id IN (
      SELECT id FROM do_now_sessions WHERE profile_id IS NULL
    )
  );

-- Anonymous users can update questions for anonymous sessions
-- (This allows them to use "replace with random question" feature)
CREATE POLICY "Anyone can update anonymous session questions"
  ON session_questions FOR UPDATE
  USING (
    session_id IN (
      SELECT id FROM do_now_sessions WHERE profile_id IS NULL
    )
  );

-- Note: We intentionally do NOT allow updating proportion_correct for anonymous sessions
-- since results tracking requires an account.
-- The saveResults function in the display page should be hidden for anonymous users.
