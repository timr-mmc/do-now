-- ============================================
-- DIAGNOSTIC: CHECK NUMBER CATEGORY COVERAGE
-- Run this in Supabase SQL Editor to see which subtopics have questions
-- ============================================

-- Query: Subtopic question counts (all categories and topics)
SELECT
  qb.category AS "Category",
  qb.topic AS "Topic",
  qb.subtopic AS "Subtopic",
  COUNT(q.id) AS "# Questions within Subtopic"
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
GROUP BY qb.id, qb.category, qb.topic, qb.subtopic
ORDER BY qb.category, qb.topic, qb.subtopic;

-- Query 2: Summary by topic
SELECT 
  qb.topic,
  COUNT(DISTINCT qb.id) as subtopic_count,
  COUNT(q.id) as total_questions,
  ROUND(AVG(CASE WHEN q.id IS NULL THEN 0 ELSE 1 END) * 100, 1) as percent_with_questions
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
WHERE qb.category = 'Number'
GROUP BY qb.topic
ORDER BY qb.topic;

-- Query 3: List only EMPTY subtopics (no questions)
SELECT 
  qb.topic,
  qb.subtopic,
  qb.description
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
WHERE qb.category = 'Number'
GROUP BY qb.id, qb.topic, qb.subtopic, qb.description
HAVING COUNT(q.id) = 0
ORDER BY qb.topic, qb.subtopic;
