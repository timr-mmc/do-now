-- ============================================
-- ALGEBRA STRAND - COMPREHENSIVE QUESTIONS PART 1
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Algebraic Expressions, Linear Equations
-- Total: ~280 questions across multiple subtopics

-- ============================================
-- ALGEBRAIC EXPRESSIONS
-- ============================================

-- Simplifying Expressions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $3x + 2x$', '$5x$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $5y - 2y$', '$3y$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $4a + 3a - 2a$', '$5a$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $7b - 3b + b$', '$5b$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $6m + 4m$', '$10m$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $3x + 4y + 2x$', '$5x + 4y$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $5a - 2b + 3a$', '$8a - 2b$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $7x + 3y - 4x$', '$3x + 3y$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $2x + 3x^2 + 5x$', '$3x^2 + 7x$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $8p - 3q - 2p + 5q$', '$6p + 2q$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $4x^2 + 3x - 2x^2 + 5x$', '$2x^2 + 8x$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $7ab - 3ab + 2a - 5a$', '$4ab - 3a$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $5x^2 + 3xy - 2x^2 + 4xy$', '$3x^2 + 7xy$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $3x \times 4x$', '$12x^2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $15x^2 \div 3x$', '$5x$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $8x^3 - 3x^2 + 5x - 2x^3 + x^2$', '$6x^3 - 2x^2 + 5x$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $6xy + 4x^2y - 3xy + 2x^2y$', '$3xy + 6x^2y$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $2x \times 3y \times 4$', '$24xy$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $\frac{12x^3y^2}{4xy}$', '$3x^2y$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Simplifying Expressions'), 'Simplify: $5a^2b - 3ab^2 + 2a^2b - 4ab^2$', '$7a^2b - 7ab^2$', 4);

-- Expanding Brackets - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $2(x + 3)$', '$2x + 6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $3(y + 4)$', '$3y + 12$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $5(a - 2)$', '$5a - 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $4(m + 1)$', '$4m + 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $6(p - 3)$', '$6p - 18$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $3(2x + 5)$', '$6x + 15$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $4(3a - 2)$', '$12a - 8$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $-2(x + 4)$', '$-2x - 8$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $-3(y - 5)$', '$-3y + 15$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $5(2m + 3)$', '$10m + 15$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $x(x + 5)$', '$x^2 + 5x$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $3y(2y - 4)$', '$6y^2 - 12y$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $3(x + 2) + 4(x - 1)$', '$7x + 2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $2a(3a + 5)$', '$6a^2 + 10a$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $5(y - 2) - 3(y + 1)$', '$2y - 13$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $-4x(2x - 3y)$', '$-8x^2 + 12xy$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $2(3x - 4) - 3(2x + 1)$', '$-7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $3ab(2a - 5b)$', '$6a^2b - 15ab^2$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $4(2x + 3) - 2(3x - 5) + 3x$', '$5x + 22$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $-2x(3x^2 - 4x + 5)$', '$-6x^3 + 8x^2 - 10x$', 4);

-- Factorising - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $6x + 12$', '$6(x + 2)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $10y - 15$', '$5(2y - 3)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $8a + 4$', '$4(2a + 1)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $3m - 9$', '$3(m - 3)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $5p + 20$', '$5(p + 4)$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $6x^2 + 9x$', '$3x(2x + 3)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $12y - 8y^2$', '$4y(3 - 2y)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $15a^2 - 10a$', '$5a(3a - 2)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $4x + 6y$', '$2(2x + 3y)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $21m - 14$', '$7(3m - 2)$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $12x^2 + 18xy$', '$6x(2x + 3y)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $15ab - 25a$', '$5a(3b - 5)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $8x^3 + 12x^2$', '$4x^2(2x + 3)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $20y^2 - 15y + 10$', '$5(4y^2 - 3y + 2)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $6a^2b + 9ab^2$', '$3ab(2a + 3b)$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $18x^3y - 24x^2y^2 + 12xy$', '$6xy(3x^2 - 4xy + 2)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $35a^2b^2 - 21ab^2$', '$7ab^2(5a - 3)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $16x^4 - 24x^3 + 8x^2$', '$8x^2(2x^2 - 3x + 1)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $45m^3n + 30m^2n^2 - 15mn$', '$15mn(3m^2 + 2mn - 1)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Factorising'), 'Factorise: $28x^2y^2 - 35xy^3 + 42xy$', '$7xy(4xy - 5y^2 + 6)$', 4);

