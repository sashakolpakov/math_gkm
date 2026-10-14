# Informal universal residual-divisibility derivation

Machine-authored live worker 1998e47e, 2026-10-13. This is an ordinary
mathematical argument, not a Lean theorem or root completion certificate.
No positivity or log-concavity conclusion follows from this argument alone.

Let d(l)=a(l)+b(l)-1. For a source numerator P_l(u,v,w), put
F_l(u,s,w)=P_l(u,s-u,w). Assign weights wt(u)=0, wt(s)=1, wt(w)=2.
Claim: every nonzero monomial of F_l has weight at least d(l).

Seeds are 1, s, and s^2+uw, of minimum weights 0,1,2, respectively.
These agree with the three seed degrees. For a mutation with retained endpoint
X=(c,e), middle Y, and opposite endpoint Z, the transformed recurrence is

F_new = (s+w) F_X F_Y - u^c (s-u)^e w^(c+e) F_Z.

The first product has minimum weight at least 1+d(X)+d(Y)=d(new).
Every monomial of u^c(s-u)^e has nonnegative weight, including its u-only
term; the second product therefore has minimum weight at least
2(c+e)+d(Z). The label mediant identities give
d(Y)=d(X)+d(Z)+1 and c+e=d(X)+1, so this lower bound is precisely
d(X)+d(Y)+1=d(new). Subtraction can cancel monomials but cannot create
one below both input weight bounds. This proves the invariant inductively
in both recurrence orientations, including the retained 0/1 endpoint.

The substitution v=s-u preserves ordinary total degree. The checked
homogeneity bridge supplies that degree d for each numerator. In the
coefficient of w^r, each nonzero monomial u^i s^k has k+2r>=d by the weight
invariant. Thus it is divisible over the integers by s^max(d-2r,0).
Substituting s=u+v back gives

    [w^r]P_l(u,v,w) = (u+v)^max(d-2r,0) Q_l,r(u,v)

for some integer polynomial Q_l,r. For r>d the coefficient is zero, and
Q=0 works. Specializing u=t,v=1 proves the precise prescribed-factor
divisibility used in the inherited residual experiments. No denominator,
fraction division, positivity, or support-gap assumption is needed.

Formalization obligations: define the integral polynomial substitution and
its inverse; prove weighted-support preservation under multiplication,
addition/subtraction and both source branches; commute coefficient extraction
with substitution; transport the weight bound into polynomial divisibility.
This worker has not supplied those Lean proofs. In particular the argument
does not establish nonnegative residual coefficients, their CrossLC property,
or any horizontal/vertical inequalities. Even if formalized, it would resolve
only the divisibility component of the residual strategy.
