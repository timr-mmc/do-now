-- ============================================
-- ALGEBRA STRAND - COMPREHENSIVE QUESTIONS PART 2
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Quadratic Equations, Simultaneous Equations, Inequalities
-- Total: ~160 questions

-- ============================================
-- QUADRATIC EQUATIONS
-- ============================================

-- Expanding Quadratic Expressions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(x + 2)(x + 3)$', '$x^2 + 5x + 6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(y + 1)(y + 4)$', '$y^2 + 5y + 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(a + 5)(a + 2)$', '$a^2 + 7a + 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(m + 3)(m + 3)$', '$m^2 + 6m + 9$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(p + 1)(p + 7)$', '$p^2 + 8p + 7$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(x - 2)(x + 5)$', '$x^2 + 3x - 10$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(y + 3)(y - 4)$', '$y^2 - y - 12$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(a - 5)(a - 2)$', '$a^2 - 7a + 10$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(m + 6)(m - 3)$', '$m^2 + 3m - 18$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(p - 4)(p - 5)$', '$p^2 - 9p + 20$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(2x + 3)(x + 4)$', '$2x^2 + 11x + 12$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(3y - 2)(y + 5)$', '$3y^2 + 13y - 10$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(2a - 3)(3a + 4)$', '$6a^2 - a - 12$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(4m + 1)(2m - 3)$', '$8m^2 - 10m - 3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(5p - 2)(p + 3)$', '$5p^2 + 13p - 6$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(3x - 4)(2x - 5)$', '$6x^2 - 23x + 20$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(x + 3)^2$', '$x^2 + 6x + 9$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(2y - 5)^2$', '$4y^2 - 20y + 25$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(3a + 2)(3a - 2)$', '$9a^2 - 4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Expanding Quadratic Expressions'), 'Expand: $(x + 2)(x - 2)(x + 3)$', '$x^3 + 3x^2 - 4x - 12$', 4);

-- Factorising Quadratics - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $x^2 + 5x + 6$', '$(x + 2)(x + 3)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $y^2 + 7y + 10$', '$(y + 2)(y + 5)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $a^2 + 8a + 12$', '$(a + 2)(a + 6)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $m^2 + 9m + 20$', '$(m + 4)(m + 5)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $p^2 + 6p + 8$', '$(p + 2)(p + 4)$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $x^2 + 3x - 10$', '$(x - 2)(x + 5)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $y^2 - y - 12$', '$(y + 3)(y - 4)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $a^2 - 7a + 10$', '$(a - 2)(a - 5)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $m^2 + 3m - 18$', '$(m - 3)(m + 6)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $p^2 - 9p + 20$', '$(p - 4)(p - 5)$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $2x^2 + 7x + 3$', '$(2x + 1)(x + 3)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $3y^2 + 10y + 8$', '$(3y + 4)(y + 2)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $2a^2 - 5a - 3$', '$(2a + 1)(a - 3)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $3m^2 - 13m + 4$', '$(3m - 1)(m - 4)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $5p^2 + 13p - 6$', '$(5p - 2)(p + 3)$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $6x^2 - 23x + 20$', '$(3x - 4)(2x - 5)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $4y^2 - 20y + 25$', '$(2y - 5)^2$ or $(2y - 5)(2y - 5)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $x^2 + 6x + 9$', '$(x + 3)^2$ or $(x + 3)(x + 3)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $4a^2 - 25$', '$(2a - 5)(2a + 5)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Factorising Quadratics'), 'Factorise: $6m^2 + 19m + 10$', '$(2m + 5)(3m + 2)$', 4);

-- Solving Quadratic Equations - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $x^2 = 16$', '$x = \pm 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $y^2 = 25$', '$y = \pm 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $a^2 = 36$', '$a = \pm 6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $m^2 = 49$', '$m = \pm 7$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $p^2 = 100$', '$p = \pm 10$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $x^2 - 9 = 0$', '$x = \pm 3$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $y^2 - 16 = 0$', '$y = \pm 4$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $2a^2 = 50$', '$a = \pm 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $3m^2 = 75$', '$m = \pm 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve: $4p^2 - 64 = 0$', '$p = \pm 4$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $x^2 + 5x + 6 = 0$', '$x = -2$ or $x = -3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $y^2 - 7y + 10 = 0$', '$y = 2$ or $y = 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $a^2 + 3a - 10 = 0$', '$a = -5$ or $a = 2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $m^2 - 4m - 12 = 0$', '$m = -2$ or $m = 6$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $p^2 - p - 20 = 0$', '$p = -4$ or $p = 5$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $2x^2 + 7x + 3 = 0$', '$x = -\frac{1}{2}$ or $x = -3$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $3y^2 - 13y + 4 = 0$', '$y = \frac{1}{3}$ or $y = 4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve by factorising: $x^2 + 6x + 9 = 0$', '$x = -3$ (repeated root)', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve using the quadratic formula: $x^2 + 3x - 2 = 0$', '$x = \frac{-3 \pm \sqrt{17}}{2}$ or $x \approx 0.56, -3.56$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Solving Quadratic Equations'), 'Solve using the quadratic formula: $2x^2 - 5x + 1 = 0$', '$x = \frac{5 \pm \sqrt{17}}{4}$ or $x \approx 2.28, 0.22$', 4);

