-- Statistics Questions for NZ Curriculum Phase 4 (Years 9-10)
-- Based on: https://newzealandcurriculum.tahurangi.education.govt.nz/new-zealand-curriculum-online/nzc---mathematics-and-statistics-phase-4-years-9-10/5637291579.p

-- ============================================
-- CATEGORY: Statistics
-- ============================================

-- Topic: Data Collection
-- Subtopic: Types of Data and Variables

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Collection', 'Types of Data', 3, 'Understanding different types of data and variables')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Is "favourite sport" a categorical or numerical variable?',
    'Categorical',
    3,
    'Think about whether you measure it with numbers or categories.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Types of Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A dataset contains height, weight, and hair colour. Is this univariate, bivariate, or multivariate data?',
    'Multivariate',
    3,
    'Count how many variables are in the dataset.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Types of Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Data collected by conducting your own survey is called ______ data.',
    'Primary',
    2,
    'Think about whether it''s first-hand or second-hand data.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Types of Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Data obtained from a government website is called ______ data.',
    'Secondary',
    2,
    'This data was collected by someone else.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Types of Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Is "number of siblings" a categorical or numerical variable?',
    'Numerical',
    2,
    'Can you count or measure it with numbers?'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Types of Data';


-- Subtopic: Statistical Investigations

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Collection', 'Statistical Investigations', 3, 'Types of statistical investigations')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '"What is the average height of Year 9 students?" is an example of a ______ investigation.',
    'Summary',
    3,
    'This question is about ONE group only.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Statistical Investigations';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '"Do Year 9 boys have more siblings than Year 9 girls?" is a ______ investigation.',
    'Comparison',
    3,
    'This question compares TWO groups.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Statistical Investigations';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '"Is there a relationship between study time and test scores?" is a ______ investigation.',
    'Relationship',
    3,
    'This question looks for a connection between two variables.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Statistical Investigations';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '"How has the school population changed over the last 10 years?" is a ______ investigation.',
    'Time-series',
    3,
    'This question involves looking at data over time.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Statistical Investigations';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'An ______ study is one where observers do not alter or control the behaviour of subjects.',
    'Observational',
    3,
    'The observers just watch and record, they do not interfere.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Collection' AND subtopic = 'Statistical Investigations';


-- Topic: Data Visualization
-- Subtopic: Graph Types

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Visualization', 'Graph Types', 2, 'Identifying appropriate graph types for different data')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Which graph shows individual data points stacked vertically: dot plot or histogram?',
    'Dot plot',
    2,
    'A dot plot shows each individual value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Which graph groups data into intervals or bins?',
    'Histogram',
    2,
    'This graph shows frequency distributions for continuous data.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A ______ plot is best for showing how a variable changes over time.',
    'Time-series',
    2,
    'Time goes on the horizontal axis.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Which graph shows the relationship between two numerical variables?',
    'Scatter plot',
    2,
    'This graph has points plotted on an x-y coordinate plane.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A ______ graph is used to display categorical data with bars.',
    'Bar',
    1,
    'Each category has its own bar.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A box plot divides data into ______ equal parts (quartiles).',
    '4',
    3,
    'Think about the number of sections a box plot creates.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Types';


-- Subtopic: Graph Components

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Visualization', 'Graph Components', 2, 'Understanding parts of data visualizations')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'On a scatter plot, the response (dependent) variable goes on which axis?',
    'y-axis',
    3,
    'The variable that responds to changes goes vertically.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Components';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'On a scatter plot, the explanatory (independent) variable goes on which axis?',
    'x-axis',
    3,
    'The variable that explains or predicts goes horizontally.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Components';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The pattern formed by all possible values of a variable and their frequencies is called a ______.',
    'Distribution',
    3,
    'This describes the overall shape and spread of the data.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Components';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A table showing frequencies for two categorical variables is called a ______-way table.',
    'Two',
    2,
    'It has two dimensions - rows and columns.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Components';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'An ______ line of best fit can be drawn by eye to show the trend in a scatter plot.',
    'Eyeballed',
    3,
    'You estimate it visually rather than calculating it.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Visualization' AND subtopic = 'Graph Components';


