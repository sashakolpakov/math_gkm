# Worker 000110 retained validation audit

Request `cfcbaf3000504d5c976b56c4302db280`. Archive-first, read-only review of completed worker 110, its retained controller/build/replay records and matching current bytes. No Lean, checker, replay, experiment, finalizer, project import or missing check was executed. No project/collatz edits, proposer contact or successor inspection occurred. All audit output is under `/private/tmp/math_gkm_godel_20261013`. Mathematical scope is assessed separately in the [main audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000110_monitoring_audit.md).

## Result and precise validation boundary

The final archived receipts establish **58 compiled mathematical modules, 402 named theorem declarations and 474 definitions**, with final-source-matching builds and retained objects. Successful Audit output covers all 402 theorem names. **Only six modules have successful selected replay**, accounting for **32 theorems and 55 definitions**. The other **52 modules, 370 theorems and 419 definitions**, have compilation and named closure coverage but no successful selected replay.

| Successful selected replay target | Theorems | Definitions |
|---|---:|---:|
| `MarkovSmallNumerator43MCFC` | 4 | 54 |
| `MarkovCycleAssembly43MCFC` | 24 | 0 |
| `MarkovCycleGeFour41MCFC` | 1 | 0 |
| `MarkovCycleGeFour43MCFC` | 1 | 0 |
| `MarkovFourthAllCyclesMCFC` | 1 | 0 |
| `MarkovResidualFifthMCFC` | 1 | 1 |
| Total | 32 | 55 |

These six targets occur in **two successful union invocations**: a singleton and the final five-module union. No direct replay is recorded. The final source of `MarkovResidualFifthMCFC`, including the root equivalence, has a successful build and explicit selected replay. That does not prove its residual or close Conjecture 6.3.

The final five-module union imports **51 new mathematical modules**, including independently replayed SmallNumerator43 and **50 compiled modules with no successful replay**. Those 50 contain 368 theorems and 419 definitions. The final union checks its selected declarations over this imported compiled boundary; it does not replay the 50-module dependency closure. Of all 52 compiled-only modules, only `MarkovCycleShort41N0MCFC` and `MarkovCycleShort41N1MCFC` are outside the final union's source import base. The full 52-module partition is retained in the evidence's `replay_coverage.compiled_only` and reconstructed module records.

## Builds, failed versions and drafts

There are **74 observed validation invocations**: 69 builds, four receipted unions and one interrupted union without a receipt. These partition into 63 successful and 11 unsuccessful/interrupted invocations:

| Invocation class | Success | Error | Timeout | SIGINT/interruption |
|---|---:|---:|---:|---:|
| 69 builds | 61 | 4 | 2 | 2 |
| Five union invocations | 2 | 1 | 1 | 1 without receipt |

The 61 successful builds are **58 mathematical modules plus three Audits**, each matching final source bytes. All 69 immutable build snapshots match their receipt hashes, and all 73 completed receipt outputs bind to controller event output or its documented wrapper summary. Every successful selected target's matching build precedes its union under receipt-stamp estimates. No selected-source/build/object mismatch was found.

The four compiler errors are two superseded `MarkovCycleAssembly21MCFC` versions, one superseded `MarkovSmallNumerator21MCFC` version and one superseded `MarkovTwoValuesMCFC` version. The two build timeouts are `MarkovCycleShort41MCFC` and `MarkovCycleShort43MCFC`; both attempt snapshots differ from their final unbuilt drafts. The two build SIGINT receipts are `MarkovCycleShort41N2MCFC` and `MarkovCycleShort41N3MCFC`, return code -2; these snapshots equal final source bytes and have no later successful build/object. Their outer batch command ends with exit code 130 at event 265. The batch interruption is not an additional proof invocation beyond those two recorded builds.

There are **74 final mathematical source files**: 58 built and **16 unbuilt drafts**. The unbuilt set consists of Complete41/43, Short41/43, Short41N2–N6, and Short43N0–N6. Four Audit sources are archived: Checkpoint, Interim and Final compiled; Root has no build/object. `MarkovAuditRootMCFC`'s intended names are covered by the successful Final Audit. The new operational `ReplayWideMCFC` driver is separate from all these mathematical counts. Thus 78 mathematical/Audit final sources plus one driver and 69 build snapshots account for the archive's 148 Lean files; there are 61 objects.

The separate method audit confirms that none of the 16 unbuilt mathematical drafts enters a checked replay base. Six declaration names are duplicated only between unbuilt N4/N5/N6 drafts and built ShortTail sources; there is no duplicate among the 58 built modules or within the successful bases. No unbuilt draft or partial failed replay is promoted into accepted replay coverage.

## Replay failure, larger-stack retry and interruption

The retained union sequence is:

