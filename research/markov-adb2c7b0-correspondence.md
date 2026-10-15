# Source and scope correspondence — adb2c7b0

Machine-authored research audit, not the required independent hash-bound
completion audit. Full pinned Conjecture63 remains unresolved.

* **Coverage:** the proved low-slope inequality quantifies over every finite
  path satisfying `2a≤b`, without an upper denominator bound. The general run
  identity quantifies over every natural n and every predecessor path with
  c≥4; a separate corrected source identity covers c=3 for every n.
  No new end-to-end rational coverage audit is claimed.
* **Source family:** the coefficients are those of `frame path`, with the
  original recurrence. All source-word, run-decomposition, gauge, trace, count,
  and coefficient adapters used by the new proofs have explicit Lean proof
  dependencies. No arbitrary word is silently identified with a source word.
* **Homogeneity and coefficients:** coefficient statements use exactly
  `(P.coeff i).coeff j` for the pinned squared-variable numerator at w=1.
  Six multiplies the entire polynomial identity uniformly; no coefficient
  index is normalized. This is not a new audit of the full homogeneous Laurent
  correspondence to the publication.
* **Polygon:** the unconditional inequality retains the pinned three-point
  polygon guards. Its large-cycle specialization is stronger, requiring only
  the slice equality. The exact root-residual equivalence retains all guards.
  The 1/4 witness refutes only a formula extension, not a polygon inequality.
* **Directions, zeros, endpoints:** the new inequality concerns direction
  (1,−1), on the lower slice i+j=a+3. Every nonnegative coefficient index,
  including zero tails, occurs in the formula. Small cycles and rational
  chamber boundaries are handled in the low-slope theorem. The root equivalence
  preserves both endpoint clauses and all horizontal/vertical requirements.
  It does not claim them newly solved.
* **Assumptions:** pinned read-only Lean/Mathlib; no admitted proof, custom
  axiom, native_decide, package update, or external assertion. Accepted axiom
  closures and separate kernel replays are recorded in validation.json.
  Rejected builds and Lean error-recovery output are not admitted results.
* **Proof scope:** the previous cubic source premise is discharged for the
  large low-slope case, and an unconditional low-slope third lower-diagonal
  inequality is proved. The parameter-only general-n polynomial identity
  leaves its coefficient inequalities open. Horizontal, vertical, other slices,
  higher-slope third-slice inequalities, and the required full independent
  source/English audit still prevent root closure. completion must be null.

Source consulted live: [Evans–Veselov–Winn, published paper](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7), (8), Definitions 6.1–6.2 and Conjecture 6.3. The source
requires all three principal directions on the Newton polygon. No retrieved
text became a Lean axiom; no historical novelty claim is made.
