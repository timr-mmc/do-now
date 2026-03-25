# Geometry Diagram System - Complete Guide

## Overview

The Do-Now application now supports **interactive geometry diagrams** for Measurement and Geometry questions. This system allows you to display shapes like triangles, rectangles, circles, cuboids, and more alongside questions.

## 🎯 Quick Start

### 1. **Database Setup** (Run these SQL files in order)

```bash
# 1. Add diagram column to questions table
Run: supabase-add-diagram-column.sql

# 2. Import sample geometry questions
Run: geometry-sample-questions.sql
```

### 2. **How Diagrams Work**

Questions with diagrams have a `diagram_data` JSON field that contains:
- **type**: The shape type (triangle, rectangle, circle, etc.)
- **dimensions**: Size measurements (width, height, radius, etc.)
- **labels**: Text labels with positions
- **style**: Visual styling (colors, borders)
- **scale**: Sizing factor

### 3. **View Example Questions**

After importing `geometry-sample-questions.sql`, you'll have ~50 sample questions covering:
- Area of Triangles (right, isosceles, general)
- Area of Rectangles and Squares
- Area of Circles
- Volume of Cuboids
- Volume of Cylinders
- Perimeter Calculations

---

## 📐 Available Shape Types

### 2D Measurement Shapes

| Shape Type | Description | Key Dimensions |
|------------|-------------|----------------|
| `triangle` | General triangle |  `base`, `height` |
| `rightTriangle` | Right-angled triangle | `width`, `height` |
| `isoscelesTriangle` | Isosceles triangle | `base`, `height` |
| `rectangle` | Rectangle | `width`, `height` |
| `square` | Square | `width` |
| `circle` | Circle | `radius` |
| `parallelogram` | Parallelogram | `width`, `height`, `angle` |
| `trapezoid` | Trapezoid | `width` (bottom), `height`, `side1` (top width) |
| `kite` | Kite | `width`, `height` |
| `semicircle` | Semicircle | `radius` |

### 3D Measurement Shapes

| Shape Type | Description | Key Dimensions |
|------------|-------------|----------------|
| `cuboid` | 3D rectangular prism | `width`, `height`, `depth` |
| `cylinder` | Cylinder | `radius`, `height` |
| `triangularPrism` | Triangular prism | `width`, `height`, `depth` |
| `pyramid` | Square-based pyramid | `width`, `height`, `depth` |

### Angle Diagrams (Geometry)

| Diagram Type | Description | Key Dimensions |
|------------|-------------|----------------|
| `anglesOnLine` | Supplementary angles on a straight line | `angle1`, `angle2` |
| `triangleAngles` | Angles in a triangle (sum to 180°) | `angle1`, `angle2`, `angle3` |
| `parallelLinesTransversal` | Parallel lines cut by transversal | `angle1` (acute angle) |
| `verticallyOpposite` | Vertically opposite angles | `angle1` |
| `anglesAtPoint` | Angles at a point (sum to 360°) | `angle1`, `angle2`, `angle3`, `angle4` |

**Important for Angle Diagrams**: The angle values you specify should match what students need to find. The diagrams will render visually accurate to those angles (e.g., 130° will look obtuse, not acute).

---

## 💡 Creating Questions with Diagrams

### Basic Example: Right Triangle

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Measurement and Geometry' 
    AND topic = 'Area' 
    AND subtopic = 'Area of Triangles'),
'Find the area of this right triangle.',
'$240$ cm²',
1,
'{
  "type": "rightTriangle",
  "dimensions": {"width": 80, "height": 60},
  "labels": [
    {"text": "8 cm", "position": "bottom"},
    {"text": "6 cm", "position": "left"}
  ],
  "scale": 1
}'::jsonb);
```

### Advanced Example: Cuboid with Custom Styling

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Measurement and Geometry' 
    AND topic = 'Volume' 
    AND subtopic = 'Volume of Cuboids'),
'Calculate the volume of this cuboid.',
'$480$ cm³',
2,
'{
  "type": "cuboid",
  "dimensions": {"width": 90, "height": 65, "depth": 55},
  "labels": [
    {"text": "12 cm", "position": "bottom"},
    {"text": "8 cm", "position": "right"},
    {"text": "5 cm", "position": "left"}
  ],
  "style": {
    "stroke": "#1f2937",
    "strokeWidth": 2,
    "fill": "none"
  },
  "scale": 0.8
}'::jsonb);
```

---

## 🏷️ Label Positioning

### Available Positions

- **Cardinal**: `top`, `bottom`, `left`, `right`, `center`
- **Corners**: `topLeft`, `topRight`, `bottomLeft`, `bottomRight`

### Custom Offsets

```json
{
  "text": "5 cm",
  "position": "right",
  "offset": {"x": 25, "y": -10}
}
```

Offsets are in pixels from the base position.

---

## 🎨 Styling Options

```json
{
  "style": {
    "fill": "none",              // Fill color (or "none")
    "stroke": "#1f2937",         // Border color
    "strokeWidth": 2,            // Border thickness
    "dashArray": "5,5"          // Dashed lines (optional)
  }
}
```

