# Markov target: statement and literature-status audit

Audit date: 13 October 2026. Read-only research; no project files or retired material used. This report fixes the mathematical target and records literature status. It supplies no conjecture proof strategy.

## Exact source target

Source: Evans–Veselov–Winn, [*Arithmetic and geometry of Markov polynomials*](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html), §§2–3 and Definitions 6.1–6.2 / Conjecture 6.3. [ArXiv history](https://arxiv.org/abs/2501.14882): v1 24 January 2025; v2 25 March 2025; current v3 7 July 2025.

Generate the Laurent-polynomial family from independent indeterminates `(x,y,z)` by coordinate permutations and mutations

\[
(X,Y,Z)\longmapsto (X,Y,(X^2+Y^2)/Z).
\]

Use the paper's Farey/Conway labeling, reduced \(\rho=a/b\in[0,1]\), normalized by

\[
M_{0/1}=x,\qquad M_{1/1}=(x^2+y^2)/z,\qquad
M_{1/2}=((x^2+y^2)^2+x^2z^2)/(yz^2).
\]

For \(a,b>0\), \(\gcd(a,b)=1\), \(a\le b\), put \(d=a+b-1\). Equations (7), (9) give

\[
M_{a/b}(x,y,z)=
\frac{P_{a/b}(x^2,y^2,z^2)}{x^{a-1}y^{b-1}z^d},\qquad
P_{a/b}(u,v,w)=\sum_{i,j\ge0,\ i+j\le d} A_{ij}u^iv^jw^{d-i-j},
\quad A_{ij}\in\mathbb N.
\]

Let \(\Delta=\operatorname{conv}\{(i,j):A_{ij}\ne0\}\subset\mathbb R^2\). Theorem 3.2 describes it by

\[
i,j\ge0,\qquad bi+aj\ge ab,\qquad i+j\le d.
\]

The endpoint has \(P_{0/1}=1\). Conjecture 6.3 asserts weak log-concavity: horizontal, vertical and constant-\(i+j\) coefficient sequences are log-concave, using the ordinary, unnormalized coefficients.

## Precise audit formulation

For every reduced parameter above, every lattice point \(p\in\mathbb Z^2\), and

\[
v\in\{(1,0),(0,1),(1,-1)\},
\]

require

\[
p-v,p,p+v\in\Delta\cap\mathbb Z^2
\quad\Longrightarrow\quad
A(p)^2\ge A(p-v)A(p+v).
\tag{LC}
\]

This is the local-inequality transcription of the source definition; it is not a proof. A formal implementation must identify its generated polynomials with the source family and its coefficient function with the displayed numerator expansion.

The following are audit consequences of this formulation:

- Include every lattice point along the line segment, including coefficients equal to zero. Removing zero entries before testing changes the predicate.
- Only centers with both neighbors in the polygon carry an inequality. Segments with fewer than three points contribute no obligations. The inequality is non-strict.
- Keep the \(0/1\) endpoint separate, or use integer exponents: natural-number subtraction would replace \(a-1=-1\) by zero and give the wrong Laurent normalization. The polygon inequality with division by \(a\) is also unavailable there.
- Homogeneity makes \(w=1\) lossless for the coefficient array: \(k=d-i-j\) is unique. Other specializations can combine coefficients and therefore need a separate equivalence argument.
- The Laurent exponent corresponding to \((i,j)\) is
  \((2i-a+1,\,2j-b+1,\,d-2i-2j)\).
  The three steps consequently become \((2,0,-2)\), \((0,2,-2)\), \((2,-2,0)\). Unit steps in the original exponent lattice test a different predicate because of parity gaps.
- Raw coefficients are required. Dividing coefficients by binomial or multinomial factors changes (LC).
- Replacing the three directions by all lattice directions, or requiring strict inequalities, strengthens the target. Conversely, one direction, finitely many slopes, or a named subfamily is only partial coverage.
- A mutation-reachability definition must not be silently replaced by arbitrary Laurent solutions of the generalized Markov equation: the source treats that classification separately (Conjecture 2.1).
- A zero extension outside \(\Delta\) can be equivalent, but its bridge uses nonnegativity and convexity. A support-only restriction and a polygon restriction are not definitionally interchangeable.
- A refutation requires an actual generated polynomial, valid neighboring indices and a strict reversed integer inequality. A failed estimate or a counterexample among unrelated nonnegative homogeneous polynomials does not refute (LC).

## Current literature status

The original paper proves the Markov–Fibonacci case (Theorem 6.4), the lines \(j=1\), \(i+j=a+b-2\) (Theorem 6.6), and \(i+j=a+b-3\) when \(a/b\le3/5\) (Theorem 6.7). These remain proper restrictions of (LC). [Source §6](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

A relevant later result is Sam J. Evans, [*Saturation of Markov Polynomials*](https://arxiv.org/abs/2604.18333), submitted **20 April 2026** (v1). It presents a proof that every integer lattice point of the numerator's Newton polygon has nonzero coefficient. Its [full text](https://arxiv.org/html/2604.18333v1) does not claim the coefficient log-concavity conjecture. This audit has checked the claimed result's scope, not independently verified its complete proof. Saturation should therefore no longer be presented as an untouched open target; it does not settle the inequalities in (LC).

François Bergeron's [*A (q,t)-Overview of q-Analogs*](https://arxiv.org/abs/2608.30979), submitted **31 August 2026**, discusses log-concavity experiments for a different two-parameter deformation in [§12](https://arxiv.org/html/2608.30979v1). It is not a resolution of the exact Evans–Veselov–Winn conjecture without an additional identification theorem; none was located here.

**Status conclusion:** No primary-source proof, refutation, or general strengthening of the exact Conjecture 6.3 was located as of **13 October 2026**. It appears to remain open. This is a qualified literature-search conclusion, not proof of the absence of an unpublished or poorly indexed resolution.

Searches covered the exact title/arXiv identifier, Conjecture 6.3, “log-concavity” / “log concavity” / “log-concave”, proof / counterexample / coefficients / saturation, author names, and 2026 follow-up papers. Sources inspected included the publisher text, arXiv version history, the saturation preprint, the later deformation survey, and an author's institutional publication listing. A cited 2025 thesis was not located in a primary full-text repository during this audit. Search-index coverage is therefore an explicit limitation.

## Acceptance boundary for subsequent machine output

A proof of (LC) for every source polynomial, with the normalization and indexing bridge established, resolves the stated conjecture. A verified special case, equivalent formulation, or rigorously checked counterexample is useful progress and must be described at its proved scope. Compilation of an unrelated inequality or a conditional theorem assuming the desired log-concavity does not resolve the target.
