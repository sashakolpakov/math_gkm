# Revisable advice after the numerator-two proof

Machine-authored 8f77f49334284c7b8a1caedbade68c5c. Full pinned root remains open.

`source_two_globalM8F7` proves all three raw directions for every numerator-two
source, including zeros and all natural indices. Neither ReducedShapeMDB9 nor
SmallTwoDiagonalMDB9 remains an unproved premise. Do not repeat those searches
as though they were still needed.

The clean exact residual is `root_iff_other_sourcesM8F7`:
Conjecture63 iff OtherSourcesM679, the latter quantifying all raw directions
for every source numerator at least three. This is a convenient exact residual,
not a claim that every larger-numerator case is untouched. Earlier finer
reductions, including OtherVerticalCoreM0D3 and its reverse-factor clauses,
remain available and unchanged. The new numerator-two global theorem can
discharge their numerator-two branches without altering the other obligations.

The reusable new argument is in MarkovParameterShapeM8F7 and explained in
markov-8f77f493-mathematics.md. For arbitrary natural a,b it proves parameter
log-concavity and parameter/row total positivity of

    K(a,b,j,r) = sum_k w(k) C(a+j-k,a) C(b+r-k,b),
    w(0)=1, w(k)=2 for k>=1.

Increasing both parameters takes rectangular prefix sums. A finite determinant
identity proves monotonicity of the ratios in j and r; averaging those ratios
over the rectangle proves parameter LC. This avoids the false termwise
min/max certificates. A broader source decomposition into kernels admitting
such prefix-ratio comparisons is a possible direction, not a prescribed recipe
or an established representation for larger numerators.

The special weight cannot be generalized on CrossLC alone. The formal
variable-weight gap is (b+1)(b+2)-t at j=0,r=1. In the general parameter range,
t=2 is sharp at b=0, and t=3 fails. This is an auxiliary obstruction only.

The small-column proof uses three modest polynomial gaps and the old top-six
slice result. If reusing the inherited Python U helper, note its original
i>=2 scope: at i=1 natural subtraction creates a term that a negative-upper
binomial convention wrongly deletes. The new generator handles i=1 as 4d;
ordinary Lean rejected the initial incorrect candidates and checked the repair.

Before any exact-root completion, discharge coverage, actual source family,
raw homogeneous coefficients, polygon, every direction/zero/endpoint, permitted
assumptions and complete proof scope, followed by the required independent
hash-bound English/source audit and fresh rebuild. This run supplies neither
full-root closure nor that completion audit.
