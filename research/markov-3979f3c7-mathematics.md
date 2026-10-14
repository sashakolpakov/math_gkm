# Exact lower-corner results and summation obstructions

Machine-authored research, request 3979f3c739b946f2a07319e5c9795bce.
Full pinned Conjecture63 remains unresolved. No historical novelty claim.

For every n>=0 take the actual source at (n+2)/(n+3), namely the protected
frame at replicate(n+1,true), and its vertical raw triple starting at (n+2,0).
The checked formulas in MarkovPellMixture3979 are

    A(n+2,0) = 1,
    A(n+2,1) = 3n+5,
    A(n+2,2) = (17n²+23n+12)/2.

All three positions belong to the pinned polygon. The formulas derive from
the inherited all-coordinate excess identity, with natural-subtraction and
zero cases retained. Rational casts in the proof do not change coefficients.
The raw log-concavity gap is (n²+37n+38)/2, hence positive. A separate base
case also covers source 1/2, whose right endpoint coefficient is zero.
`excess_vertical_zero3979` establishes the whole s=0 case of the inherited
ExcessVertical00b3 predicate; when j>0 its left endpoint is zero.

The same literal source triples give an infinite obstruction to averaging
across source labels. Sum the triples for n=0,...,N-1 without weights or
normalization. Their sums are

    N, (3N²+7N)/2, (17N³+9N²+10N)/6.

Twelve times (endpoint product minus center square) equals

    N² (7N²-108N-127).

`bottom_sum_lc_iff3979` proves that the aggregate is log-concave exactly for
N<=16. Every N>=17 reverses the inequality, despite every summand being a
valid source triple satisfying it. At N=17 the aggregate is [17,493,14382],
and the reversed gap is 1445. Aggregating different source polynomials is
not an operation in Conjecture63, so this is a strategy obstruction only.

## The geometric-convolution obstruction

Let E_s be the already source-connected Pell excess series

    (x+y)^(2s) / ((1-x)^(s+1) (1-y)^s).

The new kernel module defines F_s=E_s/(1-x) using the actual formal power
series product. `prefix_coeff_sum3979` proves its coefficient is exactly the
finite prefix sum of E_s coefficients, without dropping zeros. At the three
cross-strip positions (s,i,j)=(0,10,0),(1,10,1),(2,10,2), its coefficients
are [11,155,2202]. The checked strict inequality is 155²<11*2202.
`zero_slice_preservation_failure3979` also proves that E_s satisfies every
input comparison on this zero-excess vertical slice, whereas F_s does not.
Thus preserving this slice under an extra positive geometric factor is false.
This does not refute a preservation theorem whose stronger input hypotheses
have not been established. F_s is not identified with a source family.

## Experimental directions retained

The generalized kernel probe considered
(x+y)^(2s)/(1-x)^(s+p)/(1-y)^(s+q). It made 129600 exact comparisons for
p,q<=5, s<=8, i,j<=19. The first horizontal failure is p=0,q=2,s=0,i=0,j=10,
with [11,155,2202], the transpose of the formal witness above. This rules out
that unrestricted deformation, not the p=1,q=0 source case.

Exact rational polynomial expansion tested the horizontal and vertical gaps
for positive excess s=1,...,6. After the same safe interior translations as
the inherited first-band proof, every monomial coefficient was nonnegative.
This suggests investigating a uniform symbolic certificate. No theorem for
arbitrary s, or for excluded boundary coordinates, follows from these tests.

The arbitrary A--core--B horizontal-only conjecture survived 951 additional
structured and deterministically randomized words, with a 55-second cap.
The exact generator and seed 3979 are saved. These words are an enlarged
family; the scan proves neither their horizontal conjecture nor the root.

One useful interpretation of the inherited horizontal sum is a colored
monomer-dimer model. For an alternating path of 2a vertices (2a-1 edges), give
even-position edges weight 1 and odd-position edges weight ty. A matching
with a-s dimers leaves 2s free vertices, each carrying weight 1+y. The number
with q odd dimers is choose(a-q,s) choose(s+q-1,q), for positive s. Thus its
coefficient of t^q y^j is exactly H(a,j,s,q) from the inherited fiber goal.
The binomial count follows from the inherited matching-coefficient formula
with indices (a-s-q,q); out-of-range cases need their explicit guards.
This is an explanatory representation, not a new formal combinatorial
injection. A comparison at fixed charge j remains unproved. The cumulative
counterexample cautions against replacing that comparison by free summation.

Live literature queries revisited the [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
and located [Mu--Zheng's Delannoy matrix study](https://doi.org/10.1017/S0013091522000384),
[Foldes--Major's Pascal-type triangle paper](https://arxiv.org/abs/1608.04126),
and [Zhu's Riordan-array paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2121C9E7369DEC3D5C05B2C6735165E3/S0308210516000500a.pdf/logconcavity_and_strong_qlogconvexity_for_riordan_arrays_and_recursive_matrices.pdf).
No applicable theorem with all hypotheses verified was obtained. This was
not an exhaustive survey; no retrieved statement was imported as a Lean axiom.
