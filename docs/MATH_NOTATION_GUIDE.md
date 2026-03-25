# Mathematical Notation Guide 📐

## How to Write Questions with Proper Math Symbols

Your Do-Now application now supports **KaTeX** math rendering. You can write beautiful mathematical notation using LaTeX syntax.

## Basic Syntax

### Inline Math (within text)
Use single dollar signs: `$...$`

**Example:** 
```sql
'Solve $x + 5 = 12$ for $x$'
```
**Displays:** Solve *x* + 5 = 12 for *x*

### Display Math (centered, larger)
Use double dollar signs: `$$...$$`

**Example:**
```sql
'Simplify: $$\frac{3}{4} + \frac{1}{4}$$'
```
**Displays:** Large centered fraction ¾ + ¼

---

## Common Math Notation

### Fractions
```latex
$\frac{1}{2}$          → ½
$\frac{3}{4}$          → ¾
$\frac{numerator}{denominator}$
```

**Example Question:**
```sql
'Calculate: $\frac{1}{2} + \frac{1}{3}$'
'Answer: $\frac{5}{6}$'
```

### Square Roots
```latex
$\sqrt{4}$             → √4
$\sqrt{16}$            → √16
$\sqrt[3]{8}$          → ∛8 (cube root)
```

**Example Question:**
```sql
'Find the value of $\sqrt{144}$'
'Answer: $12$'
```

### Exponents (Powers)
```latex
$x^2$                  → x²
$2^3$                  → 2³
$x^{10}$               → x¹⁰ (use braces for multi-digit)
$10^{-3}$              → 10⁻³
```

**Example Question:**
```sql
'Simplify: $5^2 \times 5^3$'
'Answer: $5^5$ or $3125$'
```

### Subscripts
```latex
$x_1$                  → x₁
$a_{10}$               → a₁₀
```

### Greek Letters
```latex
$\pi$                  → π
$\theta$               → θ
$\alpha$               → α
$\beta$                → β
$\Delta$               → Δ
```

**Example Question:**
```sql
'Find the circumference of a circle with radius $7$cm (use $\pi = \frac{22}{7}$)'
```

---

## Operators and Symbols

### Basic Operations
```latex
$\times$               → ×
$\div$                 → ÷
$\pm$                  → ±
$\neq$                 → ≠
$\approx$              → ≈
$\leq$                 → ≤
$\geq$                 → ≥
```

**Example:**
```sql
'Calculate: $-6 \times 7$'
'The area is approximately $78.5$ cm$^2$ ($\approx 79$ cm$^2$)'
```

### Absolute Value
```latex
$|x|$                  → |x|
$|-5|$                 → |-5|
```

### Percentages
```latex
$25\%$                 → 25%
```

---

## Algebra Notation

### Equations
```latex
$2x + 5 = 17$
$y = mx + c$
$ax^2 + bx + c = 0$
```

**Example Questions:**
```sql
'Solve: $2x + 5 = 17$'
'Find the gradient of $y = 3x + 2$'
```

### Parentheses and Brackets
```latex
$(x + 3)(x + 5)$
$(2x + 1)^2$
\left(\frac{1}{2}\right)    → Use \left( and \right) for auto-sizing
```

---

## Geometry Notation

### Angles
```latex
$90°$  or  $90^\circ$  → 90°
$\angle ABC$           → ∠ABC
```

**Example:**
```sql
'Two angles in a triangle are $40^\circ$ and $60^\circ$. Find the third angle.'
'Answer: $80^\circ$'
```

### Length and Area Units
```latex
$5$ cm                 → 5 cm
$40$ cm$^2$            → 40 cm²
$60$ cm$^3$            → 60 cm³
```

---

## Statistics Notation

### Averages
```latex
$\bar{x}$              → x̄ (mean)
$\mu$                  → μ (population mean)
$\sigma$               → σ (standard deviation)
```

---

## Probability Notation

### Probability Symbols
```latex
$P(A)$                 → P(A)
$P(A \cap B)$          → P(A ∩ B) - AND
$P(A \cup B)$          → P(A ∪ B) - OR
```

**Example:**
```sql
'Find $P(\text{rolling a 3})$ on a fair dice'
'Answer: $\frac{1}{6}$'
```

---

## Examples by Topic

