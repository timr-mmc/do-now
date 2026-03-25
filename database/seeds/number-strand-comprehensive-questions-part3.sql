-- ============================================
-- NUMBER STRAND - COMPREHENSIVE QUESTIONS PART 3
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Advanced Powers, Factors, Currency Conversions, Financial Applications, Estimation
-- Total: ~200 questions across multiple subtopics

-- ============================================
-- POWERS AND ROOTS (ADVANCED)
-- ============================================

-- Powers of 2 - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^3$', '$8$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^4$', '$16$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^5$', '$32$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^6$', '$64$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^1$', '$2$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^7$', '$128$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^8$', '$256$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Express $64$ as a power of $2$', '$2^6$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Express $128$ as a power of $2$', '$2^7$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^{10}$', '$1,024$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Simplify: $2^5 \times 2^3$', '$2^8$ or $256$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Simplify: $2^8 \div 2^5$', '$2^3$ or $8$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $(2^3)^2$', '$2^6$ or $64$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'What power of $2$ equals $512$?', '$2^9$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^9$', '$512$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^{12}$', '$4,096$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Solve: $2^x = 1,024$', '$x = 10$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Simplify: $\frac{2^{10}}{2^3} \times 2^2$', '$2^9$ or $512$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Express $2,048$ as a power of $2$', '$2^{11}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^{-3}$', '$\frac{1}{8}$ or $0.125$', 4);

-- Approximating Roots - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Is $\sqrt{50}$ closer to $7$ or $8$?', '$7$ ($\sqrt{49} = 7$, $\sqrt{64} = 8$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Is $\sqrt{30}$ closer to $5$ or $6$?', '$5$ ($\sqrt{25} = 5$, $\sqrt{36} = 6$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), '$\sqrt{20}$ is between which two whole numbers?', '$4$ and $5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), '$\sqrt{70}$ is between which two whole numbers?', '$8$ and $9$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate: $\sqrt{100}$', '$10$ (exact)', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt{45}$ to 1 decimal place (use calculator)', '$6.7$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Between which consecutive integers is $\sqrt{90}$?', '$9$ and $10$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Is $\sqrt{120}$ closer to $10$ or $11$?', '$11$ ($10^2 = 100$, $11^2 = 121$)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate: $\sqrt{80}$ (to nearest whole number)', '$9$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Without calculator, estimate $\sqrt{150}$ to nearest whole number', '$12$ ($12^2 = 144$)', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt{200}$ to 1 decimal place', '$14.1$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), '$\sqrt{250}$ is between $15$ and $16$. Is it closer to which?', '$16$ ($15^2 = 225$, $16^2 = 256$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt[3]{30}$ to nearest whole number', '$3$ ($3^3 = 27$, $4^3 = 64$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Between which integers is $\sqrt[3]{100}$?', '$4$ and $5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt{500}$ to nearest whole number', '$22$ ($22^2 = 484$)', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Without calculator, estimate $\sqrt{2,000}$ to nearest integer', '$45$ (approx)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt[3]{200}$ to 1 decimal place', '$5.8$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), '$\sqrt{n}$ is approximately $13.5$. What is $n$?', '$182$ (approx)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Calculate $\sqrt{32}$ in simplest surd form', '$4\sqrt{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Simplify $\sqrt{75}$', '$5\sqrt{3}$', 4);

-- Reciprocals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $2$?', '$\frac{1}{2}$ or $0.5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $5$?', '$\frac{1}{5}$ or $0.2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $\frac{1}{3}$?', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $10$?', '$\frac{1}{10}$ or $0.1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $\frac{1}{2}$?', '$2$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $\frac{2}{3}$?', '$\frac{3}{2}$ or $1.5$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $\frac{3}{4}$?', '$\frac{4}{3}$ or $1\frac{1}{3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $0.5$?', '$2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $0.25$?', '$4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Calculate: $2 \div \frac{1}{3}$', '$6$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $1\frac{1}{2}$?', '$\frac{2}{3}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $2.5$?', '$0.4$ or $\frac{2}{5}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $\frac{5}{8}$?', '$\frac{8}{5}$ or $1.6$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Simplify: $\frac{1}{\frac{2}{7}}$', '$\frac{7}{2}$ or $3.5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $0.2$?', '$5$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $3\frac{3}{4}$?', '$\frac{4}{15}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Calculate: $(0.125)^{-1}$', '$8$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Simplify: $\frac{1}{\frac{3}{8}} \times \frac{1}{2}$', '$\frac{4}{3}$ or $1\frac{1}{3}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $1\frac{2}{5}$?', '$\frac{5}{7}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'If the reciprocal of $x$ is $0.4$, find $x$.', '$2.5$ or $\frac{5}{2}$', 4);

