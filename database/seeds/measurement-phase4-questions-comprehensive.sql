-- =====================================================
-- MEASUREMENT QUESTIONS - NZ CURRICULUM PHASE 4 (Years 9-10)
-- COMPREHENSIVE DATABASE - 300 QUESTIONS
-- =====================================================
-- This file contains 20 questions for each measurement subtopic:
-- 
-- PERIMETER AND AREA (80 questions):
--   - Rectangles and Triangles (20)
--   - Circles (20)
--   - Composite Shapes (20)
--   - Trapeziums and Parallelograms (20)
--
-- VOLUME (80 questions):
--   - Cuboids and Prisms (20)
--   - Cylinders (20)
--   - Pyramids and Cones (20)
--   - Spheres (20)
--
-- UNITS (80 questions):
--   - Metric Conversions (20)
--   - Area and Volume Units (20)
--   - Time Calculations (20)
--   - Speed Distance Time (20)
--
-- SCALE (60 questions):
--   - Map Scales (20)
--   - Scale Drawings (20)
--   - Scale Factors (20)
--
-- Each question uses shape_id references to SHAPE_LIBRARY.md for consistent visuals
-- PREREQUISITE: Run nz-year9-10-curriculum-expansion.sql first
-- =====================================================

-- =====================================================
-- PERIMETER AND AREA: RECTANGLES AND TRIANGLES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES

-- RECTANGLES (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the area of this rectangle.',
'$96$ cm²',
1,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Calculate the perimeter of this rectangle.',
'$40$ cm',
1,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'If the area of this rectangle is $96$ cm² and the length is $12$ cm, find the width.',
'$8$ cm',
2,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "?", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'What is the area of this rectangle?',
'$90$ cm²',
1,
'{"shape_id": "RECT_02", "type": "rectangle", "dimensions": {"width": 150, "height": 60}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the perimeter of this rectangle.',
'$42$ cm',
1,
'{"shape_id": "RECT_02", "type": "rectangle", "dimensions": {"width": 150, "height": 60}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Calculate the area of this rectangular field.',
'$240$ m²',
1,
'{"shape_id": "RECT_03", "type": "rectangle", "dimensions": {"width": 200, "height": 120}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'A rectangular garden measures $20$ m by $12$ m. How much fencing is needed?',
'$64$ m',
2,
'{"shape_id": "RECT_03", "type": "rectangle", "dimensions": {"width": 200, "height": 120}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the area of this square.',
'$100$ cm²',
1,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'What is the perimeter of this square?',
'$40$ cm',
1,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'If a square has a perimeter of $40$ cm, what is its area?',
'$100$ cm²',
2,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "?", "position": "bottom"}], "scale": 1}'::jsonb),

-- TRIANGLES (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the area of this right-angled triangle.',
'$54$ cm²',
2,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "9 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Calculate the perimeter of this right-angled triangle.',
'$36$ cm',
2,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "9 cm", "position": "right"}, {"text": "15 cm", "position": "hypotenuse"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'If this triangle has a base of $12$ cm and an area of $54$ cm², what is the height?',
'$9$ cm',
3,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "?", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the area of this right triangle.',
'$24$ cm²',
2,
'{"shape_id": "TRI_RIGHT_02", "type": "triangle", "subtype": "right", "dimensions": {"base": 80, "height": 60, "hypotenuse": 100}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'What is the perimeter of this triangle?',
'$24$ cm',
2,
'{"shape_id": "TRI_RIGHT_02", "type": "triangle", "subtype": "right", "dimensions": {"base": 80, "height": 60, "hypotenuse": 100}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}, {"text": "10 cm", "position": "hypotenuse"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Calculate the area of this triangular plot.',
'$96$ m²',
2,
'{"shape_id": "TRI_RIGHT_03", "type": "triangle", "subtype": "right", "dimensions": {"base": 160, "height": 120, "hypotenuse": 200}, "labels": [{"text": "16 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Find the area of this isosceles triangle.',
'$70$ cm²',
2,
'{"shape_id": "TRI_ISOS_01", "type": "triangle", "subtype": "isosceles", "dimensions": {"base": 140, "height": 100}, "labels": [{"text": "14 cm", "position": "bottom"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'Calculate the area of this isosceles triangle.',
'$60$ cm²',
2,
'{"shape_id": "TRI_ISOS_02", "type": "triangle", "subtype": "isosceles", "dimensions": {"base": 100, "height": 120}, "labels": [{"text": "10 cm", "position": "bottom"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'What is the perimeter of this equilateral triangle?',
'$30$ cm',
1,
'{"shape_id": "TRI_EQUI_01", "type": "triangle", "subtype": "equilateral", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Rectangles and Triangles'),
'The formula for the area of a triangle is $A = \\frac{1}{2}bh$. Using this, find the area of a triangle with base $16$ cm and height $10$ cm.',
'$80$ cm²',
2,
NULL);