-- Topic: Data Analysis
-- Subtopic: Measures of Center

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Measures of Center', 2, 'Understanding mean, median, and mode')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The ______ is the middle value when data is ordered from smallest to largest.',
    'Median',
    2,
    'Half the values are below this, half above.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Measures of Center';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The ______ is calculated by adding all values and dividing by the number of values.',
    'Mean',
    2,
    'This is also called the average.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Measures of Center';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The ______ is the value that appears most frequently in a dataset.',
    'Mode',
    2,
    'This is the most common value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Measures of Center';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 3, 7, 2, 9, 5',
    '5',
    2,
    'First arrange in order: 2, 3, 5, 7, 9'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Measures of Center';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mean of: 4, 6, 8, 10',
    '7',
    2,
    'Add them up: 4 + 6 + 8 + 10 = 28, then divide by 4'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Measures of Center';


-- Subtopic: Distribution Features

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Distribution Features', 3, 'Describing shape, spread, and outliers')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Data values that are much higher or lower than most others are called ______.',
    'Outliers',
    2,
    'These are unusual or extreme values.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Distribution Features';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The ______ is the difference between the maximum and minimum values.',
    'Range',
    2,
    'This measures how spread out the data is.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Distribution Features';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'In a box plot, the middle 50% of data is shown in the ______.',
    'Box',
    3,
    'This is between the first and third quartiles.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Distribution Features';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The three values that divide data into four equal parts are called ______.',
    'Quartiles',
    3,
    'There are three of these: Q1, Q2 (median), and Q3.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Distribution Features';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If data has one peak on the left and a long tail on the right, it is ______-skewed.',
    'Right',
    4,
    'The tail points in the direction of the skew.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Distribution Features';


-- Topic: Sampling and Populations
-- Subtopic: Sampling Methods

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Sampling', 'Sampling Methods', 3, 'Understanding sampling and bias')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Collecting data from every member of a population is called a ______.',
    'Census',
    2,
    'Everyone is included in this type of data collection.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The entire group you want to learn about is called the ______.',
    'Population',
    2,
    'This is everyone, not just who you surveyed.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A subset of the population selected for study is called a ______.',
    'Sample',
    2,
    'This is a smaller group chosen from the population.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Samples should be taken ______ from the population to avoid bias.',
    'Randomly',
    3,
    'Each member should have an equal chance of being selected.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '______ in sampling leads to inaccurate and misleading statistics.',
    'Bias',
    3,
    'This happens when the sample is not representative.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Larger sample sizes generally give ______ (more/less) reliable results.',
    'More',
    3,
    'More data usually means better estimates.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Surveying only people who walk past at lunchtime would likely create a ______ sample.',
    'Biased',
    3,
    'This misses people who aren''t there at lunchtime.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Sampling Methods';


-- Subtopic: Making Inferences

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Sampling', 'Making Inferences', 4, 'Using samples to make claims about populations')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Using sample data to make claims about the population is called making an ______.',
    'Inference',
    4,
    'You''re drawing conclusions that go beyond your data.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The 75%-to-50% comparison rule is used for ______ inferences.',
    'Informal',
    4,
    'This is a simple rule of thumb rather than a formal test.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Making predictions within the range of your data is called ______.',
    'Interpolation',
    4,
    'You''re staying within your known data range.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Making predictions outside the range of your data is called ______.',
    'Extrapolation',
    4,
    'You''re going beyond your known data range.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '______ (Interpolation/Extrapolation) is generally more reliable.',
    'Interpolation',
    4,
    'Predicting within your data range is safer than beyond it.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Elements of ______ affect the certainty of results from studies.',
    'Chance',
    3,
    'Random variation means we can''t be 100% certain.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Sampling' AND subtopic = 'Making Inferences';


