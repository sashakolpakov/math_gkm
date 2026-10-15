# Mathematical progress, request 8ae35b59

Machine-authored live experimental research. The exact pinned Conjecture63 and
its negation remain unproved. Validation status is source-bound in
`evidence/markov-8ae35b59/validation.json`; candidate files alone are not results.

Write `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, and
`path=List.replicate n true ++ false :: rest`. The fourth lower slice has total
squared-variable degree `(frame path).mid.a+4`.

## Completed subfamilies

`research/MarkovFourthTopCompleteM8AE.lean` contains the central raw inequality
`source_fourth_middle_topM8AE`, the full-slice theorem `run_fourth_topM8AE`,
and `root_iff_coreTopM8AE`. The full-slice theorem assumes `n≥7`, `c≥5`,
and `r+1=c`. It covers every polygon-valid consecutive triple on that slice.

`research/MarkovFourthTwoCompleteM8AE.lean` contains the analogous
`source_fourth_middle_twoM8AE` and `run_fourth_twoM8AE` for `r=2`, with the same
run and denominator bounds. Its `root_iff_coreTwoM8AE` proves

    Conjecture63 ↔ InteriorCore63TwoM8AE.

This is an exact residual equivalence, not a proof of the residual. Together
with the inherited numerator-one theorem, these results complete the fourth
slice for predecessor numerators `1`, `2`, and `c-1` in the stated range.

The central proof sets `J=j-2n-6`, `E=3n-j`, so `n=J+E+6` and `J,E≥0`.
For the top predecessor it sets `R=c-5`, obtaining `(c,r)=(R+5,R+4)`.
For numerator two it sets `C=c-5`, obtaining `(c,r)=(C+5,2)`.
In each case the gap of the three canonical middle values is a polynomial
with nonnegative integer coefficients in these nonnegative coordinates.
Horner-form coefficient identities are checked by ordinary Lean algebra;
the outer parameter is assembled with coefficient functions kept opaque.

The imported `source_fourth_middle_canonicalM722` identifies each canonical
value with `120960 * coeff` at the literal source position. The same positive
scale is canceled from all three positions. No coefficient positivity,
factorial normalization, or nonzero premise is introduced. The source results
use `(i,j+2),(i+1,j+1),(i+2,j)` and preserve zeros. The full-slice statements
combine this central result with the inherited prefix, onset, and final
intervals via `run_fourth_iff_centralM253`.

## Stronger exact source adapter

`research/MarkovOnsetSmallSourceM8AE.lean` proves
`source_fourth_second_onset_valueM8AE`: the existing seven-position formula at
`j=2n+k`, `1≤k≤7`, is already valid for every `n≥4` and actual predecessor
`c≥5`. The proof uses the corrected three-block source formula, including
the correction for `k≤5`. This strengthens a coefficient identity; it does
not by itself prove the onset inequalities for these smaller runs.

## General central certificates remain incomplete

The remaining general central interval is still `2n+6≤j≤3n`. New Horner bases,
coefficient-gap proofs and column assemblies are retained, with their exact
validation status in the inventory. The general chart and all-predecessor
source files are candidates and must not be imported as established results
without successful builds and checks. No inference from a finite scan closes
this interval.

## Exact experiments, not proofs

`experiments.json` records 270 central cases: 3,600 coefficient identities,
2,790 polygon-valid inequalities, and 30 literal recurrence comparisons.
`small-onset-experiments.json` records 156 cases at `n=4,5,6`: 1,092 coefficient
identities, 780 polygon-valid inequalities, and 42 literal recurrence
comparisons. Both passed; these samples had no zero coefficients. Formal
inequalities nevertheless retain zeros.

`threshold-probe.json` substitutes `N→N+(n_base-7)` in the inherited onset gap
polynomials. All twenty have nonnegative coefficients for `n_base=3` (and
4 through 7); eighteen do at 2. Negative expansion coefficients do not refute
an inequality. These symbolic checks are not Lean certificates.

`complement-probe.json` compares the high chart with the low chart after
exchanging `C,R`, corresponding to `r→c-r`. The difference of their gap
polynomials has 3,432 positive coefficients and none negative; the individual
value differences each have 392 positive coefficients. This is an unproved
possible comparison route, not a source-family theorem.

## Rejected attempts and validation limits

Large grouped base/gap builds timed out. Splitting the same algebra into
individual coefficient identities produced successful builds. Other rejected
drafts exposed lexical `≤m` parsing, absent definitions in an `unfold` list,
and associativity differences in a simplification result. Corrected attempts
and immutable failed snapshots are retained. These outcomes concern execution,
not truth or falsity of the conjecture.

Inherited compiled imports were reused. No fresh whole-source rebuild or
independent hash-bound English/source completion audit occurred. Small runs,
small predecessor denominators, remaining predecessor numerators, higher
slices, and axial interiors remain unresolved as applicable.