-- =====================================================
-- PERIMETER AND AREA: CIRCLES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the circumference of this circle. Use $\\pi \\approx 3.14159$.',
'$43.98$ cm (or $14\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Calculate the area of this circle.',
'$153.94$ cm² (or $49\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'What is the diameter of this circle?',
'$14$ cm',
1,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'If the radius of this circle is doubled, what is the new circumference?',
'$87.96$ cm (or $28\\pi$ cm)',
3,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the circumference of this circle.',
'$31.42$ cm (or $10\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_02", "type": "circle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Calculate the area of this circle.',
'$78.54$ cm² (or $25\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_02", "type": "circle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'A circular garden has a radius of $10$ m. What is its circumference?',
'$62.83$ m (or $20\\pi$ m)',
2,
'{"shape_id": "CIRCLE_03", "type": "circle", "dimensions": {"radius": 100}, "labels": [{"text": "10 m", "position": "radius"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the area of this circular garden.',
'$314.16$ m² (or $100\\pi$ m²)',
2,
'{"shape_id": "CIRCLE_03", "type": "circle", "dimensions": {"radius": 100}, "labels": [{"text": "10 m", "position": "radius"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Calculate the area of this circle.',
'$452.39$ cm² (or $144\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_04", "type": "circle", "dimensions": {"radius": 120}, "labels": [{"text": "12 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'This circle has a diameter of $16$ cm. Find its circumference.',
'$50.27$ cm (or $16\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_05", "type": "circle", "dimensions": {"radius": 80}, "labels": [{"text": "16 cm", "position": "diameter"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the area of this circle with diameter $16$ cm.',
'$201.06$ cm² (or $64\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_05", "type": "circle", "dimensions": {"radius": 80}, "labels": [{"text": "16 cm", "position": "diameter"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the area of this semicircle.',
'$56.55$ cm² (or $18\\pi$ cm²)',
3,
'{"shape_id": "SEMI_01", "type": "semicircle", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the perimeter of this semicircle (including the straight edge).',
'$30.85$ cm',
3,
'{"shape_id": "SEMI_01", "type": "semicircle", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Calculate the area of this semicircle.',
'$157.08$ cm² (or $50\\pi$ cm²)',
3,
'{"shape_id": "SEMI_02", "type": "semicircle", "dimensions": {"radius": 100}, "labels": [{"text": "10 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Derive the formula for a semicircle''s area from a full circle. If a circle has area $\\pi r^2$, what is the semicircle''s area?',
'$\\frac{1}{2}\\pi r^2$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'A quarter circle has radius $8$ cm. What is its area?',
'$50.27$ cm² (or $16\\pi$ cm²)',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'Find the perimeter of a quarter circle with radius $8$ cm (include the straight edges).',
'$28.57$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'If a circle has a circumference of $62.83$ cm, what is its radius?',
'$10$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'A circular pond has an area of $314.16$ m². What is its radius?',
'$10$ m',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Circles'),
'The formula for circumference is $C = 2\\pi r$. Rearrange this to make $r$ the subject.',
'$r = \\frac{C}{2\\pi}$',
3,
NULL);

-- =====================================================
-- PERIMETER AND AREA: COMPOSITE SHAPES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the total area of this L-shaped figure.',
'$120$ cm²',
3,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'What is the perimeter of this L-shaped figure?',
'$52$ cm',
3,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Split this L-shape into two rectangles and find each area.',
'$80$ cm² and $40$ cm²',
4,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the total area of this shape (rectangle with semicircle on top).',
'$99.27$ cm²',
4,
'{"shape_id": "COMP_02", "type": "compound", "subtype": "rect-semicircle", "components": [{"type": "rectangle", "width": 100, "height": 60}, {"type": "semicircle", "radius": 50}], "labels": [{"text": "10 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'This shape is made of a rectangle and a semicircle. What is the area of just the rectangular part?',
'$60$ cm²',
3,
'{"shape_id": "COMP_02", "type": "compound", "subtype": "rect-semicircle", "components": [{"type": "rectangle", "width": 100, "height": 60}, {"type": "semicircle", "radius": 50}], "labels": [{"text": "10 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the total area of this house-shaped figure.',
'$64$ cm²',
3,
'{"shape_id": "COMP_03", "type": "compound", "subtype": "house", "components": [{"type": "rectangle", "width": 80, "height": 60}, {"type": "triangle", "base": 80, "height": 40}], "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}, {"text": "4 cm", "position": "roof"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'This house shape has a rectangular base and triangular roof. Find the area of the rectangular base only.',
'$48$ cm²',
2,
'{"shape_id": "COMP_03", "type": "compound", "subtype": "house", "components": [{"type": "rectangle", "width": 80, "height": 60}, {"type": "triangle", "base": 80, "height": 40}], "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}, {"text": "4 cm", "position": "roof"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the area of this shape (rectangle with semicircular cutout).',
'$81.86$ cm²',
4,
'{"shape_id": "COMP_04", "type": "compound", "subtype": "rect-cutout", "components": [{"type": "rectangle", "width": 120, "height": 80}, {"type": "semicircle", "radius": 30, "subtract": true}], "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "side"}, {"text": "3 cm", "position": "cutout"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'This rectangle has a semicircular cutout. What is the area of the cutout?',
'$14.14$ cm²',
3,
'{"shape_id": "COMP_04", "type": "compound", "subtype": "rect-cutout", "components": [{"type": "rectangle", "width": 120, "height": 80}, {"type": "semicircle", "radius": 30, "subtract": true}], "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "side"}, {"text": "3 cm", "position": "cutout"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the area of this stadium shape (rectangle with two semicircles on the ends).',
'$88.27$ cm²',
4,
'{"shape_id": "COMP_05", "type": "compound", "subtype": "stadium", "components": [{"type": "rectangle", "width": 80, "height": 60}, {"type": "semicircle", "radius": 30}, {"type": "semicircle", "radius": 30}], "labels": [{"text": "8 cm", "position": "middle"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A composite shape is made of a rectangle $(10 \\text{ cm} \\times 6 \\text{ cm})$ and a triangle (base $10$ cm, height $4$ cm). Find the total area.',
'$80$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A shape consists of a square (side $8$ cm) with a semicircle on top (radius $4$ cm). What is the total area?',
'$89.13$ cm²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the area of a shape made by removing a circle (radius $3$ cm) from a square (side $10$ cm).',
'$71.73$ cm²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A garden path is $1$ m wide around a rectangular lawn $(10 \\text{ m} \\times 6 \\text{ m})$. What is the area of the path?',
'$36$ m²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A composite shape has two rectangles: one is $12 \\text{ cm} \\times 5 \\text{ cm}$ and the other is $8 \\text{ cm} \\times 4 \\text{ cm}$. Find the total area.',
'$92$ cm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the perimeter of a shape made of three squares (each side $5$ cm) arranged in an L-shape.',
'$40$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A running track consists of two semicircles (radius $30$ m) and two straight sections (length $100$ m). What is the total track length?',
'$388.50$ m',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'Find the area inside a square (side $20$ cm) but outside an inscribed circle (diameter $20$ cm).',
'$86.36$ cm²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'A window frame is rectangular ($60 \\text{ cm} \\times 40 \\text{ cm}$) with a semicircular arch on top (diameter $60$ cm). Find the total area.',
'$3813.98$ cm²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Composite Shapes'),
'An octagon can be split into a rectangle and four triangles. If the rectangle is $10 \\text{ cm} \\times 10 \\text{ cm}$ and each triangle has area $12.5$ cm², find the total octagon area.',
'$150$ cm²',
4,
NULL);

