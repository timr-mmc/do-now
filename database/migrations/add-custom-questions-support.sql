-- =====================================================
-- Add Custom Questions Support
-- Adds is_custom and created_by columns to questions,
-- plus RLS policies for teacher-written questions.
-- =====================================================

-- Add is_custom flag and created_by to questions table
-- (Safe to run even if columns already exist)
ALTER TABLE questions
  ADD COLUMN IF NOT EXISTS is_custom BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS created_by UUID REFERENCES auth.users(id) ON DELETE SET NULL,
  ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS is_saved BOOLEAN DEFAULT TRUE,
  ADD COLUMN IF NOT EXISTS difficulty INTEGER DEFAULT 3,
  ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}';
-- is_saved = TRUE  → user explicitly saved this question for re-use (shows in My Own Questions)
-- is_saved = FALSE → question was created for a single session only (hidden from My Own Questions)

-- Index for fast lookup of a user's custom questions
CREATE INDEX IF NOT EXISTS idx_questions_custom_by_user
  ON questions (created_by, is_custom)
  WHERE is_custom = TRUE;

-- RLS: Users can insert their own custom questions
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'questions' AND policyname = 'Users can insert own custom questions'
  ) THEN
    CREATE POLICY "Users can insert own custom questions"
      ON questions FOR INSERT
      WITH CHECK (is_custom = TRUE AND created_by = auth.uid());
  END IF;
END $$;

-- RLS: Users can update their own custom questions
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'questions' AND policyname = 'Users can update own custom questions'
  ) THEN
    CREATE POLICY "Users can update own custom questions"
      ON questions FOR UPDATE
      USING (is_custom = TRUE AND created_by = auth.uid());
  END IF;
END $$;

-- RLS: Users can delete their own custom questions
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'questions' AND policyname = 'Users can delete own custom questions'
  ) THEN
    CREATE POLICY "Users can delete own custom questions"
      ON questions FOR DELETE
      USING (is_custom = TRUE AND created_by = auth.uid());
  END IF;
END $$;

-- Allow any authenticated user to insert into question_banks
-- so the "My Questions" shared bank can be created on first use
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies WHERE tablename = 'question_banks' AND policyname = 'Authenticated users can create question banks'
  ) THEN
    CREATE POLICY "Authenticated users can create question banks"
      ON question_banks FOR INSERT
      WITH CHECK (auth.role() = 'authenticated');
  END IF;
END $$;
