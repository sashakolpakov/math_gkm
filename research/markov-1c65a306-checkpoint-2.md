# Research checkpoint 2
Machine-authored 1c65a306. Full root unresolved.

Ordinary Lean compilation now proves explicit positive factorizations of the
integer certificate at deficiencies h=4 and h=5 for ALL natural k,s (j=h+k).
Files: research/MarkovCertificate4M1C6.lean and MarkovCertificate5M1C6.lean.
The symbolic factor identities were checked by ring; input coefficient data
from the predecessor was not admitted as an axiom. These are auxiliary upper
ratio steps, not new complete source rows or root closure.

MarkovReverseMomentsM1C6.lean compiled: positive masses, exact s-shift of the
actual reversed kernel, nonnegative centered variance, and exact balanced and
unbalanced convolution expressions in mass/second moment. A drift equivalence
is being checked. The proposed monotonicity of variance in h is FALSE on the
actual auxiliary kernel (4217 failures among 22365 exact comparisons).

A second exploratory exact test found no failure of decreasing normalized
drift in s (19074 adjacent comparisons, j=2..34,h=2..j,s=0..34).
This is only an experimental candidate. No universal drift sign is assumed.
Lean work on universal variance contraction in s and its fourth-moment identity
is underway. All build errors remain in immutable evidence receipts.