-- =====================================================
-- PERIMETER AND AREA: TRAPEZIUMS AND PARALLELOGRAMS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES

-- PARALLELOGRAMS (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the area of this parallelogram.',
'$96$ cm²',
2,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'This parallelogram has base $12$ cm and height $8$ cm. A rectangle has the same base and height. Are their areas equal?',
'Yes, both $96$ cm²',
3,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'If the area of this parallelogram is $96$ cm² and the base is $12$ cm, find the perpendicular height.',
'$8$ cm',
3,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "?", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Calculate the area of this parallelogram.',
'$90$ cm²',
2,
'{"shape_id": "PARA_02", "type": "parallelogram", "dimensions": {"base": 150, "height": 60, "side": 80}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the perimeter of this parallelogram if the sloped side is $8$ cm.',
'$46$ cm',
2,
'{"shape_id": "PARA_02", "type": "parallelogram", "dimensions": {"base": 150, "height": 60, "side": 80}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "8 cm", "position": "side"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'What is the area of this parallelogram?',
'$240$ m²',
2,
'{"shape_id": "PARA_03", "type": "parallelogram", "dimensions": {"base": 200, "height": 120, "side": 150}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'The area formula for a parallelogram is $A = b \\times h$, where $b$ is the base and $h$ is the perpendicular height. Why don''t we use the sloped side length?',
'Because area depends on perpendicular height, not slant',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'A parallelogram has a base of $18$ cm and a perpendicular height of $7$ cm. Find its area.',
'$126$ cm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'If a parallelogram has an area of $200$ cm² and a height of $10$ cm, what is the base?',
'$20$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Explain how the formula for a parallelogram''s area relates to a rectangle''s area formula.',
'Both use $A = b \\times h$; parallelogram can be rearranged into rectangle',
3,
NULL),

-- TRAPEZIUMS (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the area of this trapezium using $A = \\frac{1}{2}(a+b)h$.',
'$64$ cm²',
3,
'{"shape_id": "TRAP_01", "type": "trapezium", "dimensions": {"top": 60, "bottom": 100, "height": 80}, "labels": [{"text": "6 cm", "position": "top"}, {"text": "10 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'If the area is $64$ cm², height is $8$ cm, and one parallel side is $10$ cm, find the other parallel side.',
'$6$ cm',
4,
'{"shape_id": "TRAP_01", "type": "trapezium", "dimensions": {"top": 60, "bottom": 100, "height": 80}, "labels": [{"text": "?", "position": "top"}, {"text": "10 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Calculate the area of this trapezium.',
'$50$ cm²',
3,
'{"shape_id": "TRAP_02", "type": "trapezium", "dimensions": {"top": 80, "bottom": 120, "height": 50}, "labels": [{"text": "8 cm", "position": "top"}, {"text": "12 cm", "position": "bottom"}, {"text": "5 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'The average of the parallel sides in this trapezium is $(8 + 12) \\div 2 = 10$ cm. Use this to find the area.',
'$50$ cm²',
3,
'{"shape_id": "TRAP_02", "type": "trapezium", "dimensions": {"top": 80, "bottom": 120, "height": 50}, "labels": [{"text": "8 cm", "position": "top"}, {"text": "12 cm", "position": "bottom"}, {"text": "5 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the area of this trapezium.',
'$150$ m²',
3,
'{"shape_id": "TRAP_03", "type": "trapezium", "dimensions": {"top": 120, "bottom": 180, "height": 100}, "labels": [{"text": "12 m", "position": "top"}, {"text": "18 m", "position": "bottom"}, {"text": "10 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'A trapezium has parallel sides of $12$ m and $18$ m. If the area is $150$ m², what is the height?',
'$10$ m',
4,
'{"shape_id": "TRAP_03", "type": "trapezium", "dimensions": {"top": 120, "bottom": 180, "height": 100}, "labels": [{"text": "12 m", "position": "top"}, {"text": "18 m", "position": "bottom"}, {"text": "?", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the area of a trapezium with parallel sides $14$ cm and $10$ cm, and height $6$ cm.',
'$72$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'The formula for a trapezium is $A = \\frac{1}{2}(a+b)h$. Rearrange this to make $h$ the subject.',
'$h = \\frac{2A}{a+b}$',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Find the area of this kite using $A = \\frac{1}{2} d_1 d_2$.',
'$48$ cm²',
3,
'{"shape_id": "KITE_01", "type": "kite", "dimensions": {"diagonal1": 120, "diagonal2": 80}, "labels": [{"text": "12 cm", "position": "diagonal1"}, {"text": "8 cm", "position": "diagonal2"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter and Area' AND subtopic = 'Trapeziums and Parallelograms'),
'Calculate the area of this kite.',
'$80$ cm²',
3,
'{"shape_id": "KITE_02", "type": "kite", "dimensions": {"diagonal1": 160, "diagonal2": 100}, "labels": [{"text": "16 cm", "position": "diagonal1"}, {"text": "10 cm", "position": "diagonal2"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME: CUBOIDS AND PRISMS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES

