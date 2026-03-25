'use client';

import GeometryDiagram, { DiagramData } from '@/components/GeometryDiagram';

// All shapes from SHAPE_LIBRARY.md
const shapes: { id: string; description: string; data: any }[] = [
  {
    id: "RECT_01",
    description: "Rectangle 12 cm × 8 cm",
    data: {
      type: "rectangle",
      dimensions: { width: 120, height: 80 },
      labels: [
        { text: "12 cm", position: "bottom" },
        { text: "8 cm", position: "right" }
      ],
      scale: 1
    }
  },
  {
    id: "RECT_02",
    description: "Rectangle 15 cm × 6 cm",
    data: {
      type: "rectangle",
      dimensions: { width: 150, height: 60 },
      labels: [
        { text: "15 cm", position: "bottom" },
        { text: "6 cm", position: "right" }
      ],
      scale: 0.9
    }
  },
  {
    id: "RECT_03",
    description: "Rectangle 20 m × 12 m",
    data: {
      type: "rectangle",
      dimensions: { width: 100, height: 60 },
      labels: [
        { text: "20 m", position: "bottom" },
        { text: "12 m", position: "right" }
      ],
      scale: 1
    }
  },
  {
    id: "RECT_04",
    description: "Rectangle 7.5 cm × 4 cm",
    data: {
      type: "rectangle",
      dimensions: { width: 150, height: 80 },
      labels: [
        { text: "7.5 cm", position: "bottom" },
        { text: "4 cm", position: "right" }
      ],
      scale: 0.8
    }
  },
  {
    id: "RECT_05",
    description: "Rectangle 25 m × 18 m",
    data: {
      type: "rectangle",
      dimensions: { width: 125, height: 90 },
      labels: [
        { text: "25 m", position: "bottom" },
        { text: "18 m", position: "right" }
      ],
      scale: 0.9
    }
  },
  {
    id: "SQUARE_01",
    description: "Square 10 cm",
    data: {
      type: "square",
      dimensions: { side: 100 },
      labels: [
        { text: "10 cm", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "SQUARE_02",
    description: "Square 8 m",
    data: {
      type: "square",
      dimensions: { side: 80 },
      labels: [
        { text: "8 m", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "SQUARE_03",
    description: "Square 15 cm",
    data: {
      type: "square",
      dimensions: { side: 100 },
      labels: [
        { text: "15 cm", position: "bottom" }
      ],
      scale: 0.9
    }
  },
  {
    id: "SQUARE_04",
    description: "Square 6.5 cm",
    data: {
      type: "square",
      dimensions: { side: 90 },
      labels: [
        { text: "6.5 cm", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "TRI_RIGHT_01",
    description: "Right triangle - a=12 cm, b=9 cm, c=15 cm",
    data: {
      type: "rightTriangle",
      dimensions: { width: 120, height: 90 },
      labels: [
        { text: "12 cm", position: "bottom" },
        { text: "9 cm", position: "left" },
        { text: "15 cm", position: "hypotenuse" }
      ],
      scale: 1
    }
  },
  {
    id: "TRI_RIGHT_02",
    description: "Right triangle - a=8 cm, b=6 cm, c=10 cm",
    data: {
      type: "rightTriangle",
      dimensions: { width: 80, height: 60 },
      labels: [
        { text: "8 cm", position: "bottom" },
        { text: "6 cm", position: "left" },
        { text: "10 cm", position: "hypotenuse" }
      ],
      scale: 1
    }
  },
  {
    id: "TRI_RIGHT_03",
    description: "Right triangle - a=16 m, b=12 m, c=20 m",
    data: {
      type: "rightTriangle",
      dimensions: { width: 80, height: 60 },
      labels: [
        { text: "16 m", position: "bottom" },
        { text: "12 m", position: "left" },
        { text: "20 m", position: "hypotenuse" }
      ],
      scale: 0.9
    }
  },
  {
    id: "TRI_ISOS_01",
    description: "Isosceles triangle - base 14 cm, height 10 cm",
    data: {
      type: "isoscelesTriangle",
      dimensions: { base: 140, height: 100 },
      labels: [
        { text: "base = 14 cm", position: "bottom" },
        { text: "h = 10 cm", position: "center" }
      ],
      scale: 0.8
    }
  },
  {
    id: "TRI_ISOS_02",
    description: "Isosceles triangle - base 10 cm, height 12 cm",
    data: {
      type: "isoscelesTriangle",
      dimensions: { base: 100, height: 120 },
      labels: [
        { text: "base = 10 cm", position: "bottom" },
        { text: "h = 12 cm", position: "center" }
      ],
      scale: 0.9
    }
  },
  {
    id: "TRI_EQUI_01",
    description: "Equilateral triangle - side 10 cm",
    data: {
      type: "equilateralTriangle",
      dimensions: { side: 100 },
      labels: [
        { text: "10 cm", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "PARA_01",
    description: "Parallelogram - base 12 cm, height 8 cm",
    data: {
      type: "parallelogram",
      dimensions: { base: 120, height: 80, slant: 100 },
      labels: [
        { text: "base = 12 cm", position: "bottom" },
        { text: "h = 8 cm", position: "height" },
        { text: "10 cm", position: "side" }
      ],
      scale: 1
    }
  },
  {
    id: "PARA_02",
    description: "Parallelogram - base 15 cm, height 6 cm",
    data: {
      type: "parallelogram",
      dimensions: { base: 150, height: 60, slant: 80 },
      labels: [
        { text: "base = 15 cm", position: "bottom" },
        { text: "h = 6 cm", position: "height" },
        { text: "8 cm", position: "side" }
      ],
      scale: 0.9
    }
  },
  {
    id: "PARA_03",
    description: "Parallelogram - base 20 m, height 12 m",
    data: {
      type: "parallelogram",
      dimensions: { base: 100, height: 60, slant: 75 },
      labels: [
        { text: "base = 20 m", position: "bottom" },
        { text: "h = 12 m", position: "height" },
        { text: "15 m", position: "side" }
      ],
      scale: 0.9
    }
  },
  {
    id: "TRAP_01",
    description: "Trapezium - parallel sides 10 cm and 6 cm, height 8 cm",
    data: {
      type: "trapezium",
      dimensions: { topBase: 60, bottomBase: 100, height: 80 },
      labels: [
        { text: "10 cm", position: "bottom" },
        { text: "6 cm", position: "top" },
        { text: "h = 8 cm", position: "height" }
      ],
      scale: 1
    }
  },
  {
    id: "TRAP_02",
    description: "Trapezium - parallel sides 12 cm and 8 cm, height 5 cm",
    data: {
      type: "trapezium",
      dimensions: { topBase: 80, bottomBase: 120, height: 50 },
      labels: [
        { text: "12 cm", position: "bottom" },
        { text: "8 cm", position: "top" },
        { text: "h = 5 cm", position: "height" }
      ],
      scale: 1
    }
  },
  {
    id: "TRAP_03",
    description: "Trapezium - parallel sides 18 m and 12 m, height 10 m",
    data: {
      type: "trapezium",
      dimensions: { topBase: 60, bottomBase: 90, height: 50 },
      labels: [
        { text: "18 m", position: "bottom" },
        { text: "12 m", position: "top" },
        { text: "h = 10 m", position: "height" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CIRCLE_01",
    description: "Circle - radius 7 cm",
    data: {
      type: "circle",
      dimensions: { radius: 70 },
      labels: [
        { text: "r = 7 cm", position: "radius" }
      ],
      scale: 1
    }
  },
  {
    id: "CIRCLE_02",
    description: "Circle - radius 5 cm",
    data: {
      type: "circle",
      dimensions: { radius: 50 },
      labels: [
        { text: "r = 5 cm", position: "radius" }
      ],
      scale: 1
    }
  },
  {
    id: "CIRCLE_03",
    description: "Circle - radius 10 m",
    data: {
      type: "circle",
      dimensions: { radius: 60 },
      labels: [
        { text: "r = 10 m", position: "radius" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CIRCLE_04",
    description: "Circle - radius 12 cm",
    data: {
      type: "circle",
      dimensions: { radius: 60 },
      labels: [
        { text: "r = 12 cm", position: "radius" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CIRCLE_05",
    description: "Circle - diameter 16 cm",
    data: {
      type: "circle",
      dimensions: { radius: 60 },
      labels: [
        { text: "d = 16 cm", position: "diameter" }
      ],
      scale: 1
    }
  },
  {
    id: "SEMI_01",
    description: "Semicircle - radius 6 cm",
    data: {
      type: "semicircle",
      dimensions: { radius: 60 },
      labels: [
        { text: "r = 6 cm", position: "radius" }
      ],
      scale: 1.2
    }
  },
  {
    id: "SEMI_02",
    description: "Semicircle - radius 10 cm",
    data: {
      type: "semicircle",
      dimensions: { radius: 70 },
      labels: [
        { text: "r = 10 cm", position: "radius" }
      ],
      scale: 1.2
    }
  },
  {
    id: "KITE_01",
    description: "Kite - diagonals 12 cm × 8 cm",
    data: {
      type: "kite",
      dimensions: {
        diagonal1: 120,
        diagonal2: 80
      },
      labels: [
        { text: "12 cm", position: "diagonal1" },
        { text: "8 cm", position: "diagonal2" }
      ],
      scale: 1.5
    }
  },
  {
    id: "KITE_02",
    description: "Kite - diagonals 16 cm × 10 cm",
    data: {
      type: "kite",
      dimensions: {
        diagonal1: 160,
        diagonal2: 100
      },
      labels: [
        { text: "16 cm", position: "diagonal1" },
        { text: "10 cm", position: "diagonal2" }
      ],
      scale: 1.1
    }
  },
  {
    id: "KITE_03",
    description: "Kite - diagonals 20 cm × 15 cm",
    data: {
      type: "kite",
      dimensions: {
        diagonal1: 200,
        diagonal2: 150
      },
      labels: [
        { text: "20 cm", position: "diagonal1" },
        { text: "15 cm", position: "diagonal2" }
      ],
      scale: 1
    }
  },
  {
    id: "CUBOID_01",
    description: "Cuboid - 10×8×6 cm",
    data: {
      type: "cuboid",
      dimensions: { length: 120, width: 60, height: 50, depth: 60 },
      labels: [
        { text: "10 cm", position: "length" },
        { text: "8 cm", position: "width" },
        { text: "6 cm", position: "height" }
      ],
      scale: 1
    }
  },
  {
    id: "CUBOID_02",
    description: "Cuboid - 12×5×4 cm",
    data: {
      type: "cuboid",
      dimensions: { length: 140, width: 50, height: 40, depth: 50 },
      labels: [
        { text: "12 cm", position: "length" },
        { text: "5 cm", position: "width" },
        { text: "4 cm", position: "height" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CUBOID_03",
    description: "Cuboid - 15×10×8 m",
    data: {
      type: "cuboid",
      dimensions: { length: 80, width: 60, height: 95, depth: 60 },
      labels: [
        { text: "15 m", position: "length" },
        { text: "10 m", position: "width" },
        { text: "8 m", position: "height" }
      ],
      scale: 0.8
    }
  },
  {
    id: "CUBOID_04",
    description: "Cuboid - 20×15×12 cm",
    data: {
      type: "cuboid",
      dimensions: { length: 110, width: 90, height: 50, depth: 90 },
      labels: [
        { text: "20 cm", position: "length" },
        { text: "15 cm", position: "width" },
        { text: "12 cm", position: "height" }
      ],
      scale: 0.85
    }
  },
  {
    id: "CUBE_01",
    description: "Cube - 8 cm",
    data: {
      type: "cube",
      dimensions: { side: 80 },
      labels: [
        { text: "8 cm", position: "side" }
      ],
      scale: 1
    }
  },
  {
    id: "CUBE_02",
    description: "Cube - 10 cm",
    data: {
      type: "cube",
      dimensions: { side: 80 },
      labels: [
        { text: "10 cm", position: "side" }
      ],
      scale: 0.9
    }
  },
  {
    id: "TRI_PRISM_01",
    description: "Triangular prism - right triangle base 6×8 cm, length 12 cm",
    data: {
      type: "triangularPrism",
      dimensions: { triangleBase: 60, triangleHeight: 80, length: 120 },
      labels: [
        { text: "6 cm", position: "triangle-base" },
        { text: "8 cm", position: "triangle-height" },
        { text: "10 cm", position: "hypotenuse" },
        { text: "12 cm", position: "length" }
      ],
      scale: 0.9
    }
  },
  {
    id: "TRI_PRISM_02",
    description: "Triangular prism - right triangle base 10×12 cm, length 15 cm",
    data: {
      type: "triangularPrism",
      dimensions: { triangleBase: 80, triangleHeight: 96, length: 100 },
      labels: [
        { text: "10 cm", position: "triangle-base" },
        { text: "12 cm", position: "triangle-height" },
        { text: "15.6 cm", position: "hypotenuse" },
        { text: "15 cm", position: "length" }
      ],
      scale: 0.85
    }
  },
  {
    id: "TRI_PRISM_03",
    description: "Triangular prism - equilateral triangle side 8 cm, length 20 cm",
    data: {
      type: "triangularPrism",
      dimensions: { triangleSide: 80, length: 120 },
      labels: [
        { text: "8 cm", position: "triangle-side" },
        { text: "6.9 cm", position: "triangle-height" },
        { text: "8 cm", position: "hypotenuse" },
        { text: "20 cm", position: "length" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CYLINDER_01",
    description: "Cylinder - radius 5 cm, height 12 cm",
    data: {
      type: "cylinder",
      dimensions: { radius: 50, height: 120 },
      labels: [
        { text: "5 cm", position: "radius" },
        { text: "12 cm", position: "height" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CYLINDER_02",
    description: "Cylinder - radius 7 cm, height 10 cm",
    data: {
      type: "cylinder",
      dimensions: { radius: 60, height: 100 },
      labels: [
        { text: "7 cm", position: "radius" },
        { text: "10 cm", position: "height" }
      ],
      scale: 0.9
    }
  },
  {
    id: "CYLINDER_03",
    description: "Cylinder - diameter 10 cm, height 8 cm",
    data: {
      type: "cylinder",
      dimensions: { radius: 50, height: 80 },
      labels: [
        { text: "10 cm", position: "diameter" },
        { text: "8 cm", position: "height" }
      ],
      scale: 1
    }
  },
  {
    id: "PYRAMID_01",
    description: "Square pyramid - base 8×8 cm, height 6 cm",
    data: {
      type: "pyramid",
      dimensions: {
        base: 80,
        height: 60
      },
      labels: [
        { text: "8 cm", position: "base" },
        { text: "6 cm", position: "height" },
        { text: "7.2 cm", position: "slant" }
      ],
      scale: 1
    }
  },
  {
    id: "PYRAMID_02",
    description: "Square pyramid - base 10×10 cm, height 12 cm",
    data: {
      type: "pyramid",
      dimensions: {
        base: 100,
        height: 120
      },
      labels: [
        { text: "10 cm", position: "base" },
        { text: "12 cm", position: "height" },
        { text: "13 cm", position: "slant" }
      ],
      scale: 1
    }
  },
  {
    id: "PYRAMID_03",
    description: "Rectangular pyramid - base 12×8 cm, height 9 cm",
    data: {
      type: "pyramid",
      dimensions: {
        width: 120,
        depth: 80,
        height: 90
      },
      labels: [
        { text: "12 cm", position: "length" },
        { text: "8 cm", position: "width" },
        { text: "9 cm", position: "height" },
        { text: "10.8 cm", position: "slant" }
      ],
      scale: 1
    }
  },
  
  // ANGLE DIAGRAMS
  {
    id: "ANGLE_LINE_01",
    description: "Angles on a line - 60° and 120°",
    data: {
      type: "anglesOnLine",
      dimensions: { angle1: 60 },
      labels: [
        { text: "60°", position: "left" },
        { text: "120°", position: "right" }
      ],
      scale: 1
    }
  },
  {
    id: "ANGLE_TRI_01",
    description: "Triangle angles - 60°, 60°, 60°",
    data: {
      type: "triangleAngles",
      dimensions: { angle1: 60, angle2: 60, angle3: 60 },
      labels: [
        { text: "60°", position: "bottomLeft" },
        { text: "60°", position: "bottomRight" },
        { text: "60°", position: "top" }
      ],
      scale: 1
    }
  },
  {
    id: "ANGLE_PARALLEL_01",
    description: "Parallel lines with transversal - 65° angle",
    data: {
      type: "parallelLinesTransversal",
      dimensions: { angle1: 65 },
      labels: [
        { text: "65°", position: "top" },
        { text: "65°", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "ANGLE_VERTICAL_01",
    description: "Vertically opposite angles - 75°",
    data: {
      type: "verticallyOpposite",
      dimensions: { angle1: 75 },
      labels: [
        { text: "75°", position: "top" },
        { text: "75°", position: "bottom" }
      ],
      scale: 1
    }
  },
  {
    id: "ANGLE_POINT_01",
    description: "Angles at a point - 90°, 120°, 70°, 80°",
    data: {
      type: "anglesAtPoint",
      dimensions: { angle1: 90, angle2: 120, angle3: 70, angle4: 80 },
      labels: [
        { text: "90°", position: "top" },
        { text: "120°", position: "right" },
        { text: "70°", position: "bottom" },
        { text: "80°", position: "left" }
      ],
      scale: 1
    }
  }
];

export default function ShapeTestPage() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-4xl font-bold text-gray-900 mb-2">Shape Library Test Page</h1>
        <p className="text-gray-600 mb-4">
          All shapes from the geometry library. Report any issues by referencing the shape ID.
        </p>
        
        <div className="mb-8 p-4 bg-white rounded-lg shadow">
          <h2 className="text-lg font-semibold text-gray-900 mb-3">Shape Categories:</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-3 text-sm">
            <div className="p-2 bg-blue-50 rounded">
              <span className="font-semibold">2D Basic:</span> 
              <span className="ml-1 text-gray-700">Rectangles (5), Squares (4), Circles (5), Semicircles (2)</span>
            </div>
            <div className="p-2 bg-green-50 rounded">
              <span className="font-semibold">Triangles:</span> 
              <span className="ml-1 text-gray-700">Right (3), Isosceles (2), Equilateral (1)</span>
            </div>
            <div className="p-2 bg-purple-50 rounded">
              <span className="font-semibold">Quadrilaterals:</span> 
              <span className="ml-1 text-gray-700">Parallelograms (3), Trapeziums (3), Kites (3)</span>
            </div>
            <div className="p-2 bg-orange-50 rounded">
              <span className="font-semibold">3D Shapes:</span> 
              <span className="ml-1 text-gray-700">Cuboids (4), Cubes (2), Prisms (3), Cylinders (3), Pyramids (3)</span>
            </div>
            <div className="p-2 bg-red-50 rounded">
              <span className="font-semibold">Angle Diagrams:</span> 
              <span className="ml-1 text-gray-700">Angles on Line, Triangle Angles, Parallel Lines, Vertical, At Point</span>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {shapes.map((shape) => (
            <div key={shape.id} className="bg-white rounded-lg shadow-md p-6">
              <div className="mb-4">
                <h2 className="text-2xl font-bold text-blue-600">{shape.id}</h2>
                <p className="text-sm text-gray-600">{shape.description}</p>
              </div>
              <div className="flex justify-center">
                <GeometryDiagram data={shape.data} />
              </div>
            </div>
          ))}
        </div>

        <div className="mt-12 p-6 bg-blue-50 rounded-lg">
          <h2 className="text-xl font-bold text-gray-900 mb-2">How to Report Issues</h2>
          <p className="text-gray-700 mb-4">
            To report a diagram issue, reference the <strong>shape ID</strong> (e.g., "RECT_01", "TRI_RIGHT_02") 
            and describe what looks incorrect (e.g., "labels overlapping", "wrong dimensions", "shape distorted").
          </p>
          <div className="mt-4 p-4 bg-yellow-50 border border-yellow-200 rounded">
            <h3 className="font-bold text-gray-900 mb-2">Note:</h3>
            <p className="text-gray-700 text-sm">
              Composite shapes (COMP_01 to COMP_05) like L-shapes, house shapes, and stadium shapes are not yet displayed 
              on this test page as they require compound shape rendering. Additionally, some 3D shapes (cones, spheres) 
              may render as placeholder diagrams until full 3D rendering is implemented.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
