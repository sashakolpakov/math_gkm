# Worker 000105 retained validation audit

Request `2532cf404bcc4c2ab8a1684e4f887eb2`, controller `/Users/sasha/math_gkm/.control/markov/workers/000105`. Static inspection of archived sources, receipts, events and hashes only. No project code, Lean/checker/replay, experiment, finalizer or missing check was executed, and no project file was changed. Mathematical scope and finite domains are reviewed separately by the parent audit.

## Final supported scope

All **56 new mathematical modules** have matching successful final-source builds and successful alternate kernel union replay. They contain **1,200 named theorem declarations and 950 definitions**. Three modules (`MarkovOnsetLowDefsM253`, `MarkovOnsetHighDefsM253`, `MarkovOnsetTopDefsM253`) contain only definitions. No inherited module is an explicit replay target, and no recovery replay is claimed. Four Audit modules compiled successfully but are not replay targets. The 60 archived new Lean sources are exactly these 56 mathematical sources plus four Audits; there is no excluded new source or accepted mathematical source left compiled-only.

All **304 controller artifacts** match archived and current bytes. All **301 artifact-index entries** match their expected hash, archive, current bytes and controller hash. The three controller artifacts outside the index are `artifact-verification.json`, `final-check.json`, and `last-verification.json`. The last is the expected output of the subsequent final verifier; it is archived and controller-bound, not an unarchived late check. There are no current extra files or pending command items within this worker scope.

Every accepted build receipt matches the final source and its saved source snapshot; its object is bound through the index, archive, current bytes and controller. Every selected successful build precedes its union replay. All ordinary receipts match completed-event wrapper summaries, and all four union receipts match full completed-event payloads. Per-source hashes, object hashes, snapshots, receipts and event bindings are recorded in the evidence JSON.

## Counts and helper qualification

All 1,200 named theorem declarations are directly requested and printed in `MarkovFinalAuditM253`. The four successful Audits print 22, 968, 1,196 and 1,200 names, respectively: **3,386 output rows, 1,200 distinct names**. Their union equals the final named theorem inventory, with no missing or extra name. The validation axiom map agrees with the printed outputs. Every closure uses only `propext`, `Classical.choice`, and/or `Quot.sound`.

Ten Low/High Gap modules account for **1,120 names**, each containing 112: 90 GC equality/nonnegativity helpers, 18 GCol equality/nonnegativity helpers, three column-assembly identities, and one final local inequality. Across those ten files this is 900 + 180 + 30 + 10 names. The other modules contain 80 names. Thus 1,200 is a count of all named theorem declarations including helpers, not 1,200 independent source-level conclusions. These theorem counts also differ from the full set of constants handled by the replay driver.

## Attempts and replay ordering

There are **74 retained actual Lean validation invocations**: 70 builds and four unions. Builds comprise 60 successes (56 math + four Audit), five compiler errors (return code 1), and five timeouts. All four unions succeeded; no direct replay, skipped receipt or interrupted Lean outcome appears.

All ten rejected attempts belong to earlier source versions of seven subsequently accepted modules. Five timeouts concern LowDefs, HighDefs, LowGap1 twice, and HighGap1; five errors concern OneValues, OneAssembly, and Scalar three times. Each rejected snapshot differs from its module’s final accepted source, while matching its own receipt hash. Their later final versions have successful matching builds and replay. No rejected version is promoted by counting a later success under the same filename.

| Union targets | Named theorems | Receipt timestamp UTC | Duration |
|---|---:|---|---:|
| Seven numerator-one modules | 22 | 19:38:49.503529 | 91.112 s |
| Thirty-three scalar, definition, value and top-gap modules | 48 | 19:48:39.061902 | 83.764 s |
| Ten Low/High Gap modules | 1120 | 19:51:12.672489 | 72.730 s |
| Six chart/source/residual assembly modules | 10 | 19:52:00.296772 | 4.641 s |

The four target sets are disjoint and cover all 56 new mathematical modules. Receipt filename timestamps for unions are post-return times; ordinary validator filename timestamps precede subprocess invocation. Duration-derived start/end times are estimates, not independently logged kernel-call times.

## Finalization, deadline and preservation

