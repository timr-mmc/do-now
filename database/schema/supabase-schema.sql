-- =====================================================
-- DO-NOW DATABASE SCHEMA
-- Math practice question management system for teachers
-- =====================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- TABLES
-- =====================================================

-- Teacher Profiles (one per class)
CREATE TABLE profiles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  class_name TEXT NOT NULL,
  year_group TEXT,
  subject TEXT DEFAULT 'Mathematics',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Question Banks (curriculum organization)
CREATE TABLE question_banks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category TEXT NOT NULL, -- e.g., 'Number', 'Algebra', 'Geometry'
  topic TEXT NOT NULL, -- e.g., 'Rounding', 'Simplifying', 'Angles'
  subtopic TEXT NOT NULL, -- e.g., 'Round to 1 DP', 'Collecting Like Terms'
  description TEXT,
  difficulty_level INT CHECK (difficulty_level BETWEEN 1 AND 5),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(category, topic, subtopic)
);

-- Questions
CREATE TABLE questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  bank_id UUID REFERENCES question_banks(id) ON DELETE CASCADE NOT NULL,
  question_text TEXT NOT NULL,
  answer TEXT NOT NULL,
  difficulty INT CHECK (difficulty BETWEEN 1 AND 5),
  hint TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Do-Now Sessions (each display session)
CREATE TABLE do_now_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  session_date DATE DEFAULT CURRENT_DATE,
  title TEXT,
  show_answers BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Session Questions (tracks which questions used and results)
CREATE TABLE session_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID REFERENCES do_now_sessions(id) ON DELETE CASCADE NOT NULL,
  question_id UUID REFERENCES questions(id) ON DELETE CASCADE NOT NULL,
  bank_id UUID REFERENCES question_banks(id) ON DELETE CASCADE NOT NULL,
  question_order INT NOT NULL, -- 1-6 for display order
  proportion_correct DECIMAL(5,2) CHECK (proportion_correct BETWEEN 0 AND 100), -- 0.00 to 100.00 percentage
  total_students INT,
  students_correct INT,
  recorded_at TIMESTAMPTZ,
  UNIQUE(session_id, question_order)
);

-- Usage Statistics (aggregated by profile and question bank)
CREATE TABLE usage_stats (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  bank_id UUID REFERENCES question_banks(id) ON DELETE CASCADE NOT NULL,
  times_used INT DEFAULT 0,
  total_correct DECIMAL(5,2), -- Average proportion correct
  last_used_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(profile_id, bank_id)
);

-- Course Outlines (yearly planning)
CREATE TABLE course_outlines (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id UUID REFERENCES profiles(id) ON DELETE CASCADE NOT NULL,
  week_number INT NOT NULL CHECK (week_number > 0),
  start_date DATE,
  end_date DATE,
  topic TEXT NOT NULL,
  subtopics TEXT[],
  notes TEXT,
  completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(profile_id, week_number)
);

-- =====================================================
-- INDEXES for Performance
-- =====================================================

CREATE INDEX idx_profiles_user_id ON profiles(user_id);
CREATE INDEX idx_questions_bank_id ON questions(bank_id);
CREATE INDEX idx_do_now_sessions_profile_id ON do_now_sessions(profile_id);
CREATE INDEX idx_do_now_sessions_date ON do_now_sessions(session_date DESC);
CREATE INDEX idx_session_questions_session_id ON session_questions(session_id);
CREATE INDEX idx_session_questions_bank_id ON session_questions(bank_id);
CREATE INDEX idx_usage_stats_profile_bank ON usage_stats(profile_id, bank_id);
CREATE INDEX idx_course_outlines_profile ON course_outlines(profile_id);
CREATE INDEX idx_question_banks_category ON question_banks(category, topic);

-- =====================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- =====================================================

-- Enable RLS on all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE question_banks ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE do_now_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE session_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE usage_stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE course_outlines ENABLE ROW LEVEL SECURITY;

