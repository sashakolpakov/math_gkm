# Normalized centered layers

Machine-authored request 6a40862beebd4a1a8207ff0222f0451d. The full pinned
Conjecture63 remains unresolved. No novelty claim. Formal acceptance status
is in evidence/markov-6a40862b/validation.json, not inferred from this text.

Use the inherited exact Pell summand

    H_s(q)=choose(a-q,s) choose(s+q-1,q) choose(2s,j-q).

Its center support for s>=2 is the integer interval
max(0,j-2s)<=q<=min(j,a-s). Fix q+r=k. On common center support put

    A(q)=(2s-j+q)(2s-1-j+q)/((a-s-q+1)(s+q-1)),
    B(q)=(a-s-q)(s+q)/((2s+2-j+q)(2s+1-j+q)),
    K=(s-1)(2s+1)/(s(2s-1)).

Elementary binomial ratios give the proposed identification

    [2 H_s(q)H_s(r)-H_(s-1)(q)H_(s+1)(r)
                         -H_(s+1)(q)H_(s-1)(r)]/[H_s(q)H_s(r)]
      = 2-K[A(q)B(r)+A(r)B(q)].

The separate ratios are H_(s-1)(q)/H_s(q)=(s-1)/(2(2s-1))*A(q)
and H_(s+1)(q)/H_s(q)=2(2s+1)/s*B(q). The factors 0 and 1 in
the numerator preserve lower-strip zero cases, and a-s-q=0 preserves the
upper-strip endpoint. No coefficient normalization is proposed for the root:
division here is only for analyzing signed auxiliary layers with positive M.

## Exact rational certificate

Let N(q,r)/D(q,r)=A(q)B(r)+A(r)B(q), using the common denominator

    D(q,r)=AD(q) BD(q) AD(r) BD(r).

The Lean definitions layerAN6, layerAD6, layerBN6, layerBD6, layerN6,
layerD6 record the literal numerators and denominators without cancellation.
For real parameters with q>=0, q+2<=r<=j<=2s+q, a>=s+r, put

    x=q+(j-r)/2, d=r-q-2, e=2s-j+q, h=a-s-r.

These four slacks are nonnegative. Translation by (j-r)/2 leaves all four
linear-factor pairs invariant. In reduced coordinates r=x+d+2,
s=(d+e+2)/2, j=r, a=s+r+h, exact expansion gives

    N(q,r)D(q+1,r-1)-N(q+1,r-1)D(q,r)
       =(d+1)(e+2)(d+e+3) C(x,d,e,h),

where C has 1140 positive rational monomial coefficients. Its complete exact
coefficient list is reduced-certificate.json. It is stored in Lean in Horner
form, grouped by the five powers of x. The identity is split into five
coefficient comparisons to avoid the monolithic elaboration timeout.

When s>1, both D values are strictly positive on the stated domain. Thus the
rational sum A(q)B(r)+A(r)B(q) is nonincreasing as q,r move one step toward
their midpoint. The normalized signed layer is consequently nondecreasing.
The formal rational theorem, if listed as validated, is layer_ratio_monotone6.

## Limits and next bridge

The elementary binomial recurrence identities bc_lower6 and bc_upper6 and
their division corollaries are checked separately. The full identity between
H ratios and the rational functions above has NOT been assembled in Lean.
It is tested exactly in the accompanying finite experiment and derived above,
but is not a checked source theorem. The proof must still handle support
boundaries and the half-weight at q=r when regrouping the convolution.

This approach can establish a single sign change from negative to positive
in centered layers. Such a sign change plus a nonnegative TOTAL implies
nonnegative centered tails. It does not prove the total nonnegative. Therefore
even a completed layer bridge would not prove HorizontalFiberGoal9a72,
the entire Pell family, or full Conjecture63. The all-rational matrix-word
representation was reviewed, but no all-source inequality was obtained.

The publisher source and Wang--Yeh LC-positivity paper were retrieved live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html and
https://arxiv.org/html/math/0504164v7 . The latter separates the single-sign-
change and total-positivity requirements. No source assertion is a Lean axiom.
