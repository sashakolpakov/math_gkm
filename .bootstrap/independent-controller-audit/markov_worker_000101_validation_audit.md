# Worker 000101 retained validation and timeout audit

Read-only audit of request `00a02b28b63542b5b3888c4b2b6f03ff`, using controller `.control/markov/workers/000101` and its archived `evidence/markov-00a02b28` and research files in `/Users/sasha/math_gkm`. Current bytes were compared with those historical archives; later checks were not substituted. No project code, Lean, builds, replays, finalizers or experiments were executed, and no project files were edited. Mathematical source scope is reviewed separately.

The retained evidence supports **42 final mathematical modules compiled, 32 separately replayed and ten compiled-only**, plus a compiled Audit printing **13 public theorem closures**. Local finalization succeeded before the deadline, but the controller timed out without a final worker response. The earlier inventory and exclusion list contain stale counts; final validation and matching receipts provide the accurate scope.

## Bindings and precise inventory

All **285 controller-indexed artifacts** match original archive bytes, controller after-hashes and current bytes. All **283 artifact-map entries** also match. The map intentionally omits `artifact-verification.json` and `final-check.json`; both are independently bound by controller/archive hashes. No extra current worker-101 file or unarchived evidence file was found.

The final 42 mathematical sources contain **1053 explicit theorems and 1177 definitions**: 30 column-certificate modules, six middle-value modules, four source adapters, PenFalling and OnsetLow. Every final source matches its successful build receipt, source snapshot and archived/current object hashes. Matching builds precede their successful direct or union replay. No successful build of a superseded source version is being selected.

`audit-inventory.json` was produced earlier: **37 modules and 883 named theorem declarations**. Five subsequent successful builds—Columns4_2, 4_3, 4_4, 4_5 and 5_5M00—contribute the other **170 theorem declarations**. The finalizer adds these modules to `validation.json` with `late_build: true`, producing the correct final 42-module scope, but does not rewrite the earlier inventory.

The finalizer also computes `excluded_drafts` from that earlier 37-module list. Consequently, `operational-observations.json` and `final-check.json` report **13 excluded drafts**, five of which are those final compiled-only columns. The actual final complement is **eight unbuilt drafts**. This is a metadata classification error, not a missing successful build or a successful replay for the ten unchecked columns.

The eight genuinely unbuilt sources are `MarkovFourthAfterMiddleM00`, `MarkovFourthMiddleM00`, `MarkovOnsetAdapter4M00`, `MarkovOnsetAdapter5M00`, `MarkovOnsetAllM00`, `MarkovOnsetGap0_1M00`, `MarkovResidualLowM00` and `MarkovResidualM00`. All lack retained objects and successful final-source checks. Gap0_1 and ResidualLow have timed-out builds; the other six have no Lean invocation receipts. No general assembly or root reduction from those drafts is accepted.

## Actual attempts and successful replay scope

There are **71 actual ordinary invocations**:

| Outcome | Count |
|---|---:|
| Successful build | 43 |
| Timed-out build | 7 |
| Successful individual replay | 20 |
| Timed-out individual replay | 1 |

The successful builds are exactly 42 mathematical modules plus Audit. Five build timeouts are the columns later successfully built; the other two are the unbuilt Gap0_1 and ResidualLow drafts. The direct replay timeout for Columns0_1 was followed by a matching successful individual replay.

Four additional union invocations comprise **three successes and one timeout**, giving **75 actual Lean invocations** overall. The nine rejected invocation records are seven build timeouts, one direct replay timeout and one union timeout. Earlier shell-generation failures and two validator FileNotFoundError exits occurred before Lean invocation and are separately retained; they are not additional proof-check outcomes.

One aggregate parallel-build record also marks Columns5_5 as skipped when its queue entry was reached. That row is not a Lean invocation or an ordinary skip receipt. A later matching successful build exists. All 71 actual ordinary receipts and all four union receipts have matching completed command events; nested parallel output was matched to each child receipt. Source snapshots and event output summaries/prefixes agree with retained receipts.

The successful replay scope is:

| Check | Modules | Theorems | Definitions |
|---|---:|---:|---:|
| Individual column replays, chambers 0–3 and positions 1–5 | 20 | 680 | 780 |
| PenFalling plus six MiddleValue modules, one union | 7 | 7 | 7 |
| Four source adapters, one union | 4 | 24 | 0 |
| OnsetLow, one union | 1 | 2 | 0 |
| **Distinct successful targets** | **32** | **713** | **787** |

The ten **Columns4_1–4_5 and Columns5_1–5_5M00** remain compiled-only: **340 theorems and 390 definitions**. `validation.json` explicitly sets `kernel_replay_complete: false` and lists exactly those ten. Neither successful source-module replay nor imported objects are counted as separate replay of these ten modules.

The successful union receipts are:

- `kernel-union-1792087295638537000.json`: seven targets, event **157**, receipt time **18:01:35.638537 UTC**.
- `kernel-union-1792087426610749000.json`: four adapters, event **168**, receipt time **18:03:46.610749 UTC**.
- `kernel-union-1792087737175366000.json`: OnsetLow, event **204**, receipt time **18:08:57.175366 UTC**.

