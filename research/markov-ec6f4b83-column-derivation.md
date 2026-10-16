# A positive column expansion for further research

Machine-authored ec6f4b83. The exact source-linked generating relation is in
MarkovTwoSeriesMEC6. The expanded coefficient formula below is a derivation and
finite experiment, not yet a Lean theorem; no log-concavity consequence is proved.

Write F_n for the inherited Fibonacci polynomial with F_0=1, F_1=u+v and
F_(n+2)=(u+v+1)F_(n+1)-vF_n. Let P_q=F_(q+1)^2+vF_q^2. Every source with a=2
has b=2q+1 and this polynomial for some q>=1. The q=0 member is an auxiliary
initial value, not a claimed source at 2/1.

Put S=u+v+1. Squares satisfy the order-three recurrence with characteristic
polynomial (z-v)(z^2-(S^2-2v)z+v^2). Hence

    P_(q+3)=(S^2-v)P_(q+2)-v(S^2-v)P_(q+1)+v^3 P_q.

For G(t)=sum_(q>=0) P_q t^q, define

    D=(1-vt)[(1-t)(1-v^2 t)-ut(2(v+1)+u)],
    B=(u+v)^2+v-v(S^2+2u)t+v^2(v+1)t^2.

Then D G=B. MarkovTwoSeriesMEC6 proves this identity in formal power series
over the actual integer bivariate polynomial ring, together with the source
coefficient bridge. This is not an analytic assertion and needs no convergence
or numerical division. D has constant coefficient one.

The following algebraic identity is also formally checked:

    (1-v^2 t)B-v(v+1)D = u(1+vt)[2v(1-t)+u(1-vt)].

Expanding the resulting geometric factor formally gives

    G = v(v+1)/(1-v^2 t)
      + sum_(r>=0) 2uv(1+vt) u^r t^r (2(v+1)+u)^r
          /[(1-vt)(1-t)^r(1-v^2 t)^(r+2)]
      + sum_(r>=0) u^2(1+vt) u^r t^r (2(v+1)+u)^r
          /[(1-t)^(r+1)(1-v^2 t)^(r+2)].

All displayed expansions have nonnegative coefficients. For fixed u-column i,
the first sum has k=i-1-r with 0<=k<=r and factor
2^(r-k+1) C(r,k) v(v+1)^(r-k); the second has k=i-2-r with 0<=k<=r and factor
2^(r-k) C(r,k) (v+1)^(r-k). These give finite sums after fixing q.
The i=0 coefficient is exactly v^(2q+1)+v^(2q+2).

The implementation column_probe_ec6f4b83.py extracts coefficients using

    [t^a](1-t)^(-m)=C(m+a-1,a),

with the m=0 case separately equal to 1 for a=0 and 0 otherwise. It compares
547 columns and 19,195 coefficients, including 10,168 zeros, against the
independent word-matrix source implementation. All checks pass. These finite
counts do not prove the expansion or a sign inequality universally.

This representation avoids the j<=q versus j>q split and may be useful for
vertical or diagonal analysis. However, its separate A_r and B_r pieces need
not be log-concave. Already B_0 at q=1,i=2 begins [1,1,2], whereas the actual
source column begins [1,5,6]. Further failures are saved in column-probe.json.
Thus coefficientwise positivity plus summandwise LC is not a valid proof
recipe here. One would need grouping, a mixed-gap argument, or another
representation. The choice remains revisable.
