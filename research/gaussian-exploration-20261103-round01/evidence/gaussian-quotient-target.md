# Full Gaussian-binomial quotient positivity target

For every n,k,l in the non-negative integers, use the standard Gaussian binomial B(n,k;q), equal to zero when k>n. Whenever B(n,l;q) is nonzero and B(n,k;q)/B(n,l;q) is a polynomial in the formal indeterminate q, that polynomial has only non-negative integer coefficients.

This is the GENERAL conjecture selected by the user: Conjecture1.2 of arXiv2603.22226v1, also Conjecture1 of arXiv2502.06032v3. No fixed denominator, bounded n, asymptotic condition, difference bound, coprimality condition or symmetry-normalized range is part of the target.

## Minimal mathematical specification for an external seed author

Work in R=Q(q), with q a formal indeterminate and iota:Q[X]->R the canonical polynomial embedding. Define

    T_m(q) = product over i=1,...,m of (1-q^i),    T_0(q)=1;
    B(n,k;q) = T_n(q)/(T_k(q) T_(n-k)(q)) if k<=n, and 0 otherwise.

The subtraction n-k occurs only in the k<=n branch. No product contains i=0. The empty product is1.

For H in Q[X], define NatCoeffs(H) to mean

    for every d in N there exists a in N such that coeff(H,d)=(a:Q).

The closed root proposition is

    for every n,k,l in N and every H in Q[X],
      B(n,l;q) != 0 ->
      B(n,k;q) = B(n,l;q) * iota(H) ->
      NatCoeffs(H).

The second premise is EXACT polynomiality/divisibility, not the output of a truncated polynomial quotient operation. H has arbitrary rational coefficients in the premise; integrality and non-negativity belong to the conclusion. Nonzero denominator is explicit even though the usual in-range Gaussian binomials are nonzero. The convention k>n gives zero numerators, which remain included when the denominator is nonzero.

The root quantifies all n,k,l and all coefficient indices. In particular it includes n=0, k=l, k=0, l=0, boundary indices n, and symmetry-related indices above n/2. It excludes undefined zero denominators, not valid endpoint or zero-numerator cases. The source's reduced range1<=l<k<=n/2 must not silently replace the full root.

## Required semantic correspondence

The later externally authored Lean seed must define the standard Gaussian object with the above base/out-of-range conventions, a genuine polynomial embedding and actual coefficient access. The root must be a closed Prop whose entire content is the displayed universal conditional statement. No axiom, sorry, assumed integrality, pre-assumed positivity, hidden helper hypothesis, bounded parameter test, numerical q-specialization, coefficient truncation, absolute-value transformation or unrelated True proposition may substitute for it.

This packet contains only target definitions and guard examples. It contains no Lean proof, conjecture deduction, proof strategy, experimental search, model invocation or mathematical result claim.
