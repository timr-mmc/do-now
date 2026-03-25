# Fix for "Error adding questions" Issue

## Problem
When updating a Smart Do-Now session, the application failed with "Error adding questions: {}" because the database was missing a DELETE policy for the `session_questions` table.

## Solution
A DELETE Row Level Security (RLS) policy has been added to allow users to delete questions from their own sessions.

## How to Apply the Fix

### Option 1: Run the Migration File (Recommended)
1. Open your Supabase project dashboard
2. Go to the **SQL Editor**
3. Copy the contents of `session-questions-delete-policy.sql`
4. Paste into the SQL Editor
5. Click **Run**

### Option 2: Manual SQL Command
Run this SQL command in your Supabase SQL Editor:

```sql
CREATE POLICY "Users can delete their session questions"
  ON session_questions FOR DELETE
  USING (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );
```

## Testing
After applying the fix:
1. Go to Analytics page
2. Click "Generate Smart Do-Now"
3. The system will create a session and take you to the create page
4. Click "Update Do-Now"
5. It should now work without errors!

## What Changed
- Added DELETE policy to `session_questions` table
- Updated `supabase-schema.sql` for future reference
- This allows the update flow to delete old questions before inserting new ones