### NUMBER - Fractions
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Simplify: $\frac{12}{16}$', '$\frac{3}{4}$', 1),
(bank_id, 'Calculate: $\frac{1}{3} + \frac{1}{4}$', '$\frac{7}{12}$', 2),
(bank_id, 'Calculate: $2\frac{1}{2} + 1\frac{3}{4}$', '$4\frac{1}{4}$', 3);
```

### NUMBER - Powers
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Simplify: $5^2 \times 5^3$', '$5^5$ or $3125$', 1),
(bank_id, 'Write $3500$ in standard form', '$3.5 \times 10^3$', 1),
(bank_id, 'Calculate: $(2^3)^2$', '$2^6$ or $64$', 2);
```

### ALGEBRA - Equations
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Solve: $x + 7 = 12$', '$x = 5$', 1),
(bank_id, 'Solve: $2x + 5 = 17$', '$x = 6$', 2),
(bank_id, 'Solve: $\frac{x + 3}{2} = 7$', '$x = 11$', 3);
```

### GEOMETRY - Pythagoras
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Find the hypotenuse: sides $3$cm and $4$cm', '$5$cm', 1),
(bank_id, 'Use $a^2 + b^2 = c^2$ with $a=6$cm, $b=8$cm', '$10$cm', 2);
```

### MEASUREMENT - Circles
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Find the area of a circle with radius $5$cm ($\pi \approx 3.14$)', '$78.5$ cm$^2$', 1),
(bank_id, 'Find circumference: diameter $14$cm ($\pi = \frac{22}{7}$)', '$44$cm', 1);
```

### STATISTICS - Mean
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'Find the mean of: $3, 5, 7, 9, 11$', '$7$', 1),
(bank_id, 'The mean $\bar{x}$ of $x, 2x, 3x$ is $12$. Find $x$.', '$6$', 3);
```

### PROBABILITY - Fractions
```sql
INSERT INTO questions (bank_id, question_text, answer, difficulty) VALUES
(bank_id, 'A fair dice is rolled. Find $P(\text{rolling a 3})$', '$\frac{1}{6}$', 1),
(bank_id, 'Two coins flipped. Find $P(\text{both heads})$', '$\frac{1}{4}$', 2);
```

---

## Tips for Writing Good Questions

1. **Use variables in italics:** Write `$x$` not just `x`
2. **Use proper multiplication:** Write `$3 \times 4$` not `3 x 4`
3. **Use proper division:** Write `$\div$` or fractions, not `/`
4. **Use proper exponents:** Write `$x^2$` not `x^2` or `x2`
5. **Include units:** Write `$5$ cm` or `$40$ cm$^2$`
6. **Test your notation:** Preview questions in the app before using with students

---

## Quick Reference Table

| Want to Show | Write This | Result |
|--------------|------------|--------|
| Fraction | `$\frac{1}{2}$` | ½ |
| Square root | `$\sqrt{9}$` | √9 |
| Exponent | `$x^2$` | x² |
| Multiply | `$\times$` | × |
| Divide | `$\div$` | ÷ |
| Not equal | `$\neq$` | ≠ |
| Approximately | `$\approx$` | ≈ |
| Less/equal | `$\leq$` | ≤ |
| Greater/equal | `$\geq$` | ≥ |
| Degrees | `$90^\circ$` | 90° |
| Pi | `$\pi$` | π |
| Infinity | `$\infty$` | ∞ |

---

## More Advanced Features

### Matrices
```latex
$$\begin{bmatrix} 1 & 2 \\ 3 & 4 \end{bmatrix}$$
```

### Aligned Equations
```latex
$$\begin{aligned}
2x + 5 &= 17 \\
2x &= 12 \\
x &= 6
\end{aligned}$$
```

### Piecewise Functions
```latex
$$f(x) = \begin{cases} x^2 & \text{if } x \geq 0 \\ -x & \text{if } x < 0 \end{cases}$$
```

---

## Testing Your Questions

1. Add a question with LaTeX notation to your database
2. Create a Do-Now session with that question
3. View it on the projector display
4. Check if the math renders correctly
5. Adjust notation if needed

---

## Resources

- **Full KaTeX Documentation:** https://katex.org/docs/supported.html
- **Interactive LaTeX Editor:** https://www.codecogs.com/latex/eqneditor.php
- **Math Symbol Lookup:** https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols

---

## Need Help?

If a symbol doesn't render correctly:
1. Check the KaTeX supported functions: https://katex.org/docs/support_table.html
2. Verify your dollar signs are matched: `$...$` or `$$...$$`
3. Use `\text{...}` for regular text inside math: `$P(\text{red ball})$`
4. Escape special characters with backslash: `\$100` to show literal dollar sign
