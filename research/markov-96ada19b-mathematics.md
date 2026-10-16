# Sparse numerator-three identities and signed binomial inversion

Machine-authored request 96ada19b024045ac97c60b3c8dfb10e6. Full pinned
Conjecture63 remains unresolved. Final formal admission scope is recorded in
evidence/markov-96ada19b/validation.json; this report is not an independent audit.

Write S=u+v+1, D=S²-4v, and F_n for the inherited literal Fibonacci numerator.
For q>=1 let A_q be the source 3/(3q+1), B_q the source 3/(3q+2).
The inherited positive cubes are

    A_q=F_(q+1)^3+v F_(q+1) F_q²+Sv F_q³,
    B_q=S F_(q+1)^3+v F_(q+1)² F_q+v² F_q³.

The new sparse identities, proved in MarkovThreeSparseM96A, are

    D A_q = S²(F_(3q+3)-2F_(3q+2)+F_(3q+1))
              +4u v^(q+1)(S F_q+F_(q+1)),
    D B_q = S²(F_(3q+4)-2F_(3q+3)+F_(3q+2))
              +4u v^(q+1)(v F_q+S F_(q+1)).

They hold algebraically also at q=0, without claiming that auxiliary case is
a numerator-three source. GAP first suggested them by exact elimination and
factorization. The Lean proof does not trust that calculation. It proves
division-free addition and tripling for the pair f,g evolving by
f'=(u+v)f+g, g'=uf+g, together with

    u f_q²+(1-u-v)f_q g_q-g_q²=u v^q.

After polynomial identities, cancellation uses the proved nonzero polynomial
u². No discriminant evaluation, positivity assumption, or division by a raw
coefficient is used.

## Explicit forcing and triangular recovery

MarkovThreeForceM96A extracts the sparse right-hand side using the inherited
guarded integer binomial formula for every F coefficient. Multiplication by
S means three guarded shifts. Thus threeForceM96A has a fixed number of
binomial evaluations rather than the previous nested cubic convolutions.

For the literal source raw array a and forcing h, the exact equation is

    a(i,j)+2a(i-1,j)-2a(i,j-1)+a(i-2,j)
      +2a(i-1,j-1)+a(i,j-2)=h(i,j),

where every negative-index term is zero. solveDiscM96A solves this by strict
induction on i+j. Its uniqueness theorem is proved for arbitrary integer
forcing and arrays, including all boundary zeros. sparseRawM96A is proved
equal to threeRawM9E2 at every natural index.

root_iff_sparse_threeM96A is an exact root equivalence. SparseThreeLCM96A
retains every natural index in all three directions; OtherFourM9E2 retains
every source numerator >=4. Both residual predicates remain unproved.

## Exact signed binomial inverse

The doubled impulse response is

    K(i,j)=(-1)^i C(2i+2j+2,2i+1).

MarkovBinomialInverseM96A proves the interior equation by four Pascal steps.
MarkovInverseBoundaryM96A proves all axes and adjacent rows/columns, then
the full equation D*K=2 delta. It identifies K with the unique solution of
the doubled unit forcing. The factor 2 avoids divisibility or rational casts.

MarkovSparseConvolutionM96A realizes a finite rectangle of K as a polynomial.
Inside that rectangle its D-product is exactly the doubled unit impulse.
Associativity of polynomial multiplication then proves, for every polynomial P,

    2 coeff(P,i,j) = sum_(a=0)^i sum_(b=0)^j
       coeff(D P,a,b) K(i-a,j-b).

For numerator-three sources this gives a two-sum binomial formula with the
explicit sparse forcing. No infinite-series convergence is used. It retains
all outside-support zeros and imposes no bound on q,i,j. The exact root
equivalence root_iff_double_sumM96A explicitly proves that the common factor
2 cancels from the inequalities; it is not coefficient-dependent normalization.

## Sign limitation and actual source witness

The inverse alternates with i. The forcing is also signed: for actual 3/5,
h(0,7)=-2, although (0,7) belongs to its pinned polygon and its raw coefficient
is 1. MarkovSparseSignM96A proves these facts and the valid source vertical
triple at (0,5),(0,6),(0,7), with raw values [1,2,1], which satisfies LC.
This prevents treating the sparse forcing as a nonnegative source array.
It is not a source refutation and does not supply an LC preservation theorem.

## Lower fourth-column candidate

An independent exact coefficient calculation suggests, for j<=q, that the
source coefficient at (4,j) equals

    (j+1)(j+2)(j+3)(j+4)/2520 *
      [7(3q+c)(2j²+10j+15)-j(18j²+100j+155)],

where c=0 for A and c=1 for B. Its source identification is NOT proved in Lean.
For j<q it follows on paper by retaining positive-u contributions in the cubes:
the low first F column is 1/(1-v)², and the low second column is
((n-1)-(n+2)v)/(1-v)^4. The boundary j=q needs care because omitted
axis terms can contribute; finite agreement there is not a formal extension.

MarkovLowerCandidateM96A does prove LC of this explicit rational polynomial
for every rational j>=0, c>=0 and q>=j+2. After extracting common
positive factors, its gap has a 34-term nonnegative coefficient certificate
in j,d=q-j-2,c. The certificate is generated exactly and checked by ring.
It proves an expression inequality, not a new source region without the bridge.

column-candidate.json additionally records an interpolated entire fourth-column
numerator after multiplying by (1-v)^8. Its finite verification, including
overlapping shifted blocks at small q, is experimental. It is not a theorem.

## Exact finite observations

sparse-experiments.json records 113640 source coefficient comparisons, 324216
global raw triples (186156 containing zeros), 3600 inverse-equation checks,
960 inverse convolution comparisons, and 600 lower-expression comparisons.
No tested raw inequality failed. Both residue classes and zeros were retained.
All these counts are finite experiments, separate from the universal identities.

No complete new source direction is proved. The signed inverse, sparse identity,
and lower candidate do not establish Conjecture63 or its negation.
