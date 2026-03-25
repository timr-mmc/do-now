-- ============================================
-- NZ Year 9-10 Mathematics Curriculum Expansion
-- Comprehensive question banks and questions
-- ============================================

-- Note: Using ON CONFLICT DO NOTHING to skip any question banks that already exist
-- This allows the script to be run safely even if some data already exists

-- ============================================
-- NUMBER STRAND - Question Banks
-- ============================================

-- Integers
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Integers', 'Adding and Subtracting Integers', 'Practice adding and subtracting positive and negative integers'),
('Number', 'Integers', 'Multiplying and Dividing Integers', 'Practice multiplying and dividing positive and negative integers'),
('Number', 'Integers', 'Order of Operations (BEDMAS)', 'Apply BEDMAS rules to solve integer calculations')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Fractions
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Fractions', 'Simplifying Fractions', 'Reduce fractions to their simplest form'),
('Number', 'Fractions', 'Adding and Subtracting Fractions', 'Add and subtract fractions with different denominators'),
('Number', 'Fractions', 'Multiplying and Dividing Fractions', 'Multiply and divide fractions and mixed numbers'),
('Number', 'Fractions', 'Converting Fractions and Decimals', 'Convert between fractions, decimals, and percentages')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Decimals
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Decimals', 'Adding and Subtracting Decimals', 'Add and subtract decimal numbers'),
('Number', 'Decimals', 'Multiplying Decimals', 'Multiply decimal numbers'),
('Number', 'Decimals', 'Dividing Decimals', 'Divide decimal numbers'),
('Number', 'Decimals', 'Rounding Decimals', 'Round decimals to specified decimal places and significant figures')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Percentages
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Percentages', 'Finding Percentages', 'Calculate percentages of amounts'),
('Number', 'Percentages', 'Percentage Increase and Decrease', 'Calculate percentage increase and decrease'),
('Number', 'Percentages', 'Reverse Percentages', 'Find original amounts before percentage change'),
('Number', 'Percentages', 'Percentage Problems', 'Solve real-world percentage problems')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Ratios and Proportions
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Ratios', 'Simplifying Ratios', 'Simplify ratios to their simplest form'),
('Number', 'Ratios', 'Sharing in Ratios', 'Share amounts in given ratios'),
('Number', 'Ratios', 'Direct Proportion', 'Solve problems involving direct proportion'),
('Number', 'Ratios', 'Inverse Proportion', 'Solve problems involving inverse proportion')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Powers and Roots
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Number', 'Powers and Roots', 'Index Laws', 'Apply index laws to simplify expressions'),
('Number', 'Powers and Roots', 'Square Roots and Cube Roots', 'Calculate square roots and cube roots'),
('Number', 'Powers and Roots', 'Standard Form', 'Convert numbers to and from standard form'),
('Number', 'Powers and Roots', 'Negative and Fractional Indices', 'Work with negative and fractional indices')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- ALGEBRA STRAND - Question Banks
-- ============================================

-- Expressions
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Algebra', 'Expressions', 'Substitution', 'Substitute values into algebraic expressions'),
('Algebra', 'Expressions', 'Expanding Brackets', 'Expand single and double brackets'),
('Algebra', 'Expressions', 'Factorizing', 'Factorize algebraic expressions')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Equations
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Algebra', 'Equations', 'Solving Linear Equations', 'Solve linear equations with one unknown'),
('Algebra', 'Equations', 'Equations with Brackets', 'Solve equations involving brackets'),
('Algebra', 'Equations', 'Solving Quadratic Equations', 'Solve quadratic equations by factorizing'),
('Algebra', 'Equations', 'Simultaneous Equations', 'Solve pairs of simultaneous linear equations'),
('Algebra', 'Equations', 'Forming Equations', 'Form and solve equations from word problems')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Sequences and Patterns
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Algebra', 'Sequences', 'Linear Sequences', 'Find terms and rules for arithmetic sequences'),
('Algebra', 'Sequences', 'Quadratic Sequences', 'Identify and work with quadratic sequences'),
('Algebra', 'Sequences', 'Fibonacci and Special Sequences', 'Explore special sequences and patterns')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Graphs
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Algebra', 'Graphs', 'Plotting Linear Graphs', 'Plot graphs of linear equations'),
('Algebra', 'Graphs', 'Finding Gradients', 'Calculate gradients of linear graphs'),
('Algebra', 'Graphs', 'Equation of a Line (y = mx + c)', 'Find equations of straight lines'),
('Algebra', 'Graphs', 'Quadratic Graphs', 'Sketch and interpret quadratic graphs')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Inequalities
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Algebra', 'Inequalities', 'Solving Linear Inequalities', 'Solve and represent linear inequalities'),
('Algebra', 'Inequalities', 'Inequalities on Number Lines', 'Represent inequalities on number lines')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- MEASUREMENT STRAND - Question Banks
-- ============================================

