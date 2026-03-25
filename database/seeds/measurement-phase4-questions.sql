-- =====================================================
-- MEASUREMENT QUESTIONS - NZ CURRICULUM PHASE 4 (Years 9-10)
-- =====================================================
-- This file contains comprehensive measurement questions covering:
-- - Area of 2D shapes (rectangles, squares, triangles, parallelograms, trapeziums, circles, compound shapes)
-- - Perimeter and circumference
-- - Volume of 3D shapes (cuboids, cubes, prisms, cylinders)
-- - Surface area of 3D shapes
-- - Unit conversions and real-world applications
--
-- Each shape_id references the SHAPE_LIBRARY.md for consistent visuals across multiple questions
-- PREREQUISITE: Run nz-year9-10-curriculum-expansion.sql first to create question banks
-- =====================================================

-- =====================================================
-- AREA OF RECTANGLES (RECT_01 through RECT_05)
-- =====================================================

-- RECT_01: 12 cm × 8 cm (Area: 96 cm², Perimeter: 40 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'Find the area of this rectangle.',
'$96$ cm²',
1,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Rectangles'),
'Find the perimeter of this rectangle.',
'$40$ cm',
1,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'If the area of this rectangle is $96$ cm² and the length is $12$ cm, find the width.',
'$8$ cm',
2,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "?", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'If the dimensions of this rectangle are doubled, what is the new area?',
'$384$ cm²',
3,
'{"shape_id": "RECT_01", "type": "rectangle", "dimensions": {"width": 120, "height": 80}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "right"}], "scale": 1}'::jsonb);

-- RECT_02: 15 cm × 6 cm (Area: 90 cm², Perimeter: 42 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'Calculate the area of this rectangle.',
'$90$ cm²',
1,
'{"shape_id": "RECT_02", "type": "rectangle", "dimensions": {"width": 150, "height": 60}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Rectangles'),
'What is the perimeter of this rectangle?',
'$42$ cm',
1,
'{"shape_id": "RECT_02", "type": "rectangle", "dimensions": {"width": 150, "height": 60}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'A garden has the same dimensions as this rectangle. How many square metres of area is this? (Hint: $100$ cm = $1$ m)',
'$0.9$ m²',
3,
'{"shape_id": "RECT_02", "type": "rectangle", "dimensions": {"width": 150, "height": 60}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb);

-- RECT_03: 20 m × 12 m (Area: 240 m², Perimeter: 64 m)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'Find the area of this rectangular field.',
'$240$ m²',
1,
'{"shape_id": "RECT_03", "type": "rectangle", "dimensions": {"width": 200, "height": 120}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Rectangles'),
'A farmer wants to fence this rectangular field. How many metres of fencing is needed?',
'$64$ m',
2,
'{"shape_id": "RECT_03", "type": "rectangle", "dimensions": {"width": 200, "height": 120}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'If turf costs $\\$5$ per square metre, how much will it cost to turf this field?',
'$\\$1200$',
3,
'{"shape_id": "RECT_03", "type": "rectangle", "dimensions": {"width": 200, "height": 120}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb);

-- RECT_04: 7.5 cm × 4 cm (Area: 30 cm², Perimeter: 23 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'Calculate the area of this rectangle.',
'$30$ cm²',
2,
'{"shape_id": "RECT_04", "type": "rectangle", "dimensions": {"width": 75, "height": 40}, "labels": [{"text": "7.5 cm", "position": "bottom"}, {"text": "4 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Rectangles'),
'Find the perimeter of this rectangle.',
'$23$ cm',
2,
'{"shape_id": "RECT_04", "type": "rectangle", "dimensions": {"width": 75, "height": 40}, "labels": [{"text": "7.5 cm", "position": "bottom"}, {"text": "4 cm", "position": "right"}], "scale": 1}'::jsonb);

-- RECT_05: 25 m × 18 m (Area: 450 m², Perimeter: 86 m)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'What is the area of this rectangular sports field?',
'$450$ m²',
1,
'{"shape_id": "RECT_05", "type": "rectangle", "dimensions": {"width": 250, "height": 180}, "labels": [{"text": "25 m", "position": "bottom"}, {"text": "18 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Rectangles'),
'If this rectangle is split into two equal parts, what is the area of each part?',
'$225$ m²',
2,
'{"shape_id": "RECT_05", "type": "rectangle", "dimensions": {"width": 250, "height": 180}, "labels": [{"text": "25 m", "position": "bottom"}, {"text": "18 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb);

