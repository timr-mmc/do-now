-- Allow questions.bank_id to be NULL so that user-created custom questions
-- can be saved without being placed under any curriculum strand/topic/subtopic.
ALTER TABLE questions ALTER COLUMN bank_id DROP NOT NULL;

-- Update the index to handle NULLs gracefully (it already does, but document it)
-- idx_questions_bank_id already works with nullable columns
