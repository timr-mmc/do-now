'use client'

interface OnboardingTooltipProps {
  message: string
  subtext?: string
  onDismiss?: () => void
  /** Which side of the bubble the arrow points from. 'up' = arrow on top (bubble below target). */
  arrowSide?: 'top' | 'bottom'
}

/**
 * A floating callout bubble for onboarding hints.
 * Wrap the target element in a `<div className="relative">` and render this as a sibling.
 */
export default function OnboardingTooltip({
  message,
  subtext,
  onDismiss,
  arrowSide = 'top',
}: OnboardingTooltipProps) {
  return (
    <div
      className={`absolute z-50 w-64 ${arrowSide === 'top' ? 'top-full mt-3' : 'bottom-full mb-3'} left-1/2 -translate-x-1/2 pointer-events-auto`}
      role="tooltip"
    >
      {/* Arrow */}
      {arrowSide === 'top' && (
        <div className="absolute -top-2 left-1/2 -translate-x-1/2 w-0 h-0 border-l-8 border-r-8 border-b-8 border-l-transparent border-r-transparent border-b-indigo-500" />
      )}
      {arrowSide === 'bottom' && (
        <div className="absolute -bottom-2 left-1/2 -translate-x-1/2 w-0 h-0 border-l-8 border-r-8 border-t-8 border-l-transparent border-r-transparent border-t-indigo-500" />
      )}

      {/* Bubble */}
      <div className="relative rounded-xl border border-indigo-200 bg-white shadow-xl ring-1 ring-indigo-100 px-4 py-3">
        {/* Accent bar */}
        <div className="absolute left-0 top-3 bottom-3 w-1 rounded-full bg-indigo-500" />

        <div className="pl-3">
          <p className="text-sm font-semibold text-gray-900">{message}</p>
          {subtext && <p className="mt-0.5 text-xs text-gray-500">{subtext}</p>}
        </div>

        {onDismiss && (
          <button
            onClick={onDismiss}
            className="absolute right-2 top-2 rounded p-0.5 text-gray-400 hover:text-gray-600 hover:bg-gray-100 transition-colors"
            aria-label="Dismiss hint"
          >
            <svg className="h-3.5 w-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        )}
      </div>
    </div>
  )
}