-- =====================================================
-- AREA OF SQUARES (SQUARE_01 through SQUARE_04)
-- =====================================================

-- SQUARE_01: 10 cm sides (Area: 100 cm², Perimeter: 40 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'Find the area of this square.',
'$100$ cm²',
1,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Squares'),
'Calculate the perimeter of this square.',
'$40$ cm',
1,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'If the side length of this square is increased by $5$ cm, what is the new area?',
'$225$ cm²',
3,
'{"shape_id": "SQUARE_01", "type": "square", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb);

-- SQUARE_02: 8 m sides (Area: 64 m², Perimeter: 32 m)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'What is the area of this square?',
'$64$ m²',
1,
'{"shape_id": "SQUARE_02", "type": "square", "dimensions": {"side": 80}, "labels": [{"text": "8 m", "position": "bottom"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Squares'),
'Find the perimeter of this square.',
'$32$ m',
1,
'{"shape_id": "SQUARE_02", "type": "square", "dimensions": {"side": 80}, "labels": [{"text": "8 m", "position": "bottom"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'If the area of this square is $64$ m², what is the length of one side?',
'$8$ m',
2,
'{"shape_id": "SQUARE_02", "type": "square", "dimensions": {"side": 80}, "labels": [{"text": "?", "position": "bottom"}], "scale": 1, "unit": "m"}'::jsonb);

-- SQUARE_03: 15 cm sides (Area: 225 cm², Perimeter: 60 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'Calculate the area of this square.',
'$225$ cm²',
2,
'{"shape_id": "SQUARE_03", "type": "square", "dimensions": {"side": 150}, "labels": [{"text": "15 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'If each side of this square is doubled, what is the new area?',
'$900$ cm²',
3,
'{"shape_id": "SQUARE_03", "type": "square", "dimensions": {"side": 150}, "labels": [{"text": "15 cm", "position": "bottom"}], "scale": 1}'::jsonb);

-- SQUARE_04: 6.5 cm sides (Area: 42.25 cm², Perimeter: 26 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Squares'),
'Find the area of this square.',
'$42.25$ cm²',
2,
'{"shape_id": "SQUARE_04", "type": "square", "dimensions": {"side": 65}, "labels": [{"text": "6.5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Squares'),
'What is the perimeter of this square?',
'$26$ cm',
2,
'{"shape_id": "SQUARE_04", "type": "square", "dimensions": {"side": 65}, "labels": [{"text": "6.5 cm", "position": "bottom"}], "scale": 1}'::jsonb);

-- =====================================================
-- AREA OF TRIANGLES (TRI_RIGHT_01-03, TRI_ISOS_01-02, TRI_EQUI_01)
-- =====================================================

-- TRI_RIGHT_01: 12 cm × 9 cm right triangle (Area: 54 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Find the area of this right-angled triangle.',
'$54$ cm²',
2,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "9 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Triangles'),
'What is the perimeter of this right-angled triangle?',
'$36$ cm',
2,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "9 cm", "position": "right"}, {"text": "15 cm", "position": "hypotenuse"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Use Pythagoras'' theorem to verify that this is a right-angled triangle. What is $12^2 + 9^2$?',
'$225$ (Yes, $\\sqrt{225} = 15$)',
3,
'{"shape_id": "TRI_RIGHT_01", "type": "triangle", "subtype": "right", "dimensions": {"base": 120, "height": 90, "hypotenuse": 150}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "9 cm", "position": "right"}, {"text": "15 cm", "position": "hypotenuse"}], "scale": 1}'::jsonb);

-- TRI_RIGHT_02: 8 cm × 6 cm right triangle (Area: 24 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Calculate the area of this right-angled triangle.',
'$24$ cm²',
2,
'{"shape_id": "TRI_RIGHT_02", "type": "triangle", "subtype": "right", "dimensions": {"base": 80, "height": 60, "hypotenuse": 100}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'If the base and height are both doubled, what is the new area?',
'$96$ cm²',
3,
'{"shape_id": "TRI_RIGHT_02", "type": "triangle", "subtype": "right", "dimensions": {"base": 80, "height": 60, "hypotenuse": 100}, "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "right"}], "scale": 1}'::jsonb);