-- ============================================
-- FACTORS AND MULTIPLES
-- ============================================

-- Factors and Multiples - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $12$', '$1, 2, 3, 4, 6, 12$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $10$', '$1, 2, 5, 10$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'What are the first three multiples of $5$?', '$5, 10, 15$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Is $15$ a factor of $60$?', 'Yes', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $8$', '$1, 2, 4, 8$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $24$', '$1, 2, 3, 4, 6, 8, 12, 24$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'What are the common factors of $12$ and $18$?', '$1, 2, 3, 6$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Find the first common multiple of $4$ and $6$', '$12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'How many factors does $36$ have?', '$9$ factors', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Is $7$ a prime number?', 'Yes', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $48$', '$1, 2, 3, 4, 6, 8, 12, 16, 24, 48$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Find all common multiples of $6$ and $8$ less than $50$', '$24, 48$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'What are the common factors of $36$ and $48$?', '$1, 2, 3, 4, 6, 12$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all prime numbers between $10$ and $30$', '$11, 13, 17, 19, 23, 29$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'How many factors does $100$ have?', '$9$ factors', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $72$', '$1, 2, 3, 4, 6, 8, 9, 12, 18, 24, 36, 72$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'What is the sum of all factors of $28$?', '$56$ ($1+2+4+7+14+28$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Find all common factors of $60$ and $84$', '$1, 2, 3, 4, 6, 12$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'How many prime numbers are less than $50$?', '$15$ primes', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'What is the smallest number with exactly $6$ factors?', '$12$ (factors: $1,2,3,4,6,12$)', 4);

-- HCF and LCM - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $6$ and $8$', '$2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $3$ and $4$', '$12$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $10$ and $15$', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $2$ and $5$', '$10$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $12$ and $18$', '$6$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $4$ and $6$', '$12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $24$ and $36$', '$12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $6$ and $9$', '$18$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $20$ and $30$', '$10$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $5$ and $8$', '$40$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $48$ and $72$', '$24$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $12$ and $18$', '$36$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $36$ and $60$', '$12$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $15$ and $20$', '$60$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Two bells ring every $8$ and $12$ minutes. When will they next ring together?', 'In $24$ minutes (LCM)', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the HCF of $84$ and $126$', '$42$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find the LCM of $24$ and $36$', '$72$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find HCF and LCM of $45$ and $60$', 'HCF: $15$, LCM: $180$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Buses depart every $15$ and $20$ minutes. When do they next leave together?', 'In $60$ minutes', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'If HCF$(a, b) = 12$ and LCM$(a, b) = 180$, and $a = 36$, find $b$.', '$60$ (using $a \times b = $ HCF $\times$ LCM)', 4);

-- Prime Factorization - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $12$ as a product of prime factors', '$2^2 \times 3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $10$ as a product of prime factors', '$2 \times 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $15$ as a product of prime factors', '$3 \times 5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $8$ as a product of prime factors', '$2^3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $18$ as a product of prime factors', '$2 \times 3^2$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $24$ as a product of prime factors', '$2^3 \times 3$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $30$ as a product of prime factors', '$2 \times 3 \times 5$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $36$ as a product of prime factors', '$2^2 \times 3^2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $50$ as a product of prime factors', '$2 \times 5^2$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $40$ as a product of prime factors', '$2^3 \times 5$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $72$ as a product of prime factors', '$2^3 \times 3^2$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $100$ as a product of prime factors', '$2^2 \times 5^2$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $84$ as a product of prime factors', '$2^2 \times 3 \times 7$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $120$ as a product of prime factors', '$2^3 \times 3 \times 5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Using prime factorization, find HCF of $24$ and $36$', '$12$ ($2^2 \times 3$)', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $180$ as a product of prime factors', '$2^2 \times 3^2 \times 5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $210$ as a product of prime factors', '$2 \times 3 \times 5 \times 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Using prime factorization, find LCM of $48$ and $72$', '$144$ ($2^4 \times 3^2$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $300$ as a product of prime factors', '$2^2 \times 3 \times 5^2$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Find the smallest number divisible by $6$, $8$, and $12$', '$24$ (LCM)', 4);

