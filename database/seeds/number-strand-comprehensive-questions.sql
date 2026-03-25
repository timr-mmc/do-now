-- ============================================
-- NUMBER STRAND - COMPREHENSIVE QUESTIONS PART 1
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Integers, Fractions, Decimals (Basic), Percentages, Ratios, Powers, Financial Mathematics (GST, Simple Interest)
-- Total: ~300 questions across multiple subtopics

-- ============================================
-- INTEGERS
-- ============================================

-- Integer Operations - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $3 + 5$', '$8$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $10 - 4$', '$6$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-2 + 7$', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $8 - 12$', '$-4$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-3 + (-5)$', '$-8$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-15 + 23$', '$8$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-8 - (-12)$', '$4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $3 \times (-4)$', '$-12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-20 \div 5$', '$-4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(-2) \times (-6)$', '$12$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $15 - 8 + (-12)$', '$-5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $3 \times (4 - 9)$', '$-15$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(-18) \div (-3) + 7$', '$13$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $-5 \times 4 - 8$', '$-28$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(8 - 15) \times (6 - 10)$', '$28$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(-3)^2 - 4 \times (-2)$', '$17$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $\frac{-24 + 36}{-3}$', '$-4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(-2)^3 + (-3)^2 - 5$', '$-4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Evaluate: $5 - 3(2 - 7)$', '$20$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $\frac{(-4) \times 15}{-3} - 8$', '$12$', 4),

-- Additional 5 questions
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $(-5)^2 + (-4)^2$', '$41$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Simplify: $\frac{-36 - (-18)}{-6}$', '$3$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Evaluate: $(-2) \times (5 - 9) + 3^2$', '$17$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Calculate: $|{-15}| - |-8| + (-3)$', '$4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Integers' AND subtopic = 'Integer Operations'), 'Find the value: $\frac{(-7) \times 8 + 28}{-4}$', '$7$', 5);

-- ============================================
-- FRACTIONS
-- ============================================

-- Adding and Subtracting Fractions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{4} + \frac{1}{4}$', '$\frac{1}{2}$ or $\frac{2}{4}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{3}{5} - \frac{1}{5}$', '$\frac{2}{5}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{2}{3} + \frac{1}{3}$', '$1$ or $\frac{3}{3}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{8} - \frac{3}{8}$', '$\frac{1}{4}$ or $\frac{2}{8}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{2} + \frac{1}{2}$', '$1$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{2} + \frac{1}{4}$', '$\frac{3}{4}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{2}{3} - \frac{1}{6}$', '$\frac{1}{2}$ or $\frac{3}{6}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{3}{4} + \frac{1}{8}$', '$\frac{7}{8}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{6} - \frac{1}{3}$', '$\frac{1}{2}$ or $\frac{3}{6}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{3} + \frac{1}{6}$', '$\frac{1}{2}$ or $\frac{3}{6}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{2}{5} + \frac{3}{10}$', '$\frac{7}{10}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{6} - \frac{2}{9}$', '$\frac{11}{18}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{3}{4} + \frac{5}{12}$', '$\frac{7}{6}$ or $1\frac{1}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{7}{8} - \frac{1}{6}$', '$\frac{17}{24}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $1\frac{1}{2} + \frac{3}{4}$', '$2\frac{1}{4}$ or $\frac{9}{4}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $2\frac{3}{5} - 1\frac{2}{3}$', '$\frac{14}{15}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{6} + \frac{7}{9} - \frac{1}{2}$', '$\frac{19}{18}$ or $1\frac{1}{18}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $3\frac{1}{4} + 2\frac{5}{6}$', '$6\frac{1}{12}$ or $\frac{73}{12}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{11}{12} - \frac{3}{8} + \frac{1}{6}$', '$\frac{17}{24}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Simplify: $\frac{2}{3} + \frac{5}{12} - \frac{7}{18}$', '$\frac{25}{36}$', 4),

