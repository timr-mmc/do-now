'use client';

import { useState, useCallback, useEffect, useRef } from 'react';
import GeometryDiagram, { DiagramData, DiagramType, DiagramDimensions, DiagramLabel } from './GeometryDiagram';
import { validateDiagram } from '@/utils/diagramValidator';

// ─── Config: which fields each shape type needs ──────────────────────────────

type FieldDef = {
  key: keyof DiagramDimensions;
  label: string;
  placeholder?: string;
  readOnly?: boolean;
  derived?: (dims: DiagramDimensions) => number | undefined;
};

const SHAPE_FIELDS: Record<string, FieldDef[]> = {
  rectangle: [
    { key: 'width', label: 'Width' },
    { key: 'height', label: 'Height' },
  ],
  square: [
    { key: 'side', label: 'Side length' },
  ],
  triangle: [
    { key: 'base', label: 'Base' },
    { key: 'height', label: 'Height' },
  ],
  isoscelesTriangle: [
    { key: 'base', label: 'Base' },
    { key: 'height', label: 'Height' },
  ],
  equilateralTriangle: [
    { key: 'side', label: 'Side length' },
  ],
  rightTriangle: [
    { key: 'width', label: 'Leg 1 (horizontal)' },
    { key: 'height', label: 'Leg 2 (vertical)' },
    {
      key: 'side3',
      label: 'Hypotenuse (auto)',
      readOnly: true,
      derived: (d) => d.width && d.height ? Math.round(Math.sqrt(d.width ** 2 + d.height ** 2) * 100) / 100 : undefined,
    },
  ],
  circle: [
    { key: 'radius', label: 'Radius' },
  ],
  semicircle: [
    { key: 'radius', label: 'Radius' },
  ],
  cylinder: [
    { key: 'radius', label: 'Radius' },
    { key: 'height', label: 'Height' },
  ],
  cuboid: [
    { key: 'width', label: 'Width (left-right)' },
    { key: 'height', label: 'Height' },
    { key: 'depth', label: 'Depth (front-back)' },
  ],
  cube: [
    { key: 'side', label: 'Side length' },
  ],
  triangularPrism: [
    { key: 'triangleBase', label: 'Triangle base' },
    { key: 'triangleHeight', label: 'Triangle height' },
    { key: 'length', label: 'Prism length' },
  ],
  pyramid: [
    { key: 'base', label: 'Base (square side)' },
    { key: 'height', label: 'Height' },
  ],
  parallelogram: [
    { key: 'base', label: 'Base' },
    { key: 'height', label: 'Perpendicular height' },
    { key: 'slant', label: 'Slant side' },
  ],
  trapezoid: [
    { key: 'bottomBase', label: 'Bottom base' },
    { key: 'topBase', label: 'Top base' },
    { key: 'height', label: 'Height' },
  ],
  trapezium: [
    { key: 'bottomBase', label: 'Bottom base' },
    { key: 'topBase', label: 'Top base' },
    { key: 'height', label: 'Height' },
  ],
  kite: [
    { key: 'diagonal1', label: 'Vertical diagonal' },
    { key: 'diagonal2', label: 'Horizontal diagonal' },
  ],
  regularPolygon: [
    { key: 'sides', label: 'Number of sides', placeholder: 'e.g. 5' },
    { key: 'side', label: 'Side length' },
  ],
  anglesOnLine: [
    { key: 'angle1', label: 'Angle 1 (°)', placeholder: '60' },
    {
      key: 'angle2',
      label: 'Angle 2 (auto, °)',
      readOnly: true,
      derived: (d) => d.angle1 !== undefined ? 180 - d.angle1 : undefined,
    },
  ],
  triangleAngles: [
    { key: 'angle1', label: 'Angle A (°)' },
    { key: 'angle2', label: 'Angle B (°)' },
    {
      key: 'angle3',
      label: 'Angle C (auto, °)',
      readOnly: true,
      derived: (d) =>
        d.angle1 !== undefined && d.angle2 !== undefined
          ? Math.round((180 - d.angle1 - d.angle2) * 100) / 100
          : undefined,
    },
  ],
  parallelLinesTransversal: [
    { key: 'angle1', label: 'Transversal angle (°)', placeholder: '65' },
  ],
  verticallyOpposite: [
    { key: 'angle1', label: 'Angle (°)', placeholder: '60' },
  ],
  anglesAtPoint: [
    { key: 'angle1', label: 'Angle 1 (°)' },
    { key: 'angle2', label: 'Angle 2 (°)' },
    { key: 'angle3', label: 'Angle 3 (°)' },
    {
      key: 'angle4',
      label: 'Angle 4 (auto, °)',
      readOnly: true,
      derived: (d) => {
        const sum = (d.angle1 ?? 0) + (d.angle2 ?? 0) + (d.angle3 ?? 0);
        return sum < 360 ? Math.round((360 - sum) * 100) / 100 : undefined;
      },
    },
  ],
  circleTheorem: [
    { key: 'theoremType' as any, label: '(use Theorem Type selector above)' },
    { key: 'angle1', label: 'Angle 1 (°)' },
    { key: 'angle2', label: 'Angle 2 (°)' },
  ],
};

