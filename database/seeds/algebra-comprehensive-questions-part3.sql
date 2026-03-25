-- ============================================
-- ALGEBRA STRAND - COMPREHENSIVE QUESTIONS PART 3
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Sequences, Graphs and Functions
-- Total: ~160 questions

-- ============================================
-- SEQUENCES
-- ============================================

-- Linear Sequences - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $3, 5, 7, 9, ...$', '$11$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $10, 15, 20, 25, ...$', '$30$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $4, 8, 12, 16, ...$', '$20$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $1, 4, 7, 10, ...$', '$13$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $2, 5, 8, 11, ...$', '$14$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 10th term: $2, 5, 8, 11, ...$', '$29$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 8th term: $3, 7, 11, 15, ...$', '$31$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'What is the common difference: $5, 12, 19, 26, ...$', '$7$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 6th term: $1, 6, 11, 16, ...$', '$26$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the missing term: $4, 9, __, 19, 24$', '$14$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 20th term: $3, 7, 11, 15, ...$', '$79$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The nth term is $3n + 2$. Find the 15th term.', '$47$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The nth term is $5n - 3$. Find the 12th term.', '$57$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Which term equals 47 in the sequence: $3, 7, 11, 15, ...$?', '$12$th term', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 50th term: $1, 4, 7, 10, ...$', '$148$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The 5th term is 23 and the 8th term is 35. Find the first term.', '$7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The 3rd term is 14 and the common difference is 5. Find the 20th term.', '$99$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Which term equals 100 in: $2, 7, 12, 17, ...$?', '$20$th term', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The sum of the first 3 terms is 18 and common difference is 3. Find the first term.', '$4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'The 10th term is 47 and the 15th term is 72. Find the common difference.', '$5$', 4);

-- Quadratic Sequences - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the next term: $1, 4, 9, 16, 25, ...$', '$36$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the next term: $0, 1, 4, 9, 16, ...$', '$25$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the next term: $2, 8, 18, 32, 50, ...$', '$72$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'What type of sequence is: $1, 4, 9, 16, 25, ...$', 'Square numbers (quadratic)', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the next term: $1, 5, 11, 19, 29, ...$', '$41$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the 6th term: $1, 4, 9, 16, 25, ...$', '$36$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the first differences: $3, 5, 9, 15, 23, ...$', '$2, 4, 6, 8, ...$ (increasing by 2)', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the second difference: $2, 5, 10, 17, 26, ...$', '$2$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the next term: $0, 3, 8, 15, 24, ...$', '$35$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the 7th term: $2, 8, 18, 32, 50, ...$', '$98$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'The nth term is $n^2 + 1$. Find the 10th term.', '$101$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'The nth term is $2n^2$. Find the 8th term.', '$128$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the 12th term: $1, 5, 11, 19, 29, ...$', '$145$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'The nth term is $n^2 - 2n$. Find the 9th term.', '$63$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Which term equals 49 in: $1, 4, 9, 16, 25, ...$?', '$7$th term', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the nth term formula: $3, 8, 15, 24, 35, ...$', '$n^2 + 2n$ or $n(n + 2)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the nth term formula: $2, 5, 10, 17, 26, ...$', '$n^2 + 1$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Find the nth term formula: $0, 3, 8, 15, 24, ...$', '$n^2 - 1$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'The nth term is $3n^2 - 2n + 1$. Find the 5th term.', '$66$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Quadratic Sequences'), 'Which term equals 101 in the sequence with nth term $n^2 + 1$?', '$10$th term', 4);

-- Finding nth Term - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $2, 4, 6, 8, ...$', '$2n$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $5, 10, 15, 20, ...$', '$5n$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $3, 6, 9, 12, ...$', '$3n$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $1, 2, 3, 4, ...$', '$n$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $10, 20, 30, 40, ...$', '$10n$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $3, 5, 7, 9, ...$', '$2n + 1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $4, 7, 10, 13, ...$', '$3n + 1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $1, 6, 11, 16, ...$', '$5n - 4$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $6, 11, 16, 21, ...$', '$5n + 1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $0, 3, 6, 9, ...$', '$3n - 3$ or $3(n - 1)$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $5, 8, 11, 14, ...$', '$3n + 2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $-1, 2, 5, 8, ...$', '$3n - 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $2, 9, 16, 23, ...$', '$7n - 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $11, 8, 5, 2, ...$', '$14 - 3n$ or $-3n + 14$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $1, 5, 9, 13, ...$', '$4n - 3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $-5, -1, 3, 7, ...$', '$4n - 9$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $20, 17, 14, 11, ...$', '$23 - 3n$ or $-3n + 23$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $\frac{1}{2}, 1, \frac{3}{2}, 2, ...$', '$\frac{n}{2}$ or $0.5n$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $-3, 1, 5, 9, ...$', '$4n - 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Sequences' AND subtopic = 'Finding nth Term'), 'Find the nth term: $15, 11, 7, 3, ...$', '$19 - 4n$ or $-4n + 19$', 4);

