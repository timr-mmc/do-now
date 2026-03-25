'use client';

import { useEffect, useRef } from 'react';
import katex from 'katex';

interface MathTextProps {
  text: string;
  className?: string;
}

/**
 * Component to render text with inline LaTeX math notation
 * Use $...$ for inline math: "Solve $x + 5 = 12$"
 * Use $$...$$ for display math: "$$\frac{1}{2} + \frac{1}{4} = \frac{3}{4}$$"
 */
export default function MathText({ text, className = '' }: MathTextProps) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!containerRef.current || !text) return;

    try {
      const container = containerRef.current;
      container.innerHTML = '';

      // Process display math first ($$...$$)
      let processedText = text;
      const displayParts: { index: number; content: string; isDisplay: boolean }[] = [];
      
      // Extract display math
      const displayRegex = /\$\$(.*?)\$\$/gs;
      let match;
      let lastIndex = 0;
      
      while ((match = displayRegex.exec(text)) !== null) {
        // Add text before display math
        if (match.index > lastIndex) {
          displayParts.push({
            index: lastIndex,
            content: text.substring(lastIndex, match.index),
            isDisplay: false
          });
        }
        // Add display math placeholder
        displayParts.push({
          index: match.index,
          content: match[1],
          isDisplay: true
        });
        lastIndex = match.index + match[0].length;
      }
      
      // Add remaining text
      if (lastIndex < text.length) {
        displayParts.push({
          index: lastIndex,
          content: text.substring(lastIndex),
          isDisplay: false
        });
      }
      
      // If no parts, it's all text
      if (displayParts.length === 0) {
        displayParts.push({ index: 0, content: text, isDisplay: false });
      }

      // Now process each part for inline math
      for (const part of displayParts) {
        if (part.isDisplay) {
          // Render display math
          const div = document.createElement('div');
          div.className = 'math-display my-2';
          try {
            katex.render(part.content, div, {
              throwOnError: false,
              displayMode: true,
            });
          } catch (e) {
            div.textContent = `$$${part.content}$$`;
          }
          container.appendChild(div);
        } else {
          // Process inline math in this text part
          const inlineRegex = /\$(.*?)\$/g;
          let inlineMatch;
          let inlineLastIndex = 0;
          
          while ((inlineMatch = inlineRegex.exec(part.content)) !== null) {
            // Add text before inline math
            if (inlineMatch.index > inlineLastIndex) {
              const textNode = document.createTextNode(
                part.content.substring(inlineLastIndex, inlineMatch.index)
              );
              container.appendChild(textNode);
            }
            
            // Render inline math
            const span = document.createElement('span');
            span.className = 'math-inline';
            try {
              katex.render(inlineMatch[1], span, {
                throwOnError: false,
                displayMode: false,
              });
            } catch (e) {
              span.textContent = `$${inlineMatch[1]}$`;
            }
            container.appendChild(span);
            inlineLastIndex = inlineMatch.index + inlineMatch[0].length;
          }
          
          // Add remaining text
          if (inlineLastIndex < part.content.length) {
            const textNode = document.createTextNode(
              part.content.substring(inlineLastIndex)
            );
            container.appendChild(textNode);
          }
        }
      }
    } catch (error) {
      // Fallback to plain text if anything fails
      console.error('MathText rendering error:', error);
      if (containerRef.current) {
        containerRef.current.textContent = text;
      }
    }
  }, [text]);

  return <div ref={containerRef} className={className} />;
}