-- TRI_RIGHT_03: 16 m × 12 m right triangle (Area: 96 m²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Find the area of this triangular plot of land.',
'$96$ m²',
2,
'{"shape_id": "TRI_RIGHT_03", "type": "triangle", "subtype": "right", "dimensions": {"base": 160, "height": 120, "hypotenuse": 200}, "labels": [{"text": "16 m", "position": "bottom"}, {"text": "12 m", "position": "right"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Triangles'),
'What is the perimeter of this triangle?',
'$48$ m',
2,
'{"shape_id": "TRI_RIGHT_03", "type": "triangle", "subtype": "right", "dimensions": {"base": 160, "height": 120, "hypotenuse": 200}, "labels": [{"text": "16 m", "position": "bottom"}, {"text": "12 m", "position": "right"}, {"text": "20 m", "position": "hypotenuse"}], "scale": 1, "unit": "m"}'::jsonb);

-- TRI_ISOS_01: base 14 cm, height 10 cm (Area: 70 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Find the area of this isosceles triangle.',
'$70$ cm²',
2,
'{"shape_id": "TRI_ISOS_01", "type": "triangle", "subtype": "isosceles", "dimensions": {"base": 140, "height": 100}, "labels": [{"text": "14 cm", "position": "bottom"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'If the height of this triangle is $10$ cm and the area is $70$ cm², what is the base length?',
'$14$ cm',
3,
'{"shape_id": "TRI_ISOS_01", "type": "triangle", "subtype": "isosceles", "dimensions": {"base": 140, "height": 100}, "labels": [{"text": "?", "position": "bottom"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb);

-- TRI_ISOS_02: base 10 cm, height 12 cm (Area: 60 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Calculate the area of this isosceles triangle.',
'$60$ cm²',
2,
'{"shape_id": "TRI_ISOS_02", "type": "triangle", "subtype": "isosceles", "dimensions": {"base": 100, "height": 120}, "labels": [{"text": "10 cm", "position": "bottom"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb);

-- TRI_EQUI_01: 10 cm sides (Area: 43.3 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Triangles'),
'Find the area of this equilateral triangle. (Use the formula: Area $= \\frac{\\sqrt{3}}{4} \\times \\text{side}^2$)',
'$43.3$ cm² (or $25\\sqrt{3}$ cm²)',
4,
'{"shape_id": "TRI_EQUI_01", "type": "triangle", "subtype": "equilateral", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Triangles'),
'What is the perimeter of this equilateral triangle?',
'$30$ cm',
1,
'{"shape_id": "TRI_EQUI_01", "type": "triangle", "subtype": "equilateral", "dimensions": {"side": 100}, "labels": [{"text": "10 cm", "position": "bottom"}], "scale": 1}'::jsonb);

-- =====================================================
-- AREA OF PARALLELOGRAMS (PARA_01 through PARA_03)
-- =====================================================

-- PARA_01: base 12 cm, height 8 cm (Area: 96 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Parallelograms'),
'Find the area of this parallelogram.',
'$96$ cm²',
2,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Parallelograms'),
'A rectangle has the same base and height as this parallelogram. Are their areas equal?',
'Yes, both $96$ cm²',
3,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Parallelograms'),
'If the area is $96$ cm² and the base is $12$ cm, what is the perpendicular height?',
'$8$ cm',
3,
'{"shape_id": "PARA_01", "type": "parallelogram", "dimensions": {"base": 120, "height": 80, "side": 110}, "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "?", "position": "height"}], "scale": 1}'::jsonb);

-- PARA_02: base 15 cm, height 6 cm (Area: 90 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Parallelograms'),
'Calculate the area of this parallelogram.',
'$90$ cm²',
2,
'{"shape_id": "PARA_02", "type": "parallelogram", "dimensions": {"base": 150, "height": 60, "side": 80}, "labels": [{"text": "15 cm", "position": "bottom"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb);

-- PARA_03: base 20 m, height 12 m (Area: 240 m²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Parallelograms'),
'Find the area of this parallelogram.',
'$240$ m²',
2,
'{"shape_id": "PARA_03", "type": "parallelogram", "dimensions": {"base": 200, "height": 120, "side": 150}, "labels": [{"text": "20 m", "position": "bottom"}, {"text": "12 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb);

-- =====================================================
-- AREA OF TRAPEZIUMS (TRAP_01 through TRAP_03)
-- =====================================================

-- TRAP_01: parallel sides 10 cm & 6 cm, height 8 cm (Area: 64 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Trapeziums'),
'Find the area of this trapezium using the formula: $\\frac{1}{2}(a+b)h$.',
'$64$ cm²',
3,
'{"shape_id": "TRAP_01", "type": "trapezium", "dimensions": {"top": 60, "bottom": 100, "height": 80}, "labels": [{"text": "6 cm", "position": "top"}, {"text": "10 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Trapeziums'),
'If the area of this trapezium is $64$ cm², the height is $8$ cm, and one parallel side is $10$ cm, find the other parallel side.',
'$6$ cm',
4,
'{"shape_id": "TRAP_01", "type": "trapezium", "dimensions": {"top": 60, "bottom": 100, "height": 80}, "labels": [{"text": "?", "position": "top"}, {"text": "10 cm", "position": "bottom"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb);

-- TRAP_02: parallel sides 12 cm & 8 cm, height 5 cm (Area: 50 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Trapeziums'),
'Calculate the area of this trapezium.',
'$50$ cm²',
3,
'{"shape_id": "TRAP_02", "type": "trapezium", "dimensions": {"top": 80, "bottom": 120, "height": 50}, "labels": [{"text": "8 cm", "position": "top"}, {"text": "12 cm", "position": "bottom"}, {"text": "5 cm", "position": "height"}], "scale": 1}'::jsonb);

-- TRAP_03: parallel sides 18 m & 12 m, height 10 m (Area: 150 m²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Trapeziums'),
'What is the area of this trapezium?',
'$150$ m²',
3,
'{"shape_id": "TRAP_03", "type": "trapezium", "dimensions": {"top": 120, "bottom": 180, "height": 100}, "labels": [{"text": "12 m", "position": "top"}, {"text": "18 m", "position": "bottom"}, {"text": "10 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb);

-- =====================================================
-- AREA OF CIRCLES (CIRCLE_01 through CIRCLE_05)
-- =====================================================

-- CIRCLE_01: radius 7 cm (Area: 153.94 cm², Circumference: 43.98 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Find the area of this circle. Use $\\pi \\approx 3.14159$.',
'$153.94$ cm² (or $49\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Circles'),
'Calculate the circumference of this circle.',
'$43.98$ cm (or $14\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'What is the diameter of this circle?',
'$14$ cm',
1,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'If the radius is doubled, what is the new area?',
'$615.75$ cm² (or $196\\pi$ cm²)',
3,
'{"shape_id": "CIRCLE_01", "type": "circle", "dimensions": {"radius": 70}, "labels": [{"text": "7 cm", "position": "radius"}], "scale": 1}'::jsonb);

-- CIRCLE_02: radius 5 cm (Area: 78.54 cm², Circumference: 31.42 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Find the area of this circle.',
'$78.54$ cm² (or $25\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_02", "type": "circle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Circles'),
'What is the circumference of this circle?',
'$31.42$ cm (or $10\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_02", "type": "circle", "dimensions": {"radius": 50}, "labels": [{"text": "5 cm", "position": "radius"}], "scale": 1}'::jsonb);

-- CIRCLE_03: radius 10 m (Area: 314.16 m², Circumference: 62.83 m)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Calculate the area of this circular garden.',
'$314.16$ m² (or $100\\pi$ m²)',
2,
'{"shape_id": "CIRCLE_03", "type": "circle", "dimensions": {"radius": 100}, "labels": [{"text": "10 m", "position": "radius"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Circles'),
'A path goes around the edge of this circular garden. How long is the path?',
'$62.83$ m (or $20\\pi$ m)',
2,
'{"shape_id": "CIRCLE_03", "type": "circle", "dimensions": {"radius": 100}, "labels": [{"text": "10 m", "position": "radius"}], "scale": 1, "unit": "m"}'::jsonb);

