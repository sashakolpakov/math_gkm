# Fourth-slice two-block extraction and onset

Machine-authored live request `1b02dddc008a41708b03d1cb474e0824`.
The exact root remains open. Only successful source-bound entries in the final
validation inventory are claimed as checked results.

For an actual predecessor `rest`, let c=(frame rest).mid.b and
r=(frame rest).mid.a. Let the run source be
`List.replicate n true ++ false :: rest`, with labels a=nc+r, b=a+c.
The fourth lower slice consists of coefficients at i+j=a+4. We retain the
literal integer coefficients, including zeros.

The inherited exact numerator identity is

    (1-X)^8 P = H0 + X^n H1 + X^(2n) H2 + X^(3n) H3 + X^(4n) H4,

where P is 24 times the actual cut polynomial, and H4 includes the
natural-count correction. The respective degree bounds are 12,12,13,14,15.

## Two-block theorem

The new general theorem `backward_two_coeffM1B` assumes

    (1-X)^8 P = L + X^(3n) H3 + X^(4n) H4,
    deg L ≤ j+7, deg H3 ≤ 14, deg H4 ≤ 15, j ≤ 4n+7.

It proves the exact identity

    P[j] = conv(reflect15 H4, 4n+7-j)
         + if j≤3n+6 then conv(reflect14 H3, 3n+6-j) else 0,

where conv(Q,t)=sum_{d=0}^t Q[d] binom(7+t-d,7). The proof groups the
two highest blocks, applies the variable-degree backwards theorem, and
reflects their sum. Reflection of H3 is padded by X^(n+1); the shifted
convolution is proved with an explicit zero branch. Natural subtraction
is used only under its checked guards. The case P=0 is retained.

`source_fourth_backward_twoM1B` instantiates this with the actual source
and the lower three blocks as L. Their degree bound holds for j≥2n+6.
Thus this exact source formula covers every 2n+6≤j≤4n+7 and c≥5.
It is not a log-concavity theorem by itself.

## Third-block onset construction

At j=3n+k the two convolution indices are n+7-k and 6-k.
The first convolution is given by the already checked backShape formula;
the second is a short exact correction for k=1,...,6 and zero for k≥7.
`pen_reflectM1B` identifies the entire reflected H3 polynomial, and its
six coefficient-sum theorems identify those corrections. All six predecessor
chambers preserve the original natural counts.

The eight consecutive values at k=1,...,8 are represented by onsetValue.
After c and r are expressed in nonnegative Farey chamber coordinates and
n=N+7 with N≥0, each of the six adjacent gaps has a nonnegative integer
polynomial certificate. The exact gap identities are staged by powers of N.
Columns 13 and 14 are explicitly checked even when their values vanish.
The staged proof does not infer identities from a numerical scan or omit
zero top columns. All three coefficients use the same factor 7560=24*315.

This construction is intended to establish raw fourth-slice log-concavity at
all six starting positions j=3n+1,...,3n+6, for arbitrary n≥7 and actual c≥5.
The final validation inventory determines which generated pieces have passed.

## Experiments

Exact Python experiments over 536 specified (n,c,r) cases passed 14,740
two-block coefficient identities, 4,288 onset coefficient identities,
3,216 polygon-valid onset triples and 560 literal source recurrence
coefficient comparisons. The two-block checks include 804 zero values.
The exact inputs, counts and elapsed time are in
`evidence/markov-1b02dddc/experiments.json`. These are finite checks only.

## Remaining obligations

Even successful onset assembly leaves the earlier fourth-slice middle block,
small runs, small predecessor cycles, higher slices and both axial interiors.
It does not resolve the full pinned root or its negation. Source coverage,
source-family identification, homogeneity, Newton polygon, directions and
endpoints must all be discharged before any root completion claim.

## Revised accepted route and explicit candidate boundary

The combined six-offset staged gap modules did not pass their bounded builds.
They are candidates only, and the broad OnsetAll/AfterMiddle draft assembly is
not imported by the accepted route. All 48 coefficient identities (six chambers,
eight offsets) did compile. The selected inequality proof is only offset k=6.
Its correction is zero for chambers 0–3 and is
30240(3r−2c)(3−r+n(6−c)) in chambers 4–5. For c≥6, it is nonpositive;
raw_coeff_nonneg18 supplies nonnegativity of the other endpoint. This reduces
the corrected inequality to the inherited checked backShape gap. The c=5 high
chamber forces r=4 and has a separate nonnegative univariate gap certificate.
Final source-bound validation determines the status of the assembled results.

The new generic reflect_five_blocksM1B and backward_five_blocksM1B compiled.
They establish the previous run’s proposed full reflected decomposition exactly,
including the distinct padding exponent 4n+3 for H0. Their hypotheses are the
explicit numerator identity and block degree bounds; they do not assert an
inequality. The actual-source two-block theorem discharges the source bridge
for its stated interval.

## Assembled result

source_fourth_onset_sixM1B compiled for all actual predecessors with c>=5
and every n>=7. It establishes the raw fourth-slice inequality at j=3n+6.
source_fourth_final_sixM1B combines this with the inherited final interval,
covering 3n+6<=j<=4n+5. No polygon, positive-coefficient or bounded-path
hypothesis is added. run_fourth_iff_middle_sixM1B proves the exact remaining
interval 2n<j<3n+6 when n>=7 and c>=5. root_iff_core_sixM1B proves
Conjecture63 <-> InteriorCore63SixM1B. The residual is unproved.
The n=4,5,6 ranges retain the older residual; no smaller-run inequality is
silently included.

The other five onset inequalities remain candidate-only. The generic full
reflection and all six source coefficient adapters are accepted separately
from those unvalidated gap certificates. Final validation results follow.

## Final local validation

All 27 accepted mathematical modules compiled and passed union kernel replay
over the inherited import boundary. All 114 audited theorem closures use only
propext, Classical.choice and Quot.sound. Ten rejected build attempts, including
three compilation timeouts, are retained; one additional queued build was
skipped after the research direction changed. The final inventory excludes
all unvalidated candidate gap and broader onset assembly modules.
The 219 tracked inputs, including the protected root, are unchanged.
No fresh whole-source rebuild or separate independent completion audit occurred.
All foreground executions completed. Full Conjecture63 remains unresolved.