const SHAPE_CATEGORIES: { label: string; types: DiagramType[] }[] = [
  {
    label: '2D Shapes',
    types: ['rectangle', 'square', 'circle', 'semicircle', 'triangle', 'isoscelesTriangle',
      'equilateralTriangle', 'rightTriangle', 'parallelogram', 'trapezoid', 'kite', 'regularPolygon'],
  },
  {
    label: '3D Shapes',
    types: ['cuboid', 'cube', 'cylinder', 'triangularPrism', 'pyramid'],
  },
  {
    label: 'Angle Diagrams',
    types: ['anglesOnLine', 'triangleAngles', 'parallelLinesTransversal', 'verticallyOpposite', 'anglesAtPoint', 'circleTheorem'],
  },
  {
    label: 'Grids & Transformations',
    types: ['coordinateGrid', 'reflectionGrid', 'translationGrid', 'rotationGrid', 'enlargementDiagram'],
  },
];

const CIRCLE_THEOREM_TYPES = [
  'angleInSemicircle',
  'anglesInSameSegment',
  'angleCentreCircumference',
  'cyclicQuadrilateral',
  'tangentRadius',
];

const LABEL_POSITIONS = [
  'top', 'bottom', 'left', 'right', 'center',
  'topLeft', 'topRight', 'bottomLeft', 'bottomRight',
  'hypotenuse', 'height', 'side', 'radius', 'diameter',
  'base', 'length', 'width', 'diagonal1', 'diagonal2',
  'semicircle', 'triangle-height', 'bottom-left', 'bottom-right', 'slant',
];

const PRESETS: { label: string; data: DiagramData }[] = [
  {
    label: 'Rectangle (area)',
    data: { type: 'rectangle', dimensions: { width: 12, height: 5 }, labels: [{ text: '12 cm', position: 'bottom' }, { text: '5 cm', position: 'right' }] },
  },
  {
    label: 'Right triangle (Pythagoras)',
    data: { type: 'rightTriangle', dimensions: { width: 3, height: 4 }, labels: [{ text: '3 cm', position: 'bottom' }, { text: '4 cm', position: 'left' }, { text: '? cm', position: 'hypotenuse' }] },
  },
  {
    label: 'Circle (area/circumference)',
    data: { type: 'circle', dimensions: { radius: 7 }, labels: [{ text: '7 cm', position: 'radius' }] },
  },
  {
    label: 'Cylinder (volume)',
    data: { type: 'cylinder', dimensions: { radius: 5, height: 12 }, labels: [{ text: '5 cm', position: 'radius' }, { text: '12 cm', position: 'height' }] },
  },
  {
    label: 'Cuboid (volume)',
    data: { type: 'cuboid', dimensions: { width: 8, height: 4, depth: 3 }, labels: [{ text: '8 cm', position: 'bottom' }, { text: '4 cm', position: 'right' }, { text: '3 cm', position: 'length' }] },
  },
  {
    label: 'Angles on a line',
    data: { type: 'anglesOnLine', dimensions: { angle1: 65 }, labels: [{ text: '65°', position: 'top' }, { text: '?', position: 'bottom' }] },
  },
  {
    label: 'Triangle angles',
    data: { type: 'triangleAngles', dimensions: { angle1: 50, angle2: 70, angle3: 60 }, labels: [{ text: '50°', position: 'bottom' }, { text: '70°', position: 'bottom' }, { text: '?', position: 'top' }] },
  },
  {
    label: 'Parallelogram (area)',
    data: { type: 'parallelogram', dimensions: { base: 10, height: 6, slant: 8 }, labels: [{ text: '10 cm', position: 'bottom' }, { text: '6 cm', position: 'height' }] },
  },
];

