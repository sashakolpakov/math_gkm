# Universal tail representation and two additional source strips

Machine-authored live request dcb6402998ac4eed9feb37199e0f0cee.
The full pinned Conjecture63 remains unresolved. This report distinguishes
compiled local theorems, experiments, and an incomplete formal proof route.

## Exact denominator-free representation

Retain the inherited raw upper-sector masses
M_i(d,T)=K_i(d,T)+4 sum_(s<T)(T-s)K_i(d,s),
K_i(d,s)=choose(s,i)choose(d+s+i+8,i+3).
For T=i+r define

 D_r = product_(j<r) (j+1)(d+i+j+6),
 P_k = product_(j<k) (i+j+1)(d+2i+j+9),
 V_(r,k) = P_k product_(k<=j<r) (j+1)(d+i+j+6).

All expressions are integer polynomials, without division. Let L_r(f) denote
f(r)+4 sum_(k<r)(r-k)f(k), and set

 A=L_r(V),
 E=L_r(k(d+2i+k+9)V),
 C=L_r(k(k-1)(d+2i+k+9)(d+2i+k+10)V),
 G_r(i,d)=(i+2)(i+5)E^2-(i+1)(i+4)AC.

MarkovTopTailRepresentationMDCB proves for all natural d,i,r:

 D_r M_i = A K_i(d,i),
 D_r S_i M_(i+1) = E K_i(d,i),
 D_r S_i S_(i+1) M_(i+2) = C K_i(d,i),
 D_r^2 S_i^2 S_(i+1) [M_(i+1)^2-M_i M_(i+2)] = K_i(d,i)^2 G_r(i,d),

where S_i=(i+1)(i+4), and all masses have T=i+r. The denominator and
base kernel are proved positive. Thus both non-strict and strict sign
equivalences are unconditional. The proof uses the inherited row and column
recurrences, splits finite sums, and proves discarded terms zero. It includes
r=0,1 and every zero case; no positive support filtering is used.

## Closed source strips and remaining root

The r=3 and r=4 gap polynomials have positive 117-term and 176-term integer
expansions, respectively. MarkovTopTail3MDCB and MarkovTopTail4MDCB check their
identities by ring normalization and prove strict positivity for all integer
parameters i,d>=0. The mass conclusions
then hold for all natural i,d.

In the source upper sector b=3q+1 or 3q+2, j=b+2-t, 5<=t<=q+2,
T=t-3 and d=b-2t. The new strict raw triples start at t-3 (t>=6) and
t-4 (t>=7). Polygon validity is explicitly attached. Together with the
inherited low columns, first high triple, last triple and zero tails, these
prove every horizontal column at all upper depths 5<=t<=8, for every q and
both residues satisfying the sector hypotheses.

MarkovTopTailResidualMDCB proves

 TopMomentBoundM55C iff TopTailResidualMDCB,
 TopTailResidualMDCB := forall d,i,r, 1<=i, 5<=r, i+r<=d+2 imply G_r(i,d)>=0.

It also proves the exact full-root equivalence

 Conjecture63 iff ThreeFrontierMDCB and OtherFourM9E2.

Both residuals remain open. The middle horizontal strip and inherited vertical
and diagonal clauses are retained literally; OtherFourM9E2 is unchanged.

MarkovTopTailPolynomialMDCB defines the two-variable polynomial G_r and proves
its exact evaluation identity. TailCoefficientPositiveMDCB, requiring every
coefficient nonnegative for every r>=5, is sufficient for the entire upper
sector. This stronger condition is not proved. It is not substituted for the
full root and does not eliminate the other residual families or directions.

## A different possible uniform cutoff

markov-dcb64029-beta-proof.md records a written beta-binomial comparison
argument for the proposed bound d>=i+4r-1. Its potential row cutoff is linear,
d>=4T-1, hence n>=6t-13. The complete cutoff is NOT a Lean theorem in this run.

The following ingredients are formalized: the actual positive likelihood
sequence q_(k+1)/q_k=(d+2i+k+9)/(d+i+k+6), its CrossLC inequality; the
linear weight sequence with singleton endpoint, its nonnegativity and CrossLC;
their product and inward-pair ordering; exact integer beta-binomial factorial
moments, including all zero cases; and their normalized real formula with
positive denominator and mass. A 21-term positive scalar certificate proves
the required beta expectation polynomial positive when H>=3a+2m+5.

Still missing in Lean: assemble the normalized scalar expectation from these
moments, extend inward-step ordering to the covariance comparison, identify
the symmetrized antidiagonal sum with the actual gap, and attach the resulting
linear cutoff to source rows. The written derivation is a research artifact,
not a hidden assumption in any source theorem or the root equivalence.

## Experiments and rejected shortcuts

Exact scalar-polynomial expansions r=2..40 had no negative coefficients.
This is finite evidence for TailCoefficientPositiveMDCB, not its proof.
Positive antidiagonal-piece expansion is stronger and fails: at r=11,i=d=0
the m=3 piece is negative. The full gap remains positive in the tests.
The failure lies outside the source sector and does not refute Conjecture63.
Gap-ratio monotonicity in d fails in both directions, and stronger factorial
and Newton inequalities fail. All are auxiliary obstructions, not raw failures.

Independent exact source recurrence experiments passed 15,944 coefficient
comparisons, retaining 3,652 zeros; 1,950 tail identities; 1,246 newly proved
strict triples; and 295,433 polygon-valid triples across all three directions.
The beta comparison probe checked 10,365 exact moment identities, 64,220
radial pairs and 5,184 positive comparison groups without a failure. These
computations do not close any unbounded condition.
