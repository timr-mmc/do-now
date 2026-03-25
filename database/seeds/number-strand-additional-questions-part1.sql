-- ============================================
-- NUMBER STRAND - ADDITIONAL QUESTIONS PART 1
-- Add 5 more questions to each subtopic  
-- Run this AFTER running number-strand-comprehensive-questions.sql
-- ============================================

-- Comparing and Ordering Fractions - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order from smallest to largest: $\frac{7}{12}$, $\frac{5}{9}$, $\frac{11}{18}$', '$\frac{5}{9}$, $\frac{7}{12}$, $\frac{11}{18}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is larger: $\frac{13}{15}$ or $\frac{17}{20}$?', '$\frac{13}{15}$ ($=0.8\overline{6}$ vs $0.85$)', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Order: $\frac{8}{11}$, $\frac{5}{7}$, $\frac{9}{13}$, $\frac{3}{4}$ (ascending)', '$\frac{9}{13}$, $\frac{5}{7}$, $\frac{8}{11}$, $\frac{3}{4}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Which is smallest: $\frac{11}{16}$, $\frac{13}{20}$, $\frac{7}{10}$?', '$\frac{13}{20}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Comparing and Ordering Fractions'), 'Arrange in descending order: $\frac{23}{30}$, $\frac{19}{24}$, $\frac{17}{20}$', '$\frac{17}{20}$, $\frac{19}{24}$, $\frac{23}{30}$', 5);

-- Mixed Numbers and Improper Fractions - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert $\frac{127}{16}$ to a mixed number', '$7\frac{15}{16}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert $9\frac{7}{12}$ to an improper fraction', '$\frac{115}{12}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Express $\frac{234}{25}$ as a mixed number', '$9\frac{9}{25}$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Convert $12\frac{11}{15}$ to an improper fraction', '$\frac{191}{15}$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Fractions' AND subtopic = 'Mixed Numbers and Improper Fractions'), 'Express $\frac{509}{48}$ as a mixed number in simplest form', '$10\frac{29}{48}$', 5);

-- Finding Percentages - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $37.5\%$ of \$840', '\$315', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Calculate $62.5\%$ of $256$ kg', '$160$ kg', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'What is $87.5\%$ of $448$?', '$392$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $17.5\%$ of \$960', '\$168', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Calculate $33\frac{1}{3}\%$ of $567$', '$189$', 5);

-- Percentage Increase and Decrease - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase \$450 by $35\%$', '\$607.50', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $840$ by $37.5\%$', '$525$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'A \$1,200 item increases by $22.5\%$. New price?', '\$1,470', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $2,400$ by $62.5\%$', '$900$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase \$760 by $87.5\%$', '\$1,425', 5);

-- Expressing as Percentages - 5 additional questions
INSERT INTO questions (bank_id,question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $\frac{7}{8}$ as a percentage', '$87.5\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Convert $\frac{13}{20}$ to a percentage', '$65\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $234$ out of $600$ as a percentage', '$39\%$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Convert $\frac{17}{25}$ to a percentage', '$68\%$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Percentages' AND subtopic = 'Expressing as Percentages'), 'Express $147$ out of $420$ as a percentage', '$35\%$', 5);

-- Simplifying Ratios - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $144:216:180$', '$4:6:5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Express in simplest form: $135:225$', '$3:5$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify: $168:252:126$', '$4:6:3$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Write in simplest form: $294:196:490$', '$3:2:5$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify: $0.75:1.25:2$', '$3:5:8$', 5);

-- Sharing in Ratios - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$1,260 in ratio $3:4:7$. Find largest share.', '\$630', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Divide $945$ kg in ratio $2:5:8$. Find middle share.', '$315$ kg', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$2,100 as $5:7:9$. Find smallest share.', '\$500', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Divide $1,872$ in ratio $3:5:8:10$. Find largest amount.', '$720$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share \$3,360 as $4:6:9:11$. Find second largest.', '\$1,008', 5);

-- Index Laws - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(5^3)^4 \div 5^{10}$', '$5^2$ or $25$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Evaluate: $\frac{3^8 \times 3^5}{3^{11}}$', '$3^2$ or $9$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(2^3)^2 \times 2^{-4}$', '$2^2$ or $4$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Calculate: $\frac{(4^5)^2}{4^7}$', '$4^3$ or $64$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $7^{12} \div [(7^3)^2 \times 7^{-1}]$', '$7^7$', 5);

-- Square Roots and Cube Roots - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt{441}$', '$21$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Find: $\sqrt[3]{729}$', '$9$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Evaluate: $\sqrt{576}$', '$24$', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Calculate: $\sqrt[3]{1,331}$', '$11$', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Powers and Roots' AND subtopic = 'Square Roots and Cube Roots'), 'Find: $\sqrt{784}$', '$28$', 5);

-- GST Calculations - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Find GST ($15\%$) on \$360 excluding GST', '\$54', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'A price inc. GST is \$483. Find GST amount.', '\$63', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Item costs \$1,740 excl. GST. Find price inc. GST.', '\$2,001', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'Price inc. GST is \$920. Find price excl. GST.', '\$800', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'GST Calculations'), 'GST on an item is \$127.50. Find original price (excl. GST).', '\$850', 5);

-- Simple Interest - 5 additional questions
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Calculate interest: \$8,000 at $6.5\%$ p.a. for $4$ years', '\$2,080', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Find interest: \$12,500 at $7.2\%$ p.a. for $30$ months', '\$2,250', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), '\$15,000 grows to \$18,600 in $3$ years. Find rate.', '$8\%$ p.a.', 4),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Interest earned is \$1,890 on \$6,300 at $7.5\%$ p.a. Find time.', '$4$ years', 5),
((SELECT id FROM question_banks WHERE category = 'Number' AND topic = 'Financial Mathematics' AND subtopic = 'Simple Interest'), 'Total amount is \$23,400 after $5$ years at $6\%$ p.a. Find principal.', '\$18,000', 5);