-- Topic: Data Interpretation
-- Subtopic: Critical Analysis

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Interpretation', 'Critical Analysis', 3, 'Evaluating data visualizations and claims')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Data visualizations should clearly show the ______, group studied, and units (if numerical).',
    'Variable',
    3,
    'You need to know what is being measured.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A misleading graph might use an inappropriate ______ on the axes.',
    'Scale',
    3,
    'Starting the y-axis at a non-zero value can exaggerate differences.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'When evaluating findings, you should check if the data-collection ______ were appropriate.',
    'Methods',
    3,
    'How the data was collected affects its reliability.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Claims should be supported by ______ from the data.',
    'Evidence',
    3,
    'You need data to back up your statements.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    '______ should be taken into account when making claims from observational studies.',
    'Uncertainty',
    4,
    'Random variation means we can''t be completely certain.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'You should compare findings to your initial ______ or hypotheses.',
    'Conjectures',
    3,
    'Did the data support what you expected?'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Interpretation' AND subtopic = 'Critical Analysis';


-- Topic: Relationships Between Variables
-- Subtopic: Correlation and Causation

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Relationships', 'Correlation and Causation', 4, 'Understanding relationships in data')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A line of best fit shows the general ______ in a scatter plot.',
    'Trend',
    3,
    'This is the overall direction of the relationship.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If points on a scatter plot go up from left to right, there is a ______ relationship.',
    'Positive',
    3,
    'As one variable increases, so does the other.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If points on a scatter plot go down from left to right, there is a ______ relationship.',
    'Negative',
    3,
    'As one variable increases, the other decreases.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If points are scattered with no clear pattern, there is ______ relationship.',
    'No',
    3,
    'The variables don''t seem to be related.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A relationship between variables does not necessarily mean one ______ the other.',
    'Causes',
    4,
    'Correlation does not imply causation.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'The line of best fit can be used to make ______ about y-values for given x-values.',
    'Predictions',
    4,
    'You can estimate unknown values using the trend line.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Relationships' AND subtopic = 'Correlation and Causation';


-- Topic: Frequency and Probability in Data
-- Subtopic: Relative Frequency

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Frequency', 'Relative Frequency', 3, 'Understanding frequency in statistical contexts')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A ______ table shows how often each value appears in a dataset.',
    'Frequency',
    2,
    'This counts the occurrences of each data value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Relative Frequency';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Relative frequency is calculated by dividing frequency by the ______ number of data points.',
    'Total',
    3,
    'This gives you a proportion rather than a count.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Relative Frequency';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If 15 out of 60 students chose pizza, the relative frequency is ______.',
    '0.25',
    3,
    'Divide 15 by 60 to get the proportion.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Relative Frequency';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A relative frequency of 0.4 is the same as ______%.',
    '40',
    2,
    'Multiply by 100 to convert to a percentage.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Relative Frequency';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'All relative frequencies in a dataset add up to ______.',
    '1',
    3,
    'The total of all proportions equals the whole.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Relative Frequency';


-- ============================================
-- COMPUTATIONAL STATISTICS QUESTIONS
-- ============================================

-- Topic: Data Analysis
-- Subtopic: Calculating Mean

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Calculating Mean', 2, 'Computing the mean (average) from numerical data sets')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 12, 16, 20, 24, 28',
    '20',
    1,
    'Add all values (12+16+20+24+28 = 100) and divide by the count (5).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 18, 22, 19, 26, 31, 24, 29',
    '24.14',
    2,
    'Add all values (169) and divide by 7. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 12, 18, 14, 21, 19, 25, 16, 22, 28',
    '19.44',
    2,
    'Add all values (175) and divide by 9. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 8, 15, 12, 19, 21, 17, 24, 14, 26, 18, 31',
    '18.64',
    3,
    'Add all 11 values (205) and divide by 11. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 3.5, 4.2, 5.8, 6.1, 7.4',
    '5.4',
    2,
    'Add the decimal values and divide by 5.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 38, 52, 45, 49, 61, 43, 54',
    '48.86',
    2,
    'Add all values (342) and divide by 7. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 16, 23, 19, 28, 21, 25, 18, 30, 22',
    '22.44',
    2,
    'Add all values (202) and divide by 9. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';


