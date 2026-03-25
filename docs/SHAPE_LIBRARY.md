# MEASUREMENT SHAPE LIBRARY
## For NZ Curriculum Phase 4 (Years 9-10) Measurement Questions

This library defines reusable shapes that can be referenced across multiple measurement questions.
Each shape has a unique ID and can be used for area, perimeter, volume, or surface area questions.

---

## 2D SHAPES

### RECTANGLES

#### RECT_01
- **Dimensions**: 12 cm × 8 cm
- **Area**: 96 cm²
- **Perimeter**: 40 cm
- **Diagram Data**:
```json
{
  "type": "rectangle",
  "dimensions": {"width": 120, "height": 80},
  "labels": [
    {"text": "12 cm", "position": "bottom"},
    {"text": "8 cm", "position": "right"}
  ],
  "scale": 1
}
```

#### RECT_02
- **Dimensions**: 15 cm × 6 cm
- **Area**: 90 cm²
- **Perimeter**: 42 cm
- **Diagram Data**:
```json
{
  "type": "rectangle",
  "dimensions": {"width": 150, "height": 60},
  "labels": [
    {"text": "15 cm", "position": "bottom"},
    {"text": "6 cm", "position": "right"}
  ],
  "scale": 0.9
}
```

#### RECT_03
- **Dimensions**: 20 m × 12 m
- **Area**: 240 m²
- **Perimeter**: 64 m
- **Diagram Data**:
```json
{
  "type": "rectangle",
  "dimensions": {"width": 100, "height": 60},
  "labels": [
    {"text": "20 m", "position": "bottom"},
    {"text": "12 m", "position": "right"}
  ],
  "scale": 1
}
```

#### RECT_04
- **Dimensions**: 7.5 cm × 4 cm
- **Area**: 30 cm²
- **Perimeter**: 23 cm
- **Diagram Data**:
```json
{
  "type": "rectangle",
  "dimensions": {"width": 150, "height": 80},
  "labels": [
    {"text": "7.5 cm", "position": "bottom"},
    {"text": "4 cm", "position": "right"}
  ],
  "scale": 0.8
}
```

#### RECT_05
- **Dimensions**: 25 m × 18 m
- **Area**: 450 m²
- **Perimeter**: 86 m
- **Diagram Data**:
```json
{
  "type": "rectangle",
  "dimensions": {"width": 125, "height": 90},
  "labels": [
    {"text": "25 m", "position": "bottom"},
    {"text": "18 m", "position": "right"}
  ],
  "scale": 0.9
}
```

### SQUARES

#### SQUARE_01
- **Side Length**: 10 cm
- **Area**: 100 cm²
- **Perimeter**: 40 cm
- **Diagram Data**:
```json
{
  "type": "square",
  "dimensions": {"side": 100},
  "labels": [
    {"text": "10 cm", "position": "bottom"}
  ],
  "scale": 1
}
```

#### SQUARE_02
- **Side Length**: 8 m
- **Area**: 64 m²
- **Perimeter**: 32 m
- **Diagram Data**:
```json
{
  "type": "square",
  "dimensions": {"side": 80},
  "labels": [
    {"text": "8 m", "position": "bottom"}
  ],
  "scale": 1
}
```

#### SQUARE_03
- **Side Length**: 15 cm
- **Area**: 225 cm²
- **Perimeter**: 60 cm
- **Diagram Data**:
```json
{
  "type": "square",
  "dimensions": {"side": 100},
  "labels": [
    {"text": "15 cm", "position": "bottom"}
  ],
  "scale": 0.9
}
```

#### SQUARE_04
- **Side Length**: 6.5 cm
- **Area**: 42.25 cm²
- **Perimeter**: 26 cm
- **Diagram Data**:
```json
{
  "type": "square",
  "dimensions": {"side": 90},
  "labels": [
    {"text": "6.5 cm", "position": "bottom"}
  ],
  "scale": 1
}
```

### TRIANGLES

#### TRI_RIGHT_01
- **Type**: Right-angled triangle
- **Base**: 12 cm, **Height**: 9 cm, **Hypotenuse**: 15 cm
- **Area**: 54 cm²
- **Perimeter**: 36 cm
- **Layout**: Right angle at bottom-left; base = horizontal bottom edge; height = vertical left edge; hypotenuse = diagonal from bottom-right to top-left
- **Diagram Data**:
```json
{
  "type": "rightTriangle",
  "dimensions": {"width": 120, "height": 90},
  "labels": [
    {"text": "a = 12 cm", "position": "bottom"},
    {"text": "b = 9 cm", "position": "left"},
    {"text": "c = 15 cm", "position": "hypotenuse"}
  ],
  "scale": 1
}
```

