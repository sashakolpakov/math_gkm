# Checkpoint 3

Machine-authored dcb64029. The tail source attachment and exact root residual
compile. New unconditional source strips start at t-3 and t-4; all horizontal
columns through upper depth 8 are now covered. The exact remaining upper scalar
condition is TopTailResidualMDCB (i>=1,r>=5,i+r<=d+2).

TailCoefficientPositiveMDCB is a sufficient unproved polynomial coefficient
condition with a compiled exact evaluation bridge. Symbolic tests through r=40
found no negative coefficient. Antidiagonal-piece positivity fails already at
r=11,i=d=0; that is an auxiliary obstruction outside the source sector.

A different written proof route gives the proposed linear cutoff d>=i+4r-1,
using beta-binomial base weights and inward likelihood ordering. The scalar
positivity and actual likelihood CrossLC/inward-step lemmas compile. General
integer factorial-moment identities are being checked. The complete normalized
expectation, covariance, double-sum and source-cutoff bridges remain incomplete;
the linear cutoff is NOT claimed as a closed Lean theorem. See
markov-dcb64029-beta-proof.md and beta-comparison-probe.json.

Finite source checks: 15,944 coefficient comparisons with 3,652 zeros; 1,950
exact tail identities; 1,246 new strict triples; 295,433 polygon-valid triples
across all directions, without failures. These are experiments only. Joint
kernel replay and closure audit of the final selected modules are next.
