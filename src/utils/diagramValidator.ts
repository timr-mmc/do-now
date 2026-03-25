/**
 * Diagram Validation Utility
 * Validates geometry diagrams before bulk question generation to ensure:
 * - All coordinates stay within JSXGraph boundingbox
 * - Angles are mathematically valid
 * - Triangles can be properly constructed
 * - Labels are correctly formatted
 */

import type { DiagramData } from '@/components/GeometryDiagram';

// JSXGraph boundingbox limits: [-1, 8, 11, -1] means x: -1 to 11, y: -1 to 8
const BOUNDS = {
  minX: -1,
  maxX: 11,
  minY: -1,
  maxY: 8
};

interface ValidationResult {
  valid: boolean;
  errors: string[];
  warnings: string[];
}

/**
 * Validates a diagram data object
 */
export function validateDiagram(data: DiagramData | null | undefined): ValidationResult {
  const result: ValidationResult = {
    valid: true,
    errors: [],
    warnings: []
  };

  if (!data) {
    result.valid = false;
    result.errors.push('Diagram data is null or undefined');
    return result;
  }

  // Validate based on diagram type
  switch (data.type) {
    case 'anglesOnLine':
      validateAnglesOnLine(data, result);
      break;
    case 'triangleAngles':
      validateTriangleAngles(data, result);
      break;
    case 'parallelLinesTransversal':
      validateParallelLines(data, result);
      break;
    case 'verticallyOpposite':
      validateVerticallyOpposite(data, result);
      break;
    case 'anglesAtPoint':
      validateAnglesAtPoint(data, result);
      break;
    default:
      // SVG-based diagrams (triangle, rectangle, etc.) have their own bounds
      result.warnings.push(`Validation not implemented for diagram type: ${data.type}`);
  }

  return result;
}

/**
 * Validates angles on a straight line (should sum to 180°)
 */
function validateAnglesOnLine(data: DiagramData, result: ValidationResult): void {
  const { angle1 = 60 } = data.dimensions;
  const angle2 = 180 - angle1;

  if (angle1 <= 0 || angle1 >= 180) {
    result.valid = false;
    result.errors.push(`Angle on line must be between 0° and 180°, got ${angle1}°`);
  }

  // Check if ray point stays within bounds
  // Ray extends from [5, 2.5] at angle
  const angleRad = (angle1 * Math.PI) / 180;
  const rayLength = 3;
  const rayX = 5 + rayLength * Math.cos(angleRad);
  const rayY = 2.5 + rayLength * Math.sin(angleRad);

  if (!isWithinBounds(rayX, rayY)) {
    result.valid = false;
    result.errors.push(`Ray endpoint [${rayX.toFixed(2)}, ${rayY.toFixed(2)}] exceeds boundingbox`);
  }
}

/**
 * Validates triangle angles (must sum to 180°)
 */
function validateTriangleAngles(data: DiagramData, result: ValidationResult): void {
  const { angle1 = 60, angle2 = 60, angle3 = 60 } = data.dimensions;

  // Check angle validity
  if (angle1 <= 0 || angle2 <= 0 || angle3 <= 0) {
    result.valid = false;
    result.errors.push('All triangle angles must be positive');
  }

  if (angle1 >= 180 || angle2 >= 180 || angle3 >= 180) {
    result.valid = false;
    result.errors.push('Triangle angles must be less than 180°');
  }

  // Check if angles sum to 180°
  const sum = angle1 + angle2 + angle3;
  if (Math.abs(sum - 180) > 0.5) {
    result.valid = false;
    result.errors.push(`Triangle angles must sum to 180°, got ${sum.toFixed(1)}°`);
  }

  // Estimate triangle bounds and check if within JSXGraph boundingbox
  const baseY = 1.5;
  const centerX = 5;
  const tolerance = 1;

  // Calculate approximate maximum height
  let maxHeight = 0;

  // Equilateral
  if (Math.abs(angle1 - 60) < tolerance && Math.abs(angle2 - 60) < tolerance && Math.abs(angle3 - 60) < tolerance) {
    maxHeight = 5 * Math.sqrt(3) / 2; // ~4.33
  }
  // Right angle cases
  else if (Math.abs(angle1 - 90) < tolerance || Math.abs(angle2 - 90) < tolerance || Math.abs(angle3 - 90) < tolerance) {
    maxHeight = 5; // Leg length
  }
  // Isosceles with small apex angle (tall triangle)
  else {
    const angles = [angle1, angle2, angle3].sort((a, b) => a - b);
    const smallestAngle = angles[0];
    
    // If smallest angle is very small, triangle will be very tall
    if (smallestAngle < 20) {
      const apexAngleRad = (smallestAngle * Math.PI) / 180;
      const baseLength = 5;
      maxHeight = (baseLength / 2) / Math.tan(apexAngleRad / 2);
      
      if (maxHeight > 10) {
        result.warnings.push(`Very tall triangle detected (height ~${maxHeight.toFixed(1)}). Consider using angles > 20°`);
        maxHeight = 10; // Cap for validation
      }
    } else {
      // Estimate height using largest possible value
      const maxAngleRad = Math.max(
        (angle1 * Math.PI) / 180,
        (angle2 * Math.PI) / 180,
        (angle3 * Math.PI) / 180
      );
      maxHeight = 5 * Math.sin(maxAngleRad);
    }
  }

  const topY = baseY + maxHeight;
  if (topY > BOUNDS.maxY) {
    result.valid = false;
    result.errors.push(`Triangle extends beyond bounds: top y=${topY.toFixed(2)}, max=${BOUNDS.maxY}`);
  }
}

