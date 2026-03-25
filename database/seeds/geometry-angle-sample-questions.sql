-- ============================================
-- GEOMETRY ANGLE DIAGRAMS - SAMPLE QUESTIONS
-- NZ Curriculum 2026 - Years 9-10
-- ============================================
-- Demonstrates angle diagrams with visually accurate representations
-- Angle ranges: 0-30°, 30-60°, 60-90°, 90°, 90-120°, 120-150°, 150-180°

-- First, create question banks for angle topics
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Geometry', 'Angles', 'Angles on a Line', 'Finding angles on a straight line (sum to 180°)'),
('Geometry', 'Angles', 'Angles in a Triangle', 'Finding angles in triangles (sum to 180°)'),
('Geometry', 'Angles', 'Parallel Lines', 'Angles formed by parallel lines and transversals'),
('Geometry', 'Angles', 'Vertically Opposite Angles', 'Finding vertically opposite angles'),
('Geometry', 'Angles', 'Angles at a Point', 'Angles around a point (sum to 360°)')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- Create question banks for shape examples
INSERT INTO question_banks (category, topic, subtopic, description) VALUES
('Measurement and Geometry', 'Area', 'Area of Kites', 'Finding the area of kites using diagonal formula'),
('Measurement and Geometry', 'Perimeter', 'Perimeter of Semicircles', 'Calculating perimeter of semicircles and half circles'),
('Measurement and Geometry', 'Volume', 'Volume of Prisms', 'Finding volume of rectangular and triangular prisms'),
('Measurement and Geometry', 'Volume', 'Volume of Pyramids', 'Calculating volume of pyramids')
ON CONFLICT (category, topic, subtopic) DO NOTHING;

-- ============================================
-- ANGLES ON A LINE (Supplementary Angles)
-- ============================================

-- Small acute angle (0-30°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $a$.',
'$155°$',
1,
'{"type": "anglesOnLine", "dimensions": {"angle1": 25, "angle2": 155}, "labels": [{"text": "25°", "position": "left", "offset": {"x": -20, "y": -25}}, {"text": "a", "position": "right", "offset": {"x": 20, "y": -25}}], "scale": 1}'::jsonb);

-- Medium acute angle (30-60°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $b$.',
'$130°$',
1,
'{"type": "anglesOnLine", "dimensions": {"angle1": 50, "angle2": 130}, "labels": [{"text": "50°", "position": "left", "offset": {"x": -15, "y": -30}}, {"text": "b", "position": "right", "offset": {"x": 15, "y": -20}}], "scale": 1}'::jsonb);

-- Large acute angle (60-90°) 
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $c$.',
'$105°$',
2,
'{"type": "anglesOnLine", "dimensions": {"angle1": 75, "angle2": 105}, "labels": [{"text": "75°", "position": "left", "offset": {"x": -10, "y": -35}}, {"text": "c", "position": "right", "offset": {"x": 10, "y": -25}}], "scale": 1}'::jsonb);

-- Right angle (90°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $d$.',
'$90°$',
1,
'{"type": "anglesOnLine", "dimensions": {"angle1": 90, "angle2": 90}, "labels": [{"text": "90°", "position": "left", "offset": {"x": 0, "y": -35}}, {"text": "d", "position": "right", "offset": {"x": 0, "y": -35}}], "scale": 1}'::jsonb);

-- Small obtuse angle (90-120°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $e$.',
'$70°$',
2,
'{"type": "anglesOnLine", "dimensions": {"angle1": 110, "angle2": 70}, "labels": [{"text": "110°", "position": "left", "offset": {"x": 5, "y": -35}}, {"text": "e", "position": "right", "offset": {"x": -10, "y": -30}}], "scale": 1}'::jsonb);

-- Large obtuse angle (120-150°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $f$.',
'$55°$',
2,
'{"type": "anglesOnLine", "dimensions": {"angle1": 125, "angle2": 55}, "labels": [{"text": "125°", "position": "left", "offset": {"x": 10, "y": -35}}, {"text": "f", "position": "right", "offset": {"x": -15, "y": -25}}], "scale": 1}'::jsonb);

