# Second-column seed: all run lengths

Machine-authored experimental research, request 7584c5d02d314363894d0c417e95c6a7.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. This is a partial
mathematical result; validation status is recorded in the accompanying receipts.
No historical novelty claim is made.

## New raw source theorem

`vertical_second_largeM758` in `MarkovVerticalSeedLCM758.lean` proves, for every
actual source path with numerator index a >= 5 and every natural j,

    A(2,j) A(2,j+2) <= A(2,j+1)^2.

There is no bound on the denominator, run length, path length or j. These are
the literal integer coefficients of the pinned numerator. Zeros are retained.
The theorem applies even outside polygon-valid triples, hence applies to all
the required vertical triples in this column.

The inherited exact source factorization writes q=n+1, b=aq+r,
s=max(2r-a,0), where 1<=r<a, and gives

    2 [u^2]P = v^(b-2q-2) (1+v)^(a-5) N(n,a,r,s;v).

The source predecessor supplies r and q; they are not inferred from an arbitrary
word experiment. All exponents are justified under a>=5. The new theorem
`vN_crossM758` proves the inherited seed's CrossLC condition for every natural
n and every natural 1<=r<a, including parameter pairs not needed by the source.
Pascal smoothing and the monomial shift then give the raw inequality. The
uniform factors 2 and 6 used in the proof clear denominators across the entire
sequence; they are not coefficient-dependent normalizations.

## Sparse numerator and exact coefficient extraction

`vN_sparseM758` proves the polynomial identity

    (1-v)^4 N = H0(a,r,s,q;v) + v^q H1(a,r,s,q;v)
                                + v^(2q) H2(a,r,s,q;v),

with degrees 5, 6 and 8 respectively. The H polynomials are explicitly defined
in `MarkovVerticalSparseM758.lean`. The proof uses the inherited checked closed
jet identities and ring arithmetic. It is not interpolation.

The inverse-four power series gives the exact binomial convolution for every
coefficient. `vN_coeff_scaledM758` identifies 6*N.coeff(j) with vEM758 at every
natural index j. The coefficient formulas are integral: the truncated cubic

    F(j,k) = (j-k+3)(j-k+2)(j-k+1) if k<=j, and 0 otherwise

is used on integer indices. This preserves negative-index zeros. Its agreement
with six times the binomial coefficient is proved, including the three zero
values immediately below each delayed band.

For q>=2, vEM758 has the following exact pieces (all formulas are Lean
definitions in `MarkovVerticalShapesM758.lean`):

* j<=0: zero; j=1: 48s.
* 2<=j<=q+1: the cubic vlowM758.
* j=q+2: vbridgeM758.
* q+3<=j<=2q+1: the cubic vmidM758.
* j=2q+2, 2q+3, 2q+4: vtail2M758, vtail3M758, vtail4M758.
* j>=2q+5: zero.

The formulas for the low, middle and tail pieces are also saved in
`evidence/markov-7584c5d0/symbolic-gap-scan.json`; that JSON is experimental
algebra, whereas the Lean modules provide the checked identities.

## Inequalities and support

The two parameter charts

    a=2(x+1)+y, r=x+1,   s=0,
    a=2(x+1)+y, r=x+1+y, s=y

cover every natural 1<=r<a. Their variables are nonnegative integers.
The low and middle interior indices and the finitely many junctions reduce
each adjacent gap to a polynomial with nonnegative coefficients. The q=2
case where two junctions meet is handled separately. The first low-piece
positivity proof additionally splits the integer displacement z into z=0 and
z>=1; treating z as an arbitrary nonnegative real would not justify that step.

`vE_positiveM758` proves strict positivity for 2<=j<=2q+4. Together with the
possibly zero coefficient at j=1 and the exact exterior zeros, this proves
interval support. `vE_adjacentM758` proves every adjacent inequality. The
inherited interval-support theorem then upgrades these statements to CrossLC;
the independent audit's zero-gap warning is explicitly addressed.

For q=1 the seed is proved equal to v times the inherited six-term seed.
Its existing CrossLC theorem completes the n=0 case. Mapping integer
polynomials to real coefficients and cancelling the common factor six gives
`vN_crossM758` for all n.

## Smaller numerators and remaining scope

`hsource_moments_twoM758` lowers the second-order source moment hypothesis
from predecessor denominator four to three. The two denominator-three source
paths are exhaustive by reducedness and path injectivity; their moments are
proved directly over any commutative coefficient ring.

`MarkovVerticalSmallSourceM758.lean` uses this to prove the all-run residual
identity for every source with a>=3. For 3<=a<=5 it proves

    2 (1+v)^(5-a) [u^2]P = v^(b-2q-2) N(n,a,r,s;v).

This is an actual source identity, not a log-concavity theorem for a=3,4.
Dividing a log-concave polynomial by 1+v is not used as an LC-preserving rule.

The finite small-column diagnosis found that the a=2,r=1 family instead
satisfies the candidate identity

    2v(1+v)^3 [u^2]P = N(n,2,1,0;v)+2v.

It was checked for 1<=q<=30 but remains unproved here. Exact symbolic quotient
tables for the five small families are recorded in small-sparse-candidates.json;
their source and inequality bridges are not silently assumed.

`root_iff_interiorM758` proves the exact equivalence between the pinned root
and InteriorCore63M758. That residual is unproved. It retains horizontal rows
j>=5, vertical columns i>=3, the second column for a=2,3,4 with b>=2a, and
the inherited deeper diagonal region. It preserves the original polygon
guards and the inherited handling of both endpoints.

## Experiments

The exact finite experiment compared 504,600 seed coefficients across 12,615
parameter cases, checked 479,370 adjacent inequalities and retained 56,985
seed zero positions. The independent literal source recurrence comparison
covered 1,080 reduced fractions, 112,728 raw coefficient positions, 23,676
polygon-valid inequalities and 86,892 raw zeros. No failures were found.
These computations are not universal proofs. A separate 150-case small-family
diagnosis also remains experimental evidence.
