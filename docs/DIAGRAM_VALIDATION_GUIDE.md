# Diagram Validation Guide

This guide explains how to validate geometry diagrams before bulk question generation to ensure all diagrams render correctly.

## Quick Start

### Validate All Existing Diagrams

```bash
npx tsx src/scripts/validateDiagrams.ts
```

This will:
1. Fetch all questions with diagrams from your Supabase database
2. Validate each diagram against rendering constraints
3. Output a detailed report of any invalid or problematic diagrams

### Validate a Single Diagram in Code

```typescript
import { validateDiagram } from '@/utils/diagramValidator';

const diagramData = {
  type: 'triangleAngles',
  dimensions: {
    angle1: 60,
    angle2: 60,
    angle3: 60
  }
};

const result = validateDiagram(diagramData);

if (!result.valid) {
  console.error('Invalid diagram:', result.errors);
}
```

## Diagram Constraints

### JSXGraph Boundingbox

All angle diagrams use JSXGraph with the following coordinate system:
- **X-axis**: -1 to 11 (12 units wide)
- **Y-axis**: -1 to 8 (9 units high)
- **Container size**: 480px × 320px

Any diagram elements outside these bounds will be clipped or cause overflow.

### Triangle Angles

**Requirements:**
- All angles must be positive (> 0°)
- All angles must be less than 180°
- Angles must sum to exactly 180° (±0.5° tolerance)

**Height Constraints:**
- Triangle base is at y = 1.5
- Maximum safe height is ~6.5 units (to stay within y = 8 bound)
- **Avoid very small apex angles** (< 20°) as they create extremely tall triangles

**Examples:**

✅ **Valid:** 60°, 60°, 60° (Equilateral - height ~4.3)
✅ **Valid:** 90°, 45°, 45° (Right isosceles - height 4-5)
✅ **Valid:** 30°, 75°, 75° (Isosceles - height ~5)
⚠️ **Warning:** 10°, 85°, 85° (Very tall - height >10, may overflow)
❌ **Invalid:** 60°, 60°, 70° (Sum = 190°)
❌ **Invalid:** 0°, 90°, 90° (Zero angle)

### Angles on Line

**Requirements:**
- Angle must be between 0° and 180°
- The complement angle is automatically calculated (180° - angle)

### Angles at Point

**Requirements:**
- All 4 angles must be positive
- Angles must sum to exactly 360° (±0.5° tolerance)

**Examples:**

✅ **Valid:** 90°, 90°, 90°, 90°
✅ **Valid:** 120°, 60°, 100°, 80°
❌ **Invalid:** 90°, 90°, 90°, 80° (Sum = 350°)

### Parallel Lines with Transversal

**Requirements:**
- Transversal angle must be between 0° and 180°
- Corresponding and alternate angles are automatically calculated

## Best Practices for Bulk Question Generation

### 1. Validate Before Inserting

```typescript
// Before inserting questions into database
const questions = [
  { question_text: '...', diagram_data: {...}, ... },
  // ... more questions
];

// Validate all diagrams first
const diagrams = questions.map((q, idx) => ({
  id: idx,
  data: q.diagram_data
}));

const results = batchValidateDiagrams(diagrams);

if (results.invalidCount > 0) {
  console.error('Invalid diagrams found. Fix before inserting.');
  // Log details and exit
} else {
  // Safe to insert into database
  await supabase.from('questions').insert(questions);
}
```

### 2. Use Safe Angle Ranges

When generating random angles:

```typescript
// Triangle angles - ensure sum = 180°
function generateTriangleAngles() {
  // Use safe ranges to avoid very tall triangles
  const angle1 = Math.floor(Math.random() * 70) + 30; // 30-100°
  const angle2 = Math.floor(Math.random() * 70) + 30; // 30-100°
  const angle3 = 180 - angle1 - angle2;
  
  // Ensure all angles are in safe range
  if (angle3 < 30 || angle3 > 120) {
    return generateTriangleAngles(); // Regenerate
  }
  
  return { angle1, angle2, angle3 };
}

// Angles at point - ensure sum = 360°
function generateAnglesAtPoint() {
  const angle1 = Math.floor(Math.random() * 120) + 30; // 30-150°
  const angle2 = Math.floor(Math.random() * 120) + 30;
  const angle3 = Math.floor(Math.random() * 120) + 30;
  const angle4 = 360 - angle1 - angle2 - angle3;
  
  if (angle4 < 30 || angle4 > 150) {
    return generateAnglesAtPoint(); // Regenerate
  }
  
  return { angle1, angle2, angle3, angle4 };
}
```

