# Full central row: derivation awaiting Lean formalization

Machine-authored 3a11314d. This document is an ordinary mathematical derivation,
not a kernel-checked theorem or root closure. The accepted Lean work proves
only the i=2,3,4 coefficients and their adjacent inequality.

For n>=1 and 0<=t<n, the inherited Fibonacci coefficient formula gives

    [u^ell v^t] F_n = C(n-t-1,ell-1) C(t+ell,ell), ell>=1.

Terms outside the total-degree bound are zero; the same binomial expression
is zero there. The u^0 coefficient is v^n. Thus it contributes nothing to
[v^(n-1)]F_n^2. Fix i>=2 and split i=ell+b with ell,b>=1. Its convolution
summand at t is

    C(n-1-t,ell-1) C(t+ell,ell)
      C(t,b-1) C(n-1-t+b,b).

The elementary factorial multiplication identity rewrites this as

    C(i-1,ell) C(i-1,b)
      C(t+ell,i-1) C(n-1-t+b,i-1).

Summing over 0<=t<n yields C(n+i,2i-1) times the first two factors.
Indeed put x=t+ell and N=n+i-1; the standard binomial convolution
sum_x C(x,i-1)C(N-x,i-1)=C(N+1,2i-1) applies. The omitted x below ell
have x<i-1, and those above n-1+ell have N-x<b<=i-1, strictly below b;
their terms vanish. This also handles out-of-support i by zero binomials.
Summing ell=1,...,i-1 and applying Vandermonde once more gives

    [u^i v^(n-1)]F_n^2=C(2i-2,i-2) C(n+i,2i-1).

Consequently the exact source identity P_(2/(2q+1))=F_(q+1)^2+v F_q^2,
q>=1, predicts the following full central-row formula:

    D_i=A(i,q)=C(2i-2,i-2)
       [C(q+i+1,2i-1)+C(q+i,2i-1)], i>=2.

D_0=D_1=0, D_i>0 for 2<=i<=q+2, and D_i=0 for i>q+2.
For the positive range, factorial simplification gives

    D_i=(2q+3)(q+i)! / [(2i-1)(i-2)! i! (q-i+2)!],
    D_(i+1)/D_i=(q+i+1)(q-i+2)(2i-1)/[(2i+1)(i-1)(i+1)].

For i>=2 with i+2<=q+2, the first factor
N_i=(q+i+1)(q-i+2) decreases by 2i on replacing i by i+1, and remains
nonnegative. The second factor
f_i=(2i-1)/[(2i+1)(i^2-1)] is positive and decreasing: after multiplying
positive denominators, f_i-f_(i+1) has numerator

    8i^3+8i^2-2i+1>0.

Thus the adjacent ratios decrease on the positive interval, proving the
central-row adjacent inequalities at the ordinary mathematical level.
All remaining triples have a zero endpoint. No normalization of D_i is used.

Formal obligations still open for this full-row argument: generalized global
Fibonacci coefficient formula with all zero cases; two finite binomial sum
reindexings; the multiplicative binomial identity; factorial cancellations
only on the stated positive range; ratio monotonicity transport; final
all-source central-row adapter. None is adopted as an axiom. The proven
finite-coefficient result does not silently discharge these obligations.

Even full formalization of this central row would leave other numerator-two
rows and both other directions, and all higher numerators, unresolved.
