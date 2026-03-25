# Test Data Setup Guide

## Quick Start

### Prerequisites
1. Create an account with email: `tim.rout@gmail.com` in your app
2. Create at least one class/profile (or the script will create one for you)
3. Run the spaced repetition enhancement: `spaced-repetition-enhancement.sql`

### Run Test Data

**In Supabase SQL Editor:**
```sql
-- Copy and paste the contents of:
test-data-historical-sessions.sql

-- Then click "Run"
```

## What Gets Created

### 9 Historical Sessions spanning 35 days:

| Days Ago | Session | Topics Covered | Avg Performance |
|----------|---------|----------------|-----------------|
| 1 day    | Recent Practice | 6 mixed topics | 68% |
| 2 days   | Two Days Ago | Number & Algebra | 67.5% |
| **7 days**   | **One Week Ago** | Equations, Index, Pythagoras | **61%** |
| 8 days   | Session 4 | Volume | 68.5% |
| 14 days  | Two Weeks Ago | Ratios, Factorizing | 60% |
| 21 days  | Three Weeks Ago | Statistics | 79% |
| **28 days**  | **One Month Ago** | Sequences, Speed, Triangles | **73%** |
| 30 days  | 30 Days Ago | Probability | 55% |
| 35 days  | 35 Days Ago | Linear Graphs | 63% |

### Weak Topics Created (for testing intervention):
- **Expanding Brackets**: 45%
- **Factorizing**: 48.5%
- **Solving Equations**: 52.5%
- **Probability**: 55%

## After Running

1. **Check the profile ID** in the output messages
2. **Navigate to**: `/analytics/[profile-id]`
3. **You should see**:
   - 📅 Recent (1-3 days): **2 topics**
   - 📆 Medium (5-10 days): **2 topics**
   - 🗓️ Long-term (20-35 days): **5 topics**
   - ⚠️ Weak areas: **4 topics**

4. **Click "Generate Smart Do-Now"**
5. **Review the preview** showing 6 suggested questions
6. **Create the session** and test the workflow

## Expected Smart Do-Now Output

When you click "Generate Smart Do-Now", you should see:
- **2 questions** from topics used 1-2 days ago (Recent)
- **2 questions** from topics used 7-8 days ago (1 Week)
- **1 question** from topics used 28-35 days ago (1 Month)
- **1 question** from weak areas (Expanding Brackets, Factorizing, etc.)

## Troubleshooting

**"User not found" error:**
- Create account with `tim.rout@gmail.com` first
- Or change the email in line 16 of the SQL file

**"No profile found":**
- Script will auto-create one called "Year 10 Test Class"

**No retrieval data showing:**
- Verify spaced-repetition-enhancement.sql was run first
- Check browser console for errors
- Verify sessions were created with: `SELECT * FROM do_now_sessions ORDER BY session_date DESC;`

**Functions not found:**
- Run spaced-repetition-enhancement.sql first
- Check permissions: functions should be granted to 'authenticated'

## Clean Up (Optional)

To remove test data:
```sql
-- Get your profile_id first
SELECT id, class_name FROM profiles WHERE user_id IN 
  (SELECT id FROM auth.users WHERE email = 'tim.rout@gmail.com');

-- Delete all sessions for that profile (cascades to session_questions)
DELETE FROM do_now_sessions WHERE profile_id = 'your-profile-id-here';
```

## Testing Checklist

- [ ] Run test-data-historical-sessions.sql
- [ ] Check output shows 9 sessions created
- [ ] Navigate to analytics page
- [ ] See spaced repetition dashboard
- [ ] Click counts are correct (2 recent, 2 medium, ~5 longterm)
- [ ] Weak topics section shows 4 topics
- [ ] Click "Generate Smart Do-Now"
- [ ] Preview shows 6 questions with reasons
- [ ] Click on count boxes to see popup lists
- [ ] Create session and verify it opens in edit mode
- [ ] Session has 6 pre-selected questions

Happy testing! 🎉