// ─── Types ────────────────────────────────────────────────────────────────────

interface LabelRow {
  text: string;
  position: string;
  offsetX: string;
  offsetY: string;
}

export interface DiagramBuilderProps {
  /** Initial diagram data (for editing existing diagrams) */
  initialData?: DiagramData;
  /** Called whenever the diagram data changes — parent can use for live preview outside this component */
  onChange?: (data: DiagramData) => void;
}

// ─── Component ───────────────────────────────────────────────────────────────

export default function DiagramBuilder({ initialData, onChange }: DiagramBuilderProps) {
  const [selectedType, setSelectedType] = useState<DiagramType>(initialData?.type ?? 'rectangle');
  const [dimensions, setDimensions] = useState<DiagramDimensions>(initialData?.dimensions ?? {});
  const [labels, setLabels] = useState<LabelRow[]>(
    initialData?.labels?.map(l => ({
      text: l.text,
      position: l.position,
      offsetX: l.offset?.x?.toString() ?? '',
      offsetY: l.offset?.y?.toString() ?? '',
    })) ?? []
  );
  const [theoremType, setTheoremType] = useState<string>(
    (initialData?.dimensions as any)?.theoremType ?? ''
  );
  const [fillColor, setFillColor] = useState(initialData?.style?.fill ?? '');
  const [strokeColor, setStrokeColor] = useState(initialData?.style?.stroke ?? '#1f2937');
  const isMounted = useRef(false);

  // Build the DiagramData from current state
  const buildDiagramData = useCallback((): DiagramData => {
    const fields = SHAPE_FIELDS[selectedType] ?? [];
    const resolvedDims: DiagramDimensions = { ...dimensions };

    // Compute derived (read-only) fields
    fields.forEach(f => {
      if (f.readOnly && f.derived) {
        const val = f.derived(resolvedDims);
        if (val !== undefined) (resolvedDims as any)[f.key] = val;
      }
    });

    // Attach theorem type for circleTheorem
    if (selectedType === 'circleTheorem' && theoremType) {
      (resolvedDims as any).theoremType = theoremType;
    }

    const labelObjects: DiagramLabel[] = labels
      .filter(l => l.text.trim())
      .map(l => ({
        text: l.text,
        position: l.position as DiagramLabel['position'],
        ...(l.offsetX || l.offsetY
          ? { offset: { x: parseFloat(l.offsetX) || 0, y: parseFloat(l.offsetY) || 0 } }
          : {}),
      }));

    return {
      type: selectedType,
      dimensions: resolvedDims,
      labels: labelObjects.length > 0 ? labelObjects : undefined,
      style: {
        ...(fillColor ? { fill: fillColor } : {}),
        stroke: strokeColor || '#1f2937',
      },
    };
  }, [selectedType, dimensions, labels, theoremType, fillColor, strokeColor]);

  const diagramData = buildDiagramData();
  const validation = validateDiagram(diagramData);

  // Notify parent on change — skip the initial mount fire to avoid
  // overwriting a null diagram_data with a default empty shape.
  useEffect(() => {
    if (!isMounted.current) {
      isMounted.current = true;
      return;
    }
    onChange?.(diagramData);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selectedType, dimensions, labels, theoremType, fillColor, strokeColor]);

  function handleTypeChange(type: DiagramType) {
    setSelectedType(type);
    setDimensions({});
    setLabels([]);
    setTheoremType('');
  }

  function handleDimensionChange(key: keyof DiagramDimensions, value: string) {
    const num = parseFloat(value);
    setDimensions(prev => ({
      ...prev,
      [key]: value === '' ? undefined : isNaN(num) ? undefined : num,
    }));
  }

  function applyPreset(preset: (typeof PRESETS)[number]) {
    setSelectedType(preset.data.type);
    setDimensions(preset.data.dimensions);
    setLabels(
      preset.data.labels?.map(l => ({
        text: l.text,
        position: l.position,
        offsetX: '',
        offsetY: '',
      })) ?? []
    );
    setTheoremType((preset.data.dimensions as any).theoremType ?? '');
  }

  function addLabel() {
    setLabels(prev => [...prev, { text: '', position: 'bottom', offsetX: '', offsetY: '' }]);
  }

  function updateLabel(index: number, field: keyof LabelRow, value: string) {
    setLabels(prev => prev.map((l, i) => (i === index ? { ...l, [field]: value } : l)));
  }

  function removeLabel(index: number) {
    setLabels(prev => prev.filter((_, i) => i !== index));
  }

  const fields = SHAPE_FIELDS[selectedType] ?? [];
  const isGridType = ['coordinateGrid', 'reflectionGrid', 'translationGrid', 'rotationGrid', 'enlargementDiagram'].includes(selectedType);

  return (
    <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
      {/* ── Left: Controls ── */}
      <div className="space-y-6">

        {/* Presets */}
        <div>
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Quick Presets</label>
          <div className="flex flex-wrap gap-2">
            {PRESETS.map(p => (
              <button
                key={p.label}
                onClick={() => applyPreset(p)}
                className="rounded-md bg-indigo-50 px-2 py-1 text-xs font-medium text-indigo-700 hover:bg-indigo-100"
              >
                {p.label}
              </button>
            ))}
          </div>
        </div>

        {/* Shape type selector */}
        <div>
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Shape Type</label>
          {SHAPE_CATEGORIES.map(cat => (
            <div key={cat.label} className="mb-3">
              <div className="mb-1 text-xs font-medium text-gray-400">{cat.label}</div>
              <div className="flex flex-wrap gap-1">
                {cat.types.map(type => (
                  <button
                    key={type}
                    onClick={() => handleTypeChange(type)}
                    className={`rounded px-2 py-1 text-xs font-medium transition-colors ${
                      selectedType === type
                        ? 'bg-indigo-600 text-white'
                        : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                    }`}
                  >
                    {type}
                  </button>
                ))}
              </div>
            </div>
          ))}
        </div>

        {/* Circle theorem type */}
        {selectedType === 'circleTheorem' && (
          <div>
            <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Theorem Type</label>
            <select
              value={theoremType}
              onChange={e => setTheoremType(e.target.value)}
              className="w-full rounded-md border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500"
            >
              <option value="">— select —</option>
              {CIRCLE_THEOREM_TYPES.map(t => <option key={t} value={t}>{t}</option>)}
            </select>
          </div>
        )}

        {/* Dimensions */}
        {!isGridType && fields.length > 0 && (
          <div>
            <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Dimensions</label>
            <div className="space-y-2">
              {fields.map(field => {
                const derived = field.derived ? field.derived(dimensions) : undefined;
                const displayValue = field.readOnly
                  ? (derived !== undefined ? derived.toString() : '')
                  : ((dimensions as any)[field.key]?.toString() ?? '');
                return (
                  <div key={field.key as string} className="flex items-center gap-3">
                    <label className="w-48 text-sm text-gray-700">{field.label}</label>
                    <input
                      type="number"
                      step="any"
                      min="0"
                      value={displayValue}
                      readOnly={field.readOnly}
                      placeholder={field.placeholder ?? '0'}
                      onChange={e => !field.readOnly && handleDimensionChange(field.key, e.target.value)}
                      className={`w-28 rounded-md border px-3 py-1.5 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 ${
                        field.readOnly
                          ? 'border-gray-200 bg-gray-50 text-gray-500'
                          : 'border-gray-300 bg-white'
                      }`}
                    />
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {isGridType && (
          <div className="rounded-lg bg-amber-50 p-4 text-sm text-amber-800">
            Grid and transformation diagrams are authored via JSON. Use the JSON output below to construct the diagram data.
          </div>
        )}

        {/* Labels */}
        <div>
          <div className="mb-1 flex items-center justify-between">
            <label className="text-xs font-semibold uppercase tracking-wide text-gray-500">Labels</label>
            <button
              onClick={addLabel}
              className="rounded bg-indigo-100 px-2 py-0.5 text-xs font-medium text-indigo-700 hover:bg-indigo-200"
            >
              + Add label
            </button>
          </div>
          {labels.length === 0 && (
            <p className="text-xs text-gray-400">No labels yet. Click &ldquo;Add label&rdquo; to add one.</p>
          )}
          <div className="space-y-2">
            {labels.map((label, i) => (
              <div key={i} className="flex items-center gap-2">
                <input
                  type="text"
                  value={label.text}
                  placeholder="Label text"
                  onChange={e => updateLabel(i, 'text', e.target.value)}
                  className="w-28 rounded border border-gray-300 px-2 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
                />
                <select
                  value={label.position}
                  onChange={e => updateLabel(i, 'position', e.target.value)}
                  className="w-36 rounded border border-gray-300 px-2 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
                >
                  {LABEL_POSITIONS.map(p => <option key={p} value={p}>{p}</option>)}
                </select>
                <input
                  type="number"
                  value={label.offsetX}
                  placeholder="dx"
                  onChange={e => updateLabel(i, 'offsetX', e.target.value)}
                  className="w-12 rounded border border-gray-300 px-1 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
                />
                <input
                  type="number"
                  value={label.offsetY}
                  placeholder="dy"
                  onChange={e => updateLabel(i, 'offsetY', e.target.value)}
                  className="w-12 rounded border border-gray-300 px-1 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
                />
                <button
                  onClick={() => removeLabel(i)}
                  className="rounded px-1 py-1 text-xs text-red-400 hover:text-red-600"
                >
                  ✕
                </button>
              </div>
            ))}
          </div>
        </div>

        {/* Style */}
        <div>
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Style (optional)</label>
          <div className="flex gap-4">
            <div className="flex items-center gap-2">
              <label className="text-xs text-gray-600">Fill</label>
              <input
                type="text"
                value={fillColor}
                placeholder="e.g. #e0f2fe"
                onChange={e => setFillColor(e.target.value)}
                className="w-28 rounded border border-gray-300 px-2 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
              />
            </div>
            <div className="flex items-center gap-2">
              <label className="text-xs text-gray-600">Stroke</label>
              <input
                type="text"
                value={strokeColor}
                placeholder="#1f2937"
                onChange={e => setStrokeColor(e.target.value)}
                className="w-28 rounded border border-gray-300 px-2 py-1 text-xs focus:outline-none focus:ring-1 focus:ring-indigo-500"
              />
            </div>
          </div>
        </div>

        {/* Validation */}
        <div>
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Validation</label>
          {validation.errors.length === 0 && validation.warnings.length === 0 ? (
            <div className="flex items-center gap-1 text-sm text-green-700">
              <span>✓</span><span>No issues</span>
            </div>
          ) : (
            <div className="space-y-1">
              {validation.errors.map((e, i) => (
                <div key={i} className="flex items-start gap-1 text-sm text-red-700">
                  <span className="mt-0.5 shrink-0">✕</span><span>{e}</span>
                </div>
              ))}
              {validation.warnings.map((w, i) => (
                <div key={i} className="flex items-start gap-1 text-sm text-amber-700">
                  <span className="mt-0.5 shrink-0">⚠</span><span>{w}</span>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* JSON output */}
        <div>
          <label className="mb-1 block text-xs font-semibold uppercase tracking-wide text-gray-500">Diagram JSON</label>
          <pre className="max-h-48 overflow-auto rounded-md bg-gray-900 p-3 text-xs text-green-400">
            {JSON.stringify(diagramData, null, 2)}
          </pre>
          <button
            onClick={() => navigator.clipboard.writeText(JSON.stringify(diagramData))}
            className="mt-1 rounded bg-gray-100 px-2 py-1 text-xs text-gray-600 hover:bg-gray-200"
          >
            Copy JSON
          </button>
        </div>
      </div>

      {/* ── Right: Live Preview ── */}
      <div className="sticky top-4">
        <label className="mb-2 block text-xs font-semibold uppercase tracking-wide text-gray-500">Live Preview</label>
        <div className="rounded-xl border-2 border-gray-200 bg-gray-50 p-6">
          <GeometryDiagram data={diagramData} />
        </div>
        <p className="mt-2 text-xs text-gray-400">
          This is exactly what students will see on the display page.
        </p>
        {!validation.valid && (
          <div className="mt-2 rounded-md bg-red-50 px-3 py-2 text-xs font-medium text-red-700">
            ⚠ Diagram has validation errors — fix before saving
          </div>
        )}
      </div>
    </div>
  );
}
