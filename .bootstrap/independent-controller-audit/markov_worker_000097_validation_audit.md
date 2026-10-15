# Worker 000097 retained validation and timeout audit

Read-only audit of request `fa9eb434c31049be8cbf0c087d85105d` in `/Users/sasha/math_gkm`, evidence `evidence/markov-fa9eb434`, controller `.control/markov/workers/000097`. No project code, Lean, builds, replays, finalizers or experiments were executed by this audit; no project files were changed. Mathematical English/source scope is reviewed separately.

The retained evidence supports **49 final mathematical modules compiled and successfully union-replayed, with all 79 named theorem closures printed and permitted**. Thirty-five modules also have successful individual replays. Chamber0 and Chamber1 are explicit successful union targets, not merely compiled imports. Local finalization completed before the deadline, but the controller timed out without a final worker response. No final source/hash/archive mismatch was found.

## Final bindings and accepted inventory

All **397 controller-indexed artifacts** match current bytes, worker-97 archive bytes and controller after-hashes. All **396** entries of `artifact-verification.json` additionally agree; its map excludes only itself. All current worker-97 files are accounted for. There is no extra unarchived or late changed artifact. This file map is the manifest; there is no separate `artifacts.json` or local `report.json`.

This worker uses `accepted-modules.json` and `declarations.json`, not `audit-inventory.json`. Their 49-module and 79-name sets agree exactly with final validation and source declarations. Every accepted source matches its successful build receipt, captured snapshot, final indexed object and successful union membership. Every attempt snapshot matches its receipt source digest. All 49 matching builds precede the union's estimated execution interval. Exact source/object/receipt/snapshot hashes and archive/controller comparisons are retained in the companion JSON.

The inventory contains **79 explicit theorems and 104 definitions**. `MarkovFullPartsFA` is definition-only. Audit has 49 imports, 79 axiom-print requests and no mathematical declarations; its successful build retains 5,860 stdout characters. All 79 source theorem names equal the declaration list, Audit requests, printed closures and validation axiom records. Each closure uses only a subset of `propext`, `Classical.choice`, `Quot.sound`. Audit is compiled only and is not a replay target.

## Actual attempts, retries and excluded drafts

There are **119 ordinary records**: 107 actual Lean invocations plus 12 deliberately skipped queued checks. The actual invocations are:

| Mode/result | Count |
|---|---:|
| Successful build | 50 |
| Timed-out build | 16 |
| Failed build, return code 1 | 4 |
| Successful individual replay | 35 |
| Timed-out individual replay | 2 |

The 50 successful builds are exactly the final 49 mathematical modules plus Audit; no superseded successful source version is selected. The 12 skipped records consist of **two builds** (Coeff2/Coeff3, subsequently successfully built) and **ten individual replays**. Their snapshots and recorded skip payloads match the completed events. They are not failed or timed-out Lean invocations.

Accordingly, the stored **34 rejected/superseded records** comprise 18 timeouts (16 build + two replay), four failed builds and 12 skipped checks. Calling all 34 failed Lean invocations would overstate the count. FullLocals and FullParts have timed-out direct replays, but their final sources are subsequently included in the successful union. An earlier FullSource build failed; its changed final source compiled and was union-replayed.

All **16 sources outside the accepted set and Audit** have no final retained object or successful final-source build/replay. They consist of Chamber2–5; SourceChamber0–5; original Coeff0/Coeff1; Coeff0Debug/Test/Opaque; and CoefficientLC. Four SourceChamber files (2–5) have no invocation receipts. Other excluded files have failed or timed-out build evidence. The original Coeff0/Coeff1 draft names are distinct from the accepted Coeff0Final/Coeff1Final modules. Failed adapters and the general CoefficientLC draft are not admitted by preserving their files.

All actual invocation records and skipped payloads have matching completed command events. Batch output was checked per receipt rather than inferring success from the outer batch exit. Successful event stdout/stderr are length summaries; full output is retained in hash-bound receipts. Failed output matches the validator's summary/prefix. Retained `pending-*.json` files are intermediate work lists, not evidence of live unfinished subprocesses; the final event stream has no pending command item and the skip list is cleared.

## Successful replay scope and method

The final successful union is `kernel-union-1792080822228549000.json`, SHA-256 `cda1affaf27228629404b0c4e3cef396a1a0a5fe14d14968aab3b91c80179725`. It selects **all 49 final accepted modules**, including FullSource, Chamber0/Chamber1, FullLocals, FullParts and all ten skipped individual targets. Its duration is **59.493885584 seconds**; receipt filename time is **16:13:42.228549 UTC**, with estimated start **16:12:42.734663 UTC**. Event 238 is its matching completed command payload.

