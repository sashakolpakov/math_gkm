# Residual experiments and transport: independent scope audit

Date: 13 October 2026. Read-only mathematical review of developing machine output. No active files changed, no proof suggestions sent to the proposer, and no conjecture solved by this review.

## Recorded snapshots

| File | SHA256 |
| --- | --- |
| `evidence/markov/residuals.py` | `e23381799403a5f87ed075a8fa36831e145dfc6eb4f93357bc2defae93941fa0` |
| `evidence/markov/residual-result.json` | `d9c7a9c9dd9e33fada40ff2e016b7b25182157cefe3ed338ae90c269ab09bffd` |
| `evidence/markov/residual-coefficients.json` | `cd32a761833943f8ed6343869e6d176f63d37ac6080f77cd79f54a17639610c0` |
| `evidence/markov/stress.py` | `9557e269368b339aeb944719fbc55cfed8505d225e36c6f9c27683aa86f28332` |
| `evidence/markov/stress-result.json` | `cd261a1c994fe0a81ae14556f69022f3cf0dc81ee4cbfc7d43c2a5cffa7ca2be` |
| `evidence/markov/response-0006.json` | `efa75376881a4e643a3ddf335ed88c2ae27620092e4a66583c4499e816b9346d` |
| `MathGKM/MarkovLogConcavity.lean` | `458b5ff6169b3f09ceaed75a31f213a202257874620bda185a3752401a7a69a6` |

## Exact residual meaning

For a generated numerator of degree d=a+b−1, the script forms, for each integer 0≤r≤d,

\[
T_r(t)=\sum_{k=0}^{d-r} A_{k,d-r-k}t^k,
\qquad m_r=\max(d-2r,0).
\]

Thus r is the exponent of the omitted homogeneous variable w. The script attempts exact division by `(1+t)^m_r` and tests the resulting coefficient list. No variable-dependent coefficient normalization is performed.

The exponent is a prescribed nonnegative integer. It is **not** a measurement of the largest possible power dividing the diagonal polynomial. For r=2 it agrees with a+b−5 when that number is nonnegative. For 2r≥d there is no division, so the residual is the original diagonal polynomial. These cases remain in the scan.

The intended universal residual claim should include existence of an integer-polynomial quotient Q satisfying `T_r=(1+t)^m_r Q`, followed by its coefficient properties. A theorem merely conditional on divisibility would be weaker than the experimentally tested combined claim. The current prose's “after exact removal” presupposes this existence; it is not yet a formal definition.

The division code is mathematically exact: for ascending coefficients c₀,…,cₙ, it constructs q₀=c₀ and qₖ=cₖ−qₖ₋₁, then checks cₙ=qₙ₋₁. That is the coefficient identity for multiplication by 1+t. Repeating a verified step tests the stated power. Integer arithmetic is used throughout. A failure is recorded before further division; none is reported in either inspected result.

The lists retain leading, trailing and internal zeros. Zero diagonals are included and remain zero after division. The original list length and the bound on m prevent requesting division of a list with fewer than two positions. If division succeeds, the residual degree is at most min(r,d−r); the list need not have a nonzero coefficient in its final position.

## Tested predicate versus the Lean transport hypothesis

Both scripts test only:

\[
q_k\ge0,\qquad q_k^2\ge q_{k-1}q_{k+1}
\quad(1\le k<\text{list length}-1).
\]

They do not directly test all cross inequalities from the Lean definition

\[
\operatorname{CrossLC}(q):\quad
q_iq_{j+1}\le q_{i+1}q_j\quad\text{for every }i\le j,
\]

with zero extension outside the finite list. These predicates cannot be silently identified when zeros are allowed. Nonnegative adjacent log-concavity alone permits separated positive blocks; it does not supply the current Lean transport's hypothesis. Consequently the present residual conjecture, as worded, does not automatically imply the original diagonal inequalities by the proved `CrossLC` transport. A relation between the precise conjectured predicate and that hypothesis remains an explicit mathematical obligation.

This is a gap in a possible implication claim, not a counterexample to the residual conjecture or to Markov log-concavity. The reviewed response-0006 does not assert that the implication has been proved; it expressly limits the residual conjecture to one direction.

As an independent audit of the **saved denominator≤16 data only**, I checked the finite lists for internal zero gaps and the cross inequalities. Among 1,293 saved lists, 431 were identically zero; none had an internal gap between positive entries, and no cross-inequality failure occurred. This is an auditor's additional finite validation of those saved lists, not a machine-authored theorem, not a universal bridge, and not a verification of the unsaved 6,822 stress-test residual lists. It must not be attributed to the machine's original adjacent-only test.

The phrase “residual positivity” in response-0006 is loose: the code checks nonnegativity, and many lists are identically zero. The actual conjecture statement correctly says “nonnegative”. Strict positivity would contradict the recorded data.

## Finite evidence actually recorded

The first residual run uses the earlier 79 fractions with denominator at most 16. It reports 1,293 diagonal lists, no failed divisions, no negative residual coefficients and no failed adjacent inequalities. It also separately checks 2,018 critical-triangle coefficients for divisibility by 4.

The stress run reports:

| Quantity | Recorded count |
| --- | ---: |
| Reduced interior fractions, denominator≤28 | 241 |
| Original raw coefficient triples in all three principal directions | 229,476 |
| Upper-diagonal residual lists | 6,822 |
| Critical-triangle coefficients | 20,781 |

No failures are recorded. There are no equality examples among the tested valid raw triples, which is finite evidence only; it is not a universal strict-log-concavity theorem. The stress file correctly labels its result “finite exact computation only”. Its six displayed 17/28 residuals are examples, not a complete replacement for the omitted full residual dataset.

This review read the scripts and inspected their saved results. Apart from the explicitly identified audit of saved residual lists, it did not rerun the original experiments or independently certify every reported stress-test computation.

## Separate mathematical targets

1. **Published Conjecture 6.3:** the raw coefficients are log-concave along all three principal directions, on every source polynomial. The raw finite scan tests that predicate on a finite denominator range.
2. **Machine-selected residual conjecture:** exact prescribed-factor divisibility and nonnegative adjacent-log-concave residual coefficients on all upper diagonals. It is unproved, concerns only the constant-i+j direction, and has the transport issue above. Calling it “stronger” should not imply that it already entails all of Conjecture 6.3 or that its novelty has been established by a literature survey.
3. **Published factor-4 conjecture:** source Conjecture 8.1 requires `4 ∣ A_ij` when `i<a`, `j<b`, and `bi+aj>ab`. The scripts use exactly these strict conditions. This is an independent arithmetic property, not a consequence established by either log-concavity experiment. [Primary source §8](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
4. **Current third-diagonal Lean result:** the file proves an algebraic factorization of `SourceThird`, and states transport from the explicit assumption `ThirdDiagonalFormula l`. That assumption is a `Prop` definition, not an added axiom or a theorem already identifying every generated row. The current result remains conditional on this bridge for actual Markov coefficients.

The factor 4 in the separate polynomial gap certificate merely clears denominators. It must not be conflated with Conjecture 8.1's divisibility-by-4 assertion about critical-triangle coefficients.

## Acceptance conclusion

The experiments are meaningful finite tests and distinguish the named conjectures appropriately. No claim resolving full Conjecture 6.3 was found in the reviewed decisions or theorem comments. The substantive correction needed before any future implication claim is to keep adjacent residual log-concavity distinct from the `CrossLC` premise, particularly in the presence of zeros. Formal divisibility, full family coverage, the actual coefficient identification and the two remaining directions are separate unresolved obligations.
