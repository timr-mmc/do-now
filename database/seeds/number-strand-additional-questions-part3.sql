-- ============================================
-- NUMBER STRAND - ADDITIONAL QUESTIONS PART 3
-- Add 5 more questions to each subtopic
-- Run this AFTER running number-strand-comprehensive-questions-part3.sql
-- ============================================

-- Powers of 2 - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $2^{15}$', '$32,768$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Simplify: $\frac{2^{14}}{2^6} \times 2^3$', '$2^{11}$ or $2,048$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Solve: $2^x = 8,192$', '$x = 13$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Calculate: $(2^4)^3 \div 2^7$', '$2^5$ or $32$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Powers of 2'), 'Express $16,384$ as a power of $2$', '$2^{14}$', 5);

-- Approximating Roots - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt{800}$ to nearest whole number', '$28$ ($28^2 = 784$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Simplify $\sqrt{128}$ in surd form', '$8\sqrt{2}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Estimate $\sqrt[3]{400}$ to 1 decimal place', '$7.4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Simplify $\sqrt{180}$ in simplest surd form', '$6\sqrt{5}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Approximating Roots'), 'Calculate $\sqrt{288}$ in surd form', '$12\sqrt{2}$', 5);

-- Reciprocals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $2\frac{2}{3}$?', '$\frac{3}{8}$ or $0.375$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Find the reciprocal of $0.16$', '$6.25$ or $\frac{25}{4}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'Calculate: $(1.6)^{-1}$', '$0.625$ or $\frac{5}{8}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'What is the reciprocal of $4\frac{1}{5}$?', '$\frac{5}{21}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Reciprocals'), 'If the reciprocal of $x$ is $\frac{7}{12}$, find $x$', '$\frac{12}{7}$ or $1\frac{5}{7}$', 5);

-- Factors and Multiples - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all factors of $168$', '$1, 2, 3, 4, 6, 7, 8, 12, 14, 21, 24, 28, 42, 56, 84, 168$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Find the lowest common multiple of $18$ and $30$', '$90$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'How many factors does $144$ have?', '$15$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'Find LCM of $24$, $36$, and $48$', '$144$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Factors and Multiples'), 'List all prime factors of $420$', '$2, 3, 5, 7$', 5);

-- HCF and LCM - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find HCF of $252$ and $378$', '$126$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find LCM of $45$ and $75$', '$225$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find HCF of $168$, $252$, and $420$', '$84$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'Find LCM of $28$, $42$, and $56$', '$168$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'HCF and LCM'), 'HCF of two numbers is $36$, LCM is $1,080$. One is $108$. Find the other.', '$360$', 5);

-- Prime Factorization - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $504$ as a product of prime factors', '$2^3 \times 3^2 \times 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Write $675$ in prime factor form', '$3^3 \times 5^2$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $1,260$ as a product of primes', '$2^2 \times 3^2 \times 5 \times 7$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Write $2,940$ in prime factor form', '$2^2 \times 3 \times 5 \times 7^2$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Factors and Multiples' AND subtopic = 'Prime Factorization'), 'Express $4,410$ as product of prime factors', '$2 \times 3^2 \times 5 \times 7^2$', 5);

-- Currency Conversions - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert \$NZD 840 to $USD$ at rate $1$ $NZD = 0.62$ $USD$', '\$520.80 USD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert \$USD 450 to $NZD$ at rate $1$ $USD = 1.58$ $NZD$', '\$711 NZD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert $£765$ to $NZD$ at rate $1$ $GBP = 2.05$ $NZD$', '\$1,568.25 NZD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert \$NZD 3,150 to $EUR$ at $1$ $NZD = 0.56$ $EUR$', '€1,764', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Currency Conversions'), 'Convert $¥12,600$ to $NZD$ at $1$ $JPY = 0.0125$ $NZD$', '\$157.50 NZD', 5);

-- Mark-ups and Discounts - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Cost price \$560, mark-up $45\%$. Find selling price.', '\$812', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Selling price \$1,350, discount $40\%$. Find original price.', '\$2,250', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Cost \$720, sold for \$1,080. Find mark-up percentage.', '$50\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'Item marked \$1,600, sold for \$1,200. Discount percentage?', '$25\%$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Mark-ups and Discounts'), 'After $65\%$ mark-up, profit is \$780. Find cost price.', '\$1,200', 5);

-- Cost Proportions and Best Value - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Which is better value: $750$ g for \$6.75 or $1.2$ kg for \$9.60?', '$1.2$ kg for \$9.60 (\$8/kg vs \$9/kg)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Find unit price: $2.5$ kg for \$18.75', '\$7.50 per kg', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Better buy: $450$ mL for \$3.60 or $800$ mL for \$6.00?', '$450$ mL for \$3.60 (\$8/L vs \$7.50/L)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Which is cheapest per item: $8$ for \$12, $15$ for \$21, or $25$ for \$32.50?', '$15$ for \$21 (\$1.40 each)', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Cost Proportions and Best Value'), 'Best value: $1.8$ L for \$14.40, $2.5$ L for \$18.75, or $3.2$ L for \$25.60?', 'All equal (\$8/L)', 5);

-- Estimation Strategies - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $487 \times 23$ (round to 1 sf)', '$10,000$ ($500 \times 20$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $6,234 \div 78$ (round appropriately)', '$80$ ($6,400 \div 80$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $\sqrt{4,850}$ to nearest 10', '$70$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate: $42.3 \times 18.9 \div 5.8$', '$138$ (approx)', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Number Sense' AND subtopic = 'Estimation Strategies'), 'Estimate total: \$38.75 + \$62.40 + \$19.85 + \$71.20', '\$192 (approx)', 5);
