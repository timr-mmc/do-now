-- ============================================
-- NUMBER STRAND - COMPREHENSIVE QUESTIONS PART 2
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Topics: Decimals, Advanced Percentages, Advanced Ratios, Advanced Powers, Compound Interest
-- Total: ~400 questions across multiple subtopics

-- ============================================
-- DECIMALS
-- ============================================

-- Adding and Subtracting Decimals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $2.5 + 3.7$', '$6.2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $5.8 - 2.3$', '$3.5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $4.2 + 1.9$', '$6.1$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $7.6 - 3.4$', '$4.2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $3.5 + 2.5$', '$6$ or $6.0$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $12.45 + 8.67$', '$21.12$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $25.8 - 14.93$', '$10.87$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $6.75 + 9.8$', '$16.55$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $18.2 - 9.67$', '$8.53$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $15.35 + 7.9$', '$23.25$', 2),

-- Difficulty 3v
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $34.567 + 19.88$', '$54.447$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $52.3 - 27.845$', '$24.455$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $8.45 + 12.7 + 6.835$', '$27.985$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $100 - 45.678$', '$54.322$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $23.45 - 8.9 + 15.67$', '$30.22$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $456.789 - 123.456 + 78.9$', '$412.233$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $87.65 + 43.298 - 56.7$', '$74.248$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'You have \$50. You buy items for \$12.45, \$8.95, and \$15.67. What''s your change?', '\$12.93', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $234.5 - 87.65 - 43.298$', '$103.552$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'A runner completes laps in $12.45$s, $11.98$s, and $12.23$s. Find total time.', '$36.66$s', 4);

-- Multiplying Decimals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $2.5 \times 4$', '$10$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $3.2 \times 5$', '$16$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $1.5 \times 6$', '$9$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $4.5 \times 2$', '$9$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $0.5 \times 8$', '$4$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $3.5 \times 7$', '$24.5$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $2.4 \times 6$', '$14.4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $1.25 \times 8$', '$10$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $6.5 \times 4$', '$26$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $0.75 \times 12$', '$9$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $3.2 \times 4.5$', '$14.4$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $5.6 \times 2.5$', '$14$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $7.8 \times 3.2$', '$24.96$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $4.25 \times 6$', '$25.5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $12.5 \times 0.4$', '$5$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $23.45 \times 6.7$', '$157.115$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $8.75 \times 12.4$', '$108.5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Petrol costs \$2.45 per litre. How much for $42.5$ litres?', '\$104.125', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $0.125 \times 64$', '$8$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'A rectangle is $15.6$ cm by $8.4$ cm. Find the area.', '$131.04$ cm²', 4);

-- Dividing Decimals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $10 \div 2.5$', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $15 \div 5$', '$3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $8 \div 0.5$', '$16$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $12 \div 2.5$', '$4.8$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $20 \div 0.4$', '$50$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $24.5 \div 5$', '$4.9$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $36 \div 1.5$', '$24$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $48.6 \div 6$', '$8.1$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $72 \div 2.4$', '$30$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $54.6 \div 7$', '$7.8$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $15.6 \div 2.4$', '$6.5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $87.5 \div 3.5$', '$25$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $123.2 \div 5.6$', '$22$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $45.36 \div 6.3$', '$7.2$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $96.8 \div 4.4$', '$22$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $234.5 \div 6.7$', '$35$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $456.78 \div 12.3$', '$37.14$ (to 2dp)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Share \$345.60 equally among $15$ people. How much each?', '\$23.04', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $876.5 \div 25$', '$35.06$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'A $567.6$ km journey takes $8.4$ hours. Find average speed.', '$67.57$ km/h (approx)', 4);

-- Rounding Decimals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $3.7$ to the nearest whole number', '$4$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $5.2$ to the nearest whole number', '$5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $8.5$ to the nearest whole number', '$9$ or $8$ (conventional: $9$)', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $12.9$ to the nearest whole number', '$13$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $6.1$ to the nearest whole number', '$6$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $23.67$ to 1 decimal place', '$23.7$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $45.32$ to 1 decimal place', '$45.3$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $18.95$ to 1 decimal place', '$19.0$ or $19$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $67.48$ to the nearest whole number', '$67$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $89.126$ to 1 decimal place', '$89.1$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $34.567$ to 2 decimal places', '$34.57$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $78.994$ to 2 decimal places', '$78.99$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $123.456$ to the nearest ten', '$120$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $0.6789$ to 2 decimal places', '$0.68$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $456.785$ to 1 decimal place', '$456.8$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $0.0456$ to 3 significant figures', '$0.0456$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $23,456.789$ to 2 decimal places', '$23,456.79$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round \$45.678 to the nearest cent', '\$45.68', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $987.6549$ to 3 significant figures', '$988$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $0.09876$ to 2 significant figures', '$0.099$', 4);