-- CUBOIDS (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Find the volume of this cuboid.',
'$480$ cm³',
2,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Calculate the surface area of this cuboid.',
'$376$ cm²',
3,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'What is the area of the largest face of this cuboid?',
'$80$ cm²',
2,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'How many millilitres of water can this box hold? (Hint: $1$ cm³ $= 1$ mL)',
'$480$ mL',
3,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Calculate the volume of this cuboid.',
'$240$ cm³',
2,
'{"shape_id": "CUBOID_02", "type": "cuboid", "dimensions": {"length": 120, "width": 50, "height": 40}, "labels": [{"text": "12 cm", "position": "length"}, {"text": "5 cm", "position": "width"}, {"text": "4 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Find the surface area of this cuboid.',
'$256$ cm²',
3,
'{"shape_id": "CUBOID_02", "type": "cuboid", "dimensions": {"length": 120, "width": 50, "height": 40}, "labels": [{"text": "12 cm", "position": "length"}, {"text": "5 cm", "position": "width"}, {"text": "4 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'What is the volume of this storage container?',
'$1200$ m³',
2,
'{"shape_id": "CUBOID_03", "type": "cuboid", "dimensions": {"length": 150, "width": 100, "height": 80}, "labels": [{"text": "15 m", "position": "length"}, {"text": "10 m", "position": "width"}, {"text": "8 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Calculate the surface area of this container.',
'$700$ m²',
3,
'{"shape_id": "CUBOID_03", "type": "cuboid", "dimensions": {"length": 150, "width": 100, "height": 80}, "labels": [{"text": "15 m", "position": "length"}, {"text": "10 m", "position": "width"}, {"text": "8 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Find the volume of this cuboid.',
'$3600$ cm³',
2,
'{"shape_id": "CUBOID_04", "type": "cuboid", "dimensions": {"length": 200, "width": 150, "height": 120}, "labels": [{"text": "20 cm", "position": "length"}, {"text": "15 cm", "position": "width"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'How many litres does this container hold? (Hint: $1000$ cm³ $= 1$ L)',
'$3.6$ L',
3,
'{"shape_id": "CUBOID_04", "type": "cuboid", "dimensions": {"length": 200, "width": 150, "height": 120}, "labels": [{"text": "20 cm", "position": "length"}, {"text": "15 cm", "position": "width"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

-- PRISMS (10 questions)
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Find the volume of this triangular prism. (Volume $=$ cross-sectional area $\\times$ length)',
'$288$ cm³',
3,
'{"shape_id": "TRI_PRISM_01", "type": "triangularPrism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'What is the cross-sectional area of this triangular prism?',
'$24$ cm²',
2,
'{"shape_id": "TRI_PRISM_01", "type": "triangularPrism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'If the length of this prism is doubled, what is the new volume?',
'$576$ cm³',
3,
'{"shape_id": "TRI_PRISM_01", "type": "triangularPrism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'The general formula for a prism is $V = Al$, where $A$ is the cross-sectional area. Explain why this works.',
'The volume is the area "extruded" along the length',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Calculate the volume of this triangular prism.',
'$900$ cm³',
3,
'{"shape_id": "TRI_PRISM_02", "type": "triangularPrism", "dimensions": {"base": 100, "height": 120, "length": 150}, "labels": [{"text": "10 cm", "position": "base"}, {"text": "12 cm", "position": "height"}, {"text": "15 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'Find the volume of this prism with an equilateral triangle cross-section. (Triangle area $\\approx 27.69$ cm²)',
'$553.76$ cm³',
4,
'{"shape_id": "TRI_PRISM_03", "type": "triangularPrism", "dimensions": {"side": 80, "length": 200}, "labels": [{"text": "8 cm", "position": "side"}, {"text": "20 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'A prism has a cross-sectional area of $35$ cm² and a length of $12$ cm. Find its volume.',
'$420$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'A pentagonal prism has a cross-section area of $50$ cm² and a length of $15$ cm. What is its volume?',
'$750$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'If a prism has volume $600$ cm³ and length $20$ cm, what is the cross-sectional area?',
'$30$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids and Prisms'),
'A cube has edge length $8$ cm. Find its volume.',
'$512$ cm³',
2,
'{"shape_id": "CUBE_01", "type": "cube", "dimensions": {"side": 80}, "labels": [{"text": "8 cm", "position": "side"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME: CYLINDERS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the volume of this cylinder. (Volume $= \\pi r^2 h$)',
'$942.48$ cm³ (or $300\\pi$ cm³)',
3,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Calculate the surface area of this cylinder.',
'$534.07$ cm² (or $170\\pi$ cm²)',
4,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'What is the curved surface area of this cylinder? (CSA $= 2\\pi rh$)',
'$376.99$ cm²',
3,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the area of one circular end of this cylinder.',
'$78.54$ cm²',
2,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Calculate the volume of this cylindrical can.',
'$1539.38$ cm³',
3,
'{"shape_id": "CYLINDER_02", "type": "cylinder", "dimensions": {"radius": 70, "height": 100}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'How many litres does this cylinder hold? ($1000$ cm³ $= 1$ L)',
'$1.54$ L',
3,
'{"shape_id": "CYLINDER_02", "type": "cylinder", "dimensions": {"radius": 70, "height": 100}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the surface area of this cylinder.',
'$747.70$ cm²',
4,
'{"shape_id": "CYLINDER_02", "type": "cylinder", "dimensions": {"radius": 70, "height": 100}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'This cylinder has diameter $10$ cm. Find its volume.',
'$628.32$ cm³',
3,
'{"shape_id": "CYLINDER_03", "type": "cylinder", "dimensions": {"radius": 50, "height": 80}, "labels": [{"text": "10 cm", "position": "diameter"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Calculate the surface area of this cylinder.',
'$408.41$ cm²',
4,
'{"shape_id": "CYLINDER_03", "type": "cylinder", "dimensions": {"radius": 50, "height": 80}, "labels": [{"text": "10 cm", "position": "diameter"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'If a cylinder has volume $942$ cm³ and height $12$ cm, find its radius.',
'$5$ cm',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A cylindrical water tank has radius $2$ m and height $5$ m. Find its volume.',
'$62.83$ m³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A pipe has inner radius $3$ cm and length $20$ cm. What volume of water can it hold?',
'$565.49$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A cylinder and a cuboid both have height $10$ cm and base area $50$ cm². Are their volumes equal?',
'Yes, both $500$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the volume of a cylinder with radius $6$ cm and height $15$ cm.',
'$1696.46$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A drum has diameter $40$ cm and height $60$ cm. Find its volume.',
'$75398.22$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'If a cylinder''s radius is tripled, by what factor does its volume increase?',
'$9$ times (factor of $3^2$)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A cylindrical glass has radius $4$ cm and height $12$ cm. How many mL does it hold?',
'$603$ mL',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the curved surface area of a cylinder with radius $8$ cm and height $10$ cm.',
'$502.65$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'A cylindrical can has surface area $400$ cm² and radius $5$ cm. Find its height.',
'$7.73$ cm',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Explain why doubling the height doubles the volume, but doubling the radius quadruples the volume.',
'Volume formula has $r^2$, so radius is squared',
4,
NULL);

