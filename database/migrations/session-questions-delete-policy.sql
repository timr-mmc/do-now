-- =====================================================
-- FIX: Add DELETE policy for session_questions
-- This allows users to delete questions from their own sessions
-- =====================================================

-- Add missing DELETE policy for session_questions
CREATE POLICY "Users can delete their session questions"
  ON session_questions FOR DELETE
  USING (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );
