# Uniform discrete middle-coefficient representation

Machine-authored live request d0292f142b0e4db995dc25f58edefaca.
Full pinned Conjecture63 and its negation remain unproved. This invocation
establishes representations, support and a universal shortcut obstruction;
it does not establish a new complete direction of log-concavity.
Exact accepted source hashes and validation scope are in
evidence/markov-d0292f14/validation.json when that receipt is present.

Write b=3q+epsilon, with epsilon=1 for r=true and epsilon=2 for r=false.
The middle strip is k<=q and 2(q+3+k)<=b, at row j=b+2-(q+3+k).
Set B=5 for true and B=4 for false. Its exact parameterization is

    q=x+2k+B, x,k natural.

Every such x,k gives an admissible middle parameter, and every admissible
middle parameter has this form. The denominator and depth are unbounded.

## A short positive integer kernel

Define

    H(D,k,a,b)=sum(l=0..b) C(a+l,a) C(D+a,b-l) C(k,a+l+2).

MarkovMiddleKernelMD02 proves, for all natural D,k,a,b,

    H(D,k,a,b)=sum(s<k) (k-1-s) C(s,a) C(s+D,b).

The proof first applies Vandermonde to the product of binomials and then
evaluates the weighted binomial prefix by a hockey-stick identity. It
explicitly handles s<a and k=0. The terminal zero weight is retained.
This is a universal identity, not an interpolated fixed-column formula.

MarkovMiddleKernelSourceMD02 expresses the correction at column c+3 as
E(d,k,c,r), where E is four times the following nonnegative sum:

For true:

    H(d+c+4,k,c,c+1) + 2H(d+c+5,k,c+1,c+2)
      +H(d+c+4,k,c+1,c+2)+H(d+c+4,k,c,c+2)+H(d+c+5,k,c,c+2).

For false:

    2H(d+c+5,k,c+1,c+2)+H(d+c+5,k,c,c+1)
      +H(d+c+6,k,c+1,c+2)+H(d+c+5,k,c,c+2).

This follows from the actual Fibonacci-row coefficient identity, the gain
recurrence and the predecessor's positive correction formula. No external
formula or polynomial-fit hypothesis is used. The kernel's summation length
depends on the column, not on k.

Let S(d,T,c)=topShortSumMEB6(d,T,c), the inherited integer top-template sum.
The new exact raw source formula is

    A(c+3,j)=S(b-2(q+3+k),q+k,c)+E(q-2k-2,k,c,r).

Equivalently define

    R(x,k,r,c)=S(x,x+3k+B,c)+E(x+B-2,k,c,r).

MarkovMiddleDiscreteMD02 proves this is the literal source coefficient at
column c+3 and the displayed row for q=x+2k+B. It retains every column c,
including zero tails. Rational casts and generalized fractional binomials
are unnecessary in this final representation.

## Exact support and Newton coefficients of the correction

MarkovMiddleKernelShapeMD02 proves

    E(d,k,c,r)>0 iff c+2<=k;
    E(d,k,c,r)=0 when k<c+2.

Thus the actual raw coefficient strictly exceeds the corresponding template
coefficient exactly in this range. This is a coefficient comparison, not a
log-concavity assertion.

MarkovCorrectionNewtonMD02 proves a positive binomial expansion for every
H(d+D,k,a,b). Its coefficient in the basis C(d,m)C(k,n) is exactly

    sum(l=0..b) sum(p=0..b-l)
      C(a+l,a) C(D+a,b-l-p) [m=p] [n=a+l+2].

Here brackets are integer indicators. The theorem identifies these with
the actual iterated forward differences at (0,0), using a fresh build of the
generic Newton identities previously proved in MarkovNewtonM295. Hence every
mixed Newton coefficient of E(d+D,k,c,r) is nonnegative, uniformly in all
five natural parameters and both residues. This establishes no sign for the
total coefficient gap: subtraction remains present there.

