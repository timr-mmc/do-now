-- ============================================
-- CLEANUP EMPTY NUMBER SUBTOPICS
-- Removes question banks that have no questions
-- These were created by nz-year9-10-curriculum-expansion.sql
-- but don't have matching question files yet
-- ============================================

-- Delete empty subtopics that don't have questions
DELETE FROM question_banks 
WHERE category = 'Number' 
AND id IN (
  SELECT qb.id 
  FROM question_banks qb
  LEFT JOIN questions q ON qb.id = q.bank_id
  WHERE qb.category = 'Number'
  GROUP BY qb.id
  HAVING COUNT(q.id) = 0
);

-- Verify remaining banks all have questions
SELECT 
  qb.topic,
  qb.subtopic,
  COUNT(q.id) as question_count
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
WHERE qb.category = 'Number'
GROUP BY qb.id, qb.topic, qb.subtopic
HAVING COUNT(q.id) = 0
ORDER BY qb.topic, qb.subtopic;

-- If the above query returns 0 rows, cleanup was successful!
