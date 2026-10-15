# Worker 000109 retained validation audit

Request `0a5fcabe0a82461493719b3bbf93f60a`. Archive-first, read-only audit of completed worker 109, its retained receipts/events, predecessor bindings and matching current bytes. No Lean, checker, replay, experiment, finalizer, project import or missing check was executed. No project/collatz edits, proposer contact or successor inspection occurred. Audit files are confined to `/private/tmp/math_gkm_godel_20261013`. Mathematical scope is assessed separately in the [main audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000109_monitoring_audit.md).

## Result and exact scope

All **17 accepted new mathematical modules**, containing **53 named theorem declarations and 12 definitions**, have successful builds matching their final archived/current source bytes, matching retained object hashes, and explicit successful alternate replay selections. There is no accepted-source/build/object/replay mismatch. Ten successful union invocations select each of these 17 modules exactly once; there are no failed unions or direct-replay invocations.

The accepted numeric residual is now `MarkovResidualSmallGapM0A5`, including `root_iff_coreSmallGapM0A5`, with a successful matching build and replay. This does not retroactively accept worker 108's differently named timed-out draft. The final accepted residual `MarkovResidualAllCyclesM0A5` and corrected numerator/initial-interval adapters are included. Neither an equivalence nor a finite experiment closes the residual; `completion:null` and `mathematical_resolution:false` remain explicit.

| Archived new source class | Modules | Named theorems | Definitions | Retained validation |
|---|---:|---:|---:|---|
| Accepted mathematical modules | 17 | 53 | 12 | Matching build, object, selected replay and named axiom coverage |
| Redundant `MarkovFourCycleLocalM0A5` | 1 | 3 duplicate names | 0 | Successful build/object; excluded from accepted inventory and replay |
| Axiom-print Audit modules | 2 | 0 | 0 | Both eventually compiled; neither is a replay target |
| Total new final Lean sources | 20 | 56 declaration occurrences | 12 | 20 retained objects |

`MarkovFourCycleLocalM0A5` duplicates the first three theorem declarations of `MarkovFourCycleM0A5`. The separate static method audit confirms that it is absent from every successful imported base. Its successful compilation is retained but contributes no extra accepted theorem or replay coverage. No definition-only/import-only accepted target or unbuilt unique new mathematical draft remains.

## Attempts, versions and printed closures

There are **48 completed validation invocations**: 38 ordinary builds and ten successful unions. The builds partition as **20 successes = 17 accepted math + one redundant math + two Audits**, **13 compiler errors**, and **five wall-clock timeouts**. Thus the reported **18 rejected compiler attempts** are exact. Every build snapshot matches its receipt source hash, and all 48 receipt outputs bind to the retained controller event output or the wrapper's documented output summary. No skipped invocation or unmatched started command occurs. Every accepted target's successful matching build precedes its corresponding union under receipt-stamp timing.

The failures must not all be described as superseded source versions:

- Twelve of the 13 compiler-error snapshots differ from final accepted sources. The remaining error is the unchanged inherited `MarkovFourthSourceK0B`: its import fails because `MarkovFourthBoundaryK0B.olean` is absent from the search path.
- The `MarkovFourCycleM0A5` and `MarkovAllCycleValueM0A5` wall-clock timeout snapshots differ from their later accepted sources.
- The `MarkovSecondNormM0A5` and `MarkovAuditCheckpointM0A5` timeout snapshots exactly match the final sources; both later compile successfully with those bytes.
- The fifth timeout is unchanged inherited `MarkovFourthShiftK0B`, with no successful worker 109 rebuild/replay or worker 109 object.

The two inherited attempted sources match worker 109's before-map and worker 91's archived bytes, as independently checked in the method audit. **Neither inherited failed target is in any successful worker 109 source import base.** The accepted initial-interval proof uses the inherited `Truncate` boundary, not these unsuccessful rebuilds. This is a specific failed-rebuild boundary, not an accepted-source mismatch or evidence of a fresh inherited-source rebuild.

The two successful Audit outputs print **39 and 53 rows**, exactly matching their sources and retained inventories. Their union is **53 distinct closures**, with **92 printed rows** total. The final Audit covers precisely every named theorem in the 17 accepted modules; there is no missing or extra closure. All 53 report exactly `[propext, Classical.choice, Quot.sound]`. These are named theorem closure records, separate from replay selection and from the 12 definitions. The redundant Local source's three names are printed through the accepted FourCycle module, not through an additional Local replay.

## Hash, preservation and prior-worker bindings

All **153 controller-recorded artifacts** equal archived and current bytes. Every one of the **150 final artifact-index entries** also matches its controller hash. The three controller artifacts outside that index are exactly `artifact-verification.json`, `final-check.json`, and the subsequently created `last-verification.json`. There is no unrecorded archived file, extra current worker 109 file or file under the empty worker-specific work directory. Source hashes, immutable attempt snapshots, declarations, Audit inventories, selected object claims and replay source maps all agree.

All **1,940 initial/preservation entries** remain unchanged, and all **344 worker 108 reconciliation entries** bind to worker 108's controller/archive, worker 109's before-map, and matching current bytes. Of the initial entries, 1,934 are present in worker 109's before-map and all agree; the six absent administrative entries are `.control/markov/contract.json`, `MISSION.md`, `RESUME.json`, `lake-manifest.json`, `lakefile.toml`, and `lean-toolchain`. Their retained initial/preservation hashes match current bytes. There is no initial/before mismatch.

