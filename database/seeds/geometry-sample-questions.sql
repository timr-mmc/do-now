-- ============================================
-- MEASUREMENT AND GEOMETRY - SAMPLE QUESTIONS
-- NZ Curriculum 2026 - Mathematics - Years 9-10
-- ============================================
-- Demonstrates how to create questions with diagram_data
-- Run AFTER initialize-question-banks.sql and supabase-add-diagram-column.sql

-- First, create question banks for Measurement and Geometry strand
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement and Geometry', 'Area', 'Area of Triangles', 'Calculating area of various triangle types'),
('Measurement and Geometry', 'Area', 'Area of Rectangles and Squares', 'Calculating area of rectangles and squares'),
('Measurement and Geometry', 'Area', 'Area of Circles', 'Calculating area and circumference of circles'),
('Measurement and Geometry', 'Volume', 'Volume of Cuboids', 'Calculating volume of rectangular prisms'),
('Measurement and Geometry', 'Volume', 'Volume of Cylinders', 'Calculating volume of cylinders'),
('Measurement and Geometry', 'Perimeter', 'Perimeter Calculations', 'Finding perimeter of 2D shapes')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- AREA OF TRIANGLES - 20 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Right Triangle - Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Triangles'),
'Find the area of this right triangle.',
'$240$ cm²',
1,
'{"type": "rightTriangle", "dimensions": {"width": 80, "height": 60}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "left"}], "scale": 1}'::jsonb),

-- Right Triangle - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Triangles'),
'Calculate the area of this right triangle.',
'$54$ m²',
2,
'{"type": "rightTriangle", "dimensions": {"width": 90, "height": 70}, "labels": [{"text": "12 m", "position": "bottom"}, {"text": "9 m", "position": "left"}], "scale": 0.9}'::jsonb),

-- Isosceles Triangle - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Triangles'),
'Find the area of this isosceles triangle. (Use base $\\times$ height $\\div$ 2)',
'$150$ cm²',
2,
'{"type": "isoscelesTriangle", "dimensions": {"base": 100, "height": 80}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "20 cm", "position": "top", "offset": {"x": 0, "y": -10}}], "scale": 0.8}'::jsonb),

-- General Triangle - Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Triangles'),
'Calculate the area. Base $=$ $16$ cm, Height $=$ $9$ cm.',
'$72$ cm²',
3,
'{"type": "triangle", "dimensions": {"base": 100, "height": 70}, "labels": [{"text": "16 cm", "position": "bottom"}, {"text": "9 cm", "position": "center"}], "scale": 0.9}'::jsonb),

-- Right Triangle - Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Triangles'),
'Find the area of this right triangle with legs $13.5$ m and $18$ m.',
'$121.5$ m²',
4,
'{"type": "rightTriangle", "dimensions": {"width": 85, "height": 75}, "labels": [{"text": "13.5 m", "position": "bottom"}, {"text": "18 m", "position": "left"}], "scale": 0.95}'::jsonb);

-- ============================================
-- AREA OF RECTANGLES - 10 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Rectangle - Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Rectangles and Squares'),
'Find the area of this rectangle.',
'$48$ cm²',
1,
'{"type": "rectangle", "dimensions": {"width": 120, "height": 70}, "labels": [{"text": "8 cm", "position": "top"}, {"text": "6 cm", "position": "right"}], "scale": 0.8}'::jsonb),

-- Square - Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Rectangles and Squares'),
'Calculate the area of this square.',
'$64$ m²',
1,
'{"type": "square", "dimensions": {"width": 90}, "labels": [{"text": "8 m", "position": "bottom"}], "scale": 0.9}'::jsonb),

-- Rectangle - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Rectangles and Squares'),
'Find the area. Length $=$ $15$ cm, Width $=$ $9$ cm.',
'$135$ cm²',
2,
'{"type": "rectangle", "dimensions": {"width": 130, "height": 75}, "labels": [{"text": "15 cm", "position": "top"}, {"text": "9 cm", "position": "right"}], "scale": 0.75}'::jsonb),

-- Square - Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Rectangles and Squares'),
'If the perimeter of this square is $48$ cm, find its area.',
'$144$ cm²',
3,
'{"type": "square", "dimensions": {"width": 90}, "labels": [{"text": "?", "position": "bottom"}], "scale": 0.85}'::jsonb);

-- ============================================
-- AREA OF CIRCLES - 8 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Circle - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Circles'),
'Find the area of this circle. (Use $\\pi \\approx 3.14$)',
'$78.5$ cm² (or $25\\pi$ cm²)',
2,
'{"type": "circle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "right", "offset": {"x": 25, "y": 0}}], "scale": 0.9}'::jsonb),

