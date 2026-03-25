-- ============================================
-- ALGEBRA QUESTION BANKS
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================

INSERT INTO question_banks (category, topic, subtopic) VALUES
-- Algebraic Expressions
('Algebra', 'Algebraic Expressions', 'Simplifying Expressions'),
('Algebra', 'Algebraic Expressions', 'Expanding Brackets'),
('Algebra', 'Algebraic Expressions', 'Factorising'),
('Algebra', 'Algebraic Expressions', 'Substitution'),

-- Linear Equations
('Algebra', 'Linear Equations', 'Solving One-Step Equations'),
('Algebra', 'Linear Equations', 'Solving Two-Step Equations'),
('Algebra', 'Linear Equations', 'Solving Multi-Step Equations'),
('Algebra', 'Linear Equations', 'Equations with Brackets'),
('Algebra', 'Linear Equations', 'Equations with Fractions'),
('Algebra', 'Linear Equations', 'Rearranging Formulas'),

-- Quadratic Equations
('Algebra', 'Quadratic Equations', 'Expanding Quadratic Expressions'),
('Algebra', 'Quadratic Equations', 'Factorising Quadratics'),
('Algebra', 'Quadratic Equations', 'Solving Quadratic Equations'),
('Algebra', 'Quadratic Equations', 'Difference of Two Squares'),

-- Simultaneous Equations
('Algebra', 'Simultaneous Equations', 'Elimination Method'),
('Algebra', 'Simultaneous Equations', 'Substitution Method'),

-- Inequalities
('Algebra', 'Inequalities', 'Solving Linear Inequalities'),
('Algebra', 'Inequalities', 'Representing Inequalities'),

-- Sequences
('Algebra', 'Sequences', 'Linear Sequences'),
('Algebra', 'Sequences', 'Quadratic Sequences'),
('Algebra', 'Sequences', 'Finding nth Term'),

-- Graphs and Functions
('Algebra', 'Graphs and Functions', 'Linear Graphs'),
('Algebra', 'Graphs and Functions', 'Gradient and y-intercept'),
('Algebra', 'Graphs and Functions', 'Parallel and Perpendicular Lines'),
('Algebra', 'Graphs and Functions', 'Quadratic Graphs'),
('Algebra', 'Graphs and Functions', 'Function Notation')
ON CONFLICT (category, topic, subtopic) DO NOTHING;
