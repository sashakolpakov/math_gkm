# A fixed rational generating function for the residual rows

Machine-authored ffd747f5. Proposed derivation, not a formal coefficient bridge
or a universal LC proof. The new row/source theorem is separate and checked.

Let a=1+u, N=n-j-1, and use t as a row-generating variable. Vandermonde gives

    sum_j J_j(N+j+1,u)t^j = (1-t)^N/(1-at)^(N+4).

Write B=(1-t)/(1-at). The row recurrence is consistent with

    F_N(t)=sum_j H_j(N+j+1,u)t^j
      = (1-t)^N (1-at^2)^2 /
        ((1-at)^(N+4) (1-2t+at^2)^2).

Indeed shifting j to j-1 at fixed n increments N; after factoring B^N,
the denominator appearing in the row recurrence collapses by

    (1-at)^2 -2(1-u)t(1-t)(1-at)+a^2t^2(1-t)^2
      = (1-2t+at^2)^2.

The numerator is (1+atB)^2, and 1+atB=(1-at^2)/(1-at).
The recurrence determines coefficients inductively in j for all N at once.
Formal power-series operations and that uniqueness argument have not yet been
implemented in Lean, so this paragraph is a mathematical derivation to verify.

Under t=z/(1+z), the coefficient substitution rule gives the especially simple

    H_j(n,u) = [z^j] (1+z)^(j+3) (1+2z-u z^2)^2 /
                         ((1-u z)^(n-j+3) (1+u z^2)^2),

for n>=j+1. Expanding the numerator into monomials c*u^h*z^m with

    (h,m,c)=(0,0,1),(0,1,4),(0,2,4),(1,2,-2),(1,3,-4),(2,4,1)

produces the finite coefficient formula

    [u^k]H_j = sum_(h,m,c) sum_(s=0)^(k-h)
      c*(-1)^s*(s+1)*C(n-j+2+k-h-s,k-h-s)
                     *C(j+3,j-k+h-s-m).

Binomials with a negative lower index are zero; k<h contributes no term.
The formula is signed and does not prove positivity or LC. Its u=0 term is
C(j+3,j)+4C(j+3,j-1)+4C(j+3,j-2), agreeing with the inherited fifth-degree
constant-column expression. The direct finite comparison is saved separately
in resolvent-experiments.json. The proposed bridge and all universal shape
claims remain open; this cannot replace ThreeRemainingMFFD or OtherFourM9E2.
