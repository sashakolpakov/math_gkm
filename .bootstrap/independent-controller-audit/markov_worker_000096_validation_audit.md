# Worker 000096 retained validation and method audit

Read-only audit of request `8067e0c51ab944db8a1a44fb7403351d` in `/Users/sasha/math_gkm`, evidence `evidence/markov-8067e0c5`, controller `.control/markov/workers/000096`. Only retained sources, records and hashes were inspected. No project code, Lean, build, replay, finalizer or experiment was executed by this audit; no project files were written. Mathematical English/source scope is reviewed separately.

All **65 inventoried mathematical modules have matching successful builds and individual replay receipts**, and all **96 named theorem closures** match the printed axiom inventory. The worker completed its finalization and final response before the deadline. No retained binding mismatch was found. The module total includes 30 unchanged inherited sources newly built and checked under this worker; it is not 65 newly written source modules.

## Hashes, attempts and exact inventory

All **405 controller-indexed artifacts** match their current bytes, worker-96 archive bytes and controller after-hashes. All **404** entries of `artifact-verification.json` additionally agree; the map excludes only itself. All current worker-96 files are accounted for. No unarchived extra or late changed artifact was found. This single file map is the manifest; there is no separate `artifacts.json` or local `report.json`.

Every inventoried final source matches its successful build, captured snapshot, object, inventory entry and individual replay. All attempt snapshots match their receipt source hashes. The companion JSON records exact source, snapshot, object and receipt digests and archive/controller bindings. Final object digests bind retained artifacts, not the exact object bytes loaded at each invocation; wrappers do not freeze files or record invocation-time object digests.

There are **131 actual receipts**, all successful:

| Mode | Count |
|---|---:|
| Mathematical-module builds | 65 |
| Audit build | 1 |
| Individual mathematical-module replays | 65 |

There are no rejected builds, timeouts, skipped records, unsuccessful replays, union receipts, extra successful source versions or excluded worker-96 draft modules in the retained inventory. The zero-exclusion claim applies to this worker's M806 source inventory, not to every older draft or experimental candidate in the project.

Every attempt has a completed command event. Batch-prefixed summaries were parsed using their per-child module/status and receipt payload; a successful outer batch exit was not treated as proof that every child passed. Receipt fields agree with the corresponding direct or batch payloads. Successful stdout/stderr in events are length summaries; the full output remains in the independently hash-bound receipt.

| Inventory source origin | Modules | Named theorems | Explicit definitions |
|---|---:|---:|---:|
| New M806 sources | 35 | 66 | 42 |
| Unchanged inherited SplitLGxxM042 sources | 30 | 30 | 30 |
| Total inventoried and replayed | 65 | 96 | 72 |

The 30 entries in `inherited_sources_checked` are a **subset of the 65**, not 30 additional targets. These old source files match their worker-94 archive bytes, worker-96 before snapshot and current bytes. Their new worker-96 build objects, source snapshots and successful replay receipts are indexed under this worker. Their earlier exclusion in worker 94 remains historical; these later checks do not backdate a successful worker-94 validation.

## Axiom and replay scope

All **96 final source theorem names** exactly equal the audit inventory, Audit requests, retained printed closure names and validation axiom map. Every closure contains only a subset of `propext`, `Classical.choice`, `Quot.sound`. Audit imports all 65 mathematical modules, prints 96 closures, has no explicit mathematical declaration and is compiled only. Its build receipt retains **8,366 stdout characters**, with a matching length summary in the event record. Audit imports are not counted as additional replay targets.

Every one of the 65 mathematical modules has exactly one successful direct `ReplayKnown6d2c.lean` receipt with a matching final source hash and replay-passed output. Its matching build precedes the replay. There are no union receipts or request-96 union-wrapper file. Core source, prefix and residual modules have their own explicit replay receipts.