Two finalizer invocations completed successfully, at events **228** and **234**. The first indexed 300 files. Events 229–230 add `verify_final_2532cf40.py`, and event 232 updates the checkpoint; the second finalizer regenerates the index with 301 files. This is a successful refresh, not a failed finalizer. Event **236** successfully runs the final verifier, checks the 301 indexed hashes, all 56 source/replay/axiom bindings and 266 preserved inputs, then writes `last-verification.json`. Event **237** contains the final report and event **238** is `turn.completed`. The final report matches both `final.json` and the controller report.

| Boundary | UTC on 2026-10-15 |
|---|---|
| Controller start | 19:26:46.837859 |
| Last union receipt timestamp | 19:52:00.296772 |
| Final Audit build estimated return | 19:52:02.388524 |
| Final validation mtime | 19:53:04.176798 |
| Preservation mtime | 19:53:04.242092 |
| Final artifact-index mtime | 19:53:05.131939 |
| Final-check mtime | 19:53:05.132091 |
| Last-verification mtime; latest changed artifact | 19:53:06.118643 |
| Controller finish | 19:53:48.329208 |
| Controller 1800-second deadline | 19:56:46.837859 |

The controller outcome is **completed**, return code 0, elapsed **1621.4913489818573 seconds**, with a final report. Finish is 178.508651 seconds before deadline. All builds, unions and audits precede finalization; the subsequent verifier output is expected and archived. No artifact is after the controller deadline or finish, and no pending/unarchived validation effect is retained. `completion` remains null and `mathematical_resolution` false.

All **255 worker 104 controller artifacts** match their original archive, before-105 hashes and current files; none was changed by worker 105. All **253 reconciliation entries**, **266 initial hashes**, and **266 preservation entries** match. These sets overlap and are not additive. The pinned root and established raw/canonical contract hashes match. Worker 104 recovery history and worker 103’s distinct historical outcomes are not relabeled by this worker.

## Replay method and limits

The unchanged batch driver is `ReplayBatch07F1.lean`, SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The separately preserved direct driver also retains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`, but was not invoked for a direct replay here. Static imported bases for the four unions contain 889, 896, 581 and 938 resolved modules, respectively. Each is transitively target-free at source level, with no explicit target/base name collision, duplicate selected name or resolved source cycle. New modules imported by later successful groups had earlier successful union coverage.

The wrapper matches worker 104 after request substitution except that its union timeout increases from 240 to 300 seconds. It retains pre-run source hashes and post-run driver hashing, without reinstating a matching-build receipt precondition; independent bindings in this audit nevertheless establish the matching successful build before each union. The validator saves pre-run source snapshots and complete receipts while emitting abbreviated event summaries.

No worker 104 excluded draft or unreplayed worker 103 Gap3 module occurs in a successful static base. No optimized path file is archived for worker 105; its retained inherited path consists of worker 104 evidence followed by worker 104’s final optimized path, with current-worker evidence prepended by the validator. This describes retained configuration, not measured per-call lookup. Separate method support documents inherited import/object trust and path-order limitations. Static source closure analysis does not independently reconstruct every invocation-time binary import table, generated/private name or loaded object digest. The retained final objects are hash-bound, but receipts do not record their digests at load time. Kernel replay, ordinary compilation and printed axiom closure checks remain separate evidence. No official LeanChecker CLI invocation, fresh whole-source dependency rebuild, or exact-root completion is established.

Machine-readable support: `markov_worker_000105_validation_evidence.json`, with the full selected source/object/snapshot/receipt/event bindings and input hashes; method support: `markov_worker_000105_replay_method.md` and `_evidence.json`.

The archived post-finalizer verifier output `evidence/markov-2532cf40/last-verification.json` has SHA256 `11f1a1b1b4b78a8cf2ad8fc5fb09f0f222850b6ccbb72c7d5fd0d382b3a58592`.

Final support hashes: validation evidence `d5e829bf3b98a3397b402e3adb53a17c6a253da6c0b0f4c8cc2d29521d28bfe1`; method note `87584d4d322382e11704ec454d9c1ddea7c5d5324816a4ca5f36f5002faa60db`; method evidence `887ab16516e12a5f29280b29b3258c9db88022a114ad08a78588051e2d74c800`. All **1,154 directly recorded inputs** were stable at **2026-10-15T20:01:13.985497Z**. Reused historical graph nodes are bound through predecessor evidence and worker 105 before hashes; no fresh inherited-tree build was performed.