-- CIRCLE_04: radius 12 cm (Area: 452.39 cm², Circumference: 75.40 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Find the area of this circle.',
'$452.39$ cm² (or $144\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_04", "type": "circle", "dimensions": {"radius": 120}, "labels": [{"text": "12 cm", "position": "radius"}], "scale": 1}'::jsonb);

-- CIRCLE_05: diameter 16 cm (radius 8 cm, Area: 201.06 cm², Circumference: 50.27 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Find the area of this circle. (Hint: radius $= \\frac{\\text{diameter}}{2}$)',
'$201.06$ cm² (or $64\\pi$ cm²)',
2,
'{"shape_id": "CIRCLE_05", "type": "circle", "dimensions": {"radius": 80}, "labels": [{"text": "16 cm", "position": "diameter"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Circles'),
'Calculate the circumference of this circle.',
'$50.27$ cm (or $16\\pi$ cm)',
2,
'{"shape_id": "CIRCLE_05", "type": "circle", "dimensions": {"radius": 80}, "labels": [{"text": "16 cm", "position": "diameter"}], "scale": 1}'::jsonb);

-- =====================================================
-- AREA OF SEMICIRCLES (SEMI_01 and SEMI_02)
-- =====================================================

-- SEMI_01: radius 6 cm (Area: 56.55 cm², Perimeter: 30.85 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Find the area of this semicircle.',
'$56.55$ cm² (or $18\\pi$ cm²)',
3,
'{"shape_id": "SEMI_01", "type": "semicircle", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Circles'),
'Find the perimeter of this semicircle. (Include the curved edge and the straight edge.)',
'$30.85$ cm',
3,
'{"shape_id": "SEMI_01", "type": "semicircle", "dimensions": {"radius": 60}, "labels": [{"text": "6 cm", "position": "radius"}], "scale": 1}'::jsonb);