#### TRI_RIGHT_02
- **Type**: Right-angled triangle
- **Base**: 8 cm, **Height**: 6 cm, **Hypotenuse**: 10 cm
- **Area**: 24 cm²
- **Perimeter**: 24 cm
- **Layout**: Right angle at bottom-left; base = horizontal bottom edge; height = vertical left edge; hypotenuse = diagonal from bottom-right to top-left
- **Diagram Data**:
```json
{
  "type": "rightTriangle",
  "dimensions": {"width": 80, "height": 60},
  "labels": [
    {"text": "a = 8 cm", "position": "bottom"},
    {"text": "b = 6 cm", "position": "left"},
    {"text": "c = 10 cm", "position": "hypotenuse"}
  ],
  "scale": 1
}
```

#### TRI_RIGHT_03
- **Type**: Right-angled triangle
- **Base**: 16 m, **Height**: 12 m, **Hypotenuse**: 20 m
- **Area**: 96 m²
- **Perimeter**: 48 m
- **Layout**: Right angle at bottom-left; base = horizontal bottom edge; height = vertical left edge; hypotenuse = diagonal from bottom-right to top-left
- **Diagram Data**:
```json
{
  "type": "rightTriangle",
  "dimensions": {"width": 80, "height": 60},
  "labels": [
    {"text": "a = 16 m", "position": "bottom"},
    {"text": "b = 12 m", "position": "left"},
    {"text": "c = 20 m", "position": "hypotenuse"}
  ],
  "scale": 0.9
}
```

#### TRI_ISOS_01
- **Type**: Isosceles triangle
- **Base**: 14 cm, **Height**: 10 cm, **Equal sides**: 12.2 cm each
- **Area**: 70 cm²
- **Perimeter**: 38.4 cm
- **Layout**: Base = horizontal bottom edge; height = perpendicular from apex (top) to center of base; two equal sides slope from base ends to apex
- **Diagram Data**:
```json
{
  "type": "isoscelesTriangle",
  "dimensions": {"base": 140, "height": 100},
  "labels": [
    {"text": "base = 14 cm", "position": "bottom"},
    {"text": "h = 10 cm", "position": "center"}
  ],
  "scale": 0.8
}
```

#### TRI_ISOS_02
- **Type**: Isosceles triangle
- **Base**: 10 cm, **Height**: 12 cm
- **Area**: 60 cm²
- **Layout**: Base = horizontal bottom edge; height = perpendicular from apex (top) to center of base; two equal sides slope from base ends to apex
- **Diagram Data**:
```json
{
  "type": "isoscelesTriangle",
  "dimensions": {"base": 100, "height": 120},
  "labels": [
    {"text": "base = 10 cm", "position": "bottom"},
    {"text": "h = 12 cm", "position": "center"}
  ],
  "scale": 0.9
}
```

#### TRI_EQUI_01
- **Type**: Equilateral triangle
- **Side Length**: 10 cm, **Height**: 8.66 cm (√75)
- **Area**: 43.3 cm²
- **Perimeter**: 30 cm
- **Layout**: All three sides equal length; shown with one side as horizontal base
- **Diagram Data**:
```json
{
  "type": "equilateralTriangle",
  "dimensions": {"side": 100},
  "labels": [
    {"text": "10 cm", "position": "bottom"}
  ],
  "scale": 1
}
```

### PARALLELOGRAMS

#### PARA_01
- **Base**: 12 cm, **Height**: 8 cm, **Slant side**: 10 cm
- **Area**: 96 cm²
- **Perimeter**: 44 cm
- **Layout**: Base = horizontal bottom edge; height = perpendicular distance from base to top (shown vertically); slant side = angled left/right edges
- **Diagram Data**:
```json
{
  "type": "parallelogram",
  "dimensions": {"base": 120, "height": 80, "slant": 100},
  "labels": [
    {"text": "base = 12 cm", "position": "bottom"},
    {"text": "h = 8 cm", "position": "height"},
    {"text": "10 cm", "position": "side"}
  ],
  "scale": 1
}
```

