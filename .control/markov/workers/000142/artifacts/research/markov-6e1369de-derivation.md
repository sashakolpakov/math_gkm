# Full numerator-two central row

Machine-authored live request 6e1369de81764210b3799e9af43f1bb5.
This is a proper-subfamily result. Full pinned Conjecture63 remains unresolved.
Build, replay and closure receipts determine which formal modules are accepted.

Write F_n for the inherited recurrence-defined Fibonacci numerator. For l≥1
and t<n, including l+t>n, its coefficient is

    [u^l v^t]F_n = C(n-t-1,l-1) C(t+l,l).

The out-of-degree case follows from the inherited degree bound and a zero
binomial, not from extending a positive-range formula by assumption.

For l,b≥1, the u^l and u^b coefficient product in the row v^n of F_(n+1)^2
contains the summand

    C(n-t,l-1) C(t+l,l) C(t,b-1) C(n-t+b,b).

Two applications of the finite choose-product identity rewrite this as

    C(l+b-1,l) C(l+b-1,b)
      C(t+l,l+b-1) C(n-t+b,l+b-1).

The convolution sum over t=0,...,n is C(n+l+b+1,2(l+b)-1).
The shifted convolution is proved by extending the summation interval and
proving every added term zero. The unshifted convolution is proved by induction
using Pascal and the hockey-stick identity. Thus there is no appeal to an
infinite series, convergence, or an unformalized summation identity.

Summing over l+b=i and using finite Vandermonde gives

    [u^i v^n]F_(n+1)^2 = C(2i-2,i-2) C(n+i+1,2i-1), i≥2.

For i=0,1 the coefficient is zero, since every summand contains an axis
coefficient strictly below its unique nonzero degree. The source identity
P_(2/(2q+1))=F_(q+1)^2+v F_q^2, q≥1, therefore yields

    D_i = A(i,q) = C(2i-2,i-2)
      [C(q+i+1,2i-1)+C(q+i,2i-1)], i≥2,
    D_0=D_1=0.

For the inequality put i=k+2 and E_k=C(q+k+2,k) C(q+2,k+2).
Finite choose identities, with all natural subtractions guarded, prove

    (2k+3) D_(k+2) = (2q+3) E_k, k≤q,
    (k+1)(k+3) E_(k+1) = (q+k+3)(q-k) E_k.

Define A_k=(2k+5)(k+1)(k+3), B_k=(q+k+3)(q-k)(2k+3).
Then A_k D_(k+3)=B_k D_(k+2). For k+2≤q, the two consecutive
recurrences imply the exact raw-gap identity

    A_k A_(k+1) (M²-LR) = (B_k A_(k+1)-B_(k+1) A_k) L M,

where L=D_(k+2), M=D_(k+3), R=D_(k+4). Writing q=k+2+r,
the parenthesized factor has the following positive-coefficient expansion:

    1230+651r+93r² +2422k+1068kr+126kr²
    +1852k²+644k²r+56k²r² +682k³+168k³r+8k³r²
    +120k⁴+16k⁴r+8k⁵.

Lean ring checks the identity; positivity proves its sign for natural k,r.
The factors A_k,A_(k+1) are positive. This proves LR≤M² without dividing
by a coefficient. If k+2>q, R=0 and the inequality follows from M²≥0.
The i=0,1 cases similarly retain their zero left endpoint.

The polygon section at a=2,b=2q+1,j=q is exactly 2≤i≤q+2.
The formula is positive on that interval and zero outside it. The source-row
inequality is stronger than the polygon-restricted horizontal clause because
it quantifies over every natural starting column.

No conclusion is drawn for other numerator-two rows, vertical or diagonal
triples, or all higher numerators. Existing results may cover parts of those
regions, but the exact residual retains every remaining obligation.