-- Subtopic: Calculating Median

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Calculating Median', 2, 'Finding the median (middle value) from numerical data sets')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 8, 12, 15, 19, 23',
    '15',
    1,
    'The data is already ordered. With 5 values, the median is the 3rd value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 12, 17, 19, 23, 28, 31',
    '21',
    2,
    'With 6 values (even count), find the average of the 3rd and 4th values: (19+23)/2.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 8, 12, 16, 19, 24, 27, 31',
    '19',
    2,
    'With 7 values (odd count), the median is the 4th value (middle position).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 5, 11, 14, 18, 21, 25, 29, 33, 38',
    '21',
    2,
    'With 9 values (odd count), the median is the 5th value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 14, 18, 21, 23, 26, 29, 32, 35, 38, 41',
    '27.5',
    3,
    'With 10 values (even count), average the 5th and 6th values: (26+29)/2.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 9, 14, 17, 21, 25, 28, 32, 35, 39, 43, 48',
    '28',
    3,
    'With 11 values (odd count), the median is the 6th value (middle position).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 25, 18, 32, 21, 29',
    '25',
    2,
    'First arrange in order: 18, 21, 25, 29, 32. Then find the middle value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 16, 9, 24, 12, 20, 15, 27',
    '16',
    2,
    'First order: 9, 12, 15, 16, 20, 24, 27. The middle (4th) value is the median.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';


-- Subtopic: Calculating Mode

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Calculating Mode', 2, 'Identifying the mode (most frequent value) from data sets')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 5, 8, 8, 10, 12',
    '8',
    1,
    'Look for the value that appears most often. 8 appears twice.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 3, 7, 7, 9, 11, 11, 15',
    '7 and 11',
    2,
    'This dataset has two modes (bimodal). Both 7 and 11 appear twice.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 12, 14, 16, 18, 20, 22, 24',
    'No mode',
    2,
    'All values appear only once, so there is no mode.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 5, 5, 8, 10, 10, 10, 12, 15',
    '10',
    2,
    '10 appears three times, more than any other value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 4, 6, 6, 8, 9, 9, 11, 13, 13',
    '6, 9, and 13',
    3,
    'This is trimodal. Three values each appear twice.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';


-- Subtopic: Calculating Range

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Calculating Range', 1, 'Computing the range (difference between max and min)')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the range of: 8, 12, 15, 19, 24',
    '16',
    1,
    'Range = maximum - minimum. So 24 - 8 = 16.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Range';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the range of: 8, 14, 19, 22, 27, 31, 36',
    '28',
    1,
    'Subtract the smallest value (8) from the largest (36).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Range';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the range of: 17, 23, 19, 28, 32, 25, 39, 21, 44',
    '27',
    2,
    'Range = 44 - 17.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Range';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the range of: 6, 12, 9, 17, 14, 23, 19, 26, 21, 29, 38',
    '32',
    2,
    'Find the difference between the highest (38) and lowest (6) values.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Range';


-- Subtopic: Finding Quartiles

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Finding Quartiles', 3, 'Calculating Q1, Q2 (median), and Q3')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find Q1 (first quartile) of: 6, 11, 14, 18, 23, 27, 31',
    '11',
    3,
    'Q1 is the median of the lower half. Lower half: 6, 11, 14. Median of these is 11.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Finding Quartiles';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find Q3 (third quartile) of: 6, 11, 14, 18, 23, 27, 31',
    '27',
    3,
    'Q3 is the median of the upper half. Upper half: 23, 27, 31. Median of these is 27.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Finding Quartiles';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find Q2 (second quartile/median) of: 8, 14, 19, 23, 28, 32, 37, 41, 46',
    '28',
    2,
    'Q2 is simply the median. With 9 values, it''s the 5th value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Finding Quartiles';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find Q1 of: 7, 12, 15, 19, 22, 26, 29, 33, 38',
    '13.5',
    3,
    'Lower half: 7, 12, 15, 19. Q1 is the average of 12 and 15.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Finding Quartiles';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find Q3 of: 7, 12, 15, 19, 22, 26, 29, 33, 38',
    '31',
    3,
    'Upper half: 26, 29, 33, 38. Q3 is the average of 29 and 33.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Finding Quartiles';