-- ============================================
-- GRAPHS AND FUNCTIONS
-- ============================================

-- Linear Graphs - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'What is the y-intercept of $y = x + 3$?', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'What is the y-intercept of $y = x - 5$?', '$-5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'What is the gradient of $y = 2x + 1$?', '$2$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'What is the gradient of $y = 5x - 3$?', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Complete: The line $y = x$ passes through the origin and has gradient __', '$1$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the gradient and y-intercept: $y = 3x + 7$', 'Gradient $= 3$, y-intercept $= 7$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the gradient and y-intercept: $y = -2x + 5$', 'Gradient $= -2$, y-intercept $= 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'What is the equation of a line with gradient 4 and y-intercept 2?', '$y = 4x + 2$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find $y$ when $x = 3$ for $y = 2x + 5$', '$11$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find $x$ when $y = 10$ for $y = 2x + 4$', '$x = 3$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the equation passing through $(0, 3)$ with gradient 2', '$y = 2x + 3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the gradient of the line through $(1, 3)$ and $(4, 9)$', '$2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the equation of the line through $(2, 5)$ and $(4, 11)$', '$y = 3x - 1$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'At what point does $y = 2x + 3$ cross the x-axis?', '$(-1.5, 0)$ or $(-\frac{3}{2}, 0)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Write $2x + 3y = 12$ in the form $y = mx + c$', '$y = -\frac{2}{3}x + 4$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the equation through $(3, 7)$ with gradient $-2$', '$y = -2x + 13$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find where $y = 2x + 3$ and $y = -x + 9$ intersect', '$(2, 7)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the equation through $(-1, 4)$ and $(3, 12)$', '$y = 2x + 6$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Write $5x - 2y = 10$ in the form $y = mx + c$', '$y = \frac{5}{2}x - 5$ or $y = 2.5x - 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Linear Graphs'), 'Find the x and y intercepts of $3x + 4y = 24$', 'x-intercept: $(8, 0)$, y-intercept: $(0, 6)$', 4);

-- Gradient and y-intercept - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient of $y = 3x$?', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the y-intercept of $y = x + 7$?', '$7$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient of $y = -x + 2$?', '$-1$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the y-intercept of $y = 2x - 4$?', '$-4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'A line passes through $(0, 5)$. What is its y-intercept?', '$5$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the gradient: rise $= 6$, run $= 2$', '$3$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the gradient: rise $= 10$, run $= 5$', '$2$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient between $(0, 0)$ and $(4, 8)$?', '$2$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient between $(1, 2)$ and $(3, 8)$?', '$3$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'A line has gradient 5 and passes through $(0, -3)$. Find its equation.', '$y = 5x - 3$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the gradient between $(2, 5)$ and $(6, 13)$', '$2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the gradient between $(-1, 4)$ and $(3, 12)$', '$2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'A line passes through $(0, 3)$ and $(4, 11)$. Find its equation.', '$y = 2x + 3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the gradient: $\frac{\text{change in } y}{\text{change in } x} = \frac{-6}{3}$', '$-2$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient of the line $3x + y = 5$?', '$-3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find gradient between $(5, 7)$ and $(1, -1)$', '$2$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find gradient between $(-2, -3)$ and $(4, 9)$', '$2$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'A line passes through $(2, 7)$ with gradient $-3$. Find the y-intercept.', '$13$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'What is the gradient of $2x - 5y = 10$?', '$\frac{2}{5}$ or $0.4$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Gradient and y-intercept'), 'Find the equation through $(3, -2)$ with gradient $\frac{1}{2}$', '$y = \frac{1}{2}x - \frac{7}{2}$ or $y = 0.5x - 3.5$', 4);

