-- =====================================================
-- TEST DATA: Historical Do-Now Sessions
-- Creates realistic historical data for testing spaced repetition
-- User: tim.rout@gmail.com
-- =====================================================

-- NOTE: Run this AFTER you have:
-- 1. Created an account with tim.rout@gmail.com
-- 2. Created at least one profile/class
-- 3. Run the spaced-repetition-enhancement.sql migration

-- =====================================================
-- STEP 1: Get the user_id and profile_id
-- =====================================================

DO $$
DECLARE
  v_user_id UUID;
  v_profile_id UUID;
  v_session_id UUID;
  v_question_id UUID;
  v_bank_id UUID;
  session_counter INT := 0;
BEGIN

-- Get user ID for tim.rout@gmail.com
SELECT id INTO v_user_id 
FROM auth.users 
WHERE email = 'tim.rout@gmail.com' 
LIMIT 1;

IF v_user_id IS NULL THEN
  RAISE EXCEPTION 'User tim.rout@gmail.com not found. Please create an account first.';
END IF;

-- Get first profile for this user (or create one if none exists)
SELECT id INTO v_profile_id 
FROM profiles 
WHERE user_id = v_user_id 
LIMIT 1;

IF v_profile_id IS NULL THEN
  -- Create a test profile
  INSERT INTO profiles (user_id, class_name, year_group, subject)
  VALUES (v_user_id, 'Year 10 Test Class', 'Year 10', 'Mathematics')
  RETURNING id INTO v_profile_id;
  
  RAISE NOTICE 'Created new profile: %', v_profile_id;
END IF;

RAISE NOTICE 'Using profile_id: %', v_profile_id;

-- =====================================================
-- STEP 2: Create Historical Sessions
-- Spread across different time periods for retrieval testing
-- =====================================================

-- SESSION 1: 1 day ago (Yesterday) - Good performance
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, show_answers, created_at)
VALUES (
  v_profile_id,
  CURRENT_DATE - INTERVAL '1 day',
  'Do-Now Session - Recent Practice',
  false,
  CURRENT_TIMESTAMP - INTERVAL '1 day'
)
RETURNING id INTO v_session_id;

-- Add 6 questions to this session with varying performance
-- Question 1: Number - Rounding (high performance)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Number' AND topic LIKE '%Round%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 82.5, 40, 33, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

-- Question 2: Algebra - Collecting Like Terms (medium performance)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Collect%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id OFFSET 1 LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 2, 67.5, 40, 27, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

-- Question 3: Algebra - Expanding Brackets (LOW performance - weak area)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Expand%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 3, 45.0, 40, 18, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

-- Question 4: Number - Percentages (good performance)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Number' AND topic LIKE '%Percent%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 4, 75.0, 40, 30, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

-- Question 5: Geometry - Angles (medium)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Geometry' AND topic LIKE '%Angle%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 5, 62.5, 40, 25, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

-- Question 6: Measurement - Area (good)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Measurement' AND topic LIKE '%Area%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 6, 77.5, 40, 31, CURRENT_TIMESTAMP - INTERVAL '1 day');
  END IF;
END IF;

RAISE NOTICE 'Session %: 1 day ago completed', session_counter;

-- SESSION 2: 2 days ago
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '2 days', 'Do-Now - Two Days Ago', CURRENT_TIMESTAMP - INTERVAL '2 days')
RETURNING id INTO v_session_id;

-- Add questions with varying performance
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Number' AND topic LIKE '%Fraction%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 70.0, 40, 28, CURRENT_TIMESTAMP - INTERVAL '2 days');
  END IF;
END IF;

SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Substitut%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 2, 65.0, 40, 26, CURRENT_TIMESTAMP - INTERVAL '2 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 2 days ago completed', session_counter;

-- SESSION 3: 7 days ago (1 week) - Critical for spaced repetition
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '7 days', 'Do-Now - One Week Ago', CURRENT_TIMESTAMP - INTERVAL '7 days')
RETURNING id INTO v_session_id;

-- Algebra - Solving Equations (LOW - weak area)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Solving%Equation%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 52.5, 40, 21, CURRENT_TIMESTAMP - INTERVAL '7 days');
  END IF;
END IF;

-- Number - Index Laws
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Number' AND topic LIKE '%Index%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 2, 58.0, 40, 23, CURRENT_TIMESTAMP - INTERVAL '7 days');
  END IF;
END IF;

-- Geometry - Pythagoras
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Geometry' AND topic LIKE '%Pythag%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 3, 73.0, 40, 29, CURRENT_TIMESTAMP - INTERVAL '7 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 7 days ago (1 week) completed', session_counter;

-- SESSION 4: 8 days ago
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '8 days', 'Do-Now Session 4', CURRENT_TIMESTAMP - INTERVAL '8 days')
RETURNING id INTO v_session_id;

SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Measurement' AND topic LIKE '%Volume%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 68.5, 40, 27, CURRENT_TIMESTAMP - INTERVAL '8 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 8 days ago completed', session_counter;

