# Worker 000095 retained validation and method audit

Read-only audit of request `96dea62b6a264d13939c64cc19dbe945` in `/Users/sasha/math_gkm`, evidence `evidence/markov-96dea62b`, controller `.control/markov/workers/000095`. Only retained records, sources and hashes were inspected. No project code, Lean, builds, replays, finalizers or experiments were run, and no project files were changed. Mathematical English/source scope is reviewed separately.

The retained evidence supports **all 60 new mathematical modules compiled and individually kernel-replayed, with all 261 named theorem closures printed and permitted**. It also supports **18 new successful individual replays of the exact worker-94 A/B/D modules previously left without successful replay**. These are later worker-95 checks, not backdated worker-94 successes. No retained binding mismatch was found.

## Final hashes and attempts

All **456 controller-indexed artifacts** agree between current bytes, worker-95 archive and controller after-hashes. All **455** entries of `artifact-verification.json` additionally match; the map omits only itself. No unarchived extra worker-95 file was found. The single file map serves as the manifest; no separate `artifacts.json` or local `report.json` is required or retained.

Every final selected source matches its build receipt, captured source snapshot, final object, inventory and individual replay receipt. All attempt snapshots match their receipt hashes, and all 145 attempt records have completed outer command events with matching fields. The companion evidence lists exact source, snapshot, receipt and object digests. Final objects are hash-bound artifacts; there is no invocation-time digest proving precisely which object bytes the replay process loaded.

There are **145 ordinary attempt receipts**:

| Mode and result | Count |
|---|---:|
| Successful build | 62 |
| Failed build, return code 1 | 1 |
| Timed-out build | 4 |
| Successful individual replay | 78 |

There are no skipped-build records, failed replays or union receipts. The 62 successful builds comprise the final 60 mathematical modules, Audit, and excluded alternate `MarkovOnsetLChecked4M96`. There is no superseded successful source version selected as final. The failed FourthPolygon attempt has an earlier source digest; its revised final source compiled and replayed. The four timeouts are OnsetL1 and OnsetLChecked1–3, approximately 120 seconds each, all excluded.

Eight alternate/draft sources are excluded. LChecked4 has a retained successful build/object but no replay receipt and is outside the 261-theorem inventory. The other seven have no successful final-hash build/object: four have timeout receipts, while L2–4 have no invocation receipt. “Excluded” therefore does not mean all eight failed compilation.

Of the 145 records, 136 are embedded in batch output as `module child-exit-code {receipt summary}`. These were parsed and compared individually; the batch wrapper's own return code is not used as evidence that every child succeeded. The remaining records have direct event payloads. Successful stdout/stderr summaries are lengths, not full output; the lengths match the full hash-bound receipts. Failed output matches the validator's retained summary/prefix. Audit retains 25,296 stdout characters rather than merely a declared closure count.

## Exact replay and axiom scope

All **78 successful receipts** select distinct modules through unchanged `ReplayKnown6d2c.lean`; none is a union replay:

| Selected scope | Modules | Explicit theorems | Explicit definitions |
|---|---:|---:|---:|
| New worker-95 inventory | 60 | 261 | 344 |
| Later worker-94 checks | 18 | 39 | 72 |
| Total individually selected | 78 | 300 | 416 |

New definition-only modules OnsetDefs and OnsetParts are explicitly replayed. Prefix, FourthPolygon and ResidualOnset also have their own successful receipts. Audit has 60 imports and 261 axiom-print requests, no explicit mathematical declaration, and a successful build only; it is not counted among the replay targets.

The final 261 source theorem names exactly equal the inventory, Audit requests, printed closure names and validation axiom map. Every printed closure contains only a subset of `propext`, `Classical.choice`, `Quot.sound`. This new Audit covers 261 new theorem names, not a freshly printed combined set of 300. The 39 inherited recovery theorems already have the unchanged worker-94 axiom audit; their new evidence here is individual replay.

Every new matching build precedes its corresponding replay. All 78 selected source hashes match current bytes. Each individual source import closure excludes its own target module and explicit declaration names. No selected explicit-name duplicates, imported target-name collisions or source cycles were found. All preexisting inherited local sources match their before-worker hashes. Each newly introduced worker-95 module imported during another check also has its own successful replay. The local source closures range from zero to 617 modules; ResidualOnset has the 617-module closure. Excluded SplitAG modules do not occur in any inspected closure.

The drivers retain their before-worker hashes:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

