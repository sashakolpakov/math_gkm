# Revisable next actions

Machine-authored 062809ba. Full pinned root remains unresolved.

The completed source theorem is `source_fourth_lower_three_quartersK062` in
`MarkovResidualTwoK062.lean`; the exact remaining predicate is
`InteriorCore63TwoK062`. All run-two predecessor chambers and every small cycle
are handled. Horizontal, vertical, larger-slope fourth diagonals and higher
diagonals remain open.

Run three has six checked coefficient certificates in
`MarkovFourthThreeCert0K062` through `MarkovFourthThreeCert5K062`, and all five
actual short-cycle source inequalities. The remaining obstacle in this run
was compilation of the explicit matrix-to-local-moment specialization, not a
counterexample to its formulas. The original direct gauge expansion timed out
at 100 and 300 seconds; the staged version also timed out at 300 seconds.
The supporting `MarkovFourthLowerK062` did compile and was kernel replayed.

The staged `MarkovFourthGauge3K062.lean` is a pending draft. Its four matrix
identities can be split, or reduced using prior gauge identities. In particular
`runBooleanGaugeADB2 3 false false` is definitionally the same matrix as
`runBooleanGaugeADB2 2 true true`, so the proved `gauge2_11K062` is available.
This observation is advice, not a newly checked theorem in this run.

`MarkovFourthThreeLocalK062.lean` now caches 44 explicit matrix coefficients
before checking its 16 local-moment cases. This rewrite was generated after
the matrix timeout and was not compiled. The six short source-expansion modules
`MarkovFourthThree0K062` through `MarkovFourthThree5K062` import the checked
coefficient certificates and this pending local identity. They include the
truncated-count cast repair that was needed in run two. The final run-three
source and slope-4/5 residual modules are also pending drafts. Do not assume
any pending source or an absent olean is a theorem.

The worker's partial replay passed for 25 modules; the final validation records
the subsequent replay group and the complete accepted set. Reuse the recorded
sources and receipts rather than replaying an interrupted side effect. All
foreground executions were finished before the final report.

Finishing this run-three bridge is optional. The inherited arbitrary-run
fourth-moment formula remains available for a general argument, and the other
two directions may warrant a different approach. Every source-correspondence
obligation remains necessary for any exact-root completion claim.
