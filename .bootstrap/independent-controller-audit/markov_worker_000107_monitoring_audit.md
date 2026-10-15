# Independent monitoring audit: worker 000107

Request: `8b851864e2a148b2a2642ba6713f61c4`. This is a read-only mathematical and retained-evidence review. The principal source is the worker's own timeout archive at `/Users/sasha/math_gkm/.control/markov/workers/000107/artifacts/`. No Lean command, replay, experiment, finalizer, retry or successor research was run or used. The separate late receipt described below is expressly outside that archive. No project source was changed or advice sent to the proposer.

## Finding and acceptance boundary

The archived successful replay evidence supports a substantive unconditional result: for every actual source path `replicate n true ++ false :: rest`, if `n ≥ 6` and the predecessor denominator `c = (frame rest).mid.b ≥ 5`, the entire fourth lower diagonal satisfies the original raw coefficient log-concavity inequalities, with the original polygon conditions and natural-index zero conventions. There is no restriction on the predecessor numerator beyond the properties of an actual source frame. This closes the formerly outstanding central interval and the six transition starts at `n = 6` for this family.

The same archive supports a smaller additional onset window for `n ≥ 3`, and exact equivalences between the pinned conjecture and a remaining interior predicate after these proved regions are removed. An equivalence is not a proof of that remaining predicate or of Conjecture 6.3.

A later assembly extending the whole fourth diagonal to `n ≥ 4` has a successful final-source compilation, but **no selected replay** in either the archived or separately retained late receipts, and its five theorem names were not included in the executed axiom audits. Its corresponding new root residual file is unbuilt. These have different validation status from the fully replayed `n ≥ 6` result. The late successful replay of 22 `Five` support modules cannot be described as a pre-timeout success, or as a replay of that final assembly.

No mathematical mismatch was found in the unconditional `n ≥ 6` source result, the source-window result, or their replayed exact residual equivalences. The material reporting issues are the timeout/late-receipt boundary, incomplete final assembly validation, absent finalization, and stale intermediate counts.

## Exact raw statement and indexing

Write `r = (frame rest).mid.a`, `c = (frame rest).mid.b`, and `path = replicate n true ++ false :: rest`. The actual source parameters are `a = n*c+r` and `b = (n+1)*c+r`. Here `r` is the **predecessor numerator**, not the numerator `a` of the full source. Source frame facts provide `0 < r < c` and coprimality; these are derived, not additional fitted assumptions.

Let `A(i,j) = coeff (frame path).mid.p i j`, the raw integer coefficient used by the pinned target. The fourth lower diagonal is total degree `a+4`. With natural indices satisfying `i+j+2 = a+4`, the tested triple is

`(i+2,j), (i+1,j+1), (i,j+2)`,

and its inequality is

`A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2`.

Thus “start j” refers to the second-coordinate sequence `j,j+1,j+2`; it does not mean that `(i,j)` is the first point. The total degree and the two-coordinate shift agree throughout the source bridges and residual predicates. Coefficients are not divided by factorials, binomial weights, support lengths or an empirical normalization. Positive constants such as `120960` and `7560` occur only in exact intermediate identities and are algebraically cancelled.

`RunFourthLCM94 n rest` retains all three original polygon guards. The pointwise source inequalities often prove the displayed inequality under the total-degree equation without requiring polygon membership; this is stronger and is safely used when the guards are subsequently supplied. Neither form assumes coefficients are nonzero or strictly positive. Natural indices and the existing coefficient convention retain zeros.

## General central interval: the former hypothesis is discharged

`source_fourth_middleM8B8` in `MarkovMiddleSourceM8B8.lean` proves the actual raw inequality for every natural `n,i,j`, every actual predecessor with `c ≥ 5`, and

`2*n+6 ≤ j ≤ 3*n`, `i+j+2 = a+4`.

There is no explicit `n ≥ 7` assumption: the interval first becomes nonempty at `n = 6`. It has no remaining scalar-gap, formula, coefficient-identification, or positivity premise.

The underlying integer scalar theorem `middleRawValue_lcM8B8` requires `c ≥ 5`, `1 ≤ r < c`, `2*r ≠ c`, and those index bounds. The last inequality is obtained for an actual source by reducedness, rather than assumed by the final source theorem. Its low and high parameter charts use nonnegative integer coordinates, with `J = j-2*n-6`, `E = 3*n-j`, and `n = J+E+6`. The general low chart has `c=2*R+C+5, r=R+2`; the high chart has `c=2*C+R+5, r=C+R+3`. The exceptional edges `r=1` and `r=c-1` use the earlier checked edge results. The exact coefficient-column decomposition includes both the new low columns and the inherited high columns; no unproved column is discarded.

