# Worker 000112 retained validation audit

Request `5110b3fac1864ad1b18b3138b0f468e8`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000112`. This is a read-only, archive-first inspection following the completed worker 111 validation and replay-method procedure. Only completed worker 112 records, named inherited inputs and their current counterparts were read. No successor was inspected, proposer contacted, project file edited, or Lean, checker, replay, experiment or finalizer executed. Auditor writes are confined to `/private/tmp/math_gkm_godel_20261013`.

The retained evidence supports **21 final mathematical modules, all explicitly selected in successful replay, 68 distinct printed theorem closures and 27 definitions**. There are no compiled-only accepted mathematical modules, unbuilt final mathematical candidates, pending replay invocations or missing final named closures. This establishes the stated validation inventory over inherited compiled imports. It does not establish the full pinned Conjecture 6.3, which the worker leaves unresolved with `completion: null`.

## Artifact and preservation bindings

All **185 controller-recorded changed artifacts** match their archived and current SHA-256 bytes. The final artifact-verification file is a direct map of **183 paths**, all matching archive, current and controller hashes. Its two exclusions are the index itself and `last-verification.json`; both are independently bound by the controller/archive/current comparison. The artifact set contains 72 Lean files (24 final sources and 48 immutable build-attempt snapshots), 24 objects, 70 JSON files, 13 Python files, five Markdown files and one text file. No unrecorded archived artifact, extra current worker-specific file or missing current artifact was found.

Each of the 21 mathematical records binds its final source, successful build receipt, matching build snapshot, retained object, declaration list and successful selected replay. All 24 final Lean sources, including three Audit sources, have matching successful builds and retained objects. Every attempted build snapshot matches its receipt's selected source hash. All 52 build/replay receipts have corresponding controller output summaries matching their fields and the recorded `stdout[-2500:]` tail. Full stdout remains in the archived receipt. All successful selected-target builds finish before their corresponding replay invocation, under the receipt timestamp convention described below.

The initial manifest contains 2,620 entries: **2,619 prior inputs remain unchanged**, while the current request's checkpoint is deliberately excluded from that preservation count. Of the 2,620 entries, 2,617 also appear with equal hashes in `before.json`; the absent paths are `MISSION.md`, `.control/markov/contract.json` and the newly created checkpoint. There is no conflicting before112 hash. The checkpoint is created at controller events 42–43, subsequently updated and finally appended by the last verifier. Its initial hash is `d8d761a8d3a0d5ae789e8ed082b9ca944d3953017024fbde6ec614e3cdaf0c4e`; its final hash is `a9e038ddf39aa19cb0ec016988b2b327b42830b4d3f8e503aa983df947051acb`. These two hashes were computed by this audit from the retained initial manifest and final bytes; worker 112 does not retain a separate own-checkpoint-updates receipt. The final checkpoint is indexed and controller-bound.

Reconciliation of all **138 worker 111 changed artifacts** agrees across the worker 111 controller/archive, worker 112 before snapshot, reconciliation record and current files. Six inherited administrative hashes also match. The predecessor validation hash is `562c0c6d8775b3b7ca30882e60ed066ed704c542ccf8a20a4f86795f8dc2621e`, equal in the recorded linkage, worker 111 archive and current file. These are preservation checks, not fresh worker 112 replay of old modules. Worker 111's recovery of worker 110 coverage and the earlier worker cutoffs retain their original dates and trust boundaries.

Pinned root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Raw contract bytes hash to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted, compact, ASCII JSON hashes to `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request's canonical contract hash. The parsed contract matches the request. Raw-file and canonical-serialization hashes are distinct measurements, not a mismatch requiring a repair.

## Compilation, selection and named closures

There are **48 compiler invocations: 24 successes and 24 return-code-1 rejections**, with zero compiler timeouts. The successes are 21 mathematical sources and three Audits. All four replay invocations succeed, without timeout or interruption, selecting 15, four, one and one mathematical modules. The 21 selections are distinct, so every final mathematical module is selected exactly once. No inherited target is newly selected and no direct ReplayKnown invocation is present.

The selected mathematical inventory is below. Every abbreviated name has prefix `Markov` and suffix `M511`.