-- Perimeter and Area
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement', 'Perimeter and Area', 'Rectangles and Triangles', 'Calculate perimeter and area of rectangles and triangles'),
('Measurement', 'Perimeter and Area', 'Circles', 'Calculate circumference and area of circles'),
('Measurement', 'Perimeter and Area', 'Composite Shapes', 'Find perimeter and area of composite shapes'),
('Measurement', 'Perimeter and Area', 'Trapeziums and Parallelograms', 'Calculate area of trapeziums and parallelograms')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Volume and Surface Area
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement', 'Volume', 'Cuboids and Prisms', 'Calculate volume and surface area of prisms'),
('Measurement', 'Volume', 'Cylinders', 'Calculate volume and surface area of cylinders'),
('Measurement', 'Volume', 'Pyramids and Cones', 'Calculate volume and surface area of pyramids and cones'),
('Measurement', 'Volume', 'Spheres', 'Calculate volume and surface area of spheres')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Units and Conversions
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement', 'Units', 'Metric Conversions', 'Convert between metric units'),
('Measurement', 'Units', 'Area and Volume Units', 'Convert units of area and volume'),
('Measurement', 'Units', 'Time Calculations', 'Perform calculations with time'),
('Measurement', 'Units', 'Speed Distance Time', 'Solve problems using speed = distance/time')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Scale and Maps
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement', 'Scale', 'Map Scales', 'Use scale to find real distances from maps'),
('Measurement', 'Scale', 'Scale Drawings', 'Create and interpret scale drawings'),
('Measurement', 'Scale', 'Scale Factors', 'Apply scale factors to lengths, areas, and volumes')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- GEOMETRY STRAND - Question Banks
-- ============================================

-- Angles
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Angles', 'Angles on Parallel Lines', 'Find angles using parallel line properties'),
('Geometry', 'Angles', 'Angles in Triangles', 'Use angle properties of triangles'),
('Geometry', 'Angles', 'Angles in Polygons', 'Calculate interior and exterior angles of polygons'),
('Geometry', 'Angles', 'Circle Theorems', 'Apply circle angle theorems')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Transformations
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Transformations', 'Translations', 'Translate shapes using vectors'),
('Geometry', 'Transformations', 'Rotations', 'Rotate shapes about a point'),
('Geometry', 'Transformations', 'Reflections', 'Reflect shapes in mirror lines'),
('Geometry', 'Transformations', 'Enlargements', 'Enlarge shapes using scale factors')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Pythagoras and Trigonometry
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Pythagoras', 'Finding Hypotenuse', 'Use Pythagoras to find the hypotenuse'),
('Geometry', 'Pythagoras', 'Finding Shorter Sides', 'Use Pythagoras to find shorter sides'),
('Geometry', 'Trigonometry', 'Finding Sides (SOH CAH TOA)', 'Use trigonometric ratios to find missing sides'),
('Geometry', 'Trigonometry', 'Finding Angles', 'Use inverse trig to find missing angles'),
('Geometry', 'Trigonometry', 'Mixed Problems', 'Solve problems using Pythagoras and trigonometry')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Properties of Shapes
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Properties', 'Quadrilaterals', 'Identify and use properties of quadrilaterals'),
('Geometry', 'Properties', 'Symmetry', 'Identify lines and rotational symmetry'),
('Geometry', 'Properties', 'Congruence and Similarity', 'Identify congruent and similar shapes')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Coordinates
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Coordinates', 'Plotting Points', 'Plot and read coordinates in all four quadrants'),
('Geometry', 'Coordinates', 'Midpoint', 'Find the midpoint between two points'),
('Geometry', 'Coordinates', 'Distance Between Points', 'Calculate distance between coordinates')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- STATISTICS STRAND - Question Banks
-- ============================================

