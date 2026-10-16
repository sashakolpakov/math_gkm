# Worker 000113 retained validation audit

Request `9e104e0c0bd245b08fe1674f6fdfedec`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000113`. This read-only, archive-first audit follows worker 112's validation and replay-method procedure. It reads completed worker 113 records, named inherited inputs and their current counterparts. No successor is inspected, proposer contacted, project file edited, or Lean, checker, replay, experiment or finalizer executed. Auditor writes are confined to `/private/tmp/math_gkm_godel_20261013`.

Retained records support **20 final mathematical modules, all explicitly selected in successful replay, with 97 distinct printed theorem closures and nine definitions**. There are no compiled-only accepted mathematical modules, unbuilt final mathematical candidates, pending replay invocations or missing final named closures. This is validation of a partial mathematical inventory over inherited compiled imports. The exact-root residual remains unproved and `completion` remains null.

## Artifact and preservation bindings

All **123 controller-recorded changed artifacts** have matching archived and current SHA-256 bytes. The final artifact-verification file directly maps **121 paths**, all agreeing with archive, current and controller hashes. Its exclusions are the index itself and `last-verification.json`; both are independently bound by the controller/archive/current comparison. The set contains 48 Lean files (22 final sources and 26 immutable build-attempt snapshots), 22 retained objects, 40 JSON files, eight Python files and five Markdown files. There is no unrecorded archived artifact, extra current worker-specific file or missing current artifact.

For every mathematical module, final source bytes match the successful build receipt and its immutable attempt snapshot, the validation source hash and the successful selected replay hash. Recorded object hashes match archived/current objects and the controller record. The source theorem lists exactly match the validation declarations. All 22 final sources, including both Audit sources, have successful matching builds and objects. Every build snapshot agrees with its receipt, including rejected attempts. All 28 build/replay receipts bind to corresponding controller JSON summaries, with the expected captured stdout tail; the full output is retained in the receipt. Each successful selected-target build finishes before its replay starts under the receipt timestamp convention.

The initial manifest contains **2,648 entries, all unchanged**. Unlike worker 112, this request's checkpoint is absent from both its initial manifest and `before.json`; there is no checkpoint entry to subtract from 2,648. The checkpoint is created at events 42–43 and updated later, including the final verifier's append. Its final SHA-256 is `559b581986141a8925f1583eee3c69b6e02679d18be060bd3f186cb403c69b08`, bound by the final index and controller. The finalizer's inherited own-checkpoint exclusion is therefore a no-op for this initial manifest. Of its 2,648 entries, 2,646 also appear with identical before113 hashes; the two absent paths are `MISSION.md` and `.control/markov/contract.json`. There is no conflicting before113 value.

All **185 predecessor worker 112 changed artifacts** match the reconciliation record, worker 112 controller/archive, worker 113 before snapshot and current bytes. The six inherited administrative inputs also match. The predecessor validation linkage is `604f5e771002ffb33836379029b192d7a872b9db93a52f402eee582e82423260`, equal in the reconciliation, worker 112 archive and current file. Reconciliation and ordinary import do not constitute new selected replay of old modules. Earlier interrupted-worker cutoffs, later recovery and separately classified late evidence keep their historical boundaries.

Pinned root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Raw contract bytes hash to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted, compact, ASCII JSON hashes to `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request. The parsed request contract equals the retained/current contract. These raw and canonical hashes are different serialization measurements, not a changed contract.

## Compilation, selected replay and printed closures

There are **26 compiler invocations: 22 successful and four rejected with return code one**. The successes are 20 mathematical sources and two Audits. No compiler attempt times out. Both replay invocations succeed without timeout or interruption, explicitly selecting 19 and one mathematical modules. All 20 are distinct selections; every final mathematical module is selected exactly once. No inherited module is newly selected and no direct ReplayKnown invocation occurs.

The inventory is:

| Modules | Count | Theorems | Definitions |
|---|---:|---:|---:|
| Fourteen `MarkovSmallHorizontala_bM9E1` concrete-source modules | 14 | 70 | 0 |
| `MarkovHorizontalFourthTwoM9E1` | 1 | 4 | 0 |
| `MarkovSmallHorizontalM9E1` | 1 | 1 | 0 |
| `MarkovHorizontalFourAllM9E1` | 1 | 4 | 0 |
| `MarkovVerticalRescaleM9E1` | 1 | 7 | 7 |
| `MarkovVerticalAllOrderM9E1` | 1 | 10 | 1 |
| `MarkovResidualM9E1` | 1 | 1 | 1 |
| **Total** | **20** | **97** | **9** |

