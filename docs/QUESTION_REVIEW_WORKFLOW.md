# Question Review and Flagging Workflow

## Overview
The Question Review system allows you to review, flag, and manage questions in your database efficiently. This guide explains the complete workflow from identifying problem questions to replacing them.

## Accessing the Review Page

Navigate to **Dashboard → Review Questions** button in the top navigation.

## Step 1: Select Questions to Review

1. **Choose Category** (e.g., Statistics, Number, Algebra)
2. **Choose Topic** (e.g., Data Analysis, Fractions)
3. **Choose Subtopic** (e.g., Measures of Center, Adding Fractions)

The system will load all questions for that subtopic with their current flag status.

## Step 2: Review and Flag Questions

### Viewing Questions
Each question card displays:
- Question number and difficulty level
- Full question text
- Answer
- Hint (if available)
- Flag status and count (if previously flagged)
- Any existing flag notes

### Flagging a Question
1. Click **"🚩 Flag for Review"** button
2. Enter notes describing what needs to be fixed:
   - Incorrect answer
   - Typo or grammar error
   - Unclear wording
   - Wrong difficulty level
   - Missing or poor hint
   - Data set issues (for statistics)
3. Click **"Save Flag"**

### Filter View
- Use **"Show only flagged questions"** checkbox to focus on flagged items
- The count shows how many questions in the current view are flagged

## Step 3: Export Flagged Questions

When ready to fix the flagged questions:

1. Click **"📥 Export Flagged as SQL"**
2. A SQL file will download with:
   - All flagged questions listed
   - DELETE statements with question IDs
   - INSERT template statements for replacements
   - Your flag notes as SQL comments

The exported file is named: `flagged-[category]-[topic]-[subtopic].sql`

## Step 4: Fix Questions in the SQL File

Open the exported SQL file and:

1. Review each flagged question and your notes
2. Edit the INSERT statements to create corrected questions:
   - Fix the question text
   - Correct the answer
   - Update hints
   - Adjust difficulty levels
3. Keep the DELETE statements to remove old versions
4. Save the file

## Step 5: Apply Changes to Database

### Option A: Using Supabase SQL Editor
1. Log into Supabase
2. Go to SQL Editor
3. Copy and paste the entire SQL file content
4. Run the query
5. Verify the changes

### Option B: Using Database Management Tool
1. Connect to your database
2. Run the SQL file
3. Verify the changes

## Step 6: Verify and Unflag

After applying the SQL changes:

1. Return to the Review Questions page
2. Reload the same category/topic/subtopic
3. Review the updated questions
4. Click **"✓ Unflag (Mark as Fixed)"** for corrected questions

## Bulk Operations

### Select Multiple Questions
- Click checkboxes to select individual questions
- Use **"Select All"** to select all visible questions
- Use **"Deselect All"** to clear selection

### Delete Selected Questions
1. Select questions using checkboxes
2. Click **"🗑️ Delete Selected"**
3. Confirm the deletion
4. Questions are permanently removed

⚠️ **Warning**: Deletion is permanent. Use carefully!

## Best Practices

### When to Flag
- **Always flag** when you spot an error during class or testing
- Add detailed notes about what's wrong
- Flag questions with poor wording even if technically correct

### Flag Notes Guidelines
Write clear, actionable notes:
- ✅ "Answer should be 15, not 14 (calculation error)"
- ✅ "Data set has arithmetic sequence - needs realistic values"
- ✅ "Wording unclear - specify 'rounded to 2 decimal places'"
- ❌ "Wrong" (too vague)
- ❌ "Fix this" (not actionable)

### Batch Processing
- Review entire subtopics at once
- Export all flagged questions together
- Fix them in one session
- Test a few questions before unflagging all

### Quality Control
1. Don't unflag immediately after SQL import
2. Manually verify at least a sample of corrected questions
3. Check that answers match the new question text
4. Ensure hints are still appropriate
5. Verify difficulty ratings

## Database Schema

### Tables Used
- `question_banks`: Categories, topics, subtopics
- `questions`: The actual questions
- `flagged_questions`: Flag records with notes

### Flag Information
- Each question can be flagged multiple times
- Flag count shows total number of flags
- Most recent flag notes are displayed
- Flags are automatically deleted if the question is deleted

## Troubleshooting

### Questions not loading
- Check that you've selected category, topic, AND subtopic
- Verify the question bank exists in the database
- Check browser console for errors

### Can't flag a question
- Ensure flagged_questions table exists (run add-question-flagging.sql)
- Check database permissions
- Verify question ID is valid

### Export button not working
- Ensure at least one question is flagged
- Check browser allows downloads
- Try a different browser if issues persist

### Deleted questions still appear
- Refresh the page
- Clear browser cache
- Verify deletion occurred in database

## AI Agent Integration

When working with an AI agent (like GitHub Copilot) to fix questions:

### Efficient Workflow
1. Export flagged questions
2. Share the SQL file with the agent
3. Ask: "Review these flagged questions and fix them based on the notes"
4. Agent will update the SQL with corrections
5. Save and run the corrected SQL
6. Review and unflag

### Example Prompts
- "Fix all flagged statistics questions - make data sets more realistic"
- "Review these flagged questions and correct the calculation errors noted"
- "Update these questions to match the style guide in MATH_NOTATION_GUIDE.md"

## Future Enhancements

Potential improvements to consider:
- Bulk unflag operation
- Flag history and tracking
- Question version control
- AI-assisted question fixing direct in UI
- Collaborative review with other teachers
- Export to different formats (CSV, JSON)
- Print-friendly review sheets
- Question preview/testing mode

---

**Last Updated**: March 2026  
**Version**: 1.0
