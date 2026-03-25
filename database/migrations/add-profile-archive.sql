-- Add archived_at column to profiles table
-- This allows soft deletion of classes - they can be archived and later restored

ALTER TABLE profiles
ADD COLUMN archived_at TIMESTAMPTZ DEFAULT NULL;

-- Add index for efficient filtering of active profiles
CREATE INDEX idx_profiles_archived_at ON profiles(archived_at) WHERE archived_at IS NULL;

-- Update the schema comment
COMMENT ON COLUMN profiles.archived_at IS 'Timestamp when the profile was archived. NULL means active, non-NULL means archived.';