-- Circle - Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Circles'),
'Calculate the area. Radius $=$ $8$ m.',
'$201.06$ m² (or $64\\pi$ m²)',
3,
'{"type": "circle", "dimensions": {"radius": 55}, "labels": [{"text": "r = 8 m", "position": "center"}], "scale": 0.85}'::jsonb),

-- Circle - Difficulty 4
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Circles'),
'Find the area if the diameter is $14.5$ cm.',
'$165.05$ cm²',
4,
'{"type": "circle", "dimensions": {"radius": 52}, "labels": [{"text": "d = 14.5 cm", "position": "bottom", "offset": {"x": 0, "y": 15}}], "scale": 0.9}'::jsonb);

-- ============================================
-- VOLUME OF CUBOIDS - 10 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Cuboid - Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Cuboids'),
'Find the volume of this cuboid.',
'$240$ cm³',
1,
'{"type": "cuboid", "dimensions": {"width": 80, "height": 60, "depth": 50}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "5 cm", "position": "right"}, {"text": "6 cm", "position": "left"}], "scale": 0.85}'::jsonb),

-- Cuboid - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Cuboids'),
'Calculate the volume. Length $=$ $12$ m, Width $=$ $8$ m, Height $=$ $5$ m.',
'$480$ m³',
2,
'{"type": "cuboid", "dimensions": {"width": 90, "height": 65, "depth": 55}, "labels": [{"text": "12 m", "position": "bottom"}, {"text": "8 m", "position": "right"}, {"text": "5 m", "position": "left"}], "scale": 0.8}'::jsonb),

-- Cube (special cuboid) - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Cuboids'),
'Find the volume of this cube.',
'$512$ cm³',
2,
'{"type": "cuboid", "dimensions": {"width": 75, "height": 75, "depth": 50}, "labels": [{"text": "8 cm", "position": "bottom"}], "scale": 0.9}'::jsonb);

-- ============================================
-- VOLUME OF CYLINDERS - 8 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Cylinder - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Cylinders'),
'Find the volume of this cylinder. (Use $\\pi \\approx 3.14$)',
'$628$ cm³',
2,
'{"type": "cylinder", "dimensions": {"radius": 45, "height": 85}, "labels": [{"text": "r = 5 cm", "position": "top", "offset": {"x": 50, "y": 0}}, {"text": "h = 8 cm", "position": "left", "offset": {"x": -30, "y": 40}}], "scale": 0.8}'::jsonb),

-- Cylinder - Difficulty 3
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Cylinders'),
'Calculate the volume. Radius $=$ $6.5$ m, Height $=$ $12$ m.',
'$1,590.43$ m³',
3,
'{"type": "cylinder", "dimensions": {"radius": 48, "height": 90}, "labels": [{"text": "6.5 m", "position": "right", "offset": {"x": 35, "y": -40}}, {"text": "12 m", "position": "left", "offset": {"x": -25, "y": 45}}], "scale": 0.75}'::jsonb);

-- ============================================
-- PERIMETER - 10 questions with diagrams
-- ============================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
-- Rectangle perimeter - Difficulty 1
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Perimeter' AND subtopic = 'Perimeter Calculations'),
'Find the perimeter of this rectangle.',
'$28$ cm',
1,
'{"type": "rectangle", "dimensions": {"width": 120, "height": 70}, "labels": [{"text": "10 cm", "position": "top"}, {"text": "4 cm", "position": "right"}], "scale": 0.8}'::jsonb),

-- Triangle perimeter - Difficulty 2
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Perimeter' AND subtopic = 'Perimeter Calculations'),
'Calculate the perimeter of this triangle.',
'$36$ m',
2,
'{"type": "triangle", "dimensions": {"base": 100, "height": 75}, "labels": [{"text": "12 m", "position": "bottom"}, {"text": "10 m", "position": "topLeft", "offset": {"x": -20, "y": 0}}, {"text": "14 m", "position": "topRight", "offset": {"x": 20, "y": 0}}], "scale": 0.85}'::jsonb);

-- Verification query
SELECT 
  q.id,
  q.question_text,
  q.answer,
  q.difficulty,
  qb.category,
  qb.topic,
  qb.subtopic,
  q.diagram_data->>'type' as diagram_type,
  q.diagram_data IS NOT NULL as has_diagram
FROM questions q
JOIN question_banks qb ON q.bank_id = qb.id
WHERE qb.category = 'Measurement and Geometry'
ORDER BY qb.topic, qb.subtopic, q.difficulty;