-- SEMI_02: radius 10 cm (Area: 157.08 cm², Perimeter: 51.42 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Circles'),
'Calculate the area of this semicircle.',
'$157.08$ cm² (or $50\\pi$ cm²)',
3,
'{"shape_id": "SEMI_02", "type": "semicircle", "dimensions": {"radius": 100}, "labels": [{"text": "10 cm", "position": "radius"}], "scale": 1}'::jsonb);

-- =====================================================
-- AREA OF COMPOUND SHAPES (COMP_01 through COMP_05)
-- =====================================================

-- COMP_01: L-Shape (Area: 120 cm², Perimeter: 52 cm)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'Find the total area of this L-shaped figure. (Hint: Split it into two rectangles.)',
'$120$ cm²',
3,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Perimeter' AND subtopic = 'Compound Shapes'),
'What is the perimeter of this L-shaped figure?',
'$52$ cm',
3,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'If you split this L-shape into two rectangles, what are the areas of each rectangle?',
'$80$ cm² and $40$ cm²',
4,
'{"shape_id": "COMP_01", "type": "compound", "subtype": "L-shape", "components": [{"type": "rectangle", "width": 100, "height": 80}, {"type": "rectangle", "width": 80, "height": 50}], "labels": [{"text": "10 cm", "position": "top"}, {"text": "8 cm", "position": "right"}, {"text": "8 cm", "position": "middle"}, {"text": "5 cm", "position": "bottom"}], "scale": 1}'::jsonb);

-- COMP_02: Rectangle + Semicircle (Area: 99.27 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'Find the total area of this shape (rectangle with semicircle on top).',
'$99.27$ cm²',
4,
'{"shape_id": "COMP_02", "type": "compound", "subtype": "rect-semicircle", "components": [{"type": "rectangle", "width": 100, "height": 60}, {"type": "semicircle", "radius": 50}], "labels": [{"text": "10 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}], "scale": 1}'::jsonb);

-- COMP_03: House Shape (Area: 64 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'Find the total area of this house-shaped figure.',
'$64$ cm²',
3,
'{"shape_id": "COMP_03", "type": "compound", "subtype": "house", "components": [{"type": "rectangle", "width": 80, "height": 60}, {"type": "triangle", "base": 80, "height": 40}], "labels": [{"text": "8 cm", "position": "bottom"}, {"text": "6 cm", "position": "side"}, {"text": "4 cm", "position": "roof"}], "scale": 1}'::jsonb);