-- Additional 5 questions
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $4\frac{2}{3} - 1\frac{5}{6}$', '$2\frac{5}{6}$ or $\frac{17}{6}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Evaluate: $\frac{7}{10} + \frac{3}{8} - \frac{1}{5}$', '$\frac{29}{40}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Simplify: $5\frac{1}{6} - 2\frac{7}{8}$', '$2\frac{7}{24}$ or $\frac{55}{24}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{7} - \frac{2}{9} + \frac{1}{3}$', '$\frac{52}{63}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Evaluate: $2\frac{3}{8} + 1\frac{5}{12} - \frac{7}{24}$', '$3\frac{13}{24}$ or $\frac{85}{24}$', 5);

-- Multiplying and Dividing Fractions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{1}{2} \times \frac{1}{3}$', '$\frac{1}{6}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{2}{3} \times 3$', '$2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{1}{4} \times \frac{1}{2}$', '$\frac{1}{8}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{3}{4} \times 4$', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{1}{2} \div 2$', '$\frac{1}{4}$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{2}{5} \times \frac{3}{4}$', '$\frac{3}{10}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{3}{4} \div \frac{1}{2}$', '$\frac{3}{2}$ or $1\frac{1}{2}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{5}{6} \times \frac{2}{3}$', '$\frac{5}{9}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{2}{3} \div \frac{1}{6}$', '$4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{4}{5} \times \frac{5}{8}$', '$\frac{1}{2}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{7}{8} \div \frac{3}{4}$', '$\frac{7}{6}$ or $1\frac{1}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $2\frac{1}{2} \times \frac{2}{5}$', '$1$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{5}{6} \times \frac{9}{10}$', '$\frac{3}{4}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{8}{9} \div \frac{2}{3}$', '$\frac{4}{3}$ or $1\frac{1}{3}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $1\frac{2}{3} \times \frac{3}{5}$', '$1$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $2\frac{1}{4} \div 1\frac{1}{2}$', '$\frac{3}{2}$ or $1\frac{1}{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{7}{12} \times \frac{8}{21} \div \frac{2}{9}$', '$1$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $3\frac{1}{3} \times 2\frac{1}{4}$', '$7\frac{1}{2}$ or $\frac{15}{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{15}{16} \div \frac{5}{12}$', '$\frac{9}{4}$ or $2\frac{1}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Evaluate: $\left(\frac{2}{3}\right)^2 \div \frac{8}{27}$', '$\frac{3}{2}$ or $1\frac{1}{2}$', 4),

-- Additional 5 questions
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{7}{8} \times \frac{4}{5} \div \frac{2}{3}$', '$\frac{21}{20}$ or $1\frac{1}{20}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Simplify: $2\frac{2}{3} \times 1\frac{1}{8}$', '$3$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{15}{16} \div \frac{5}{12}$', '$\frac{9}{4}$ or $2\frac{1}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Evaluate: $3\frac{3}{5} \div 1\frac{4}{5}$', '$2$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{2}{3} \times \frac{9}{10} \times \frac{5}{6}$', '$\frac{1}{2}$', 5);

-- Equivalent Fractions and Simplification - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{2}{4}$', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{3}{6}$', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Find an equivalent fraction: $\frac{1}{3} = \frac{?}{6}$', '$\frac{2}{6}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{4}{8}$', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Find an equivalent fraction: $\frac{2}{5} = \frac{?}{10}$', '$\frac{4}{10}$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{6}{9}$', '$\frac{2}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{8}{12}$', '$\frac{2}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Find an equivalent fraction: $\frac{3}{4} = \frac{?}{20}$', '$\frac{15}{20}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{15}{20}$', '$\frac{3}{4}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{10}{15}$', '$\frac{2}{3}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{18}{24}$', '$\frac{3}{4}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{35}{42}$', '$\frac{5}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Express $\frac{7}{12}$ with denominator $36$', '$\frac{21}{36}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{48}{64}$', '$\frac{3}{4}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{27}{36}$', '$\frac{3}{4}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{72}{96}$', '$\frac{3}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{84}{126}$', '$\frac{2}{3}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Express $\frac{11}{15}$ with denominator $45$', '$\frac{33}{45}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{135}{180}$', '$\frac{3}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{98}{112}$', '$\frac{7}{8}$', 4),

