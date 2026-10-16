# Uniform numerator-two diagonal argument

Machine-authored live research 8f77f49334284c7b8a1caedbade68c5c.
This argument compiled, jointly kernel-replayed, and passed the explicit axiom
closure audit. The source-bound validation inventory records the checked
declarations. Full root open.

Write K(a,b,j,r)=sum_k w(k) C(a+j-k,a) C(b+r-k,b), with
w(0)=1 and w(k)=2 thereafter and the usual zero extension.
The inherited H(n,j,r) is K(n+2,n,j,r).

Let B(b,r,k)=w(k) C(b+r-k,b), zero for k>r, and let f_a(k)=C(a+k,a).
Then K(a,b,.,r)=B(b,r,.)*f_a by ordinary finite convolution.
The prefix of f_a is f_(a+1), so K(a+1,b+1,.,r) is also the convolution
of f_a with the prefix C of B(b+1,r,.).

For 1<=x<y, B(b,r,y)<=B(b,r,x), whereas C(y)>=C(x).
The only exceptional likelihood-ratio comparison is x=0,y=1.
For r=u+1 it reduces to 2DE<=A(E+2F), where
A=C(u+b+1,b), D=C(u+b,b), E=C(u+b+2,b+1), F=C(u+b+1,b+1).
The exact scaled gap is

    (b+1)(u+b+1) [A(E+2F)-2DE]
      = A^2 [u^2+2ub+b^2+u+3b] >= 0.

The r=0 case is immediate. Thus every B,C two-by-two minor is nonnegative.
Convolution by f_a preserves this order, by the finite determinant identity
and the proved Toeplitz minors of the negative-binomial sequence.
This gives monotonicity in j of K(a+1,b+1,j,r)/K(a,b,j,r).
Swapping a,b and j,r gives monotonicity in r as well.

The rectangular prefix sum of K(a,b,.,.) is K(a+1,b+1,.,.).
The ratio at each point of the rectangle [0,j] x [0,r] is bounded by the
ratio at (j,r). Summation therefore yields

    K(a,b,j,r) K(a+2,b+2,j,r) <= K(a+1,b+1,j,r)^2.

Together these are the two previously missing ReducedShapeMDB9 premises.
The existing row inequality and scalar multiplication/cancellation argument
then imply the source diagonal inequality for every starting column i>=3.
The proof is uniform in all indices; no source parity is needed for the
stronger kernel result. The source adapter still preserves the exact parity,
support and zero tails. The small starting columns were subsequently discharged
as described below. OtherSourcesM679 remains explicit and unproved.

## Completing the small columns

The same parameter proof is valid at n=0. The exact source kernel identification
extends through column i=2; its last supported row is the top binomial coefficient,
not zero. This proves all source diagonal triples starting at i=2.

Starting at i=0, polygon membership forces the triple onto one of the first two
upper slices, already proved. Outside the polygon the first raw coefficient is
zero. Starting at i=1, membership forces j>=q-1. The old top-six result handles
the upper tail. The remaining cases are j=q-1, j=q, and j>q. In the last region,
put j=N+2d, q=N+d. The three gaps are respectively

    L(q,0,2)^2 - U(q-1,1,1)L(q-1,1,3),
    U(q-1,1,2)^2 - U(q-2,2,1)L(q,0,3),
    U(N-1,d+1,2)^2 - U(N-2,d+2,1)U(N,d,3).

The inherited source formulas identify L and U with raw coefficients. After
q=x+2, q=x+3, or N=x+3,d=y+1, respectively, each gap is a rational polynomial
with nonnegative coefficients. Ordinary Lean normalization checks the identities
and positivity. These are uniform polynomial certificates, not finite tests.

The final assembly proves source_two_globalM8F7, all raw directions of every
numerator-two source, and Conjecture63 iff OtherSourcesM679. All source numerators
at least three and every remaining correspondence obligation are retained.

Failed probes are in strategy-probe.json and general-probe.json in this run's
evidence directory. The fixed min/max summand certificates failed. A weight-3
generalization fails its parameter/row minor at n=0,j=0,r=1; the actual
weight-2 comparison is on its sharp boundary there. These are auxiliary
certificate failures, not failures of the pinned root.