### Common Styles

**Solid shape:**
```json
"style": {"fill": "rgba(200, 200, 255, 0.3)", "stroke": "#1f2937", "strokeWidth": 2}
```

**Outline only:**
```json
"style": {"fill": "none", "stroke": "#1f2937", "strokeWidth": 2}
```

**Dashed lines:**
```json
"style": {"fill": "none", "stroke": "#1f2937", "strokeWidth": 1, "dashArray": "5,5"}
```

---

## 📏 Dimension Guidelines

### Scale Factor
The `scale` parameter adjusts the overall size:
- `1.0` = default size (100%)
- `0.8` = 80% (slightly smaller)
- `1.2` = 120% (slightly larger)

### Recommended Dimensions

**2D Shapes:**
- Triangles: `base: 80-120`, `height: 60-90`
- Rectangles: `width: 100-140`, `height: 60-90`
- Circles: `radius: 40-60`

**3D Shapes:**
- Cuboids: `width: 70-100`, `height: 50-80`, `depth: 40-60`
- Cylinders: `radius: 35-50`, `height: 70-100`

---

## 🔧 Component Integration

### Display Page (Presentation View)
Diagrams automatically render in the display view at full size.

### Create Do-Now Page (Preview)
Diagram preview shows with "📐 Has diagram" indicator.

### Results Page
Can be extended to show diagrams alongside student responses (optional).

---

## 📝 Best Practices

### 1. **Question Text Clarity**
```sql
-- ✅ GOOD: Clear instruction
'Find the area of this right triangle.'

-- ❌ AVOID: Redundant dimensions in text when shown on diagram
'Find the area of a right triangle with base 8 cm and height 6 cm.'
```

### 2. **Label Placement**
- Put dimensions on or near the corresponding sides
- Use `offset` to avoid overlapping labels
- Keep labels concise (e.g., "8 cm" not "Base = 8 centimeters")

### 3. **Difficulty Progression**
- **Difficulty 1**: Simple whole numbers, common shapes
- **Difficulty 2**: Slightly larger numbers, requires calculation
- **Difficulty 3**: Decimals, compound shapes
- **Difficulty 4**: Complex calculations, word problems

### 4. **Answer Format**
Use KaTeX for mathematical formatting:
```sql
answer: '$240$ cm²'           -- NOT: '240 cm²'
answer: '$78.5$ cm²'          -- For decimals
answer: '$25\\pi$ cm²'        -- For pi notation
```

---

## 🛠️ Troubleshooting

### Diagram Not Showing
1. Check `diagram_data IS NOT NULL` in database
2. Verify JSON is valid (use `jsonb` type cast `::jsonb`)
3. Confirm `diagram_data` is included in SELECT query
4. Check browser console for errors

### Labels Missing or Misplaced
- Verify `position` value is one of the valid positions
- Check for typos in label text
- Try adjusting `offset` values

### Shape Appears Distorted
- Check `scale` value (should be between 0.5-1.5)
- Verify dimensions are reasonable (see guidelines above)
- Ensure `dimensions` object has required fields for that shape type

### Database Query Fails
```sql
-- Verify diagram column exists
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'questions' AND column_name = 'diagram_data';

-- Check for malformed JSON
SELECT id, question_text, diagram_data 
FROM questions 
WHERE diagram_data IS NOT NULL 
  AND NOT (diagram_data::text ~ '^{.*}$');
```

---

## 📊 Creating Question Banks for Geometry

### Example: Initialize a New Geometry Topic

```sql
-- 1. Create question bank
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement and Geometry', 'Area', 'Area of Parallelograms', 'Calculating area using base × height')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- 2. Add questions with diagrams
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Measurement and Geometry' 
    AND topic = 'Area' 
    AND subtopic = 'Area of Parallelograms'),
'Find the area of this parallelogram.',
'$360$ cm²',
2,
'{
  "type": "parallelogram",
  "dimensions": {"width": 100, "height": 60, "angle": 30},
  "labels": [
    {"text": "12 cm", "position": "bottom"},
    {"text": "30 cm", "position": "right", "offset": {"x": 10, "y": 0}}
  ],
  "scale": 0.85
}'::jsonb);
```

---

## 🚀 Advanced Usage

### Multiple Labels with Offsets

```json
{
  "labels": [
    {"text": "r = 5 cm", "position": "top", "offset": {"x": 50, "y": 0}},
    {"text": "h = 8 cm", "position": "left", "offset": {"x": -30, "y": 40}},
    {"text": "V = ?", "position": "center"}
  ]
}
```

### Conditional Styling

```json
{
  "style": {
    "fill": "rgba(200, 230, 255, 0.2)",
    "stroke": "#1e40af",
    "strokeWidth": 3
  }
}
```

### Complex Shapes

For shapes not directly supported, you can combine simpler shapes or extend the `GeometryDiagram` component in:
```
src/components/GeometryDiagram.tsx
```

---

## � Creating Angle Diagrams

### Important: Visual Accuracy

