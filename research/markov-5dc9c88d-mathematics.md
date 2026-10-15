# Mathematical checkpoint, request 5dc9c88d

Machine-authored live experimental research. The exact pinned proposition
`MathGKM.Markov.Conjecture63` remains unresolved. All statements below are
subject to their source-bound build, kernel replay and axiom receipts in
`evidence/markov-5dc9c88d/validation.json`. Generated candidate files alone
are not accepted mathematical results.

Write `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, and
`path=List.replicate n true ++ false :: rest`. All source coefficients here
are the protected integer `coeff (frame path).mid.p i j`. The fourth lower
slice has `i+j=a+4`, where `a=(frame path).mid.a`.

## Exact extraction and corrected canonical expression

`backward_three_coeffM5DC` proves a generic coefficient-extraction theorem
from `(1-X)^8 P=H0+X^n H1+X^(2n) H2+X^(3n) H3+X^(4n) H4`, with the explicit
degree bounds 12,12,13,14,15. For `n+5≤j≤4n+7`, it retains the reflected H4,
H3 and H2 contributions, with guards `j≤3n+6` and `j≤2n+5`. The discarded
H0 and H1 contributions are proved zero in this range, not omitted by fiat.

`source_fourth_backward_threeM5DC` applies this to the actual source for
every predecessor path with `c≥5`. It gives 24 times the raw coefficient,
with actual natural pattern counts and the inherited corrected H4 term.

`source_fourth_middle_correctedM5DC` establishes

    120960 * coeff P i j = middleRawValueM722 n c r j
                            + middleCorrectionM5DC n c r j

for every actual predecessor with `c≥5`, `n+5≤j≤3n+3`, and `i+j=a+4`.
It discharges all six Farey chambers using the existing source bridges and
reduced-label exclusions. `middleRawValueM722` selects the established low
or high polynomial at slope 1/2. The correction is exactly 5040 times the
guarded convolution of `reflect 13 H2` at `2n+5-j`. It vanishes for
`j≥2n+6`, as separately proved. No inequality for arbitrary predecessors
in this expanded range is inferred from the identity.

`MarkovH2CorrectionM5DC.lean` proves the explicit H2 reflection and five
polynomial correction formulas for `j=2n+1,...,2n+5`. Compilation and kernel
replay passed. `source_fourth_second_onset_valueM5DC` gives the actual raw
coefficients at all seven positions `2n+k`, `1≤k≤7`, for `n≥7,c≥5`, in
terms of `secondOnsetValueM5DC`. Thus the five remaining starts and their two
neighbors now have a single exact source adapter. The source adapter's final
replay/axiom status is recorded in validation.json. No onset inequality is
asserted by these identities.

## Proved numerator-one middle inequality

The inherited `middle_low_directM722` passed a new individual kernel replay
and axiom inspection. `source_fourth_middle_oneM5DC` connects it to actual
raw coefficients for every `c≥5`, `r=1`, `2n+6≤j≤3n`, and
`i+j+2=a+4`. It proves

    coeff P i (j+2) * coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2.

The common scale 120960 is canceled at all three positions; no coefficient
normalization or positivity assumption on individual coefficients is used.

`source_fourth_upper_oneM5DC` combines this with the inherited all-predecessor
final interval, giving every `2n+6≤j≤4n+5` when additionally `n≥7`.
`run_fourth_iff_five_oneM5DC` proves that, for `n≥7,c≥5,r=1`, the complete
polygon-guarded fourth-slice claim is equivalent to its five starts
`2n<j≤2n+5`. All three original polygon guards remain in the residual.

`root_iff_core_oneM5DC` proves an exact equivalence between the pinned root
and `InteriorCore63OneM5DC`. This removes only the newly proved numerator-one
middle region from the inherited residual. The residual proposition is
unproved; the equivalence does not resolve the root.

## Rejected attempts and experiments

General middle certificates were tried in both single-coefficient and grouped
layouts. Three initial single-coefficient builds timed out; three further
ones were interrupted when revising the layout. Two individual identities
later compiled and replayed, but they establish only two gap coefficients.
Both general grouped builds timed out at 450 seconds; the upper extreme
group timed out at 240 seconds. No universal general-chart inequality or
upper-extreme source inequality was obtained from these candidates.

The completed finite experiment checked 456 `(n,c,r)` cases: 4,674 middle
coefficient identities, 18,126 three-block identities, 3,306 valid middle
triples, 2,280 onset triples and 534 literal recurrence coefficients. There
were no failures. A larger experiment was interrupted during expensive
literal recurrence multiplication; only its completed checkpoint prefix is
recorded as partial evidence. None of these counts constitutes a proof.

The new symbolic onset experiment gives 20 candidate nonnegative polynomial
gap certificates: five starts in each of four predecessor charts. Each
general-chart gap has 585 terms, each extreme-chart gap 117 terms. These
require Lean value identities, gap identities and nonnegativity proofs before
they can be used. A tested simple affine reflection between low and high
middle shapes found no identity in the recorded finite search family.

Small runs, small predecessor cycles, general middle inequalities, the five
onset inequalities, higher slices and horizontal/vertical interiors remain
unresolved as applicable. No exact-root proof or refutation is claimed.