| Module | Theorems | Definitions |
|---|---:|---:|
| FourthGeneric | 3 | 1 |
| HorizontalFourthSeed | 0 | 13 |
| HorizontalFourthGood | 0 | 1 |
| H4ChartLow | 1 | 0 |
| H4ChartQuarter | 4 | 0 |
| H4ChartThird | 4 | 0 |
| HorizontalFourthScaled | 3 | 3 |
| H4ChartHigh | 3 | 0 |
| H4ChartHalf | 4 | 0 |
| H4ChartTwothirds | 4 | 0 |
| HorizontalFourthMomentSeed | 1 | 0 |
| EightLC | 2 | 1 |
| HorizontalFourthBounds | 7 | 0 |
| HorizontalFourthSource | 3 | 1 |
| HorizontalFourthLC | 2 | 0 |
| HorizontalRescale | 4 | 3 |
| ResidualHorizontal | 1 | 2 |
| HorizontalResidual | 6 | 1 |
| HorizontalAllOrder | 3 | 0 |
| HorizontalPositive | 6 | 1 |
| HorizontalResidualPositive | 7 | 0 |
| **Total** | **68** | **27** |

Seed and Good are definition-only selected targets. Their empty theorem lists make the named-axiom-complete flag vacuous; their 14 definitions are not additional printed theorem closures. Compilation, selected replay and axiom printing are separate checks.

The Fourth, Uniform and Final Audit inventories contain 15/19/21 mathematical modules and request exactly 41/55/68 theorem names. Their successful outputs supply **164 printed rows but only 68 distinct closures**. The final Audit alone covers all 68 final theorem declarations, with no missing or extra name. Each inventory's source-hash map and name set agree with the accepted source set and Audit source; the receipts agree with `validation.json`. Of the 68 distinct closures, 65 report `[propext, Classical.choice, Quot.sound]`, two report `[propext, Quot.sound]`, and one reports `[propext]`. No extra named axiom appears.

The 24 rejected receipts exactly equal the final-check rejection list. **Twenty-three rejected snapshots differ from the final source bytes. One does not:** `build-1792105636443628000.json` rejects `MarkovHorizontalFourthMomentSeedM511` because the `MarkovHorizontalFourthScaledM511` dependency object is unavailable. Those same MomentSeed bytes later compile successfully. It would therefore be inaccurate to describe every rejection as a superseded source version. There are no timeout cases to classify.

One superseded `MarkovResidualHorizontalM511` snapshot imports the old unavailable `MarkovHorizontalTwo05ef` draft and fails. The final source instead imports `MarkovSecondHorizontal8934`. The method audit resolves this and its four related inherited Second* sources to worker 12 archived bytes at the exact before112 hashes. The rejected old draft is absent from every successful target/base set; it is not promoted through the final root reduction.

## Replay method and imported trust

The validator is identical to worker 111's archived validator after request-tag substitution. All four replay commands use inherited `ReplayWideMCFC` with stack argument `-s 131072`. Driver hash `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2` agrees with the inherited archive/before/preservation bindings; there is no new stack, scheduler or acceptance-path change. The previously audited Wide implementation retains the original batch body in a joined task with result propagation. Batch and Known driver hashes also remain unchanged. Individual replay receipts do **not** contain a driver-hash field, so this audit does not claim invocation-time driver measurement.

The delegated static method audit resolves 1,443 local source nodes: 24 new sources, 1,414 inherited graph nodes admitted at matching before112 hashes, and five additional archived worker 12 sources. The four target-free imported source bases have 134, 1,434, 49 and 51 local nodes, with direct imports including Init of seven, six, two and three. It finds no unresolved local source, cycle, selected/base explicit declaration-name collision or target in the transitive imported base. Every new mathematical dependency imported by a later union has already completed its own selected replay before that union starts. There is consequently no this-round compiled-but-unreplayed import boundary.

These are source-graph and retained-record checks. Imported binary module headers, generated/private constants and actual invocation-time loaded objects were not reconstructed. Inherited compiled imports remain trusted. The inherited Lean.Replay qualifications remain: duplicate map keys can overwrite, matching already-imported theorems may bypass proof-body replay, and unsafe/partial declarations may be skipped or axioms admitted. Source/name checks find no relevant selected/base collision here, conditional on compiled imports corresponding to source. The validator itself does not require a successful build receipt or enforce an axiom policy before replay; the separate observed source/build/object and print bindings provide those inventory checks. No official checker result, fresh whole-source rebuild or independent mathematical completion audit is established.

## Finalization and cutoff

