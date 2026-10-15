# Worker 000103 retained validation and timeout audit

Read-only audit of request `722898f8801743d7b87c8028ab0979f7`, using controller `.control/markov/workers/000103` and its archived `evidence/markov-722898f8` and research files in `/Users/sasha/math_gkm`. Current bytes were compared with historical archives; no successor results were substituted. No project code, Lean, builds, replays, finalizers or experiments were executed, and no project files were edited. Mathematical English/source scope is reviewed separately.

The final retained receipts support **39 newly compiled mathematical modules successfully replayed, plus eleven inherited recovery replays**. Five new compiled modules remain unreplayed. The saved validation/index snapshot predates one successful nine-module union and two timed-out checks. All these later outcomes are archived and occurred before the host deadline; the controller nevertheless timed out without a final worker response.

## Final source and artifact bindings

All **406 controller-indexed artifacts** match controller after-hashes, original archive bytes and current bytes. All **398 artifact-map entries** additionally agree. Eight controller files are outside that map: the map itself, `final-check.json`, and six files written after finalization, listed below. No extra unarchived current file or current/archive mismatch was found.

The final new compiled mathematical scope is **44 modules, 172 explicit theorem declarations and 285 definitions**. Six modules are definition-only: MiddleShapes, MiddleRawDef and MiddleBase0–3. Every accepted source matches its successful build receipt, captured source snapshot and final archived/current object. The 46 successful builds consist exactly of those 44 mathematical modules and two Audit modules; no successful superseded version is selected.

There are **71 other new mathematical source files** without retained objects or successful final-source builds/replays. They remain excluded drafts, regardless of generated statements or queued work. Three new Audit sources are separate: OnsetAudit and FinalAudit compiled successfully; LowDirectAudit timed out and has no retained object.

The eleven inherited targets retain their original source/object hashes from workers 101 and 102. Their prior build receipts and snapshots, old controller/archive hashes, worker-103 before hashes, current bytes and worker-103 replay source digests all match. They were replayed in worker 103, not rebuilt there.

## Actual completed replay scope

There are **16 successful direct receipts** and **five successful union receipts**, selecting 50 distinct mathematical modules:

| Scope | Modules | Theorems | Definitions |
|---|---:|---:|---:|
| New worker-103 successful targets | 39 | 119 | 259 |
| Recovered worker-101 columns | 10 | 340 | 390 |
| Recovered worker-102 Adapter5MAE | 1 | 6 | 0 |
| **All successful targets in worker 103** | **50** | **465** | **649** |

The ten recovered columns are Columns4_1–4_5M00 and Columns5_1–5_5M00. Their successful replays belong to worker 103 and do not rewrite worker 101's timeout or worker 102's missing-result history. The old failed `MarkovOnsetAdapter4MAE` is not accepted. The new `MarkovOnsetAdapter4M722` has its own successful build and direct replay.

The five new direct targets are OnsetAdapter4M722, OnsetAllM722, FourthAfterMiddleM722, FourthMiddleM722 and ResidualM722. The successful unions cover:

| Receipt suffix | Target group | Modules | Theorems | Definitions |
|---|---|---:|---:|---:|
| `1792089033436125000` | MiddleShapes and ShapeEq0–2 | 4 | 3 | 30 |
| `1792089246876020000` | ShapeEq3–5 | 3 | 3 | 0 |
| `1792089435116988000` | MiddleRawDef and MiddleCanonical | 2 | 1 | 1 |
| `1792089604510364000` | Four MiddleBase and twelve MiddleValue modules | 16 | 12 | 180 |
| `1792089919583268000` | MiddleGap1_0–1_8 | 9 | 90 | 45 |

The 34 union targets are distinct and do not overlap the five new direct targets. Matching successful builds precede every successful replay; inherited replay ordering uses the original predecessor build receipts. Recovery-runner filenames are stamped after child return, whereas validator filenames precede the run. The evidence records that distinction instead of interpreting every filename as a start time.

Five new modules remain **compiled-only**: MiddleGap3_1, 3_2, 3_3, 3_4 and MiddleLowDirectM722, totaling **53 theorem declarations and 26 definitions**. None occurs in the imported base of a successful worker-103 replay. LowDirect has a timed-out direct replay; the four Gap3 modules have no successful replay receipt. Audit output does not promote them to replay successes.