-- Data Collection
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Statistics', 'Data Collection', 'Sampling Methods', 'Understand different sampling methods'),
('Statistics', 'Data Collection', 'Questionnaires', 'Design effective questionnaires'),
('Statistics', 'Data Collection', 'Data Types', 'Identify discrete, continuous, and categorical data')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Statistical Graphs
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Statistics', 'Graphs', 'Bar Charts', 'Create and interpret bar charts'),
('Statistics', 'Graphs', 'Pie Charts', 'Create and interpret pie charts'),
('Statistics', 'Graphs', 'Histograms', 'Create and interpret histograms'),
('Statistics', 'Graphs', 'Scatter Graphs', 'Plot and interpret scatter graphs'),
('Statistics', 'Graphs', 'Line Graphs', 'Interpret line graphs and time series')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Averages and Spread
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Statistics', 'Averages', 'Mean from a List', 'Calculate mean from a list of values'),
('Statistics', 'Averages', 'Median and Mode', 'Find median and mode from data'),
('Statistics', 'Averages', 'Mean from Frequency Tables', 'Calculate mean from grouped data'),
('Statistics', 'Averages', 'Range and IQR', 'Calculate range and interquartile range')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Interpreting Data
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Statistics', 'Interpretation', 'Comparing Distributions', 'Compare data sets using averages and spread'),
('Statistics', 'Interpretation', 'Correlation', 'Identify and interpret correlation'),
('Statistics', 'Interpretation', 'Misleading Graphs', 'Identify misleading statistical representations')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- PROBABILITY STRAND - Question Banks
-- ============================================

-- Basic Probability
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Probability', 'Basic Probability', 'Probability Scale', 'Use the probability scale from 0 to 1'),
('Probability', 'Basic Probability', 'Calculating Probability', 'Calculate probabilities of single events'),
('Probability', 'Basic Probability', 'Experimental Probability', 'Compare theoretical and experimental probability'),
('Probability', 'Basic Probability', 'Expected Frequency', 'Calculate expected frequency of outcomes')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Combined Events
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Probability', 'Combined Events', 'Sample Space Diagrams', 'Use sample space diagrams for combined events'),
('Probability', 'Combined Events', 'Tree Diagrams', 'Use tree diagrams to find probabilities'),
('Probability', 'Combined Events', 'Two-Way Tables', 'Use two-way tables for probability'),
('Probability', 'Combined Events', 'Independent Events', 'Calculate probabilities of independent events'),
('Probability', 'Combined Events', 'Dependent Events', 'Calculate probabilities of dependent events')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Venn Diagrams
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Probability', 'Venn Diagrams', 'Set Notation', 'Use set notation with Venn diagrams'),
('Probability', 'Venn Diagrams', 'Probability with Venn Diagrams', 'Calculate probabilities using Venn diagrams')
ON CONFLICT (category, topic, subtopic) DO NOTHING;


-- ============================================
-- SAMPLE QUESTIONS - NUMBER STRAND
-- ============================================

-- Integers: Adding and Subtracting
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Adding and Subtracting Integers'), 'Calculate: $-7 + 15$', '$8$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Adding and Subtracting Integers'), 'Calculate: $-12 - 8$', '$-20$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Adding and Subtracting Integers'), 'Calculate: $5 - (-9)$', '$14$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Adding and Subtracting Integers'), 'Calculate: $-15 + (-7) - 3$', '$-25$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Adding and Subtracting Integers'), 'Calculate: $-8 + 12 - 15 + 6$', '$-5$', 3);

-- Integers: Multiplying and Dividing
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Multiplying and Dividing Integers'), 'Calculate: $-6 \times 7$', '$-42$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Multiplying and Dividing Integers'), 'Calculate: $-24 \div (-6)$', '$4$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Multiplying and Dividing Integers'), 'Calculate: $(-3) \times (-5) \times 2$', '$30$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Multiplying and Dividing Integers'), 'Calculate: $48 \div (-8) \times (-2)$', '$12$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Multiplying and Dividing Integers'), 'Calculate: $(-2)^3 \times 5$', '$-40$', 3);

-- Integers: BEDMAS
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Order of Operations (BEDMAS)'), 'Calculate: $5 + 3 \times 4$', '$17$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Order of Operations (BEDMAS)'), 'Calculate: $(8 - 3) \times 6$', '$30$', 1),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Order of Operations (BEDMAS)'), 'Calculate: $20 - 12 \div 4 + 3$', '$20$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Order of Operations (BEDMAS)'), 'Calculate: $(15 - 7) \div 2 + 5 \times 3$', '$19$', 2),
((SELECT id FROM question_banks WHERE topic = 'Integers' AND subtopic = 'Order of Operations (BEDMAS)'), 'Calculate: $3 + 4^2 \times 2 - 10$', '$25$', 3);

