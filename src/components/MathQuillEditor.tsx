'use client'

import { useEffect, useRef } from 'react'

// Declare global types for jQuery and MathQuill
declare global {
  interface Window {
    jQuery: any
    $: any
    MathQuill: any
    MQ: any
  }
}

interface MathQuillEditorProps {
  value: string
  onChange: (latex: string) => void
  placeholder?: string
  className?: string
}

export default function MathQuillEditor({ 
  value, 
  onChange, 
  placeholder = 'Type math here...',
  className = ''
}: MathQuillEditorProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const mathFieldRef = useRef<any>(null)
  const isUpdatingRef = useRef(false)
  const scriptsLoadedRef = useRef(false)

  useEffect(() => {
    // Load jQuery and MathQuill scripts dynamically
    async function loadScripts() {
      if (scriptsLoadedRef.current) return
      
      return new Promise((resolve, reject) => {
        // Load jQuery first
        const jqueryScript = document.createElement('script')
        jqueryScript.src = '/jquery.min.js'
        jqueryScript.onload = () => {
          // Then load MathQuill
          const mqScript = document.createElement('script')
          mqScript.src = '/mathquill/mathquill.js'
          mqScript.onload = () => {
            scriptsLoadedRef.current = true
            resolve(true)
          }
          mqScript.onerror = reject
          document.head.appendChild(mqScript)
        }
        jqueryScript.onerror = reject
        document.head.appendChild(jqueryScript)
      })
    }

    async function initializeMathQuill() {
      try {
        await loadScripts()
        
        if (containerRef.current && !mathFieldRef.current && window.MathQuill) {
          const MQ = window.MathQuill.getInterface(2)
          window.MQ = MQ
          
          const mathField = MQ.MathField(containerRef.current, {
            spaceBehavesLikeTab: true,
            leftRightIntoCmdGoes: 'up',
            restrictMismatchedBrackets: true,
            sumStartsWithNEquals: true,
            supSubsRequireOperand: false,
            charsThatBreakOutOfSupSub: '+-=<>',
            autoSubscriptNumerals: true,
            autoCommands: 'pi theta sqrt sum integral alpha beta gamma delta epsilon lambda mu sigma omega',
            autoOperatorNames: 'sin cos tan sec csc cot log ln exp',
            handlers: {
              edit: function() {
                if (!isUpdatingRef.current && mathFieldRef.current) {
                  const latex = mathFieldRef.current.latex()
                  onChange(latex)
                }
              }
            }
          })

          mathFieldRef.current = mathField

          // Set initial value
          if (value) {
            isUpdatingRef.current = true
            mathField.latex(value)
            isUpdatingRef.current = false
          }
        }
      } catch (error) {
        console.error('Failed to load MathQuill:', error)
      }
    }

    initializeMathQuill()

    // Cleanup
    return () => {
      if (mathFieldRef.current) {
        try {
          // MathQuill cleanup
          const container = containerRef.current
          if (container) {
            container.innerHTML = ''
          }
        } catch (e) {
          // Ignore cleanup errors
        }
        mathFieldRef.current = null
      }
    }
  }, []) // Only run once on mount

  // Update value when prop changes externally
  useEffect(() => {
    if (mathFieldRef.current && value !== mathFieldRef.current.latex()) {
      isUpdatingRef.current = true
      mathFieldRef.current.latex(value || '')
      isUpdatingRef.current = false
    }
  }, [value])

  return (
    <div className={`mathquill-editor-wrapper ${className}`}>
      <div 
        ref={containerRef}
        className="mathquill-editable"
        data-placeholder={placeholder}
      />
      <style jsx>{`
        .mathquill-editor-wrapper {
          position: relative;
        }
        
        .mathquill-editable {
          border: 1px solid #d1d5db;
          border-radius: 0.375rem;
          padding: 0.75rem;
          min-height: 6rem;
          font-size: 1.125rem;
          line-height: 1.75rem;
          background: white;
          cursor: text;
          width: 100%;
          max-width: 100%;
        }

        .mathquill-editable:focus-within {
          outline: 2px solid #6366f1;
          outline-offset: 2px;
          border-color: #6366f1;
        }

        .mathquill-editable.mq-focused {
          border-color: #6366f1;
        }

        /* Placeholder styling */
        .mathquill-editable.mq-empty::after {
          content: attr(data-placeholder);
          color: #9ca3af;
        }
      `}</style>
    </div>
  )
}
