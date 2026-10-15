# Worker 000104 retained validation audit

Request `5dc9c88dfee041f18445d13ddd622849`; controller `/Users/sasha/math_gkm/.control/markov/workers/000104`. Static archive/record/source/hash inspection only. No project script, Lean command, replay, experiment, finalizer or missing check was executed; no project files were changed. Mathematical scope is reviewed separately by the parent audit.

## Result

The final retained records support compilation and alternate kernel replay of all **nine new mathematical modules**, containing **31 named theorem declarations and 24 definitions**, plus successful recovery replay of inherited `MarkovMiddleLowDirectM722` (one theorem). The **32 distinct printed axiom closures include that recovered theorem**. Two Audit modules compiled but were not replay targets. There are no new accepted mathematical modules left compiled-only.

All **255 controller changed artifacts** match both archived bytes and current bytes. All **253 artifact-index entries** match their indexed hash, archive, current file and controller hash. The two controller artifacts outside the index are `artifact-verification.json` itself and `final-check.json`. No current extra file, unarchived late file, pending command item, postdeadline artifact or postfinish artifact was found within this worker scope.

## Accepted modules and axiom coverage

| New mathematical module | Named theorems | Definitions |
|---|---:|---:|
| `MarkovBackwardThreeM5DC` | 1 | 0 |
| `MarkovBackwardThreeSourceM5DC` | 1 | 0 |
| `MarkovH2CorrectionM5DC` | 11 | 17 |
| `MarkovMiddleCorrectedM5DC` | 8 | 1 |
| `MarkovMiddleGap0_0_0M5DC` | 2 | 1 |
| `MarkovMiddleGap0_1_0M5DC` | 2 | 1 |
| `MarkovMiddleOneM5DC` | 2 | 0 |
| `MarkovResidualAssemblyM5DC` | 3 | 3 |
| `MarkovSecondOnsetSourceM5DC` | 1 | 1 |

All accepted build receipts bind the final source hash and an identical saved source snapshot. Their objects are controller/archive/index/current bound, and successful builds precede the selected union replay. The recovered LowDirect source, its earlier successful worker 103 build snapshot and object, the worker 104 replay snapshot and its successful receipt are separately bound in the evidence JSON. Recovery is credited to worker 104; worker 103’s timed-out replay and absent LowDirect axiom output remain historical facts.

`MarkovAuditM5DC` prints 20 closures; `MarkovFinalAuditM5DC` prints all 32. Thus 52 printed rows represent 32 distinct names, with exactly the expected 31 new theorem names plus `middle_low_directM722`. All printed names match the source requests, final audit inventory and validation axiom map. Every closure uses only `propext`, `Classical.choice`, and/or `Quot.sound`; the two prototype gap equality closures list only `propext`. No named theorem in the accepted/recovered inventory lacks a direct printed closure. These named theorem counts are distinct from the larger set of declaration constants handled by replay.

## Actual invocations, interruptions and excluded sources

There are **26 recorded actual Lean validation invocations**: 20 builds, one direct replay, and five union replays. The builds comprise 11 successes (nine mathematical modules plus two Audits), six timeouts, and three child exits with return code −2 (SIGINT). The direct recovery and all five unions succeeded. No skipped-check receipt exists. Every ordinary receipt has a matching completed event wrapper summary; every union receipt has a matching full completed-event payload.

The interrupted batch’s completed event 78 has outer exit 130 and a `KeyboardInterrupt`. It contains three completed timeout receipts for `MarkovMiddleGap0_0_0M5DC`, `...0_1_0...`, and `...0_2_0...`, followed by the three SIGINT receipts for `...0_3_0...`, `...0_4_0...`, and `...0_5_0...`. The outer interruption does not change the first three recorded child outcomes. The first two timed-out prototypes later compiled successfully with **unchanged source hashes** and then replayed. The other three timeouts are grouped `MarkovMiddleGaps0M5D2`, `...Gaps2...`, and `...Gaps3...` attempts. Process lookup/signal commands were denied; those command failures are distinct from Lean compiler outcomes.

The archive contains **152 new Lean sources**: nine accepted mathematical sources, two Audit sources, and **141 excluded mathematical sources** (125 suffix `M5DC`, 16 suffix `M5D2`). All 141 excluded sources lack an object and successful final-source build. Seven excluded module names have rejected build attempts (four timeouts and three SIGINT); the other 134 have no retained invocation. Two additional timeout attempts belong to the later successful prototype retries. The early `selected-modules.json` is an abandoned candidate list, not the final accepted inventory; `validation.json` and `final-audit-inventory.json` provide the final scope.

## Replay chronology

| Successful replay target set | Recorded receipt time (UTC) | Duration |
|---|---|---:|
| Inherited `MarkovMiddleLowDirectM722` (direct) | about 19:03:15.099 | 93.499 s |
| `MarkovBackwardThreeM5DC`, `MarkovBackwardThreeSourceM5DC` | 19:16:38.443346 | 17.074 s |
| `MarkovMiddleCorrectedM5DC`, `MarkovMiddleOneM5DC` | 19:19:13.246925 | 71.253 s |
| `MarkovResidualAssemblyM5DC`, `MarkovMiddleGap0_0_0M5DC`, `MarkovMiddleGap0_1_0M5DC` | 19:20:20.465310 | 36.201 s |
| `MarkovH2CorrectionM5DC` | 19:24:00.623094 | 32.199 s |
| `MarkovSecondOnsetSourceM5DC` | 19:25:10.051554 | 4.865 s |

