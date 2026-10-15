# Worker 000094 retained validation and timeout audit

Read-only audit of request `04290504255048ec8a33fbe263ddb123` in `/Users/sasha/math_gkm`, evidence `evidence/markov-04290504`, controller `.control/markov/workers/000094`. No project code, Lean, replay, experiment or finalizer was executed by this audit; no project files were written. Mathematical scope is reviewed separately.

The retained evidence supports **27 inventoried mathematical modules compiled, 64 named theorem closures printed with permitted axioms, but only nine modules / 25 named theorems separately replayed successfully**. The remaining 18 modules / 39 named theorems compiled and are imported dependencies of the downstream source/residual replay. Their own replay attempts timed out. They must not be counted as replayed targets. The finalizer records this distinction explicitly; it completed shortly before a host timeout with no final worker response.

## Final source, object and receipt bindings

All **328 controller-indexed artifacts** match their controller after-hashes, current bytes and worker-94 archive bytes. All **327** entries of the single `artifact-verification.json` file map agree with those values; the map omits only itself. All current worker-94 files are accounted for, with no extra unarchived or later changed artifact. This worker has no separate `artifacts.json`. The finalizer computes hashes once and labels the map as artifact hashes, not mathematical evidence; this audit independently compared every entry with current, archive and controller values.

Every final inventoried source has a matching successful build receipt, retained attempt snapshot and indexed object. All attempt snapshots match their receipt source hashes. Final source hashes agree with validation and audit inventories. Every actual build and union attempt has a completed outer command event whose recorded receipt fields match. Successful ordinary event stdout/stderr are length summaries; full output is retained in the hash-bound receipts. Failed event output is exact or truncated by the validator. The complete event/receipt comparisons are in the companion evidence.

There are **70 build-like records: 69 actual invocations and one explicitly skipped queued build**. Actual invocations comprise **42 successful builds, 16 failures, and 11 timeouts**. The 42 successes divide into:

- 28 final inventory/Audit builds (27 mathematical modules plus Audit).
- Nine final `MarkovSplitAG00M042` through `MarkovSplitAG08M042` helper builds, explicitly excluded from the final inventory.
- Five superseded successful builds: four earlier A/B/D/L definition sources and the earlier Audit source.

The skipped record is `run-MarkovBlockDGap0M042-build-1792074994559688000.json`. It records that the queued build was cancelled before execution; its snapshot/digest and matching event payload agree. It is not a failed Lean invocation. A later matching DGap0 build succeeded. The final skip-list contents do not erase earlier successful SplitAG build receipts.

The finalizer's **27 failed builds** correctly equals the 16 failures plus 11 timeouts, excluding the skipped entry. Its **85 excluded drafts** are an inventory boundary, not a claim that every excluded file failed compilation: nine excluded SplitAG helpers retain successful builds and objects. The other 76 excluded sources have no successful final-hash build/object. No excluded helper is counted in the 64 final printed closures or nine successful replay targets.

Retained object digests establish final artifact equality, not invocation-time object identity. The wrappers neither freeze files nor record the exact loaded object hashes/times.

## Replay outcomes and imported dependencies

The final inventory contains **64 explicit theorems and 135 definitions**. Four definition-only modules (A/B/D/L Defs) contribute no theorem declarations.

| Union receipt suffix | Outcome | Targets | Named theorems |
|---|---|---|---:|
| `1792075504741885000` | Success | ResidualSmall | 1 |
| `1792075621830154000` | Timeout, 180.234 seconds | 26 inventory modules except ResidualSmall | 63 |
| `1792075711875624000` | Success | BlockSmall, EarlyBlock | 9 |
| `1792075776363036000` | Success | LDefs, LGap4–8 | 15 |
| `1792075784330549000` | Timeout, 120.272 seconds | Six B algebra modules | 13 |
| `1792075784355343000` | Timeout, 120.278 seconds | Six A algebra modules | 13 |
| `1792075784395652000` | Timeout, 120.294 seconds | Six D algebra modules | 13 |

All receipts are `kernel-union-<suffix>.json` in the worker evidence directory. All seven attempts have matching final target-source hashes and completed command events; no union remains pending. There are no direct replay receipts. Audit is compiled but is not a replay target. Failed union stdout/stderr retain the string `None`; these records identify no justified subset of completed replay declarations.

The three successful unions select **nine distinct mathematical modules, 25 theorems and 63 definitions**. The other **18 inventoried A/B/D modules contain 39 theorems and 72 definitions**. Each family consists of Defs, Value0–2, Gap0 and Chart. Their final sources compiled, but both the large union and their smaller selected groups timed out. The final validation flags and unreplayed-module list match this exact division, with `kernel_replay_complete: false`.

The successful ResidualSmall source import closure has 559 local modules, including BlockSmall and all 18 new A/B/D modules. The successful BlockSmall/EarlyBlock closure has 184 local modules, including those same 18 algebra modules. The successful L closure has no local source base, using external Mathlib tactic imports. Therefore downstream replay checks the source/residual declarations relative to those compiled imports; it does not replay the entire new proof chain. Residual replay also precedes successful replay of BlockSmall/EarlyBlock; the later matching success does not change the imported-only status of A/B/D.

