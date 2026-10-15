# Scope and source correspondence — fddabb33

Machine-authored live research audit, not the independent hash-bound completion
audit. The pinned `MathGKM.Markov.Conjecture63` remains unresolved; completion
is null. Final accepted modules are listed in
`evidence/markov-fddabb33/validation.json`; drafts without receipts are excluded.

* **Coverage:** run parameters are natural numbers with no upper bound. Actual
  source statements use every `replicate n true ++ false::rest`. This mixed-path
  family is not silently extended to pure-right paths or endpoints. The new
  work does not establish full reduced-rational coverage or full log-concavity.
* **Source family:** the adapters start from the inherited exact source
  recurrence, gauged run matrices, source moment counts and cycle corrections.
  An arbitrary run word or synthetic polygon is not a source witness.
* **Homogeneity and coefficients:** the target remains the ordinary integer
  coefficient `(P.coeff i).coeff j` of the squared-variable numerator at w=1.
  The new slice is `i+j=a+3`, the third lower slice, not the published third
  upper slice. Six and fifteen are uniform scalars, not index-dependent
  normalization. The fraction-field map is injective. Power-series inversion
  is formal algebra, not numerical evaluation or analytic convergence.
* **Polygon:** the coefficient identities impose no support-only restriction
  and retain zero coefficients. Any derived inequality on its restricted
  indices is stronger than its polygon-guarded version there. This does not
  replace or remove any polygon guard in the pinned root.
* **Directions, zeros and endpoints:** the new inequality work concerns only
  direction (1,-1) on the specified slice and coefficient range. Horizontal,
  vertical, all remaining slices, positions outside that range, pure-right
  paths and both endpoint clauses remain part of the root. Small-cycle
  corrections are retained in the algebra rather than inferred from samples.
* **Assumptions:** only pinned Lean/Mathlib and permitted ordinary axiom
  closures. No admissions, custom axioms, native_decide, package changes or
  external mathematical assertions have been added. Rejected elaborations
  and operational timeouts have no mathematical admission status.
* **Proof scope:** the coefficient identity is now proved for 4≤j≤n+1 for
  every natural n,c,r. Its source transfer proves the raw diagonal inequality
  on i+j+2=a+3 for 4≤j and j+2≤n, universally over n and rest. This is a
  restricted strip, not the full third lower slice. The final validation
  inventory records the successful composition and excludes rejected drafts. No root proof, negation, fresh complete
  dependency rebuild or independent English/source completion audit is claimed.

Source conventions were checked through hosted live access to
[Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7), (8), Definitions 6.1–6.2 and Conjecture 6.3. This source
check supplies context and no new Lean axiom.
