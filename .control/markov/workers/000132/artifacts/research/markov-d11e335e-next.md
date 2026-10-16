# Revisable next actions

Full pinned Conjecture63 remains unresolved. Use the final validation.json for
the admitted sources. The new exact residual is MarkovResidualLowMD11.lean:
the vertical j=2 clause now requires b<4a; higher vertical strips, horizontal
j>=5 and deep diagonals are unchanged. All zeros and endpoints remain retained.

The actual-source fourth-row bridge for 3a<=b<=4a and its seventh-order shifted
binomial correction compiled. The gap certificate did not finish checking:
three attempts timed out. These are excluded candidates, not theorem results.
Do not import their intended downstream assembly as an admitted fact.

Potential next step: validate the positive middle-gap certificate with a more
efficient proof decomposition, or select a different mathematical action.
`probe_strip_d11e335e.py` records its exact symbolic meaning;
`generate_middle_cert_d11e335e.py` records the last factored representation.
The source identity handles small numerators by cancellation before shifting.
The intended 2/7 finite exception uses the actual source polynomial, but its
assembly draft is not admitted. Reconcile final files before regenerating.

A second candidate extends toward 2a<=b<=3a. Put t=3a-b, v=b-2a, N=k+l=b-2.
With J,H,I from the low-cone checkpoint, put

Hnew=(k+1)H+24t falling(l-2,4),
Inew=(k+1)I+(-480t+288at+96v)falling(l-3,5)
 +(96a+96b-864)t(k+1)falling(l-3,4).

The candidate scaled identities multiply both the third and fourth raw rows
by k+1. Its gap is

4(N-5)(N-6)(l-1)Hnew^2
 -3(N-3)(N-4)(l-2)(k+1)J Inew.

The proposed raw clearing factor is
144 falling(N,5)^2 (N-5)(N-6)(k+1)^2.
Substitution a=(N+2+t)/3 has nonnegative coefficients in the five covering
charts l>=7; l=3,k>=4; l=4,k>=3; l=5,k>=2; l=6,k>=1.
See next-cone-probe.json and next-cone-experiments.json. No universal source
adapter, gap theorem or small-source assembly is proved for this candidate.

Alternatively investigate a uniform row-order argument. Finite-order strips
alone do not establish induction. All source-correspondence obligations and
an independent hash-bound English/source audit remain necessary for root closure.
