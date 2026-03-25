'use client';

import { useEffect, useRef } from 'react';

// Diagram data type definitions
export type DiagramType = 
  // 2D Shapes
  | 'triangle' | 'rectangle' | 'square' | 'circle' | 'rightTriangle' | 'isoscelesTriangle' | 'equilateralTriangle'
  | 'parallelogram' | 'trapezoid' | 'trapezium' | 'kite' | 'semicircle'
  // 3D Shapes
  | 'cuboid' | 'cube' | 'cylinder' | 'triangularPrism' | 'pyramid'
  // Angle Diagrams
  | 'anglesOnLine' | 'triangleAngles' | 'parallelLinesTransversal' | 'verticallyOpposite' | 'anglesAtPoint';

export interface DiagramDimensions {
  width?: number;
  height?: number;
  depth?: number;
  side?: number;
  radius?: number;
  angle?: number;
  angle1?: number;  // For angle diagrams with multiple angles
  angle2?: number;
  angle3?: number;
  angle4?: number;
  base?: number;
  topBase?: number;
  bottomBase?: number;
  side1?: number;
  side2?: number;
  side3?: number;
  slant?: number;  // For parallelograms - the slanted side length
  diagonal1?: number;  // For kites - the vertical diagonal
  diagonal2?: number;  // For kites - the horizontal diagonal
  length?: number;  // For cuboids - the front-to-back dimension
  triangleBase?: number;  // For triangular prisms - the base of the triangular face
  triangleHeight?: number;  // For triangular prisms - the height of the triangular face
  triangleSide?: number;  // For triangular prisms with equilateral cross-section
}

export interface DiagramLabel {
  text: string;
  position: 'top' | 'bottom' | 'left' | 'right' | 'center' | 'topLeft' | 'topRight' | 'bottomLeft' | 'bottomRight'
    | 'hypotenuse' | 'height' | 'side' | 'radius' | 'diameter' | 'base' | 'length' | 'width'
    | 'diagonal1' | 'diagonal2' | 'semicircle' | 'triangle-height' | 'bottom-left' | 'bottom-right' | 'slant';
  offset?: { x: number; y: number };
}

export interface DiagramStyle {
  fill?: string;
  stroke?: string;
  strokeWidth?: number;
  dashArray?: string;
}

export interface DiagramData {
  type: DiagramType;
  dimensions: DiagramDimensions;
  labels?: DiagramLabel[];
  style?: DiagramStyle;
  showGrid?: boolean;
  scale?: number;
}

interface GeometryDiagramProps {
  data: DiagramData | null | undefined;
  className?: string;
}

export default function GeometryDiagram({ data, className = '' }: GeometryDiagramProps) {
  const svgRef = useRef<SVGSVGElement>(null);
  const jsxGraphRef = useRef<HTMLDivElement>(null);
  
  // Determine if this diagram type uses JSXGraph
  const isAngleDiagram = data && ['anglesOnLine', 'triangleAngles', 'parallelLinesTransversal', 'verticallyOpposite', 'anglesAtPoint'].includes(data.type);

  useEffect(() => {
    if (!data) return;

    if (isAngleDiagram && jsxGraphRef.current) {
      // Use JSXGraph for angle diagrams
      renderWithJSXGraph(jsxGraphRef.current, data);
    } else if (!isAngleDiagram && svgRef.current) {
      // Use SVG for measurement shapes
      renderWithSVG(svgRef.current, data);
    }
  }, [data, isAngleDiagram]);

  if (!data) return null;

  return (
    <div className={`flex justify-center my-4 ${className}`}>
      {isAngleDiagram ? (
        <div 
          ref={jsxGraphRef}
          id={`jxgbox-${Math.random().toString(36).substr(2, 9)}`}
          className="border border-gray-200 rounded bg-white geometry-diagram-container w-[480px] h-[320px]"
        />
      ) : (
        <svg
          ref={svgRef}
          width="300"
          height="250"
          viewBox="0 0 300 250"
          className="border border-gray-200 rounded bg-white"
        />
      )}
    </div>
  );
}

// JSXGraph rendering function for angle diagrams
function renderWithJSXGraph(container: HTMLDivElement, data: DiagramData) {
  // Clear previous content
  container.innerHTML = '';
  
  // Dynamically import JSXGraph
  if (typeof window !== 'undefined') {
    import('jsxgraph').then((JXG) => {
      const board = JXG.JSXGraph.initBoard(container.id, {
        boundingbox: [-1, 8, 11, -1],
        axis: false,
        showNavigation: false,
        showCopyright: false,
        pan: { enabled: false },
        zoom: { wheel: false, needShift: false }
      });

      switch (data.type) {
        case 'anglesOnLine':
          drawAnglesOnLineJSX(board, data);
          break;
        case 'triangleAngles':
          drawTriangleAnglesJSX(board, data);
          break;
        case 'parallelLinesTransversal':
          drawParallelLinesJSX(board, data);
          break;
        case 'verticallyOpposite':
          drawVerticallyOppositeJSX(board, data);
          break;
        case 'anglesAtPoint':
          drawAnglesAtPointJSX(board, data);
          break;
      }
    }).catch(err => {
      console.error('Failed to load JSXGraph:', err);
      container.innerHTML = '<div class="text-red-500 p-4">Error loading diagram</div>';
    });
  }
}

