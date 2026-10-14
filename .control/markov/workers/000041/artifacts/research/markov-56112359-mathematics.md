# Horizontal type refinement and the boundary of independent weighting

Machine-authored request 561123595ffe40b8aae85b885aeebd2e. No claim of
historical novelty. The exact pinned Conjecture63 remains unresolved.

The inherited positive matrix model uses

    A = [[v,1],[uv,u+1]],  C_t = [[v+t,1],[uv,u]],

with scalar functional (v,1) M (1,u)^T. The new weighted family is
M(ts)=A C_t1 A C_t2 ... A C_tn A. The corresponding two-component
recurrence is proved equal to this matrix scalar, for every integer list ts.
If every t in ts is nonnegative, every raw coefficient is nonnegative.
At ts=[1,...,1] with length n, the scalar is exactly the protected source
numerator on n right steps, hence source (n+1)/(n+2). These are Lean
identities, not assumptions supplied by the finite experiments.

## What the horizontal experiments actually tested

The type-refined polynomial puts a single formal variable t on every C-site's
extra constant contribution. For each horizontal triple, the test forms the
polynomial middle(t)^2-low(t)*high(t) and checks all its integer coefficients.
This is stronger than the source inequality at t=1. A zero middle polynomial
is retained. Triples with a zero endpoint polynomial have nonnegative gap
automatically and are omitted only from the reported nontrivial test count.

- All 4,180 words of lengths 1..17 that start/end in A and contain no CC:
  401,611 tests, no negative gap coefficient.
- Pell cores for a/(a+1), 2<=a<=90: 360,361 tests, no negative gap coefficient.
- 250 seeded uneven words of length at most 101, constructed from A/C blocks
  with no CC: 784,502 tests, no negative gap coefficient.

The 1,546,474 tests are not necessarily distinct triples. These are finite
observations, not a universal no-CC theorem, source coverage proof, or proof
of any whole direction. Scripts, inputs and exact results are retained.

Refining further to a separate variable per C-site fails already at the
6/7 source word and the horizontal triple (4,3),(5,3),(6,3). Two monomial
coefficients in the gap equal -1. Encoding site exponents in base four,
their keys are 294 and 609; digits are read from the rightmost C-site.
This observation motivated a simpler evaluated deformation, rather than
an inference that negative polynomial coefficients alone imply failure at
nonnegative weights.

## Checked exact weighting threshold

At ts=[t,1,t,1,t], the raw horizontal triple is

    L=2t^2+12t+2,
    M=20t^2+132t+112,
    H=t^3+42t^2+369t+592.

Both the coefficient formulas and the matrix interpretation are proved in
MarkovWeighted5611. The gap is exactly

    G(t)=-2t^5+304t^4+4036t^3+16208t^2+21726t+11360.

For 0<=t<=164, the certificate

    G(t)=t^3*((164-t)*(2t+24)+100)+16208t^2+21726t+11360

is strictly positive. For every natural n,

    G(n+165)=-2n^5-1346n^4-339824n^3-38170072n^2
             -1614571584n-696140800 < 0.

Consequently, for every nonnegative INTEGER t, this horizontal inequality
holds if and only if t<=164. No claim about the exact real root between
164 and 165 is made. The obstruction theorem also proves nonnegativity of
every coefficient and palindromicity of the weight list for t=n+165.
Thus nonnegative weights, a palindromic assignment, and the alternating
A/C site pattern do not suffice for horizontal LC under independent weights.
These are weighted deformations, not source-family counterexamples.

At the COMMON weighting ts=[t,t,t,t,t], the same raw triple is

    5t+8t^2+3t^3,
    60+120t+72t^2+12t^3,
    400+450t+144t^2+10t^3.

Its gap is

    3600+12400t+17590t^2+13200t^3+5512t^4+1216t^5+114t^6.

Lean proves strict positivity for every nonnegative integer t. At t=1,
the source triple is [16,264,1004], with gap 53,632. Source identification
and all three memberships in the pinned 6/7 polygon are checked.
This source instance is consistent with inherited stronger partial source
results and is not presented as a newly uncovered source case.

## Consequence for the next research action

The common-weight horizontal conjecture survives the tests. An approach
requiring arbitrary independent C-site weights is false, even with the
source word fixed and the weights palindromic. A useful induction would need
to use the equality of the C weights, or otherwise track sufficient relations
between them. All-source vertical and diagonal comparisons still require
their own arguments. No partial inequality here closes the full root.

Final local validation is recorded in evidence/markov-56112359/validation.json.
It reuses inherited compiled imports; it is not a fresh whole-source build
or an independent English/source audit. Rejected drafts are retained.

The live primary source consulted was
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.
Hosted searches supplied no theorem used as a premise in these proofs.