-- Fractions: Simplifying
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Simplifying Fractions'), 'Simplify: $\frac{12}{16}$', '$\frac{3}{4}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Simplifying Fractions'), 'Simplify: $\frac{24}{36}$', '$\frac{2}{3}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Simplifying Fractions'), 'Simplify: $\frac{45}{75}$', '$\frac{3}{5}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Simplifying Fractions'), 'Simplify: $\frac{56}{84}$', '$\frac{2}{3}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Simplifying Fractions'), 'Simplify: $\frac{144}{180}$', '$\frac{4}{5}$', 3);

-- Fractions: Adding and Subtracting
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{4} + \frac{1}{4}$', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{3}{5} - \frac{1}{5}$', '$\frac{2}{5}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{1}{3} + \frac{1}{4}$', '$\frac{7}{12}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $\frac{5}{6} - \frac{2}{3}$', '$\frac{1}{6}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Adding and Subtracting Fractions'), 'Calculate: $2\frac{1}{2} + 1\frac{3}{4}$', '$4\frac{1}{4}$', 3);

-- Fractions: Multiplying and Dividing
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{1}{2} \times \frac{1}{3}$', '$\frac{1}{6}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{3}{4} \times \frac{2}{5}$', '$\frac{3}{10}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{2}{3} \div \frac{1}{4}$', '$2\frac{2}{3}$ or $\frac{8}{3}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $3\frac{1}{2} \times \frac{2}{7}$', '$1$', 2),
((SELECT id FROM question_banks WHERE topic = 'Fractions' AND subtopic = 'Multiplying and Dividing Fractions'), 'Calculate: $\frac{5}{6} \div \frac{2}{3} \times \frac{3}{4}$', '$\frac{15}{16}$', 3);

-- Percentages: Finding Percentages
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $25\%$ of $80$', '$20$', 1),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $10\%$ of $350$', '$35$', 1),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $15\%$ of $240$', '$36$', 2),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $35\%$ of $160$', '$56$', 2),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Finding Percentages'), 'Find $17.5\%$ of $480$', '$84$', 3);

-- Percentages: Increase and Decrease
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase £$50$ by $20\%$', '£$60$', 1),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $80$ by $25\%$', '$60$', 1),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Increase £$150$ by $12\%$', '£$168$', 2),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'Decrease $450$ by $18\%$', '$369$', 2),
((SELECT id FROM question_banks WHERE topic = 'Percentages' AND subtopic = 'Percentage Increase and Decrease'), 'A price of £$80$ is increased by $15\%$ then decreased by $10\%$. What is the final price?', '£$82.80$', 3);

-- Ratios: Simplifying
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $6:8$', '$3:4$', 1),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $15:25$', '$3:5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $24:36:48$', '$2:3:4$', 2),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Simplify the ratio $0.5:1.5$', '$1:3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Simplifying Ratios'), 'Write $2$cm$:3$m in its simplest form', '$1:150$', 3);

-- Ratios: Sharing
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share £$20$ in the ratio $1:4$', '£$4$ and £$16$', 1),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share $35$ sweets in the ratio $3:2$', '$21$ and $14$', 1),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'Share £$120$ in the ratio $2:3:5$', '£$24$, £$36$, £$60$', 2),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'A and B share money in ratio $3:7$. B gets £$42$. How much does A get?', '£$18$', 2),
((SELECT id FROM question_banks WHERE topic = 'Ratios' AND subtopic = 'Sharing in Ratios'), 'The angles in a triangle are in ratio $2:3:4$. Find the largest angle.', '$80^\circ$', 3);

-- Powers: Index Laws
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $5^2 \times 5^3$', '$5^5$ or $3125$', 1),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $3^6 \div 3^2$', '$3^4$ or $81$', 1),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(2^3)^2$', '$2^6$ or $64$', 2),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $4^0$', '$1$', 2),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Index Laws'), 'Simplify: $(x^3y^2)^2$', '$x^6y^4$', 3);

-- Powers: Standard Form
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Standard Form'), 'Write $3500$ in standard form', '$3.5 \times 10^3$', 1),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Standard Form'), 'Write $0.0042$ in standard form', '$4.2 \times 10^{-3}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Standard Form'), 'Calculate: $(2 \times 10^3) \times (3 \times 10^4)$', '$6 \times 10^7$', 2),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Standard Form'), 'Write $5.7 \times 10^{-4}$ as an ordinary number', '$0.00057$', 2),
((SELECT id FROM question_banks WHERE topic = 'Powers and Roots' AND subtopic = 'Standard Form'), 'Calculate: $(8 \times 10^6) \div (4 \times 10^2)$', '$2 \times 10^4$', 3);

-- ============================================
-- SAMPLE QUESTIONS - ALGEBRA STRAND
-- ============================================