-- ============================================
-- FINANCIAL APPLICATIONS
-- ============================================

-- Currency Conversions - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.90 AUD, convert \$100 NZD to AUD', '\$90 AUD', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.60 USD, convert \$50 NZD to USD', '\$30 USD', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$2 NZD $=$ \$1 EUR, convert \$100 NZD to EUR', '\$50 EUR', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.50 GBP, convert \$200 NZD to GBP', '\$100 GBP', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 USD $=$ \$1.50 NZD, convert \$30 USD to NZD', '\$45 NZD', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.92 AUD, convert \$150 NZD to AUD', '\$138 AUD', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.58 USD, convert \$250 NZD to USD', '\$145 USD', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 AUD $=$ \$1.08 NZD, convert \$200 AUD to NZD', '\$216 NZD', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 EUR $=$ \$1.80 NZD, convert \$120 EUR to NZD', '\$216 NZD', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 GBP $=$ \$2.10 NZD, convert \$80 GBP to NZD', '\$168 NZD', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'You have \$500 NZD. The rate is \$1 NZD $=$ \$0.90 AUD. How much AUD?', '\$450 AUD', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Item costs \$75 USD. If \$1 USD $=$ \$1.65 NZD, find cost in NZD.', '\$123.75 NZD', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert \$1,200 NZD to EUR if \$1 NZD $=$ \$0.55 EUR', '\$660 EUR', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'You buy \$345 AUD with NZD. Rate: \$1 AUD $=$ \$1.10 NZD. Cost in NZD?', '\$379.50 NZD', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.48 GBP, how many GBP for \$625 NZD?', '\$300 GBP', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert \$850 USD to NZD if rate is \$1 USD $=$ \$1.58 NZD', '\$1,343 NZD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'You pay \$456 AUD using NZD. Rate: \$1 NZD $=$ \$0.95 AUD. How much NZD?', '\$480 NZD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Item costs \$120 EUR. Rate: \$1 EUR $=$ \$1.75 NZD. Cost in NZD?', '\$210 NZD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'You have \$1,000 NZD. After converting to USD and back, you have \$950 NZD. Loss?', '\$50 NZD or $5\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'If \$1 NZD $=$ \$0.58 USD and \$1 USD $=$ \$0.85 EUR, convert \$500 NZD to EUR', '\$246.50 EUR', 4);

-- Mark-ups and Discounts - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'An item costs \$100. It''s marked up $20\%$. Find selling price.', '\$120', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'A \$50 item has a $10\%$ discount. Find sale price.', '\$45', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Cost is \$200, marked up $50\%$. What''s the selling price?', '\$300', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'A \$80 item is discounted $25\%$. Find new price.', '\$60', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Selling price is \$150 with $20\%$ mark-up. Find cost price.', '\$125', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'A shop buys for \$400, marks up $35\%$. Find selling price.', '\$540', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'An item is \$120 after a $20\%$ discount. Find original price.', '\$150', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Cost \$250, selling price \$325. What''s the mark-up percentage?', '$30\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Original \$180, sale price \$135. What''s the discount percentage?', '$25\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'A \$500 item is marked up $40\%$ then discounted $10\%$. Final price?', '\$630', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Shop buys for \$600, sells for \$750. Find profit as percentage.', '$25\%$ profit', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'After successive $20\%$ and $10\%$ discounts, item costs \$360. Find original.', '\$500', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Cost \$800, mark-up is $45\%$. What''s the selling price with $15\%$ GST?', '\$1,334', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Item sold for \$450 at $25\%$ profit. What was the cost?', '\$360', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Original \$1,200. After $15\%$ discount then $12\%$ mark-up. Final price?', '\$1,142.40', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Retailer buys for \$450, wants $35\%$ profit after $15\%$ GST. Selling price?', '\$699.75', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Item marked at \$800, sold at \$640 after discount. Find discount rate.', '$20\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'After $30\%$ mark-up and $18\%$ discount, price is \$533.80. Find cost.', '\$500', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Two successive discounts of $15\%$ each. What''s the overall discount?', '$27.75\%$ (not $30\%$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'To make $40\%$ profit on \$650 cost (including $15\%$ GST), find price.', '\$1,046.50', 4);