The earlier eight-module union `kernel-union-1792086812045872000.json` timed out and has no success evidence; its selected modules later receive successful checks through the receipts above and individual replays. Partial output from that timeout is not accepted. Receipt timestamps and duration-derived estimates are distinct from a separately logged exact kernel-return time.

## Axiom scope

Audit compiled successfully and retains **1382 stdout characters**. Its 13 print requests, 13 printed closures, public inventory names and validation axiom records agree exactly. All printed closures use only `propext`, `Classical.choice` and `Quot.sound`.

The thirteen names are the two restricted OnsetLow source theorems, PenFalling convolution, six middle-value source identities and four source-chamber aggregate theorems. These closures include dependencies actually used in those proofs. They are **not 883 or 1053 separate axiom printouts**, and do not certify every unused helper or the ten higher-chamber compiled-only modules through public-closure coverage. Audit imports the earlier 37-module inventory, has no mathematical declarations and is compiled-only, outside the replay targets.

## Historical replay method

The method review uses archived worker-101 source bytes and the previously hash-bound worker-100 dependency graph only where each source digest equals worker-101's before snapshot. It reads no successor graph or successor result. Both drivers retain the established hashes: ReplayKnown6d2c `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; ReplayBatch07F1 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The controller records no driver changes, and successful union receipts cite the unchanged batch hash. Request-specific wrappers match worker 100 after ID substitution. Queue wrappers change concurrency and time limits, not replay semantics.

The three successful union bases contain **555, 578 and 610 local modules** respectively. The adapter union imports twenty lower columns; the OnsetLow union imports those columns and four adapters. Those imports are trusted within each invocation, with their separate successful checks listed above. The ten higher compiled-only columns appear in **none** of the successful replay bases. No selected module or explicit name is reimported, no explicit selected-name duplicate or source import cycle was found, and inherited source hashes match the before snapshot.

Direct checks capture source snapshots before invocation. Unions hash selected sources before invocation and the driver after return. Neither freezes or hashes loaded objects at invocation. The unchanged driver kernel-checks safe nonpartial selected declarations relative to imported objects; imports remain trusted, axioms remain axioms, unsafe/partial declarations can be skipped, and duplicate/imported theorem metadata can bypass proof-body comparison. The source graphs expose no corresponding explicit-name shortcut here. Pending dependency handling does not insert proof assumptions.

These are alternate kernel replays, not official CLI replay or a fresh inherited rebuild. Static source graphs do not independently establish binary import tables, generated/private constant inventories or exact loaded-object bytes/times. The method note retains those limits without turning compiled imports into replayed targets.

## Finalization, preservation and timeout boundary

The finalizer completed successfully at event **211**. It records 42 compiled modules, 32 replayed, 13 public closures, 268 preservation comparisons, 283 indexed files and nine rejected invocations. Its stale 13-draft classification is qualified above. Event **214** subsequently reads the summary and root digest; it is not an independent full-map rehash. This audit independently verifies all final map entries against current/archive/controller hashes.

All **268 preservation comparisons**, **259 initial reconciliation comparisons**, and the 268 initial hashes match current bytes. These sets overlap. All **254 worker-100 controller artifacts** match their original archive/controller hashes, worker-101 before snapshot and current bytes; none was modified. Pinned root and canonical contract requirements match.

All times below are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 17:40:52.807652 |
| Final validation mtime | 18:10:05.334915 |
| Final preservation mtime | 18:10:05.408470 |
| Artifact-map mtime | 18:10:08.040739 |
| Final-check mtime | 18:10:08.040857 |
| Controller deadline | 18:10:52.807652 |
| Controller finish | 18:11:11.831101 |

The latest artifact, final-check, predates the deadline by **44.766795397 seconds**. No changed artifact has a current mtime after the deadline or controller finish. No command item remains pending in the worker-101 event stream. The word `late_build` refers to builds later than its initial inventory, not artifacts produced after the host cutoff.

The controller nevertheless records **timeout**, elapsed **1819.023449898 seconds**, report null and mathematical resolution false. The worker process return code is zero, but there is no final agent JSON, `final.json` or `turn.completed` event. Successful local finalization and the timeout/no-response boundary are distinct facts. Worker 102's later attempt to recover the ten replays does not change this historical record.

## Supporting evidence

All **1111 directly recorded audit inputs** were rehashed unchanged at `2026-10-15T18:37:57.857909+00:00`. The method's inherited graph is transitively bound through the earlier worker-100 evidence file and before-worker hashes; this input count is not a fresh reread/rebuild count for every inherited source.

- `markov_worker_000101_validation_evidence.json` — SHA-256 `58f554bfa4df62b06edcffd8251a5f64207c86ec55082a616e6c4c3ea718d138`.
- `markov_worker_000101_replay_method.md` — SHA-256 `f336cfde8fd31bcd7aef374b70ca635bbbf85d2adc01305579ba87a1db3dd854`.
- `markov_worker_000101_replay_method_evidence.json` — SHA-256 `3209ac007ecb27f10c8821e15375eebca7ed44d6f43295d87b92d9a253ec3d9c`.
