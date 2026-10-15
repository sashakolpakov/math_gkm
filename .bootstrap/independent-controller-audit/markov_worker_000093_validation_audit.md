# Worker 000093 retained validation and timeout audit

Read-only audit of request `cc599cf12cc74c9e84112aac7bc0f9ac`, project `/Users/sasha/math_gkm`, evidence `evidence/markov-cc599cf1`, controller `.control/markov/workers/000093`. No project code, Lean, replay, experiment or finalizer was executed by this audit; no project files were written. Mathematical scope is reviewed separately.

The retained records support **16 final mathematical modules with successful matching compilation and alternate union-kernel replay, plus a successfully compiled Audit printing all 41 named theorem closures**. The finalizer completed before the deadline. The controller nevertheless ended as **timeout**, with no final agent report. These are distinct facts: successful local finalization does not establish a completed worker turn or root-theorem admission.

## Final artifact bindings

All **147** controller-indexed artifacts match their controller after-hashes, current bytes and worker-93 archive bytes. All **145** entries of `artifact-verification.json` additionally agree with those values. The two controller entries outside that index are the verification file itself and `research/markov-cc599cf1-tmp/compact-defs.lean`; the latter is an archived temporary source, not an accepted mathematical module. Including that nested file, all 147 current worker-93 files are accounted for; no unarchived extra was found.

This worker uses a single index under `artifact-verification.json`'s `files` key; there is no separate `artifacts.json`. The finalizer computes the hashes once and writes `verified: 145` with a qualification that these are artifact hashes, not mathematical evidence. It does not perform a second independent hash-comparison pass. This audit independently compared all 145 entries against current, archive and controller values.

Every selected final source matches its successful build receipt, retained source snapshot, validation inventory and successful union membership. All 17 successful build objects (16 math plus Audit) are retained, indexed and archive-equal. The evidence lists exact source, snapshot, receipt and object digests. Object digests bind the final retained artifacts; no wrapper records invocation-time object digests or freezes files while replay reads them.

## Attempts, exclusions and exact coverage

There are **27 actual build receipts**: **17 successes**, **3 return-code-1 failures**, and **7 timeouts**. The 17 successful source versions are exactly the final 16 mathematical modules plus Audit, with no extra superseded success. Every attempt snapshot matches its receipt source digest, and every receipt has a completed outer command event with matching fields.

The finalizer's printed and stored **“11 failed builds” is an overcount**. It scans `run-*.json` and treats absent `returncode` as failure, thereby including `run-four-probe.json`, whose schema is experimental `rows`/`seconds`/`status`. The correct number of rejected compilation attempts is **10** (3 failures + 7 timeouts). This bookkeeping error does not change the accepted inventory.

The failed builds are earlier BlockSource and LinearDerivative versions, and a LinearMoments attempt with the final source hash that failed because its FourLinear import object was not yet present. The latter source later compiled successfully. Two accepted modules also have earlier timeouts: FourLinear's original monolithic source and FourLinearDefs with the same final source hash; each has a later matching successful build. The remaining five timeouts concern excluded BlockParts and BlockSmall1–3, with two attempts for BlockSmall1.

All **16 excluded drafts** are preserved and have no retained object, successful build or replay. Four names have the five timeout attempts just described; the other twelve (BlockGap0–8 and BlockLC/BlockThreeLC/BlockSourceLC) have no build receipt. Later edited final Small2/Small3 draft sources are not covered even by their older timeout snapshots. Exclusions are not counted as accepted declarations or silently upgraded by artifact preservation.

The 16 mathematical modules include **definition-only `MarkovFourLinearDefsCC`**. Their source total is **41 named theorems and 27 definitions**; Audit has no explicit declaration.

| Successful union receipt | Targets | Named theorems | Receipt-name UTC |
|---|---:|---:|---|
| `kernel-union-1792072855989621000.json` | FirstShiftCC only | 5 | 14:00:55.989621 |
| `kernel-union-1792073960241231000.json` | All 16 mathematical modules | 41 | 14:19:20.241231 |

This is **17 selections / 16 distinct mathematical modules**, not 17 distinct replayed modules. FirstShiftCC has the same final source digest in both groups. All matching successful builds precede their group's estimated execution interval. There are **no direct replay receipts, and Audit is not selected by either union**. Audit compilation prints imported theorem closures; it does not supply a separate kernel replay of those declarations.

Union receipt SHA-256 values are `23649182728c9a3da3be5ff603045a8072e382232c0af4a45ddfb2cfe7582000` and `49edb230e1ad6ffb3034da1be5eca7ba2b32912fa5545f1e9bd8d6a2e3daab26`. Both completed event payloads match their retained receipts exactly (event lines 104 and 205). Filename timestamps are assigned after replay and hashing, so estimated start/return intervals are not independently logged precise kernel-return times.