The unchanged driver and target-free source graphs support the nine-target result within their normal limits. All seven attempt graphs have no selected source module/name in their imported base, no selected explicit-name duplicate, and no source import cycle. Existing inherited local source hashes match the before-worker snapshot. Nine excluded SplitAG sources each duplicate one definition and one theorem name from BlockAGap0, but none appears in any of the seven target sets or import closures. They do not contaminate these inspected source graphs.

Both drivers retain their before-worker hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established individual driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Events 164–165 reduce the wrapper timeout from 180 to 120 seconds without changing the replay semantics. Source hashes are captured before launch and successful builds are required; the driver hash is captured afterward.

The driver sends selected safe nonpartial declarations through kernel checking. Imported declarations remain trusted; unsafe/partial declarations can be skipped; axioms remain axioms; duplicate map names can overwrite; already-imported matching theorems can avoid proof-body replay. Static source checks found no such selected-target shortcut here. Pending recursion does not insert proof assumptions. Source graphs and explicit names do not establish actual binary import tables, private/generated constant inventories or exact loaded objects. No official CLI replay or fresh whole-source rebuild occurred. Full method detail is saved separately.

## Axiom inventory and finalizer transition

All **64** final source names exactly equal the inventory, Audit requests, retained printed closures and validation axiom map. All closures use only subsets of `propext`, `Classical.choice`, `Quot.sound`. Final Audit imports 27 modules, declares no mathematical constant and retains 6,051 stdout characters. Its successful event carries the corresponding length summary. The earlier successful Audit imports 26 modules and prints 63 closures, before ResidualSmall was included; it is superseded and not used for the final 64-name claim. Printing closures does not supply the missing 39-theorem replay.

Only **one finalizer invocation** is retained, successfully completed at event 184. Before invocation, the source was revised to replace the all-replays assertion with per-module `kernel_replay_passed` flags and an explicit unreplayed list; final documentation was also amended to state the incomplete proof-chain replay. There is no earlier failed finalizer invocation or partially accepted final manifest to infer. The recorded output is 27 mathematical modules, nine replayed, 64 closures, 162 preservation comparisons, 327 artifacts, 27 failed builds and 85 excluded drafts.

All **162 preservation comparisons** and **298 initial reconciliation comparisons** match current bytes. They overlap and should not be summed as distinct protected files. All **147 worker-93 controller-indexed artifacts** also match their old controller hashes, old archive, worker-94 before snapshot and current bytes; none is modified by worker 94. This preserves worker 93's local finalization/host-timeout boundary rather than upgrading it. The pinned root and canonical contract hashes match their stored requirements.

## Timing and final response boundary

All times are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 14:20:18.379152 |
| ResidualSmall successful receipt filename | 14:45:04.741885 |
| BlockSmall/EarlyBlock successful receipt filename | 14:48:31.875624 |
| L-group successful receipt filename | 14:49:36.363036 |
| Last timed-out group receipt filename | 14:49:44.395652 |
| Validation file mtime | 14:50:14.147041 |
| Preservation file mtime | 14:50:14.280013 |
| Final artifact index mtime | 14:50:15.943715 |
| Final retained event-log mtime | 14:50:15.961393 |
| Controller deadline | 14:50:18.379152 |
| Controller finish | 14:50:28.074541 |

The artifact index predates the deadline by **2.435436487 seconds**. No indexed artifact has a current mtime after the deadline or finish, and no extra unarchived file or pending command was found. Receipt filenames are assigned after subprocess completion/hashing, not exact independently logged kernel-return times.

The controller records **timeout**, elapsed **1809.695389271 seconds**, report null and mathematical resolution false. There is no final agent JSON, controller `final.json`, `turn.completed`, or local `report.json`. Successful local finalization must remain distinct from a completed worker response. The final manifest accurately retains the missing replay checks; this audit did not run or complete them.

## Supporting evidence

The companion JSON contains every source/object/receipt/snapshot digest, controller/archive comparison, event binding, skipped/excluded record, exact replay division, axiom names, preservation comparison and timing. The separate method JSON retains complete target/import graphs and source-name overlap checks.

All **1506 combined audit inputs** were rehashed without change at `2026-10-15T14:59:29.212981+00:00`.

- Validation evidence: `markov_worker_000094_validation_evidence.json`, SHA-256 `1f398ba8bc161c25b20d6b89a5b00c179538b9ef0f929c0d4dfcca55baa085ef`.
- `markov_worker_000094_replay_method.md`, SHA-256 `3b1b6659cae4611d75720ff2b87f6cdfedd7b4f5866396e72a84aa35519412e2`.
- `markov_worker_000094_replay_method_evidence.json`, SHA-256 `35c66acdf67c2b581e68ccf542431d147433b53310c6757dd9a3f866b02b0a38`.