-- Substitution - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 3$, find the value of $2x$', '$6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $y = 5$, find the value of $y + 4$', '$9$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $a = 2$, find the value of $3a$', '$6$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $m = 7$, find the value of $m - 3$', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $n = 4$, find the value of $5n$', '$20$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 3$, find the value of $x^2$', '$9$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $y = -2$, find the value of $3y + 5$', '$-1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $a = 4$, find the value of $2a - 3$', '$5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $p = 5$, find the value of $p^2 - 10$', '$15$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 6$, find the value of $\frac{x}{2} + 1$', '$4$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 3$ and $y = 5$, find the value of $2x + 3y$', '$21$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $a = -2$, find the value of $a^2 + 3a - 1$', '$-3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 4$ and $y = -1$, find the value of $xy + 2x$', '$4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $m = 5$, find the value of $3m^2 - 2m + 1$', '$66$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = 2$ and $y = 3$, find the value of $x^2 + y^2$', '$13$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = -3$, find the value of $2x^3 + 5x - 7$', '$-76$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $a = 2$ and $b = -3$, find the value of $a^2b + ab^2$', '$-30$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = -1$ and $y = 4$, find the value of $\frac{x^2 + y^2}{xy - 1}$', '$-\frac{17}{5}$ or $-3.4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $p = 3$ and $q = -2$, find the value of $p^3 - 2pq + q^2$', '$43$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Algebraic Expressions' AND subtopic = 'Substitution'), 'If $x = \frac{1}{2}$ and $y = -2$, find the value of $4x^2 - 3xy + y^2$', '$8$', 4);

-- ============================================
-- LINEAR EQUATIONS
-- ============================================

-- Solving One-Step Equations - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $x + 5 = 12$', '$x = 7$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $y - 3 = 8$', '$y = 11$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $a + 7 = 15$', '$a = 8$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $m - 4 = 6$', '$m = 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $p + 9 = 20$', '$p = 11$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $3x = 15$', '$x = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{y}{4} = 3$', '$y = 12$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $5a = 35$', '$a = 7$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{m}{2} = 8$', '$m = 16$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $7p = 42$', '$p = 6$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $x + 8 = -3$', '$x = -11$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $-4y = 24$', '$y = -6$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $a - 7 = -12$', '$a = -5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{x}{-3} = 5$', '$x = -15$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $-6m = -18$', '$m = 3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{2x}{3} = 10$', '$x = 15$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $-\frac{3y}{4} = 12$', '$y = -16$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{5a}{2} = -15$', '$a = -6$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $-\frac{7p}{5} = 14$', '$p = -10$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving One-Step Equations'), 'Solve: $\frac{4m}{-3} = 8$', '$m = -6$', 4);

-- Solving Two-Step Equations - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $2x + 3 = 11$', '$x = 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $3y - 5 = 10$', '$y = 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $4a + 7 = 19$', '$a = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $5m - 2 = 18$', '$m = 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $2p + 9 = 17$', '$p = 4$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{x}{2} + 3 = 8$', '$x = 10$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{y}{3} - 4 = 2$', '$y = 18$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $6a - 15 = 21$', '$a = 6$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $8m + 12 = 36$', '$m = 3$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{p}{4} + 5 = 9$', '$p = 16$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $3x - 7 = -16$', '$x = -3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{2y}{3} + 5 = 11$', '$y = 9$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $-4a + 9 = 1$', '$a = 2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{3m}{5} - 2 = 4$', '$m = 10$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $7 - 2p = -5$', '$p = 6$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{5x - 3}{2} = 11$', '$x = 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{2 - 3y}{4} = -5$', '$y = \frac{22}{3}$ or $7\frac{1}{3}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $-\frac{2a}{3} + 7 = 1$', '$a = 9$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $15 - \frac{4m}{5} = 7$', '$m = 10$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Two-Step Equations'), 'Solve: $\frac{3p + 8}{-2} = 7$', '$p = -\frac{22}{3}$ or $-7\frac{1}{3}$', 4);

-- Solving Multi-Step Equations - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $2x + 3x = 15$', '$x = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $5y - 2y = 12$', '$y = 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $4a + 2a - 6 = 12$', '$a = 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $7m - 3m + 8 = 16$', '$m = 2$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $3p + 2p - 7 = 18$', '$p = 5$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $3x + 7 = x + 15$', '$x = 4$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $5y - 4 = 2y + 11$', '$y = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $4a + 9 = 2a + 21$', '$a = 6$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $6m - 5 = 3m + 10$', '$m = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $7p + 2 = 4p + 17$', '$p = 5$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $2(x + 3) = 14$', '$x = 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $3(y - 2) = 15$', '$y = 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $4(2a + 1) = 36$', '$a = 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $5(m - 3) = 2m + 6$', '$m = 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $3(2p + 5) = 4p + 27$', '$p = 6$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $2(3x - 4) = 3(x + 2)$', '$x = \frac{14}{3}$ or $4\frac{2}{3}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $5(y + 2) - 3(y - 1) = 29$', '$y = 8$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $4(2a - 3) = 3(a + 4)$', '$a = \frac{24}{5}$ or $4.8$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $2(3m + 5) - 4(m - 2) = 34$', '$m = 8$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Solving Multi-Step Equations'), 'Solve: $\frac{3x + 5}{2} = \frac{2x - 1}{3}$', '$x = -17$', 4);