#### PARA_02
- **Base**: 15 cm, **Height**: 6 cm, **Slant side**: 8 cm
- **Area**: 90 cm²
- **Perimeter**: 46 cm
- **Layout**: Base = horizontal bottom edge; height = perpendicular distance from base to top (shown vertically); slant side = angled left/right edges
- **Diagram Data**:
```json
{
  "type": "parallelogram",
  "dimensions": {"base": 150, "height": 60, "slant": 80},
  "labels": [
    {"text": "base = 15 cm", "position": "bottom"},
    {"text": "h = 6 cm", "position": "height"},
    {"text": "8 cm", "position": "side"}
  ],
  "scale": 0.9
}
```

#### PARA_03
- **Base**: 20 m, **Height**: 12 m, **Slant side**: 15 m
- **Area**: 240 m²
- **Perimeter**: 70 m
- **Layout**: Base = horizontal bottom edge; height = perpendicular distance from base to top (shown vertically); slant side = angled left/right edges
- **Diagram Data**:
```json
{
  "type": "parallelogram",
  "dimensions": {"base": 100, "height": 60, "slant": 75},
  "labels": [
    {"text": "base = 20 m", "position": "bottom"},
    {"text": "h = 12 m", "position": "height"},
    {"text": "15 m", "position": "side"}
  ],
  "scale": 0.9
}
```

### TRAPEZIUMS