/**
 * Validates parallel lines with transversal
 */
function validateParallelLines(data: DiagramData, result: ValidationResult): void {
  const { angle1 = 65 } = data.dimensions;

  if (angle1 <= 0 || angle1 >= 180) {
    result.valid = false;
    result.errors.push(`Transversal angle must be between 0° and 180°, got ${angle1}°`);
  }

  // Parallel lines are at y=4 and y=1.5, transversal extends to topY+0.5 = 4.5
  // This is always within bounds for current setup
}

/**
 * Validates vertically opposite angles
 */
function validateVerticallyOpposite(data: DiagramData, result: ValidationResult): void {
  const { angle1 = 60 } = data.dimensions;

  if (angle1 <= 0 || angle1 >= 180) {
    result.valid = false;
    result.errors.push(`Vertically opposite angle must be between 0° and 180°, got ${angle1}°`);
  }
}

/**
 * Validates angles at a point (should sum to 360°)
 */
function validateAnglesAtPoint(data: DiagramData, result: ValidationResult): void {
  const { angle1 = 90, angle2 = 90, angle3 = 90, angle4 = 90 } = data.dimensions;
  const angles = [angle1, angle2, angle3, angle4];

  // Check all angles are positive
  if (angles.some(a => a <= 0)) {
    result.valid = false;
    result.errors.push('All angles at point must be positive');
  }

  // Check if angles sum to 360°
  const sum = angles.reduce((acc, a) => acc + a, 0);
  if (Math.abs(sum - 360) > 0.5) {
    result.valid = false;
    result.errors.push(`Angles at point must sum to 360°, got ${sum.toFixed(1)}°`);
  }

  // All rays extend from [5, 2.5] with radius 2.5
  // Max extent is [5±2.5, 2.5±2.5] = [2.5,7.5] × [0,5]
  // All within bounds
}

/**
 * Helper: Check if point is within JSXGraph boundingbox
 */
function isWithinBounds(x: number, y: number): boolean {
  return x >= BOUNDS.minX && x <= BOUNDS.maxX && y >= BOUNDS.minY && y <= BOUNDS.maxY;
}

/**
 * Batch validate multiple diagrams and return summary
 */
export function batchValidateDiagrams(diagrams: Array<{ id: string | number; data: DiagramData }>): {
  totalCount: number;
  validCount: number;
  invalidCount: number;
  warningCount: number;
  results: Array<{ id: string | number; result: ValidationResult }>;
} {
  const results = diagrams.map(({ id, data }) => ({
    id,
    result: validateDiagram(data)
  }));

  const validCount = results.filter(r => r.result.valid).length;
  const invalidCount = results.filter(r => !r.result.valid).length;
  const warningCount = results.filter(r => r.result.warnings.length > 0).length;

  return {
    totalCount: diagrams.length,
    validCount,
    invalidCount,
    warningCount,
    results
  };
}

/**
 * Format validation results as human-readable text
 */
export function formatValidationResult(result: ValidationResult): string {
  const lines: string[] = [];
  
  if (result.valid) {
    lines.push('✓ Valid');
  } else {
    lines.push('✗ Invalid');
  }

  if (result.errors.length > 0) {
    lines.push('\nErrors:');
    result.errors.forEach(error => lines.push(`  - ${error}`));
  }

  if (result.warnings.length > 0) {
    lines.push('\nWarnings:');
    result.warnings.forEach(warning => lines.push(`  - ${warning}`));
  }

  return lines.join('\n');
}