1. The original 33-module Checkpoint union fails after 143.280970 seconds with deep recursion while replaying `MathGKM.Markov.small_numerator_expand43MCFC`.
2. A Wide-driver singleton of `MarkovSmallNumerator43MCFC` succeeds after 69.502807 seconds, selecting the same source hash.
3. The same 33-module source/hash map is retried with the Wide driver and times out after 300.198417 seconds. There is no successful partial coverage credited to it.
4. The final five-module Wide union succeeds after 17.070401 seconds.

A separate 20-module Wide invocation starts at event 286 and ends at event 308 with exit code 130 and `KeyboardInterrupt`. Its Python wrapper exits before writing a union receipt. The retained `replay-second-inventory.json` binds the intended 20 targets, but is not a successful receipt. No additional current worker 110 union receipt was found beyond the four archived receipts.

The second inventory is exactly Interim's 53-module set minus Checkpoint's 33-module set. Its retained `names` field still contains all 374 Interim names, including 243 names outside the 20 targets. The actual 20 selected sources contain **131 theorems and 76 definitions**. The wrapper reads only the `modules` keys, so the overinclusive name list does not expand the replay scope or provide validation.

The larger-stack retry changes the operational driver while preserving the original replay body. New `ReplayWideMCFC` has SHA256 `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`. The static diff is exactly the original batch source with `main` renamed `replayBatchMCFC`, followed by a new `main` using `IO.asTask`, `t.get` and `IO.ofExcept` to join and propagate the result. Module discovery, target exclusion, constant collection, imported environment construction, `env.replay` and the success print remain unchanged. The Python command adds `-s 131072` and the new driver. No bypass or weakened acceptance branch appears in this source diff. This is static method verification, not a dynamic test of task behavior or invocation-time binary identity.

