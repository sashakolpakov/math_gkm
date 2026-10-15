# Source correspondence and scope — request 53d5229e

Machine-authored research audit, not an independent completion audit.
The pinned `MathGKM.Markov.Conjecture63` remains unresolved.

* **Coverage.** Write the actual source path as `replicate n true ++ false :: rest`,
  and put `c=(frame rest).mid.b`, `r=(frame rest).mid.a`. The new tail theorem
  assumes `c≥4` and `2n+5≤j≤3n+1`. The compiled and separately replayed three-band composition assumes `n≥5`, `c≥4`, `j≤3n+1`.
  There is no upper denominator or run-length bound. These statements do not
  cover all paths, pure-right paths, all positions or all reduced rationals.
* **Source family.** The source coefficient adapter uses
  `source_third_run_rawADB2`, an identity for the literal pinned recurrence.
  Its `c≥4` hypothesis is explicitly discharged from the new theorem's
  assumption. The exact polynomial denominator identity and formal power-series
  inversion, rather than interpolation or finite experiments, supply the new
  coefficient expressions.
* **Homogeneity and coefficients.** The slice is `i+j=a+3`, the third lower
  slice, not the third upper slice from the publication. Coefficients are
  exactly `(P.coeff i).coeff j` in the squared-variable numerator at `w=1`.
  The uniform factors six and fifteen cancel from the squared inequality.
  There is no index-dependent coefficient normalization. Reversing the index
  uses the integer distance `k=3n+3-j`; no natural subtraction truncates it.
  Formal power-series inversion has no analytic convergence assumption.
* **Polygon.** The new raw inequalities hold on their stated indices without
  polygon hypotheses, hence imply the corresponding guarded instances.
  The polygon is unchanged. No full source/Newton-polygon identification is
  newly asserted here. Finite polygon checks are experimental evidence only.
* **Directions, zeros, endpoints.** Only `(1,-1)` is addressed. Zeros remain
  in every formula and inequality. The `c=2,3` corrections are not discarded:
  the new source theorems exclude those predecessor denominators. The delayed
  fourth numerator band starts at `3n+4`, outside the established coefficient
  range through `3n+3`. Extrapolating past it is false, as saved exact examples
  demonstrate. All far-end triples, small runs/cycles, horizontal and vertical
  directions, other slices and both endpoint clauses remain in the root.
* **Assumptions.** Mathematical declarations use ordinary pinned Lean/Mathlib.
  Final axiom closures, build receipts and separate kernel replays are listed
  in `evidence/markov-53d5229e/validation.json`. Rejected elaborations, timed-out
  checks, tool responses and Python arithmetic are not mathematical premises.
* **Proof scope.** The final validation inventory determines which declarations
  were accepted; drafts are not promoted by this prose. Inherited compiled
  imports are reused. There is no fresh whole-dependency rebuild, closed root
  theorem, exact root refutation, or independent hash-bound completion audit.

The source conventions were checked by hosted live access to the
[published Evans–Veselov–Winn article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Its equations (5), (7), (8), Definitions 6.1–6.2 and Conjecture 6.3 retain the
raw numerator convention and all three directions. Retrieved text supplies
context and no Lean axiom. Search provenance is in `source-use.json`.