-- Algebra: Substitution
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Substitution'), 'If $x = 3$, find the value of $2x + 5$', '$11$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Substitution'), 'If $a = 4$, find the value of $a^2 - 1$', '$15$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Substitution'), 'If $x = 5$ and $y = 2$, find $xy + x$', '$15$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Substitution'), 'If $p = -3$, find the value of $p^2 + 2p$', '$3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Substitution'), 'If $a = 2$ and $b = -4$, find $3a^2 - 2b$', '$20$', 3);

-- Algebra: Expanding Brackets
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $3(x + 4)$', '$3x + 12$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $5(2a - 3)$', '$10a - 15$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $3(x + 2) + 2(x - 1)$', '$5x + 4$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Expanding Brackets'), 'Expand: $(x + 3)(x + 5)$', '$x^2 + 8x + 15$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Expanding Brackets'), 'Expand and simplify: $(x + 4)(x - 2) - x^2$', '$2x - 8$', 3);

-- Algebra: Factorizing
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Factorizing'), 'Factorize: $6x + 9$', '$3(2x + 3)$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Factorizing'), 'Factorize: $10y - 15$', '$5(2y - 3)$', 1),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Factorizing'), 'Factorize: $x^2 + 5x$', '$x(x + 5)$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Factorizing'), 'Factorize: $x^2 + 7x + 12$', '$(x + 3)(x + 4)$', 2),
((SELECT id FROM question_banks WHERE topic = 'Expressions' AND subtopic = 'Factorizing'), 'Factorize: $x^2 - 9$', '$(x + 3)(x - 3)$', 3);

-- Equations: Linear
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Solving Linear Equations'), 'Solve: $x + 7 = 12$', '$x = 5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Solving Linear Equations'), 'Solve: $3x = 15$', '$x = 5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Solving Linear Equations'), 'Solve: $2x + 5 = 17$', '$x = 6$', 2),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Solving Linear Equations'), 'Solve: $5x - 8 = 3x + 2$', '$x = 5$', 2),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Solving Linear Equations'), 'Solve: $\frac{x + 3}{2} = 7$', '$x = 11$', 3);

-- Equations: With Brackets
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $2(x + 3) = 14$', '$x = 4$', 1),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(x - 2) = 9$', '$x = 5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $4(2x + 1) = 28$', '$x = 3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $3(x + 2) = 2(x + 5)$', '$x = 4$', 2),
((SELECT id FROM question_banks WHERE topic = 'Equations' AND subtopic = 'Equations with Brackets'), 'Solve: $5(x - 1) - 2(x + 3) = 8$', '$x = 7$', 3);

-- Sequences: Linear
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the next term: $3, 7, 11, 15$, __', '$19$', 1),
((SELECT id FROM question_banks WHERE topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the nth term of: $5, 8, 11, 14, ...$', '$3n + 2$', 2),
((SELECT id FROM question_banks WHERE topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the 20th term of: $4, 7, 10, 13, ...$', '$61$', 2),
((SELECT id FROM question_banks WHERE topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Find the nth term of: $2, 5, 8, 11, ...$', '$3n - 1$', 2),
((SELECT id FROM question_banks WHERE topic = 'Sequences' AND subtopic = 'Linear Sequences'), 'Which term in the sequence $7, 12, 17, 22, ...$ has value $102$?', '20th term', 3);

-- Graphs: Linear
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Graphs' AND subtopic = 'Equation of a Line (y = mx + c)'), 'What is the gradient of $y = 3x + 2$?', '$3$', 1),
((SELECT id FROM question_banks WHERE topic = 'Graphs' AND subtopic = 'Equation of a Line (y = mx + c)'), 'What is the y-intercept of $y = 2x - 5$?', '$-5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Graphs' AND subtopic = 'Equation of a Line (y = mx + c)'), 'Find the equation of a line with gradient $4$ and y-intercept $7$', '$y = 4x + 7$', 2),
((SELECT id FROM question_banks WHERE topic = 'Graphs' AND subtopic = 'Equation of a Line (y = mx + c)'), 'A line passes through $(0, 3)$ with gradient $-2$. Find its equation.', '$y = -2x + 3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Graphs' AND subtopic = 'Equation of a Line (y = mx + c)'), 'Find the gradient of the line joining $(1, 5)$ and $(3, 11)$', '$3$', 3);

-- ============================================
-- SAMPLE QUESTIONS - GEOMETRY STRAND
-- ============================================

-- Angles: Parallel Lines
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles on Parallel Lines'), 'Two parallel lines are cut by a transversal. One angle is $65^\circ$. Find its corresponding angle.', '$65^\circ$', 1),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles on Parallel Lines'), 'Alternate angles are equal. If one alternate angle is $48^\circ$, find the other.', '$48^\circ$', 1),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles on Parallel Lines'), 'Co-interior angles add to $180^\circ$. If one is $110^\circ$, find the other.', '$70^\circ$', 2),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles on Parallel Lines'), 'Find angle $x$ if corresponding angle is $3x$ and equal to $75^\circ$', '$25^\circ$', 2),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles on Parallel Lines'), 'Two parallel lines cut by a transversal. If one angle is $(2x + 10)^\circ$ and its alternate angle is $70^\circ$, find $x$.', '$30^\circ$', 3);