## Validation snapshot versus later archived results

The saved finalizer snapshot records **44 compiled, 30 newly replayed, eleven inherited replays, fourteen new unreplayed modules and one unaudited module**. It was accurate before the last union returned. The later nine-Gap1 union succeeds at completed event **215**, adding 90 theorems and 45 definitions and reducing the final retained unreplayed set from fourteen to five.

The successful late union receipt is `kernel-union-1792089919583268000.json`, SHA-256 `a20c5473941ba4d378ddccd407b1abb3a2e32858d20eae407c43ae39ad0509f6`. It records 132.488353917 seconds and return code zero. Its filename time is **18:45:19.583268 UTC**, approximately 25.811 seconds before the controller deadline. It was archived by the controller and is not post-timeout or successor evidence. The validation/index files were not regenerated afterward.

Two subsequent completed outcomes are failures: LowDirectAudit's build timeout at event **216**, and LowDirect's replay timeout at event **217**. Neither supplies axiom output or successful replay. No missing checks or aggregate reports were completed by this audit.

## Attempts, skipped work and axiom coverage

There are **107 ordinary records**: 79 actual Lean invocations and 28 skipped queued builds. Actual ordinary invocations comprise:

| Outcome | Count |
|---|---:|
| Successful build | 46 |
| Build error, return code 1 | 8 |
| Build timeout | 8 |
| Successful direct replay | 16 |
| Direct replay timeout | 1 |

The five successful unions bring the total to **84 actual Lean invocations**. There are **17 rejected invocations** in the final archive. Operational observations/final-check retain the earlier count of fifteen; the two later timeout outcomes account for the difference. Twenty-eight skip records are additional non-invocations.

Every actual receipt and skip payload has a matching completed command event. Child payloads nested under the batch runner's `output` field were decoded individually; the outer batch exit was not treated as proof success. Source snapshots, full receipts and printed summary/prefix fields agree. The final 99-row middle-build queue includes dependency-blocked and skipped entries; it is not 99 Lean compilations. It has no pending entry, and the final worker event stream has no pending command item.

Two successful Audit builds print **356 and 171 named closures**. Ten names overlap, yielding **517 unique closures**. The requests, printed output and validation axiom map agree; every printed closure uses only a subset of `propext`, `Classical.choice` and `Quot.sound`.

Those 517 names cover all **346 inherited recovery theorem names** and **171 of the 172 new compiled theorem names**. `middle_low_directM722` is the sole missing new name. The four unreplayed Gap3 modules' 52 theorem names were printed successfully; axiom-audit coverage is therefore broader than successful replay coverage. LowDirect has neither a successful replay nor a completed axiom audit. Merely retaining LowDirectAudit's source does not count as a completed check. Neither successful Audit is a replay target.

## Historical replay method

The method review uses archived worker-103 source bytes and predecessor source graphs only where hashes match the worker-103 before snapshot. No active-successor graph or result is used. The drivers are unchanged and absent from the controller change set: ReplayKnown6d2c SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; ReplayBatch07F1 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. All union receipts cite the latter hash.

All inspected target/source import graphs are target-free, have no explicit target-name duplicates and have no source import cycles. The five successful union bases contain 544, 545, 569, 2 and 3 local modules respectively. Every new module used as an import by a successful check also has its own separate successful replay. It remains a trusted imported dependency within that particular invocation. The five new compiled-only modules are absent from all successful bases.

The recovery runner retains worker 102's sequential 300-second direct calls and post-return receipt timestamps. It hashes source bytes read before each call but stores no snapshot or driver/object digest. The union wrapper now uses 160 seconds and explicitly sets TMPDIR in its evidence/work directory. It hashes selected sources before execution, requires matching successful builds and hashes the driver after return. The validator adds an absolute **18:43:00 UTC** build deadline only for modules listed in the middle inventory. These alter scheduling/capture, not the Lean replay algorithm.

Selected safe nonpartial declarations reach alternate kernel replay relative to imported objects. Imports remain trusted, axioms remain axioms, unsafe/partial declarations can be skipped, and duplicate/imported theorem metadata can avoid proof-body comparison. No corresponding explicit-source shortcut was found; pending dependency state is not a proof assumption. Static graphs do not establish binary import tables, private/generated names or exact loaded-object bytes/times. Final object hashes do not freeze invocation objects. No official CLI replay, fresh inherited source rebuild or root completion is established.