For each direct check, the static transitive local source base excludes that target module and its explicit declaration names. No selected explicit-name duplicate, imported target-name collision or source import cycle was found. Existing inherited local sources match their before-worker hashes; newly introduced modules appearing in another check's imported base also have their own successful replay. Local source closures range from one to 685 modules, with `MarkovResidualM806` at 685. External Mathlib boundaries remain inherited.

Both drivers are unchanged against the before-worker snapshot:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

The validator exactly matches worker 95's after request-ID substitution. It snapshots and hashes source before launching pinned Lean v4.32.2, with the worker evidence directory preceding inherited LEAN_PATH entries. Direct receipts retain source hash, command, output and elapsed time, but omit an invocation-specific driver hash and loaded object digest. Driver agreement is therefore a before/current retained-source binding, not an independently recorded invocation digest.

The unchanged direct driver loads the selected object's most-private constants and kernel-replays safe nonpartial declarations relative to imported objects. Imports remain trusted; axioms remain axioms; unsafe/partial declarations can be skipped; an already-imported matching theorem can avoid proof-body replay. Static source checks expose no selected-target shortcut here. Pending recursion does not add proof assumptions. Source graphs do not independently reveal compiled import tables, private/generated names or precise loaded object bytes/times. These are successful separate checks against retained imports, not one fresh simultaneous rebuild of the entire inherited environment, official CLI replay, or an independent root-completion audit.

## Preservation, finalization and report

All **456 worker-95 controller-indexed artifacts** match old controller after-hashes, old archive, worker-96 before snapshot and current bytes; none is modified by worker 96. All **470 preservation comparisons** and **461 initial reconciliation comparisons** also match. These overlapping sets should not be added as distinct protected files. The pinned root and expected canonical contract digests match the retained requirements.

One finalizer invocation completed successfully (events 223–224), reporting 65 mathematical modules, 65 replayed, 96 theorem closures, 30 inherited sources checked, 470 preserved inputs, 404 indexed artifacts, zero failed attempts and zero excluded drafts. The finalizer computes the artifact hashes once; the subsequent event 226 reads and displays counts/status. It is not a separate hash-comparison pass. This audit independently compared all 404 final index entries against current, archive and controller values.

All times are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 15:16:37.842234 |
| Final validation mtime | 15:43:44.339709 |
| Final preservation mtime | 15:43:45.117308 |
| Artifact-index mtime | 15:43:46.940979 |
| Final retained event-log mtime | 15:44:41.722845 |
| Controller finish | 15:44:55.576796 |
| Controller deadline | 15:46:37.842234 |

Controller outcome is **completed**, elapsed **1697.734561682 seconds**, finishing **102.265438318 seconds before deadline**. The final index predates the deadline by **170.901255131 seconds**. No indexed artifact has a current mtime after the deadline or controller finish, and there is no pending command. Source filename stamps and elapsed durations give invocation interval estimates, not separately logged exact kernel-return times.

Final agent JSON (event 227), controller `final.json` and controller report agree; event 228 is `turn.completed`. Completion remains null and mathematical resolution false. Successful local validation and a completed response do not establish the full pinned conjecture.

## Supporting evidence

The companion JSON records every source/object/receipt/snapshot digest, controller/archive comparison, event/batch-child binding, named axiom closure, inherited-source association, preservation comparison and timing. The method evidence preserves all target/import graphs and declaration inventories.

All **2380 combined audit inputs** were rehashed without change at `2026-10-15T15:59:29.026920+00:00`.

- Validation evidence: `markov_worker_000096_validation_evidence.json`, SHA-256 `3f82e5c3c0534a53b916f542294f364e7912978367c4861cccf16308d08a917d`.
- `markov_worker_000096_replay_method.md`, SHA-256 `6a7d8eec4cde00dfd0e99db1a5d05b44628eaeaaf9297c3c146040bbcb3ad6f2`.
- `markov_worker_000096_replay_method_evidence.json`, SHA-256 `48734f3d459834d099e96e3e8e5829719914d857affb92e158c2e2d8ea04ee6b`.