-- Additional 5 questions
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{126}{189}$', '$\frac{2}{3}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Express $\frac{84}{144}$ in simplest form', '$\frac{7}{12}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{135}{225}$', '$\frac{3}{5}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Reduce to lowest terms: $\frac{288}{360}$', '$\frac{4}{5}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Equivalent Fractions and Simplification'), 'Simplify: $\frac{196}{294}$', '$\frac{2}{3}$', 5);

-- Comparing and Ordering Fractions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{1}{2}$ or $\frac{1}{4}$?', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{3}{5}$ or $\frac{2}{5}$?', '$\frac{3}{5}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is smaller: $\frac{1}{3}$ or $\frac{1}{2}$?', '$\frac{1}{3}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{2}{3}$ or $\frac{1}{3}$?', '$\frac{2}{3}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{3}{4}$ or $\frac{1}{2}$?', '$\frac{3}{4}$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{2}{3}$ or $\frac{3}{5}$?', '$\frac{2}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from smallest to largest: $\frac{1}{2}$, $\frac{1}{3}$, $\frac{2}{3}$', '$\frac{1}{3}$, $\frac{1}{2}$, $\frac{2}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{5}{6}$ or $\frac{7}{8}$?', '$\frac{7}{8}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is smaller: $\frac{3}{4}$ or $\frac{5}{6}$?', '$\frac{3}{4}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{4}{5}$ or $\frac{7}{10}$?', '$\frac{4}{5}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from smallest to largest: $\frac{5}{8}$, $\frac{2}{3}$, $\frac{7}{12}$', '$\frac{7}{12}$, $\frac{5}{8}$, $\frac{2}{3}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{7}{9}$ or $\frac{5}{6}$?', '$\frac{5}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from smallest to largest: $\frac{3}{5}$, $\frac{7}{10}$, $\frac{11}{15}$', '$\frac{3}{5}$, $\frac{7}{10}$, $\frac{11}{15}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{11}{12}$ or $\frac{17}{18}$?', '$\frac{17}{18}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is smaller: $\frac{8}{9}$ or $\frac{13}{15}$?', '$\frac{13}{15}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from smallest to largest: $\frac{13}{18}$, $\frac{17}{24}$, $\frac{11}{15}$', '$\frac{17}{24}$, $\frac{13}{18}$, $\frac{11}{15}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{23}{30}$ or $\frac{19}{24}$?', '$\frac{19}{24}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from largest to smallest: $\frac{31}{36}$, $\frac{25}{30}$, $\frac{41}{48}$', '$\frac{31}{36}$, $\frac{41}{48}$, $\frac{25}{30}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is closer to $1$: $\frac{15}{16}$ or $\frac{20}{21}$?', '$\frac{20}{21}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Insert $<$, $>$ or $=$: $\frac{37}{42}$ __ $\frac{44}{48}$', '$<$ (or $\frac{37}{42} < \frac{44}{48}$)', 4);

-- Mixed Numbers and Improper Fractions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $1\frac{1}{2}$', '$\frac{3}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{5}{2}$', '$2\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $2\frac{1}{3}$', '$\frac{7}{3}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{7}{4}$', '$1\frac{3}{4}$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $1\frac{3}{4}$', '$\frac{7}{4}$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $2\frac{3}{5}$', '$\frac{13}{5}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{17}{6}$', '$2\frac{5}{6}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $3\frac{2}{7}$', '$\frac{23}{7}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{22}{5}$', '$4\frac{2}{5}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $1\frac{5}{8}$', '$\frac{13}{8}$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $4\frac{5}{6}$', '$\frac{29}{6}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{43}{8}$', '$5\frac{3}{8}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $5\frac{7}{12}$', '$\frac{67}{12}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{58}{9}$', '$6\frac{4}{9}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Simplify and convert to mixed number: $\frac{36}{8}$', '$4\frac{1}{2}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $7\frac{11}{15}$', '$\frac{116}{15}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to mixed number: $\frac{127}{18}$', '$7\frac{1}{18}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert to improper fraction: $9\frac{13}{16}$', '$\frac{157}{16}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Simplify and convert to mixed number: $\frac{150}{24}$', '$6\frac{1}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Which is larger: $\frac{41}{7}$ or $5\frac{6}{7}$?', 'Equal (both equal $5\frac{6}{7}$)', 4);