The source proof obtains three exact identities with common scale `120960`, at the three correctly shifted source positions, proves their validity ranges from the hypotheses, and cancels that positive constant. `run_fourth_allM8B8` combines this with the existing initial/final results to cover the entire guarded fourth diagonal for `n ≥ 7`, `c ≥ 5`.

## Small-run onset and its validity window

The new scalar onset inequalities hold already for `n ≥ 3`. The polynomial certificates are rewritten in a nonnegative variable `N+4`, where the old coordinate is `N=n-7`. This is a change in the proved parameter range, not a numerical substitution. The four source charts cover both strict half-ratio regimes and their `r=1` / `r=c-1` edges. Actual coprimality excludes `2*r=c` when `c ≥ 5`.

The first source assembly, `source_fourth_onsetM8B8`, proves all five onset starts `2*n < j ≤ 2*n+5` for `n ≥ 4`, `c ≥ 5`, with the displayed total-degree equation. The stronger-window assembly `source_fourth_onset_windowM8B8` covers `n ≥ 3` with the additional source-validity constraints

`n+5 ≤ j` and `j ≤ 3*n+1`.

These ensure that all three coefficients lie in the actual formula's window. At `n=3`, they leave precisely starts `j=8,9,10`; the scalar inequalities outside this window do not by themselves identify the corresponding raw source coefficients.

The intermediate identity `source_fourth_onset_window_valueM8B8` has `1 ≤ k ≤ 7` and `n+5 ≤ 2*n+k ≤ 3*n+3`, without an independent lower bound on `n`. The proof keeps the small-index correction through the five onset positions and proves its disappearance at the later positions. It does not extend the formula silently outside this window.

## The n=6 transition and whole-slice result

`run_fourth_iff_shortM8B8`, for `n ≥ 4` and `c ≥ 5`, reduces the whole fourth diagonal exactly to starts satisfying

`2*n+6 ≤ j`, `3*n < j`, `j ≤ 3*n+6`,

together with the same original polygon/total-degree conditions. It uses the initial prefix, the strengthened onset, the newly proved central interval and the inherited final interval. For `n=4,5,6`, these remaining starts are respectively `14..18`, `16..21`, and `19..24`. There is no gap between those case splits or an extra zero-exclusion premise.

For `n=6`, `source_finalSixM8B8` proves the starts `j=18+k`, `1 ≤ k ≤ 6`. Each of the six strict ratio chambers has exact source coefficient identities and a fixed-run nonnegative gap certificate. The chamber boundaries are `1/4,1/3,1/2,2/3,3/4`. Reducedness and `c ≥ 5` exclude equality with each of these small-denominator fractions. The six cases therefore exhaust all actual predecessors; no boundary source is omitted. Their integer coordinates are:

| Chamber for r/c | c | r |
|---|---|---|
| (0,1/4) | `5+x+4*y` | `1+y` |
| (1/4,1/3) | `7+4*x+3*y` | `2+x+y` |
| (1/3,1/2) | `5+3*x+2*y` | `2+x+y` |
| (1/2,2/3) | `5+2*x+3*y` | `3+x+2*y` |
| (2/3,3/4) | `7+3*x+4*y` | `5+2*x+3*y` |
| (3/4,1) | `5+4*x+y` | `4+3*x+y` |

In each row `x,y ≥ 0` are derived from the strict inequalities. The source identities are equalities of integer coefficients with scale `7560`, not rational evaluations requiring an unstated denominator condition. The earlier backward extraction and the small-cycle correction are retained; in particular the actual exceptional predecessor `c=5,r=4` is in the last chamber, not excluded.

`run_fourth_sixM8B8` discharges the short residual for `n=6`. `run_fourth_ge_sixM8B8` then combines this with the `n ≥ 7` assembly. These public theorems have archived successful selected replays and direct standard-axiom audit coverage.

## Late n=4/n=5 work has a different status

The fixed-run `Four` source identities begin at offset `k=2` relative to `j=3*n+k`; the fixed-run `Five` identities begin at `k=1`. These are the correct ranges needed by the short residual. The `n=4,k=1` position is deliberately absent from that source formula, even though an auxiliary scalar gap can be nonnegative there.

`MarkovFourthFourCompleteM8B8.lean` assembles the five `n=4` starts and six `n=5` starts, then states `run_fourth_ge_fourM8B8`. Its final declaration quantifies every natural `n ≥ 4` and every actual predecessor with `c ≥ 5`, including `n=5`, rather than only the single run length four. Its final source successfully compiled at archived event 254. That establishes a compiled Lean theorem, but its five named declarations have **no explicit replay receipt or printed axiom closures** in this history. In particular, replaying its imported support files is not replaying this final source module.