#### TRAP_01
- **Parallel sides**: 10 cm and 6 cm, **Height**: 8 cm
- **Area**: 64 cm²
- **Layout**: Bottom parallel side = 10 cm (longer, horizontal base); top parallel side = 6 cm (shorter, above base); height = perpendicular distance between parallel sides
- **Diagram Data**:
```json
{
  "type": "trapezium",
  "dimensions": {"topBase": 60, "bottomBase": 100, "height": 80},
  "labels": [
    {"text": "bottom = 10 cm", "position": "bottom"},
    {"text": "top = 6 cm", "position": "top"},
    {"text": "h = 8 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### TRAP_02
- **Parallel sides**: 12 cm and 8 cm, **Height**: 5 cm
- **Area**: 50 cm²
- **Layout**: Bottom parallel side = 12 cm (longer, horizontal base); top parallel side = 8 cm (shorter, above base); height = perpendicular distance between parallel sides
- **Diagram Data**:
```json
{
  "type": "trapezium",
  "dimensions": {"topBase": 80, "bottomBase": 120, "height": 50},
  "labels": [
    {"text": "bottom = 12 cm", "position": "bottom"},
    {"text": "top = 8 cm", "position": "top"},
    {"text": "h = 5 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### TRAP_03
- **Parallel sides**: 18 m and 12 m, **Height**: 10 m
- **Area**: 150 m²
- **Layout**: Bottom parallel side = 18 m (longer, horizontal base); top parallel side = 12 m (shorter, above base); height = perpendicular distance between parallel sides
- **Diagram Data**:
```json
{
  "type": "trapezium",
  "dimensions": {"topBase": 60, "bottomBase": 90, "height": 50},
  "labels": [
    {"text": "bottom = 18 m", "position": "bottom"},
    {"text": "top = 12 m", "position": "top"},
    {"text": "h = 10 m", "position": "height"}
  ],
  "scale": 0.9
}
```

### CIRCLES

#### CIRCLE_01
- **Radius**: 7 cm, **Diameter**: 14 cm
- **Circumference**: 43.98 cm (14π)
- **Area**: 153.94 cm² (49π)
- **Diagram Data**:
```json
{
  "type": "circle",
  "dimensions": {"radius": 70},
  "labels": [
    {"text": "r = 7 cm", "position": "radius"}
  ],
  "scale": 1
}
```

#### CIRCLE_02
- **Radius**: 5 cm, **Diameter**: 10 cm
- **Circumference**: 31.42 cm (10π)
- **Area**: 78.54 cm² (25π)
- **Diagram Data**:
```json
{
  "type": "circle",
  "dimensions": {"radius": 50},
  "labels": [
    {"text": "r = 5 cm", "position": "radius"}
  ],
  "scale": 1
}
```

#### CIRCLE_03
- **Radius**: 10 m, **Diameter**: 20 m
- **Circumference**: 62.83 m (20π)
- **Area**: 314.16 m² (100π)
- **Diagram Data**:
```json
{
  "type": "circle",
  "dimensions": {"radius": 60},
  "labels": [
    {"text": "r = 10 m", "position": "radius"}
  ],
  "scale": 0.9
}
```

#### CIRCLE_04
- **Radius**: 12 cm, **Diameter**: 24 cm
- **Circumference**: 75.40 cm (24π)
- **Area**: 452.39 cm² (144π)
- **Diagram Data**:
```json
{
  "type": "circle",
  "dimensions": {"radius": 60},
  "labels": [
    {"text": "r = 12 cm", "position": "radius"}
  ],
  "scale": 0.9
}
```

#### CIRCLE_05
- **Diameter given**: 16 cm, **Radius**: 8 cm
- **Circumference**: 50.27 cm (16π)
- **Area**: 201.06 cm² (64π)
- **Diagram Data**:
```json
{
  "type": "circle",
  "dimensions": {"radius": 60},
  "labels": [
    {"text": "d = 16 cm", "position": "diameter"}
  ],
  "scale": 1
}
```

### SEMICIRCLES

#### SEMI_01
- **Radius**: 6 cm, **Diameter**: 12 cm
- **Arc length**: 18.85 cm (6π)
- **Perimeter**: 30.85 cm (6π + 12)
- **Area**: 56.55 cm² (18π)
- **Diagram Data**:
```json
{
  "type": "semicircle",
  "dimensions": {"radius": 60},
  "labels": [
    {"text": "r = 6 cm", "position": "radius"}
  ],
  "scale": 1
}
```

#### SEMI_02
- **Radius**: 10 cm, **Diameter**: 20 cm
- **Arc length**: 31.42 cm (10π)
- **Perimeter**: 51.42 cm (10π + 20)
- **Area**: 157.08 cm² (50π)
- **Diagram Data**:
```json
{
  "type": "semicircle",
  "dimensions": {"radius": 70},
  "labels": [
    {"text": "r = 10 cm", "position": "radius"}
  ],
  "scale": 0.9
}
```

### COMPOUND SHAPES

#### COMP_01: L-Shape (Two Rectangles)
- **Description**: Two rectangles forming an L
- **Rectangle 1**: 12 cm × 8 cm
- **Rectangle 2**: 6 cm × 4 cm (attached to side)
- **Total Area**: 120 cm²
- **Perimeter**: 52 cm
- **Diagram Data**:
```json
{
  "type": "compound",
  "shapes": [
    {"type": "rectangle", "width": 120, "height": 80, "position": {"x": 0, "y": 0}},
    {"type": "rectangle", "width": 60, "height": 40, "position": {"x": 120, "y": 0}}
  ],
  "labels": [
    {"text": "12 cm", "position": "bottom-left"},
    {"text": "8 cm", "position": "left"},
    {"text": "6 cm", "position": "bottom-right"},
    {"text": "4 cm", "position": "right"}
  ],
  "scale": 0.9
}
```

#### COMP_02: Rectangle with Semicircle on Top
- **Rectangle**: 10 cm × 6 cm (Area: 60 cm²)
- **Semicircle**: radius 5 cm (Area: 39.27 cm²)
- **Total Area**: 99.27 cm²
- **Diagram Data**:
```json
{
  "type": "compound",
  "shapes": [
    {"type": "rectangle", "width": 100, "height": 60, "position": {"x": 0, "y": 0}},
    {"type": "semicircle", "radius": 50, "position": {"x": 50, "y": -50}, "rotation": 0}
  ],
  "labels": [
    {"text": "10 cm", "position": "bottom"},
    {"text": "6 cm", "position": "side"}
  ],
  "scale": 0.9
}
```

#### COMP_03: Rectangle with Triangle on Top (House Shape)
- **Rectangle**: 8 cm × 6 cm (Area: 48 cm²)
- **Triangle**: base 8 cm, height 4 cm (Area: 16 cm²)
- **Total Area**: 64 cm²
- **Diagram Data**:
```json
{
  "type": "compound",
  "shapes": [
    {"type": "rectangle", "width": 80, "height": 60, "position": {"x": 0, "y": 0}},
    {"type": "triangle", "base": 80, "height": 40, "position": {"x": 40, "y": -40}}
  ],
  "labels": [
    {"text": "8 cm", "position": "bottom"},
    {"text": "6 cm", "position": "side"},
    {"text": "4 cm", "position": "triangle-height"}
  ],
  "scale": 1
}
```

#### COMP_04: Rectangle with Semicircular Cutout
- **Rectangle**: 12 cm × 8 cm (Area: 96 cm²)
- **Semicircle removed**: radius 3 cm (Area: 14.14 cm²)
- **Net Area**: 81.86 cm²
- **Diagram Data**:
```json
{
  "type": "compound",
  "shapes": [
    {"type": "rectangle", "width": 120, "height": 80, "position": {"x": 0, "y": 0}},
    {"type": "semicircle", "radius": 30, "position": {"x": 60, "y": 80}, "rotation": 180, "subtract": true}
  ],
  "labels": [
    {"text": "12 cm", "position": "bottom"},
    {"text": "8 cm", "position": "side"},
    {"text": "3 cm", "position": "semicircle"}
  ],
  "scale": 0.9
}
```

#### COMP_05: Two Semicircles (Stadium Shape)
- **Rectangle middle**: 10 cm × 6 cm
- **Two semicircles**: radius 3 cm each on ends
- **Total Area**: 88.27 cm²
- **Diagram Data**:
```json
{
  "type": "compound",
  "shapes": [
    {"type": "rectangle", "width": 100, "height": 60, "position": {"x": 0, "y": 0}},
    {"type": "semicircle", "radius": 30, "position": {"x": 0, "y": 30}, "rotation": 270},
    {"type": "semicircle", "radius": 30, "position": {"x": 100, "y": 30}, "rotation": 90}
  ],
  "labels": [
    {"text": "10 cm", "position": "center"},
    {"text": "6 cm", "position": "height"}
  ],
  "scale": 0.9
}
```

---

## 3D SHAPES

### PYRAMIDS

#### PYRAMID_01
- Base: Square 8 cm × 8 cm
- Height: 6 cm
- Volume: 128 cm³
- Surface Area: 192.5 cm² (approx)
- Layout: Square base on bottom; height = vertical distance from center of base to apex (top)
- Diagram Data:
```json
{
  "shape_id": "PYRAMID_01",
  "type": "pyramid",
  "subtype": "square",
  "dimensions": {
    "base_length": 80,
    "base_width": 80,
    "height": 60,
    "slant_height": 72
  },
  "labels": [
    {"text": "base = 8 cm", "position": "base"},
    {"text": "h = 6 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### PYRAMID_02
- Base: Square 10 cm × 10 cm
- Height: 12 cm
- Volume: 400 cm³
- Surface Area: 360 cm² (approx)
- Layout: Square base on bottom; height = vertical distance from center of base to apex (top)
- Diagram Data:
```json
{
  "shape_id": "PYRAMID_02",
  "type": "pyramid",
  "subtype": "square",
  "dimensions": {
    "base_length": 100,
    "base_width": 100,
    "height": 120,
    "slant_height": 130
  },
  "labels": [
    {"text": "base = 10 cm", "position": "base"},
    {"text": "h = 12 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### PYRAMID_03
- Base: Rectangle 12 cm × 8 cm
- Height: 9 cm
- Volume: 288 cm³
- Layout: Rectangular base on bottom; height = vertical distance from center of base to apex (top)
- Diagram Data:
```json
{
  "shape_id": "PYRAMID_03",
  "type": "pyramid",
  "subtype": "rectangular",
  "dimensions": {
    "base_length": 120,
    "base_width": 80,
    "height": 90
  },
  "labels": [
    {"text": "length = 12 cm", "position": "length"},
    {"text": "width = 8 cm", "position": "width"},
    {"text": "h = 9 cm", "position": "height"}
  ],
  "scale": 1
}
```

### CONES

#### CONE_01
- Radius: 5 cm
- Height: 12 cm
- Slant height: 13 cm
- Volume: 314.16 cm³ (100π cm³)
- Surface Area: 282.74 cm² (approx)
- Diagram Data:
```json
{
  "shape_id": "CONE_01",
  "type": "cone",
  "dimensions": {
    "radius": 50,
    "height": 120,
    "slant_height": 130
  },
  "labels": [
    {"text": "r = 5 cm", "position": "radius"},
    {"text": "h = 12 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### CONE_02
- Radius: 6 cm
- Height: 8 cm
- Slant height: 10 cm
- Volume: 301.59 cm³ (96π cm³)
- Surface Area: 301.59 cm² (approx)
- Diagram Data:
```json
{
  "shape_id": "CONE_02",
  "type": "cone",
  "dimensions": {
    "radius": 60,
    "height": 80,
    "slant_height": 100
  },
  "labels": [
    {"text": "r = 6 cm", "position": "radius"},
    {"text": "h = 8 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### CONE_03
- Radius: 7 cm
- Height: 24 cm
- Slant height: 25 cm
- Volume: 1231.5 cm³ (392π cm³)
- Surface Area: 703.72 cm² (approx)
- Diagram Data:
```json
{
  "shape_id": "CONE_03",
  "type": "cone",
  "dimensions": {
    "radius": 70,
    "height": 240,
    "slant_height": 250
  },
  "labels": [
    {"text": "r = 7 cm", "position": "radius"},
    {"text": "h = 24 cm", "position": "height"}
  ],
  "scale": 1
}
```

### SPHERES

#### SPHERE_01
- Radius: 5 cm
- Volume: 523.6 cm³ (500π/3 cm³)
- Surface Area: 314.16 cm² (100π cm²)
- Diagram Data:
```json
{
  "shape_id": "SPHERE_01",
  "type": "sphere",
  "dimensions": {
    "radius": 50
  },
  "labels": [
    {"text": "r = 5 cm", "position": "radius"}
  ],
  "scale": 1
}
```

#### SPHERE_02
- Radius: 6 cm
- Volume: 904.78 cm³ (288π cm³)
- Surface Area: 452.39 cm² (144π cm²)
- Diagram Data:
```json
{
  "shape_id": "SPHERE_02",
  "type": "sphere",
  "dimensions": {
    "radius": 60
  },
  "labels": [
    {"text": "r = 6 cm", "position": "radius"}
  ],
  "scale": 1
}
```

#### SPHERE_03
- Radius: 10 cm
- Volume: 4188.79 cm³ (4000π/3 cm³)
- Surface Area: 1256.64 cm² (400π cm²)
- Diagram Data:
```json
{
  "shape_id": "SPHERE_03",
  "type": "sphere",
  "dimensions": {
    "radius": 100
  },
  "labels": [
    {"text": "r = 10 cm", "position": "radius"}
  ],
  "scale": 1
}
```

### KITES

#### KITE_01
- Diagonals: 12 cm × 8 cm
- Area: 48 cm²
- Diagram Data:
```json
{
  "shape_id": "KITE_01",
  "type": "kite",
  "dimensions": {
    "diagonal1": 120,
    "diagonal2": 80
  },
  "labels": [
    {"text": "12 cm", "position": "diagonal1"},
    {"text": "8 cm", "position": "diagonal2"}
  ],
  "scale": 1
}
```

#### KITE_02
- Diagonals: 16 cm × 10 cm
- Area: 80 cm²
- Diagram Data:
```json
{
  "shape_id": "KITE_02",
  "type": "kite",
  "dimensions": {
    "diagonal1": 160,
    "diagonal2": 100
  },
  "labels": [
    {"text": "16 cm", "position": "diagonal1"},
    {"text": "10 cm", "position": "diagonal2"}
  ],
  "scale": 1
}
```

#### KITE_03
- Diagonals: 20 cm × 15 cm
- Area: 150 cm²
- Diagram Data:
```json
{
  "shape_id": "KITE_03",
  "type": "kite",
  "dimensions": {
    "diagonal1": 200,
    "diagonal2": 150
  },
  "labels": [
    {"text": "20 cm", "position": "diagonal1"},
    {"text": "15 cm", "position": "diagonal2"}
  ],
  "scale": 1
}
```

### CUBOIDS (Rectangular Prisms)

#### CUBOID_01
- **Dimensions**: 10 cm × 8 cm × 6 cm
- **Volume**: 480 cm³
- **Surface Area**: 376 cm²
- **Layout**: Length = 10 cm (horizontal front-to-back); width = 8 cm (horizontal left-to-right); height = 6 cm (vertical)
- **Diagram Data**:
```json
{
  "type": "cuboid",
  "dimensions": {"length": 120, "width": 60, "height": 50, "depth": 60},
  "labels": [
    {"text": "10 cm", "position": "length"},
    {"text": "8 cm", "position": "width"},
    {"text": "6 cm", "position": "height"}
  ],
  "scale": 1
}
```

#### CUBOID_02
- **Dimensions**: 12 cm × 5 cm × 4 cm
- **Volume**: 240 cm³
- **Surface Area**: 256 cm²
- **Layout**: Length = 12 cm (horizontal front-to-back); width = 5 cm (horizontal left-to-right); height = 4 cm (vertical)
- **Diagram Data**:
```json
{
  "type": "cuboid",
  "dimensions": {"length": 140, "width": 50, "height": 40, "depth": 50},
  "labels": [
    {"text": "12 cm", "position": "length"},
    {"text": "5 cm", "position": "width"},
    {"text": "4 cm", "position": "height"}
  ],
  "scale": 0.9
}
```

#### CUBOID_03
- **Dimensions**: 15 m × 10 m × 8 m
- **Volume**: 1200 m³
- **Surface Area**: 700 m²
- **Layout**: Length = 15 m (horizontal front-to-back); width = 10 m (horizontal left-to-right); height = 8 m (vertical)
- **Diagram Data**:
```json
{
  "type": "cuboid",
  "dimensions": {"length": 80, "width": 60, "height": 95, "depth": 60},
  "labels": [
    {"text": "15 m", "position": "length"},
    {"text": "10 m", "position": "width"},
    {"text": "8 m", "position": "height"}
  ],
  "scale": 0.8
}
```

#### CUBOID_04
- **Dimensions**: 20 cm × 15 cm × 12 cm
- **Volume**: 3600 cm³
- **Surface Area**: 1320 cm²
- **Layout**: Length = 20 cm (horizontal front-to-back); width = 15 cm (horizontal left-to-right); height = 12 cm (vertical)
- **Diagram Data**:
```json
{
  "type": "cuboid",
  "dimensions": {"length": 110, "width": 90, "height": 50, "depth": 90},
  "labels": [
    {"text": "20 cm", "position": "length"},
    {"text": "15 cm", "position": "width"},
    {"text": "12 cm", "position": "height"}
  ],
  "scale": 0.85
}
```

### CUBES

#### CUBE_01
- **Side Length**: 8 cm
- **Volume**: 512 cm³
- **Surface Area**: 384 cm²
- **Diagram Data**:
```json
{
  "type": "cube",
  "dimensions": {"side": 80},
  "labels": [
    {"text": "8 cm", "position": "side"}
  ],
  "scale": 1
}
```

#### CUBE_02
- **Side Length**: 10 cm
- **Volume**: 1000 cm³
- **Surface Area**: 600 cm²
- **Diagram Data**:
```json
{
  "type": "cube",
  "dimensions": {"side": 80},
  "labels": [
    {"text": "10 cm", "position": "side"}
  ],
  "scale": 0.9
}
```

### TRIANGULAR PRISMS

#### TRI_PRISM_01
- **Cross-section**: Right triangle (base 6 cm, height 8 cm)
- **Length**: 12 cm
- **Volume**: 288 cm³
- **Cross-sectional Area**: 24 cm²
- **Layout**: Triangular cross-section on front/back faces; prism extends horizontally for length dimension
- **Diagram Data**:
```json
{
  "type": "triangularPrism",
  "dimensions": {"triangleBase": 60, "triangleHeight": 80, "length": 120},
  "labels": [
    {"text": "base = 6 cm", "position": "triangle-base"},
    {"text": "height = 8 cm", "position": "triangle-height"},
    {"text": "length = 12 cm", "position": "length"}
  ],
  "scale": 0.9
}
```

#### TRI_PRISM_02
- **Cross-section**: Right triangle (base 10 cm, height 12 cm)
- **Length**: 15 cm
- **Volume**: 900 cm³
- **Cross-sectional Area**: 60 cm²
- **Layout**: Triangular cross-section on front/back faces; prism extends horizontally for length dimension
- **Diagram Data**:
```json
{
  "type": "triangularPrism",
  "dimensions": {"triangleBase": 80, "triangleHeight": 96, "length": 100},
  "labels": [
    {"text": "base = 10 cm", "position": "triangle-base"},
    {"text": "height = 12 cm", "position": "triangle-height"},
    {"text": "length = 15 cm", "position": "length"}
  ],
  "scale": 0.85
}
```

#### TRI_PRISM_03
- **Cross-section**: Equilateral triangle (side 8 cm)
- **Length**: 20 cm
- **Volume**: 553.76 cm³
- **Cross-sectional Area**: 27.71 cm²
- **Layout**: Equilateral triangular cross-section on front/back faces; prism extends horizontally for length dimension
- **Diagram Data**:
```json
{
  "type": "triangularPrism",
  "dimensions": {"triangleSide": 80, "length": 120},
  "labels": [
    {"text": "side = 8 cm", "position": "triangle-side"},
    {"text": "length = 20 cm", "position": "length"}
  ],
  "scale": 0.9
}
```

### CYLINDERS

#### CYLINDER_01
- **Radius**: 5 cm, **Height**: 12 cm
- **Volume**: 942.48 cm³ (300π)
- **Surface Area**: 534.07 cm² (170π)
- **Diagram Data**:
```json
{
  "type": "cylinder",
  "dimensions": {"radius": 50, "height": 120},
  "labels": [
    {"text": "r = 5 cm", "position": "radius"},
    {"text": "h = 12 cm", "position": "height"}
  ],
  "scale": 0.9
}
```

#### CYLINDER_02
- **Radius**: 7 cm, **Height**: 10 cm
- **Volume**: 1539.38 cm³ (490π)
- **Surface Area**: 747.70 cm² (238π)
- **Diagram Data**:
```json
{
  "type": "cylinder",
  "dimensions": {"radius": 60, "height": 100},
  "labels": [
    {"text": "r = 7 cm", "position": "radius"},
    {"text": "h = 10 cm", "position": "height"}
  ],
  "scale": 0.9
}
```

#### CYLINDER_03
- **Diameter**: 10 cm (radius 5 cm), **Height**: 8 cm
- **Volume**: 628.32 cm³ (200π)
- **Surface Area**: 408.41 cm² (130π)
- **Diagram Data**:
```json
{
  "type": "cylinder",
  "dimensions": {"radius": 50, "height": 80},
  "labels": [
    {"text": "d = 10 cm", "position": "diameter"},
    {"text": "h = 8 cm", "position": "height"}
  ],
  "scale": 1
}
```

---

## USAGE EXAMPLES

### Multiple Questions from One Shape

**Using RECT_01 (12 cm × 8 cm rectangle):**

1. **Question**: "Find the area of this rectangle."
   - **Answer**: 96 cm²

2. **Question**: "Find the perimeter of this rectangle."
   - **Answer**: 40 cm

3. **Question**: "If the area is 96 cm² and the length is 12 cm, find the width."
   - **Answer**: 8 cm

4. **Question**: "A rectangle has the same proportions. If the width is doubled to 16 cm, what is the new area?"
   - **Answer**: 192 cm²

5. **Question**: "Calculate the length of the diagonal of this rectangle."
   - **Answer**: √(144 + 64) = √208 ≈ 14.42 cm

**Using CIRCLE_01 (radius 7 cm):**

1. **Question**: "Find the circumference of this circle."
   - **Answer**: 14π cm or 43.98 cm

2. **Question**: "Find the area of this circle."
   - **Answer**: 49π cm² or 153.94 cm²

3. **Question**: "What is the diameter of this circle?"
   - **Answer**: 14 cm

4. **Question**: "Find the area of a semicircle with this radius."
   - **Answer**: 24.5π cm² or 76.97 cm²

5. **Question**: "A circular path has this radius. Find the distance around the outside."
   - **Answer**: 14π cm or 43.98 cm

**Using CUBOID_01 (10 cm × 8 cm × 6 cm):**

1. **Question**: "Find the volume of this cuboid."
   - **Answer**: 480 cm³

2. **Question**: "Calculate the surface area of this cuboid."
   - **Answer**: 376 cm²

3. **Question**: "Find the area of the largest face."
   - **Answer**: 80 cm²

4. **Question**: "How many of these cuboids can fit in a box measuring 20 cm × 16 cm × 12 cm?"
   - **Answer**: 8 cuboids

5. **Question**: "If this cuboid is a container, how many litres of water can it hold?"
   - **Answer**: 0.48 litres

---

## NOTES FOR QUESTION CREATION

- Use shape IDs to reference shapes across multiple questions
- Each shape can generate 3-5 different question types
- Vary question formats: find area, find perimeter, find missing dimension, compare shapes, scale factors
- Include both exact answers (with π) and approximate decimal answers
- For 3D shapes, include volume, surface area, and cross-sectional area questions
- Mix units (cm, m, mm) to develop unit conversion skills
- Create real-world context questions using the same shapes