-- COMP_04: Rectangle with Cutout (Area: 81.86 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'Find the area of this shape (rectangle with semicircular cutout). Subtract the cutout area.',
'$81.86$ cm²',
4,
'{"shape_id": "COMP_04", "type": "compound", "subtype": "rect-cutout", "components": [{"type": "rectangle", "width": 120, "height": 80}, {"type": "semicircle", "radius": 30, "subtract": true}], "labels": [{"text": "12 cm", "position": "bottom"}, {"text": "8 cm", "position": "side"}, {"text": "3 cm", "position": "cutout"}], "scale": 1}'::jsonb);

-- COMP_05: Stadium Shape (Area: 88.27 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Area' AND subtopic = 'Compound Shapes'),
'Find the area of this stadium shape (rectangle with two semicircles on the ends).',
'$88.27$ cm²',
4,
'{"shape_id": "COMP_05", "type": "compound", "subtype": "stadium", "components": [{"type": "rectangle", "width": 80, "height": 60}, {"type": "semicircle", "radius": 30}, {"type": "semicircle", "radius": 30}], "labels": [{"text": "8 cm", "position": "middle"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME OF CUBOIDS (CUBOID_01 through CUBOID_04)
-- =====================================================

-- CUBOID_01: 10 cm × 8 cm × 6 cm (Volume: 480 cm³, Surface Area: 376 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'Find the volume of this cuboid.',
'$480$ cm³',
2,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cuboids'),
'Calculate the surface area of this cuboid.',
'$376$ cm²',
3,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'What is the area of the largest face of this cuboid?',
'$80$ cm²',
2,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'If this box is filled with water, how many millilitres does it hold? (Hint: $1$ cm³ $= 1$ mL)',
'$480$ mL',
3,
'{"shape_id": "CUBOID_01", "type": "cuboid", "dimensions": {"length": 100, "width": 80, "height": 60}, "labels": [{"text": "10 cm", "position": "length"}, {"text": "8 cm", "position": "width"}, {"text": "6 cm", "position": "height"}], "scale": 1}'::jsonb);

-- CUBOID_02: 12 cm × 5 cm × 4 cm (Volume: 240 cm³, Surface Area: 256 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'Calculate the volume of this cuboid.',
'$240$ cm³',
2,
'{"shape_id": "CUBOID_02", "type": "cuboid", "dimensions": {"length": 120, "width": 50, "height": 40}, "labels": [{"text": "12 cm", "position": "length"}, {"text": "5 cm", "position": "width"}, {"text": "4 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cuboids'),
'Find the surface area of this cuboid.',
'$256$ cm²',
3,
'{"shape_id": "CUBOID_02", "type": "cuboid", "dimensions": {"length": 120, "width": 50, "height": 40}, "labels": [{"text": "12 cm", "position": "length"}, {"text": "5 cm", "position": "width"}, {"text": "4 cm", "position": "height"}], "scale": 1}'::jsonb);

-- CUBOID_03: 15 m × 10 m × 8 m (Volume: 1200 m³, Surface Area: 700 m²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'Find the volume of this storage container.',
'$1200$ m³',
2,
'{"shape_id": "CUBOID_03", "type": "cuboid", "dimensions": {"length": 150, "width": 100, "height": 80}, "labels": [{"text": "15 m", "position": "length"}, {"text": "10 m", "position": "width"}, {"text": "8 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cuboids'),
'What is the surface area of this container?',
'$700$ m²',
3,
'{"shape_id": "CUBOID_03", "type": "cuboid", "dimensions": {"length": 150, "width": 100, "height": 80}, "labels": [{"text": "15 m", "position": "length"}, {"text": "10 m", "position": "width"}, {"text": "8 m", "position": "height"}], "scale": 1, "unit": "m"}'::jsonb);

