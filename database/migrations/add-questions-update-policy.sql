-- Add UPDATE (and INSERT/DELETE) policies to the questions table
-- so authenticated teachers can edit questions via the Review Questions page.
--
-- Run this in the Supabase Dashboard → SQL Editor.

-- Allow authenticated users to update questions
CREATE POLICY "Authenticated users can update questions"
  ON questions FOR UPDATE
  USING (auth.uid() IS NOT NULL)
  WITH CHECK (auth.uid() IS NOT NULL);

-- Allow authenticated users to insert questions
CREATE POLICY "Authenticated users can insert questions"
  ON questions FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

-- Allow authenticated users to delete questions
CREATE POLICY "Authenticated users can delete questions"
  ON questions FOR DELETE
  USING (auth.uid() IS NOT NULL);