-- ============================================
-- PERCENTAGES
-- ============================================

-- Finding Percentages - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $10\%$ of $100$', '$10$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $50\%$ of $80$', '$40$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $25\%$ of $200$', '$50$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $10\%$ of $60$', '$6$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $20\%$ of $50$', '$10$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $15\%$ of $120$', '$18$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $30\%$ of $150$', '$45$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $12\%$ of $250$', '$30$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $40\%$ of $75$', '$30$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $35\%$ of $200$', '$70$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $17.5\%$ of $400$', '$70$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $22\%$ of $350$', '$77$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $8.5\%$ of $600$', '$51$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $65\%$ of $840$', '$546$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $42\%$ of $950$', '$399$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $12.8\%$ of $4,500$', '$576$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $68\%$ of $1,275$', '$867$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'A \$850 phone is discounted by $15\%$. What is the discount amount?', '\$127.50', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $7.5\%$ of \$1,200', '\$90', 4);

-- Percentage Increase and Decrease - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $50$ by $10\%$', '$55$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $100$ by $20\%$', '$80$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $80$ by $25\%$', '$100$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $60$ by $10\%$', '$54$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $200$ by $5\%$', '$210$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $150$ by $16\%$', '$174$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $240$ by $15\%$', '$204$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $320$ by $30\%$', '$416$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $500$ by $22\%$', '$390$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase $180$ by $35\%$', '$243$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'A shop increases prices by $12\%$. What is the new price of a \$450 item?', '\$504', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'During a sale, all items are reduced by $18\%$. What is the sale price of a \$650 TV?', '\$533', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'A car value deprecates by $25\%$ in the first year. If it was worth \$20,000, what''s the new value?', '\$15,000', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Population increased from $8,500$ to $9,350$. What was the percentage increase?', '$10\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Sales decreased from $12,000$ to $10,200$. What was the percentage decrease?', '$15\%$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'A \$1,200 laptop is increased by $15\%$ then decreased by $10\%$. What is the final price?', '\$1,242', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'House prices rose from \$420,000 to \$462,000. What was the percentage increase?', '$10\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'After two successive $10\%$ decreases, what is the overall percentage decrease?', '$19\%$ (not $20\%$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Value increased from $2,400$ to $3,360$. Find the percentage increase.', '$40\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'After increasing by $20\%$ and then decreasing by $20\%$, what''s the net change?', '$4\%$ decrease', 4);

-- Expressing as Percentages - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{1}{2}$ as a percentage', '$50\%$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{1}{4}$ as a percentage', '$25\%$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.5$ as a percentage', '$50\%$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{3}{4}$ as a percentage', '$75\%$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.25$ as a percentage', '$25\%$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{3}{5}$ as a percentage', '$60\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.35$ as a percentage', '$35\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{7}{10}$ as a percentage', '$70\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.08$ as a percentage', '$8\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'What percentage is $18$ out of $50$?', '$36\%$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{7}{8}$ as a percentage', '$87.5\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.375$ as a percentage', '$37.5\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'What percentage is $42$ out of $120$?', '$35\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{5}{6}$ as a percentage (to 1dp)', '$83.3\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'What percentage is $65$ out of $200$?', '$32.5\%$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{17}{40}$ as a percentage', '$42.5\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'What percentage is $87$ out of $348$?', '$25\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{23}{60}$ as a percentage (to 1dp)', '$38.3\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'What percentage is $119$ out of $350$?', '$34\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $0.0625$ as a percentage', '$6.25\%$', 4);

-- ============================================
-- RATIOS
-- ============================================