-- Difference of Two Squares - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $x^2 - 9$', '$(x - 3)(x + 3)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $y^2 - 16$', '$(y - 4)(y + 4)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $a^2 - 25$', '$(a - 5)(a + 5)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $m^2 - 36$', '$(m - 6)(m + 6)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $p^2 - 49$', '$(p - 7)(p + 7)$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $x^2 - 1$', '$(x - 1)(x + 1)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $4y^2 - 1$', '$(2y - 1)(2y + 1)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $9a^2 - 4$', '$(3a - 2)(3a + 2)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $16m^2 - 25$', '$(4m - 5)(4m + 5)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $25p^2 - 36$', '$(5p - 6)(5p + 6)$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $x^2 - y^2$', '$(x - y)(x + y)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $4a^2 - 9b^2$', '$(2a - 3b)(2a + 3b)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $25x^2 - y^2$', '$(5x - y)(5x + y)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $x^2 - 100$', '$(x - 10)(x + 10)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $49m^2 - 64n^2$', '$(7m - 8n)(7m + 8n)$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise completely: $3x^2 - 75$', '$3(x - 5)(x + 5)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise completely: $2y^2 - 98$', '$2(y - 7)(y + 7)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise completely: $5a^2 - 20$', '$5(a - 2)(a + 2)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $x^4 - 16$', '$(x^2 - 4)(x^2 + 4)$ or $(x - 2)(x + 2)(x^2 + 4)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Quadratic Equations' AND subtopic = 'Difference of Two Squares'), 'Factorise: $(x + y)^2 - 9$', '$(x + y - 3)(x + y + 3)$', 4);

-- ============================================
-- SIMULTANEOUS EQUATIONS
-- ============================================

-- Elimination Method - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $x + y = 5$ and $x - y = 1$', '$x = 3, y = 2$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $a + b = 8$ and $a - b = 2$', '$a = 5, b = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $m + n = 10$ and $m - n = 4$', '$m = 7, n = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $p + q = 12$ and $p - q = 6$', '$p = 9, q = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $s + t = 7$ and $s - t = 3$', '$s = 5, t = 2$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $2x + y = 11$ and $x + y = 7$', '$x = 4, y = 3$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $3a + b = 14$ and $2a + b = 10$', '$a = 4, b = 2$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $x + 2y = 13$ and $x + y = 8$', '$x = 3, y = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $4m + n = 17$ and $3m + n = 13$', '$m = 4, n = 1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $2p + 3q = 16$ and $2p + q = 10$', '$p = 2, q = 4$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $2x + 3y = 16$ and $3x - y = 1$', '$x = 1, y = \frac{14}{3}$ or $x = 1, y = 4\frac{2}{3}$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $3a + 2b = 19$ and $2a - b = 1$', '$a = 3, b = 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $2x + y = 12$ and $3x - 2y = 5$', '$x = \frac{29}{7}, y = \frac{26}{7}$ or $x \approx 4.14, y \approx 3.71$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $4m + 3n = 33$ and $2m - n = 1$', '$m = 3, n = 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $5p + 2q = 29$ and $3p + q = 16$', '$p = 3, q = 7$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $3x + 4y = 25$ and $5x - 2y = 13$', '$x = 3, y = 4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $2a + 5b = 31$ and $3a - 2b = 8$', '$a = 6, b = \frac{19}{5}$ or $a = 6, b = 3.8$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $7x + 3y = 45$ and $4x - 5y = 2$', '$x = 6, y = 1$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $3m + 7n = 41$ and $5m - 2n = 12$', '$m = 4, n = \frac{29}{41}$ or $m \approx 4.89, n \approx 2.24$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Elimination Method'), 'Solve: $4p - 3q = 14$ and $7p + 2q = 53$', '$p = 5, q = 2$', 4);

