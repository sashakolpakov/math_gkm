# Worker 000103 historical replay method audit

Read-only audit of timeout request `722898f8801743d7b87c8028ab0979f7`. This uses worker103 archived source/receipt bytes and parsed predecessor source graphs only where each hash matches before103; fallback was limited to hash-matched archived100–102 source bytes. All dependencies resolved without mismatch. No current research/evidence or active104 files were read; no project code, Lean, builds, replays, finalizers, experiments, missing checks or project edits were performed. The parent audit owns complete archive/object bindings and timing/finalization acceptance.

## Actual retained successful scope

There are 16 successful direct receipts, five successful union receipts, and one direct timeout. Successful checks select 50 distinct modules: 39 new modules containing 119 explicit theorems/259 definitions, plus 11 inherited recovery modules containing 346 theorems/390 definitions. Total successful target scope is 465 theorems and 649 definitions. All selected archived source hashes match their receipts, and inherited selected hashes match before103.

The inherited recoveries are exactly worker101's ten Columns4_1–4_5M00 and Columns5_1–5_5M00 modules, plus worker102's `MarkovOnsetAdapter5MAE`. Their replay success belongs to worker103. Worker101's and102's earlier replay gaps remain historical facts. The failed old `MarkovOnsetAdapter4MAE` is not a selected target; the new `MarkovOnsetAdapter4M722` is separately compiled/replayed in worker103. The five new direct successes are that new adapter, OnsetAllM722, FourthAfterMiddleM722, FourthMiddleM722 and ResidualM722.

| Successful union receipt suffix | Explicit target group | Modules | Theorems | Definitions | Local base |
|---|---|---:|---:|---:|---:|
| `1792089033436125000` | MiddleShapes, ShapeEq0–2 | 4 | 3 | 30 | 544 |
| `1792089246876020000` | ShapeEq3–5 | 3 | 3 | 0 | 545 |
| `1792089435116988000` | MiddleRawDef, MiddleCanonical | 2 | 1 | 1 | 569 |
| `1792089604510364000` | MiddleBase0–3, MiddleValue0_0–3_2 | 16 | 12 | 180 | 2 |
| `1792089919583268000` | MiddleGap1_0–1_8 | 9 | 90 | 45 | 3 |

These groups contain 34 distinct new targets and do not overlap the five new direct targets. Definition-only targets remain part of the replay scope.

The final compiled new mathematical scope is 44 modules, 172 theorems and 285 definitions. Five modules have no successful replay: MiddleGap3_1, 3_2, 3_3, 3_4 and MiddleLowDirectM722, containing 53 theorems and 26 definitions. MiddleLowDirect has a retained direct timeout. None of these five modules occurs in a successful replay's imported source base, so they are not hidden assumptions in the completed target checks.

## Snapshot and axiom qualifications

Archived validation/final-check files report 30 new replayed modules and 14 unreplayed modules. The later retained nine-gap union succeeds for nine of those 14 and adds 90 theorems/45 definitions, producing the 39-new-module scope above. The saved validation snapshot itself remains unchanged and must not be described as already accepting that later receipt. Parent chronology determines exact finalizer/index/deadline membership.

Two completed audit builds are retained: OnsetAuditM722 prints 356 names and FinalAuditM722 prints 171. Ten names overlap, yielding 517 unique axiom-closure requests. They cover the 346 inherited recovery theorems and 171 of 172 newly compiled theorem names. `middle_low_directM722` is the sole new compiled theorem absent from completed audit-source commands. The LowDirectAudit source is not counted as a completed audit merely because it exists. Audit modules are not replay targets.

The 517 audited names include 52 theorem declarations in the four compiled but unreplayed MiddleGap3 modules. Thus axiom-audit coverage is broader than successful replay coverage; it does not turn those modules into replay successes. The remaining LowDirect theorem has neither successful replay nor completed axiom-audit evidence here.

## Static imported-base checks

Every inspected direct/union attempt has a target-free transitive local source base: no selected module or selected explicit declaration name is imported. No explicit target names are duplicated within checks or across all 50 successful targets, and no source import cycle was found. Inherited graph nodes match before103 hashes. Every new worker103 module occurring in a successful check's base has its own separate successful replay. Such modules are still imported assumptions within that particular invocation.

External Mathlib source boundaries were recorded rather than independently scanned. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom` or `skipKernelTC` token. Historical source graphs and explicit names do not independently establish binary import tables or private/generated names.

## Drivers, wrapper changes and trust limits

Before103 driver hashes equal the established baseline, and neither driver appears in the controller change set. ReplayKnown6d2c is SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; ReplayBatch07F1 is `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, also cited by all union receipts.

The recovery runner is identical to worker102's after request-ID substitution: sequential direct checks with 300-second limits, source bytes captured before each run, receipts timestamped afterward, no source snapshot or driver/object digest. The union wrapper now uses 160 seconds and explicitly sets TMPDIR under its evidence/work directory; its source hashes precede execution, matching successful builds are required, and driver hashing follows execution. The validator adds an absolute 2026-10-15 18:43:00 UTC deadline only for build mode on modules listed in middle-inventory.json. These are scheduling/capture changes, not changes to the Lean replay algorithm. Exact wrapper hashes are in the evidence JSON.

Selected safe nonpartial declarations reach kernel replay relative to imported binaries. Imports remain assumed, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate imported-theorem metadata can bypass proof-body comparison; no corresponding explicit-source target contamination was found. Pending dependency state is not a proof assumption. These records do not prove loaded object bytes/times, a fresh rebuild of inherited sources, or an independently enforced allowed-axiom policy. No worker104 results or later source versions are credited here.

Evidence: `markov_worker_000103_replay_method_evidence.json`, SHA256 `2adc3c32692ccc00a07d69df7381d9919a9834d0650efb73bbcfe80495459250`, includes exact check/target lists, archived source hashes, graph checks, audit lists, snapshot differences and 174 directly read input hashes. Historical inherited source hashes are transitively bound through predecessor evidence files.