The nine new modules are explicit targets across the five unions (2 + 2 + 3 + 1 + 1), with no duplicate target across groups. Audit modules are compilation/axiom-output evidence, not additional replay targets. Receipt filename timestamps for unions are post-return timestamps; ordinary validator filenames precede subprocess invocation. Estimated elapsed-time endpoints are not an independent wall-clock recording of the kernel call.

## Finalization and historical boundary

Finalizer invocation event 223 completed successfully at event **224**, with the saved final summary of 9 accepted/replayed new modules, 32 distinct closures, 1 inherited replay, 411 preserved inputs, 253 index entries, 9 rejected attempts and 6 timeouts. There was one completed finalizer invocation and no failed finalizer/repair. Event **226** independently within the worker checked all 253 indexed hashes and all selected replay/axiom status flags. Final report event **227** matches `final.json` and the controller report; event **228** is `turn.completed`. All selected replays and both successful axiom audits precede finalization.

| Boundary | UTC on 2026-10-15 |
|---|---|
| Controller start | 18:57:50.670732 |
| Last union receipt timestamp | 19:25:10.051554 |
| Final Audit build estimated return | 19:25:11.066135 |
| Validation file mtime | 19:25:50.776685 |
| Preservation file mtime | 19:25:51.369436 |
| Artifact index mtime | 19:25:51.430510 |
| Final check mtime; latest changed artifact | 19:25:51.430593 |
| Controller finish | 19:26:32.157230 |
| Controller 1800-second deadline | 19:27:50.670732 |

The controller reports **completed**, return code 0, elapsed **1721.486498117447 seconds**, with a retained final report. Finish was 78.513502 seconds before the deadline. No post-finalizer artifact or late receipt changes the accepted inventory. `completion` remains null and `mathematical_resolution` false.

All **406 worker 103 controller artifacts** match their original archive, before-104 hash and current file; worker 104 changed none of them. The **398 reconciliation entries**, **411 initial hashes**, and **411 preservation entries** also match. These overlapping counts are not additive. In particular, the worker 103 union receipt written after its finalizer but before its own deadline remains preserved as such; the worker 104 recovery does not revise the worker 103 finalizer snapshot or timeout outcome. The pinned root and raw/canonical contract hashes match the established values.

## Method and evidence limits

The replay drivers retain the established hashes: `ReplayKnown6d2c.lean` = `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; `ReplayBatch07F1.lean` = `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. Static transitive imported bases contain 222, 588, 883, 575 and 576 modules for the five successful unions, and 15 for direct LowDirect. All are target-free at source level, with no explicit target/base name collisions, duplicate selected names or resolved source cycles. Every new module imported by a later successful replay had an earlier successful replay of its own. None of the 141 excluded new drafts or four unreplayed worker 103 Gap3 modules appears in those bases.

The worker 104 union wrapper retains pre-run source hashing and post-run driver hashing but removes worker 103’s matching-successful-build receipt precondition, uses a 240-second timeout, and imports the validator environment. The independent binding checks here nevertheless establish matching successful builds before every accepted replay. The validator preserves snapshots and receipts, drops the earlier absolute build cutoff, and selects optimized import-path ordering if that file exists. Optimized ordering moves package/toolchain directories ahead of older evidence while keeping current evidence first. The early LowDirect call cannot be assigned that final ordering without file-creation timing. Static analysis preserves both configurations; it does not reconstruct a per-call binary environment.

Replay-method support is saved separately as `markov_worker_000104_replay_method.md` and its evidence JSON. Object hashes here bind the retained final objects to controller/archive/current bytes; wrapper receipts do not record object digests at the instant of module loading. Alternate replay and ordinary compilation remain separate claims. No official LeanChecker CLI invocation or fresh rebuild of the entire inherited dependency tree is claimed. Static imported-source closure analysis cannot independently identify every exact binary module loaded at runtime.

The machine-readable `markov_worker_000104_validation_evidence.json` records each source/object/receipt/event/index/controller binding, excluded-source inventory, axiom names, timings, input hashes and static replay-method links.

Final support hashes: validation evidence JSON `470d8c7a06a375d7fc66e619d6985b59514eba008a5997cd5dc201fb01715aab`; replay method note `98e34abdf8656761c28fb8f94ee06683d2be4260df8f431ca03c22df64474d50`; replay method evidence JSON `4bf45416f51ea3a886154bb16f556299ad2a45e4b59a6931fbbe4ac91d780114`. All **1357 directly recorded inputs** were stable at **2026-10-15T19:33:55.378561Z**. The historical parsed import graph is additionally bound through the saved predecessor method evidence and worker 104 before hashes; no fresh inherited-tree rebuild was performed.