## Finalization, exact post-finalizer files and timeout

Audit-source generation completed at event **199**, then FinalAudit built successfully at event **204**. LowDirect built successfully at event **205**, after that audit source was generated. The finalizer completed successfully at event **209**; no failed finalizer is retained. Its manifest has 398 entries and excludes its own file and final-check by design.

Six additional files were written after that final-check. All are controller/archive-bound and predeadline. Under `evidence/markov-722898f8/` unless stated otherwise:

| File | SHA-256 |
|---|---|
| `research/MarkovLowDirectAuditM722.lean` | `207eac74bed6228bf25ae8e32aa493d474113a5a183960fca46237d8bcc7123a` |
| `MarkovLowDirectAuditM722-build-1792089913905925000.lean` | `207eac74bed6228bf25ae8e32aa493d474113a5a183960fca46237d8bcc7123a` |
| `MarkovMiddleLowDirectM722-replay-1792089914989128000.lean` | `ed875caa4863b1c06905c6394d566f93f73cbf262a7cacfe5b0d6f3f25f8f983` |
| `kernel-union-1792089919583268000.json` | `a20c5473941ba4d378ddccd407b1abb3a2e32858d20eae407c43ae39ad0509f6` |
| `run-MarkovLowDirectAuditM722-build-1792089913905925000.json` | `3efb40234267f1af8fc7801a05251e5f5f5ff5ea2ded0bc082f4202f7d8af4d3` |
| `run-MarkovMiddleLowDirectM722-replay-1792089914989128000.json` | `94511311ced8d20c1d363123891464e47c5dce904686c02c31ee068ddda0b7cc` |

All times below are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 18:15:45.394551 |
| Saved validation mtime | 18:44:40.163680 |
| Preservation mtime | 18:44:45.193465 |
| Artifact-map mtime | 18:44:46.651129 |
| Final-check mtime | 18:44:46.652359 |
| Later successful nine-gap union receipt mtime | 18:45:19.583880 |
| LowDirectAudit timeout receipt mtime | 18:45:39.107903 |
| LowDirect replay timeout receipt mtime | 18:45:40.172216 |
| Controller deadline | 18:45:45.394551 |
| Controller finish | 18:46:10.605571 |

The latest artifact predates the deadline by **5.222334862 seconds**. Receipt times are distinct from exact child-return times, but all three later outcomes have completed command events and predeadline archived receipts. No changed artifact has a mtime after the deadline or controller finish, and no unarchived extra was found.

The controller records **timeout**, elapsed **1825.211020947 seconds**, report null, mathematical resolution false and process return code zero. No final agent JSON, controller `final.json` or `turn.completed` exists. Local finalization and later completed checks therefore remain distinct from a completed final response. The snapshot is not silently rewritten to include subsequent outcomes.

## Preservation and supporting evidence

All **307 preservation comparisons** and the 307 initial hashes match current bytes; **289 reconciliation comparisons** also match. These sets overlap. All **285 worker-101 artifacts** and **18 worker-102 artifacts** retain their original archive/controller/current hashes and match worker-103's before snapshot. Their historical statuses and unsuccessful attempts remain unchanged; recovery success is credited only to worker 103. Pinned root and canonical contract requirements match.

All **1454 directly recorded audit inputs** were rehashed unchanged at `2026-10-15T19:04:14.241508+00:00`. Historical method graphs are transitively bound through predecessor evidence and before-worker hashes; this is not a fresh rebuild of all inherited sources.

- `markov_worker_000103_validation_evidence.json` — SHA-256 `f46bff17fafc6577747fb7da14e4a9a9cdc898bdd1bb10b0c00eacd97d8a2ffa`.
- `markov_worker_000103_replay_method.md` — SHA-256 `055cfb8c4bb72855b6532ccd74177bfbb929c77b231c5173d8d9c0e80011cfa4`.
- `markov_worker_000103_replay_method_evidence.json` — SHA-256 `2adc3c32692ccc00a07d69df7381d9919a9834d0650efb73bbcfe80495459250`.
