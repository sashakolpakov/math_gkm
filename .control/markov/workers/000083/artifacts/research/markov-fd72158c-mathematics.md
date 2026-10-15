# Small run lengths on the third lower diagonal

Machine-authored live research, request `fd72158c01ce41b48a159a8c0359decb`.
The pinned full `MathGKM.Markov.Conjecture63` is unresolved. Final validation
receipts, rather than intermediate compilation attempts, determine accepted scope.

For a mixed path `replicate n true ++ false :: rest`, write
`c=(frame rest).mid.b`, `r=(frame rest).mid.a`. The source indices are
`a=cn+r`, `b=c(n+1)+r`. The inherited theorem `source_third_run_rawADB2`
identifies six times the literal coefficient on `i+j=a+3` with coefficient
`j` of `thirdRunPolyADB2 n c r`, provided `c>=4`.

For the previously unresolved run lengths `n=2,3`, the exact polynomial has
degree at most 11 and 14 respectively. This work derives every coefficient
as an integer polynomial in `c,r,q,t,u`, where

    q=max(2r-c,0), t=min(c-r,max(3r-c,0)), u=max(3r-2c,0).

The extraction uses exact division of the inherited numerator by `(1-X)^6`.
The Lean certificate multiplies back and checks the polynomial identity;
cancellation uses the nonzero polynomial `(1-X)^6`. No interpolation is a
premise, and no variable-dependent rescaling is used.

There are four slope chambers, with common boundaries retained:

* `3r<=c`: set `c=3r+s`. Split `r=1,c>=4` from `r>=2,s>=0`.
* `2r<=c<=3r`: write `c=3v+2w,r=v+w`, with `v,w>=0`.
* `c<=2r,3r<=2c`: write `c=3v+2w,r=2v+w`, with `v,w>=0`.
* `2c<=3r`: write `c=3v+w,r=2v+w`, with `v=c-r>=1,w>=0`.

In the middle chambers `c>=4` forces `v+w>=2`; the three shifts `(2,0)`,
`(1,1)`, `(0,2)` cover all possibilities. In the outer chambers the analogous
two shifts account for the small boundary value separately. Each adjacent
coefficient gap expands into a polynomial with nonnegative coefficients in
the two nonnegative shifted parameters. Lean checks the identities and their
nonnegativity, then discharges the integer chamber coverage explicitly.

The polygon bound gives `j<=3n+3`, so the finite list of coefficient formulas
covers every valid triple for either fixed run length. Parameters `c,r` remain
unbounded. This is different from a finite denominator scan.

Independent finite checks are recorded in
`evidence/markov-fd72158c/small-run-experiments.json`: 972 source fractions,
82,500 exact formula positions, 1,472 literal raw recurrence positions and
10,206 polygon-valid triples. These checks are not universal proofs.

The initial Lean attempts failed on cast normalization and coefficient
simplification, then encountered a recursion limit in a source bridge. All
attempt snapshots and receipts are retained. Accepted declarations and remaining
obligations will be bound in the final validation report.

## Source conclusions and small cycles

`source_third_small_allFD` proves the entire third lower diagonal for run lengths
two and three, for every predecessor source. The six exceptional parameter
triples `(n,c,r)` with `n` in `{2,3}` and `(c,r)` in `{(2,1),(3,1),(3,2)}` are
handled by exact polynomial identities for `correctedThirdRun8BBB`, followed by
integer coefficient inequalities and zero tails. The `c=2` extra term in the
uncorrected polynomial is retained before applying the source correction.

`source_third_largeFD` combines the new run results with inherited run-zero,
run-one, and run-at-least-four results. It proves raw log-concavity on
`i+j=a+3` for every source path satisfying `a+4<=b`. The path decomposition
is proved; no numerical slope-classification assumption is used.

`root_iff_interiorFD` gives an exact equivalence between the unchanged
`Conjecture63` and the still-unproved `Interior63FD`. In addition to the inherited
residual guards, the third slice now remains only when `b<=a+3` and the path is
not a mixed run of length two or three. Higher slices and the horizontal
and vertical conditions remain explicit. This equivalence is not root closure.

## Next two-cycle tail obligation

An exact symbolic follow-up derives candidate raw coefficients

    440n-532, 120n-92, 22n-8, 2n

at positions `(3,2n+1),(2,2n+2),(1,2n+3),(0,2n+4)` for the two-cycle family
with indices `(a,b)=(2n+1,2n+3)`, `n>=4`. The two squared gaps of the coefficients
scaled uniformly by 90, after substituting `n=N+4`, are

    423662400 + 250322400 N + 38232000 N²,
    26697600 + 14450400 N + 1976400 N².

The derivation uses inherited second/third-band shapes, retaining the two-cycle
correction. It was independently checked at 148 backward-source positions and
20 literal raw recurrence positions. This run has **not** proved the universal
source coefficient extraction for those four positions. The data in
`two-cycle-tail-probe.json` are an actionable next obligation, not a new source
theorem or a root claim. The two remaining triples can be combined with the
already-proved first two bands once that bridge is supplied.

## Validation boundary

Final mathematical sources, build receipts, separate union kernel replay
receipts, and axiom closures are bound by
`evidence/markov-fd72158c/validation.json`. Source correspondence limits are in
`research/markov-fd72158c-correspondence.md`.
