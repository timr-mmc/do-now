-- ============================================
-- INITIALIZE QUESTION BANKS
-- Creates all topic/subtopic entries required for Number strand questions
-- Run this BEFORE running the question insert scripts
-- ============================================

-- Delete existing Number strand question banks (optional - comment out if you want to keep existing)
-- DELETE FROM question_banks WHERE category = 'Number';

-- Insert all required question banks
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
-- INTEGERS
('Number', 'Integers', 'Integer Operations', 'Operations with positive and negative integers'),

-- FRACTIONS
('Number', 'Fractions', 'Adding and Subtracting Fractions', 'Adding and subtracting fractions with different denominators'),
('Number', 'Fractions', 'Multiplying and Dividing Fractions', 'Multiplying and dividing fractions and mixed numbers'),
('Number', 'Fractions', 'Equivalent Fractions and Simplification', 'Finding equivalent fractions and simplifying'),
('Number', 'Fractions', 'Comparing and Ordering Fractions', 'Comparing and ordering fractions'),
('Number', 'Fractions', 'Mixed Numbers and Improper Fractions', 'Converting between mixed numbers and improper fractions'),

-- DECIMALS
('Number', 'Decimals', 'Adding and Subtracting Decimals', 'Adding and subtracting decimal numbers'),
('Number', 'Decimals', 'Multiplying Decimals', 'Multiplying decimal numbers'),
('Number', 'Decimals', 'Dividing Decimals', 'Dividing decimal numbers'),
('Number', 'Decimals', 'Rounding Decimals', 'Rounding decimals to various decimal places'),
('Number', 'Decimals', 'Ordering and Comparing Decimals', 'Comparing and ordering decimal numbers'),

-- PERCENTAGES
('Number', 'Percentages', 'Finding Percentages', 'Finding percentages of quantities'),
('Number', 'Percentages', 'Percentage Increase and Decrease', 'Calculating percentage increases and decreases'),
('Number', 'Percentages', 'Expressing as Percentages', 'Converting fractions and decimals to percentages'),
('Number', 'Percentages', 'Reverse Percentages', 'Finding original values from percentage changes'),
('Number', 'Percentages', 'Percentage Problems', 'Solving complex percentage problems'),

-- RATIOS
('Number', 'Ratios', 'Simplifying Ratios', 'Simplifying ratios to lowest terms'),
('Number', 'Ratios', 'Sharing in Ratios', 'Dividing quantities according to given ratios'),
('Number', 'Ratios', 'Direct Proportion', 'Solving direct proportion problems'),

-- POWERS AND ROOTS
('Number', 'Powers and Roots', 'Index Laws', 'Applying index laws to simplify expressions'),
('Number', 'Powers and Roots', 'Square and Cube Roots', 'Finding square roots and cube roots'),
('Number', 'Powers and Roots', 'Scientific Notation', 'Writing numbers in scientific notation'),
('Number', 'Powers and Roots', 'Powers of 2', 'Working with powers of 2'),
('Number', 'Powers and Roots', 'Approximating Roots', 'Estimating square and cube roots'),
('Number', 'Powers and Roots', 'Reciprocals', 'Finding and working with reciprocals'),

-- FINANCIAL MATHEMATICS
('Number', 'Financial Mathematics', 'GST Calculations', 'Calculating GST on prices'),
('Number', 'Financial Mathematics', 'Simple Interest', 'Calculating simple interest'),
('Number', 'Financial Mathematics', 'Compound Interest', 'Calculating compound interest'),
('Number', 'Financial Mathematics', 'Currency Conversions', 'Converting between currencies'),
('Number', 'Financial Mathematics', 'Mark-ups and Discounts', 'Calculating mark-ups and discounts'),
('Number', 'Financial Mathematics', 'Cost Proportions and Best Value', 'Finding unit prices and best value'),

-- FACTORS AND MULTIPLES
('Number', 'Factors and Multiples', 'Factors and Multiples', 'Finding factors and multiples of numbers'),
('Number', 'Factors and Multiples', 'HCF and LCM', 'Finding highest common factors and lowest common multiples'),
('Number', 'Factors and Multiples', 'Prime Factorization', 'Expressing numbers as products of prime factors'),

-- NUMBER SENSE
('Number', 'Number Sense', 'Estimation Strategies', 'Estimating and approximating calculations')

ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Verify the insert
SELECT COUNT(*) as total_banks, topic, COUNT(subtopic) as subtopic_count 
FROM question_banks 
WHERE category = 'Number' 
GROUP BY topic
ORDER BY topic;