-- SESSION 5: 14 days ago (2 weeks)
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '14 days', 'Do-Now - Two Weeks Ago', CURRENT_TIMESTAMP - INTERVAL '14 days')
RETURNING id INTO v_session_id;

-- Number - Ratios
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Number' AND topic LIKE '%Ratio%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 71.0, 40, 28, CURRENT_TIMESTAMP - INTERVAL '14 days');
  END IF;
END IF;

-- Algebra - Factorizing (LOW - weak area)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Factor%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 2, 48.5, 40, 19, CURRENT_TIMESTAMP - INTERVAL '14 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 14 days ago (2 weeks) completed', session_counter;

-- SESSION 6: 21 days ago (3 weeks)
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '21 days', 'Do-Now - Three Weeks Ago', CURRENT_TIMESTAMP - INTERVAL '21 days')
RETURNING id INTO v_session_id;

SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Statistics' AND topic LIKE '%Mean%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 79.0, 40, 32, CURRENT_TIMESTAMP - INTERVAL '21 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 21 days ago completed', session_counter;

-- SESSION 7: 28 days ago (1 month) - Critical for long-term retrieval
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '28 days', 'Do-Now - One Month Ago', CURRENT_TIMESTAMP - INTERVAL '28 days')
RETURNING id INTO v_session_id;

-- Algebra - Linear Sequences
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Sequence%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 66.0, 40, 26, CURRENT_TIMESTAMP - INTERVAL '28 days');
  END IF;
END IF;

-- Measurement - Speed Distance Time
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Measurement' AND topic LIKE '%Speed%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 2, 72.5, 40, 29, CURRENT_TIMESTAMP - INTERVAL '28 days');
  END IF;
END IF;

-- Geometry - Angles in Triangles
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Geometry' AND topic LIKE '%Triangle%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 3, 81.0, 40, 32, CURRENT_TIMESTAMP - INTERVAL '28 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 28 days ago (1 month) completed', session_counter;

-- SESSION 8: 30 days ago
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '30 days', 'Do-Now - 30 Days Ago', CURRENT_TIMESTAMP - INTERVAL '30 days')
RETURNING id INTO v_session_id;

-- Probability - Calculating Probability (LOW - shows as weak)
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Probability' AND topic LIKE '%Calculating%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 55.0, 40, 22, CURRENT_TIMESTAMP - INTERVAL '30 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 30 days ago completed', session_counter;

-- SESSION 9: 35 days ago
session_counter := session_counter + 1;
INSERT INTO do_now_sessions (profile_id, session_date, title, created_at)
VALUES (v_profile_id, CURRENT_DATE - INTERVAL '35 days', 'Do-Now - 35 Days Ago', CURRENT_TIMESTAMP - INTERVAL '35 days')
RETURNING id INTO v_session_id;

-- Algebra - Equation of a Line
SELECT id INTO v_bank_id FROM question_banks WHERE category = 'Algebra' AND topic LIKE '%Equation%Line%' OR topic LIKE '%y=mx+c%' LIMIT 1;
IF v_bank_id IS NOT NULL THEN
  SELECT id INTO v_question_id FROM questions WHERE bank_id = v_bank_id LIMIT 1;
  IF v_question_id IS NOT NULL THEN
    INSERT INTO session_questions (session_id, question_id, bank_id, question_order, proportion_correct, total_students, students_correct, recorded_at)
    VALUES (v_session_id, v_question_id, v_bank_id, 1, 63.0, 40, 25, CURRENT_TIMESTAMP - INTERVAL '35 days');
  END IF;
END IF;

RAISE NOTICE 'Session %: 35 days ago completed', session_counter;

-- =====================================================
-- SUMMARY
-- =====================================================
RAISE NOTICE '========================================';
RAISE NOTICE 'Historical test data created successfully!';
RAISE NOTICE 'Total sessions created: %', session_counter;
RAISE NOTICE 'User: tim.rout@gmail.com';
RAISE NOTICE 'Profile ID: %', v_profile_id;
RAISE NOTICE '';
RAISE NOTICE 'Data distribution:';
RAISE NOTICE '- Recent (1-3 days ago): 2 sessions';
RAISE NOTICE '- Medium (5-10 days ago): 2 sessions';
RAISE NOTICE '- Long-term (20-35 days ago): 5 sessions';
RAISE NOTICE '';
RAISE NOTICE 'Weak topics (< 60%% performance):';
RAISE NOTICE '- Expanding Brackets: 45%%';
RAISE NOTICE '- Factorizing: 48.5%%';
RAISE NOTICE '- Solving Equations: 52.5%%';
RAISE NOTICE '- Probability: 55%%';
RAISE NOTICE '';
RAISE NOTICE 'Now visit /analytics/% to see the spaced repetition dashboard!', v_profile_id;
RAISE NOTICE '========================================';

END $$;