Angle diagrams render with **visually accurate angles**. If you specify `angle1: 130`, the diagram will show an obtuse angle, not an acute one. This ensures students see angles that match what they're calculating.

### Angle Ranges Guide

- **0-30°**: Very acute (narrow)
- **30-60°**: Moderate acute
- **60-90°**: Large acute
- **90°**: Right angle
- **90-120°**: Small obtuse
- **120-150°**: Large obtuse
- **150-180°**: Very obtuse (nearly straight)

### Example: Angles on a Line

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $a$.',
'$130°$',
2,
'{
  "type": "anglesOnLine",
  "dimensions": {"angle1": 50, "angle2": 130},
  "labels": [
    {"text": "50°", "position": "left", "offset": {"x": -15, "y": -30}},
    {"text": "a", "position": "right", "offset": {"x": 15, "y": -20}}
  ],
  "scale": 1
}'::jsonb);
```

### Example: Triangle Angles

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $c$ in this right triangle.',
'$60°$',
2,
'{
  "type": "triangleAngles",
  "dimensions": {"angle1": 90, "angle2": 30, "angle3": 60},
  "labels": [
    {"text": "90°", "position": "bottomLeft", "offset": {"x": 15, "y": -5}},
    {"text": "30°", "position": "bottomRight", "offset": {"x": -15, "y": -5}},
    {"text": "c", "position": "top", "offset": {"x": 0, "y": 15}}
  ],
  "scale": 1
}'::jsonb);
```

### Example: Parallel Lines with Transversal

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $a$ (corresponding angles).',
'$65°$',
2,
'{
  "type": "parallelLinesTransversal",
  "dimensions": {"angle1": 65},
  "labels": [
    {"text": "65°", "position": "topLeft", "offset": {"x": 30, "y": -10}},
    {"text": "a", "position": "bottomLeft", "offset": {"x": 30, "y": 0}}
  ],
  "scale": 1
}'::jsonb);
```

### Example: Vertically Opposite Angles

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Vertically Opposite Angles'),
'Find angle $a$ (vertically opposite angles are equal).',
'$75°$',
2,
'{
  "type": "verticallyOpposite",
  "dimensions": {"angle1": 75},
  "labels": [
    {"text": "75°", "position": "right", "offset": {"x": 20, "y": -15}},
    {"text": "a", "position": "left", "offset": {"x": -20, "y": 15}}
  ],
  "scale": 1
}'::jsonb);
```

### Example: Angles at a Point

```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks 
  WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles at a Point'),
'Find angle $a$ (angles at a point sum to 360°).',
'$70°$',
2,
'{
  "type": "anglesAtPoint",
  "dimensions": {"angle1": 90, "angle2": 120, "angle3": 80, "angle4": 70},
  "labels": [
    {"text": "90°", "position": "right", "offset": {"x": 40, "y": 0}},
    {"text": "120°", "position": "top", "offset": {"x": 0, "y": -40}},
    {"text": "80°", "position": "left", "offset": {"x": -40, "y": 0}},
    {"text": "a", "position": "bottom", "offset": {"x": 0, "y": 35}}
  ],
  "scale": 1
}'::jsonb);
```

---

## �📚 Example Query Patterns

### Find All Questions with Diagrams
```sql
SELECT q.*, qb.topic, qb.subtopic
FROM questions q
JOIN question_banks qb ON q.bank_id = qb.id
WHERE q.diagram_data IS NOT NULL
ORDER BY qb.topic, qb.subtopic, q.difficulty;
```

### Count Questions by Diagram Type
```sql
SELECT 
  diagram_data->>'type' as shape_type,
  COUNT(*) as question_count
FROM questions
WHERE diagram_data IS NOT NULL
GROUP BY diagram_data->>'type'
ORDER BY question_count DESC;
```

### Find Questions Missing Diagrams in Geometry Strand
```sql
SELECT q.*, qb.topic, qb.subtopic
FROM questions q
JOIN question_banks qb ON q.bank_id = qb.id
WHERE qb.category = 'Measurement and Geometry'
  AND q.diagram_data IS NULL
ORDER BY qb.topic, qb.subtopic;
```

---

## 🎓 Next Steps

1. **Run the SQL migration**: `supabase-add-diagram-column.sql`
2. **Import sample questions**: `geometry-sample-questions.sql`
3. **Test in Create Do-Now**: Select geometry questions and preview
4. **Present to class**: Use Display view to show questions with diagrams
5. **Create your own**: Follow the examples to add more geometry questions

---

## 💡 Tips for Creating Effective Geometry Questions

1. **Show, Don't Tell**: Let the diagram communicate dimensions
2. **Progressive Difficulty**: Start with simple shapes, add complexity
3. **Consistent Labeling**: Use the same units throughout a set
4. **Real-World Context**: Add word problems that reference the diagrams
5. **Check Rendering**: Preview questions before using in class

---

## 📞 Need Help?

If you encounter issues or have questions:
1. Check this guide's Troubleshooting section
2. Verify your SQL syntax and JSON structure
3. Check browser console for JavaScript errors
4. Review the sample questions in `geometry-sample-questions.sql`

Happy teaching! 📐✨
