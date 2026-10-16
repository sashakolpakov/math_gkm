# Positive lower rows and the minimal denominator

Machine-authored request daba8bcf97ae4038b0d8ea8a63d4a71e.
This is partial research on the full pinned Conjecture63. It does not close it.
Build, joint kernel replay, and axiom receipts determine checked status.

Write a=1+u. The inherited forcing and residual rows are J_j(n,u) and H_j(n,u).
The inherited parameter identity holds for both families F:

    F_(j+1)(n+2)+F_j(n)=F_(j+1)(n+1)+a F_j(n+1).

Adding four shifted copies gives the diagonal-operator identity

    F_(j+2)(n+4)+2F_(j+1)(n+2)+F_j(n)
      =F_(j+2)(n+2)+2aF_(j+1)(n+2)+a^2F_j(n+2).

Substituting H's inherited signed row recurrence gives

    H_(j+2)(n+4)-2H_(j+1)(n+2)+H_j(n)
      =J_(j+2)(n+4)+2J_(j+1)(n+2)+J_j(n).

On the diagonal n=2j+1+d, this scalar second-difference identity and its two
initial values prove

    H_j(n)=J_j(n)+4 sum_(s<j)(j-s) J_s(n-2j+2s), n>=2j+1.

This proof uses only inherited recurrences and finite sums; it does not rely
on the exploratory Lagrange-inversion derivation that first suggested the
formula. In particular there is no missing power-series substitution bridge.

The exact forcing coefficient is already known, so the new formula gives

    [u^k]H_j(2j+1+d)
      =C(j+3,k+3) C(d+j+k+3,k)
       +4 sum_(s<j)(j-s) C(s+3,k+3) C(d+s+k+3,k).

Every summand is nonnegative. The first is strictly positive for 0<=k<=j;
the inherited degree bound supplies the zero tail. Thus H has exact interval
support 0..j, for every d,j>=0, with no finite bound.

At d=0 the product of binomials in each summand simplifies:

    C(s+3,k+3) C(s+k+3,k)=C(2k+3,k) C(s+k+3,2k+3).

A double hockey-stick identity evaluates the weighted sum. Consequently

    h(j,k):=[u^k]H_j(2j+1)
      =C(2k+3,k)[C(j+k+3,2k+3)+4C(j+k+4,2k+5)].

For k<=j put B(j,k)=C(j+3,k+3) C(j+k+3,k),
D(k)=(2k+4)(2k+5), and E(j,k)=4j^2+16j+2k+20. Then

    h(j,k) D(k)=E(j,k) B(j,k),
    B(j,k+1)(k+1)(k+4)=B(j,k)(j+k+4)(j-k).

These exact identities yield a positive-denominator ratio recurrence.
After substituting j=k+s+2, the difference between consecutive ratios has
a polynomial numerator with nonnegative coefficients in k,s. Lean verifies
that certificate by ring normalization and positivity. This proves adjacent
LC at every interior coefficient. Exact positive interval support and zero
extension then give every cross inequality, including all integer indices:

    minimal_row_crossMDAB (j : Nat).

This discharges the previously open minimal-denominator premise of
lower_shape_of_differenceM468. RowDifferenceShapeM468 remains open. New
theorems prove that its actual difference is nonnegative, strictly positive
in coefficients 1..j, and zero in coefficient 0; they do not prove CrossLC
or the mixed inequalities required by that premise.

The positive sum also transports directly to raw source coefficients, since
every summand has the same binomial factor a^(n-2j-1). For either complete
numerator-three family n=3q+1 or 3q+2 and every j<=q,

    A(t+3,j)=C(n-j-1,t) C(t+j+3,j)
      +4 sum_(s<j)(j-s) C(n-2j+s-1,t) C(t+s+3,s).

This is a positive integer formula for literal raw coefficients. Columns
i<3 vanish in this region. The tail t+j+1>n vanishes, and every polygon-valid
point in these lower rows is strictly positive. These statements are proved
through source_lower_rowMFFD and source_three_rawM9E2, not inferred from scans.
Positive sums alone do not establish log-concavity.

A second conditional route uses

    G(n,j,k)=H_j(n)[k+1]^2-H_j(n)[k]H_j(n)[k+2].

The minimal theorem supplies G(2j+1,j,k)>=0. If G is nondecreasing in n for
every j and every interior k, induction proves uniform row LC. The new exact
support theorem supplies the all-index CrossLC bridge. The hypothesis
RowGapMonotoneMDAB is unproved. Finite exact tests found nonnegative Newton
coefficients in the denominator slack d for 595 adjacent gaps and 679 cross
gaps. No finite interpolation or tested coefficient sign enters a proof.

The exact root residual remains ThreeRemainingM468 AND OtherFourM9E2.
No new complete source direction, correction-band inequality, larger-
numerator result, or root closure is claimed. Even proving the entire lower-
row condition would leave those residual obligations.