-- Parallel and Perpendicular Lines - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient of a line parallel to $y = 3x + 2$?', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient of a line parallel to $y = -2x + 5$?', '$-2$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient of a line parallel to $y = 4x - 1$?', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Parallel lines have the __ gradient', 'same', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient of a line parallel to $y = x + 3$?', '$1$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find the equation parallel to $y = 2x + 3$ through $(0, 5)$', '$y = 2x + 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find the equation parallel to $y = -x + 2$ through $(0, 7)$', '$y = -x + 7$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Are $y = 3x + 1$ and $y = 3x - 4$ parallel?', 'Yes', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Are $y = 2x + 5$ and $y = -2x + 5$ parallel?', 'No', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient perpendicular to gradient 2?', '$-\frac{1}{2}$ or $-0.5$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find the equation parallel to $y = 3x + 1$ through $(2, 5)$', '$y = 3x - 1$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient perpendicular to $y = 4x + 3$?', '$-\frac{1}{4}$ or $-0.25$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'What is the gradient perpendicular to $y = -\frac{1}{3}x + 2$?', '$3$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find equation perpendicular to $y = 2x + 1$ through $(0, 4)$', '$y = -\frac{1}{2}x + 4$ or $y = -0.5x + 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Are $y = 2x + 1$ and $y = -\frac{1}{2}x + 3$ perpendicular?', 'Yes', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find equation parallel to $y = -2x + 5$ through $(3, 1)$', '$y = -2x + 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find equation perpendicular to $y = 3x - 2$ through $(6, 4)$', '$y = -\frac{1}{3}x + 6$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find equation parallel to $2x + 3y = 12$ through $(0, 5)$', '$y = -\frac{2}{3}x + 5$ or $2x + 3y = 15$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Find equation perpendicular to $x + 2y = 8$ through $(4, 3)$', '$y = 2x - 5$ or $2x - y = 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Parallel and Perpendicular Lines'), 'Are $3x + 2y = 6$ and $2x - 3y = 9$ perpendicular?', 'Yes', 4);

-- Quadratic Graphs - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What shape is the graph of $y = x^2$?', 'Parabola (U-shape)', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What is the minimum value of $y = x^2$?', '$0$ (at $x = 0$)', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Where does $y = x^2$ cross the y-axis?', '$(0, 0)$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find $y$ when $x = 2$ for $y = x^2$', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find $y$ when $x = -3$ for $y = x^2$', '$9$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What is the y-intercept of $y = x^2 + 3$?', '$(0, 3)$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What is the minimum value of $y = x^2 - 4$?', '$-4$ (at $x = 0$)', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find $y$ when $x = 3$ for $y = x^2 + 2$', '$11$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Does $y = x^2 + 5$ have a maximum or minimum?', 'Minimum', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Where is the vertex of $y = x^2$?', '$(0, 0)$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Where does $y = x^2 - 9$ cross the x-axis?', '$(-3, 0)$ and $(3, 0)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find the vertex of $y = (x - 2)^2$', '$(2, 0)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find the vertex of $y = x^2 + 4x + 4$', '$(-2, 0)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Where does $y = x^2 - 5x + 6$ cross the x-axis?', '$(2, 0)$ and $(3, 0)$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What is the line of symmetry for $y = x^2 + 6x$?', '$x = -3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find the vertex of $y = x^2 - 4x + 3$', '$(2, -1)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Find the vertex of $y = 2x^2 + 8x + 5$', '$(-2, -3)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Where does $y = 2x^2 - 5x - 3$ cross the x-axis?', '$(-0.5, 0)$ and $(3, 0)$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'What is the maximum value of $y = -x^2 + 6x - 5$?', '$4$ (at $x = 3$)', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Quadratic Graphs'), 'Write $y = x^2 + 4x + 1$ in completed square form', '$y = (x + 2)^2 - 3$', 4);

-- Function Notation - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x + 3$, find $f(2)$', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 2x$, find $f(5)$', '$10$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x - 4$, find $f(7)$', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 3x$, find $f(4)$', '$12$', 1),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x + 1$, find $f(0)$', '$1$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 2x + 3$, find $f(4)$', '$11$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 3x - 5$, find $f(2)$', '$1$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2$, find $f(3)$', '$9$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2 + 1$, find $f(2)$', '$5$', 2),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 5x - 2$, find $f(-1)$', '$-7$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2 + 2x$, find $f(3)$', '$15$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 2x^2 - 3$, find $f(-2)$', '$5$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = (x + 1)^2$, find $f(4)$', '$25$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 3x + 2$ and $f(a) = 14$, find $a$', '$a = 4$', 3),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2 - 4x$, find $f(5)$', '$5$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2 + 3x - 1$, find $f(-2)$', '$-3$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 2x + 5$ and $g(x) = x^2$, find $f(g(3))$', '$23$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 3x - 2$ and $g(x) = x + 4$, find $g(f(2))$', '$8$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = x^2 + 1$ and $f(a) = 26$, find $a$', '$a = \pm 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Algebra' AND topic = 'Graphs and Functions' AND subtopic = 'Function Notation'), 'If $f(x) = 2x - 3$, find the inverse function $f^{-1}(x)$', '$f^{-1}(x) = \frac{x + 3}{2}$', 4);