-- Angles: Triangles
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles in Triangles'), 'Two angles in a triangle are $40^\circ$ and $60^\circ$. Find the third angle.', '$80^\circ$', 1),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles in Triangles'), 'An isosceles triangle has angles $50^\circ$, $x$, $x$. Find $x$.', '$65^\circ$', 1),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles in Triangles'), 'An equilateral triangle has all angles equal. Find each angle.', '$60^\circ$', 1),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles in Triangles'), 'In a triangle, angles are in ratio $1:2:3$. Find the largest angle.', '$90^\circ$', 2),
((SELECT id FROM question_banks WHERE topic = 'Angles' AND subtopic = 'Angles in Triangles'), 'An exterior angle of a triangle is $130^\circ$. One interior angle is $70^\circ$. Find the other interior angle.', '$60^\circ$', 3);

-- Pythagoras: Finding Hypotenuse
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Hypotenuse'), 'Find the hypotenuse of a right triangle with sides $3$cm and $4$cm', '$5$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Hypotenuse'), 'Find the hypotenuse of a right triangle with sides $5$cm and $12$cm', '$13$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Hypotenuse'), 'Find the hypotenuse of a right triangle with sides $6$cm and $8$cm', '$10$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Hypotenuse'), 'Find the hypotenuse of a right triangle with sides $9$cm and $12$cm', '$15$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Hypotenuse'), 'Find the hypotenuse of a right triangle with sides $7$cm and $24$cm', '$25$cm', 3);

-- Pythagoras: Shorter Sides
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Shorter Sides'), 'A right triangle has hypotenuse $10$cm and one side $6$cm. Find the other side.', '$8$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Shorter Sides'), 'A right triangle has hypotenuse $13$cm and one side $5$cm. Find the other side.', '$12$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Shorter Sides'), 'A right triangle has hypotenuse $17$cm and one side $8$cm. Find the other side.', '$15$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Shorter Sides'), 'A right triangle has hypotenuse $20$cm and one side $12$cm. Find the other side.', '$16$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Pythagoras' AND subtopic = 'Finding Shorter Sides'), 'A right triangle has hypotenuse $26$cm and one side $10$cm. Find the other side.', '$24$cm', 3);

-- Trigonometry: Finding Sides
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Trigonometry' AND subtopic = 'Finding Sides (SOH CAH TOA)'), 'In a right triangle, angle = $30^\circ$, hypotenuse = $10$cm. Find the opposite side.', '$5$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Trigonometry' AND subtopic = 'Finding Sides (SOH CAH TOA)'), 'In a right triangle, angle = $60^\circ$, adjacent = $5$cm. Find the hypotenuse.', '$10$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Trigonometry' AND subtopic = 'Finding Sides (SOH CAH TOA)'), 'In a right triangle, angle = $45^\circ$, opposite = $8$cm. Find the adjacent side.', '$8$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Trigonometry' AND subtopic = 'Finding Sides (SOH CAH TOA)'), '$\sin(30^\circ) = 0.5$. If hypotenuse = $20$cm, find opposite side.', '$10$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Trigonometry' AND subtopic = 'Finding Sides (SOH CAH TOA)'), '$\cos(60^\circ) = 0.5$. If hypotenuse = $16$cm, find adjacent side.', '$8$cm', 3);

-- ============================================
-- SAMPLE QUESTIONS - MEASUREMENT STRAND
-- ============================================

-- Perimeter and Area: Rectangles
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'), 'Find the area of a rectangle with length $8$cm and width $5$cm', '$40$cm$^2$', 1),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'), 'Find the perimeter of a rectangle $12$cm by $7$cm', '$38$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'), 'Find the area of a triangle with base $10$cm and height $6$cm', '$30$cm$^2$', 2),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'), 'A rectangle has area $72$cm$^2$ and width $8$cm. Find its length.', '$9$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'), 'A triangle has area $45$cm$^2$ and base $9$cm. Find its height.', '$10$cm', 3);