Reconciliation does not create new predecessor replays. The old worker 107 late 22-target receipt remains separately bound by worker 109's before-map and the earlier preserved temporary snapshot at SHA256 `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`. It remains outside worker 109's 1,940-entry initial list and artifact archive, and none of its 22 targets is newly selected in worker 109. Its historical worker 107 deadline classification is unchanged.

The pinned root remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. `ReplayBatch07F1` and `ReplayKnown6d2c` retain before hashes `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` and `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Final retained object hashes identify retained output bytes, not an independent measurement of every object loaded during an invocation.

## Contract serialization correction

The ad-hoc final integrity check at event **255** exited 1 because it compared the raw contract-file SHA256 with the request's canonical JSON identifier. This is a separately retained operational failure, **not one of the 18 compiler rejections**. Event 257 prints the differing representations; the subsequent verifier uses sorted, compact JSON with ASCII escapes.

The raw contract hash is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; the canonical ASCII JSON hash is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, exactly matching the request. Canonical JSON without ASCII escaping would instead hash to `f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4`. The request contract equals the current parsed contract; raw contract bytes match initial preservation. No contract edit occurred. The corrected verifier's successful event **263** output exactly matches retained `last-verification.json`.

Four finalizer invocations succeeded. Event 221 records 13 modules/39 closures with four pending candidates and 130 indexed artifacts. Events 250 and 253 record 17/53, no pending candidates and 149 artifacts. After the verifier script was added, event 261 records the final 17/53, no pending candidates and 150 artifacts. The early pending list is not the final state, and the earlier failed serialization check is not omitted.

## Deadline, final report and pending/late records

All times below are UTC on 2026-10-15. Build-return times use attempt stamps plus recorded duration; event lines have no separate wall-clock timestamp. Retained current-file mtimes provide the final-file boundaries, while archive-copy mtimes are later preservation operations.

| Boundary | Time / retained status |
|---|---|
| Controller start | 21:27:22.934895Z |
| Last selected union, ResidualAllCycles | 21:53:44.797762Z; event 245, return code 0 |
| Final Audit return estimate | 21:53:48.000845Z; event 246, return code 0 |
| Final validation mtime | 21:56:12.306371Z |
| Artifact index mtime | 21:56:21.721309Z |
| Final-check mtime | 21:56:21.721640Z |
| Last-verification mtime, latest project artifact | 21:56:21.951117Z |
| Complete 265-event log mtime | 21:57:12.689856Z; includes final agent report at 264 and `turn.completed` at 265 |
| `final.json` mtime | 21:57:13.673804Z |
| Last activity record | 21:57:13.700459Z; all 608,429 event bytes accounted for |
| Nominal 1,800-second deadline | 21:57:22.934895Z |
| Controller finish | 21:57:42.636956Z; `completed`, return code 0 |

The controller records **elapsed 1,819.7020618915558 seconds**, about **19.702 seconds beyond** the nominal 1,800-second budget. This overrun must be preserved. At the same time, the retained complete event log and final report predate the deadline; `final.json` is approximately **9.261 seconds before** it. The final report JSON agrees with both event 264 and `receipt.report`. Thus a late controller finish is established, not late validation or a late final report. Unlike worker 108, worker 109 retains both `final.json` and `turn.completed`.

No worker 109 project artifact is later than the deadline or controller finish, and no unmatched command, extra current receipt, pending final candidate or unaccounted post-finalization file was found. Empty pending inventory does not mean the conjecture is proved. Capability notes retain unavailable Sage/SymPy, a denied scratch location and a failed heredoc attempt; those operational limitations are not mathematical passes or additional compiler receipts.

## Replay-method limits

The [separate static method audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000109_replay_method.md) resolves 1,358 source nodes and all ten successful import bases. Each successful base is transitively target-free, with no explicit selected/base declaration collision, duplicate selected declaration, unresolved local source or source cycle. The base sizes in receipt order are 1337/113/124/175/194/1347/128/177/201/1352. Every imported new module's successful replay finishes before the dependent invocation under receipt-stamp estimates. The two unsuccessful inherited rebuilds and redundant Local module are excluded from these bases.

The wrapper matches its predecessor after the request-tag substitution. Its unused `current` branch still references a nonexistent worker 109 `MarkovAuditM38E-inventory.json`; all ten observed invocations use explicit target arguments, so no observed success depends on that branch. No repair was made.

This audit does not reconstruct compiled import headers, generated/private constants, or invocation-time loaded object identity. Inherited compiled imports remain trusted. Selected alternate replay, successful compilation, printed named closures, official checker verification and a fresh whole-source rebuild are distinct; the latter two are not established here. The successful retained evidence supports the stated partial result, not exact-root completion.

## Supporting evidence

[Validation evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000109_validation_evidence.json) contains every artifact binding, build/union/event match, version partition, accepted source/object/declaration record, Audit output and inventory, preservation binding, contract check and timing record. [Method evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000109_replay_method_evidence.json) supplies the independent static import analysis.

Read-only input-stability check at 2026-10-15T22:04:35.062253+00:00: **2,612 hashed inputs, zero changes**. All independently recorded mismatch lists are empty. This is a validation/provenance audit, with no mathematical repair or dynamically reconstructed proof check.

Final evidence SHA256: `fd1d8951478c5a5285355501e569e27b8cd80c7ce9982086e7798e4c4548c675`. Method note SHA256: `5016c4688b442d9ae48e405df111606e13703c1f1da8d6ebf285947007111e4d`; method evidence SHA256: `584d49424a597fb86b26c690a28d650afc705e851eab1a12e203b395227ee2ce`.
