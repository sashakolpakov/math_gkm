# Correspondence and scope — e2cd486c

Machine-authored research audit, not the independent hash-bound completion audit.
The pinned root is unchanged and remains unresolved.

* **Coverage.** The new complete-slice source theorem covers paths
  `replicate n true ++ false :: rest`, with n≥4 and `(frame rest).mid.b≥4`.
  The terminal identities hold already for n≥3. No denominator or run-length
  upper bound is imposed. This does not cover every path or reduced rational.
  Inherited coverage theorems are not re-established or silently substituted for
  the required end-to-end source coverage audit.
* **Source family.** Source transport uses `source_third_run_rawADB2`, which
  identifies the parameter polynomial with the actual pinned recurrence when
  the predecessor denominator is at least four. The two- and three-block
  corrections remain excluded by this explicit hypothesis. The fourth-band
  bridge is a proved polynomial/power-series identity, not interpolation.
* **Homogeneity and raw coefficients.** All source conclusions compare the
  literal integer coefficient `(P.coeff i).coeff j` in the squared variables.
  The slice is `i+j=a+3`, the third lower slice. Uniform scalars six and fifteen
  cancel from the squared inequality. There is no factorial or other
  index-dependent normalization and no loss of zeros. This work does not newly
  establish the global three-variable homogeneous/source coefficient bridge.
* **Polygon.** The unchanged `InPolygon` guard is used to restrict the two
  terminal starting indices and force their valid chambers. The source theorem
  uses the guard on `(i,j+2)`; it consequently implies the original assertion
  when all three guards hold. No guard is replaced with an experimental support
  scan. The complete source/Newton-polygon identification is not newly proved.
* **Directions, zeros and endpoints.** This work addresses `(1,-1)` on one
  specified lower slice. It retains coefficient zeros and handles chamber
  equalities without strictness assumptions. Horizontal and vertical conditions,
  all other slices, both endpoint clauses, and the excluded small families remain
  in the exact root. The validated `root_iff_interiorE2`
  records an equivalence to a still-unproved residual rather than declaring those
  remaining conditions solved.
* **Assumptions.** Ordinary pinned Lean/Mathlib only. The final axiom audit must
  list only `propext`, `Classical.choice`, `Quot.sound`. No failed elaboration,
  Python result or web statement is admitted as an axiom. Operational replay
  drivers use the pinned Lean kernel and are not mathematical declarations.
* **Proof scope.** Final-source compilation, union kernel replay receipts and
  theorem axiom closures are recorded in `validation.json`. Inherited compiled
  imports are reused. There is no fresh whole-source rebuild, proof of the full
  root or its negation, or independent hash-bound source/English completion audit.

Hosted live access checked the conventions in the
[published Evans–Veselov–Winn article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Source-use provenance is in `evidence/markov-e2cd486c/source-use.json`.
Retrieved text supplies context, not Lean premises or a novelty assertion.