-- =====================================================
-- VOLUME: PYRAMIDS AND CONES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the volume of this square-based pyramid. ($V = \\frac{1}{3} \\times \\text{base area} \\times \\text{height}$)',
'$128$ cm³',
3,
'{"shape_id": "PYRAMID_01", "type": "pyramid", "subtype": "square", "dimensions": {"base_length": 80, "base_width": 80, "height": 60}, "labels": [{"text": "8 cm", "position": "base"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Calculate the volume of this pyramid.',
'$400$ cm³',
3,
'{"shape_id": "PYRAMID_02", "type": "pyramid", "subtype": "square", "dimensions": {"base_length": 100, "base_width": 100, "height": 120}, "labels": [{"text": "10 cm", "position": "base"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the volume of this rectangular-based pyramid.',
'$288$ cm³',
3,
'{"shape_id": "PYRAMID_03", "type": "pyramid", "subtype": "rectangular", "dimensions": {"base_length": 120, "base_width": 80, "height": 90}, "labels": [{"text": "12 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "9 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Why is the volume of a pyramid one-third the volume of a prism with the same base and height?',
'Three pyramids fit exactly into one prism',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the volume of this cone. ($V = \\frac{1}{3}\\pi r^2 h$)',
'$314.16$ cm³',
3,
'{"shape_id": "CONE_01", "type": "cone", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Calculate the volume of this cone.',
'$301.59$ cm³',
3,
'{"shape_id": "CONE_02", "type": "cone", "dimensions": {"radius": 60, "height": 80}, "labels": [{"text": "6 cm", "position": "radius"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the volume of this cone.',
'$1231.5$ cm³',
3,
'{"shape_id": "CONE_03", "type": "cone", "dimensions": {"radius": 70, "height": 240}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "24 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A pyramid has a square base with side $6$ cm and height $8$ cm. Find its volume.',
'$96$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A cone has radius $4$ cm and height $9$ cm. Calculate its volume.',
'$150.80$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'If a cone and cylinder have the same base and height, how do their volumes compare?',
'Cone volume is $\\frac{1}{3}$ of cylinder volume',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A pyramid has volume $200$ cm³ and base area $60$ cm². Find its height.',
'$10$ cm',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the volume of a cone with diameter $12$ cm and height $10$ cm.',
'$376.99$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A square pyramid has base side $10$ cm and volume $300$ cm³. What is its height?',
'$9$ cm',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'An ice cream cone has radius $3$ cm and height $12$ cm. What volume of ice cream fits inside?',
'$113.10$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A tent is shaped like a square pyramid with base $4$ m and height $3$ m. Find its volume.',
'$16$ m³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'Find the surface area formula for a cone: base area $+ $ curved surface area.',
'$\\pi r^2 + \\pi r l$ (where $l$ is slant height)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A cone has radius $5$ cm and slant height $13$ cm. Find the curved surface area.',
'$204.20$ cm²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A rectangular pyramid has base $6 \\text{ cm} \\times 5 \\text{ cm}$ and height $10$ cm. Find volume.',
'$100$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'If a cone''s radius doubles and height stays the same, by what factor does volume increase?',
'$4$ times',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Pyramids and Cones'),
'A traffic cone has radius $15$ cm and height $50$ cm. Find its volume.',
'$11781$ cm³',
3,
NULL);

