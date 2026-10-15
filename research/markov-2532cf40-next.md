# Revisable next actions

Read `evidence/markov-2532cf40/validation.json` and `final-check.json` before
using new modules. Do not replay this worker's generators over its outputs.
The exact pinned root remains unresolved.

The five onset starts `2n+1,...,2n+5` now have polynomial certificates in all
four predecessor charts. The source theorem is `source_fourth_onsetM253`.
Together with the inherited prefix and final intervals,
`run_fourth_iff_centralM253` reduces the fourth slice for `n≥7,c≥5` exactly to
the polygon-valid starts `2n+6≤j≤3n`. For numerator-one predecessors,
`run_fourth_oneM253` proves the entire fourth slice. `root_iff_coreM253` is an
exact residual equivalence, not a proof of its residual.

The natural next mathematical target is the general-predecessor central
interval. The inherited middle candidates still require validation; none was
silently promoted by the onset proofs. This worker's successful layout may
help: rewrite explicit polynomials in Horner form; prove convolution identities
for the innermost coefficients; assemble one outer variable at a time with
coefficient functions locally irreducible. A single multivariate expansion and
even a one-step assembly of all coefficient identities timed out, whereas
two-stage `R` then `C` assembly of the same onset certificates compiled.
This is an observed operational improvement for these certificates, not a
certified controller switch or a guarantee for the middle candidates.

Small runs, small predecessor denominators/cycles, higher slices and axial
interiors remain separate obligations. A different representation or global
argument remains an authorized alternative. No source-coverage, homogeneity,
polygon, direction, endpoint or universal-scope bridge may be omitted before
an exact-root completion claim.

All new build attempts have immutable source snapshots and receipts. Failed
drafts and timeouts are retained. Pinned inherited compiled imports were used;
a fresh whole-source rebuild and an independent hash-bound English/source
audit have not occurred. Only the final validation inventory determines which
claims passed every local check.
