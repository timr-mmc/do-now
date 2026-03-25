-- Query to view all flagged questions with details
-- Use this to review questions that were flagged during beta testing

-- View all flagged questions with full details
SELECT 
  fq.id as flag_id,
  fq.flagged_at,
  q.id as question_id,
  q.question_text,
  q.answer,
  qb.category,
  qb.topic,
  qb.subtopic,
  COUNT(*) OVER (PARTITION BY q.id) as times_flagged,
  fq.notes
FROM flagged_questions fq
JOIN questions q ON fq.question_id = q.id
JOIN question_banks qb ON q.bank_id = qb.id
ORDER BY fq.flagged_at DESC;

-- Count of flags per question (questions with multiple flags likely have issues)
SELECT 
  q.id,
  q.question_text,
  qb.category,
  qb.topic,
  COUNT(fq.id) as flag_count,
  MAX(fq.flagged_at) as last_flagged
FROM questions q
JOIN question_banks qb ON q.bank_id = qb.id
LEFT JOIN flagged_questions fq ON q.id = fq.question_id
WHERE fq.id IS NOT NULL
GROUP BY q.id, q.question_text, qb.category, qb.topic
ORDER BY flag_count DESC, last_flagged DESC;

-- Flagged questions by category
SELECT 
  qb.category,
  qb.topic,
  COUNT(DISTINCT fq.question_id) as unique_flagged_questions,
  COUNT(fq.id) as total_flags
FROM flagged_questions fq
JOIN questions q ON fq.question_id = q.id
JOIN question_banks qb ON q.bank_id = qb.id
GROUP BY qb.category, qb.topic
ORDER BY total_flags DESC;

-- Recent flags (last 7 days)
SELECT 
  fq.flagged_at,
  q.question_text,
  q.answer,
  qb.category,
  qb.topic,
  qb.subtopic
FROM flagged_questions fq
JOIN questions q ON fq.question_id = q.id
JOIN question_banks qb ON q.bank_id = qb.id
WHERE fq.flagged_at > NOW() - INTERVAL '7 days'
ORDER BY fq.flagged_at DESC;

-- To delete all flags for a specific question after fixing it:
-- DELETE FROM flagged_questions WHERE question_id = 'your-question-id-here';

-- To clear all flags (use after reviewing and fixing):
-- DELETE FROM flagged_questions WHERE flagged_at < NOW() - INTERVAL '30 days';