## Axioms and method qualifications

All **41** source theorem names exactly equal the inventory names, Audit requests, printed closures and validation axiom map; there are no missing or extra names. Each closure contains only a subset of `propext`, `Classical.choice`, `Quot.sound`. The final Audit source has 16 imports and 41 axiom-print commands. Its build retains 3,717 characters of stdout.

Successful ordinary receipt events contain stdout/stderr **length summaries**, not the full text. Their lengths agree with the complete hash-bound receipts. Failed event outputs agree exactly or with the wrapper's 8,000-character prefix. A summary in an event is not an independent copy of every axiom report; the archived receipt contains the full output.

Both drivers are unchanged against the before-worker snapshot:

- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.
- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.

Both unions record the matching batch-driver hash. The wrapper hashes selected sources before execution, requires matching successful build receipts, invokes the established union driver and hashes the driver afterward. The source-level inherited local closures contain **168** and **525** modules respectively; neither contains its selected targets. No explicit-name collision, duplicate, import cycle or inherited source/before-snapshot mismatch was found.

The unchanged replay method uses actual kernel checking for collected declarations, but its usual qualifications remain: unsafe/partial declarations are skipped; axioms are accepted as axioms; duplicate map names can overwrite; already-imported matching theorem declarations can skip proof-body comparison. Static target/name checks found no selected-source route to those skips. Pending recursion does not insert declarations as assumptions. Source-level import/name analysis does not reveal actual binary import tables or generated/private constant inventories. Imported dependencies remain trusted. There is no official CLI replay, independent binary per-declaration witness or fresh whole-source rebuild. The separate method note records the exact checks and limits.

## Finalization, timeout and predecessor preservation

One finalizer invocation completed successfully (event lines 207–208), reporting 16 mathematical modules, 41 closures, 189 preservation comparisons, 145 indexed artifacts, 16 excluded drafts and the overcounted failed-build total. All **189 preservation comparisons** and **207 initial reconciliation comparisons** agree with current bytes. These sets overlap and should not be added as distinct protected files.

All times below are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 13:50:05.224151 |
| Final full union receipt filename | 14:19:20.241231 |
| Validation file mtime | 14:19:30.247701 |
| Preservation file mtime | 14:19:30.467125 |
| Operational observations mtime | 14:19:30.468305 |
| Artifact index mtime | 14:19:30.546328 |
| Final retained event-log mtime | 14:19:30.613188 |
| Controller deadline | 14:20:05.224151 |
| Controller finish | 14:20:09.474898 |

Artifact finalization predates the deadline by **34.677823305 seconds**. No controller-indexed artifact has a current mtime after the deadline or finish. Both unions and every actual build have completed command events. The finalizer is followed by a completed STOP-file read (events 209–210); there are no pending command items.

The controller reports **timeout**, elapsed **1804.250746727 seconds**, final report null, and `mathematical_resolution: false`. There is no `final.json`, final agent JSON, `turn.completed`, or local `report.json`. Thus “reports completed before timeout” is defensible only for the retained local validation/preservation/artifact records, not a completed final worker response. No missing response or check was completed by this audit.

All **174 worker-92 controller-indexed artifacts** match the old controller after-hashes, old archive, worker-93 before snapshot and current bytes. None is a worker-93 changed file. The saved reconciliation preserves worker 92's completed records and its worker-91 historical timeout/receipt qualification. It does not rerun or retroactively repair predecessor checks. The pinned root and canonical contract hashes also match their stored requirements; exact digests are in the companion evidence.

## Supporting evidence

The companion JSON records all final source/object/receipt hashes, snapshots, controller/archive comparisons, event bindings, exclusions, axiom names, predecessor and preservation comparisons, chronology and method inputs. This is a static retained-evidence audit, not a new mathematical validation run.

All **1174 combined audit inputs** were rehashed without change at `2026-10-15T14:31:55.650052+00:00`.

- Validation evidence: `markov_worker_000093_validation_evidence.json`, SHA-256 `9bcf44a146f09286da604acd0d8d2d2c499d32385f93e8350f7c875bd7d8d8ae`.
- `markov_worker_000093_replay_method.md`, SHA-256 `2dc8319bf48928e416d0256e74cb4e94aaa54d9389566db478e619a9daea16c1`.
- `markov_worker_000093_replay_method_evidence.json`, SHA-256 `1c343d580f9aeec4c9ca19150f21ec0d99b4bc2f763ac38d329004ed76b2a80a`.
