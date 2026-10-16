# Revisable next actions

Machine-authored request ac3d4ab98366433dacc719574d5ff03e.
Full Conjecture63 remains open; retain InteriorCore63MAC3 exactly.

The variance argument suggests controlling the actual source residual
distribution rather than bounding all seeds by their support. In the
forward factor range and full-overlap index range, q_r=P[r] choose(n,k+1-r)
/[(k-r+2)(n-k+r)] gives moments W,U,V. The raw gap equals
(n+1)[U((n+2)W-U)-(n+2)(WV-U^2)]. Its sign might follow from a recurrence
invariant for these actual source weights. Such an invariant has NOT been
proved. Merely restating this gap identity does not resolve the source sign.

For indices outside full overlap, the displayed quotient may have a zero
denominator. A promising unproved adapter uses instead

    q_r = P[r] choose(n+2,k+2-r)/[(n+1)(n+2)],

with the binomial zero-extended in its integer lower argument. Falling
factorial identities should identify the same three raw coefficients with
the moment sums even at x_r=0 or n+2. Every negative index, endpoint and
zero must be handled explicitly. This is proposed mathematics, not an
existing formal bridge. Forward factorization alone still does not address
the reverse ranges.

The finite all-index moment probe now verifies 473,464 exact identities over
118,366 triples from 4,550 source rows/diagonals and 179 fractions through
denominator 24. It retains 47,771 zero triples and tests negative starting
indices -2,-1 by explicit zero extension. Of these triples, 88,615 lie
outside full overlap. No identity or source-gap failure occurred. This is
only finite evidence for the proposed adapter and the already conjectural
source sign: evidence/markov-ac3d4ab9/moment-experiments.json.

An optional sharper general support criterion can be investigated by using
WV <= (A+B)WU-ABW^2 directly. A discriminant condition
H(A+B-1)^2 <= 4(H-1)AB would force the required quadratic nonnegative.
This is not formalized here and should not displace investigation of the
source-specific remaining regions merely to improve a numerical margin.

No source-specific end-region theorem, universal residual LC theorem, or
full root proof is supplied. All source-correspondence obligations, fresh
source rebuild, independent kernel checks and independent hash-bound English
audit remain necessary before exact-root completion.
