// Pre-rendered SVG templates for angle diagrams
// These are visually accurate and avoid trigonometry errors

export interface AngleTemplate {
  svg: string;
  labelPositions: Record<string, { x: number; y: number }>;
}

// Templates for common angle ranges
export const ANGLES_ON_LINE_TEMPLATES: Record<string, AngleTemplate> = {
  // Small acute (0-30°) - 25° example
  'small': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="80" y2="60" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 165 97" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 135 97" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 172, y: 108 },
      'right': { x: 128, y: 108 }
    }
  },
  // Medium acute (30-60°) - 45° example
  'medium': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="95" y2="70" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 159 104" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 141 104" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 170, y: 112 },
      'right': { x: 130, y: 112 }
    }
  },
  // Large acute (60-90°) - 70° example
  'large': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="106" y2="62" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 153 103" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 147 103" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 167, y: 112 },
      'right': { x: 133, y: 112 }
    }
  },
  // Right angle (90°)
  'right': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="150" y2="45" stroke="#1f2937" stroke-width="2"/>
      <path d="M 163 125 L 163 112 L 150 112" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 137 112 L 137 125 L 120 125" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 167, y: 117 },
      'right': { x: 128, y: 117 }
    }
  },
  // Small obtuse (90-120°) - 110° example
  'smallObtuse': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="122" y2="55" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 145 100" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 155 100" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 163, y: 110 },
      'right': { x: 137, y: 110 }
    }
  },
  // Large obtuse (120-150°) - 135° example
  'largeObtuse': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="135" y2="52" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 141 96" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 159 96" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 161, y: 108 },
      'right': { x: 139, y: 108 }
    }
  },
  // Very large obtuse (150-180°) - 165° example  
  'veryLargeObtuse': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="148" y2="45" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 150 95" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 0 150 95" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'left': { x: 165, y: 107 },
      'right': { x: 135, y: 107 }
    }
  }
};

export const TRIANGLE_ANGLES_TEMPLATES: Record<string, AngleTemplate> = {
  // Equilateral (60-60-60)
  'equilateral': {
    svg: `
      <path d="M 150 70 L 80 190 L 220 190 Z" fill="none" stroke="#1f2937" stroke-width="2"/>
      <path d="M 100 190 A 25 25 0 0 1 92 170" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 200 190 A 25 25 0 0 0 208 170" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 135 80 A 20 20 0 0 0 165 80" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'bottomLeft': { x: 90, y: 178 },
      'bottomRight': { x: 210, y: 178 },
      'top': { x: 150, y: 95 }
    }
  },
  // Right triangle (90° at bottom-left)
  'rightTriangle': {
    svg: `
      <path d="M 80 190 L 220 190 L 80 70 Z" fill="none" stroke="#1f2937" stroke-width="2"/>
      <path d="M 93 190 L 93 177 L 80 177" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 200 190 A 25 25 0 0 0 210 172" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 85 88 A 20 20 0 0 1 100 82" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'bottomLeft': { x: 97, y: 177 },
      'bottomRight': { x: 205, y: 178 },
      'top': { x: 92, y: 98 }
    }
  },
  // Isosceles obtuse (30-30-120)
  'isoscelesObtuse': {
    svg: `
      <path d="M 150 60 L 70 190 L 230 190 Z" fill="none" stroke="#1f2937" stroke-width="2"/>
      <path d="M 88 190 A 22 22 0 0 1 82 172" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 212 190 A 22 22 0 0 0 218 172" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 128 72 A 30 30 0 0 0 172 72" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'bottomLeft': { x: 80, y: 178 },
      'bottomRight': { x: 220, y: 178 },
      'top': { x: 150, y: 100 }
    }
  },
  // Isosceles acute (75-75-30)
  'isoscelesAcute': {
    svg: `
      <path d="M 150 60 L 95 190 L 205 190 Z" fill="none" stroke="#1f2937" stroke-width="2"/>
      <path d="M 113 190 A 22 22 0 0 1 105 172" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 187 190 A 22 22 0 0 0 195 172" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M140 70 A 15 15 0 0 0 160 70" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'bottomLeft': { x: 105, y: 178 },
      'bottomRight': { x: 195, y: 178 },
      'top': { x: 150, y: 88 }
    }
  }
};