-- Very large obtuse angle (150-180°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of angle $g$.',
'$18°$',
3,
'{"type": "anglesOnLine", "dimensions": {"angle1": 162, "angle2": 18}, "labels": [{"text": "162°", "position": "left", "offset": {"x": 15, "y": -30}}, {"text": "g", "position": "right", "offset": {"x": -20, "y": -20}}], "scale": 1}'::jsonb);

-- With algebra
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles on a Line'),
'Find the value of $x$.',
'$x = 40°$',
3,
'{"type": "anglesOnLine", "dimensions": {"angle1": 40, "angle2": 140}, "labels": [{"text": "x", "position": "left", "offset": {"x": -20, "y": -25}}, {"text": "140°", "position": "right", "offset": {"x": 20, "y": -25}}], "scale": 1}'::jsonb);

-- ============================================
-- ANGLES IN A TRIANGLE
-- ============================================

-- Equilateral triangle (60-60-60)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find the value of angle $x$ in this equilateral triangle.',
'$60°$',
1,
'{"type": "triangleAngles", "dimensions": {"angle1": 60, "angle2": 60, "angle3": 60}, "labels": [{"text": "60°", "position": "bottomLeft", "offset": {"x": 15, "y": -5}}, {"text": "60°", "position": "bottomRight", "offset": {"x": -15, "y": -5}}, {"text": "x", "position": "top", "offset": {"x": 0, "y": 15}}], "scale": 1}'::jsonb);

-- Isosceles with small angles (30-30-120)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $a$ in this isosceles triangle.',
'$120°$',
2,
'{"type": "triangleAngles", "dimensions": {"angle1": 30, "angle2": 30, "angle3": 120}, "labels": [{"text": "30°", "position": "bottomLeft", "offset": {"x": 20, "y": -5}}, {"text": "30°", "position": "bottomRight", "offset": {"x": -20, "y": -5}}, {"text": "a", "position": "top", "offset": {"x": 0, "y": 15}}], "scale": 1}'::jsonb);

-- Isosceles with large base angles (75-75-30)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $b$ at the apex.',
'$30°$',
2,
'{"type": "triangleAngles", "dimensions": {"angle1": 75, "angle2": 75, "angle3": 30}, "labels": [{"text": "75°", "position": "bottomLeft", "offset": {"x": 10, "y": -5}}, {"text": "75°", "position": "bottomRight", "offset": {"x": -10, "y": -5}}, {"text": "b", "position": "top", "offset": {"x": 0, "y": 20}}], "scale": 1}'::jsonb);

-- Right-angled triangle (30-60-90)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $c$ in this right triangle.',
'$60°$',
2,
'{"type": "triangleAngles", "dimensions": {"angle1": 90, "angle2": 30, "angle3": 60}, "labels": [{"text": "90°", "position": "bottomLeft", "offset": {"x": 15, "y": -5}}, {"text": "30°", "position": "bottomRight", "offset": {"x": -15, "y": -5}}, {"text": "c", "position": "top", "offset": {"x": 0, "y": 15}}], "scale": 1}'::jsonb);

-- Right-angled triangle (45-45-90)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $d$ in this isosceles right triangle.',
'$45°$',
2,
'{"type": "triangleAngles", "dimensions": {"angle1": 90, "angle2": 45, "angle3": 45}, "labels": [{"text": "90°", "position": "bottomLeft", "offset": {"x": 15, "y": -5}}, {"text": "45°", "position": "bottomRight", "offset": {"x": -15, "y": -5}}, {"text": "d", "position": "top", "offset": {"x": 0, "y": 15}}], "scale": 1}'::jsonb);

-- Scalene triangle (40-70-70)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find angle $e$.',
'$40°$',
3,
'{"type": "triangleAngles", "dimensions": {"angle1": 70, "angle2": 70, "angle3": 40}, "labels": [{"text": "70°", "position": "bottomLeft", "offset": {"x": 10, "y": -5}}, {"text": "70°", "position": "bottomRight", "offset": {"x": -10, "y": -5}}, {"text": "e", "position": "top", "offset": {"x": 0, "y": 20}}], "scale": 1}'::jsonb);

