# A common diagonal-shift convolution

Machine-authored live request 4f4ac079ee56466da7d21ce9055918ab.
This is a research derivation, not a closed Lean proof of the conjecture.
Only declarations in the final validation inventory count as checked results.

For i>=2 define B(i,j,d)=C(j+i,i) C(j+2d,i-2). The existing lower
coefficient formula has the exact forward difference

    L_i(j+1,d)-L_i(j,d)=B(i,j+1,d)+B(i,j,d).

Pascal lowers the final choose index by one. The product identity
C(n,k)C(k,i)=C(n,i)C(n-i,k-i), followed by Vandermonde, sums the
remaining h terms. At j=0, L_i(0,d)=C(2d,i-2)=B(i,0,d). Thus

    L_i(j,d)=B(i,j,d)+2 sum_(t<j) B(i,t,d).

Similarly put D(i,N,d)=C(N+2d+i,i) C(N,i-2). For d>=1,

    U_i(N+1,d)-U_i(N,d)=D(i,N+1,d)+D(i,N,d),
    U_i(0,d)=D(i,0,d),
    U_i(N,d)=D(i,N,d)+2 sum_(t<N) D(i,t,d).

The upper sum uses the rising-binomial convolution
sum_h C(2d+h-1,h)C(N+i-h,i-h)=C(N+i+2d,i), the coefficient identity
for multiplying geometric-series powers.

Reverse the finite sums. Define w(0)=1 and w(k)=2 for k>=1, and

    K_i(j,m)=sum_(k=0)^min(j,m) w(k) C(j-k+i,i) C(m-k,i-2).

The two formulas become L_i(j,d)=K_i(j,j+2d) and
U_i(N,d)=K_i(N+2d,N). Consequently the candidate unified source
formula is A_q(i,j)=K_i(j,2q-j) whenever i>=2 and j<=2q.
When j>2q the coefficient is zero by the degree bound 2q+2 for i>=2,
except that i=2,j=2q+1 or 2q+2 need explicit checking: their degree
already exceeds 2q+2 after adding i. Formal reindexing and a full source
adapter remain separate obligations unless present in the final inventory.

## Proposed uniform vertical argument

Extend f_i(t)=C(t+i,i) by zero for t<0, g_i(t)=C(t,i-2) by zero for
t<i-2, and w(t) by zero for t<0. Each is nonnegative, log-concave and has
interval support. Then K(j,m)=sum_k w(k) f_i(j-k) g_i(m-k).

For fixed m, w(k)g_i(m-k) is log-concave; convolution with f_i gives
log-concavity in j. The symmetric argument gives log-concavity in m.
The K matrix is TP2: each finite relevant block is a product of a Toeplitz
matrix of f_i, a nonnegative diagonal w matrix, and the transpose Toeplitz
matrix of g_i. Cauchy--Binet expresses each 2x2 minor as a sum of
nonnegative products. Finite truncations preserve interval support and can
cover every index in a specified inequality exactly.

These properties give anti-diagonal LC. Write
a=K(j,m+2), b=K(j+1,m+2), c=K(j+2,m+2),
e=K(j+1,m+1), f=K(j+2,m+1), z=K(j+2,m).
Separate LC gives ac<=b^2 and zc<=f^2. TP2 gives bf<=ec.
If z>0 then m>=i-2 and c>0 (the k=0 summand is positive).
Multiplication and cancellation of c^2 gives az<=e^2.
If z=0 the desired inequality follows from nonnegativity. This would
prove every numerator-two vertical inequality, including both crossings,
once all formula, support and finite convolution bridges are formalized.

This reasoning does not address the remaining constant-i+j direction or
any unresolved numerator>=3 clause. It cannot close the root.
The old exact residual MarkovResidualM295 is preserved.

## A distinct continuation observation

Substituting d<0 in the rational lower polynomial fails without correction:
at i=2,N=2,d=1 the continued value is 55 whereas U_2(2,1)=47.
Finite experiments suggest the difference is independent of N and is
(-1)^i times [u^i v^d] 4uv/((1-u-v)^2-4uv). The positive coefficient sum
is recorded in continuation-probe.json. This uniform identity is unproved
and is not needed by the prefix-convolution approach.