-- =====================================================
-- VOLUME: SPHERES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Find the volume of this sphere. ($V = \\frac{4}{3}\\pi r^3$)',
'$523.6$ cm³',
3,
'{"shape_id": "SPHERE_01", "type": "sphere", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Calculate the surface area of this sphere. ($SA = 4\\pi r^2$)',
'$314.16$ cm²',
3,
'{"shape_id": "SPHERE_01", "type": "sphere", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Find the volume of this sphere.',
'$904.78$ cm³',
3,
'{"shape_id": "SPHERE_02", "type": "sphere", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Calculate the surface area of this sphere.',
'$452.39$ cm²',
3,
'{"shape_id": "SPHERE_02", "type": "sphere", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Find the volume of this sphere.',
'$4188.79$ cm³',
3,
'{"shape_id": "SPHERE_03", "type": "sphere", "dimensions": {"radius": 100}, "labels": [{"text": "10 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Calculate the surface area of this sphere.',
'$1256.64$ cm²',
3,
'{"shape_id": "SPHERE_03", "type": "sphere", "dimensions": {"radius": 100}, "labels": [{"text": "10 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A ball has diameter $14$ cm. Find its volume.',
'$1436.76$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A sphere has radius $3$ cm. Find its volume.',
'$113.10$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A sphere has radius $8$ cm. Find its surface area.',
'$804.25$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'If a sphere''s radius doubles, by what factor does its volume increase?',
'$8$ times (factor of $2^3$)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A hemisphere has radius $6$ cm. What is its volume? (Half a sphere)',
'$452.39$ cm³',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Earth''s radius is approximately $6400$ km. Estimate its surface area.',
'$5.15 \\times 10^8$ km²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A ball bearing has diameter $2$ cm. Find its volume.',
'$4.19$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'If a sphere has volume $905$ cm³, find its radius.',
'$6$ cm',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A spherical water tank has radius $1.5$ m. How many litres does it hold? ($1$ m³ $= 1000$ L)',
'$14137$ L',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Compare the volume formulas: cylinder ($\\pi r^2 h$) and sphere ($\\frac{4}{3}\\pi r^3$). When are they equal?',
'When $h = \\frac{4r}{3}$',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A spherical balloon has radius $20$ cm. Find its surface area.',
'$5026.55$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A spherical orange has diameter $8$ cm. Find its volume.',
'$268.08$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'Why is the sphere the shape with minimum surface area for a given volume?',
'All points equidistant from center minimizes surface',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Spheres'),
'A marble has radius $0.5$ cm. How many marbles fit in a box of volume $1000$ cm³? (Ignore gaps)',
'$1910$ marbles',
4,
NULL);

-- =====================================================
-- UNITS: METRIC CONVERSIONS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $3.5$ metres to centimetres.',
'$350$ cm',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $2500$ millilitres to litres.',
'$2.5$ L',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'How many grams are in $3.2$ kilograms?',
'$3200$ g',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $450$ centimetres to metres.',
'$4.5$ m',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Express $0.75$ kilometres in metres.',
'$750$ m',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $5600$ millimetres to metres.',
'$5.6$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'How many milligrams in $0.04$ grams?',
'$40$ mg',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $1.2$ tonnes to kilograms.',
'$1200$ kg',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Express $3.5$ litres in millilitres.',
'$3500$ mL',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $85$ mm to cm.',
'$8.5$ cm',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'A rope is $2.3$ m long. Express this in centimetres.',
'$230$ cm',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $0.006$ kilometres to centimetres.',
'$600$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'How many microlitres ($\\mu$L) in $5$ millilitres? (micro = $10^{-6}$)',
'$5000$ $\\mu$L',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $3.5$ megabytes to kilobytes. (mega = $10^6$, kilo = $10^3$)',
'$3500$ kB',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'A bottle contains $750$ mL. How many litres is this?',
'$0.75$ L',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $2.4$ km to mm.',
'$2400000$ mm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'A marathon is $42.195$ km. Express this in metres.',
'$42195$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'Convert $0.05$ tonnes to grams.',
'$50000$ g',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'A nail is $55$ mm long. Express in cm.',
'$5.5$ cm',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Metric Conversions'),
'The prefix "nano" means $10^{-9}$. How many nanometres in $1$ metre?',
'$1000000000$ nm (or $10^9$ nm)',
3,
NULL);

-- =====================================================
-- UNITS: AREA AND VOLUME UNITS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $5$ m² to cm².',
'$50000$ cm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'How many cm² in $1$ m²?',
'$10000$ cm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $3000$ cm² to m².',
'$0.3$ m²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'A room has area $15$ m². Express this in cm².',
'$150000$ cm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $2$ km² to m².',
'$2000000$ m²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'How many mm² in $1$ cm²?',
'$100$ mm²',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $5$ m³ to cm³.',
'$5000000$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'How many cm³ in $1$ m³?',
'$1000000$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $250000$ cm³ to m³.',
'$0.25$ m³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'A tank holds $0.5$ m³ of water. How many litres is this?',
'$500$ L',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'If $1$ mL $= 1$ cm³, how many mL in $1$ litre?',
'$1000$ mL',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $4.5$ litres to cm³.',
'$4500$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'A field has area $2.5$ hectares. If $1$ hectare $= 10000$ m², find area in m².',
'$25000$ m²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Why do we square the conversion factor when converting area units?',
'Because area has two dimensions',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Why do we cube the conversion factor when converting volume units?',
'Because volume has three dimensions',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $800$ mm³ to cm³.',
'$0.8$ cm³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'A pool holds $50000$ litres. Express this in m³.',
'$50$ m³',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $0.002$ km² to m².',
'$2000$ m²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'A cube has edge length $10$ cm. Its volume is $1000$ cm³ $= 1$ L. Explain why.',
'$1$ cm³ $= 1$ mL, so $1000$ cm³ $= 1000$ mL $= 1$ L',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Area and Volume Units'),
'Convert $0.05$ m³ to litres.',
'$50$ L',
2,
NULL);