-- Substitution Method - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = 2x$ and $x + y = 9$', '$x = 3, y = 6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $b = 3a$ and $a + b = 12$', '$a = 3, b = 9$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $n = 2m$ and $m + n = 15$', '$m = 5, n = 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $q = 4p$ and $p + q = 20$', '$p = 4, q = 16$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $t = s + 3$ and $s + t = 11$', '$s = 4, t = 7$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = x + 2$ and $2x + y = 11$', '$x = 3, y = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $b = 2a - 1$ and $3a + b = 14$', '$a = 3, b = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $n = 3m + 2$ and $2m + n = 17$', '$m = 3, n = 11$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $q = 2p + 3$ and $p + 2q = 18$', '$p = 2.4, q = 7.8$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = 3x - 4$ and $x + y = 12$', '$x = 4, y = 8$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = 2x + 1$ and $3x + 2y = 23$', '$x = 3, y = 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $b = 3a - 5$ and $2a + 3b = 26$', '$a = \frac{41}{11}, b = \frac{68}{11}$ or $a \approx 3.73, b \approx 6.18$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $n = 5m - 2$ and $4m + 3n = 42$', '$m = \frac{48}{19}, n = \frac{202}{19}$ or $m \approx 2.53, n \approx 10.63$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = \frac{x}{2} + 3$ and $2x + y = 21$', '$x = 6, y = 6$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $a = 4b + 1$ and $3a - 5b = 18$', '$b = 3, a = 13$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = x^2 + 1$ and $y = 2x + 3$', '$x = -1, y = 2$ or $x = 2, y = 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $b = a^2 - 4$ and $b = 2a - 1$', '$a = 1, b = -3$ or $a = 3, b = 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = x^2$ and $y = x + 6$', '$x = -2, y = 4$ or $x = 3, y = 9$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $q = p^2 + 3p$ and $q = 2p + 8$', '$p = -2, q = 4$ or $p = 2.5, q = 13$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Simultaneous Equations' AND subtopic = 'Substitution Method'), 'Solve: $y = 2x^2 - 3$ and $y = 4x + 1$', '$x = -0.5, y = -1$ or $x = 2, y = 9$', 4);

-- ============================================
-- INEQUALITIES
-- ============================================

-- Solving Linear Inequalities - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $x + 3 > 7$', '$x > 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $y - 2 < 5$', '$y < 7$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $a + 5 \geq 10$', '$a \geq 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $m - 4 \leq 8$', '$m \leq 12$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $p + 6 > 15$', '$p > 9$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $2x < 10$', '$x < 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $3y \geq 15$', '$y \geq 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $\frac{a}{2} > 4$', '$a > 8$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $\frac{m}{3} \leq 5$', '$m \leq 15$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $4p > 24$', '$p > 6$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $2x + 3 < 11$', '$x < 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $3y - 5 \geq 10$', '$y \geq 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $5a + 7 > 27$', '$a > 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $\frac{x}{2} + 3 \leq 8$', '$x \leq 10$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $-2x > 8$', '$x < -4$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $3(x - 2) < 15$', '$x < 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $2(y + 3) \geq 5y - 9$', '$y \leq 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $\frac{2a - 3}{4} > 2$', '$a > 5.5$ or $a > \frac{11}{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $5 - 2m < 3m + 15$', '$m > -2$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Solving Linear Inequalities'), 'Solve: $\frac{3p + 5}{2} \leq \frac{2p - 1}{3}$', '$p \leq -\frac{17}{5}$ or $p \leq -3.4$', 4);

-- Representing Inequalities - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $x$ is greater than 5', '$x > 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $y$ is less than 8', '$y < 8$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $a$ is at least 10', '$a \geq 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $m$ is at most 15', '$m \leq 15$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $p$ is not more than 12', '$p \leq 12$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Which integer values satisfy: $2 < x \leq 6$?', '$x = 3, 4, 5, 6$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Which integer values satisfy: $-3 \leq y < 2$?', '$y = -3, -2, -1, 0, 1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality for: $x$ is between 4 and 9', '$4 < x < 9$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Represent on a number line: $x \geq 3$', 'Solid circle at 3, shading to the right', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Represent on a number line: $x < -2$', 'Open circle at -2, shading to the left', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality: $x$ is more than 3 but no more than 8', '$3 < x \leq 8$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'How many integer values satisfy: $-5 < x < 5$?', '$9$ (values: $-4, -3, ..., 3, 4$)', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'A number $n$ is at least 7 more than $-3$. Write an inequality.', '$n \geq 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'The product $3x$ is less than 18. Write and solve.', '$3x < 18$, so $x < 6$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'List integers satisfying: $x^2 < 20$', '$-4, -3, -2, -1, 0, 1, 2, 3, 4$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Write an inequality: twice $x$ plus 5 is at most 17', '$2x + 5 \leq 17$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'The perimeter of a rectangle with width 4cm is less than 30cm. Write an inequality for length $l$.', '$2(l + 4) < 30$ or $l < 11$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Find the range of $x$ if $-2 \leq 3x - 5 < 10$', '$1 \leq x < 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'A taxi costs $\\$5$ plus $\\$2$ per km. Write an inequality if the fare is at most $\\$25$.', '$5 + 2k \leq 25$ or $k \leq 10$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Inequalities' AND subtopic = 'Representing Inequalities'), 'Solve and graph: $|x| < 3$', '$-3 < x < 3$', 4);
