# Dense certificate method and current scope

Machine-authored c9f23b44907d4f9aa7cfc15e4a2c4b47. This document describes
the candidate and validation architecture. Final acceptance is recorded separately.

The inherited `pairReducedMAD5(T,x,g,z)` is four signed products of small
integer-coefficient factors. Its relation to the cleared rational-pair inequality
is already proved in `MarkovFactorBridgeMAD5`; that reduction needs no change.
The previous direct ring expansions were too costly. We instead use an ordinary
kernel-computed coefficient certificate, without native evaluation axioms.

`DenseMC9F n` consists recursively of integer coefficients (n=0) or finite lists
of (n-1)-variable polynomials. Lists use ascending powers and Horner evaluation.
The four variable positions are x, g, z, T. Empty lists denote zero, and trailing
zero coefficients need not be removed. The small generic evaluator has proved
addition, multiplication, negation and nonnegativity laws. Multiplication is
schoolbook convolution, with a singleton case avoiding needless zero tails.

Python proposes explicit coefficient lists. Each concrete multiplication equality
is proved with `decide +kernel`; the Lean kernel computes the defined integer/list
operations and checks the equality. Python's output is not a trusted oracle.
The sign test checks every integer leaf, including zeros. The exact polynomial
evaluation identity returns to the inherited factor expression. Rational
nonnegative inputs imply the natural-parameter premise by casts, without changing
any source coefficient normalization.

Initial successful checks used one module per multiplication. Repeated imports
dominated runtime, so subsequent multiplications are batched. To stop the original
foreground drivers between operations, not-yet-started source files were held
under unique preserved names, then restored after the recorded missing-input
outcome. Group 0 had already started S5; it finished successfully and stopped at
held S6. Groups 1--3 stopped after S4. No Lean proof was interrupted, no source
was lost, no inherited artifact was changed. The redundant group-0 standalone S5
is excluded from the selected replay because the corresponding batch starts at
S4. Details: evidence/markov-c9f23b44/batch-suspension.json.

The inherited source chain is: reduced positivity -> positive-denominator
clearing -> rational symmetric-pair monotonicity -> normalized cut order with
zero-factor terms retained -> all truncation cuts -> LC-preserving weighting ->
raw lower horizontal source inequalities. The proposed final source theorem
keeps both r values, every q>=1, every row j<=q, and all natural columns.

The residual shape assertion `LowerRowShapeMFFD` is a different, stronger route
and is not silently inferred from raw horizontal log-concavity. The source result
can follow directly through the weighting route without proving that residual
CrossLC assertion. The other root clauses `ThreeOutsideLowerMFEE` and
`OtherFourM9E2` remain completely intact.

The publisher was checked through hosted browsing at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Equations
(5), (7)--(11), Definitions 6.1--6.2 and Conjecture 6.3 retain the pinned meaning:
raw numerator coefficients, all three specified directions and polygon triples.
No external source assertion is introduced as a Lean axiom. This source check
is not a novelty survey or the independent hash-bound completion audit.

Final scope freeze: the complete positivity certificate was not established.
Thirty-one selected modules have passed compilation and an audit of all 180
named theorem closures; joint replay is recorded separately. Products 0 and 1
reach multiplication 18 and products 2 and 3 reach multiplication 14 in that
selected core. The aggregate and source consequence are excluded.

A late diagnostic separates a large data construction from one arithmetic
identity. Its profiler reported about 12.86 seconds in the kernel for the
identity; the diagnostic module itself was rejected because its progress-print
commands had an IO/BaseIO typing error. That output is operational evidence only.
A subsequent candidate replaces rewrite-based evaluation bridges with direct
congrArg/transitivity terms. Its outcome must be read from the corresponding
receipt, not inferred from this optimization hypothesis.

Final observed status: Joint kernel replay passed. The late direct-congruence full-product attempt did not yield a successful matching build. The four complete products and aggregate remain unvalidated. No new source LC region or root completion is claimed. All foreground executions completed.
