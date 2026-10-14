# Neighboring charge classes in the exact Pell sum

Machine-authored research, request 67c3f3f5030b42499b0a8bba235e6267.
No novelty claim. The exact pinned Conjecture63 remains unresolved.
Formal status is recorded in evidence/markov-67c3f3f5/validation.json.

Use the inherited source-connected formula, for positive excess s,

    H(a,j,s,q)=choose(a-q,s) choose(s+q-1,q) choose(2s,j-q).

The term is zero when q>j; out-of-range binomials are zero. Its sum is the
literal raw source coefficient at i+j=a+s for a/(a+1). In Lean,
horizontalTerm9a72 uses the final argument s-1. No normalization is used.

The new comparison is uniform in a,j,s,q, with s>=1:

    H(a,j,s,q) H(a,j,s+2,q+1)
      <= H(a,j,s+1,q) H(a,j,s+1,q+1),
    H(a,j,s,q+1) H(a,j,s+2,q)
      <= H(a,j,s+1,q+1) H(a,j,s+1,q).

This handles either orientation of neighboring charge indices. It does not
handle arbitrary separated indices. In particular the inherited distance-three
midpoint obstruction remains valid and prevents extending these statements
to all pairs by assertion.

## Algebra behind the comparison

Separate H into A=choose(a-q,s), B=choose(s+q-1,q), and C=choose(2s,j-q).
The A factors satisfy the required cross comparisons directly by the exact
lower-index binomial recurrence. Write h=j-q-1>=0 for the C factors.
The two stride-two C comparisons are

    (s+2) choose(2s,h+1) choose(2s+4,h)
      <= (s+1) choose(2s+2,h+1) choose(2s+2,h),
    s choose(2s,h) choose(2s+4,h+1)
      <= (s+1) choose(2s+2,h) choose(2s+2,h+1).

After positive-denominator clearing, the first gap is the polynomial in
stride_first_certificate67. Substituting r=2s-h-1>=0 gives

    80+76r+22r^2+2r^3+145h+129hr+35hr^2+3hr^3
      +66h^2+42h^2r+6h^2r^2+9h^3+3h^3r.

The second cleared gap is

    2(2s+2-h)[(2s^2+2s-1)(h+1)+2s^2+6s+4].

Both are nonnegative on their stated support. Vanishing endpoints are handled
separately, so no division by a zero coefficient is involved.

For B, exact binomial recurrences give

    (s+1) B_q(s) B_(q+1)(s+2)
      <= (s+2) B_q(s+1) B_(q+1)(s+1),
    (s+1) B_(q+1)(s) B_q(s+2)
      = s B_(q+1)(s+1) B_q(s+1).

The first cleared difference is 2q times a nonnegative binomial product.
Multiplying the appropriate B and C comparisons cancels their positive
scalar factors. Multiplication with the A comparison proves the claim.
The fractions used during proof are only algebraic certificates; the final
inequalities compare the unchanged integer summands.

## Consequences and remaining gap

Any fixed two consecutive charge classes form a coefficientwise log-concave
sequence of polynomials in the charge variable. The outer two gap coefficients
use inherited individual-summand LC; the middle coefficient uses the new
mixed inequality. Every polynomial coefficient, including zeros, is retained.

For the full refined horizontal polynomial, the coefficient of charge one
in its LC gap is nonnegative for every parameter. It has just the two
ordered products of charge indices 0 and 1. Coefficients of larger total
charge contain more widely separated pairs and remain unresolved.
This theorem does not prove evaluation at source weight one is nonnegative.

## Experiments and source use

Exact scans found no failures in 855442 mixed-adjacent tests and 168147
ordered adjacent-pair tests. The wider local-midpoint scan checked 9244313
ordered tests with charge differences 0,+/-1,+/-2 through a=54, with no
failure. The distance-two portion remains experimental. Inputs and scripts
are saved under this request's evidence and research paths.

The published target was retrieved live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
Hosted searches also located Wang--Yeh's LC-positivity framework:
https://arxiv.org/abs/math/0504164 . No external theorem is a Lean premise.
The searches did not supply a proof of the full root.