The original `ReplayBatch07F1` and `ReplayKnown6d2c` remain unchanged at hashes `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` and `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The original failed receipt carries the old batch hash; the subsequent three receipts carry the Wide hash. The stale copied `current` inventory branch is uninvoked; observed calls use explicit targets or a named inventory.

## Printed closure coverage

Checkpoint, Interim and Final Audit outputs print exactly **243, 374 and 402 names**, respectively: **1,019 printed rows and 402 distinct closures**. Every requested name matches its successful Audit source and inventory. The final 402-name inventory exactly equals the named theorems in the 58 final-source-matching mathematical builds; there are no missing or extra names.

The first 374 distinct names report `[propext, Classical.choice, Quot.sound]`; the final five-module union's 28 names report `[propext, Quot.sound]`. All printed axiom sets are permitted. This verifies named theorem closure output, separately from the 474 definitions and from successful selected replay. A successful Audit import does not supply missing replay coverage.

## Stale finalization and artifact hashes

The sole finalizer invocation, events **261–262**, succeeds at an earlier checkpoint. Its retained summary is **45 compiled modules, 243 printed closures, zero replayed modules, 25 pending candidates, 12 unaudited modules, seven rejected attempts and two timeouts**. It indexes 265 artifacts. Those records are historical snapshots, not the final worker inventory.

The stronger 58-built/402-printed/six-selected-replayed inventory in this audit is reconstructed solely from final-source-matching archived receipts, objects, source inventories and printed output. No finalizer was rerun, and no project inventory was repaired. The old 45 source/object claims still match final bytes. Thirteen mathematical modules subsequently complete; nine were on the old pending list, while Tail41/43 and GeFour41/43 were added afterward. Sixteen mathematical drafts remain unbuilt. The old seven rejected attempts omit the later two SIGINT builds and 33-module timeout; there are ten unsuccessful receipted invocations plus the separate receiptless interrupted union.

All **328 controller-recorded artifacts** match archived and current bytes. The stale index has **259 matching entries and six outdated hashes**:

- `evidence/markov-cfcbaf30/capabilities.json`;
- `research/markov-cfcbaf30-checkpoint.md`;
- `research/markov-cfcbaf30-mathematics.md`;
- `research/markov-cfcbaf30-correspondence.md`;
- `research/MarkovResidualFifthMCFC.lean`;
- `research/MarkovFourthAllCyclesMCFC.lean`.

The two mathematical source mismatches are between the old index and later final sources. Their successful build snapshots and replay selections match the final archived/current source hashes. They are not mismatches between accepted builds and final source. **63 controller artifacts are absent from the old index**, including later builds/Audits/replays, the Wide driver and closing records. There is no unrecorded archived file, extra current worker 110 file, or file in its empty work directory. The closing narrative's statement that missing replay coverage is “explicitly listed in validation.json” points to the stale 45-module file, not the final 52-module compiled-only list reconstructed here.

All **2,093 initial/preservation inputs** remain unchanged. All **153 worker 109 reconciliation artifacts** bind to worker 109's archive/controller, worker 110's before-map and current bytes. Of the initial entries, 2,087 also appear in before110 and agree; six administrative files absent from that snapshot retain matching initial/preservation/current hashes. The pinned root and raw/canonical contract hashes match; no contract-serialization failure is recorded in worker 110.

Worker 107's old late 22-target receipt remains outside worker 110's initial/preservation list and artifact archive, while before110/current/the earlier separately retained snapshot all bind to hash `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`. No worker 110 selection replays those targets. This does not alter worker 107's historical cutoff.

## Deadline, closing records and controller timeout

All times below are UTC on 2026-10-15. Build returns use attempt stamps plus duration; event lines themselves lack wall-clock timestamps. Current-file mtimes describe retained final-file boundaries; later archive-copy times describe preservation.

| Retained boundary | Time / status |
|---|---|
| Controller start | 21:58:27.443919Z |
| Original failed 33-module union | 22:18:49.015325Z |
| Stale validation file mtime | 22:21:11.594765Z |
| Stale artifact index / final-check mtimes | 22:21:25.131255Z / 22:21:25.131750Z |
| Successful singleton receipt | 22:21:32.706999Z |
| Wide 33-module timeout receipt | 22:27:15.053960Z |
| Successful final five-module receipt | 22:27:44.689047Z; event 306 |
| Final Audit return estimate | 22:27:45.911581Z; event 307 |
| Last activity record | 22:28:26.526149Z; through event 307 |
| Nominal 1,800-second deadline | 22:28:27.443919Z |
| `replay-interruption.json` mtime | 22:28:27.471676Z; 27.757 ms after deadline |
| Final mathematics-note mtime | 22:28:27.472450Z; 28.530 ms after deadline |
| Complete event-log mtime | 22:28:27.499279Z; 55.360 ms after deadline |
| Controller finish | 22:28:55.059742Z; timeout, elapsed 1,827.6158227920532 seconds |

Every retained build and union receipt predates the nominal deadline. The two closing operational/documentation writes are slightly late; both are included in the controller archive and match current bytes. Their exact bytes and timing are separately preserved in [late-boundary evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000110_late_evidence/preservation.json). They do not provide any new successful proof receipt or upgrade a failed/interrupted selection. No additional late proof receipt was observed.

The last activity record accounts for **640,693 of 644,921 event bytes**, exactly through line 307. The remaining **4,228 bytes** are events 308–310: the interrupted replay completion and the start/completion of the closing-record command. No started command is unmatched in the complete event log. The closing record asserts that foreground executions ended; this audit does not separately inspect operating-system process state or infer missing replay success.

The controller records `outcome:timeout`, `returncode:0`, `report:null` and `mathematical_resolution:false`. There is no `final.json` or `turn.completed`. The controller finishes 27.615823 seconds beyond the nominal budget. No final agent report or complete finalization is supplied by the controller's zero process return code. Retained earlier successful builds, closure prints and two selected replay passes remain distinguishable from the missing full replay coverage.

## Trust limits and supporting evidence

The [method audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000110_replay_method.md) resolves 1,426 source nodes. Successful, failed and planned target sets have transitively target-free source bases, no explicit selected/base collision, no unresolved local source and no source cycle. The final-five base has 1,399 local nodes. These checks do not reconstruct binary import headers, generated/private constants or actual loaded object identity. Final hashes identify retained objects, not per-invocation measurements of the binaries loaded.

Inherited compiled imports **and this round's 50 imported modules without successful replay** remain trusted in the final selected pass. Alternate selected replay, ordinary compilation, named closure printing, official checker verification and a fresh whole-source rebuild are separate claims. Neither official checker verification nor a fresh whole-source rebuild is established. No missing validation was dynamically reconstructed and no conjecture completion is claimed.

[Validation evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000110_validation_evidence.json) records all artifact bindings, source versions, receipts/events, reconstructed and stale inventories, closure sets, pending/late distinctions and preservation checks. [Method evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000110_replay_method_evidence.json) records the source graph, trust partitions and unchanged replay-body comparison.

Read-only input stability at 2026-10-15T22:35:17.972101Z: **2,921 hashed inputs, zero changes**. The six stale index entries are explicitly retained as mismatches; all final source/build/object bindings, archived/current/controller bindings and preservation checks agree.

Validation evidence SHA256: `4a4b5c1f8fab7b25ace55f1ef7194b0f1650deba464da7365add589f5a5798aa`. Method note SHA256: `ff29ee3e7ae9c1b89d4e14a1070568bf50a235ea4a3c71f1bf068984203532d1`; method evidence SHA256: `a568550f8283d497e5bc8700aa9c669ba7e6396dfefd38dea4855adf84fdc46b`.