-- Simplifying Ratios - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $4:2$', '$2:1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $6:3$', '$2:1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $10:5$', '$2:1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $8:4$', '$2:1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $9:6$', '$3:2$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $12:8$', '$3:2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $15:20$', '$3:4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $18:12$', '$3:2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $25:30$', '$5:6$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $24:36$', '$2:3$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $42:56$', '$3:4$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $63:81$', '$7:9$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $48:72:96$', '$2:3:4$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $35:45:50$', '$7:9:10$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $0.4:0.6$', '$2:3$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $84:126:168$', '$2:3:4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $1.5:2.5:3.5$', '$3:5:7$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $\frac{1}{2}:\frac{1}{3}:\frac{1}{4}$', '$6:4:3$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $135:180:225$', '$3:4:5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $0.08:0.12:0.20$', '$2:3:5$', 4);

-- Sharing in Ratios - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$20 in the ratio $1:1$', '\$10 and \$10', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $30$ apples in the ratio $1:2$', '$10$ and $20$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$40 in the ratio $1:3$', '\$10 and \$30', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $50$ marbles in the ratio $2:3$', '$20$ and $30$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$60 in the ratio $1:2$', '\$20 and \$40', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$100 in the ratio $2:3$', '\$40 and \$60', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $120$ sweets in the ratio $3:5$', '$45$ and $75$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$200 in the ratio $3:5$', '\$75 and \$125', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $180$ stickers in the ratio $4:5$', '$80$ and $100$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $150$ in the ratio $2:3$', '$60$ and $90$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $240$ in the ratio $5:7$', '$100$ and $140$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$360 in the ratio $5:4:3$', '\$150, \$120, \$90', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $450$ in the ratio $2:3:4$', '$100$, $150$, $200$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Tom and Sarah share \$420 in the ratio $3:4$. How much does Tom get?', '\$180', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $320$ in the ratio $3:5$', '$120$ and $200$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$560 in the ratio $3:5$. What is the difference between the shares?', '\$140', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $875$ in the ratio $3:4:7$', '$187.50$, $250$, $437.50$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $1,200$ in the ratio $5:7:12$', '$250$, $350$, $600$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Profit of \$2,400 is shared among Alex, Ben, and Cal in ratio $5:3:2$. Find Alex''s share.', '\$1,200', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Three partners invest in ratio $3:4:5$. Total profit is \$9,600. Find the smallest share.', '\$2,400', 4);

-- ============================================
-- POWERS AND ROOTS
-- ============================================

-- Index Laws - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $2^3$', '$8$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $3^2$', '$9$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $5^2$', '$25$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $10^2$', '$100$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $4^2$', '$16$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $2^3 \times 2^2$', '$2^5$ or $32$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $3^4 \div 3^2$', '$3^2$ or $9$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $2^4$', '$16$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $5^3$', '$125$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(2^2)^3$', '$2^6$ or $64$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $5^7 \div 5^4$', '$5^3$ or $125$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(3^2)^4$', '$3^8$ or $6,561$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $2^5 \times 2^3 \div 2^4$', '$2^4$ or $16$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(5^3)^2$', '$5^6$ or $15,625$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'What is $2^0$?', '$1$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(2^3 \times 3^2)^2$', '$2^6 \times 3^4$ or $5,184$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $\frac{10^8}{10^5}$', '$10^3$ or $1,000$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Evaluate: $3^{-2}$', '$\frac{1}{9}$ or $0.111...$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(2^4)^3 \div 2^{10}$', '$2^2$ or $4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Evaluate: $4^{\frac{1}{2}}$', '$2$', 4);