-- With algebra
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles in a Triangle'),
'Find the value of $x$ if all angles are equal.',
'$x = 60°$',
3,
'{"type": "triangleAngles", "dimensions": {"angle1": 60, "angle2": 60, "angle3": 60}, "labels": [{"text": "x", "position": "bottomLeft", "offset": {"x": 15, "y": -5}}, {"text": "x", "position": "bottomRight", "offset": {"x": -15, "y": -5}}, {"text": "x", "position": "top", "offset": {"x": 0, "y": 15}}], "scale": 1}'::jsonb);

-- ============================================
-- PARALLEL LINES WITH TRANSVERSAL
-- ============================================

-- Corresponding angles - small acute (25°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $a$ (corresponding angles).',
'$25°$',
2,
'{"type": "parallelLinesTransversal", "dimensions": {"angle1": 25}, "labels": [{"text": "25°", "position": "topLeft", "offset": {"x": 30, "y": -10}}, {"text": "a", "position": "bottomLeft", "offset": {"x": 30, "y": 0}}], "scale": 1}'::jsonb);

-- Alternate angles - medium acute (50°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $b$ (alternate angles are equal).',
'$50°$',
2,
'{"type": "parallelLinesTransversal", "dimensions": {"angle1": 50}, "labels": [{"text": "50°", "position": "topLeft", "offset": {"x": 30, "y": -10}}, {"text": "b", "position": "bottomRight", "offset": {"x": -30, "y": 5}}], "scale": 1}'::jsonb);

-- Co-interior angles - large acute (70°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $c$ (co-interior angles sum to 180°).',
'$110°$',
3,
'{"type": "parallelLinesTransversal", "dimensions": {"angle1": 70}, "labels": [{"text": "70°", "position": "topLeft", "offset": {"x": 25, "y": -10}}, {"text": "c", "position": "bottomLeft", "offset": {"x": -25, "y": 5}}], "scale": 1}'::jsonb);

-- Corresponding angles - obtuse (110°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $d$ using angle properties.',
'$110°$',
3,
'{"type": "parallelLinesTransversal", "dimensions": {"angle1": 70}, "labels": [{"text": "70°", "position": "topLeft", "offset": {"x": 30, "y": -10}}, {"text": "d", "position": "topRight", "offset": {"x": -30, "y": -10}}], "scale": 1}'::jsonb);

-- Multiple angles - 45°
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Parallel Lines'),
'Find angle $e$ (vertically opposite to alternate angle).',
'$45°$',
3,
'{"type": "parallelLinesTransversal", "dimensions": {"angle1": 45}, "labels": [{"text": "45°", "position": "topLeft", "offset": {"x": 25, "y": -10}}, {"text": "e", "position": "bottomLeft", "offset": {"x": -25, "y": 15}}], "scale": 1}'::jsonb);

-- ============================================
-- VERTICALLY OPPOSITE ANGLES
-- ============================================

-- Small acute angle (20°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Vertically Opposite Angles'),
'Find angle $a$ (vertically opposite angles are equal).',
'$20°$',
1,
'{"type": "verticallyOpposite", "dimensions": {"angle1": 20}, "labels": [{"text": "20°", "position": "right", "offset": {"x": 25, "y": -5}}, {"text": "a", "position": "left", "offset": {"x": -25, "y": 5}}], "scale": 1}'::jsonb);

-- Medium acute angle (50°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Vertically Opposite Angles'),
'Find angle $b$.',
'$50°$',
1,
'{"type": "verticallyOpposite", "dimensions": {"angle1": 50}, "labels": [{"text": "50°", "position": "right", "offset": {"x": 25, "y": -10}}, {"text": "b", "position": "left", "offset": {"x": -25, "y": 10}}], "scale": 1}'::jsonb);

-- Large acute angle (75°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Vertically Opposite Angles'),
'Find angle $c$.',
'$75°$',
2,
'{"type": "verticallyOpposite", "dimensions": {"angle1": 75}, "labels": [{"text": "75°", "position": "right", "offset": {"x": 20, "y": -15}}, {"text": "c", "position": "left", "offset": {"x": -20, "y": 15}}], "scale": 1}'::jsonb);

-- Obtuse angle (130°)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Vertically Opposite Angles'),
'Find angle $d$.',
'$130°$',
2,
'{"type": "verticallyOpposite", "dimensions": {"angle1": 130}, "labels": [{"text": "130°", "position": "right", "offset": {"x": 15, "y": 25}}, {"text": "d", "position": "left", "offset": {"x": -15, "y": -25}}], "scale": 1}'::jsonb);

