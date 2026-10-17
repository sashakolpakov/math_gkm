# Centered cuts and exact rational pair reduction

Machine-authored request ad504da6c8b84f10b937c15cf985413e. The full pinned
Conjecture63 remains unresolved. No experimental inequality is promoted to a theorem.

Write L(j,t,m) for the inherited integer binomial kernel. Its complete reversed
polynomial E(j,t) has coefficient L(j,t,j-k) at 0<=k<=j and zero thereafter.
The new support theorem proves these coefficients strictly positive on that
whole interval. In common coordinates use A=E(j,t), B=X E(j,t+1),
C=X^2 E(j,t+2). The already proved complete gap is multiplied by X^2, hence
B^2-AC has nonnegative coefficients. B has exact positive support [1,j+1].

For p=(i,k) set b(p)=B_i B_k and
a(p)=2 B_i B_k-A_i C_k-C_i A_k. The new generic normalized-cut theorem permits
b>=0 and requires a<=0 wherever b=0. With nonnegative A,C coefficients this
condition is automatic; the negative zero-factor terms are kept. The sum of
a over an antidiagonal with min(i,k)>=h is exactly twice the literal cut gap.
An ordered cross-product condition a(p)b(q)<=a(q)b(p), in increasing min rank,
therefore implies every cut gap is nonnegative. Interval support and symmetry
reduce all comparisons to adjacent inward pairs (i,k)->(i+1,k-1).

The precise common-coordinate identity, for H+t=j+h, is

    X^j liftCut(j,t+s,h) = X^t cut_H(X^s E(j,t+s)).

It is proved for every natural j,t,h,s,H with that equality, retaining leading
and trailing zeros. Applied at s=0,1,2, it connects the centered cut criterion
to LiftMiddleMFEE without negative polynomial exponents.

The exact rational ratios use

    W(j,T,m)=(T+m+4)(T+m+5)+4(j-m)(T+j+4),
    A(j,T,m)=m(T+m+4)(T+m+5)(W-2)
              /[(j-m+1)(T+m+2)(T+m+3)W],
    B(j,T,m)=(j-m)(T+m+4)(T+m+5)(W+2)
              /[(m+1)(T+m+6)(T+m+7)W].

For 0<=m<=j, the previous factor is zero at m=0 and otherwise L(j,t,m-1).
It equals L(j,t+1,m)*(t+4)/(t+j+4)*A(j,t+1,m). The next factor
L(j,t+2,m+1) equals L(j,t+1,m)*(t+j+5)/(t+5)*B(j,t+1,m), including
the zero at m=j. Both identities are proved without dividing by a kernel value.

The single remaining rational premise RationalPairStepMAD5 is, for every
natural j,T,m,n with T>=1, n+2<=m<=j,

    A(m-1)B(n+1)+A(n+1)B(m-1) <= A(m)B(n)+A(n)B(m).

MarkovRationalBridgeMAD5 proves that this premise implies all numerator-three
lower horizontal raw inequalities, all columns including zeros, in both
3/(3q+1) and 3/(3q+2) families. It proves a conditional root theorem retaining
ThreeOutsideLowerMFEE and OtherFourM9E2 completely. The rational premise is
NOT asserted as proved and is not claimed equivalent to the full root.

The large polynomial candidate remains under investigation. Six half-product
expansion modules compiled; the larger two did not finish within the attempted
bounds. None of the unattempted coefficient-positivity modules or the aggregate
positivity module is admitted by those successes. Singular factorization found
the additional factor g+1; this is computer algebra evidence, not a Lean proof.
Exact denominator clearing and the small-factor candidate bridge are recorded
below. Ten core modules passed joint kernel replay and their 54 theorem closures
use only permitted axioms.

## Exact cleared and factored obligation

MarkovClearingBridgeMAD5 proves RationalPairStepMAD5 iff
ParametricPairPositiveMAD5. The latter asserts nonnegativity of the literal
denominator-cleared polynomial for every natural T,x,g,z, with central parameter
t=T+1, n=x, m=x+g+2 and j=m+z. The reverse direction uses t-1,m-n-2,j-m
and proves all natural-subtraction side conditions. Every denominator is proved
strictly positive before clearing.

MarkovFactorBridgeMAD5 proves, for arbitrary rational T,x,g,z,

    cleared numerator = pairPrefactorMAD5(T,x,g,z) * pairReducedMAD5(T,x,g,z).

The reduced polynomial is precisely the four signed products assembled from the
inherited factor candidate. Each small factor identity and the assembled product
identity is checked by ordinary Lean ring proofs. The prefactor consists of the
six inherited common positive linear factors and W at the four pair positions.
The additional W product accounts for clearing the eight full ratio denominators
instead of the predecessor's common denominator with only one W at each position.
Its strict positivity is proved for nonnegative parameters.

Consequently ReducedPairPositiveMAD5 iff ParametricPairPositiveMAD5, and the
proved lower_horizontal_of_reducedMAD5 transports ReducedPairPositiveMAD5 all
the way to the actual raw source lower horizontal inequalities. The reduced
polynomial positivity is the remaining premise on this route. It is unproved.
This is a conditional source reduction, not a new unconditional source direction
and not a resolution of Conjecture63.