-- =====================================================
-- UNITS: TIME CALCULATIONS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Convert $3.5$ hours to minutes.',
'$210$ minutes',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'How many seconds in $5$ minutes?',
'$300$ seconds',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Convert $180$ minutes to hours.',
'$3$ hours',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'How many hours in $2$ days?',
'$48$ hours',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Express $90$ seconds in minutes.',
'$1.5$ minutes',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'A movie lasts $2$ hours $15$ minutes. Express this in minutes.',
'$135$ minutes',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'How many seconds in $1$ hour?',
'$3600$ seconds',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Convert $0.75$ hours to minutes.',
'$45$ minutes',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'A race takes $2$ minutes $30$ seconds. Express in seconds only.',
'$150$ seconds',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'How many weeks in $1$ year? (Use $365$ days)',
'$52.14$ weeks (or $52$ weeks)',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Express $5400$ seconds in hours.',
'$1.5$ hours',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'A train journey is $3$ hours $45$ minutes. How many minutes is this?',
'$225$ minutes',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Convert $0.25$ days to hours.',
'$6$ hours',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'An athlete runs $100$ m in $12.5$ seconds. Express the time in milliseconds.',
'$12500$ ms',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'How many hours in $1$ week?',
'$168$ hours',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'A flight departs at $14:30$ and arrives at $17:15$. How long is the flight?',
'$2$ hours $45$ minutes',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Why is time not a pure metric system? (Explain $60$ seconds, $24$ hours)',
'Based on ancient astronomy, not powers of $10$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'Express $0.5$ hours in seconds.',
'$1800$ seconds',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'A year has approximately how many seconds? (Use $365$ days)',
'$31536000$ seconds',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Time Calculations'),
'If a clock shows $9:45$ am and it''s been running for $3$ hours $20$ minutes, what time did it start?',
'$6:25$ am',
3,
NULL);

-- =====================================================
-- UNITS: SPEED DISTANCE TIME (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A car travels $150$ km in $3$ hours. Find its average speed.',
'$50$ km/h',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'If speed $= 60$ km/h and time $= 2$ hours, find distance.',
'$120$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A runner travels $12$ km at $8$ km/h. How long does it take?',
'$1.5$ hours',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'What is the relationship between speed, distance, and time?',
'Speed $= \\frac{\\text{Distance}}{\\text{Time}}$',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A cyclist travels $45$ km in $2.5$ hours. Find the speed.',
'$18$ km/h',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'At $80$ km/h, how far do you travel in $30$ minutes?',
'$40$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A train travels $250$ km at $100$ km/h. How long does the journey take?',
'$2.5$ hours',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'Convert $20$ m/s to km/h.',
'$72$ km/h',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A plane flies $900$ km in $1$ hour $30$ minutes. Find its speed.',
'$600$ km/h',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'At $15$ m/s, how many metres do you travel in $10$ seconds?',
'$150$ m',
1,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A walker travels $4$ km in $50$ minutes. Find the speed in km/h.',
'$4.8$ km/h',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'The speed limit is $100$ km/h. How far can you legally travel in $15$ minutes?',
'$25$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'Convert $90$ km/h to m/s.',
'$25$ m/s',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A car travels $180$ km. Half at $60$ km/h, half at $90$ km/h. Find total time.',
'$2.5$ hours',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'On a speed-time graph, what does the gradient represent?',
'Acceleration',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'On a distance-time graph, what does the gradient represent?',
'Speed',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'A snail moves at $0.05$ km/h. How long to travel $100$ m?',
'$2$ hours',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'Sound travels at about $340$ m/s. How far does it travel in $5$ seconds?',
'$1700$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'Light travels at $3 \\times 10^8$ m/s. How far in $1$ second?',
'$300000000$ m (300000 km)',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Units' AND subtopic = 'Speed Distance Time'),
'Average speed for a journey is total distance $\\div$ total time. A bus travels $30$ km in $1$ hour, then $20$ km in $0.5$ hours. Find average speed.',
'$33.3$ km/h',
4,
NULL);

-- =====================================================
-- SCALE: MAP SCALES (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A map scale is $1:50000$. What real distance does $4$ cm represent?',
'$2$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a map with scale $1:25000$, two towns are $8$ cm apart. Find the real distance.',
'$2$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A real distance of $3$ km is represented by $6$ cm on a map. What is the scale?',
'$1:50000$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a $1:100000$ scale map, what distance does $1$ cm represent?',
'$1$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A map uses scale $1:20000$. How many cm on the map represents $500$ m?',
'$2.5$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'What does a scale ratio of $1:50000$ mean?',
'$1$ unit on map $= 50000$ units in reality',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A map scale is $1:250000$. Two cities are $150$ km apart. How far apart on the map?',
'$60$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a $1:10000$ scale map, a park measures $3$ cm $\\times 2$ cm. Find the actual area.',
'$60000$ m²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A scale of $1$ cm to $5$ km can be written as ratio $1:n$. Find $n$.',
'$500000$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a $1:50000$ map, a road is $12$ cm. Find real length in metres.',
'$6000$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'Which is a larger scale: $1:10000$ or $1:50000$?',
'$1:10000$ (shows more detail)',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A school playground is $50$ m $\\times 30$ m. On a $1:500$ map, what are its dimensions?',
'$10$ cm $\\times 6$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A map scale is $2$ cm to $1$ km. Express this as a ratio.',
'$1:50000$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a $1:75000$ map, a river is $8$ cm. How long is the real river?',
'$6$ km',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'Two towns are $15$ km apart. On a map they''re $5$ cm apart. Find the scale.',
'$1:300000$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A map with scale $1:25000$ has a forest area of $4$ cm². What is the real area?',
'$250000$ m² ($0.25$ km²)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'Why must we square the scale factor when calculating area from maps?',
'Area has two dimensions',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A scale drawing uses $1:200$. A room is $4$ m $\\times 3$ m. Find map dimensions.',
'$2$ cm $\\times 1.5$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'On a $1:1000$ map, a building is $5$ mm wide. Find real width.',
'$5$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Map Scales'),
'A walking trail is $12$ km. On a $1:40000$ map, how long will it appear?',
'$30$ cm',
3,
NULL);