The fourteen concrete suffix pairs are `2_3`, `2_5`, `2_7`, `3_4`, `3_5`, `3_7`, `3_8`, `4_5`, `4_7`, `5_6`, `5_7`, `5_8`, `6_7` and `7_8`, with five named theorems each. Every selected mathematical module has at least one theorem; there are no definition-only or import-only accepted targets. Definitions remain separate from the named theorem-closure count.

The First Audit inventory contains 19 modules and 96 names; the Final Audit contains 20 modules and 97 names. Their source-hash maps and successful build-receipt pointers agree with the accepted source records. Their name sets exactly match the corresponding source theorem declarations, Audit `#print axioms` requests and successful compiler output. The two outputs contain **193 printed rows but only 97 distinct closures**. The final Audit alone covers all final theorems. Of those distinct closures, 94 use `[propext, Classical.choice, Quot.sound]` and three use `[propext]`. No missing name, extra name or additional named axiom was found, and the union equals `validation.json`.

All four rejected snapshots differ from their final accepted source bytes. They are precisely the final-check rejection list:

- `build-1792107256740180000.json`: first HorizontalFourthTwo version; failed cast/rewrite steps.
- `build-1792107308729221000.json`: SmallHorizontal2_3 version; unsolved goals amid compiler warnings.
- `build-1792107320846606000.json`: second HorizontalFourthTwo version; failed definitional `change` step.
- `build-1792107767241571000.json`: Residual version; invalid conjunction-constructor notation when the expected type was a function.

All three affected final modules subsequently have source-matching successful builds and selected replay. There is no same-final-source rejection, timeout receipt, failed replay, or pending mathematical draft to reinterpret. Compiler warnings in rejected or successful output are not additional accepted proofs.

## Replay method and imported trust

The validator, Audit generator and finalizer exactly match their worker 112 archived counterparts after request-tag and module-suffix substitution. Both replay commands invoke inherited `ReplayWideMCFC` with `-s 131072`. Wide remains SHA-256 `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`; its archive, before113 and preservation bindings agree. There is no new driver, stack change, scheduler or alternative acceptance path. The previously audited joined-task implementation propagates the result without changing the original batch replay body. Batch and Known drivers also retain their prior hashes and are not invoked directly here.

The delegated method audit resolves 1,462 local source nodes: 22 new sources and 1,440 inherited nodes from worker 112's parsed graph admitted only at matching before113 source hashes. No additional old source resolution is needed. The first and second replay imported bases contain 162 and 1,452 local source nodes; direct source roots after target exclusion, plus implicit Init, match the reported inherited-import counts of nine and four. Both bases are transitively target-free, with no unresolved local source, source cycle, explicit selected/base declaration-name collision or duplicate selected declaration. Old failed and pending drafts remain outside the successful bases.

Residual's imported base includes 17 new modules, all selected in the first union, whose replay returns at approximately 23:43:20.845092Z. Its own replay starts at 23:46:32.363733Z. The two new vertical modules are selected successfully in the first union but are outside Residual's imported base. Thus every new mathematical dependency imported by the final replay already has its own successful selected replay; there is no this-round compiled-but-unreplayed imported boundary. Mathlib and inherited compiled modules remain external trusted boundaries, and no old module is newly replayed by worker 113.

The static import/source boundary is conditional on binary imports corresponding to resolved source. This audit does not reconstruct binary module headers, generated/private constants or actual invocation-time loaded object bytes. Inherited compiled imports remain trusted. The established Lean.Replay limitations persist: duplicate constant-map keys can overwrite, matching already-imported theorems may bypass proof-body replay, and unsafe/partial declarations can be skipped or axioms admitted. The source/name checks address selected/base contamination for these observed targets; they do not turn this into a whole-source rebuild or an official checker result.

The validator records selected source hashes before invocation, immutable build snapshots, command arrays and captured output. It does not require a successful build receipt or enforce a named-axiom policy before replay; the independent retained bindings and print inventory in this audit supply those checks for the observed final targets. Individual replay receipts do not record driver hashes, so unchanged inherited driver-source binding is not claimed as an invocation-time driver or binary measurement.

