-- ============================================
-- NUMBER STRAND - ADDITIONAL QUESTIONS PART 2
-- Add 5 more questions to each subtopic
-- Run this AFTER running number-strand-comprehensive-questions-part2.sql
-- ============================================

-- Adding and Subtracting Decimals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $567.89 - 234.567 + 189.4$', '$522.723$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Evaluate: $1,234.56 - 876.543 - 234.89$', '$123.127$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'A runner''s splits: $58.45$s, $62.38$s, $59.67$s. Total time?', '$180.5$s', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'Calculate: $789.123 + 456.78 - 987.654$', '$258.249$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Adding and Subtracting Decimals'), 'From \$1,000 subtract \$123.45, \$267.89, and \$345.67', '\$262.99', 5);

-- Multiplying Decimals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $34.56 \times 7.8$', '$269.568$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Find the product: $45.75 \times 12.4$', '$567.3$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'A rectangle is $23.4$ m by $15.6$ m. Find area.', '$365.04$ m²', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Calculate: $0.375 \times 256$', '$96$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Multiplying Decimals'), 'Evaluate: $67.89 \times 23.5$', '$1,595.415$', 5);

-- Dividing Decimals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $456.8 \div 7.6$', '$60.11$ (to 2dp)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Divide: $1,234.5 \div 8.5$', '$145.24$ (to 2dp)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Share \$789.60 equally among $18$ people', '\$43.87 (to 2dp)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'Calculate: $2,345.6 \div 34$', '$69$ (approx)', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Dividing Decimals'), 'A $875.4$ km trip takes $13.5$ hours. Average speed?', '$64.84$ km/h (to 2dp)', 5);

-- Rounding Decimals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $567.8945$ to 2 decimal places', '$567.89$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $234.9678$ to 1 decimal place', '$235.0$ or $235$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $89.99567$ to 3 decimal places', '$89.996$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $1,234.56789$ to nearest hundredth', '$1,234.57$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Rounding Decimals'), 'Round $0.078945$ to 4 significant figures', '$0.07895$', 5);

-- Ordering and Comparing Decimals - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order: $3.456$, $3.465$, $3.45$, $3.5$ (ascending)', '$3.45$, $3.456$, $3.465$, $3.5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is largest: $7.089$, $7.098$, $7.09$, $7.1$?', '$7.1$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Arrange descending: $12.34$, $12.304$, $12.344$, $12.4$', '$12.4$, $12.344$, $12.34$, $12.304$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Order: $0.567$, $0.5067$, $0.5607$, $0.5$, $0.57$ (ascending)', '$0.5$, $0.5067$, $0.5607$, $0.567$, $0.57$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Decimals' AND subtopic = 'Ordering and Comparing Decimals'), 'Which is smallest: $23.456$, $23.4056$, $23.46$, $23.45$?', '$23.4056$', 5);

-- Reverse Percentages - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After $35\%$ increase, price is \$540. Find original.', '\$400', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After $25\%$ decrease, value is \$360. Find original.', '\$480', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), '$60\%$ of a number is $420$. Find the number.', '$700$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After $62.5\%$ increase, amount is \$1,300. Find original.', '\$800', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Reverse Percentages'), 'After $37.5\%$ discount, price is \$750. Find original.', '\$1,200', 5);

-- Percentage Problems - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A \$1,800 item increases by $25\%$ then decreases by $20\%$. Final price?', '\$1,800', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), '$432$ is what percentage of $1,200$?', '$36\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'A population grows from $8,500$ to $10,625$. Percentage increase?', '$25\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'Price drops from \$960 to \$720. Percentage decrease?', '$25\%$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Problems'), 'After $30\%$ gain then $30\%$ loss, \$1,000 becomes what?', '\$910', 5);

-- Direct Proportion - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $12$ items cost \$156, find cost of $35$ items', '\$455', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$18$ workers complete a job in $24$ days. How long for $16$ workers?', '$27$ days', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'If $7.5$ kg costs \$63, find cost of $12.5$ kg', '\$105', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), '$25$ machines produce $1,875$ items per hour. Rate for $40$ machines?', '$3,000$ items/hour', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Direct Proportion'), 'A car travels $567$ km on $42$ L. Distance on $70$ L?', '$945$ km', 5);

-- Scientific Notation - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Express $456,000,000$ in scientific notation', '$4.56 \times 10^8$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Write $0.00000789$ in scientific notation', '$7.89 \times 10^{-6}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Calculate: $(3 \times 10^7) \times (4 \times 10^5)$', '$1.2 \times 10^{13}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Divide: $(8.4 \times 10^9) \div (2.1 \times 10^4)$', '$4 \times 10^5$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Scientific Notation'), 'Express $(5 \times 10^{-3})^2$ in scientific notation', '$2.5 \times 10^{-5}$', 5);

-- Compound Interest - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Find value: \$5,000 at $8\%$ p.a. compounded for $3$ years', '\$6,298.56', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$12,000 at $6.5\%$ p.a. compounded for $4$ years', '\$15,423.38', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Interest earned: \$8,000 at $7\%$ p.a. for $5$ years (compound)', '\$3,220.30', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), '\$20,000 at $5.5\%$ p.a. compounded for $6$ years', '\$27,595.45', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Compound Interest'), 'Find compound interest: \$15,000 at $9\%$ p.a. for $4$ years', '\$6,169.03', 5);