-- Profiles: Users can only see/edit their own profiles
CREATE POLICY "Users can view their own profiles"
  ON profiles FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own profiles"
  ON profiles FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own profiles"
  ON profiles FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own profiles"
  ON profiles FOR DELETE
  USING (auth.uid() = user_id);

-- Question Banks: Public read access (all teachers can see all banks)
CREATE POLICY "Anyone can view question banks"
  ON question_banks FOR SELECT
  TO authenticated
  USING (true);

-- Questions: Public read access
CREATE POLICY "Anyone can view questions"
  ON questions FOR SELECT
  TO authenticated
  USING (true);

-- Do-Now Sessions: Users can only see sessions for their profiles
CREATE POLICY "Users can view their own sessions"
  ON do_now_sessions FOR SELECT
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their own sessions"
  ON do_now_sessions FOR INSERT
  WITH CHECK (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their own sessions"
  ON do_now_sessions FOR UPDATE
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete their own sessions"
  ON do_now_sessions FOR DELETE
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

-- Session Questions: Access through session ownership
CREATE POLICY "Users can view their session questions"
  ON session_questions FOR SELECT
  USING (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their session questions"
  ON session_questions FOR INSERT
  WITH CHECK (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their session questions"
  ON session_questions FOR UPDATE
  USING (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete their session questions"
  ON session_questions FOR DELETE
  USING (
    session_id IN (
      SELECT s.id FROM do_now_sessions s
      INNER JOIN profiles p ON s.profile_id = p.id
      WHERE p.user_id = auth.uid()
    )
  );

-- Usage Stats: Users can only see their own stats
CREATE POLICY "Users can view their usage stats"
  ON usage_stats FOR SELECT
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their usage stats"
  ON usage_stats FOR INSERT
  WITH CHECK (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their usage stats"
  ON usage_stats FOR UPDATE
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

-- Course Outlines: Users can only see/edit their own outlines
CREATE POLICY "Users can view their course outlines"
  ON course_outlines FOR SELECT
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their course outlines"
  ON course_outlines FOR INSERT
  WITH CHECK (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their course outlines"
  ON course_outlines FOR UPDATE
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete their course outlines"
  ON course_outlines FOR DELETE
  USING (
    profile_id IN (
      SELECT id FROM profiles WHERE user_id = auth.uid()
    )
  );

-- =====================================================
-- FUNCTIONS & TRIGGERS
-- =====================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers for updated_at
CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_questions_updated_at
  BEFORE UPDATE ON questions
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_course_outlines_updated_at
  BEFORE UPDATE ON course_outlines
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Function to update usage stats when questions are used
CREATE OR REPLACE FUNCTION update_usage_stats()
RETURNS TRIGGER AS $$
BEGIN
  -- Only update when proportion_correct is recorded
  IF NEW.proportion_correct IS NOT NULL THEN
    INSERT INTO usage_stats (profile_id, bank_id, times_used, total_correct, last_used_at)
    SELECT 
      s.profile_id,
      NEW.bank_id,
      1,
      NEW.proportion_correct,
      NOW()
    FROM do_now_sessions s
    WHERE s.id = NEW.session_id
    ON CONFLICT (profile_id, bank_id)
    DO UPDATE SET
      times_used = usage_stats.times_used + 1,
      total_correct = ((usage_stats.total_correct * usage_stats.times_used) + NEW.proportion_correct) / (usage_stats.times_used + 1),
      last_used_at = NOW();
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to update usage stats
CREATE TRIGGER update_stats_on_question_result
  AFTER INSERT OR UPDATE OF proportion_correct ON session_questions
  FOR EACH ROW
  EXECUTE FUNCTION update_usage_stats();

-- =====================================================
-- SAMPLE DATA (Optional - for testing)
-- =====================================================

-- Insert sample question banks
INSERT INTO question_banks (category, topic, subtopic, description, difficulty_level) VALUES
  ('Number', 'Rounding', 'Round to 1 DP', 'Round decimal numbers to 1 decimal place', 2),
  ('Number', 'Rounding', 'Round to 2 DP', 'Round decimal numbers to 2 decimal places', 2),
  ('Number', 'Rounding', 'Round to nearest 10', 'Round whole numbers to the nearest 10', 1),
  ('Number', 'Rounding', 'Round to nearest 100', 'Round whole numbers to the nearest 100', 1),
  ('Algebra', 'Simplifying', 'Collecting Like Terms', 'Simplify expressions by collecting like terms', 2),
  ('Algebra', 'Simplifying', 'Multiplying Terms', 'Simplify expressions involving multiplication', 3),
  ('Algebra', 'Expanding', 'Single Brackets', 'Expand single brackets', 2),
  ('Algebra', 'Expanding', 'Double Brackets', 'Expand double brackets', 3),
  ('Algebra', 'Factorising', 'Common Factors', 'Factorise expressions with common factors', 3),
  ('Geometry', 'Angles', 'Angles on a Line', 'Find missing angles on a straight line', 2),
  ('Geometry', 'Angles', 'Angles in a Triangle', 'Find missing angles in triangles', 2),
  ('Geometry', 'Area', 'Area of Rectangle', 'Calculate area of rectangles', 1),
  ('Geometry', 'Area', 'Area of Triangle', 'Calculate area of triangles', 2),
  ('Fractions', 'Operations', 'Adding Fractions', 'Add fractions with different denominators', 3),
  ('Fractions', 'Operations', 'Multiplying Fractions', 'Multiply fractions', 2),
  ('Percentages', 'Calculations', 'Percentage of Amount', 'Find percentage of a given amount', 2),
  ('Percentages', 'Calculations', 'Percentage Increase', 'Calculate percentage increase', 3),
  ('Ratio', 'Simplifying', 'Simplify Ratios', 'Simplify ratios to simplest form', 2),
  ('Ratio', 'Sharing', 'Sharing in Ratios', 'Share amounts in given ratios', 3);

-- =====================================================
-- VIEWS (Helpful for analytics)
-- =====================================================

-- View: Profile performance summary
CREATE OR REPLACE VIEW profile_performance AS
SELECT 
  p.id AS profile_id,
  p.class_name,
  p.year_group,
  COUNT(DISTINCT s.id) AS total_sessions,
  COUNT(DISTINCT sq.id) AS total_questions_asked,
  AVG(sq.proportion_correct) AS average_accuracy,
  COUNT(DISTINCT sq.bank_id) AS unique_topics_covered,
  MAX(s.session_date) AS last_session_date
FROM profiles p
LEFT JOIN do_now_sessions s ON p.id = s.profile_id
LEFT JOIN session_questions sq ON s.id = sq.session_id
WHERE sq.proportion_correct IS NOT NULL
GROUP BY p.id, p.class_name, p.year_group;

-- View: Question bank usage across all profiles
CREATE OR REPLACE VIEW bank_usage_summary AS
SELECT 
  qb.id AS bank_id,
  qb.category,
  qb.topic,
  qb.subtopic,
  COUNT(DISTINCT us.profile_id) AS profiles_using,
  SUM(us.times_used) AS total_uses,
  AVG(us.total_correct) AS average_success_rate,
  COUNT(q.id) AS total_questions
FROM question_banks qb
LEFT JOIN usage_stats us ON qb.id = us.bank_id
LEFT JOIN questions q ON qb.id = q.bank_id
GROUP BY qb.id, qb.category, qb.topic, qb.subtopic;

-- =====================================================
-- GRANT PERMISSIONS
-- =====================================================

-- Ensure authenticated users can access views
GRANT SELECT ON profile_performance TO authenticated;
GRANT SELECT ON bank_usage_summary TO authenticated;

-- =====================================================
-- INSTRUCTIONS
-- =====================================================

-- To run this schema:
-- 1. Go to Supabase Dashboard → SQL Editor
-- 2. Copy and paste this entire file
-- 3. Click "Run" to execute
-- 4. Verify tables were created in Table Editor
--
-- Note: Sample data is included for testing.
-- You can remove the sample data section if you want to start fresh.