## Finalization and time boundary

Receipt filenames stamp invocation **start**, not return. The return estimates below add each retained duration to its start stamp; successful controller returns and receipt mtimes corroborate the sequence.

| Event | Estimated return, UTC on 2026-10-15 |
|---|---|
| First 19-module union replay | 23:43:20.845092 |
| First 96-name Audit | 23:44:19.634963 |
| Successful final Residual build | 23:44:20.825772 |
| Residual selected replay | 23:47:07.130159 |
| Final 97-name Audit | 23:47:10.204822 |

The first Audit correctly omits the still-building Residual target; the final Audit covers it. The first union also explicitly excludes Residual. Its subsequent successful build, selected replay and final print receipt complete coverage in worker 113's own retained history.

One direct finalizer invocation, events 179–180, returns zero with the complete 20/20/97 inventory and no pending, unaudited or unreplayed module. Earlier events 137–138 create the finalizer by copying and retagging its predecessor; they are not another execution. The last verifier is created at events 183–184 and succeeds at events 185–186. It appends the final checkpoint, invokes the finalizer with `check=True` and stdout suppressed, checks all 121 regenerated index hashes, asserts 20 replayed modules/97 closures and empty pending/unaudited/unreplayed lists, then writes `last-verification.json`. The retained source plus successful return supports one additional **nested finalizer**, without a separate controller event or captured finalizer stdout. Last-verifier output exactly matches its retained record. The script records the stop-file presence as false; this audit does not inspect a current successor's stop state.

Final project mtimes are validation **23:50:29.333288Z**, final-check **23:50:29.692333Z**, artifact index **23:50:29.722543Z** and last-verification **23:50:29.746427Z**. The last-verification file intentionally follows the index. All controller-bound worker 113 artifacts precede both finish and deadline. No unaccounted post-finalization file or extra receipt was found.

Controller start is **2026-10-15 23:30:16.278956Z**; its nominal 1,800-second deadline is **2026-10-16 00:00:16.278956Z**. Finish is **2026-10-15 23:51:23.335580Z**, elapsed **1,267.056624 seconds**, or **532.943376 seconds before deadline**, with completed outcome and return code zero. The final report is event 187 followed by `turn.completed` at event 188. Parsed report contents agree between the event, `final.json` and controller receipt. `final.json` mtime is **23:50:54.818240Z**, 561.460716 seconds before deadline; SHA-256 is `0728ba443a8eb8bc90d09c4020039d070657f3a0c135c9475b6e8685be76e6b5`. The controller receipt mtime is 23:51:23.336141Z.

There are 188 retained events, including 88 starts and 97 completed items, with no unmatched started execution. Activity accounts for exactly 623,749 event-log bytes and zero stderr bytes. The noncompiler nonzero commands are an initial file search with no match and a failed optional SymPy import. The setup capability note also reports the initial shell-heredoc temporary-file limitation. These operational/capability observations are separate from the four compiler rejections and successful finalization; none is mathematical proof evidence.

No late worker 113 file or receipt was observed, so no separate late-evidence snapshot was needed. Current counterparts check retained bytes and timing; they do not retrospectively upgrade another worker's cutoff. The symbolic second-vertical candidate is retained experimental material, with no new accepted Lean source or selected theorem for its universal bridge. An empty pending-source inventory does not claim that this candidate or the root residual is proved.

## Supporting evidence

The JSON evidence records every artifact/index comparison, source/build/object/replay binding, rejected version, print inventory, preservation entry, reconciliation and controller linkage, plus timing and stability checks. Mathematical scope and finite-domain counts are handled in the separate monitoring audit. No missing check was completed dynamically by this audit.

Final input stability at 2026-10-16T00:05:00.510310+00:00 found zero changes across **3,257 hashed inputs**. The final scoped path check found no extra or missing worker 113 file. The method audit separately found 115 stable inputs.

Supporting files and SHA-256:

- `markov_worker_000113_validation_evidence.json`: `4953d4e8035e8641baff8fd0002b3e18163c618e568d25b653744be017f64419`
- `markov_worker_000113_replay_method.md`: `0add157c13c849469b023283f2673d6a70bfa15567b34c5f3cdd1cec2bfcf5ce`
- `markov_worker_000113_replay_method_evidence.json`: `58c6042a269c59317109762d7339323d2d013b0dd6eaa6a36fb301a5e53acdd1`
