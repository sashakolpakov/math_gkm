# Scope and correspondence for fd72158c

The exact pinned root and contract are unchanged. This is a local partial result,
not a proof or refutation of the full published conjecture.

* **Coverage.** The new coefficient bounds quantify over unbounded predecessor
  parameters and every finite source path satisfying the explicit hypotheses.
  They are not a new end-to-end rational coverage audit. The fixed values 2 and 3
  are run lengths, not denominator bounds.
* **Source family.** Transport uses the inherited actual path recurrence and its
  proved `source_third_run_rawADB2` identity for `c>=4`. For runs two and three,
  the six exceptional `c=2,3` cases use `source_third_all_cycles_raw8BBB` and
  exact corrected polynomial identities. No small-cycle correction is discarded.
  The composite theorem for arbitrary paths with `a+4<=b` follows from a proved
  path decomposition. No new global Laurent/source bridge is claimed.
* **Homogeneity and coefficients.** Comparisons use literal integer coefficients
  `(P.coeff i).coeff j` in the squared variables, with `i+j=a+3`. The common
  scalar six cancels from the squared inequality. There is no factorial or
  index-dependent normalization. This work does not newly discharge the global
  homogeneous three-variable source bridge.
* **Polygon.** The original `InPolygon` guard supplies the bound on the starting
  index. No experimental support scan replaces the guard. The full identification
  with the published Newton polygon is not newly proved here.
* **Directions, zeros, endpoints.** This work concerns the `(1,-1)` direction on
  one lower diagonal, including zero coefficients and chamber equalities. All
  other slices, horizontal and vertical inequalities, and both endpoints remain
  accounted for in the exact root and any stated residual equivalence.
* **Assumptions.** Only pinned Lean and read-only Mathlib are used. No experiment,
  retrieved source text or failed elaboration is introduced as an axiom. The final
  axiom audit must contain only `propext`, `Classical.choice`, `Quot.sound`.
* **Proof scope.** Compilation and separate replay receipts identify checked
  local declarations. Inherited compiled imports are reused. No fresh whole-source
  rebuild, independent hash-bound English/source completion audit, or exact-root
  closure is claimed.

Conventions were checked against the
[published Evans–Veselov–Winn article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
using hosted live access. Source text supplies context, not formal premises.
Independent target and residual-scope audits were read in full. The interrupted
worker 81's finalizer completion was confirmed from its raw event log; worker 82
completed normally. No earlier possibly completed side effect was blindly replayed.
