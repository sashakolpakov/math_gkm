# Lower rows and the next horizontal row

Machine-authored request ffd747f5c7a147069d5bfcaffb3e60e8.
The full pinned conjecture remains open. This is a local mathematical report,
not an independent completion audit. Consult final validation receipts for
the exact accepted modules; candidates are not results until checked.

Write a=1+u and n=3q+1 or 3q+2. For j<=q, the exact source row is

    [v^j] P_(3/n)(u,v,1) = u^3 a^(n-2j-1) H_j(n,u).

All exponents are nonnegative in this domain. Set

    J_j(n,u)=sum_(s=0)^j C(j+3,j-s) C(n-j-1,s) u^s a^(j-s).

H_0=J_0; H_1=J_1+2aJ_0+2(1-u)H_0; and for j>=2,

    H_j=J_j+2aJ_(j-1)+a^2J_(j-2)
        +2(1-u)H_(j-1)-a^2H_(j-2).

The weighted-binomial identity behind the proof is

    [u^t] sum_s C(c,j-s) C(N,s) u^s(1+u)^(N-s)
      = C(N,t) C(t+c,j).

It follows from Vandermonde and C(N,t)C(t,s)=C(N,s)C(N-s,t-s), with
zero terms retained when s>t. Factoring out a^(n-2j-1) identifies the
Fibonacci second-difference row. The guarded row operators implement exactly
the existing discriminant equation. Triangular uniqueness identifies the
candidate with lowerRawME9C on 2j+1<=n. The inherited lower-region source
theorem then proves the displayed source identity for every q and j<=q.
The source theorem quantifies over all raw columns, including zero tails.

The recurrence is signed. No blanket LC closure follows. A useful remaining
uniform sufficient condition is LowerRowShapeMFFD: CrossLC of every H_j(n,u)
when n>=2j+1. Pascal smoothing and the u^3 shift would then prove all lower
horizontal source rows. This condition is unproved and addresses only one
direction and one region.

For j=5, put n=11+d. The proved exact coefficients of H_5 are

    560,
    3030+406d,
    7140+1684d+100d^2,
    8652+(8338/3)d+298d^2+(32/3)d^3,
    5280+(6269/3)d+(619/2)d^2+(61/3)d^3+d^4/2,
    1287+(11899/20)d+(2629/24)d^2+(241/24)d^3
      +(11/24)d^4+d^5/120.

For d>=0 these coefficients are positive. Each of the four adjacent gaps
expands as a polynomial in d with positive coefficients. MarkovFifthShapeMFFD
checks the identities by ring normalization and proves nonnegativity in Lean.
Its support is the interval 0..5; the inherited adjacent-plus-interval theorem
then supplies CrossLC with zero extension. No normalized coefficient property
or real-rootedness is assumed. MarkovFifthIdentityMFFD proves the exact
identification, and MarkovFifthSourceMFFD transports the inequality to the
source. MarkovFifthSmallMFFD proves the q=1..4 cases by ordinary kernel
reduction for the bounded support and the inherited universal degree-tail
theorem. In particular n>=11 alone is not a sufficient lower-source bound:
row j=5 uses the lower formula only when q>=5. The exceptional q<=4 source
rows are not silently replaced by the auxiliary residual.

MarkovRowDegreeMFFD proves degree(H_j)<=j and the entire zero coefficient
tail. MarkovResidualMFFD proves Conjecture63 iff ThreeRemainingMFFD and
OtherFourM9E2. The new residual removes exactly horizontal j=5 from the
inherited ThreeRemainingM1BB; every other clause is retained. Neither
remaining predicate is proved.

The experimental finite range n<=100, j<=25 had 19,600 adjacent tests with
no failure; direct source recurrence checked 21,930 row coefficients and
1,560 j=5 triples at q<=20. These experiments are not universal proofs.
