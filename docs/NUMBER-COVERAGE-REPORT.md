## NUMBER CATEGORY - SUBTOPIC COVERAGE ANALYSIS

Based on initialize-question-banks.sql and question files analysis:

### ✅ SUBTOPICS WITH QUESTIONS

**INTEGERS (1 subtopic)**
- ✅ Integer Operations (20 questions in part1.sql)

**FRACTIONS (5 subtopics)**
- ✅ Adding and Subtracting Fractions (20 questions in part1.sql)
- ✅ Multiplying and Dividing Fractions (20 questions in part1.sql)
- ✅ Equivalent Fractions and Simplification (20 questions in part1.sql)
- ✅ Comparing and Ordering Fractions (20 questions in part1.sql)
- ✅ Mixed Numbers and Improper Fractions (20 questions in part1.sql)

**DECIMALS (5 subtopics)**
- ✅ Adding and Subtracting Decimals (20 questions in part2.sql)
- ✅ Multiplying Decimals (20 questions in part2.sql)
- ✅ Dividing Decimals (20 questions in part2.sql)
- ✅ Rounding Decimals (20 questions in part2.sql)
- ✅ Ordering and Comparing Decimals (20 questions in part2.sql)

**PERCENTAGES (5 subtopics)**
- ✅ Finding Percentages (20 questions in part1.sql)
- ✅ Percentage Increase and Decrease (20 questions in part1.sql)
- ✅ Expressing as Percentages (20 questions in part1.sql)
- ✅ Reverse Percentages (appears in part2.sql)
- ✅ Percentage Problems (appears in part2.sql)

**RATIOS (3 subtopics)**
- ✅ Simplifying Ratios (20 questions in part1.sql)
- ✅ Sharing in Ratios (20 questions in part1.sql)
- ✅ Direct Proportion (appears in part2.sql)

**POWERS AND ROOTS (6 subtopics)**
- ✅ Index Laws (20 questions in part1.sql)
- ✅ Square and Cube Roots (20 questions in part1.sql)
- ✅ Scientific Notation (appears in part2.sql)
- ✅ Powers of 2 (20 questions in part3.sql)
- ✅ Approximating Roots (20 questions in part3.sql)
- ✅ Reciprocals (appears in part3.sql)

**FINANCIAL MATHEMATICS (6 subtopics)**
- ✅ GST Calculations (20 questions in part1.sql)
- ✅ Simple Interest (20 questions in part1.sql)
- ✅ Compound Interest (appears in part2.sql)
- ✅ Currency Conversions (appears in part3.sql)
- ✅ Mark-ups and Discounts (appears in part2/part3.sql)
- ✅ Cost Proportions and Best Value (appears in part3.sql)

**FACTORS AND MULTIPLES (3 subtopics)**
- ✅ Factors and Multiples (appears in part3.sql)
- ✅ HCF and LCM (appears in part3.sql)
- ✅ Prime Factorization (appears in part3.sql)

**NUMBER SENSE (1 subtopic)**
- ✅ Estimation Strategies (appears in part3.sql)

---

### 🔍 DIAGNOSTIC STEPS

To verify which subtopics are actually empty during testing:

1. **Run the diagnostic SQL** ([check-number-subtopics.sql](check-number-subtopics.sql)):
   - This will show exact question counts per subtopic
   - Identifies any empty subtopics with ❌ EMPTY status

2. **Check if SQL files were run**:
   - initialize-question-banks.sql (creates empty subtopic entries)
   - number-strand-comprehensive-questions.sql (part 1)
   - number-strand-comprehensive-questions-part2.sql (part 2)  
   - number-strand-comprehensive-questions-part3.sql (part 3)

3. **Verify mapping in the app**:
   - Test each Topic → Subtopic selection in create-do-now tool
   - Watch browser console for any errors during question loading
   - Check Network tab for failed Supabase queries

---

### 🐛 POSSIBLE ISSUES CAUSING EMPTY SUBTOPICS

1. **Database not populated**: SQL files haven't been run in Supabase
2. **Case sensitivity mismatch**: Subtopic names don't match exactly
3. **Duplicate bank IDs**: UNIQUE constraint violations during insert
4. **RLS policy issues**: Anonymous users can't read certain banks
5. **Supabase SELECT syntax**: Subquery `(SELECT id FROM question_banks...)` returning NULL

---

### ✅ NEXT STEPS

Run the included diagnostic query in Supabase SQL Editor:
```sql
-- This will show which subtopics are truly empty
SELECT 
  qb.topic,
  qb.subtopic,
  COUNT(q.id) as question_count
FROM question_banks qb
LEFT JOIN questions q ON qb.id = q.bank_id
WHERE qb.category = 'Number'
GROUP BY qb.topic, qb.subtopic
ORDER BY qb.topic, qb.subtopic;
```

Then share the results so I can identify the specific empty subtopics!
