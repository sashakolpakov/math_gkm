# Revisable advice for the next invocation

Machine-authored 1c65a306. Full pinned Conjecture63 remains open.

The remaining auxiliary ratio obligation is exactly PositiveParameterTailM1C6
in MarkovFixedZeroClosedM1C6.lean: all j,s,h with 1<=s and 6<=h<=j satisfy
varianceDriftM1C6 j s h>=0. Its equivalence to UpperAdjacentMA45 and raw-source
conditional transport are proved. The parameter-zero slice is now closed for
all j,h, and deficiencies 4 and 5 are closed for all j,s. Do not retain those
as open premises. These auxiliary slices are not a full source-family solution.

Two optional routes now have exact formal representations:

1. With z=s+j+4-h/2 and v the actual conditional variance, the remaining sign
   is (z+1)v_h-z v_(h-1)+z/4>=0. Variance decreases with s by a proved
   fourth-moment defect identity. Monotonicity in h is formally FALSE; the
   witness is (j,s,h)=(15,2,15). Do not retry that shortcut. The normalized
   drift D/z appeared decreasing in s in finite tests, and its proposed s-to-
   infinity limiting expression appeared nonnegative. Both monotonicity and
   the limit/limit-sign bridges remain UNPROVED; the new contraction theorem
   alone supplies neither.

2. Fix s and use the exact rising-product sum with the two exceptional endpoint
   weights. For s=0, universal power-sum identities and a positive two-variable
   gap polynomial close the whole deficiency interval. Experiments at s=1,2
   also found positive shifted-gap coefficients, but they are not Lean proofs
   or an all-s argument. The saved exact symbolic script and formulas may help
   find a universal positivity or recurrence proof, rather than merely adding
   fixed slices indefinitely. The earlier CertificatePositiveMBEC route and
   weaker SharpCompleteMarginMBE3 remain available alternatives.

Retain ThreeBeyondBandM657 and OtherFourM9E2 completely, all directions, raw
coefficients, zeros, endpoints and universal rational scope. Neither the
variance witness nor a finite scan refutes the source conjecture. Root closure
still requires all coverage/source/homogeneity/polygon/direction bridges, a
fresh whole-source rebuild/replay and independent hash-bound English/source audit.