-- Ordering and Comparing Decimals - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $0.5$ or $0.3$?', '$0.5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is smaller: $0.8$ or $0.9$?', '$0.8$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $1.2$ or $1.5$?', '$1.5$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from smallest: $0.3$, $0.7$, $0.5$', '$0.3$, $0.5$, $0.7$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $2.1$ or $2.01$?', '$2.1$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from smallest: $0.45$, $0.54$, $0.405$', '$0.405$, $0.45$, $0.54$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $3.67$ or $3.7$?', '$3.7$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from largest: $1.2$, $1.02$, $1.22$', '$1.22$, $1.2$, $1.02$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is smaller: $0.089$ or $0.09$?', '$0.089$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $4.5$ or $4.498$?', '$4.5$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from smallest: $2.345$, $2.35$, $2.3$, $2.354$', '$2.3$, $2.345$, $2.35$, $2.354$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is closer to $5$: $4.89$ or $5.12$?', '$4.89$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from largest: $0.567$, $0.5$, $0.57$, $0.506$', '$0.57$, $0.567$, $0.506$, $0.5$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Insert $<$ or $>$: $3.456$ __ $3.465$', '$<$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $0.999$ or $1.0$?', '$1.0$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order: $0.7$, $0.700$, $0.07$, $0.707$, $0.077$', '$0.07$, $0.077$, $0.7$, $0.700$, $0.707$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which fraction is closest to $0.6$: $\frac{5}{8}$, $\frac{3}{5}$, or $\frac{7}{12}$?', '$\frac{3}{5}$ (exactly $0.6$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order from smallest: $0.0567$, $0.567$, $0.0576$, $0.5$', '$0.0567$, $0.0576$, $0.5$, $0.567$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is larger: $\frac{7}{8}$ or $0.88$?', '$0.88$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Place in order: $\frac{2}{3}$, $0.67$, $\frac{5}{8}$, $0.65$', '$\frac{5}{8}$, $0.65$, $\frac{2}{3}$, $0.67$', 4);

-- ============================================
-- PERCENTAGES (ADVANCED)
-- ============================================

-- Reverse Percentages - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $10\%$ increase, a price is \$110. Find the original price.', '\$100', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $50\%$ increase, a price is \$150. Find the original price.', '\$100', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $25\%$ decrease, a price is \$75. Find the original price.', '\$100', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'A \$90 item is $90\%$ of the original price. Find the original.', '\$100', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $20\%$ increase, a price is \$120. Find the original.', '\$100', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $15\%$ increase, a price is \$230. Find the original price.', '\$200', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $30\%$ discount, an item costs \$140. What was the original price?', '\$200', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'An item is sold for \$180 after a $10\%$ discount. Find original price.', '\$200', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $12\%$ increase, the price is \$280. Find the original.', '\$250', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'A \$272 price includes $15\%$ GST. Find the price before GST.', '\$236.52 (or calculate: $272 \div 1.15$)', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $8\%$ increase, a price is \$324. Find the original price.', '\$300', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'In a sale, a \$340 TV is reduced by $15\%$. What was the original price?', '\$400', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'A worker gets a $5\%$ raise to \$525 per week. Find original salary.', '\$500', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'A price of \$450 includes $15\%$ GST. What is the price without GST?', '\$391.30 (to 2 dp)', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After depreciation of $18\%$, a car is worth \$16,400. Find original value.', '\$20,000', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $22.5\%$ decrease, price is \$620. Find the original.', '\$800', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After two successive $10\%$ increases, the price is \$242. Find the original.', '\$200', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'Including $15\%$ GST, the total is \$1,495. Find the GST amount.', '\$195', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After a $17.5\%$ increase, house value is \$470,000. Find original value.', '\$400,000', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'A \$384 price is after a $20\%$ discount then $20\%$ increase. Find original.', '\$400', 4);