The request-specific validator and unused union wrapper match worker-94 versions after substituting the request identifier. The operational change is choosing individual replays, not altering kernel replay semantics. The validator snapshots/hashes source before launching pinned Lean v4.32.2, then records output, duration and command. Direct receipts do **not** record invocation-specific driver hashes or loaded object hashes; driver agreement is established from retained before/current sources and controller bindings.

The method loads the selected object's most-private constants and replays safe nonpartial declarations through the kernel relative to imported objects. Imports remain trusted; axioms remain axioms; unsafe/partial declarations can be skipped; an already-imported matching theorem can avoid proof-body comparison. Static target/name checks expose no selected-source shortcut here. Pending recursion does not introduce proof assumptions. These separate successful checks are not one simultaneous fresh reconstruction of the whole inherited environment. Binary import tables, generated/private names, exact loaded object bytes/times, official CLI replay and a fresh whole-source rebuild are not independently established. The separate method report states these limits precisely.

## Worker-94 checks without rewriting history

The 18 recovery targets exactly equal worker 94's retained `unreplayed_modules`: A/B/D Chart, Defs, Gap0 and Value0–2. Their source hashes match worker-94 final successful builds and current bytes; the corresponding old objects also remain unchanged and hash-bound. Worker-95 replay snapshots and receipts are new artifacts under the worker-95 evidence directory. Their invocation estimates span **14:54:25.803793–14:58:12.464725 UTC on 2026-10-15**.

All **328 worker-94 controller-indexed artifacts** agree with the old controller after-hashes, old archive, worker-95 before snapshot and current bytes; none is modified by worker 95. Thus worker 94's four union timeouts, nine successful target modules, `kernel_replay_complete: false`, timeout/null-report outcome and archive are preserved. Worker 95 now supplies later individual selected-module success for the previously imported-only 18. Calling these later checks “completed” does not turn them into historical worker-94 replay successes or a fresh rebuild of old dependencies.

## Finalization, reports and chronology

Two finalizer invocations completed successfully. The first (event 167) indexed 454 files. A new `contract-binding.json` was then written, the mathematics/correspondence/checkpoint notes were updated, and the second finalizer (event 171) indexed the final 455 files. Event 173 independently rechecked all 455 hashes and asserted replay completeness and null root completion. No failed finalizer or pending invocation remains.

The contract binding explicitly distinguishes file bytes, canonical ASCII JSON and non-ASCII JSON serializations. The expected canonical ASCII digest is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`; the raw file digest is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. The pinned root remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. No mismatch results from hashing different serialization inputs.

All **490 preservation** and **481 initial reconciliation** comparisons agree with current bytes. These overlapping sets must not be added as distinct protected files.

All times are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 14:50:46.453040 |
| Last new replay estimated completion | 15:14:35.725122 |
| Final validation mtime | 15:15:33.633722 |
| Final preservation mtime | 15:15:35.077523 |
| Final artifact-index mtime | 15:15:35.509322 |
| Final retained event-log mtime | 15:16:18.006779 |
| Controller finish | 15:16:26.623697 |
| Controller deadline | 15:20:46.453040 |

Controller outcome is **completed**, elapsed **1540.170656681 seconds**, finishing **259.829343319 seconds before deadline**. The final index predates the deadline by **310.943717718 seconds**. No indexed artifact has a current mtime after the deadline or controller finish, and no extra unarchived file or pending command was found. Start-plus-duration estimates are not separate exact kernel-return timestamps.

Final agent JSON (event 174), controller `final.json` and controller report match; event 175 is `turn.completed`. Completion remains null and mathematical resolution false. These are successful local checks and a completed response, not root-theorem completion or an independent mathematical admission decision.

## Supporting evidence

The companion JSON records every source/object/receipt/snapshot digest, controller/archive comparison, batch-child/event binding, closure name, exclusion, recovery association, preservation comparison and timing. The method evidence preserves the 78 target/import graphs and declaration inventories.

All **2273 combined audit inputs** were rehashed without change at `2026-10-15T15:29:15.350328+00:00`.

- Validation evidence: `markov_worker_000095_validation_evidence.json`, SHA-256 `e3ceb1d7d3d13de990635784157c789a3560c0ae78869bfbc5e111213306e0e2`.
- `markov_worker_000095_replay_method.md`, SHA-256 `c9e987b8d796952d333c86c365293f87aeb981f5f36a375aac296586784f46ae`.
- `markov_worker_000095_replay_method_evidence.json`, SHA-256 `e1417c3f73157857529d42b8af550d15adb4e2f2e4ccc2560655dbc366a0a602`.
