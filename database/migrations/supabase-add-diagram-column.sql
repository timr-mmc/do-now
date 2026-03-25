-- ============================================
-- ADD DIAGRAM SUPPORT TO QUESTIONS TABLE
-- Adds a JSON column to store geometry diagram data
-- ============================================

-- Add diagram_data column to questions table
ALTER TABLE questions
ADD COLUMN diagram_data JSONB DEFAULT NULL;

-- Add comment to document the column
COMMENT ON COLUMN questions.diagram_data IS 'JSON data for rendering geometry diagrams. Schema: { type, dimensions, labels, style, showGrid, scale }';

-- Create an index for queries that filter by diagram presence
CREATE INDEX idx_questions_has_diagram ON questions ((diagram_data IS NOT NULL));

-- Example verification query
SELECT 
  id, 
  question_text, 
  diagram_data IS NOT NULL as has_diagram,
  diagram_data->>'type' as diagram_type
FROM questions
WHERE diagram_data IS NOT NULL
LIMIT 5;
