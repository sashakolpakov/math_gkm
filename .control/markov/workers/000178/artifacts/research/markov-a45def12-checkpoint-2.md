# Second checkpoint

Machine-authored a45def12. Full pinned Conjecture63 remains unresolved.

Successful ordinary Lean builds now cover the exact negative-binomial
convolution moment, the below-cutoff convolution formula and adjacent ratios,
the exact cutoff formula with both endpoint contributions restored, a quadratic
binomial growth bound, the cutoff adjacent inequality, and the final adjacent
inequality. Build receipts and failed source snapshots are preserved under
evidence/markov-a45def12/. Joint replay and axiom audit remain pending here.

For A_n=[q(j,s)q(j,s+2)]_n and B_n=[q(j,s+1)^2]_n, the established region is
n<j and n=2j-1. The small j=1 first step and exact residual reduction are being
compiled. The intended remaining condition is j<=n and n+1<2j; it remains
unproved. No ThreeBeyondBandM657 or OtherFourM9E2 clause has been removed.

The cutoff proof uses 4 choose(2s+k+11,k) >=
(k+1)(k+2) choose(s+k+5,k), proved by induction, and a positive polynomial
identity. Finite scanning is not its justification. Primary-source retrieval
reconfirmed the target; a literature query on rising-factorial series found
related work but no theorem is being adopted as an external assumption.