export const PARALLEL_LINES_TEMPLATES: Record<string, AngleTemplate> = {
  'default': {
    svg: `
      <line x1="40" y1="80" x2="260" y2="80" stroke="#1f2937" stroke-width="2"/>
      <line x1="40" y1="170" x2="260" y2="170" stroke="#1f2937" stroke-width="2"/>
      <line x1="145" y1="70" x2="155" y2="90" stroke="#1f2937" stroke-width="1.5"/>
      <line x1="150" y1="70" x2="160" y2="90" stroke="#1f2937" stroke-width="1.5"/>
      <line x1="145" y1="160" x2="155" y2="180" stroke="#1f2937" stroke-width="1.5"/>
      <line x1="150" y1="160" x2="160" y2="180" stroke="#1f2937" stroke-width="1.5"/>
      <line x1="110" y1="80" x2="155" y2="170" stroke="#1f2937" stroke-width="2"/>
      <path d="M 130 80 A 22 22 0 0 0 122 98" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 100 80 A 25 25 0 0 1 92 100" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 140 170 A 22 22 0 0 0 132 152" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 165 170 A 25 25 0 0 1 173 152" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'topLeft': { x: 120, y: 92 },
      'topRight': { x: 90, y: 94 },
      'bottomLeft': { x: 132, y: 158 },
      'bottomRight': { x: 172, y: 158 }
    }
  }
};

export const VERTICALLY_OPPOSITE_TEMPLATES: Record<string, AngleTemplate> = {
  // Small angle (~25°)
  'small': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="85" y1="60" x2="215" y2="190" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 25 25 0 0 1 168 137" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 1 132 113" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'right': { x: 172, y: 137 },
      'left': { x: 128, y: 113 }
    }
  },
  // Medium angle (~45°)
  'medium': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="95" y1="70" x2="205" y2="180" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 25 25 0 0 1 162 143" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 1 138 107" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'right': { x: 168, y: 142 },
      'left': { x: 132, y: 108 }
    }
  },
  // Large angle (~65°)
  'large': {
    svg: `
      <line x1="50" y1="125" x2="250" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="105" y1="75" x2="195" y2="175" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 25 25 0 0 1 157 147" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 1 143 103" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'right': { x: 163, y: 145 },
      'left': { x: 137, y: 105 }
    }
  }
};

export const ANGLES_AT_POINT_TEMPLATES: Record<string, AngleTemplate> = {
  'fourAngles': {
    svg: `
      <line x1="150" y1="125" x2="230" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="150" y2="45" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="70" y2="125" stroke="#1f2937" stroke-width="2"/>
      <line x1="150" y1="125" x2="150" y2="205" stroke="#1f2937" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 150 95" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 1 150 95" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 120 125 A 30 30 0 0 1 150 155" fill="none" stroke="#3b82f6" stroke-width="2"/>
      <path d="M 180 125 A 30 30 0 0 1 150 155" fill="none" stroke="#3b82f6" stroke-width="2"/>
    `,
    labelPositions: {
      'right': { x: 192, y: 128 },
      'top': { x: 150, y: 82 },
      'left': { x: 108, y: 128 },
      'bottom': { x: 150, y: 175 }
    }
  }
};

// Helper function to select appropriate template based on angle value
export function selectAnglesOnLineTemplate(angle1: number): string {
  if (angle1 < 30) return 'small';
  if (angle1 < 60) return 'medium';
  if (angle1 < 90) return 'large';
  if (angle1 === 90) return 'right';
  if (angle1 < 120) return 'smallObtuse';
  if (angle1 < 150) return 'largeObtuse';
  return 'veryLargeObtuse';
}

export function selectTriangleTemplate(angle1: number, angle2: number, angle3: number): string {
  // Check for right triangle
  if (angle1 === 90 || angle2 === 90 || angle3 === 90) return 'rightTriangle';
  
  // Check for equilateral
  if (Math.abs(angle1 - 60) < 5 && Math.abs(angle2 - 60) < 5) return 'equilateral';
  
  // Check for obtuse isosceles (e.g., 30-30-120)
  if (angle3 > 100) return 'isoscelesObtuse';
  
  // Acute isosceles (e.g., 75-75-30)
  return 'isoscelesAcute';
}

export function selectVerticallyOppositeTemplate(angle: number): string {
  if (angle < 40) return 'small';
  if (angle < 70) return 'medium';
  return 'large';
}
