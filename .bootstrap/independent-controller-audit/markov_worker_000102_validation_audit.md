# Worker 000102 retained validation and capacity-failure audit

Read-only audit of request `ae37847f6ced4508895c1c325bd07606`, using controller `.control/markov/workers/000102` and its archived `evidence/markov-ae37847f` and research files in `/Users/sasha/math_gkm`. Current bytes were compared with the historical archive; no successor check was used. No project code, Lean, builds, replays, finalizers or experiments were executed, and no project files were edited. Mathematical source scope is reviewed separately.

The retained evidence supports **one successful build only**, `MarkovOnsetAdapter5MAE`, containing **six named theorems**. `MarkovOnsetAdapter4MAE` failed. There are **zero completed replay receipts, zero union receipts and zero printed axiom closures**. Two recovery queues were started, but neither has a completion event or child receipt. The run ended with a model-capacity error, not a time-budget expiry.

## Exact historical bindings

All **18 controller-indexed changed artifacts** match controller after-hashes, original archive bytes and current bytes. No extra file is present in the worker-102 evidence directory or its named research-file set. No retained changed artifact has a current mtime after controller finish. The archived objects and receipts below predate the capacity failure; no later receipt has been backfilled into this audit.

The archive includes five mathematical source files. Adapter5's source, attempt snapshot, successful receipt, final object and controller/archive hashes match. Adapter4's final source and snapshot match its failed receipt; it has no retained object. The remaining `MarkovOnsetAllMAE`, `MarkovFourthAfterMiddleMAE` and `MarkovResidualMAE` sources have no build/replay receipts or objects. They remain unbuilt drafts.

There is no accepted inventory, Audit module, validation report, preservation report, artifact-verification map, final-check record, final agent report or finalizer source/invocation. Their absence is not repaired here. The controller's 18-file archive is the historical artifact boundary.

## Actual build and recovery records

Two build invocations have completed events and receipts:

| Module | Result | Completed event | Estimated execution interval, UTC |
|---|---|---:|---|
| OnsetAdapter4MAE | Return code 1 | 31 | 18:13:55.189919–18:14:38.395162 |
| OnsetAdapter5MAE | Return code 0 | 34 | 18:13:55.190560–18:14:39.785223 |

Adapter4's five `simp` errors are retained. Adapter5's output is empty; it prints no axiom closure. Its six theorem declarations are compilation-only evidence, with no separate replay or all-name axiom record.

Events **29** and **30** start two `replays_ae37847f.py` commands. One lists Columns4_1–4_5M00; the other lists Columns5_1–5_5M00. These ten names are exactly worker 101's missing replay set, comprising 340 theorems and 390 definitions.

The runner processes each command's five modules sequentially, with a 300-second limit per child. It writes and prints a receipt after each child returns. Neither command has an `item.completed` event, and **no child replay receipt is retained**. Thus ten queued names are not ten completed or necessarily launched child invocations. No successful recovery, timeout result or partial proof success can be inferred from those starts. This audit neither inspected live processes nor completed those checks.

## Method boundary

The method audit uses worker-102 archived bytes and hash-matching worker-101 historical dependency graphs. No successor graph or result is used. Both drivers retain the established before hashes, with no driver edits in either controller change set: ReplayKnown6d2c `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; ReplayBatch07F1 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

The new recovery script changes scheduling and receipt capture, not the direct driver. It reads source bytes before each call, uses the unchanged direct driver and stamps receipts after child return. It does not preserve a source snapshot or driver/object digest for those calls. No such receipt is retained here.

Each requested high-column target has a static 481-module local imported base, without target reimport, explicit-name collision or source cycle. Adapter5's 538-module local base imports all five still-unreplayed Columns5_*M00 modules. Static source hashes match the before snapshot. These are descriptions of planned checks and a compilation boundary, **not evidence of completed kernel replay**. The adapter and those five imports must not be promoted to replayed targets.

The established driver would kernel-check selected safe nonpartial declarations relative to imported binaries if its invocation completed; imports remain trusted and axioms remain axioms. Static graphs cannot establish binary import tables, generated/private names, exact loaded-object bytes/times or a fresh whole-source rebuild. Here no completed replay receipt exists, and the combined 101/102 record leaves the ten-module replay gap open.

## Operational ending and preservation

Event **37** reports “Selected model is at capacity. Please try a different model.” Event **38** is `turn.failed` with the same error. The controller records **missing_or_malformed_report**, process return code **1**, report null and mathematical resolution false. There is no `turn.completed` or controller `final.json`.

All times are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 18:11:39.637535 |
| Adapter4 failed receipt mtime | 18:14:38.396371 |
| Adapter5 object mtime | 18:14:39.587476 |
| Adapter5 successful receipt mtime | 18:14:39.786112 |
| Controller finish | 18:15:21.095882 |
| Nominal 1800-second deadline | 18:41:39.637535 |

Elapsed time is **221.458347082 seconds**. The latest retained artifact is the Adapter5 successful receipt, approximately 41.310 seconds before controller finish. The two queue command items remain unmatched in the historical log. There is no retained late/unarchived output to credit or preserve separately. Missing completion events do not establish an actual child-return time or eventual process outcome.

Setup completed at event **21**, reporting **289 inherited hash comparisons**. All those recorded expected/actual values match current bytes. The **298 initial hashes** also match when independently checked here; they are an initial baseline, not a worker-final preservation report. All **285 worker-101 controller artifacts** match worker-101 archive/controller hashes, worker-102 before snapshot and current bytes; none was modified. Its timeout and missing-ten-replay boundary remain unchanged. Pinned root and canonical contract requirements match.

## Supporting evidence

All **639 directly recorded audit inputs** were rehashed unchanged at `2026-10-15T18:38:04.463985+00:00`. Historical method graphs are transitively bound through the worker-101 evidence file and before-worker hashes; no successor graph was consulted.

- `markov_worker_000102_validation_evidence.json` — SHA-256 `737171a0c18a49de5ea12cc5a27a5c2bfb7b2272f52542b208606d353d248e1f`.
- `markov_worker_000102_replay_method.md` — SHA-256 `c21a76b90978e99d001f47796245b72de68436b7942c4c08e1711c85c372e573`.
- `markov_worker_000102_replay_method_evidence.json` — SHA-256 `669fd91dec8dbc7080af6ac7ef3bab8ae71d6747eaca68fca5b78dba4fe47b4c`.