-- CUBOID_04: 20 cm × 15 cm × 12 cm (Volume: 3600 cm³, Surface Area: 1320 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'Calculate the volume of this cuboid.',
'$3600$ cm³',
2,
'{"shape_id": "CUBOID_04", "type": "cuboid", "dimensions": {"length": 200, "width": 150, "height": 120}, "labels": [{"text": "20 cm", "position": "length"}, {"text": "15 cm", "position": "width"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cuboids'),
'How many litres of water can this container hold? (Hint: $1000$ cm³ $= 1$ L)',
'$3.6$ L',
3,
'{"shape_id": "CUBOID_04", "type": "cuboid", "dimensions": {"length": 200, "width": 150, "height": 120}, "labels": [{"text": "20 cm", "position": "length"}, {"text": "15 cm", "position": "width"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME OF CUBES (CUBE_01 and CUBE_02)
-- =====================================================

-- CUBE_01: 8 cm sides (Volume: 512 cm³, Surface Area: 384 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cubes'),
'Find the volume of this cube.',
'$512$ cm³',
2,
'{"shape_id": "CUBE_01", "type": "cube", "dimensions": {"edge": 80}, "labels": [{"text": "8 cm", "position": "edge"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cubes'),
'Calculate the surface area of this cube.',
'$384$ cm²',
2,
'{"shape_id": "CUBE_01", "type": "cube", "dimensions": {"edge": 80}, "labels": [{"text": "8 cm", "position": "edge"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cubes'),
'If the volume of this cube is $512$ cm³, what is the edge length?',
'$8$ cm',
3,
'{"shape_id": "CUBE_01", "type": "cube", "dimensions": {"edge": 80}, "labels": [{"text": "?", "position": "edge"}], "scale": 1}'::jsonb);

-- CUBE_02: 10 cm sides (Volume: 1000 cm³, Surface Area: 600 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cubes'),
'Find the volume of this cube.',
'$1000$ cm³',
2,
'{"shape_id": "CUBE_02", "type": "cube", "dimensions": {"edge": 100}, "labels": [{"text": "10 cm", "position": "edge"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cubes'),
'What is the surface area of this cube?',
'$600$ cm²',
2,
'{"shape_id": "CUBE_02", "type": "cube", "dimensions": {"edge": 100}, "labels": [{"text": "10 cm", "position": "edge"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cubes'),
'This cube holds exactly $1$ litre of water. Why? (Hint: $1000$ cm³ $= 1$ L)',
'$1000$ cm³ $= 1$ L',
2,
'{"shape_id": "CUBE_02", "type": "cube", "dimensions": {"edge": 100}, "labels": [{"text": "10 cm", "position": "edge"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME OF TRIANGULAR PRISMS (TRI_PRISM_01 through TRI_PRISM_03)
-- =====================================================

-- TRI_PRISM_01: 6×8 cm triangle, 12 cm long (Volume: 288 cm³)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Prisms'),
'Find the volume of this triangular prism. (Volume $=$ cross-sectional area $\\times$ length)',
'$288$ cm³',
3,
'{"shape_id": "TRI_PRISM_01", "type": "triangular_prism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Prisms'),
'What is the area of the triangular cross-section of this prism?',
'$24$ cm²',
2,
'{"shape_id": "TRI_PRISM_01", "type": "triangular_prism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Prisms'),
'If the length of this prism is doubled, what is the new volume?',
'$576$ cm³',
3,
'{"shape_id": "TRI_PRISM_01", "type": "triangular_prism", "dimensions": {"base": 60, "height": 80, "length": 120}, "labels": [{"text": "6 cm", "position": "base"}, {"text": "8 cm", "position": "height"}, {"text": "12 cm", "position": "length"}], "scale": 1}'::jsonb);

-- TRI_PRISM_02: 10×12 cm triangle, 15 cm long (Volume: 900 cm³)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Prisms'),
'Calculate the volume of this triangular prism.',
'$900$ cm³',
3,
'{"shape_id": "TRI_PRISM_02", "type": "triangular_prism", "dimensions": {"base": 100, "height": 120, "length": 150}, "labels": [{"text": "10 cm", "position": "base"}, {"text": "12 cm", "position": "height"}, {"text": "15 cm", "position": "length"}], "scale": 1}'::jsonb);