-- ============================================
-- ANGLES AT A POINT
-- ============================================

-- Four angles around a point
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles at a Point'),
'Find angle $a$ (angles at a point sum to 360°).',
'$70°$',
2,
'{"type": "anglesAtPoint", "dimensions": {"angle1": 90, "angle2": 120, "angle3": 80, "angle4": 70}, "labels": [{"text": "90°", "position": "right", "offset": {"x": 40, "y": 0}}, {"text": "120°", "position": "top", "offset": {"x": 0, "y": -40}}, {"text": "80°", "position": "left", "offset": {"x": -40, "y": 0}}, {"text": "a", "position": "bottom", "offset": {"x": 0, "y": 35}}], "scale": 1}'::jsonb);

-- With right angle
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles at a Point'),
'Find angle $b$.',
'$135°$',
3,
'{"type": "anglesAtPoint", "dimensions": {"angle1": 90, "angle2": 90, "angle3": 45, "angle4": 135}, "labels": [{"text": "90°", "position": "right", "offset": {"x": 40, "y": 0}}, {"text": "90°", "position": "top", "offset": {"x": 0, "y": -40}}, {"text": "45°", "position": "left", "offset": {"x": -40, "y": -10}}, {"text": "b", "position": "bottom", "offset": {"x": 0, "y": 35}}], "scale": 1}'::jsonb);

-- With algebra
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Geometry' AND topic = 'Angles' AND subtopic = 'Angles at a Point'),
'Find $x$ if angles are $x$, $2x$, $2x$, $x$.',
'$x = 60°$',
3,
'{"type": "anglesAtPoint", "dimensions": {"angle1": 60, "angle2": 120, "angle3": 120, "angle4": 60}, "labels": [{"text": "x", "position": "right", "offset": {"x": 40, "y": -5}}, {"text": "2x", "position": "top", "offset": {"x": 0, "y": -40}}, {"text": "2x", "position": "left", "offset": {"x": -40, "y": 0}}, {"text": "x", "position": "bottom", "offset": {"x": 0, "y": 35}}], "scale": 1}'::jsonb);

-- ============================================
-- NEW SHAPE EXAMPLES
-- ============================================

-- Kite area
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Area' AND subtopic = 'Area of Kites'),
'Find the area of this kite.',
'$180$ cm²',
2,
'{"type": "kite", "dimensions": {"width": 60, "height": 120}, "labels": [{"text": "12 cm", "position": "top", "offset": {"x": 0, "y": -10}}, {"text": "6 cm", "position": "right", "offset": {"x": 20, "y": 0}}], "scale": 0.8}'::jsonb);

-- Semicircle perimeter
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Perimeter' AND subtopic = 'Perimeter of Semicircles'),
'Find the perimeter of this semicircle.',
'$25.7$ cm (approx)',
3,
'{"type": "semicircle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "center", "offset": {"x": 0, "y": -10}}], "scale": 1}'::jsonb);

-- Triangular prism volume
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Prisms'),
'Find the volume of this triangular prism.',
'$840$ cm³',
3,
'{"type": "triangularPrism", "dimensions": {"width": 70, "height": 60, "depth": 80}, "labels": [{"text": "7 cm", "position": "bottom", "offset": {"x": 0, "y": 15}}, {"text": "6 cm", "position": "left", "offset": {"x": -25, "y": -10}}, {"text": "8 cm", "position": "right", "offset": {"x": 45, "y": 5}}], "scale": 0.8}'::jsonb);

-- Pyramid volume
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement and Geometry' AND topic = 'Volume' AND subtopic = 'Volume of Pyramids'),
'Find the volume of this square-based pyramid.',
'$2,400$ cm³',
4,
'{"type": "pyramid", "dimensions": {"width": 90, "height": 80, "depth": 90}, "labels": [{"text": "9 cm", "position": "bottom", "offset": {"x": -30, "y": 15}}, {"text": "8 cm", "position": "left", "offset": {"x": -40, "y": -30}}], "scale": 0.75}'::jsonb);