The 22 `Five` gap/chamber modules were compiled in the archive but their successful union receipt was written later, outside the worker archive and after the controller had finished. That later evidence is preserved independently below. `MarkovResidualFourM8B8.lean`, which would use the full `n ≥ 4` assembly in a new root equivalence, is the sole unbuilt mathematical draft: no object, successful build, replay or accepted root update is recorded. No successor result is used to complete either obligation.

## Exact root equivalences and what remains

The replayed `root_iff_coreM8B8`, `root_iff_coreSixM8B8`, and `root_iff_coreWindowM8B8` remove, respectively, the proved full `n ≥ 7` region, the full `n ≥ 6` region, and the union of the latter with the `n ≥ 3` onset window. The existential solved-region predicate includes the actual path decomposition, predecessor denominator bound, total-degree equation and any required window inequalities.

These proofs rewrite a previously checked exact root equivalence, retain its horizontal and vertical components and all existing diagonal polygon/endpoint/interior guards, and discharge the newly removed case by the actual source theorems. In the window version the solved predicate is an explicit disjunction, so no unsupported conjunction or silent expansion occurs. The reverse implication splits on that predicate and supplies the corresponding proved source inequality. There is no hidden assumption that the remaining predicate is true.

The source root remains the full published three-direction raw log-concavity target. This work addresses part of its diagonal component. It does not settle all paths, all lower diagonals, or the remaining horizontal and vertical interiors, and it is not a conjecture refutation.

## Finite experiments: exact recorded scope

The archived scripts and input lists were read. I independently enumerated only input tuples, integer index ranges and polygon guards, without recomputing polynomials, inequalities, literal-source recursions or research experiments. All saved input lists and the following counts match those domains:

| Recorded experiment | Domain | Cases | Formula comparisons | Valid raw triples | Literal coefficient comparisons |
|---|---|---:|---:|---:|---:|
| Central | `5≤c≤24`, reduced `r`, `n∈{6,7,9,17}` | 696 | 5,394 | 3,306 | 48 |
| Small onset window | `5≤c≤17`, reduced `r`, `n∈{3,4,5,6}` | 360 | 2,340 | 1,620 | 168 |
| Fixed six | `5≤c≤24`, reduced `r`, `n=6` | 174 | 3,132 | 4,959 | 384 |
| Corrected four/five | `5≤c≤24`, reduced `r`, `n∈{4,5}` | 348 | 5,742 | 7,830 | 624 |

The central coefficient range is `2*n+6..3*n+3`, with triple starts through `3*n`. The onset count includes only formula positions satisfying its stated validity window; its chart counts are `128,52,128,52`. Literal comparisons there also include positions outside the auxiliary candidate window because they compare the actual-source computation with the independent coefficient computation, not the invalid candidate formula.

Fixed-six and fixed-four/five formula comparisons count overlapping positions once for each three-coefficient candidate row, so the numbers are not counts of distinct coefficient positions. The full-slice triple loops use `0≤j≤4*n+5` and all three original polygon guards. Literal comparisons use `c≤7`. The saved zero counters are all zero: these scans therefore do **not** empirically test zero-valued boundary coefficients, even though the Lean statements do not exclude them. Those zero counters were not recomputed in this audit.

The rejected four/five experiment extrapolated the `n=4` formula to `c=5,r=3,j=13`, yielding a coefficient mismatch. The corrected script excludes `n=4,k=1`; the corresponding formal source adapters already exclude that position. This is a failed extrapolated identity outside its validity range, not a failure of the conjectured log-concavity inequality. The small-onset artifact likewise retains twelve capped examples of outside-window formula mismatches, not twelve conjecture counterexamples.

The 180 threshold-probe rows and 72 fixed-small-run symbolic probe rows concern polynomial expansion coefficients and chosen parameter shifts. A negative expansion coefficient does not refute the polynomial inequality; a nonnegative scalar certificate does not identify a raw source coefficient outside its source bridge's domain. These probes are not additional universal source results.

Independent finite-domain enumeration is saved as `markov_worker_000107_finite_domain_audit.json` (SHA-256 `0487a30349781abdd107ff7a25ed0fcb6d4cdb805d00d25f7782b0bf6bd5486b`). Selected mathematical source hashes are saved in `markov_worker_000107_mathematical_source_hashes.json` (SHA-256 `0677b9717ff5d2913cb0e2569f22c0f85c4165b91e6b4727b35d170934d8a6de`).

## Retained validation and the timeout boundary

The final archive supports 239 distinct successful mathematical-module builds, containing 1,013 named theorem declarations and 170 definitions. Eight of those modules are import-only shims. Of these, 216 modules / 956 theorem names have archived successful selected replay evidence. The cutoff build-only remainder is 23 modules / 57 names: the 22 late-selected `Five` modules / 52 names, plus `FourthFourComplete` / five names. Four compiled audit modules print 3,671 closure rows representing 1,008 distinct names, using only the permitted standard axioms; these are exactly the compiled theorem names other than the last assembly's five. The intermediate count of 149 replayed modules is not the final retained scope, and the 238-module FinalAudit inventory also precedes the last assembly build.