-- =====================================================
-- SCALE: SCALE DRAWINGS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A table is $1.5$ m long. In a $1:20$ scale drawing, how long should it be drawn?',
'$7.5$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A scale drawing shows a car as $8$ cm long. If scale is $1:50$, find real length.',
'$4$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'An architect''s drawing uses scale $1:100$. A wall is drawn as $6$ cm. Find real length.',
'$6$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A bedroom is $4$ m $\\times 3$ m. Draw it at scale $1:50$. What dimensions on paper?',
'$8$ cm $\\times 6$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A door is $2$ m tall. At scale $1:25$, how tall in the drawing?',
'$8$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'In a $1:75$ drawing, a window is $4$ cm. Find real width.',
'$3$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A garden is $15$ m $\\times 10$ m. At $1:200$, what are drawing dimensions?',
'$7.5$ cm $\\times 5$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A model car is $12$ cm and scale is $1:40$. Find real car length.',
'$4.8$ m',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'Why do architects use scale drawings?',
'To represent large buildings on manageable paper',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A hallway is $8$ m long. At $1:80$, how long to draw?',
'$10$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A room floor in a $1:50$ drawing has area $12$ cm². Find real floor area.',
'$30$ m²',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A scale model uses $1:150$. A tower is $45$ m tall. How tall is the model?',
'$30$ cm',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A fence is $20$ m long. At $1:400$, how long in drawing?',
'$5$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'In a $1:1200$ drawing, a field appears as $5$ cm $\\times 4$ cm. Find real dimensions.',
'$60$ m $\\times 48$ m',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A model train is $30$ cm long at scale $1:87$. Find real train length.',
'$26.1$ m',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A bridge spans $500$ m. At scale $1:5000$, how wide on paper?',
'$10$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'What''s the advantage of using scale $1:10$ vs $1:100$?',
'Larger $(1:10)$ shows more detail',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A pool table is $2.4$ m $\\times 1.2$ m. At $1:30$, find drawing dimensions.',
'$8$ cm $\\times 4$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'In a scale drawing, all angles remain the same. Is this true?',
'Yes, angles don''t change with scale',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Drawings'),
'A cabinet is drawn $6$ cm tall at $1:25$. Find real height.',
'$1.5$ m',
2,
NULL);

-- =====================================================
-- SCALE: SCALE FACTORS (20 questions)
-- =====================================================

INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A shape is enlarged by scale factor $3$. If original length is $5$ cm, find new length.',
'$15$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A rectangle has area $20$ cm². It''s enlarged by scale factor $2$. Find new area.',
'$80$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'Why does doubling all lengths multiply area by $4$?',
'Area has two dimensions: $2 \\times 2 = 4$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A shape is reduced by scale factor $0.5$. If original side is $12$ cm, find new side.',
'$6$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A cube has volume $8$ cm³. It''s enlarged by scale factor $3$. Find new volume.',
'$216$ cm³',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'If scale factor is $k$, area is multiplied by $k^2$. What about volume?',
'Multiplied by $k^3$',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A photo is enlarged by scale factor $1.5$. If original is $10$ cm $\\times 8$ cm, find new dimensions.',
'$15$ cm $\\times 12$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A triangle has area $30$ cm². Scaling by factor $0.5$ gives what area?',
'$7.5$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A circle has radius $6$ cm. Enlarged by factor $4$, find new radius.',
'$24$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'Original square has side $5$ cm. After enlargement, side is $15$ cm. Find scale factor.',
'$3$',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A prism has volume $50$ cm³. Scaled by factor $2$, what''s the new volume?',
'$400$ cm³',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'If a shape''s area increases from $10$ cm² to $90$ cm², what''s the scale factor?',
'$3$ (since $90 = 10 \\times 3^2$)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A rectangle $6 \\text{ cm} \\times 4 \\text{ cm}$ is scaled by factor $2.5$. Find new dimensions.',
'$15$ cm $\\times 10$ cm',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'Volume increases from $27$ cm³ to $216$ cm³. Find the linear scale factor.',
'$2$ (since $2^3 = 8$ and $27 \\times 8 = 216$)',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A model at $1:50$ scale has volume $200$ cm³. Find real object volume.',
'$25$ m³',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'Why do angles stay the same when shapes are scaled?',
'Scaling preserves shape, only changes size',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A cylinder has surface area $100$ cm². Scaled by factor $3$, find new surface area.',
'$900$ cm²',
3,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'If SF (scale factor) $= 0.25$, what happens to perimeter of a shape?',
'Perimeter becomes $0.25$ of original',
2,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'A basketball has volume $7000$ cm³. A model at SF $= 0.2$ has what volume?',
'$56$ cm³',
4,
NULL),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Scale' AND subtopic = 'Scale Factors'),
'Explain why SF $= 2$ doesn''t double volume, but multiplies it by $8$.',
'Volume is 3D: $2^3 = 8$',
3,
NULL);

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================
-- Total questions: 300
-- Breakdown by subtopic (20 each):
-- PERIMETER AND AREA (80):
--   - Rectangles and Triangles: 20
--   - Circles: 20  
--   - Composite Shapes: 20
--   - Trapeziums and Parallelograms: 20
-- VOLUME (80):
--   - Cuboids and Prisms: 20
--   - Cylinders: 20
--   - Pyramids and Cones: 20
--   - Spheres: 20
-- UNITS (80):
--   - Metric Conversions: 20
--   - Area and Volume Units: 20
--   - Time Calculations: 20
--   -Speed Distance Time: 20
-- SCALE (60):
--   - Map Scales: 20
--   - Scale Drawings: 20
--   - Scale Factors: 20
--
-- All questions aligned with NZ Curriculum Phase 4 (Years 9-10)
-- Shape_id references link to SHAPE_LIBRARY.md
-- =====================================================
