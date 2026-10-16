# Positive upper-row formula and exact horizontal reduction

Machine-authored request 2b34268bc69f47e9a04cd494ac77bc26. Full Conjecture63
is unresolved. Source-bound validation receipts determine the accepted modules.

For N,d>=1, put q=N+d, j=N+2d. Thus q<j<2q. The new formula is

    A(i,j) = U(N,d,i),
    U(N,d,0)=0,
    U(N,d,i)=sum_(h=0)^i C(2d+h-1,h) C(max(2i-2-h,0),i-h)
                    [C(N+i-h+1,2i-1-h)+C(N+i-h,2i-1-h)]  (i>=1).

All coefficients are raw integers. The upper index truncation at i=h=1 is
intentional: the formula gives U(N,d,1)=4d. Its support is exactly
1<=i<=N+2, precisely the horizontal polygon section. Every zero column,
including i=0 and columns beyond the degree, is covered.

The actual source theorem is source_two_upper_formulaM2B3, for every path
with a=2,b=2(N+d)+1. It uses the inherited, recurrence-derived identity
P=F_(q+1)^2+v F_q^2. No experimental formula is a premise.

## Derivation and the endpoint correction

For F_(N+d+1)^2 at row N+2d and positive column allocations l,b, the convolution
is supported on t=d,...,N+d. Write t=d+s. Its two coefficients contain

 C(N-s,l-1) C(s+d+l,l) C(s,b-1) C(N-s+d+b,b).

The rising Vandermonde identity expands

 C(s+d+l,l)=sum_(e=0)^l C(d+e-1,e) C(s+l-e,l-e).

Ordinary choose-product identities and the shifted binomial convolution then
give the exact double sum in upper_pair_shiftedM2B3. The e,f contributions
are subsequently summed over l with explicit guards e<=l and f<=i-l.
For e+f<i, ordinary Vandermonde gives C(2i-2-e-f,i-e-f). For e+f=i there
is exactly one surviving allocation, l=e; the proof treats this separately.

The l=0 and l=i original allocations do not vanish in upper rows. Each equals
C(d+i-1,i) C(N+1,i-1). They correspond exactly to the missing corners e=i,f=0
and e=0,f=i of the positive double sum. They must not be added again after
extending that sum. The failed initial Python formula did add them again;
its mismatches are preserved in upper-probe.json. upper-probe-v2.json fixes it.

Finally, summing e+f=h combines the rising weights into C(2d+h-1,h).
upper_square_formulaM2B3 proves the square formula for all N>=0,d>=1,i>=2.
The zero and first columns are proved separately. Applying the square formula
at N and N-1 gives the source formula for N>=1.

## Exact scope reduction

NumeratorTwoHorizontalM2B3 states every polygon-valid horizontal inequality for
every path with a=2. UpperBinomialLCM2B3 states U(i)U(i+2)<=U(i+1)^2 for all
N,d>=1 and all natural i. numerator_two_horizontal_iffM2B3 proves their
equivalence, with no finite bounds.

The forward implication uses actual paths lowerPathM58E N d and the proved
support/polygon equivalence. Outside support, a neighbor is zero and the
inequality is immediate. The reverse implication uses the inherited lower-half
theorem for j<=q. For j>=2q, a valid horizontal triple forces j=2q and i=0;
the zero-column theorem handles it. All other upper rows have N=2q-j>=1 and
d=j-q>=1 and therefore use the new formula. Thus no numerator-two horizontal
row is omitted from this equivalence.

Neither side of this equivalence has been proved. The full pinned root still
also contains other numerators, vertical and diagonal directions, endpoints
and all inherited residual clauses.

## Remaining summand sign and checked algebraic tools

upperTermM2B3 is the displayed summand, explicitly zero for i=0 or h>i.
upper_lc_of_shiftedM2B3 proves the finite summation implication from

 T(i,h)T(i+2,k) <= T(i+1,min(h+1,k))T(i+1,max(h+1,k)-1).

The common summation range is extended with proved zeros; the inherited
four-functions theorem supplies the implication. UpperShiftedM2B3 is the
unproved global assertion of this sign. Its implication into the complete
numerator-two horizontal subproblem is formalized.

For i>=2,h<=i,i<=N+2, write K for the unweighted upper core. The exact identity

 (2i-1-h)K(N,i,h)=(2N+3-h) C(N+i-h,i-h) C(N,i-2)

and horizontal/diagonal scaled recurrences are formalized in MarkovUpperCoreM2B3.
These identities retain zeros and do not divide by coefficients. Their ratios
are Hnum/Hden and Dnum/Dden, where

 Hnum=(N+i-h+1)(N-i+2)(2i-1-h),
 Hden=(i-h+1)(i-1)(2i+1-h),
 Dnum=(N-i+2)(2i-1-h)(2N+2-h),
 Dden=(i-1)(2i-h)(2N+3-h).

MarkovUpperScalarM2B3 checks fifteen nonnegative polynomial expansions for
the ratio comparisons. The six parameter regions encode all k,p,r>=0 with
k+p+r>=2; the local comparison uses three regions for k+r>=2. These are
scalar signs only. They have not been glued into the global summand theorem.
That requires support guards, positive denominator proofs, the rising-weight
inward inequality, and the exceptional i=1 core comparisons. No missing
implication may be inferred from the experimental success of these certificates.