-- Subtopic: Calculating IQR

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Calculating IQR', 3, 'Computing the Interquartile Range (Q3 - Q1)')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If Q1 = 12 and Q3 = 28, calculate the IQR.',
    '16',
    3,
    'IQR = Q3 - Q1. So 28 - 12 = 16.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating IQR';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'For the data: 8, 14, 18, 23, 28, 32, 39. Find the IQR.',
    '18',
    3,
    'First find Q1 = 14 and Q3 = 32. Then IQR = 32 - 14 = 18.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating IQR';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'For the data: 9, 15, 18, 22, 26, 31, 35, 39, 44. Find the IQR.',
    '20.5',
    4,
    'Q1 = 16.5 (average of 15 and 18), Q3 = 37 (average of 35 and 39). IQR = 37 - 16.5.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating IQR';


-- Subtopic: Identifying Outliers

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Data Analysis', 'Identifying Outliers', 4, 'Using the IQR method to identify outliers')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If Q1 = 10, Q3 = 20, and IQR = 10, what is the lower boundary for outliers?',
    '-5',
    4,
    'Lower boundary = Q1 - 1.5 × IQR. So 10 - 1.5(10) = 10 - 15 = -5.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Identifying Outliers';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'If Q1 = 10, Q3 = 20, and IQR = 10, what is the upper boundary for outliers?',
    '35',
    4,
    'Upper boundary = Q3 + 1.5 × IQR. So 20 + 1.5(10) = 20 + 15 = 35.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Identifying Outliers';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Data: 5, 8, 10, 12, 14, 16, 40. If Q1 = 8, Q3 = 16, IQR = 8, is 40 an outlier?',
    'Yes',
    4,
    'Upper boundary = Q3 + 1.5(IQR) = 16 + 12 = 28. Since 40 > 28, it''s an outlier.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Identifying Outliers';


-- Subtopic: Calculating Relative Frequency from Data

INSERT INTO question_banks (category, topic, subtopic, difficulty_level, description)
VALUES ('Statistics', 'Frequency', 'Calculating from Data', 2, 'Computing relative frequency from data sets')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'In a class of 25 students, 10 prefer pizza. What is the relative frequency of pizza preference?',
    '0.4',
    2,
    'Divide the frequency (10) by the total (25).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Calculating from Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'A survey of 50 people found 15 chose red. What percentage is this?',
    '30',
    2,
    'Relative frequency = 15/50 = 0.3. Convert to percentage: 0.3 × 100 = 30%.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Calculating from Data';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'From the data: A, B, A, C, A, B, A. What is the relative frequency of A?',
    '0.57',
    2,
    'A appears 4 times out of 7 total. 4/7 ≈ 0.57 (rounded to 2 decimal places).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Frequency' AND subtopic = 'Calculating from Data';


-- Additional calculation practice questions

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 95, 108, 112, 119, 103, 125, 118',
    '111.43',
    2,
    'Sum = 780. Divide by 7. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Calculate the mean of: 2.8, 3.5, 4.1, 3.9, 5.2, 4.6, 5.8, 4.3, 6.1',
    '4.48',
    3,
    'Add all decimal values (40.3) and divide by 9. Round to 2 decimal places.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mean';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 3, 7, 9, 12, 15, 18, 20, 23, 26, 29, 33',
    '18',
    2,
    'With 11 values, the median is the 6th value (middle position).'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the median of: 31, 25, 19, 37, 28, 22, 34',
    '28',
    3,
    'First order: 19, 22, 25, 28, 31, 34, 37. The middle (4th) value is 28.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Median';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the mode of: 15, 18, 15, 22, 18, 15, 25, 18, 15',
    '15',
    2,
    '15 appears 4 times, which is more than any other value.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Mode';

INSERT INTO questions (bank_id, question_text, answer, difficulty, hint)
SELECT 
    id,
    'Find the range of: 2.8, 4.5, 3.9, 6.7, 5.2, 8.1, 9.6',
    '6.8',
    2,
    '9.6 - 2.8 = 6.8.'
FROM question_banks WHERE category = 'Statistics' AND topic = 'Data Analysis' AND subtopic = 'Calculating Range';