-- Percentage Problems - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A class has $40\%$ boys. If there are $12$ boys, how many students total?', '$30$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), '$30\%$ of students wear glasses. If there are $60$ students, how many wear glasses?', '$18$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'An item costs \$80. Sales tax is $5\%$. Find the tax amount.', '\$4', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), '$25\%$ of a number is $15$. Find the number.', '$60$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A shop has $120$ items. $80\%$ are sold. How many sold?', '$96$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A \$500 item is increased by $15\%$, then decreased by $10\%$. Final price?', '\$517.50', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Population is $8,000$. It increases by $12.5\%$. Find new population.', '$9,000$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), '$18$ is what percentage of $45$?', '$40\%$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A test has $25$ questions. Student gets $80\%$ correct. How many correct?', '$20$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Price increases from \$400 to \$460. Find percentage increase.', '$15\%$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A car depreciates $15\%$ per year. If it''s worth \$20,000 now, find value after $1$ year.', '\$17,000', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'In an exam, Sarah scores $76\%$ getting $38$ marks. What was the total?', '$50$ marks', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A \$1,200 phone is discounted $18\%$, then $5\%$ GST added. Final price?', '\$1,033.68', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Profit is $15\%$ of cost price. If profit is \$45, find cost price.', '\$300', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A \$800 TV is marked up $25\%$, then sold at $20\%$ off. Final selling price?', '\$800', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Investment grows from \$5,000 to \$6,500. What''s the percentage increase?', '$30\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A seller makes $23\%$ profit on \$400 cost. Find selling price.', '\$492', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'After $3$ successive $10\%$ increases, what''s overall percentage increase?', '$33.1\%$ (not $30\%$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Value decreases by $20\%$ then increases by $25\%$. Net change?', '$0\%$ (same value)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'After $15\%$ discount and $15\%$ GST, final price is \$977.38. Find original.', '\$1,000', 4);

-- ============================================
-- RATIOS (ADVANCED)
-- ============================================

-- Direct Proportion - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $2$ pens cost \$5, how much do $4$ pens cost?', '\$10', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $3$ kg of apples cost \$9, find the cost of $5$ kg.', '\$15', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $5$ notebooks cost \$20, how much do $3$ notebooks cost?', '\$12', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $4$ hours of work earns \$60, how much for $6$ hours?', '\$90', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$8$ m of fabric costs \$24. Find the cost of $12$ m.', '\$36', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $6$ pencils cost \$4.50, find the cost of $10$ pencils.', '\$7.50', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$12$ eggs cost \$6. How many can you buy for \$15?', '$30$ eggs', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'A car uses $8$ L of petrol for $120$ km. How much for $180$ km?', '$12$ L', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If \$250 earns \$15 interest per year, how much earns \$36?', '\$600', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$7$ identical books cost \$91. Find the cost of $5$ books.', '\$65', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$15$ workers take $8$ days to complete a job. How long for $10$ workers?', '$12$ days', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'A recipe for $4$ people needs $300$g flour. How much for $7$ people?', '$525$g', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $2.5$ kg costs \$18.75, find cost per kg.', '\$7.50 per kg', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'A tap fills $45$ L in $6$ minutes. How much in $15$ minutes?', '$112.5$ L', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'Spring extends $12$ cm with $8$ N force. Extension with $14$ N?', '$21$ cm', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'Exchange rate: \$1 NZD $=$ \$0.92 AUD. Convert \$450 NZD to AUD.', '\$414 AUD', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $y$ is directly proportional to $x$, and $y = 24$ when $x = 8$, find $y$ when $x = 15$.', '$45$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$3.5$ m of pipe weighs $5.6$ kg. Find weight of $8.75$ m.', '$14$ kg', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'Machine produces $450$ items in $7.5$ hours. How many in $12$ hours?', '$720$ items', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $8$ painters take $15$ days, how many days for $12$ painters?', '$10$ days', 4);

-- ============================================
-- POWERS (ADVANCED)
-- ============================================