The **35 successful individual replays** cover 38 explicit theorems and 36 definitions. Fourteen accepted modules lack individual success: two chambers, the two direct-timeout modules and ten skipped direct modules. All fourteen are explicitly checked in the successful union, so individual incompleteness does not leave accepted targets outside the union. The union is the evidence for the entire 79-theorem/104-definition inventory. Audit remains outside that target set.

The union's sole explicit inherited root is `MarkovFourthBinomialBC`; implicit Init accounts for the second recorded imported module. Its transitive local source base has **121 modules and no worker-97 target**. Individual replay bases range from 121 to 167 local modules; newly introduced sources used as imports in individual checks are all selected in the successful union. Selected/base explicit-name checks found no collision, duplicate or source import cycle. Preexisting inherited local sources match before-worker hashes. Chamber2–5 and all six source-chamber adapters are absent from all inspected bases.

Both replay drivers match their before-worker hashes: `ReplayKnown6d2c.lean` is `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; `ReplayBatch07F1.lean` is `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The union wrapper uses `run-Markov*.json` when finding builds, avoiding non-receipt list-valued work-list JSON. That parsing adjustment does not alter replay semantics. It hashes target sources before execution, requires matching successful builds and records the driver hash afterward. Direct receipts snapshot/hash sources before invocation but omit an invocation driver digest.

The established replay method sends selected safe nonpartial declarations to kernel checking relative to imported objects. Imports remain trusted; axioms remain axioms; unsafe/partial declarations can be skipped; duplicate union-map names can overwrite; already-imported matching theorems can avoid proof-body replay. Static target/name checks expose no selected-source route to those skips here. Pending recursion does not insert proof assumptions. Source graphs do not independently establish binary import tables, private/generated constant inventories or exact loaded object bytes/times. Final object hashes do not freeze invocation objects. No official CLI replay or fresh whole-source rebuild is established. The separate method report records these limits.

## Finalization, preservation and timeout boundary

The report script's `audit` mode completed at event 229. Its `final` mode completed twice, at events **242** and **246**, reporting 49 modules, 49 replayed, 79 audited closures and 419 preservation checks. The first final map had 395 entries. Operational observations were then added, documentation and skip-list files updated, and the second final report recomputed the final **396-entry** map. No failed finalizer invocation remains. The script computes hashes once; this audit independently compares the final entries with current, archive and controller values.

All **419 preservation comparisons** and **410 initial reconciliation comparisons** match current bytes. They overlap and should not be added as distinct protected files. All **405 worker-96 controller-indexed artifacts** match old controller after-hashes, old archive, worker-97 before snapshot and current bytes; none is changed by worker 97. The pinned root and expected canonical contract hashes match their retained requirements.

All times are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 15:45:21.801609 |
| Successful union receipt filename | 16:13:42.228549 |
| Final validation mtime | 16:15:10.852023 |
| Final preservation mtime | 16:15:13.448485 |
| Final artifact-index mtime | 16:15:14.185396 |
| Final retained event-log mtime | 16:15:14.229574 |
| Controller deadline | 16:15:21.801609 |
| Controller finish | 16:15:34.443012 |

The final index predates the deadline by **7.616213083 seconds**. No indexed artifact has a current mtime after the deadline or finish; no extra unarchived file or pending command was found. Receipt-name and duration timestamps are not separately logged exact kernel-return times.

The controller records **timeout**, elapsed **1812.641402960 seconds**, report null and mathematical resolution false. No final agent JSON, controller `final.json`, `turn.completed` or local `report.json` is retained. The successful predeadline local validation records are therefore distinct from a completed final worker response. This audit did not complete any missing response or check.

## Supporting evidence

The companion JSON retains all source/object/receipt/snapshot digests, controller/archive comparisons, actual/skipped attempt classifications, event bindings, exact replay target sets, axiom names, exclusions, preservation checks and timing. The method evidence preserves complete import graphs and selected declaration inventories.

All **1757 combined audit inputs** were rehashed without change at `2026-10-15T16:30:09.088693+00:00`.

- Validation evidence: `markov_worker_000097_validation_evidence.json`, SHA-256 `100010ae421adc88f40f96000c2a852fa649418943882c64f4196d41b31cab6a`.
- `markov_worker_000097_replay_method.md`, SHA-256 `51bd998882a9a21966eb83a9c0e4fe5fc7e848ce29c8e2f111539e6de4616226`.
- `markov_worker_000097_replay_method_evidence.json`, SHA-256 `ee53c267a7882ce56addb70ebce5a5620ae0fc8df57dd07e058e3b2a0d711c7d`.