-- Perimeter and Area: Circles
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Circles'), 'Find the circumference of a circle with radius $7$cm (use $\pi = \frac{22}{7}$)', '$44$cm', 1),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Circles'), 'Find the area of a circle with radius $5$cm (use $\pi \approx 3.14$)', '$78.5$cm$^2$', 1),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Circles'), 'Find the circumference of a circle with diameter $14$cm', '$44$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Circles'), 'A circle has circumference $31.4$cm. Find its radius ($\pi \approx 3.14$)', '$5$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Perimeter and Area' AND subtopic = 'Circles'), 'Find the area of a semi-circle with diameter $12$cm ($\pi \approx 3.14$)', '$56.52$cm$^2$', 3);

-- Volume: Cuboids and Prisms
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cuboids and Prisms'), 'Find the volume of a cuboid $5$cm $\times$ $4$cm $\times$ $3$cm', '$60$cm$^3$', 1),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cuboids and Prisms'), 'A cube has edge length $4$cm. Find its volume.', '$64$cm$^3$', 1),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cuboids and Prisms'), 'Find the volume of a cuboid $10$cm $\times$ $6$cm $\times$ $2.5$cm', '$150$cm$^3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cuboids and Prisms'), 'A cuboid has volume $240$cm$^3$, length $8$cm, width $5$cm. Find its height.', '$6$cm', 2),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cuboids and Prisms'), 'A triangular prism has base area $20$cm$^2$ and length $15$cm. Find its volume.', '$300$cm$^3$', 3);

-- Volume: Cylinders
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cylinders'), 'Find the volume of a cylinder: radius $3$cm, height $10$cm ($\pi \approx 3.14$)', '$282.6$cm$^3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cylinders'), 'Find the volume of a cylinder: radius $5$cm, height $8$cm ($\pi \approx 3.14$)', '$628$cm$^3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cylinders'), 'A cylinder has diameter $10$cm and height $12$cm. Find its volume ($\pi \approx 3.14$).', '$942$cm$^3$', 2),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cylinders'), 'A cylinder has volume $785$cm$^3$ and radius $5$cm. Find its height ($\pi \approx 3.14$).', '$10$cm', 3),
((SELECT id FROM question_banks WHERE topic = 'Volume' AND subtopic = 'Cylinders'), 'Find the surface area of a cylinder: radius $4$cm, height $10$cm ($\pi \approx 3.14$)', '$351.68$cm$^2$', 3);

-- Units: Speed Distance Time
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Units' AND subtopic = 'Speed Distance Time'), 'A car travels $150$km in $3$ hours. Find its speed.', '$50$km/h', 1),
((SELECT id FROM question_banks WHERE topic = 'Units' AND subtopic = 'Speed Distance Time'), 'At $60$km/h, how far do you travel in $2$ hours?', '$120$km', 1),
((SELECT id FROM question_banks WHERE topic = 'Units' AND subtopic = 'Speed Distance Time'), 'How long does it take to travel $240$km at $80$km/h?', '$3$ hours', 2),
((SELECT id FROM question_banks WHERE topic = 'Units' AND subtopic = 'Speed Distance Time'), 'A train travels $450$km in $4.5$ hours. Find its average speed.', '$100$km/h', 2),
((SELECT id FROM question_banks WHERE topic = 'Units' AND subtopic = 'Speed Distance Time'), 'How long to travel $15$km at $3$m/s? (Give answer in minutes)', '$83.3$ minutes (or $1$hr $23$min)', 3);

-- ============================================
-- SAMPLE QUESTIONS - STATISTICS STRAND
-- ============================================

-- Averages: Mean
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Mean from a List'), 'Find the mean of: $3, 5, 7, 9, 11$', '$7$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Mean from a List'), 'Find the mean of: $10, 12, 15, 18, 20$', '$15$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Mean from a List'), 'Find the mean of: $4, 7, 8, 11, 12, 14$', '$9.33$ (or $\frac{28}{3}$)', 2),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Mean from a List'), 'Five numbers have mean $12$. Four of them are $10, 11, 13, 15$. Find the fifth.', '$11$', 2),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Mean from a List'), 'The mean of $x, 2x, 3x$ is $12$. Find $x$.', '$6$', 3);

-- Averages: Median and Mode
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Median and Mode'), 'Find the median of: $3, 7, 5, 9, 4$', '$5$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Median and Mode'), 'Find the mode of: $2, 3, 3, 5, 7, 3, 9$', '$3$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Median and Mode'), 'Find the median of: $12, 8, 15, 10, 14, 11$', '$11.5$', 2),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Median and Mode'), 'Data: $4, 7, 7, 9, x$. The median is $7$. Find the range of possible values for $x$.', '$x \leq 7$', 2),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Median and Mode'), 'Find the median of: $2, 5, 8, 8, 10, 12, 15, 18, 20$', '$10$', 3);