-- TRI_PRISM_03: Equilateral triangle 8 cm, 20 cm long (Volume: 553.76 cm³)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Prisms'),
'Find the volume of this triangular prism with an equilateral triangle cross-section. (Triangle area $\\approx 27.69$ cm²)',
'$553.76$ cm³',
4,
'{"shape_id": "TRI_PRISM_03", "type": "triangular_prism", "dimensions": {"side": 80, "length": 200}, "labels": [{"text": "8 cm", "position": "side"}, {"text": "20 cm", "position": "length"}], "scale": 1}'::jsonb);

-- =====================================================
-- VOLUME OF CYLINDERS (CYLINDER_01 through CYLINDER_03)
-- =====================================================

-- CYLINDER_01: radius 5 cm, height 12 cm (Volume: 942.48 cm³, Surface Area: 534.07 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the volume of this cylinder. (Volume $= \\pi r^2 h$)',
'$942.48$ cm³ (or $300\\pi$ cm³)',
3,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cylinders'),
'Calculate the surface area of this cylinder. (Surface area $= 2\\pi r^2 + 2\\pi r h$)',
'$534.07$ cm² (or $170\\pi$ cm²)',
4,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'What is the curved surface area of this cylinder? (Curved surface $= 2\\pi r h$)',
'$376.99$ cm² (or $120\\pi$ cm²)',
3,
'{"shape_id": "CYLINDER_01", "type": "cylinder", "dimensions": {"radius": 50, "height": 120}, "labels": [{"text": "5 cm", "position": "radius"}, {"text": "12 cm", "position": "height"}], "scale": 1}'::jsonb);

-- CYLINDER_02: radius 7 cm, height 10 cm (Volume: 1539.38 cm³, Surface Area: 747.70 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Calculate the volume of this cylindrical can.',
'$1539.38$ cm³ (or $490\\pi$ cm³)',
3,
'{"shape_id": "CYLINDER_02", "type": "cylinder", "dimensions": {"radius": 70, "height": 100}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'How many litres does this cylindrical can hold? (Hint: $1000$ cm³ $= 1$ L)',
'$1.54$ L',
3,
'{"shape_id": "CYLINDER_02", "type": "cylinder", "dimensions": {"radius": 70, "height": 100}, "labels": [{"text": "7 cm", "position": "radius"}, {"text": "10 cm", "position": "height"}], "scale": 1}'::jsonb);

-- CYLINDER_03: diameter 10 cm (radius 5 cm), height 8 cm (Volume: 628.32 cm³, Surface Area: 408.41 cm²)
INSERT INTO questions (bank_id, question_text, answer, difficulty, diagram_data) VALUES
((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Volume' AND subtopic = 'Cylinders'),
'Find the volume of this cylinder. (Hint: radius $= \\frac{\\text{diameter}}{2}$)',
'$628.32$ cm³ (or $200\\pi$ cm³)',
3,
'{"shape_id": "CYLINDER_03", "type": "cylinder", "dimensions": {"radius": 50, "height": 80}, "labels": [{"text": "10 cm", "position": "diameter"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb),

((SELECT id FROM question_banks WHERE category = 'Measurement' AND topic = 'Surface Area' AND subtopic = 'Cylinders'),
'Calculate the surface area of this cylinder.',
'$408.41$ cm² (or $130\\pi$ cm²)',
4,
'{"shape_id": "CYLINDER_03", "type": "cylinder", "dimensions": {"radius": 50, "height": 80}, "labels": [{"text": "10 cm", "position": "diameter"}, {"text": "8 cm", "position": "height"}], "scale": 1}'::jsonb);

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================
-- Total questions: 147
-- Area of Rectangles: 16 questions
-- Area of Squares: 10 questions
-- Area of Triangles: 12 questions
-- Area of Parallelograms: 5 questions
-- Area of Trapeziums: 3 questions
-- Area of Circles: 13 questions
-- Area of Semicircles: 3 questions
-- Area of Compound Shapes: 6 questions
-- Volume of Cuboids: 12 questions
-- Volume of Cubes: 6 questions
-- Volume of Triangular Prisms: 4 questions
-- Volume of Cylinders: 7 questions
-- Surface Area questions: 10 questions
-- Perimeter/Circumference questions: 11 questions
-- Mixed/Advanced questions: 29 questions
--
-- All questions use shape_id references to SHAPE_LIBRARY.md for consistent visuals
-- =====================================================