-- Cost Proportions and Best Value - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$5$ apples cost \$10. What''s the price per apple?', '\$2 per apple', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$3$ kg of rice costs \$12. What''s the price per kg?', '\$4 per kg', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Which is better value: \$6 for $2$ L or \$10 for $4$ L?', '\$10 for $4$ L (\$2.50/L vs \$3/L)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$8$ pens cost \$24. Find unit price.', '\$3 per pen', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$500$g costs \$4. What''s the cost per $100$g?', '\$0.80 per $100$g', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Compare: \$8 for $650$g vs \$12 for $1$ kg. Which is better value?', '\$12 for $1$ kg (\$12/kg vs \$12.31/kg)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$750$ mL of juice costs \$4.50. Find price per litre.', '\$6 per L', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Which is better: \$15 for $12$ items or \$20 for $18$ items?', '\$20 for $18$ (\$1.11 vs \$1.25)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$1.5$ kg costs \$9. What''s the cost of $2.5$ kg?', '\$15', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Petrol: $45$ L costs \$117. Find price per litre.', '\$2.60 per L', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Compare: $350$g for \$7 vs $650$g for \$12.50. Best value?', '\$12.50 for $650$g (\$19.23/kg vs \$20/kg)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$2.4$ kg costs \$18. Find cost of $3.5$ kg.', '\$26.25', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Which is better: $250$ mL for \$3.50 or $400$ mL for \$5.20?', '\$5.20 for $400$ mL (\$13/L vs \$14/L)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Three sizes: $500$g for \$6, $750$g for \$8.50, $1$ kg for \$11. Best?', '\$8.50 for $750$g (\$11.33/kg)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Cereal: $375$g for \$5.25. What''s the price per kg?', '\$14 per kg', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Compare: $1.8$ kg for \$15.30 vs $2.5$ kg for \$20. Which saves more per kg?', '\$20 for $2.5$ kg (\$8/kg vs \$8.50/kg)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Options: $450$ mL for \$6.30, $750$ mL for \$9.75, $1$ L for \$14. Best value?', '\$9.75 for $750$ mL (\$13/L)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'If $3.6$ kg costs \$28.80, find cost per $100$g.', '\$0.80 per $100$g', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), '$875$ mL of detergent costs \$14. What''s the cost of $2$ L?', '\$32', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Pack A: $6$ for \$15. Pack B: $10$ for \$23. How much saved buying B?', '\$2 saved (\$2.30/item vs \$2.50/item)', 4);

-- Estimation Strategies - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $48 + 52$', 'About $100$ (exact: $100$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $97 - 49$', 'About $50$ (exact: $48$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Round $47$ to nearest $10$', '$50$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $19 \times 5$', 'About $100$ (exact: $95$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $203 + 198$', 'About $400$ (exact: $401$)', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $3.8 \times 21$', 'About $80$ (exact: $79.8$)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $496 \div 48$', 'About $10$ (exact: $10.33$)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate total: \$4.95, \$3.10, \$5.98', 'About \$14 (exact: \$14.03)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Round $3,478$ to nearest $100$', '$3,500$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $52 \times 48$', 'About $2,500$ (exact: $2,496$)', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $23.7 \times 4.9$', 'About $120$ (exact: $116.13$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $\sqrt{80}$', 'About $9$ (exact: $8.94$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $18.6\%$ of $202$', 'About $40$ (exact: $37.57$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $\frac{197}{9.8}$', 'About $20$ (exact: $20.10$)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Round $56,789$ to nearest $1,000$', '$57,000$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $(49.8)^2$', 'About $2,500$ (exact: $2,480.04$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $\frac{987 \times 52}{198}$', 'About $250$ (exact: $259.09$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate $21\%$ of \$4,850', 'About \$1,000 (exact: \$1,018.50)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $\sqrt[3]{520}$', 'About $8$ (exact: $8.04$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'A rectangle is $19.8$ cm by $30.2$ cm. Estimate area.', 'About $600$ cm² (exact: $597.96$)', 4);