-- Square Roots and Cube Roots - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{16}$', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{25}$', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{36}$', '$6$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{49}$', '$7$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{64}$', '$8$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{81}$', '$9$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{100}$', '$10$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{144}$', '$12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{8}$', '$2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{27}$', '$3$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{169}$', '$13$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{225}$', '$15$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{64}$', '$4$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{125}$', '$5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Simplify: $\sqrt{50}$', '$5\sqrt{2}$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Simplify: $\sqrt{72}$', '$6\sqrt{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Simplify: $\sqrt{200}$', '$10\sqrt{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{216}$', '$6$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Simplify: $\sqrt{98}$', '$7\sqrt{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{1000}$', '$10$', 4);

-- ============================================
-- FINANCIAL MATHEMATICS
-- ============================================

-- GST Calculations - 20 questions  
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find $15\%$ GST on \$100', '\$15', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find $15\%$ GST on \$200', '\$30', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'What is the GST-inclusive price (GST $15\%$) of a \$100 item?', '\$115', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find $15\%$ GST on \$50', '\$7.50', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'What is the GST-inclusive price of a \$80 item?', '\$92', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find $15\%$ GST on \$432', '\$64.80', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A laptop costs \$800 plus GST. What is the total price?', '\$920', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'What is the GST-inclusive price of a \$560 item?', '\$644', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find the GST on a \$1,200 purchase', '\$180', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A service costs \$340 + GST. What is the total?', '\$391', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A GST-inclusive price is \$345. What is the GST amount?', '\$45', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A TV costs \$1,380 including GST. Find the price before GST.', '\$1,200', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'You paid \$690 including GST. How much was the GST?', '\$90', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'The GST-inclusive price is \$1,495. Find the GST component.', '\$195', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Total bill is \$2,530 with GST. What was the pre-GST price?', '\$2,200', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A business invoice shows \$4,370 inc. GST. Calculate the GST to claim back.', '\$570', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'You buy items for \$450, \$280, and \$195 (all ex-GST). What''s the total GST?', '\$138.75', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A company charges \$85/hr + GST. What''s the total for $6.5$ hours?', '\$635.75', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'GST increased from $12.5\%$ to $15\%$. On a \$800 item, how much more GST?', '\$20', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A \$2,990 item inc. GST is discounted by $10\%$. What''s the new GST amount?', '\$350.87', 4);

-- Simple Interest - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate simple interest: \$1,000 at $5\%$ for $1$ year', '\$50', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate simple interest: \$500 at $10\%$ for $1$ year', '\$50', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate simple interest: \$2,000 at $3\%$ for $1$ year', '\$60', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'What is the total value of \$1,000 at $5\%$ simple interest for $1$ year?', '\$1,050', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Interest earned on \$800 at $2.5\%$ for $1$ year?', '\$20', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate simple interest: \$1,500 at $4\%$ for $2$ years', '\$120', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate simple interest: \$3,000 at $6\%$ for $3$ years', '\$540', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'What is the total value of \$2,500 at $8\%$ for $2$ years?', '\$2,900', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Interest on \$4,000 at $5\%$ for $6$ months?', '\$100', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'How much interest on \$1,200 at $7\%$ for $3$ years?', '\$252', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Sarah invests \$5,000 at $4.5\%$ p.a. How much after $4$ years?', '\$5,900', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'What principal earns \$300 interest at $5\%$ for $3$ years?', '\$2,000', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'At what rate does \$2,500 earn \$375 interest in $3$ years?', '$5\%$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'How long for \$4,000 at $6\%$ to earn \$720 interest?', '$3$ years', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Interest of \$450 earned on \$3,000 in $2$ years. Find the rate.', '$7.5\%$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Compare: \$5,000 at $6\%$ for $4$ years vs \$6,000 at $4\%$ for $5$ years. Which earns more?', '\$6,000 at $4\%$ (\$1,200 vs \$1,200) - same', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'You need \$5,500 in $3$ years. How much to invest now at $5\%$?', '\$4,783 (to nearest dollar)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), '\$12,000 grows to \$15,600 in $4$ years. What was the interest rate?', '$7.5\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Investment of \$8,500 earns \$2,550 simple interest. If rate is $6\%$, find the time.', '$5$ years', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Which is better: \$10,000 at $5.5\%$ for $3$ years or \$10,000 at $4.8\%$ for $4$ years?', '$5.5\%$ for $3$ years (\$1,650 vs \$1,920) - $4.8\%$ is better', 4);