-- Equations with Brackets - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $2(x + 1) = 10$', '$x = 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(y - 2) = 9$', '$y = 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(a + 3) = 20$', '$a = 2$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $5(m - 1) = 15$', '$m = 4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $6(p + 2) = 30$', '$p = 3$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(x + 4) = 2x + 17$', '$x = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(y - 3) = y + 6$', '$y = 6$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $5(a + 2) = 3a + 24$', '$a = 7$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $2(3m + 1) = 4m + 12$', '$m = 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $7(p - 2) = 5p + 4$', '$p = 9$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(2x - 1) = 4(x + 2)$', '$x = \frac{11}{2}$ or $5.5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $5(y + 3) = 2(2y + 9)$', '$y = 3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(3a - 2) = 3(2a + 5)$', '$a = \frac{23}{6}$ or $3\frac{5}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $2(m + 5) + 3(m - 2) = 19$', '$m = 3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(2p - 3) - 3(p + 1) = 2$', '$p = 3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(2x - 5) - 2(3x - 7) = 1$', 'No solution (consistent)', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $5(y + 2) - 3(2y - 1) = 17$', '$y = 4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $2(3a + 4) = 3(2a - 1) + 17$', '$a = 4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(m - 3) + 2(3m + 5) = 5(2m - 1) + 1$', 'Infinitely many solutions', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(2p + 5) - 4(p - 2) = 2(p + 6) + 11$', 'Infinitely many solutions', 4);

-- Equations with Fractions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{x}{2} = 5$', '$x = 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{y}{3} = 4$', '$y = 12$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{a}{5} = 2$', '$a = 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{m}{4} = 7$', '$m = 28$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{p}{6} = 3$', '$p = 18$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{x}{2} + 3 = 8$', '$x = 10$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{y}{3} - 2 = 4$', '$y = 18$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{2a}{3} = 6$', '$a = 9$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{3m}{4} = 9$', '$m = 12$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{5p}{2} = 15$', '$p = 6$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{x + 3}{2} = 5$', '$x = 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{2y - 5}{3} = 3$', '$y = 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{3a + 4}{5} = 2$', '$a = 2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{x}{2} + \frac{x}{3} = 10$', '$x = 12$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{y}{4} - \frac{y}{6} = 2$', '$y = 24$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{2x + 3}{4} = \frac{x - 1}{2}$', '$x = -7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{3y - 2}{5} = \frac{2y + 1}{3}$', '$y = 11$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{a}{2} + \frac{a}{3} - \frac{a}{4} = 12$', '$a = 16$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{2m - 3}{3} - \frac{m + 1}{2} = 1$', '$m = 13$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Equations with Fractions'), 'Solve: $\frac{3p + 5}{4} + \frac{2p - 1}{3} = 4$', '$p = \frac{17}{17}$ or $1$', 4);

-- Rearranging Formulas - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $x$ the subject: $y = x + 5$', '$x = y - 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $a$ the subject: $b = a - 3$', '$a = b + 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $m$ the subject: $n = 2m$', '$m = \frac{n}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $p$ the subject: $q = \frac{p}{4}$', '$p = 4q$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $t$ the subject: $s = 3t$', '$t = \frac{s}{3}$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $x$ the subject: $y = 2x + 3$', '$x = \frac{y - 3}{2}$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $a$ the subject: $b = 3a - 5$', '$a = \frac{b + 5}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $m$ the subject: $n = \frac{m}{2} + 4$', '$m = 2(n - 4)$ or $m = 2n - 8$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $p$ the subject: $q = 5 - 2p$', '$p = \frac{5 - q}{2}$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $r$ the subject: $A = \pi r^2$', '$r = \sqrt{\frac{A}{\pi}}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $x$ the subject: $y = \frac{3x + 2}{5}$', '$x = \frac{5y - 2}{3}$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $a$ the subject: $b = \frac{2a - 3}{4}$', '$a = \frac{4b + 3}{2}$ or $a = 2b + \frac{3}{2}$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $h$ the subject: $A = \frac{1}{2}bh$', '$h = \frac{2A}{b}$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $u$ the subject: $v = u + at$', '$u = v - at$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $l$ the subject: $P = 2(l + w)$', '$l = \frac{P}{2} - w$ or $l = \frac{P - 2w}{2}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $x$ the subject: $y = \frac{2x + 3}{4x - 5}$', '$x = \frac{5y + 3}{4y - 2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $r$ the subject: $V = \frac{4}{3}\pi r^3$', '$r = \sqrt[3]{\frac{3V}{4\pi}}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $a$ the subject: $s = \frac{1}{2}(u + v)t$', 'Cannot make $a$ subject (not in formula)', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $t$ the subject: $s = ut + \frac{1}{2}at^2$', '$t = \frac{-u \pm \sqrt{u^2 + 2as}}{a}$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Linear Equations' AND subtopic = 'Rearranging Formulas'), 'Make $b$ the subject: $a = \frac{3b - c}{2b + c}$', '$b = \frac{c(a + 1)}{3 - 2a}$', 4);
