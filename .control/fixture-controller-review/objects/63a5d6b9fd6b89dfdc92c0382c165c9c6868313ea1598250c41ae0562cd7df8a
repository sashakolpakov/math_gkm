# Round 5 Markov target definition audit

Date: 13 October 2026. Scope: mathematical meaning of the newly written target, not a proof of the conjecture. Read-only review; no active-project edits, retired material, or proof-search advice.

Snapshots reviewed:

- `/Users/sasha/math_gkm/MathGKM/Markov.lean`, 58 lines, SHA256 `45904bfcef813a7b14369c824f5b7435d2fbc58ab0380dafd27ab2fc2bd3ce9f`.
- `/Users/sasha/math_gkm/evidence/markov/source-audit.md`, SHA256 `97e90023b52fffc3d8ae35aebfdcd6a61e8b2298aece39a0960828653bc136bd`.

Reference: [Evans–Veselov–Winn, published source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html), equations (5), (7)–(11), Definitions 6.1–6.2, Conjecture 6.3; also the earlier independent `/private/tmp/math_gkm_godel_20261013/markov_target_status_audit.md`.

**Finding:** no actual English/Lean mismatch was found in these target definitions. Their mathematical interpretation matches the intended conjecture, subject to the family-identification and coverage bridges listed below. No theorem proving `Conjecture63` occurs in this snapshot. The source prose correctly calls the indexing correspondence mathematically audited, not yet proved in Lean.

## Representation and normalization

Lines 9–13 use `Polynomial (Polynomial ℤ)`: the outer variable `U` is u, the coefficient-ring variable `V` is v. Consequently `(P.coeff i).coeff j` extracts the unscaled coefficient of u^i v^j. There is no factorial/binomial renormalization, parameter evaluation at u=v=1, or summation over a row.

Setting w=1 is appropriate for the source homogeneous numerator: degree d fixes the omitted exponent as d−i−j. This is the interpretation of this representation, not a homogeneity theorem already present in the Lean file. Using ℤ allows subtraction in the recurrence; it does not add a signed-polynomial hypothesis to the conjecture, which quantifies only over generated polynomials.

Line 26 supplies the correct normalized seed numerators: 1 at 0/1, `(U+V)^2+U` at 1/2, and `U+V` at 1/1. In particular the additional term for 1/2 is U, not V. These agree with the source after w=1.

## Path coverage and recurrence

`frame` quantifies over arbitrary finite Boolean lists, not a fixed depth or a single repeated-branch family. The empty list includes 1/2. The two branches give middle labels 1/3 and 2/3 at the first step; both endpoints are separately included in `Conjecture63`.

Mathematically these are the usual binary Farey refinements on [0,1]. With frame endpoints a/b and c/d and middle (a+c)/(b+d), the right branch has middle (a+2c)/(b+2d), and the left branch (2a+c)/(2b+d). The associated polynomial expressions in lines 31 and 34 match equation (8) and its exchanged-endpoint form, respectively, after w=1. The subtracted polynomial is the opposite endpoint, and its monomial uses the retained endpoint's exponents. No branch/index swap was found.

`Label` and `Frame` themselves have no validity conditions. This causes no scope enlargement in `Conjecture63`: it uses only `frame path`, which starts at `initial`. A future theorem for arbitrary frames would require its own hypotheses, but that is not the current statement.

## Polygon, directions, zeros and endpoints

Lines 38–39 use the source polygon inequality after clearing positive denominators: `a*b ≤ b*i+a*j`, and the upper bound `i+j ≤ a+b−1`. Natural indices supply i,j≥0. For actual positive-slope labels the subtraction by one is exact. At 0/1 the same formula gives i+j≤0, hence the singleton (0,0); it does not attempt to encode the Laurent factor x^(−1) using natural subtraction.

The three conjuncts of `WeakLC` test precisely these consecutive triples:

- `(i,j), (i+1,j), (i+2,j)`;
- `(i,j), (i,j+1), (i,j+2)`;
- `(i,j+2), (i+1,j+1), (i+2,j)`.

Their centers and neighbors correspond to directions (1,0), (0,1), (1,−1). Natural starting indices omit no valid triple inside the first quadrant. Reversing a direction gives the same inequality. In particular the third conjunct is the constant-i+j diagonal, not the increasing-i+j diagonal.

Every triple is guarded by polygon membership for all three positions. Coefficient zero is not filtered out, so internal missing coefficients remain tested. All inequalities are non-strict and compare the center square with the product of its two neighbors. Boundary positions without two neighbors impose no inequality. The 0/1 singleton and the two lattice positions at 1/1 are therefore correctly vacuous cases.

## Outstanding formal bridges, not discovered mismatches

The current file defines the following obligations but does not contain theorems establishing them:

1. Reachable labels have the intended positivity, coprimality and Farey relations, and every interior reduced rational has a path.
2. The path-generated integer polynomial is the corresponding source normalized numerator at w=1, including the degree interpretation that makes coefficient extraction lossless.
3. The displayed polygon formula agrees with the Newton polygon of that numerator.
4. If the final claim is expressed for every mutation-generated Laurent polynomial rather than the paper's [0,1] representatives, the variable-permutation identification preserves the coefficient predicate.

These are statement-identification bridges. Their absence does not make the draft target wrong or prevent useful experiments. It does mean that proving a property of the recursive objects, by itself, should not be described as an end-to-end Lean formalization of the paper before the adopted bridge is made explicit. External source theorems may be recorded as external contracts if that is the campaign's declared boundary; they should not be silently treated as existing Lean theorems.

## Claims audit

`Conjecture63` at lines 54–56 is a definition of a proposition. The file contains no proof of that proposition and makes no theorem claim for its instances. The doc comment says this explicitly.

The accompanying source audit correctly identifies the raw coefficients, the three directions, the endpoint, the missing Lean coverage theorem, and the distinction between the 2026 saturation result and coefficient log-concavity. Its proposed experiments do not assert a new mathematical result. No factual correction is needed for the two reviewed snapshots on the requested target-definition issues.

This review did not run a Lean build or use numerical tests as proof evidence. It is a semantic source audit of the recorded bytes. Later changes require a fresh hash-specific review.