### 3. Test with Extreme Cases

Before bulk generation, test edge cases:

```typescript
const testCases = [
  // Equilateral triangle
  { type: 'triangleAngles', dimensions: { angle1: 60, angle2: 60, angle3: 60 } },
  
  // Right isosceles
  { type: 'triangleAngles', dimensions: { angle1: 90, angle2: 45, angle3: 45 } },
  
  // Very tall triangle (should warn)
  { type: 'triangleAngles', dimensions: { angle1: 15, angle2: 82.5, angle3: 82.5 } },
  
  // Acute angle on line
  { type: 'anglesOnLine', dimensions: { angle1: 45 } },
  
  // Obtuse angle on line
  { type: 'anglesOnLine', dimensions: { angle1: 135 } },
];

testCases.forEach(testCase => {
  const result = validateDiagram(testCase);
  console.log(`Test ${testCase.type}:`, result.valid ? '✓' : '✗');
});
```

### 4. Add Validation to SQL Scripts

When creating SQL scripts for bulk question insertion, add inline validation checks:

```sql
-- Check triangle angles sum to 180
SELECT 
  id,
  question_text,
  (diagram_data->'dimensions'->>'angle1')::float +
  (diagram_data->'dimensions'->>'angle2')::float +
  (diagram_data->'dimensions'->>'angle3')::float as angle_sum
FROM questions
WHERE diagram_data->>'type' = 'triangleAngles'
  AND ABS(
    (diagram_data->'dimensions'->>'angle1')::float +
    (diagram_data->'dimensions'->>'angle2')::float +
    (diagram_data->'dimensions'->>'angle3')::float - 180
  ) > 0.5;
-- Should return no rows if valid

-- Check angles at point sum to 360
SELECT 
  id,
  question_text,
  (diagram_data->'dimensions'->>'angle1')::float +
  (diagram_data->'dimensions'->>'angle2')::float +
  (diagram_data->'dimensions'->>'angle3')::float +
  (diagram_data->'dimensions'->>'angle4')::float as angle_sum
FROM questions
WHERE diagram_data->>'type' = 'anglesAtPoint'
  AND ABS(
    (diagram_data->'dimensions'->>'angle1')::float +
    (diagram_data->'dimensions'->>'angle2')::float +
    (diagram_data->'dimensions'->>'angle3')::float +
    (diagram_data->'dimensions'->>'angle4')::float - 360
  ) > 0.5;
-- Should return no rows if valid
```

## Automated Validation in CI/CD

Add validation to your CI/CD pipeline:

```yaml
# .github/workflows/validate-diagrams.yml
name: Validate Diagrams

on:
  push:
    paths:
      - '**.sql'
      - 'src/components/GeometryDiagram.tsx'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npx tsx src/scripts/validateDiagrams.ts
        env:
          NEXT_PUBLIC_SUPABASE_URL: ${{ secrets.NEXT_PUBLIC_SUPABASE_URL }}
          NEXT_PUBLIC_SUPABASE_ANON_KEY: ${{ secrets.NEXT_PUBLIC_SUPABASE_ANON_KEY }}
```

## Troubleshooting

### "Triangle extends beyond bounds"

**Cause:** Triangle has a very small apex angle, creating a tall triangle.

**Fix:** Increase the smallest angle to at least 20-30°.

### "Angles must sum to 180°"

**Cause:** Rounding errors or incorrect angle calculation.

**Fix:** Use exact arithmetic or adjust angles to sum precisely:

```typescript
const angle1 = 60;
const angle2 = 60;
const angle3 = 180 - angle1 - angle2; // Ensures exact sum
```

### "Ray endpoint exceeds boundingbox"

**Cause:** Angle on line is very steep, causing ray to extend beyond bounds.

**Fix:** This should not occur with current setup, but if it does, keep angles between 20° and 160°.

## Visual Regression Testing (Future Enhancement)

For even more robust validation, consider adding visual regression testing:

1. **Puppeteer/Playwright**: Take screenshots of each diagram
2. **Percy/Chromatic**: Compare screenshots across changes
3. **Manual review**: Flag any visual differences for human review

This ensures not just mathematical validity but also visual correctness.

## Support

For questions or issues with diagram validation:
1. Check this guide first
2. Run the validation script to see specific errors
3. Review the diagram rendering code in `src/components/GeometryDiagram.tsx`
4. Test with extreme angle values to understand bounds