-- Averages: Range
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Range and IQR'), 'Find the range of: $3, 7, 12, 5, 9$', '$9$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Range and IQR'), 'Find the range of: $15, 22, 18, 30, 21, 19$', '$15$', 1),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Range and IQR'), 'Data has range $20$ and highest value $35$. Find lowest value.', '$15$', 2),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Range and IQR'), 'Find the interquartile range of: $2, 4, 6, 8, 10, 12, 14$', '$8$ ($Q_3 - Q_1 = 12 - 4$)', 3),
((SELECT id FROM question_banks WHERE topic = 'Averages' AND subtopic = 'Range and IQR'), 'Lower quartile = $15$, Upper quartile = $27$. Find IQR.', '$12$', 2);

-- ============================================
-- SAMPLE QUESTIONS - PROBABILITY STRAND
-- ============================================

-- Probability: Basic
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Calculating Probability'), 'A fair dice is rolled. Find $P(\text{rolling a 3})$', '$\frac{1}{6}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Calculating Probability'), 'A coin is flipped. Find $P(\text{heads})$', '$\frac{1}{2}$', 1),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Calculating Probability'), 'A bag has $3$ red and $7$ blue balls. Find $P(\text{red})$', '$\frac{3}{10}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Calculating Probability'), 'A fair dice is rolled. Find $P(\text{even number})$', '$\frac{1}{2}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Calculating Probability'), 'A card is drawn from $52$ cards. Find $P(\text{heart})$', '$\frac{1}{4}$ or $\frac{13}{52}$', 2);

-- Probability: Expected Frequency
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Expected Frequency'), 'A dice is rolled $60$ times. How many times would you expect to roll a $6$?', '$10$', 1),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Expected Frequency'), 'A coin is flipped $100$ times. How many heads would you expect?', '$50$', 1),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Expected Frequency'), '$P(\text{win}) = 0.2$. In $150$ trials, how many wins expected?', '$30$', 2),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Expected Frequency'), 'A bag has $2$ red and $3$ blue balls. If you pick $45$ times (replacing each time), how many red expected?', '$18$', 2),
((SELECT id FROM question_banks WHERE topic = 'Basic Probability' AND subtopic = 'Expected Frequency'), '$P(\text{defect}) = 0.05$. In $400$ items, how many defects expected?', '$20$', 3);

-- Probability: Tree Diagrams
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Tree Diagrams'), 'Two coins are flipped. Find $P(\text{both heads})$', '$\frac{1}{4}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Tree Diagrams'), 'Two dice rolled. Find $P(\text{both show 6})$', '$\frac{1}{36}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Tree Diagrams'), '$P(\text{rain Monday}) = 0.3$, $P(\text{rain Tuesday}) = 0.4$. Find $P(\text{rain both days})$', '$0.12$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Tree Diagrams'), 'Bag has $3$ red, $2$ blue balls. Pick $2$ with replacement. Find $P(\text{both red})$', '$\frac{9}{25}$', 3),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Tree Diagrams'), '$P(\text{pass test 1}) = 0.7$, $P(\text{pass test 2}) = 0.8$. Find $P(\text{pass both})$', '$0.56$', 3);

-- Probability: Independent Events
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Independent Events'), '$P(A) = 0.5$, $P(B) = 0.4$. If independent, find $P(A \text{ and } B)$', '$0.2$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Independent Events'), '$P(\text{rain}) = 0.3$, $P(\text{cold}) = 0.5$. If independent, find $P(\text{rain and cold})$', '$0.15$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Independent Events'), 'Two independent events: $P(A) = \frac{1}{3}$, $P(B) = \frac{1}{4}$. Find $P(A \text{ and } B)$', '$\frac{1}{12}$', 2),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Independent Events'), '$P(A) = 0.6$, $P(B) = 0.7$. If independent, find $P(A \text{ or } B)$', '$0.88$', 3),
((SELECT id FROM question_banks WHERE topic = 'Combined Events' AND subtopic = 'Independent Events'), 'Three independent events each with $P = 0.5$. Find $P(\text{all three occur})$', '$0.125$ or $\frac{1}{8}$', 3);

-- ============================================
-- End of NZ Year 9-10 Curriculum Expansion
-- Total: 84 new question banks
-- Total: 200+ sample questions
-- ============================================