These are mostly generated proof/helper declarations, not 1,013 separate new source regions or conjectures. The mathematical gain is described above. Eleven failed builds are older source versions of ultimately compiled modules; they do not substitute for final successful checks. There were no build-timeout receipts in this worker, despite the outer controller timeout.

The final mathematical assembly and FinalAudit compilation both have completed archived events. No aggregate `validation.json`, artifact index, preservation/final-check report or finalizer output was completed. There is no final agent JSON report or `turn.completed`; the controller remains a host timeout with null report. Prospective/stale documentation naming such files cannot replace actual retained records.

The separately preserved receipt is:

`markov_worker_000107_late_evidence/kernel-union-1792097744398600000.json`

SHA-256 `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`.

It is byte-for-byte identical to the live late receipt; the worker archive was not modified. Its retained launch is event 251, with no completed event in that stream. It records a successful 22-module `Five` union with duration 71.933757 seconds. Its file was written at `2026-10-15 20:55:44.399240 UTC`, 52.598203 seconds after the nominal deadline `20:54:51.801037 UTC` and 17.839857 seconds after controller finish `20:55:26.559383 UTC`. These are receipt/file timing facts, not a separately logged instantaneous kernel-return time. The receipt is absent from the worker107 controller changes and archive. It can support a separately qualified later replay of those 22 modules, but must not upgrade the cutoff history or the unreplayed final assembly.

## Replay-method limits

The supporting review uses the established alternate kernel replay procedures, not an official CLI success claim or a fresh whole-tree rebuild. The replay drivers are unchanged. Imported dependencies are trusted as compiled imports during any one replay; target-free static import-closure/name checks and successful separately selected checks are recorded, but these are not an independent inspection of all loaded binary/generated constants or immutable invocation-time object bytes.

This worker's new batch wrapper runs topologically listed chunks with two parallel workers. Some imported new dependencies had not finished their separate replays when a dependent union started: 19 were outstanding at one 24-target start and 25 at one 12-target `Four` source/chamber start. All of those dependencies later succeeded within the archived 216 targets. Therefore “ultimately all these targets were replayed” is supported; the stronger wrapper prose that every imported dependency had already been checked before each dependent invocation is not. No such concurrency fact is used to transform compilation-only modules into replayed modules.

Supporting validation and replay-method reports are saved beside this note. Their source/object/archive/event bindings, exact attempt counts and timing qualifications remain separate from the mathematical statements. No missing validation or finalization step was completed by this audit.

## Final binding supplement

The validation-only audit confirms all 1,055 worker107 controller-listed artifacts match their archive and current bytes, with exactly the one separately identified late receipt outside that archive. All 531 predecessor worker106 artifacts remain unchanged. The 528 initial reconciliation rows and 541 initial hashes match in the audit's read-only reconstruction; this does not create a missing worker final preservation pass.

There are 254 archived build receipts (243 successes: 239 mathematical plus four Audit; eleven earlier-version errors) and ten completed archived successful unions, for 264 completed validation records. The additional union launch has only the separate late success receipt. No direct replay or inherited recovery target occurs in this history.

The last archived union receipt is timestamped `20:53:34.211582 UTC`. The final `FourthFourComplete` successful build receipt has mtime `20:54:47.961592 UTC`, before the `20:54:51.801037 UTC` nominal deadline. The full retained event stream ends with its and FinalAudit's successful build completions, while the late union launch remains unmatched. The controller's later timeout, null report and lack of finalization remain unchanged. `finalize_8b851864.py` was authored but not invoked. These facts separate successful checked-source results from unfinished outer reporting and the separately observed late replay.

The final support files are:

- `markov_worker_000107_validation_audit.md`: SHA-256 `ce821d4b3c29517d7baffedacca72f710a86a9aaa16c0e6322929bf994a6b139`.
- `markov_worker_000107_validation_evidence.json`: SHA-256 `b1e74163aeed9f05d9a3da8d807c732b4daf4cc4f3a8a899e1a869c60209508c`.
- `markov_worker_000107_replay_method.md`: SHA-256 `120e47819e8e004f5fd9822685fa6d09d1fb57955b775a1dd9c1e0b2e7c705e8`.
- `markov_worker_000107_replay_method_evidence.json`: SHA-256 `9a15d34a936936a5f6b32acf2f3af521a6f47fea097dc0d843e1d65375cde419`.

The support records bind 3,211 directly recorded inputs, stable at `2026-10-15T21:04:47.988203Z`. Their method qualifications are retained; no stronger invocation-time binary claim or whole-tree replay is inferred. No mathematical counterexample, undisclosed source premise or source/receipt mismatch was found within this review's stated scope.