-- Scientific Notation - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $300$ in scientific notation', '$3 \times 10^2$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $5,000$ in scientific notation', '$5 \times 10^3$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $2 \times 10^3$ in standard form', '$2,000$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $70,000$ in scientific notation', '$7 \times 10^4$', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $4 \times 10^2$ in standard form', '$400$', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $45,000$ in scientific notation', '$4.5 \times 10^4$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $3.2 \times 10^5$ in standard form', '$320,000$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $0.006$ in scientific notation', '$6 \times 10^{-3}$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $8.5 \times 10^{-2}$ in standard form', '$0.085$', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $250,000$ in scientific notation', '$2.5 \times 10^5$', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Multiply: $(2 \times 10^3) \times (3 \times 10^4)$', '$6 \times 10^7$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Divide: $(8 \times 10^6) \div (2 \times 10^3)$', '$4 \times 10^3$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $0.000045$ in scientific notation', '$4.5 \times 10^{-5}$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $6.7 \times 10^{-4}$ in standard form', '$0.00067$', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Add: $(3 \times 10^4) + (5 \times 10^4)$', '$8 \times 10^4$ or $80,000$', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Calculate: $(4 \times 10^5) \times (3 \times 10^{-2})$', '$1.2 \times 10^4$ or $12,000$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Calculate: $(9 \times 10^7) \div (3 \times 10^{-2})$', '$3 \times 10^9$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Calculate: $(2.5 \times 10^3)^2$', '$6.25 \times 10^6$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Earth population is about $8 \times 10^9$. Express in millions.', '$8,000$ million', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Calculate: $\frac{(6 \times 10^8) \times (4 \times 10^3)}{8 \times 10^5}$', '$3 \times 10^6$', 4);

-- ============================================
-- FINANCIAL MATHEMATICS (ADVANCED)
-- ============================================

-- Compound Interest - 20 questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
-- Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Calculate compound interest: \$100 at $2.5\%$ per month for $1$ month', '\$2.50 interest, total \$102.50', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Calculate compound interest: \$200 at $3\%$ per month for $1$ month', '\$6 interest, total \$206', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$1,000 at $1\%$ per month for $2$ months. Find total (calculate month by month).', 'Month 1: \$1,010, Month 2: \$1,020.10', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$500 at $2\%$ per month for $2$ months. Find total.', 'Month 1: \$510, Month 2: \$520.20', 1),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'How much interest is earned on \$100 at $2.5\%$ per month for $3$ months?', '\$7.69 (total: \$107.69)', 1),

-- Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$800 at $1.5\%$ per month for $3$ months. Calculate total.', '\$836.36', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$1,200 at $2\%$ per month for $4$ months. Find interest earned.', '\$98.26 interest (\$1,298.26 total)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'You invest \$600 at $3\%$ per month for $2$ months. Final value?', '\$618.54', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$2,000 at $0.5\%$ per month for $6$ months. Estimate total.', '\$2,060.45 (approx)', 2),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Compare: \$1,000 at $5\%$ simple vs $5\%$ compound (per year) for $2$ years. Which is better?', 'Compound: \$1,102.50 vs Simple: \$1,100', 2),

-- Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$5,000 at $1\%$ per month for $12$ months. Calculate final value.', '\$5,634.13', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$3,500 at $2.5\%$ per month for $6$ months. Find total interest.', '\$568.59 interest', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'You borrow \$10,000 at $1.5\%$ per month for $3$ months. What do you owe?', '\$10,456.78', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Investment of \$2,000 at $0.8\%$ per month. How much after $5$ months?', '\$2,081.29', 3),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Credit card charges $2\%$ per month. If you owe \$1,500, how much after $4$ months?', '\$1,623.64', 3),

-- Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'How many months for \$1,000 to reach approximately \$1,100 at $2\%$ per month?', '$5$ months (\$1,104.08)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Loan of \$5,000 at $1.2\%$ per month. After $10$ months with no payments, amount owed?', '\$5,633.78', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$8,000 grows to \$9,212 in $6$ months. Find the monthly interest rate.', 'Approx $2.5\%$ per month', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'What principal at $1.5\%$ per month becomes \$10,000 after $12$ months?', '\$8,364 (approx)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Calculate difference: \$20,000 at $3\%$ compound vs simple interest for $12$ months.', 'Compound: \$8,508 vs Simple: \$7,200 = \$1,308 difference', 4);
