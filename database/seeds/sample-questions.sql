-- =====================================================
-- SAMPLE QUESTIONS FOR DO-NOW
-- Run this in Supabase SQL Editor to add practice questions
-- =====================================================

-- Get bank IDs first (we'll use these in the inserts)
DO $$
DECLARE
  rounding_1dp_id UUID;
  rounding_2dp_id UUID;
  collecting_terms_id UUID;
  expanding_single_id UUID;
  angles_line_id UUID;
  area_rectangle_id UUID;
BEGIN
  -- Get bank IDs
  SELECT id INTO rounding_1dp_id FROM question_banks WHERE subtopic = 'Round to 1 DP';
  SELECT id INTO rounding_2dp_id FROM question_banks WHERE subtopic = 'Round to 2 DP';
  SELECT id INTO collecting_terms_id FROM question_banks WHERE subtopic = 'Collecting Like Terms';
  SELECT id INTO expanding_single_id FROM question_banks WHERE subtopic = 'Single Brackets';
  SELECT id INTO angles_line_id FROM question_banks WHERE subtopic = 'Angles on a Line';
  SELECT id INTO area_rectangle_id FROM question_banks WHERE subtopic = 'Area of Rectangle';

  -- Rounding to 1 DP
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (rounding_1dp_id, 'Round 3.47 to 1 decimal place', '3.5', 2),
    (rounding_1dp_id, 'Round 12.832 to 1 decimal place', '12.8', 2),
    (rounding_1dp_id, 'Round 0.96 to 1 decimal place', '1.0', 2),
    (rounding_1dp_id, 'Round 7.25 to 1 decimal place', '7.3', 2),
    (rounding_1dp_id, 'Round 19.04 to 1 decimal place', '19.0', 2);

  -- Rounding to 2 DP
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (rounding_2dp_id, 'Round 5.478 to 2 decimal places', '5.48', 2),
    (rounding_2dp_id, 'Round 13.245 to 2 decimal places', '13.25', 2),
    (rounding_2dp_id, 'Round 0.996 to 2 decimal places', '1.00', 2),
    (rounding_2dp_id, 'Round 8.1234 to 2 decimal places', '8.12', 2),
    (rounding_2dp_id, 'Round 20.555 to 2 decimal places', '20.56', 2);

  -- Collecting Like Terms
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (collecting_terms_id, 'Simplify: 3x + 5x', '8x', 2),
    (collecting_terms_id, 'Simplify: 7a - 2a + 4a', '9a', 2),
    (collecting_terms_id, 'Simplify: 5y + 3 + 2y - 1', '7y + 2', 2),
    (collecting_terms_id, 'Simplify: 4x + 2y - x + 5y', '3x + 7y', 3),
    (collecting_terms_id, 'Simplify: 6a - 3b + 2a + b', '8a - 2b', 3),
    (collecting_terms_id, 'Simplify: 3x² + 5x + 2x² - 3x', '5x² + 2x', 3);

  -- Expanding Single Brackets
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (expanding_single_id, 'Expand: 3(x + 4)', '3x + 12', 2),
    (expanding_single_id, 'Expand: 5(2a - 3)', '10a - 15', 2),
    (expanding_single_id, 'Expand: -2(x + 5)', '-2x - 10', 3),
    (expanding_single_id, 'Expand: 4(3y - 2)', '12y - 8', 2),
    (expanding_single_id, 'Expand: -3(2x - 4)', '-6x + 12', 3),
    (expanding_single_id, 'Expand: 6(x + 2y)', '6x + 12y', 2);

  -- Angles on a Line
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (angles_line_id, 'Two angles on a straight line are 110° and x°. Find x.', '70°', 2),
    (angles_line_id, 'Angles on a line: 85°, 45°, and x°. Find x.', '50°', 2),
    (angles_line_id, 'Three equal angles are on a straight line. Find each angle.', '60°', 2),
    (angles_line_id, 'Angles on a line: 2x, 3x, and 4x. Find x.', '20°', 3),
    (angles_line_id, 'Two angles on a line: x and 3x. Find x.', '45°', 2);

  -- Area of Rectangle
  INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
    (area_rectangle_id, 'Find area: length 8cm, width 5cm', '40 cm²', 1),
    (area_rectangle_id, 'Find area: length 12m, width 7m', '84 m²', 1),
    (area_rectangle_id, 'Rectangle area is 48cm². Width is 6cm. Find length.', '8 cm', 2),
    (area_rectangle_id, 'Find area: length 15mm, width 9mm', '135 mm²', 1),
    (area_rectangle_id, 'Rectangle: length 2x, width 5. Area = 40. Find x.', '4', 3);

END $$;

-- Verify questions were added
SELECT 
  qb.category,
  qb.topic,
  qb.subtopic,
  COUNT(q.id) as question_count
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
GROUP BY qb.category, qb.topic, qb.subtopic
ORDER BY qb.category, qb.topic;