## A universal mixed-gap obstruction

Write R=T+D for its template and correction parts and define

    Q(x,k,r,c)=2T(c+1)D(c+1)-T(c)D(c+2)-D(c)T(c+2).

MarkovMiddleCrossObstructionMD02 proves the exact decomposition

    R(c+1)^2-R(c)R(c+2)
      = [T(c+1)^2-T(c)T(c+2)] + Q
        +[D(c+1)^2-D(c)D(c+2)].

For every x,c,r, Q vanishes for k<c+2. At k=c+2, exactly the first correction
coefficient has appeared, so

    Q(x,c+2,r,c)=-D(c)T(c+2)<0.

Consequently its first potentially nonzero k-forward difference, of order
c+2 at zero, is negative. In particular its bivariate Newton coefficient at
(0,c+2) is negative for every c and both residues. All corresponding source
triples are polygon-valid, as separately proved. These are auxiliary mixed
gaps, not the total raw gaps required by the conjecture.

The concrete source 3/26 at row 15 and columns 3,4,5 has raw coefficients
[44136,824160,7921380]. Its mixed gap is -887194560, while its total raw gap is
329621677920>0. MarkovMiddleDiagnosticsMD02 proves these exact values and
attaches the raw triple to the actual path threePathM9E2 7 false, with labels
and polygon membership. Thus the universal mixed-gap obstruction cannot be
misread as a refutation of Conjecture63.

The same module checks a separate failed factorial shortcut at source 3/20:
the raw triple [15463,161860,854028] has positive gap 12992824636, but replacing
the neighbor product by twice that product gives gap -213010328. This altered
inequality is explicitly auxiliary and does not replace the pinned raw target.

## Exact remaining condition

Define G(r,c,x,k)=R(x,k,r,c+1)^2-R(x,k,r,c)R(x,k,r,c+2).
MiddleShortLCMD02 asserts G>=0 for every r,c,x,k. It is unproved.
MiddleNewtonMD02 asserts nonnegativity of every mixed forward difference of
each G at (0,0). The generic finite Newton expansion proves that this stronger
condition implies MiddleShortLCMD02; no converse is claimed.

The source adapter covers every horizontal column of the middle strip under
MiddleShortLCMD02, using previously proved small columns as needed.
MarkovMiddleShortResidualMD02 proves the exact equivalence

    Conjecture63 iff MiddleShortLCMD02 and ThreeOutsideMiddleMD02 and OtherFourM9E2.

The two other predicates retain every remaining row, all vertical and diagonal
clauses, and all other source families. All three conjuncts remain unproved.
The stronger Newton condition is merely sufficient for the first conjunct.

## Finite experiments and limits

The direct recurrence experiment checked 15755 new source identities, including
1408 zeros, and the same number of correction and exact-support identities.
It checked 378853 polygon-valid raw triples in all three directions without
failure. These are finite observations, not proof premises.

Exact finite-difference probes through starting column 18 found no negative
total-gap Newton coefficient. They found negative mixed-gap coefficients in
every tested column; the universal onset theorem explains the first of these.
The tested template gap alone dominates the negative mixed-gap coefficients,
but no uniform domination theorem is established. The correction's own gap
had no negative Newton coefficient in the tested range; that remains distinct
from the proved Newton positivity of the correction coefficients themselves.

Additional probes found nonnegative top-gap Newton coefficients through index
12. The candidate strengthening (i+4)M(i+1)^2>=(i+5)M(i)M(i+2) passed 101871
top-mass tests and 48 finite Newton-grid cases covering the top and both middle
residues through index 15. The unshifted factorial version failed 1000 of 37536
tests. Exact Sturm tests also reject blanket real-rootedness of these high-tail
polynomials. None of these tests proves the surviving strengthening.

Final compilation, joint isolated kernel replay and allowed-axiom checks are
local validation over inherited compiled imports. They are not a fresh
whole-source rebuild or the required independent source/English audit.