Receipt filenames encode invocation **start**, not completion. The following return times are estimates obtained by adding recorded duration to that start stamp; they are corroborated by successful controller returns and receipt mtimes.

| Event | Estimated return, UTC on 2026-10-15 |
|---|---|
| First 15-module replay | 23:14:02.784971 |
| Four-module replay | 23:25:14.553908 |
| HorizontalPositive replay | 23:26:56.374007 |
| HorizontalResidualPositive replay | 23:28:41.059108 |
| Final 68-name Audit | 23:28:44.247587 |

The four direct finalizer invocations all return code zero. Event 300 reports 19 replayed modules, 41 closures, two pending sources and four unaudited modules; event 318 reports 20 replayed modules, 55 closures, one pending source and one unaudited module. Events 332 and 334 both report the complete 21/21/68 inventory, with no pending, unaudited or unreplayed module. These earlier successful but incomplete summaries are historical states, not failed finalizers. Events 320–321 only read the finalizer source and are not another execution.

The final verification script is created at events 335–336 and runs successfully at events 337–338. Its source appends the final checkpoint, calls the finalizer through `subprocess.run(..., check=True)` with stdout suppressed, reads the regenerated index, verifies all 183 hashes, asserts the complete counts and writes `last-verification.json`. Thus one additional **nested finalizer** is supported by script source plus successful verifier return; it has no separate controller event or captured finalizer stdout. Its output exactly matches the last-verification record. The nested reindex includes the script and final checkpoint bytes.

The checkpoint reports failed shell heredoc attempts because temporary files could not be created. Retained controller events show no failed finalizer or failed last-verifier invocation; the successful file-backed last verifier is the recorded final verification. The stderr's documentation-patch expected-line mismatch at 23:26:21.369182Z is also separate from compiler/replay/finalizer outcomes. Capability availability and finite experiments are not proof evidence.

Final project mtimes are validation 23:29:17.246535Z, final-check 23:29:17.303211Z, artifact index 23:29:17.386736Z and last-verification **23:29:17.471951Z**. The last-verification file intentionally follows the index. No unaccounted post-finalization project file or extra receipt was found.

Controller start is **22:59:50.741173Z** and the nominal 1,800-second deadline is **23:29:50.741173Z**. Controller finish is **23:29:49.583573Z**, elapsed **1,798.842400 seconds**, or **1.157600 seconds before deadline**, with completed outcome and return code zero. The event log ends with the parsed final report at event 339 and `turn.completed` at event 340. Final report bytes equal both the event report and controller receipt report; `final.json` mtime is **23:29:29.655364Z**, 21.085809 seconds before deadline. The controller receipt mtime is 23:29:49.583847Z. All retained project artifact mtimes precede both finish and deadline.

There are 340 retained events and no unmatched started execution. Activity accounts for 690,894 event-log bytes plus 252 stderr bytes, exactly 691,146 bytes. No late worker 112 receipt or artifact was observed, so no separate late-evidence snapshot was needed. Current files are only used to check retained bytes and timing; this audit does not retroactively upgrade an earlier worker's cutoff or late evidence.

## Audit outputs and limits

The machine-readable validation evidence contains every artifact/index comparison, source/build/object/replay binding, rejected snapshot classification, named closure, preservation entry, predecessor reconciliation, controller event linkage and timing calculation. Final stability at 2026-10-15 23:35:50.717955Z found **zero changes across 3,269 hashed inputs**; the final scoped path check found no extra or missing worker 112 file. The method audit separately found zero changes across 141 inputs. No missing check was completed by this audit.

Mathematical meaning and finite-domain counts are handled in the separate monitoring audit. In particular, an exact root equivalence with an unproved residual and nonnegative coefficient factorizations do not establish general residual log-concavity or the full root theorem. This report confirms retained validation/provenance for the accepted partial inventory only.

Supporting files and SHA-256:

- `markov_worker_000112_validation_evidence.json`: `593a42cd794e5f784b69b2786043b52f3a4937f2e5c3160f1a21ac23aa06ad1d`
- `markov_worker_000112_replay_method.md`: `c7cf9825e08b194c694064b6193cf1af8c4994feb3286b88afc2b26aeb260140`
- `markov_worker_000112_replay_method_evidence.json`: `51ae1436315651db7c127c7f7e0b157afbc798b999d228362326f705f3019958`
