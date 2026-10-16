# Mathematical checkpoint

Machine-authored live request ce882be3be764bbea0eaabd905e3bf18.
The exact pinned Conjecture63 remains unresolved.

Write A(i,j) for the protected raw integer coefficient. This run addresses
the vertical strip A(i,1) A(i,3) <= A(i,2)^2. The low cone b>=3a was inherited.
The first checked extension covers b>=2a. The complete strip assembly has now
compiled as source_strip_fullMCE8 in MarkovStripFullMCE8.lean; final
validation.json records kernel replay and theorem-axiom audit status.

For a>=2, b>=7 and a<=i<=a+b-4 put k=i-a, l=b-2-k and N=k+l.
Then k>=0, l>=2, N>=5. Put C=choose(N,k),
q=max(2a-b,0), t=min(b-a,max(3a-b,0)), u=max(3a-2b,0).
The low-cone polynomials T,J0,H0 are defined in MarkovStripGapMB9D.
The exact general scaled identities are

* N A(i,1) = C T;
* 2 N(N-1)(N-2)(k+1) A(i,2) = C l J;
* 6 N(N-1)(N-2)(N-3)(N-4)(k+1)(k+2) A(i,3) = C l(l-1) H,

where

J=(k+1)J0+8q(l-1)(l-2)(l-3),

H=(k+1)(k+2)H0
 +24(a+b-7)q(k+1)(k+2)(l-2)(l-3)(l-4)
 +(24t+(72a-120)q)(k+2)(l-2)(l-3)(l-4)(l-5)
 +24u(l-2)(l-3)(l-4)(l-5)(l-6).

These follow from the inherited exact source row identities, polynomial swap,
the real coefficient map, and zero-inclusive shifted binomial identities.
No factorial or binomial normalization is applied to the conclusion.

The general gap is
G=3(N-3)(N-4)(k+2)l J^2 - 2(N-1)(N-2)(k+1)(l-1)T H.
The checked scalar identity is

12[N(N-1)(N-2)]^2(N-3)(N-4)(k+1)^2(k+2)
 (A(i,2)^2-A(i,1)A(i,3)) = C^2 l G.

The scalar on the left is strictly positive. For b<=2a and 3a<=2b,
write a=(b+q)/2, t=(b-q)/2, u=0. For 2b<=3a,
write a=(2b+u)/3, q=(b+2u)/3, t=(b-u)/3. In both cases
the gap has nonnegative coefficients after each of four index substitutions:
l=L+5,k=K; l=2,k=K+3; l=3,k=K+2; l=4,k=K+1.
All free parameters in these charts are nonnegative. Lean ring normalization
and positivity check these identities directly, without importing symbolic
Python computations as assertions. The charts cover all k,l in the domain.

For 2a<=b<=3a, the simpler correction is
Hmid=(k+1)H0+24t(l-2)(l-3)(l-4)(l-5), t=3a-b.
Substituting a=(b+t)/3 gives the same four covering nonnegative charts.
Combining with the inherited b>=3a theorem covers every source slope.

Outside a<=i<=a+b-4, one of the end coefficients is zero by the inherited
source polygon support theorem. All such cases remain in the theorem.
Small denominators are classified by reduced numerator/denominator and actual
path uniqueness. The six a>=2,b<=6 source fractions are 2/3,2/5,3/4,3/5,4/5,5/6;
their literal source polynomials give finite kernel arithmetic checks. The
a=1 family is inherited. No finite denominator bound enters the final claim.

Neither the full strip nor its exact residual equivalence resolves horizontal
rows j>=5, remaining vertical triples j>=2, or deeper constant-i+j diagonals.
Every source/English correspondence obligation remains required for root closure.
