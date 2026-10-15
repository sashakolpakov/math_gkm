# Correspondence and scope

Machine-authored live request `0b212317001348aaa31bde36d93913b1`.
This is a research record, not the independent completion audit. Completion is null.

The exact protected `MathGKM.Markov.Conjecture63` and contract are unchanged.
Only modules listed in final `evidence/markov-0b212317/validation.json` are
accepted local proof evidence. Compiled imports from prior workers were reused;
this is not a fresh rebuild of the entire source closure.

* Coverage: the coefficient bridge quantifies over every natural run length
  and actual predecessor path with denominator at least five. It retains its
  explicit coefficient-index interval. It neither bounds the source denominator
  nor proves all fourth-slice positions. Small predecessor cycles remain outside
  this new bridge. Existing all-rational coverage evidence must still be included
  in an eventual complete source audit.
* Source family: the new bridge starts with `source_fourth_binomialBC`, hence
  with the actual protected path-generated numerator and its inherited matrix
  source identification. No arbitrary word is silently used as a source witness.
* Coefficients and homogeneity: all statements concern the protected integer
  `coeff`. The scales 24, 315, and 7560 are constant across the entire slice,
  not variable-dependent normalizations. Polynomial convolution and falling
  factorial identities are checked in Lean. The omitted homogeneous exponent
  remains a+b-1-i-j; the root's degree convention is unchanged.
* Polygon: the new coefficient identities and any admitted initial-interval
  inequalities hold without filtering support. Consequently they apply to
  polygon-valid triples. They do not prove the Newton-polygon identification.
* Directions, zeros, endpoints: the work concerns i+j=a+4 in direction (1,-1).
  No zero coefficients are discarded. Horizontal and vertical interior
  inequalities, higher diagonals, and the unchanged endpoint clauses remain
  separate obligations.
* Assumptions: ordinary Lean proofs only; the final axiom inventory checks the
  permitted closure. Exact Python candidates and finite experiments introduce
  no mathematical axioms. Timeouts and missing capabilities are operational
  observations, not evidence against the conjecture.
* Proof scope: neither the exact pinned root nor its negation has been proved.
  The residual remains open. Drafts without matching successful build and replay
  receipts are excluded, even when their intended statements are plausible.

MISSION.md and docs/DESIGN.md were read completely. The inherited index, latest
reports, independent target and residual audits, and mathematical review were
read. Worker 90's final raw events and 166 hashes were reconciled in
`evidence/markov-0b212317/reconciliation.json`; no interrupted side effect was
blindly repeated. The source was accessed through hosted tools at the
[publisher page](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
including its raw-coefficient convention and Definitions 6.1–6.2/Conjecture 6.3.
No external theorem was added as an assumption.

The higher-priority permission profile denies `.scratch`. It was not accessed;
a unique temporary directory under research was used. The initial shell heredoc
failed before executing because its temporary file was unavailable. Sage and
SymPy were unavailable; GAP was found but not needed. No controller records,
protected root, pinned dependency, independent evidence, Git data, or permissions
were edited. No model, controller, background service, or external communication
was invoked.
