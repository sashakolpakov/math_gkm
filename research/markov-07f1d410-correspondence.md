# Source correspondence and scope — 07f1d410

Machine-authored research audit for request `07f1d4107cd9444f9e7c04207d4f33d9`.
This is not the independent hash-bound completion audit. The pinned root
`MathGKM.Markov.Conjecture63` remains unresolved; completion is null.

* **Coverage.** The source adapters quantify over every natural run length and
  every finite rest path in `replicate n true ++ false :: rest`. The first-band
  theorem assumes `j+1≤n`. The two-band composition assumes `4≤n` and `j≤2*n`.
  These are infinite families with no upper denominator bound, but they do not
  assert all positions, pure-right paths, endpoints, or all reduced rationals.
  Existing rational-coverage work is not replaced by these run parameters.
* **Source family.** The starting point is the inherited all-cycle exact
  identity `source_third_all_cycles_raw8BBB`, for the actual pinned recurrence.
  No arbitrary run word or interpolated family is substituted for it. The
  second-band formula is proved by polynomial identities and formal power-series
  coefficient extraction, not by the finite experiments.
* **Homogeneity and coefficients.** The new slice is the third **lower** slice
  `i+j=a+3`, not the published third upper slice. Coefficients are the literal
  integers `(P.coeff i).coeff j` at `w=1`. Six and fifteen are uniform scalars;
  their product ninety cancels from the squared inequality. There is no
  index-dependent, binomial, or factorial normalization of source coefficients.
  Formal inversion of `(1-X)^6` has no analytic convergence premise.
* **Polygon.** The new inequalities hold on their stated slice/index range
  without needing polygon hypotheses. Thus they imply the polygon-guarded
  instances there. They neither change the pinned polygon nor prove its full
  Newton-polygon/source identification.
* **Directions, zeros, endpoints.** Only direction `(1,-1)` is addressed here.
  The coefficients are never filtered by support or positivity. The `c=2` and
  `c=3` source corrections are retained in the inherited exact formula and are
  removed only below their proved starting degree `b=c*(n+1)+r`. Since source
  parameters satisfy `c≥2` and `r≥1`, every position through `2*n+2` lies below
  that degree. The remaining delayed band begins at `2*n+3` and is not dropped
  beyond that boundary. Horizontal, vertical, all other slices, the rest of
  this slice, and both endpoint clauses remain in the root.
* **Assumptions.** Only pinned Lean/Mathlib and the permitted ordinary axiom
  closures are admitted. Rejected elaborations, timeout drafts and Python
  computations are not mathematical premises. Final accepted modules, hashes,
  axiom closures and kernel receipts are listed in `validation.json`.
* **Proof scope.** The final validation inventory governs acceptance, including
  the source composition. There is no proof or negation of the root, fresh
  whole-dependency rebuild, or independent English/source completion audit.

Source conventions were checked through hosted live access to
[Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7), (8), Definitions 6.1–6.2, and Conjecture 6.3. This supplies
context, not a Lean axiom.
