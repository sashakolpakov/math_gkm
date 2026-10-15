# Source correspondence and scope

Machine-authored live request `f2da221d241a479bb83492e861a09fd7`.
This is a research record, not the required independent completion audit.
Completion is null. The exact pinned root and its negation remain unproved.

The protected root is `MathGKM.Markov.Conjecture63` in
`MathGKM/Markov.lean`, SHA256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
Final `evidence/markov-f2da221d/validation.json` determines the accepted local
proof inventory. Filenames, candidates, experiments and build attempts alone
do not establish theorem status.

* **Coverage:** The source identities quantify over every natural run length
  and every actual predecessor path of denominator at least five. The initial
  inequality covers triples starting at j<n. The first-shift extension
  covers j=n for n>=5. These are unbounded
  parameter families with explicit index restrictions. They do not prove the
  remaining fourth slice or small predecessor cycles. Existing rational
  coverage bridges must be included in any eventual independent root audit.
* **Source family:** The coefficient statements start with the inherited
  `source_fourth_binomialBC`, which is connected to the protected source
  recurrence through its cut-polynomial and matrix identities. No arbitrary
  cyclic word, polynomial, or experimental array is substituted for a source.
* **Homogeneity and coefficients:** `coeff` remains the raw integer coefficient
  of u^i v^j, with w=1 and omitted exponent a+b-1-i-j. The scalar 24 and the
  additional constant 315 are uniform across a slice. The first-shift correction
  is added to the scaled coefficient; it is not a coefficient normalization.
  No factorial weighting or deletion of zero coefficients occurs.
* **Polygon:** The source inequalities keep the exact slice equation
  i+j+2=a+4 and imply the polygon-restricted instances. The residual retains
  all three polygon guards. No new Newton-polygon identification is claimed.
* **Directions, zeros and endpoints:** Only the lower fourth diagonal in
  direction (1,-1) is advanced. All raw zeros remain. Horizontal and vertical
  interiors, higher diagonals, shifted tails, small cycles and the original
  endpoint clauses are neither removed nor silently assumed. The root
  equivalence uses previously proved regions explicitly.
* **Assumptions:** New proof terms are ordinary Lean. The validation inventory
  checks axiom closures against propext, Classical.choice and Quot.sound.
  Python calculations, source retrievals, tool failures and timing data add no
  axioms. Inherited compiled imports were reused; this is not a fresh rebuild
  of the entire dependency closure or an independent completion audit.
* **Proof scope:** A coefficient identity alone is not log-concavity. Only
  source-connected inequalities with successful compilation and kernel replay
  are claimed. Neither the exact root nor its negation is closed.

MISSION.md and docs/DESIGN.md were read completely. The contract, inherited
index, actual request, recent reports, independent target audit, residual audit
and mathematical review were read. The primary
[Evans–Veselov–Winn publication](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was accessed through hosted tools, including its numerator convention,
recurrence, and Definitions 6.1–6.2/Conjecture 6.3. No external theorem was
introduced as a premise and no historical novelty is claimed.

Worker 91's timeout was reconciled from its actual raw event log, receipt,
current artifact hashes and completed replay receipts. Its final validation
manifest was absent. Matching per-module build/replay evidence was recovered
without altering or replaying prior effects; see
`evidence/markov-f2da221d/reconciliation.json`. An audit source changed during
one prior replay; only receipts matching the final hash were counted.

The higher-priority filesystem policy denies `.scratch`; it was not accessed.
A uniquely named temporary directory under research was used instead. No Git
internals, credentials, outside historical archives, controller records,
protected definitions, pinned dependencies, independent evidence or permissions
were altered. No external model, controller, background service, publication or
communication was invoked. Failed builds and their source snapshots are retained.
