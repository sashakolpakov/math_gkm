# Fourth lower-slice stable tail

Machine-authored live request `06b5b1f918814d79ba331dcc5c327605`.
The exact pinned `MathGKM.Markov.Conjecture63` remains open.
The final source-bound acceptance inventory is
`evidence/markov-06b5b1f9/validation.json`; declarations not accepted there
are not claimed as checked results.

## Targeted result

For an actual predecessor path `rest`, write `c=(frame rest).mid.b` and
`r=(frame rest).mid.a`. The source path is
`replicate n true ++ false :: rest`, with indices `a=nc+r`, `b=a+c`.
The fourth lower slice is `i+j=a+4`.

The new endpoint `source_fourth_tailM06` proves the raw inequality

    A(i,4n+k+2) A(i+2,4n+k) <= A(i+1,4n+k+1)^2

for every actual predecessor with `c>=5`, every `n>=7`, and every natural
`k<=5`, subject to `i+4n+k+2=a+4`. There is no finite upper bound on n,
c, r, or the path. The theorem does not require polygon guards, so it
also applies to all polygon-valid instances in this range. Zeros remain.
It does not assert inequalities for arbitrary paths outside the stated
source representation, other slices, or either axial direction.

`root_iff_coreM06` proves the exact equivalence
`Conjecture63 <-> InteriorCore63M06`, retaining the inherited residual and
removing only this source-connected tail range. The residual is unproved.

## Degree separation rather than long coefficient convolution

The inherited exact formula, with P equal to 24 times the source cut, is

    (1-X)^8 P = H0 + X^n H1 + X^(2n) H2 + X^(3n) H3 + X^(4n) H4.

Here H4 includes the actual natural-count correction. Four new universal
degree bounds give degrees at most 12, 12, 13, and 14 for H0,...,H3.
For each of the six strict predecessor chambers, polynomial identities give

    H4 = (1-X)^8 R + L,   degree(L)<=7,   degree(R)<=7.

The explicit R is independent of n. Consequently

    (1-X)^8 (P-X^(4n)R)

has degree at most `4n+7` when `n>=7`. The nonzero factor `(1-X)^8`
has degree eight. Degree addition in the integer polynomial domain implies
that `P-X^(4n)R` has degree strictly below `4n` (the zero polynomial is
handled separately). Thus `P.coeff(4n+k)=R.coeff(k)` for every natural k.
This is proved by `tail_coeff_of_clearedM06` and
`tail_coeff_four_blocksM06`; it is not an inference from numerical fits.
`source_fourth_tail_of_splitM06` connects this argument to the actual source.

Each explicit R has its eight coefficients identified without removing
zeros. Its six adjacent gaps are polynomial identities with nonnegative
coefficients in the two nonnegative Farey coordinates. For adjacent chamber
endpoints p/q<s/t, the chart is

    c=q(C+1)+t(R+1),  r=p(C+1)+s(R+1),  C,R>=0.

The inverse chart is `C=sc-tr-1`, `R=qr-pc-1`. Strict chamber inequalities
make these nonnegative. The boundaries are 0, 1/4, 1/3, 1/2, 2/3, 3/4, 1.
The inherited reduced-boundary lemma excludes the five internal boundaries
when c>=5, so the six charts exhaust actual predecessors in this range.
The scalar 24 is uniform at all three positions and is cancelled by an
integer inequality; there is no position-dependent normalization.

## Additional chamber/source progress

All six `fourthNumerator_chamber*M06` identities and their cleared/raw
coefficient corollaries connect the saved full candidate numerators to the
actual normalized numerator, for every run length and the appropriate
strict chamber. The former worker had validated only the first two scalar
specializations, without any natural-count source adapters. The remaining
four scalar specializations and all six source adapters now have local
build receipts. `source_fourth_full_lc_iffM06` gives an exact inequality
equivalence with the full binomial formula; it does not prove that formula
log-concave universally.

Keeping the large H polynomials locally irreducible during arithmetic
adapters resolved the inherited elaboration bottleneck. This is only a
proof elaboration choice, not a change to the mathematical definitions.

## Experiments and limits

`research/experiment_tail_06b5b1f9.py` checked 782 source/run cases, 6,256
coefficient identities (1,173 zero values), 3,519 polygon-valid triples,
and 544 literal recurrence coefficients. Inputs include all reduced
predecessors with denominators 5 through 25 at runs 7,8,17,37, and six
selected runs of length 111. All checks passed. Results and the exact
input list are in `evidence/markov-06b5b1f9/experiments.json`.
These computations are experiments, not universal proofs.

The remaining second and third shifted blocks, their onsets, runs 4–6
outside the proved prefix, small predecessor cycles, higher diagonals and
horizontal/vertical interiors are not closed here. The full root and its
negation remain unproved. Local validation reuses inherited imports and
pinned Mathlib; it is not a fresh whole-source rebuild or independent
source/English completion audit.

## Final local validation

All 31 mathematical modules compiled and passed union kernel replay over the inherited import boundary. All 155 inventoried theorem closures use only propext, Classical.choice and Quot.sound. There were 17 rejected Lean attempts, with diagnostics and source snapshots retained; no timeouts occurred in these Lean checks. All 411 preservation checks passed. All foreground executions completed. Full Conjecture63 remains unresolved and completion is null.