// JSXGraph drawing functions
function drawAnglesOnLineJSX(board: any, data: DiagramData) {
  const { angle1 = 60 } = data.dimensions;
  const angle2 = 180 - angle1;
  
  // Draw straight line
  const line = board.create('line', [[1, 2.5], [9, 2.5]], { strokeColor: '#1f2937', strokeWidth: 2, fixed: true });
  
  // Point on line (center point where ray meets the line)
  const P = board.create('point', [5, 2.5], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  
  // Calculate ray endpoint based on angle (angle1 is measured from the positive x-axis going counterclockwise)
  const angleRad = (angle1 * Math.PI) / 180;
  const rayLength = 3.5;
  const rayX = 5 + rayLength * Math.cos(angleRad);
  const rayY = 2.5 + rayLength * Math.sin(angleRad);
  
  // Draw ray from P through rayPoint
  const rayPoint = board.create('point', [rayX, rayY], { fixed: true, name: '', size: 2, visible: false });
  board.create('line', [P, rayPoint], { strokeColor: '#1f2937', strokeWidth: 2, straightFirst: false, straightLast: true });
  
  // Reference points for creating angles
  const rightPoint = board.create('point', [7, 2.5], { visible: false, fixed: true });
  const leftPoint = board.create('point', [3, 2.5], { visible: false, fixed: true });
  
  // Right angle (angle1) - from horizontal line to ray
  const angle1Arc = board.create('angle', [rightPoint, P, rayPoint], {
    radius: 0.6,
    name: data.labels?.[0]?.text || `${angle1.toFixed(0)}°`,
    strokeColor: '#3b82f6',
    strokeWidth: 2,
    fillColor: '#3b82f6',
    fillOpacity: 0.15,
    label: {
      offset: [0, 0],
      fontSize: 16,
      color: '#1f2937',
      cssStyle: 'font-weight: bold;'
    }
  });
  
  // Left angle (angle2) - from ray to left side of line
  const angle2Arc = board.create('angle', [rayPoint, P, leftPoint], {
    radius: 0.7,
    name: data.labels?.[1]?.text || `${angle2.toFixed(0)}°`,
    strokeColor: '#ef4444',
    strokeWidth: 2,
    fillColor: '#ef4444',
    fillOpacity: 0.15,
    label: {
      offset: [0, 0],
      fontSize: 16,
      color: '#1f2937',
      cssStyle: 'font-weight: bold;'
    }
  });
}

function drawTriangleAnglesJSX(board: any, data: DiagramData) {
  const { angle1 = 60, angle2 = 60, angle3 = 60 } = data.dimensions;
  
  // Base of triangle at bottom
  const baseY = 1.5;
  const centerX = 5;
  
  let A, B, C;
  
  // Check if triangle is isosceles or equilateral to ensure equal sides for equal angles
  const tolerance = 1; // 1 degree tolerance for considering angles equal
  const angles = [angle1, angle2, angle3];
  const isEquilateral = Math.abs(angle1 - 60) < tolerance && Math.abs(angle2 - 60) < tolerance && Math.abs(angle3 - 60) < tolerance;
  const isIsosceles = (Math.abs(angle1 - angle2) < tolerance || Math.abs(angle2 - angle3) < tolerance || Math.abs(angle1 - angle3) < tolerance);
  const hasRightAngle = Math.abs(angle1 - 90) < tolerance || Math.abs(angle2 - 90) < tolerance || Math.abs(angle3 - 90) < tolerance;
  
  if (isEquilateral) {
    // Equilateral triangle - all sides equal
    const sideLength = 5;
    const height = sideLength * Math.sqrt(3) / 2;
    A = board.create('point', [centerX - sideLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + sideLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    C = board.create('point', [centerX, baseY + height], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle1 - 90) < tolerance) {
    // Right angle at A (bottom-left) - construct proper right triangle
    const legLength1 = 4;
    const legLength2 = Math.abs(angle2 - 45) < tolerance ? legLength1 : 5; // Equal legs if 45-45-90
    
    A = board.create('point', [centerX - 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX - 2 + legLength1, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    C = board.create('point', [centerX - 2, baseY + legLength2], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle2 - 90) < tolerance) {
    // Right angle at B (bottom-right)
    const legLength1 = 4;
    const legLength2 = Math.abs(angle1 - 45) < tolerance ? legLength1 : 5;
    
    A = board.create('point', [centerX - 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    C = board.create('point', [centerX + 2, baseY + legLength2], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle3 - 90) < tolerance) {
    // Right angle at C (top)
    const legLength1 = 4;
    const legLength2 = Math.abs(angle1 - 45) < tolerance ? legLength1 : 5;
    
    A = board.create('point', [centerX - legLength1/2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + legLength1/2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    C = board.create('point', [centerX - legLength1/2, baseY + legLength2], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle1 - angle2) < tolerance && angle1 !== angle3) {
    // Isosceles with angle1 = angle2 (angles at base), angle3 at apex
    const baseLength = 5;
    A = board.create('point', [centerX - baseLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + baseLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    
    // Calculate height using the apex angle
    const apexAngleRad = (angle3 * Math.PI) / 180;
    const height = (baseLength / 2) / Math.tan(apexAngleRad / 2);
    C = board.create('point', [centerX, baseY + height], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle2 - angle3) < tolerance && angle2 !== angle1) {
    // Isosceles with angle2 = angle3 (equal sides from B and C), angle1 different
    // Position A at left, B at right, C at top
    const sideLength = 5;
    const baseAngleRad = (angle2 * Math.PI) / 180;
    
    A = board.create('point', [centerX - 2.5, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + 2.5, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    
    // C forms equal angles with A and B
    const Cx = centerX - 2.5 + sideLength * Math.cos(baseAngleRad);
    const Cy = baseY + sideLength * Math.sin(baseAngleRad);
    C = board.create('point', [Cx, Cy], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else if (Math.abs(angle1 - angle3) < tolerance && angle1 !== angle2) {
    // Isosceles with angle1 = angle3
    const sideLength = 5;
    const angle1Rad = (angle1 * Math.PI) / 180;
    
    A = board.create('point', [centerX - 2.5, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + 2.5, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    
    // Calculate C position
    const Cx = centerX + 2.5 - sideLength * Math.cos((angle2 * Math.PI) / 180);
    const Cy = baseY + sideLength * Math.sin((angle2 * Math.PI) / 180);
    C = board.create('point', [Cx, Cy], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  } else {
    // Scalene triangle - all angles different
    const baseLength = 5;
    A = board.create('point', [centerX - baseLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    B = board.create('point', [centerX + baseLength / 2, baseY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
    
    // Use angle1 to find C
    const angle1Rad = (angle1 * Math.PI) / 180;
    const sideLength = 4.5;
    const Cx = centerX - baseLength / 2 + sideLength * Math.cos(angle1Rad);
    const Cy = baseY + sideLength * Math.sin(angle1Rad);
    C = board.create('point', [Cx, Cy], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  }
  
  // Draw triangle
  board.create('polygon', [A, B, C], { 
    borders: { strokeColor: '#1f2937', strokeWidth: 2 },
    fillColor: 'none',
    vertices: { visible: false }
  });
  
  // Check for right angles and draw appropriate markers
  const isRightAngle1 = Math.abs(angle1 - 90) < tolerance;
  const isRightAngle2 = Math.abs(angle2 - 90) < tolerance;
  const isRightAngle3 = Math.abs(angle3 - 90) < tolerance;
  
  // Draw angle 1 at vertex A
  if (isRightAngle1) {
    // Draw right angle marker (small square)
    board.create('angle', [B, A, C], {
      type: 'square',
      orthoType: 'square',
      orthoSensitivity: 0.5,
      radius: 0.4,
      name: data.labels?.[0]?.text || '90°',
      strokeColor:'#3b82f6',
      strokeWidth: 2,
      fillColor: 'none',
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  } else {
    board.create('angle', [B, A, C], {
      radius: 0.5,
      name: data.labels?.[0]?.text || `${angle1.toFixed(0)}°`,
      strokeColor:'#3b82f6',
      strokeWidth: 2,
      fillColor: '#3b82f6',
      fillOpacity: 0.15,
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  }
  
  // Draw angle 2 at vertex B
  if (isRightAngle2) {
    // Draw right angle marker (small square)
    board.create('angle', [C, B, A], {
      type: 'square',
      orthoType: 'square',
      orthoSensitivity: 0.5,
      radius: 0.4,
      name: data.labels?.[1]?.text || '90°',
      strokeColor: '#ef4444',
      strokeWidth: 2,
      fillColor: 'none',
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  } else {
    board.create('angle', [C, B, A], {
      radius: 0.5,
      name: data.labels?.[1]?.text || `${angle2.toFixed(0)}°`,
      strokeColor: '#ef4444',
      strokeWidth: 2,
      fillColor: '#ef4444',
      fillOpacity: 0.15,
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  }
  
  // Draw angle 3 at vertex C
  if (isRightAngle3) {
    // Draw right angle marker (small square)
    board.create('angle', [A, C, B], {
      type: 'square',
      orthoType: 'square',
      orthoSensitivity: 0.5,
      radius: 0.4,
      name: data.labels?.[2]?.text || '90°',
      strokeColor: '#10b981',
      strokeWidth: 2,
      fillColor: 'none',
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  } else {
    board.create('angle', [A, C, B], {
      radius: 0.5,
      name: data.labels?.[2]?.text || `${angle3.toFixed(0)}°`,
      strokeColor: '#10b981',
      strokeWidth: 2,
      fillColor: '#10b981',
      fillOpacity: 0.15,
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  }
}

function drawParallelLinesJSX(board: any, data: DiagramData) {
  const { angle1 = 65 } = data.dimensions;
  
  // Draw two parallel horizontal lines
  const topY = 4;
  const bottomY = 1.5;
  board.create('line', [[1, topY], [9, topY]], { strokeColor: '#1f2937', strokeWidth: 2, fixed: true });
  board.create('line', [[1, bottomY], [9, bottomY]], { strokeColor: '#1f2937', strokeWidth: 2, fixed: true });
  
  // Draw transversal at angle1 from horizontal
  const angleRad = (angle1 * Math.PI) / 180;
  
  // Calculate transversal line that intersects both parallel lines
  const topIntersectX = 4;
  const bottomIntersectX = topIntersectX + (topY - bottomY) / Math.tan(angleRad);
  
  // Calculate transversal direction vector from actual intersections
  const dx = bottomIntersectX - topIntersectX;
  const dy = bottomY - topY;
  const length = Math.sqrt(dx * dx + dy * dy);
  const unitDx = dx / length;
  const unitDy = dy / length;
  
  // Extend transversal beyond intersection points
  const extendAmount = 1.5;
  const transStartX = topIntersectX - extendAmount * unitDx;
  const transStartY = topY - extendAmount * unitDy;
  const transEndX = bottomIntersectX + extendAmount * unitDx;
  const transEndY = bottomY + extendAmount * unitDy;
  
  board.create('line', [[transStartX, transStartY], [transEndX, transEndY]], { 
    strokeColor: '#1f2937', 
    strokeWidth: 2 
  });
  
  // Mark intersection points
  const P1 = board.create('point', [topIntersectX, topY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  const P2 = board.create('point', [bottomIntersectX, bottomY], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  
  // Helper points for creating angles
  const topRight = board.create('point', [topIntersectX + 1, topY], { visible: false, fixed: true });
  const topLeft = board.create('point', [topIntersectX - 1, topY], { visible: false, fixed: true });
  const bottomRight = board.create('point', [bottomIntersectX + 1, bottomY], { visible: false, fixed: true });
  const bottomLeft = board.create('point', [bottomIntersectX - 1, bottomY], { visible: false, fixed: true });
  
  // Points on transversal - use actual normalized direction
  const transUp1 = board.create('point', [topIntersectX - unitDx, topY - unitDy], { visible: false, fixed: true });
  const transDown1 = board.create('point', [topIntersectX + unitDx, topY + unitDy], { visible: false, fixed: true });
  const transUp2 = board.create('point', [bottomIntersectX - unitDx, bottomY - unitDy], { visible: false, fixed: true });
  const transDown2 = board.create('point', [bottomIntersectX + unitDx, bottomY + unitDy], { visible: false, fixed: true });
  
  // Draw key angles with labels
  // Top intersection - angle between horizontal line (going right) and transversal (going down)
  board.create('angle', [transDown1, P1, topRight], {
    radius: 0.5,
    name: data.labels?.[0]?.text || `${angle1.toFixed(0)}°`,
    strokeColor: '#3b82f6',
    strokeWidth: 2,
    fillColor: '#3b82f6',
    fillOpacity: 0.15,
    label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;', offset: [10, -10] }
  });
  
  // Bottom intersection - corresponding angle
  board.create('angle', [transDown2, P2, bottomRight], {
    radius: 0.5,
    name: data.labels?.[1]?.text || `${angle1.toFixed(0)}°`,
    strokeColor: '#ef4444',
    strokeWidth: 2,
    fillColor: '#ef4444',
    fillOpacity: 0.15,
    label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;', offset: [10, -10] }
  });
}

function drawVerticallyOppositeJSX(board: any, data: DiagramData) {
  const { angle1 = 45 } = data.dimensions;
  
  // Draw horizontal line
  board.create('line', [[1, 2.5], [9, 2.5]], { strokeColor: '#1f2937', strokeWidth: 2 });
  
  // Draw second line at angle1 from horizontal
  const angleRad = (angle1 * Math.PI) / 180;
  const lineLength = 4;
  const dx = lineLength * Math.cos(angleRad);
  const dy = lineLength * Math.sin(angleRad);
  
  board.create('line', [[5 - dx, 2.5 - dy], [5 + dx, 2.5 + dy]], { strokeColor: '#1f2937', strokeWidth: 2 });
  
  // Intersection point
  const P = board.create('point', [5, 2.5], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  
  // Helper points for creating angles correctly
  const rightPoint = board.create('point', [7, 2.5], { visible: false, fixed: true });
  const leftPoint = board.create('point', [3, 2.5], { visible: false, fixed: true });
  const topRightPoint = board.create('point', [5 + dx, 2.5 + dy], { visible: false, fixed: true });
  const bottomLeftPoint = board.create('point', [5 - dx, 2.5 - dy], { visible: false, fixed: true });
  
  // Draw the two vertically opposite angles (they should be equal)
  board.create('angle', [rightPoint, P, topRightPoint], {
    radius: 0.5,
    name: data.labels?.[0]?.text || `${angle1.toFixed(0)}°`,
    strokeColor: '#3b82f6',
    strokeWidth: 2,
    fillColor: '#3b82f6',
    fillOpacity: 0.15,
    label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
  });
  
  board.create('angle', [leftPoint, P, bottomLeftPoint], {
    radius: 1.0,
    name: data.labels?.[1]?.text || `${angle1.toFixed(0)}°`,
    strokeColor: '#ef4444',
    strokeWidth: 2,
    fillColor: '#ef4444',
    fillOpacity: 0.15,
    label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
  });
}

function drawAnglesAtPointJSX(board: any, data: DiagramData) {
  const { angle1 = 90, angle2 = 90, angle3 = 90, angle4 = 90 } = data.dimensions;
  
  // Central point
  const P = board.create('point', [5, 2.5], { fixed: true, name: '', size: 3, fillColor: '#1f2937', strokeColor: '#1f2937' });
  
  // Create rays at different angles
  let currentAngle = 0;
  const angles = [angle1, angle2, angle3, angle4];
  const points: any[] = [];
  const colors = ['#3b82f6', '#ef4444', '#10b981', '#f59e0b']; // blue, red, green, amber
  
  angles.forEach((angle) => {
    const angleRad = (currentAngle * Math.PI) / 180;
    const x = 5 + 2.5 * Math.cos(angleRad);
    const y = 2.5 + 2.5 * Math.sin(angleRad);
    const point = board.create('point', [x, y], { visible: false, fixed: true });
    points.push(point);
    board.create('line', [P, point], { strokeColor: '#1f2937', strokeWidth: 2, straightFirst: false, straightLast: true });
    currentAngle += angle;
  });
  
  // Draw angle arcs with better styling
  const labelTexts = data.labels?.map(l => l.text) || [];
  const radii = [0.5, 0.7, 0.9, 1.1]; // Different radius for each arc to avoid overlap
  for (let i = 0; i < points.length; i++) {
    const nextI = (i + 1) % points.length;
    board.create('angle', [points[nextI], P, points[i]], {
      radius: radii[i],
      name: labelTexts[i] || `${angles[i].toFixed(0)}°`,
      strokeColor: colors[i % colors.length],
      strokeWidth: 2,
      fillColor: colors[i % colors.length],
      fillOpacity: 0.15,
      label: { fontSize: 16, color: '#1f2937', cssStyle: 'font-weight: bold;' }
    });
  }
}

// SVG rendering function for measurement shapes
function renderWithSVG(svg: SVGSVGElement, data: DiagramData) {
  const scale = data.scale || 1;
  const defaultStyle = {
    fill: 'none',
    stroke: '#1f2937',
    strokeWidth: 2,
    ...data.style
  };

  // Clear previous content
  while (svg.firstChild) {
    svg.removeChild(svg.firstChild);
  }

  // Add defs for arrowheads or patterns if needed
  const defs = document.createElementNS('http://www.w3.org/2000/svg', 'defs');
  svg.appendChild(defs);

  // Draw the shape based on type
  switch (data.type) {
    case 'triangle':
      drawTriangle(svg, data, defaultStyle, scale);
      break;
    case 'rightTriangle':
      drawRightTriangle(svg, data, defaultStyle, scale);
      break;
    case 'isoscelesTriangle':
        drawIsoscelesTriangle(svg, data, defaultStyle, scale);
        break;
      case 'equilateralTriangle':
        drawEquilateralTriangle(svg, data, defaultStyle, scale);
        break;
      case 'rectangle':
        drawRectangle(svg, data, defaultStyle, scale);
        break;
      case 'square':
        drawSquare(svg, data, defaultStyle, scale);
        break;
      case 'circle':
        drawCircle(svg, data, defaultStyle, scale);
        break;
      case 'cuboid':
        drawCuboid(svg, data, defaultStyle, scale);
        break;
      case 'cube':
        drawCube(svg, data, defaultStyle, scale);
        break;
      case 'cylinder':
        drawCylinder(svg, data, defaultStyle, scale);
        break;
      case 'parallelogram':
        drawParallelogram(svg, data, defaultStyle, scale);
        break;
      case 'trapezoid':
      case 'trapezium':
        drawTrapezoid(svg, data, defaultStyle, scale);
        break;
      case 'kite':
        drawKite(svg, data, defaultStyle, scale);
        break;
      case 'semicircle':
        drawSemicircle(svg, data, defaultStyle, scale);
        break;
      case 'triangularPrism':
        drawTriangularPrism(svg, data, defaultStyle, scale);
        break;
      case 'pyramid':
        drawPyramid(svg, data, defaultStyle, scale);
        break;
    }

    // Add labels (only for SVG shapes, JSXGraph handles its own labels)
    if (data.labels) {
      data.labels.forEach(label => {
        addLabel(svg, label, data, scale);
      });
    }
  }

// Drawing functions for each shape type

function drawTriangle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { base = 100, height = 80 } = data.dimensions;
  const centerX = 150;
  const baseY = 200;
  
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX} ${baseY - height * scale} L ${centerX - base * scale / 2} ${baseY} L ${centerX + base * scale / 2} ${baseY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  if (style.dashArray) path.setAttribute('stroke-dasharray', style.dashArray);
  svg.appendChild(path);
}

function drawRightTriangle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { width = 80, height = 60 } = data.dimensions;
  const startX = 100;
  const startY = 180;
  
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${startX} ${startY} L ${startX + width * scale} ${startY} L ${startX} ${startY - height * scale} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
  
  // Add right angle marker
  const markerSize = 10;
  const marker = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const markerD = `M ${startX} ${startY - markerSize} L ${startX + markerSize} ${startY - markerSize} L ${startX + markerSize} ${startY}`;
  marker.setAttribute('d', markerD);
  marker.setAttribute('fill', 'none');
  marker.setAttribute('stroke', style.stroke || '#1f2937');
  marker.setAttribute('stroke-width', '1');
  svg.appendChild(marker);
}

function drawIsoscelesTriangle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { base = 100, height = 80 } = data.dimensions;
  const centerX = 150;
  const baseY = 200;
  
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX} ${baseY - height * scale} L ${centerX - base * scale / 2} ${baseY} L ${centerX + base * scale / 2} ${baseY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
  
  // Add vertical dotted height line to the left of the triangle
  const heightLineX = centerX - base * scale / 2 - 15;
  const heightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  heightLine.setAttribute('x1', heightLineX.toString());
  heightLine.setAttribute('y1', baseY.toString());
  heightLine.setAttribute('x2', heightLineX.toString());
  heightLine.setAttribute('y2', (baseY - height * scale).toString());
  heightLine.setAttribute('stroke', '#666666');
  heightLine.setAttribute('stroke-width', '1.5');
  heightLine.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(heightLine);
  
  // Add small horizontal tick marks at top and bottom of height line
  const tickSize = 6;
  const bottomTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  bottomTick.setAttribute('x1', (heightLineX - tickSize).toString());
  bottomTick.setAttribute('y1', baseY.toString());
  bottomTick.setAttribute('x2', (heightLineX + tickSize).toString());
  bottomTick.setAttribute('y2', baseY.toString());
  bottomTick.setAttribute('stroke', '#666666');
  bottomTick.setAttribute('stroke-width', '1.5');
  svg.appendChild(bottomTick);
  
  const topTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  topTick.setAttribute('x1', (heightLineX - tickSize).toString());
  topTick.setAttribute('y1', (baseY - height * scale).toString());
  topTick.setAttribute('x2', (heightLineX + tickSize).toString());
  topTick.setAttribute('y2', (baseY - height * scale).toString());
  topTick.setAttribute('stroke', '#666666');
  topTick.setAttribute('stroke-width', '1.5');
  svg.appendChild(topTick);
}

function drawEquilateralTriangle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { side = 100 } = data.dimensions;
  const sideLength = side * scale;
  const height = sideLength * Math.sqrt(3) / 2; // Height of equilateral triangle
  const centerX = 150;
  const baseY = 200;
  
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX} ${baseY - height} L ${centerX - sideLength / 2} ${baseY} L ${centerX + sideLength / 2} ${baseY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
}

function drawRectangle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { width = 120, height = 70 } = data.dimensions;
  const x = 150 - (width * scale) / 2;
  const y = 125 - (height * scale) / 2;
  
  const rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
  rect.setAttribute('x', x.toString());
  rect.setAttribute('y', y.toString());
  rect.setAttribute('width', (width * scale).toString());
  rect.setAttribute('height', (height * scale).toString());
  rect.setAttribute('fill', style.fill || 'none');
  rect.setAttribute('stroke', style.stroke || '#1f2937');
  rect.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  if (style.dashArray) rect.setAttribute('stroke-dasharray', style.dashArray);
  svg.appendChild(rect);
}

function drawSquare(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { side = 90 } = data.dimensions;
  const size = side * scale;
  const x = 150 - size / 2;
  const y = 125 - size / 2;
  
  const rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
  rect.setAttribute('x', x.toString());
  rect.setAttribute('y', y.toString());
  rect.setAttribute('width', size.toString());
  rect.setAttribute('height', size.toString());
  rect.setAttribute('fill', style.fill || 'none');
  rect.setAttribute('stroke', style.stroke || '#1f2937');
  rect.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(rect);
}

function drawCircle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { radius = 50 } = data.dimensions;
  const cx = 150;
  const cy = 125;
  const r = radius * scale;
  
  const circle = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
  circle.setAttribute('cx', cx.toString());
  circle.setAttribute('cy', cy.toString());
  circle.setAttribute('r', r.toString());
  circle.setAttribute('fill', style.fill || 'none');
  circle.setAttribute('stroke', style.stroke || '#1f2937');
  circle.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(circle);
  
  // Add center point
  const centerDot = document.createElementNS('http://www.w3.org/2000/svg', 'circle');
  centerDot.setAttribute('cx', cx.toString());
  centerDot.setAttribute('cy', cy.toString());
  centerDot.setAttribute('r', '2');
  centerDot.setAttribute('fill', style.stroke || '#1f2937');
  svg.appendChild(centerDot);
  
  // Determine if we should draw radius or diameter line based on labels
  const hasRadiusLabel = data.labels?.some(label => label.position === 'radius');
  const hasDiameterLabel = data.labels?.some(label => label.position === 'diameter');
  
  if (hasDiameterLabel) {
    // Draw horizontal diameter line from left to right edge
    const diameterLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    diameterLine.setAttribute('x1', (cx - r).toString());
    diameterLine.setAttribute('y1', cy.toString());
    diameterLine.setAttribute('x2', (cx + r).toString());
    diameterLine.setAttribute('y2', cy.toString());
    diameterLine.setAttribute('stroke', '#666');
    diameterLine.setAttribute('stroke-width', '1.5');
    svg.appendChild(diameterLine);
  } else if (hasRadiusLabel) {
    // Draw horizontal radius line from center to right edge
    const radiusLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    radiusLine.setAttribute('x1', cx.toString());
    radiusLine.setAttribute('y1', cy.toString());
    radiusLine.setAttribute('x2', (cx + r).toString());
    radiusLine.setAttribute('y2', cy.toString());
    radiusLine.setAttribute('stroke', '#666');
    radiusLine.setAttribute('stroke-width', '1.5');
    svg.appendChild(radiusLine);
  }
}

function drawCuboid(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { length, width = 80, height = 60, depth } = data.dimensions;
  // Use length for front-to-back, width for left-to-right
  const l = (length || width) * scale;  // front-to-back (bottom edge)
  const w = width * scale;  // left-to-right (right edge)
  const h = height * scale;  // vertical
  const d = (depth || width) * scale * 0.5; // Perspective foreshortening
  
  const startX = 100;
  const startY = 170;
  
  // Front face
  const front = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
  front.setAttribute('x', startX.toString());
  front.setAttribute('y', (startY - h).toString());
  front.setAttribute('width', l.toString());
  front.setAttribute('height', h.toString());
  front.setAttribute('fill', style.fill || 'none');
  front.setAttribute('stroke', style.stroke || '#1f2937');
  front.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(front);
  
  // Top face (parallelogram)
  const top = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const topD = `M ${startX} ${startY - h} L ${startX + d} ${startY - h - d} L ${startX + d + l} ${startY - h - d} L ${startX + l} ${startY - h} Z`;
  top.setAttribute('d', topD);
  top.setAttribute('fill', style.fill || 'rgba(200, 200, 200, 0.3)');
  top.setAttribute('stroke', style.stroke || '#1f2937');
  top.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(top);
  
  // Right face (parallelogram)
  const right = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const rightD = `M ${startX + l} ${startY - h} L ${startX + l + d} ${startY - h - d} L ${startX + l + d} ${startY - d} L ${startX + l} ${startY} Z`;
  right.setAttribute('d', rightD);
  right.setAttribute('fill', style.fill || 'rgba(230, 230, 230, 0.5)');
  right.setAttribute('stroke', style.stroke || '#1f2937');
  right.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(right);
}

function drawCube(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { side = 80 } = data.dimensions;
  const s = side * scale;
  const d = s * 0.5; // Perspective foreshortening
  
  const startX = 100;
  const startY = 170;
  
  // Front face
  const front = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
  front.setAttribute('x', startX.toString());
  front.setAttribute('y', (startY - s).toString());
  front.setAttribute('width', s.toString());
  front.setAttribute('height', s.toString());
  front.setAttribute('fill', style.fill || 'none');
  front.setAttribute('stroke', style.stroke || '#1f2937');
  front.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(front);
  
  // Top face (square in perspective)
  const top = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const topD = `M ${startX} ${startY - s} L ${startX + d} ${startY - s - d} L ${startX + d + s} ${startY - s - d} L ${startX + s} ${startY - s} Z`;
  top.setAttribute('d', topD);
  top.setAttribute('fill', style.fill || 'rgba(200, 200, 200, 0.3)');
  top.setAttribute('stroke', style.stroke || '#1f2937');
  top.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(top);
  
  // Right face (square in perspective)
  const right = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const rightD = `M ${startX + s} ${startY - s} L ${startX + s + d} ${startY - s - d} L ${startX + s + d} ${startY - d} L ${startX + s} ${startY} Z`;
  right.setAttribute('d', rightD);
  right.setAttribute('fill', style.fill || 'rgba(230, 230, 230, 0.5)');
  right.setAttribute('stroke', style.stroke || '#1f2937');
  right.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(right);
}

function drawCylinder(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { radius = 40, height = 80 } = data.dimensions;
  const r = radius * scale;
  const h = height * scale;
  const cx = 150;
  const topY = 80;
  
  // Top ellipse
  const topEllipse = document.createElementNS('http://www.w3.org/2000/svg', 'ellipse');
  topEllipse.setAttribute('cx', cx.toString());
  topEllipse.setAttribute('cy', topY.toString());
  topEllipse.setAttribute('rx', r.toString());
  topEllipse.setAttribute('ry', (r * 0.3).toString());
  topEllipse.setAttribute('fill', style.fill || 'rgba(230, 230, 230, 0.5)');
  topEllipse.setAttribute('stroke', style.stroke || '#1f2937');
  topEllipse.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(topEllipse);
  
  // Left edge
  const leftLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  leftLine.setAttribute('x1', (cx - r).toString());
  leftLine.setAttribute('y1', topY.toString());
  leftLine.setAttribute('x2', (cx - r).toString());
  leftLine.setAttribute('y2', (topY + h).toString());
  leftLine.setAttribute('stroke', style.stroke || '#1f2937');
  leftLine.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(leftLine);
  
  // Right edge
  const rightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  rightLine.setAttribute('x1', (cx + r).toString());
  rightLine.setAttribute('y1', topY.toString());
  rightLine.setAttribute('x2', (cx + r).toString());
  rightLine.setAttribute('y2', (topY + h).toString());
  rightLine.setAttribute('stroke', style.stroke || '#1f2937');
  rightLine.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(rightLine);
  
  // Bottom ellipse
  const bottomEllipse = document.createElementNS('http://www.w3.org/2000/svg', 'ellipse');
  bottomEllipse.setAttribute('cx', cx.toString());
  bottomEllipse.setAttribute('cy', (topY + h).toString());
  bottomEllipse.setAttribute('rx', r.toString());
  bottomEllipse.setAttribute('ry', (r * 0.3).toString());
  bottomEllipse.setAttribute('fill', style.fill || 'none');
  bottomEllipse.setAttribute('stroke', style.stroke || '#1f2937');
  bottomEllipse.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(bottomEllipse);
  
  // Add horizontal radius/diameter line on top ellipse
  const hasDiameterLabel = data.labels?.some(label => label.position === 'diameter');
  const hasRadiusLabel = data.labels?.some(label => label.position === 'radius');
  
  if (hasDiameterLabel) {
    // Draw full diameter line
    const diameterLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    diameterLine.setAttribute('x1', (cx - r).toString());
    diameterLine.setAttribute('y1', topY.toString());
    diameterLine.setAttribute('x2', (cx + r).toString());
    diameterLine.setAttribute('y2', topY.toString());
    diameterLine.setAttribute('stroke', '#666');
    diameterLine.setAttribute('stroke-width', '1');
    diameterLine.setAttribute('stroke-dasharray', '4,3');
    svg.appendChild(diameterLine);
  } else if (hasRadiusLabel) {
    // Draw radius line from center to edge
    const radiusLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    radiusLine.setAttribute('x1', cx.toString());
    radiusLine.setAttribute('y1', topY.toString());
    radiusLine.setAttribute('x2', (cx + r).toString());
    radiusLine.setAttribute('y2', topY.toString());
    radiusLine.setAttribute('stroke', '#666');
    radiusLine.setAttribute('stroke-width', '1');
    radiusLine.setAttribute('stroke-dasharray', '4,3');
    svg.appendChild(radiusLine);
  }
}

function drawParallelogram(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { base = 100, height = 60, slant = 80 } = data.dimensions;
  const b = base * scale;
  const h = height * scale;
  const s = slant * scale;
  
  // Calculate the horizontal offset using Pythagorean theorem
  // slant^2 = height^2 + offset^2, so offset = sqrt(slant^2 - height^2)
  const offset = Math.sqrt(s * s - h * h);
  
  const startX = 100;
  const startY = 180;
  
  // Draw the parallelogram
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${startX + offset} ${startY - h} L ${startX + offset + b} ${startY - h} L ${startX + b} ${startY} L ${startX} ${startY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
  
  // Add vertical dotted line to show the height (to the left of the shape)
  const heightLineX = startX - 15;
  const heightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  heightLine.setAttribute('x1', heightLineX.toString());
  heightLine.setAttribute('y1', (startY - h).toString());
  heightLine.setAttribute('x2', heightLineX.toString());
  heightLine.setAttribute('y2', startY.toString());
  heightLine.setAttribute('stroke', '#666');
  heightLine.setAttribute('stroke-width', '1');
  heightLine.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(heightLine);
  
  // Add tick marks at top and bottom of height line
  const tickLength = 5;
  const topTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  topTick.setAttribute('x1', (heightLineX - tickLength).toString());
  topTick.setAttribute('y1', (startY - h).toString());
  topTick.setAttribute('x2', (heightLineX + tickLength).toString());
  topTick.setAttribute('y2', (startY - h).toString());
  topTick.setAttribute('stroke', '#666');
  topTick.setAttribute('stroke-width', '1');
  svg.appendChild(topTick);
  
  const bottomTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  bottomTick.setAttribute('x1', (heightLineX - tickLength).toString());
  bottomTick.setAttribute('y1', startY.toString());
  bottomTick.setAttribute('x2', (heightLineX + tickLength).toString());
  bottomTick.setAttribute('y2', startY.toString());
  bottomTick.setAttribute('stroke', '#666');
  bottomTick.setAttribute('stroke-width', '1');
  svg.appendChild(bottomTick);
  
  // Store height line position for label positioning
  (svg as any).__heightLineX = heightLineX;
}

function drawTrapezoid(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { bottomBase = 100, topBase = 60, height = 50 } = data.dimensions;
  const bottomWidth = bottomBase * scale;
  const topWidth = topBase * scale;
  const h = height * scale;
  
  const centerX = 150;
  const baseY = 180;
  
  // Draw the trapezoid
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX - topWidth/2} ${baseY - h} L ${centerX + topWidth/2} ${baseY - h} L ${centerX + bottomWidth/2} ${baseY} L ${centerX - bottomWidth/2} ${baseY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
  
  // Add vertical dotted line to show the height (to the left of the shape)
  const heightLineX = centerX - bottomWidth / 2 - 15;
  const heightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  heightLine.setAttribute('x1', heightLineX.toString());
  heightLine.setAttribute('y1', (baseY - h).toString());
  heightLine.setAttribute('x2', heightLineX.toString());
  heightLine.setAttribute('y2', baseY.toString());
  heightLine.setAttribute('stroke', '#666');
  heightLine.setAttribute('stroke-width', '1');
  heightLine.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(heightLine);
  
  // Add tick marks at top and bottom of height line
  const tickLength = 5;
  const topTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  topTick.setAttribute('x1', (heightLineX - tickLength).toString());
  topTick.setAttribute('y1', (baseY - h).toString());
  topTick.setAttribute('x2', (heightLineX + tickLength).toString());
  topTick.setAttribute('y2', (baseY - h).toString());
  topTick.setAttribute('stroke', '#666');
  topTick.setAttribute('stroke-width', '1');
  svg.appendChild(topTick);
  
  const bottomTick = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  bottomTick.setAttribute('x1', (heightLineX - tickLength).toString());
  bottomTick.setAttribute('y1', baseY.toString());
  bottomTick.setAttribute('x2', (heightLineX + tickLength).toString());
  bottomTick.setAttribute('y2', baseY.toString());
  bottomTick.setAttribute('stroke', '#666');
  bottomTick.setAttribute('stroke-width', '1');
  svg.appendChild(bottomTick);
}

function addLabel(svg: SVGSVGElement, label: DiagramLabel, data: DiagramData, scale: number) {
  const text = document.createElementNS('http://www.w3.org/2000/svg', 'text');
  
  // Calculate position based on label position and shape
  let x = 150;
  let y = 125;
  
  // Check if template label positions are available (for angle diagrams)
  const templatePositions = (svg as any).__templateLabelPositions;
  if (templatePositions && templatePositions[label.position]) {
    x = templatePositions[label.position].x;
    y = templatePositions[label.position].y;
  } else {
    // Use shape-aware position logic for measurement shapes
    const position = calculateLabelPosition(label.position, data, scale);
    x = position.x;
    y = position.y;
  }
  
  // Apply custom offset if provided
  if (label.offset) {
    x += label.offset.x;
    y += label.offset.y;
  }
  
  text.setAttribute('x', x.toString());
  text.setAttribute('y', y.toString());
  text.setAttribute('text-anchor', 'middle');
  text.setAttribute('font-size', '14');
  text.setAttribute('font-family', 'Arial, sans-serif');
  
  // Special styling for slant height labels (bold and red)
  if (label.position === 'slant') {
    text.setAttribute('fill', 'red');
    text.setAttribute('font-weight', 'bold');
  } else {
    text.setAttribute('fill', '#1f2937');
  }
  
  text.textContent = label.text;
  
  svg.appendChild(text);
}

function calculateLabelPosition(position: string, data: DiagramData, scale: number): { x: number; y: number } {
  const { type, dimensions } = data;
  
  // Rectangle positioning
  if (type === 'rectangle') {
    const width = (dimensions.width || 90) * scale;
    const height = (dimensions.height || 70) * scale;
    const centerX = 150;
    const centerY = 125;
    
    switch (position) {
      case 'bottom': return { x: centerX, y: centerY + height / 2 + 20 };
      case 'top': return { x: centerX, y: centerY - height / 2 - 10 };
      case 'left': return { x: centerX - width / 2 - 25, y: centerY };
      case 'right': return { x: centerX + width / 2 + 25, y: centerY };
      default: return { x: centerX, y: centerY };
    }
  }
  
  // Square positioning (moved labels down more)
  if (type === 'square') {
    const width = (dimensions.width || dimensions.side || 90) * scale;
    const height = width; // Square has equal sides
    const centerX = 150;
    const centerY = 125;
    
    switch (position) {
      case 'bottom': return { x: centerX, y: centerY + height / 2 + 28 };
      case 'top': return { x: centerX, y: centerY - height / 2 - 10 };
      case 'left': return { x: centerX - width / 2 - 25, y: centerY };
      case 'right': return { x: centerX + width / 2 + 25, y: centerY };
      default: return { x: centerX, y: centerY };
    }
  }
  
  // Right Triangle positioning
  if (type === 'rightTriangle') {
    const width = (dimensions.width || 80) * scale;
    const height = (dimensions.height || 60) * scale;
    const startX = 100;
    const startY = 180;
    
    switch (position) {
      case 'bottom': return { x: startX + width / 2, y: startY + 25 };
      case 'left': return { x: startX - 40, y: startY - height / 2 };
      case 'right': return { x: startX + width + 35, y: startY - height / 2 };
      case 'hypotenuse': return { x: startX + width / 2 + 30, y: startY - height / 2 - 15 };
      case 'height': return { x: startX - 40, y: startY - height / 2 };
      default: return { x: startX + width / 2, y: startY - height / 2 };
    }
  }
  
  // Isosceles Triangle positioning
  if (type === 'isoscelesTriangle' || type === 'triangle') {
    const base = (dimensions.base || dimensions.width || 100) * scale;
    const height = (dimensions.height || 80) * scale;
    const centerX = 150;
    const baseY = 200;
    const heightLineX = centerX - base / 2 - 15;
    
    switch (position) {
      case 'bottom': return { x: centerX, y: baseY + 20 };
      case 'center': return { x: heightLineX - 35, y: baseY - height / 2 };
      case 'height': return { x: heightLineX - 35, y: baseY - height / 2 };
      case 'left': return { x: centerX - base / 2 - 30, y: baseY - height / 3 };
      case 'right': return { x: centerX + base / 2 + 30, y: baseY - height / 3 };
      default: return { x: centerX, y: baseY - height / 2 };
    }
  }
  
  // Equilateral Triangle positioning
  if (type === 'equilateralTriangle') {
    const side = (dimensions.side || 100) * scale;
    const height = side * Math.sqrt(3) / 2;
    const centerX = 150;
    const baseY = 200;
    
    switch (position) {
      case 'bottom': return { x: centerX, y: baseY + 25 };
      case 'left': return { x: centerX - side / 2 - 30, y: baseY - height / 3 };
      case 'right': return { x: centerX + side / 2 + 30, y: baseY - height / 3 };
      case 'top': return { x: centerX, y: baseY - height - 15 };
      default: return { x: centerX, y: baseY - height / 2 };
    }
  }
  
  // Circle positioning
  if (type === 'circle') {
    const radius = (dimensions.radius || 50) * scale;
    const centerX = 150;
    const centerY = 125;
    
    switch (position) {
      case 'radius': return { x: centerX + radius / 2, y: centerY - 15 };
      case 'diameter': return { x: centerX, y: centerY - 15 };
      default: return { x: centerX, y: centerY - radius - 15 };
    }
  }
  
  // Semicircle positioning
  if (type === 'semicircle') {
    const radius = (dimensions.radius || 60) * scale;
    const centerX = 150;
    const centerY = 150;
    
    switch (position) {
      case 'radius': return { x: centerX - radius / 2, y: centerY - 10 };
      default: return { x: centerX, y: centerY - 15 };
    }
  }
  
  // Parallelogram positioning
  if (type === 'parallelogram') {
    const base = (dimensions.base || 100) * scale;
    const height = (dimensions.height || 60) * scale;
    const slant = (dimensions.slant || 80) * scale;
    const startX = 100;
    const startY = 180;
    const heightLineX = startX - 15;
    
    switch (position) {
      case 'bottom': return { x: startX + base / 2, y: startY + 25 };
      case 'base': return { x: startX + base / 2, y: startY + 25 };
      case 'height': return { x: heightLineX - 35, y: startY - height / 2 };
      case 'side': return { x: startX + base + 50, y: startY - height / 2 };
      default: return { x: startX + base / 2, y: startY - height / 2 };
    }
  }
  
  // Trapezoid/Trapezium positioning
  if (type === 'trapezoid' || type === 'trapezium') {
    const bottomBase = (dimensions.bottomBase || 100) * scale;
    const topBase = (dimensions.topBase || 60) * scale;
    const height = (dimensions.height || 50) * scale;
    const centerX = 150;
    const baseY = 180;
    const heightLineX = centerX - bottomBase / 2 - 15;
    
    switch (position) {
      case 'bottom': return { x: centerX, y: baseY + 25 };
      case 'top': return { x: centerX, y: baseY - height - 10 };
      case 'height': return { x: heightLineX - 35, y: baseY - height / 2 };
      default: return { x: centerX, y: baseY - height / 2 };
    }
  }
  
  // Kite positioning
  if (type === 'kite') {
    const diagonal1 = (dimensions.diagonal1 || 100) * scale;  // Vertical
    const diagonal2 = (dimensions.diagonal2 || 60) * scale;   // Horizontal
    const centerX = 150;
    const centerY = 125;
    
    switch (position) {
      case 'diagonal1': return { x: centerX - 32, y: centerY - 3 };  // Left side of vertical diagonal
      case 'diagonal2': return { x: centerX, y: centerY + diagonal1 / 2 + 20 };  // Below horizontal diagonal
      default: return { x: centerX, y: centerY };
    }
  }
  
  // Cuboid positioning
  if (type === 'cuboid') {
    const length = (dimensions.length || dimensions.width || 80) * scale;
    const width = (dimensions.width || 80) * scale;
    const height = (dimensions.height || 60) * scale;
    const depth = (dimensions.depth || width) * scale * 0.5;
    const startX = 100;
    const startY = 170;
    
    // Special handling for CUBOID_03 (taller cuboid with dimensions 80x60x95)
    const isCuboid3 = dimensions.length === 80 && dimensions.width === 60 && dimensions.height === 95;
    
    switch (position) {
      case 'length': return { x: startX + length / 2, y: startY + 20 };
      case 'width': 
        if (isCuboid3) {
          return { x: startX + length + depth + 15, y: startY - height / 2 + 29 };
        }
        return { x: startX + length + depth + 20, y: startY - height / 2 + 5 };
      case 'height': return { x: startX - 30, y: startY - height / 2 };
      default: return { x: startX + length / 2, y: startY - height / 2 };
    }
  }
  
  // Cube positioning
  if (type === 'cube') {
    const side = (dimensions.side || 80) * scale;
    const depth = side * 0.5;
    const startX = 100;
    const startY = 170;
    
    switch (position) {
      case 'side': return { x: startX + side / 2, y: startY + 20 };
      case 'bottom': return { x: startX + side / 2, y: startY + 20 };
      default: return { x: startX + side / 2, y: startY - side / 2 };
    }
  }
  
  // Cylinder positioning
  if (type === 'cylinder') {
    const radius = (dimensions.radius || 40) * scale;
    const height = (dimensions.height || 80) * scale;
    const centerX = 150;
    const topY = 80;
    
    switch (position) {
      case 'radius': return { x: centerX + radius / 2, y: topY };
      case 'diameter': return { x: centerX, y: topY - 15 };
      case 'height': return { x: centerX - radius - 30, y: topY + height / 2 };
      default: return { x: centerX, y: topY + height / 2 };
    }
  }
  
  // Triangular Prism positioning
  if (type === 'triangularPrism') {
    const triangleBase = (dimensions.triangleBase || dimensions.triangleSide || 70) * scale;
    const triangleHeight = (dimensions.triangleHeight || (dimensions.triangleSide ? dimensions.triangleSide * Math.sqrt(3) / 2 : 60)) * scale;
    const length = (dimensions.length || 100) * scale;
    const depth = length * 0.5;
    const startX = 90;
    const baseY = 190;
    
    const isEquilateral = !!dimensions.triangleSide;
    
    switch (position) {
      case 'triangle-base':
      case 'base': 
        if (isEquilateral) {
          return { x: startX + triangleBase / 2, y: baseY + 25 };
        }
        return { x: startX + triangleBase / 2, y: baseY + 20 };
      case 'triangle-height':
      case 'height': 
        if (isEquilateral) {
          return { x: startX + triangleBase / 2 - 60, y: baseY - triangleHeight / 2 };
        }
        return { x: startX - 30, y: baseY - triangleHeight / 2 };
      case 'hypotenuse':
      case 'slant': 
        if (isEquilateral) {
          return { x: startX + triangleBase + 65, y: baseY - triangleHeight / 2 - 50 };
        }
        return { x: startX + triangleBase / 2 + 75, y: baseY - triangleHeight / 2 - 60 };
      case 'triangle-side':
      case 'side': 
        return { x: startX + 25, y: baseY - triangleHeight / 2 + 50 };
      case 'length': 
        return { x: startX + triangleBase + depth + 10, y: baseY - depth / 2 + 5 };
      default: 
        return { x: startX + triangleBase / 2, y: baseY - triangleHeight / 2 };
    }
  }
  
  // Pyramid positioning
  if (type === 'pyramid') {
    const width = (dimensions.width || dimensions.base || 70) * scale;
    const height = (dimensions.height || 80) * scale;
    const depth = (dimensions.depth || dimensions.width || dimensions.base || 70) * scale * 0.5;
    const centerX = 150;
    const baseY = 190;
    const apexX = centerX + depth/3;
    const apexY = baseY - height - depth/3;
    const rightEdgeMidX = centerX + width/2 + depth/2;
    const rightEdgeMidY = baseY - depth/2;
    
    switch (position) {
      case 'base': return { x: centerX, y: baseY + 20 };
      case 'length': return { x: centerX, y: baseY + 20 };
      case 'width': return { x: centerX + width/2 + depth + 25, y: baseY - 10 };
      case 'height': return { x: centerX - width/2 - 50, y: baseY - height / 2 - depth / 6 };
      case 'slant': return { x: (apexX + rightEdgeMidX) / 2 + 35, y: (apexY + rightEdgeMidY) / 2 - 10 };
      default: return { x: centerX, y: baseY - height / 2 };
    }
  }
  
  // Compound shapes - use context-specific positioning
  if (position === 'bottom-left' || position === 'bottomLeft') {
    return { x: 70, y: 210 };
  }
  if (position === 'bottom-right' || position === 'bottomRight') {
    return { x: 230, y: 210 };
  }
  if (position === 'triangle-height') {
    return { x: 70, y: 150 };
  }
  if (position === 'semicircle') {
    return { x: 200, y: 150 };
  }
  
  // Default positions for standard cases
  switch (position) {
    case 'top': return { x: 150, y: 40 };
    case 'bottom': return { x: 150, y: 210 };
    case 'left': return { x: 50, y: 125 };
    case 'right': return { x: 250, y: 125 };
    case 'topLeft': return { x: 70, y: 60 };
    case 'topRight': return { x: 230, y: 60 };
    case 'center': return { x: 150, y: 125 };
    default: return { x: 150, y: 125 };
  }
}

// New 2D Shapes

function drawKite(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { diagonal1 = 100, diagonal2 = 60 } = data.dimensions;
  const d1 = diagonal1 * scale;  // Vertical diagonal
  const d2 = diagonal2 * scale;  // Horizontal diagonal
  const centerX = 150;
  const centerY = 125;
  
  // Draw the kite shape
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX} ${centerY - d1/2} L ${centerX + d2/2} ${centerY} L ${centerX} ${centerY + d1/2} L ${centerX - d2/2} ${centerY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
  
  // Draw vertical diagonal (diagonal1) as a dotted line
  const verticalDiagonal = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  verticalDiagonal.setAttribute('x1', centerX.toString());
  verticalDiagonal.setAttribute('y1', (centerY - d1/2).toString());
  verticalDiagonal.setAttribute('x2', centerX.toString());
  verticalDiagonal.setAttribute('y2', (centerY + d1/2).toString());
  verticalDiagonal.setAttribute('stroke', '#666');
  verticalDiagonal.setAttribute('stroke-width', '1');
  verticalDiagonal.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(verticalDiagonal);
  
  // Draw horizontal diagonal (diagonal2) as a dotted line
  const horizontalDiagonal = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  horizontalDiagonal.setAttribute('x1', (centerX - d2/2).toString());
  horizontalDiagonal.setAttribute('y1', centerY.toString());
  horizontalDiagonal.setAttribute('x2', (centerX + d2/2).toString());
  horizontalDiagonal.setAttribute('y2', centerY.toString());
  horizontalDiagonal.setAttribute('stroke', '#666');
  horizontalDiagonal.setAttribute('stroke-width', '1');
  horizontalDiagonal.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(horizontalDiagonal);
}

function drawSemicircle(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { radius = 60 } = data.dimensions;
  const r = radius * scale;
  const centerX = 150;
  const centerY = 150;
  
  // Draw arc
  const path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const d = `M ${centerX - r} ${centerY} A ${r} ${r} 0 0 1 ${centerX + r} ${centerY} Z`;
  path.setAttribute('d', d);
  path.setAttribute('fill', style.fill || 'none');
  path.setAttribute('stroke', style.stroke || '#1f2937');
  path.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(path);
}

// New 3D Shapes

function drawTriangularPrism(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { triangleBase, triangleHeight, triangleSide, length = 100 } = data.dimensions;
  
  // Determine if it's a right triangle or equilateral triangle cross-section
  const isEquilateral = !!triangleSide;
  
  const w = (triangleBase || triangleSide || 70) * scale;  // Base width
  const h = (triangleHeight || (triangleSide ? triangleSide * Math.sqrt(3) / 2 : 60)) * scale;  // Triangle height
  const d = length * scale * 0.5;  // Depth (prism length in perspective)
  
  const startX = 90;
  const baseY = 190;
  
  // Front triangular face
  const front = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  let frontD;
  if (isEquilateral) {
    // Centered triangle for equilateral
    frontD = `M ${startX + w/2} ${baseY - h} L ${startX} ${baseY} L ${startX + w} ${baseY} Z`;
  } else {
    // Right triangle - right angle at bottom left
    frontD = `M ${startX} ${baseY - h} L ${startX} ${baseY} L ${startX + w} ${baseY} Z`;
  }
  front.setAttribute('d', frontD);
  front.setAttribute('fill', style.fill || 'none');
  front.setAttribute('stroke', style.stroke || '#1f2937');
  front.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(front);
  
  // Back triangular face (shifted for depth)
  const back = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  let backD;
  if (isEquilateral) {
    backD = `M ${startX + w/2 + d} ${baseY - h - d} L ${startX + d} ${baseY - d} L ${startX + w + d} ${baseY - d} Z`;
  } else {
    backD = `M ${startX + d} ${baseY - h - d} L ${startX + d} ${baseY - d} L ${startX + w + d} ${baseY - d} Z`;
  }
  back.setAttribute('d', backD);
  back.setAttribute('fill', 'none');
  back.setAttribute('stroke', style.stroke || '#1f2937');
  back.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  back.setAttribute('stroke-dasharray', '4,2');
  svg.appendChild(back);
  
  // Connecting edges
  const edge1 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  if (isEquilateral) {
    edge1.setAttribute('x1', (startX + w/2).toString());
    edge1.setAttribute('y1', (baseY - h).toString());
    edge1.setAttribute('x2', (startX + w/2 + d).toString());
    edge1.setAttribute('y2', (baseY - h - d).toString());
  } else {
    edge1.setAttribute('x1', startX.toString());
    edge1.setAttribute('y1', (baseY - h).toString());
    edge1.setAttribute('x2', (startX + d).toString());
    edge1.setAttribute('y2', (baseY - h - d).toString());
  }
  edge1.setAttribute('stroke', style.stroke || '#1f2937');
  edge1.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(edge1);
  
  const edge2 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge2.setAttribute('x1', startX.toString());
  edge2.setAttribute('y1', baseY.toString());
  edge2.setAttribute('x2', (startX + d).toString());
  edge2.setAttribute('y2', (baseY - d).toString());
  edge2.setAttribute('stroke', style.stroke || '#1f2937');
  edge2.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(edge2);
  
  const edge3 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge3.setAttribute('x1', (startX + w).toString());
  edge3.setAttribute('y1', baseY.toString());
  edge3.setAttribute('x2', (startX + w + d).toString());
  edge3.setAttribute('y2', (baseY - d).toString());
  edge3.setAttribute('stroke', style.stroke || '#1f2937');
  edge3.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(edge3);
  
  // Bottom rectangular face
  const bottom = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const bottomD = `M ${startX} ${baseY} L ${startX + d} ${baseY - d} L ${startX + w + d} ${baseY - d} L ${startX + w} ${baseY} Z`;
  bottom.setAttribute('d', bottomD);
  bottom.setAttribute('fill', style.fill || 'rgba(200, 200, 200, 0.3)');
  bottom.setAttribute('stroke', style.stroke || '#1f2937');
  bottom.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(bottom);
  
  // Add vertical height line for equilateral triangle
  if (isEquilateral) {
    const heightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    heightLine.setAttribute('x1', (startX + w/2).toString());
    heightLine.setAttribute('y1', (baseY - h).toString());
    heightLine.setAttribute('x2', (startX + w/2).toString());
    heightLine.setAttribute('y2', baseY.toString());
    heightLine.setAttribute('stroke', '#666');
    heightLine.setAttribute('stroke-width', '1');
    heightLine.setAttribute('stroke-dasharray', '4,3');
    svg.appendChild(heightLine);
    
    // Add tick marks at top and bottom
    const tickTop = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    tickTop.setAttribute('x1', (startX + w/2 - 5).toString());
    tickTop.setAttribute('y1', (baseY - h).toString());
    tickTop.setAttribute('x2', (startX + w/2 + 5).toString());
    tickTop.setAttribute('y2', (baseY - h).toString());
    tickTop.setAttribute('stroke', '#666');
    tickTop.setAttribute('stroke-width', '1');
    svg.appendChild(tickTop);
    
    const tickBottom = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    tickBottom.setAttribute('x1', (startX + w/2 - 5).toString());
    tickBottom.setAttribute('y1', baseY.toString());
    tickBottom.setAttribute('x2', (startX + w/2 + 5).toString());
    tickBottom.setAttribute('y2', baseY.toString());
    tickBottom.setAttribute('stroke', '#666');
    tickBottom.setAttribute('stroke-width', '1');
    svg.appendChild(tickBottom);
    
    // Add external height indicator line to the left
    const externalHeightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    externalHeightLine.setAttribute('x1', (startX - 20).toString());
    externalHeightLine.setAttribute('y1', (baseY - h).toString());
    externalHeightLine.setAttribute('x2', (startX - 20).toString());
    externalHeightLine.setAttribute('y2', baseY.toString());
    externalHeightLine.setAttribute('stroke', '#666');
    externalHeightLine.setAttribute('stroke-width', '1');
    externalHeightLine.setAttribute('stroke-dasharray', '4,3');
    svg.appendChild(externalHeightLine);
    
    // Add tick marks for external height line
    const extTickTop = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    extTickTop.setAttribute('x1', (startX - 25).toString());
    extTickTop.setAttribute('y1', (baseY - h).toString());
    extTickTop.setAttribute('x2', (startX - 15).toString());
    extTickTop.setAttribute('y2', (baseY - h).toString());
    extTickTop.setAttribute('stroke', '#666');
    extTickTop.setAttribute('stroke-width', '1');
    svg.appendChild(extTickTop);
    
    const extTickBottom = document.createElementNS('http://www.w3.org/2000/svg', 'line');
    extTickBottom.setAttribute('x1', (startX - 25).toString());
    extTickBottom.setAttribute('y1', baseY.toString());
    extTickBottom.setAttribute('x2', (startX - 15).toString());
    extTickBottom.setAttribute('y2', baseY.toString());
    extTickBottom.setAttribute('stroke', '#666');
    extTickBottom.setAttribute('stroke-width', '1');
    svg.appendChild(extTickBottom);
  }
}

function drawPyramid(svg: SVGSVGElement, data: DiagramData, style: DiagramStyle, scale: number) {
  const { width = 90, height = 80, depth = 90 } = data.dimensions;
  const w = width * scale;
  const h = height * scale;
  const d = depth * scale * 0.5;
  
  const centerX = 150;
  const baseY = 190;
  const apexX = centerX + d/3;
  const apexY = baseY - h - d/3;
  
  // Base square (in perspective)
  const base = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  const baseD = `M ${centerX - w/2} ${baseY} L ${centerX - w/2 + d} ${baseY - d} L ${centerX + w/2 + d} ${baseY - d} L ${centerX + w/2} ${baseY} Z`;
  base.setAttribute('d', baseD);
  base.setAttribute('fill', style.fill || 'rgba(200, 200, 200, 0.3)');
  base.setAttribute('stroke', style.stroke || '#1f2937');
  base.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(base);
  
  // Front left edge
  const edge1 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge1.setAttribute('x1', (centerX - w/2).toString());
  edge1.setAttribute('y1', baseY.toString());
  edge1.setAttribute('x2', apexX.toString());
  edge1.setAttribute('y2', apexY.toString());
  edge1.setAttribute('stroke', style.stroke || '#1f2937');
  edge1.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(edge1);
  
  // Front right edge
  const edge2 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge2.setAttribute('x1', (centerX + w/2).toString());
  edge2.setAttribute('y1', baseY.toString());
  edge2.setAttribute('x2', apexX.toString());
  edge2.setAttribute('y2', apexY.toString());
  edge2.setAttribute('stroke', style.stroke || '#1f2937');
  edge2.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  svg.appendChild(edge2);
  
  // Back edges (dashed)
  const edge3 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge3.setAttribute('x1', (centerX - w/2 + d).toString());
  edge3.setAttribute('y1', (baseY - d).toString());
  edge3.setAttribute('x2', apexX.toString());
  edge3.setAttribute('y2', apexY.toString());
  edge3.setAttribute('stroke', style.stroke || '#1f2937');
  edge3.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  edge3.setAttribute('stroke-dasharray', '4,2');
  svg.appendChild(edge3);
  
  const edge4 = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  edge4.setAttribute('x1', (centerX + w/2 + d).toString());
  edge4.setAttribute('y1', (baseY - d).toString());
  edge4.setAttribute('x2', apexX.toString());
  edge4.setAttribute('y2', apexY.toString());
  edge4.setAttribute('stroke', style.stroke || '#1f2937');
  edge4.setAttribute('stroke-width', style.strokeWidth?.toString() || '2');
  edge4.setAttribute('stroke-dasharray', '4,2');
  svg.appendChild(edge4);
  
  // Add vertical height indicator line
  const heightLineX = centerX - w/2 - 20;
  const heightLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  heightLine.setAttribute('x1', heightLineX.toString());
  heightLine.setAttribute('y1', baseY.toString());
  heightLine.setAttribute('x2', heightLineX.toString());
  heightLine.setAttribute('y2', apexY.toString());
  heightLine.setAttribute('stroke', '#666');
  heightLine.setAttribute('stroke-width', '1');
  heightLine.setAttribute('stroke-dasharray', '4,3');
  svg.appendChild(heightLine);
  
  // Add tick marks for height line
  const tickTop = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  tickTop.setAttribute('x1', (heightLineX - 5).toString());
  tickTop.setAttribute('y1', apexY.toString());
  tickTop.setAttribute('x2', (heightLineX + 5).toString());
  tickTop.setAttribute('y2', apexY.toString());
  tickTop.setAttribute('stroke', '#666');
  tickTop.setAttribute('stroke-width', '1');
  svg.appendChild(tickTop);
  
  const tickBottom = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  tickBottom.setAttribute('x1', (heightLineX - 5).toString());
  tickBottom.setAttribute('y1', baseY.toString());
  tickBottom.setAttribute('x2', (heightLineX + 5).toString());
  tickBottom.setAttribute('y2', baseY.toString());
  tickBottom.setAttribute('stroke', '#666');
  tickBottom.setAttribute('stroke-width', '1');
  svg.appendChild(tickBottom);
  
  // Add slant height indicator line (red) from apex to midpoint of right edge
  const rightEdgeMidX = centerX + w/2 + d/2;
  const rightEdgeMidY = baseY - d/2;
  const slantLine = document.createElementNS('http://www.w3.org/2000/svg', 'line');
  slantLine.setAttribute('x1', apexX.toString());
  slantLine.setAttribute('y1', apexY.toString());
  slantLine.setAttribute('x2', rightEdgeMidX.toString());
  slantLine.setAttribute('y2', rightEdgeMidY.toString());
  slantLine.setAttribute('stroke', 'red');
  slantLine.setAttribute('stroke-width', '2');
  svg.appendChild(slantLine);
}

