# Fourth lower slice: local formula and conditional inequalities

Machine-authored live research for request `01f51d63cfb342788663ad652d76ab8c`.
The exact pinned `MathGKM.Markov.Conjecture63` remains unresolved.
No unconditional new fourth-lower-slice log-concavity theorem is claimed.

## Unconditional source identity

For a polynomial T with constant coefficient one, write

    L4(T)=24 T4-24 T1 T3-12 T2²+24 T1² T2-6 T1⁴.

This integer polynomial equals 24 times the fourth formal logarithm coefficient;
the formal development uses only the displayed algebra, without division or
analytic logarithms. For matrices whose constant term is diag(0,1), the first
three coefficients of b/d depend on only the first three matrices. Their exact
recurrences are `headRatioOne01F`, `headRatioTwo01F`, `headRatioThree01F`.
`product_openFour01F` expresses L4 of the lower-right entry as a sum of local
contributions, each involving at most four consecutive matrices.

Closing the word adds the explicit boundary term

    B=24(r1*l3+r2*l2+r3*l1)-12(r1*l1)²,

where r and l are the respective b/d and c/d jets. The exact trace correction,
with e_k the kth determinant coefficient, is

    E=24(e4-2*d1*e3+(3*d1²-2*d2)*e2)-24*r1*l1*e2-12*e2².

`product_trace_four01F` proves L4(trace)=openFour+B+E for every list of at
least two such matrices. `product_trace_four_long01F` proves E=0 for length
at least five. `cyclic_four_local01F` identifies openFour+B with the actual
cyclic local scan, rather than merely suggesting such an interpretation.

For every mixed source path `replicate n true ++ false :: rest`, put
c=(frame rest).mid.b, r=(frame rest).mid.a, and b=c(n+1)+r.
The proved determinant of the gauged run product is U^c V^b. Thus e_k is
X^b exactly when c=k and zero otherwise. Denominators c=2,3,4 are included,
and their corrections are never dropped. This is particularly useful because
previous cubic calculations required separate small-cycle treatments.

Let F, S, T denote the inherited firstRunPolyADB2, secondCompressed446,
and correctedThirdRun8BBB; these equal the first slice, twice the second,
and six times the third. The new `fourthRunPoly01F` is

    L4(trace)+6(1+X)^4+4FT+3S²-12F²S+6F⁴,

where L4(trace) is the local formula with the explicit determinant correction.
`source_fourth_run_poly01F` proves that this equals 24 times the actual fourth
lower-slice polynomial. `source_fourth_run_raw01F` proves the literal integer
coefficient identity for every i,j with i+j=a+4. The factor 24 is common to
the whole slice and is not an index-dependent normalization. This identity
is unconditional, unbounded in n, rest, i, j, and includes zeros.

## Low-slope polynomial certificates

For n=0, the predecessor slope r/c lies in one of the six strict intervals
with boundaries 0, 1/4, 1/3, 1/2, 2/3, 3/4, 1. The experiment inferred one
linear-in-(c,r) fourth moment in each interval. The precise coefficients are
`fourthLowMoment001F` through `fourthLowMoment501F`, and the resulting fourth
slice coefficient sequences are `fourthLowSeq001F` through `fourthLowSeq501F`.

Each interval has Farey endpoints p/q < s/t. The six algebraic modules prove
log-concavity of its explicit polynomial for

    c=q(x+1)+t(y+1),  r=p(x+1)+s(y+1),  x,y >= 0.

The gap proofs are exact identities followed by nonnegativity of every
coefficient in x,y. All indices j, including the identically zero tail, are
covered. The polynomial coefficient extraction identities are also checked.
These are universal polynomial inequalities, not yet unconditional source
inequalities. `source_fourth_chamber_001F` through
`source_fourth_chamber_501F` explicitly require the source fourth moment
identity as a hypothesis. They transport that hypothesis and the checked
inequalities to the original raw source coefficients. See validation.json
for the final status of these declarations.

The source moment hypothesis is a remaining mathematical obligation. It was
not inferred from the experiments, declared as an axiom, or erased by tactic.
Small predecessor denominators can use already proved upper slices, but no
global assembly or fourth-slice completion is claimed in this worker.

## The remaining local counting problem

The checked Boolean coboundary `fourth_boolean_coboundary01F` reduces the
local moment to a four-letter statistic plus a telescoping potential.
`fourth_boolean_local01F` connects it to the actual gauged Boolean matrices.
The canonical local polynomial uses the cyclic counts of subsets of positions:

    empty, {3}, {2,3}, {1,3}, {0,3}, {1,2,3},
    {0,1,3}, {0,2,3}, {0,1,2,3}.

Counts already available for length, ones, adjacent ones, distance-two pairs,
and triple ones cover the first, second, third, fourth and sixth terms.
The remaining proposed counts are recorded below in interval order:

| r/c interval | {0,3} | {0,1,3} and {0,2,3}, separately | {0,1,2,3} |
|---|---:|---:|---:|
| (0,1/4) | 0 | 0 | 0 |
| (1/4,1/3) | 4r-c | 0 | 0 |
| (1/3,1/2) | c-2r | 0 | 0 |
| (1/2,2/3) | 4r-2c | 2r-c | 0 |
| (2/3,3/4) | 2c-2r | c-r | 0 |
| (3/4,1) | 2r-c | 3r-2c | 4r-3c |

These count formulas are exact finite evidence only. They still need universal
proofs for the pinned mechanical source words, followed by the cyclic Boolean
scan assembly. Do not silently assume reversal symmetry to identify the two
triple counts. `fourth-new-patterns.json` tests them separately.

## Experiments and limits

The candidate moment and fourth-slice formulas matched 3,038 reduced sources
with 5<=c<=100. An independent literal pinned-recurrence calculation checked
1,474 raw positions through c<=20. The new pattern formulas matched 4,380
reduced source words through c<=120. These are exact finite computations,
not universal proofs. Sparse rational polynomial expansion produced the
certificates; Lean independently checks their algebraic identities and signs.

The residual `InteriorCore638833` is unchanged. Higher diagonals, the general
fourth slice, and horizontal/vertical interiors remain unresolved. No
historical novelty or exact-root completion is claimed.
