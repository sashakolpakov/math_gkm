# Worker 000076 validation audit

Read-only audit of completed request `adb2c7b044ee463584f90512a565fe95`, performed 2026-10-15. No project code was executed or imported, no Lean or experiments were rerun, no project files were changed, and no active successor was inspected. Mathematical scope is audited separately by the requesting auditor.

**No final validation-binding discrepancy was found.** There are **14 successful source builds and 14 successful alternate-driver replays**, covering thirteen mathematical modules plus `MarkovAuditADB2`. All 28 selected receipts return zero, with no timeout and empty stderr; replay output names the expected module and reports success. Their current source hashes agree with the validation index, successful build/replay receipts and both saved source snapshots. Commands name pinned Lean 4.32.2 and the expected source/object/module. The audit module adds no mathematical theorem declarations.

| Module | Named theorems |
|---|---:|
| `MarkovBooleanCyclicADB2` | 3 |
| `MarkovCyclicLocalBridgeADB2` | 8 |
| `MarkovFirstTwoCyclicADB2` | 2 |
| `MarkovInteriorADB2` | 1 |
| `MarkovLocalTelescopingADB2` | 7 |
| `MarkovRunCubicADB2` | 10 |
| `MarkovSmallCycleADB2` | 3 |
| `MarkovSmallMomentsADB2` | 2 |
| `MarkovSourceCubicADB2` | 6 |
| `MarkovThirdChambersADB2` | 2 |
| `MarkovThirdLowSourceADB2` | 3 |
| `MarkovThirdRunPolynomialADB2` | 4 |
| `MarkovThreeRunCorrectionADB2` | 2 |
| `MarkovAuditADB2` | 0 |

All **121 manifest entries** agree across current bytes, archived bytes, controller receipt after-hashes and manifest expected hashes. Saved `artifact-verification.json` records 121 checks and `all_match: true`, and its manifest digest exactly matches the retained manifest. Both files themselves also match their controller hashes and archived bytes: **123 of 123 controller artifacts agree**. This covers the fourteen final object files, sources, accepted/rejected snapshots and receipts, finalizer repair record, scripts and reports. All **129 preservation rows** agree between saved expected/actual hashes and current bytes; all 122 rows represented in the controller-before inventory also agree with it. The other seven lack entries there rather than conflicting with entries. Pinned root and canonical contract hashes agree with the request.

The `run-*.json` glob has 37 matches, but only **36 are validation receipts**; `run-chamber-symbolic.json` is a 36-element experiment list. The actual receipts comprise the 28 successes and **eight rejected builds**, all return code one and none timed out. Failures belong to `MarkovCyclicLocalBridgeADB2` (one), `MarkovInteriorADB2` (two), `MarkovSmallCycleADB2` (one), `MarkovSourceCubicADB2` (two), and `MarkovThreeRunCorrectionADB2` (two). Every failed snapshot differs from its current source and precedes that module's final successful build and replay. The operational rejection inventory matches exactly. All 36 receipt payloads exactly match controller events and saved snapshot hashes. Error-recovery axioms visible in rejected build output are not treated as accepted theorem evidence.

**All 53 named theorem declarations are individually covered by the axiom audit.** Extracted source module/name pairs equal the inventory; the 53 audit-source requests, 53 successful saved print results and validation axiom map agree exactly without duplicate names. One theorem, `endPair_appendADB2`, has an empty axiom closure; every other printed closure is a subset of `{propext, Classical.choice, Quot.sound}`. Static source inspection after comment removal found no `sorry`, `admit`, `native_decide`, `axiom`, `unsafe`, or `debug.skipKernelTC` in these mathematical modules.

The replay driver is unchanged from the controller-before baseline: `research/ReplayKnown6d2c.lean`, SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Its previously audited body uses Lean's replay/kernel path with explicit module selection. These are **alternate-driver records, not official `leanchecker` CLI receipts**. The validator places the current evidence directory first on inherited `LEAN_PATH`; imported compiled environments are reused. The audit module's own replay does not independently replay imported proofs; the thirteen separate mathematical module receipts establish the recorded new-module coverage. No fresh whole-source rebuild/replay of inherited dependencies is established.

**The finalizer repair leaves no unresolved recorded partial effect.** At event **223**, the first invocation failed with `TypeError` while adding a receipt field to the list-valued `run-chamber-symbolic.json`. The traceback and script ordering place this failure in initial input collection, before the first output write. The patch completed at event **225** and added dictionary/source/mode filtering. The second invocation succeeded at event **227**, reporting thirteen mathematical modules, 53 theorems, eight rejected builds, 121 artifacts and preserved inputs. The final repair record and all final outputs match archive/controller bytes. Final report and turn completion follow at events 228–229. No earlier finalizer output was partially committed by the failed invocation.

The controller records start **05:36:45.460876 UTC**, finish **06:06:37.857149 UTC**, elapsed **1792.396273 seconds** against 1800 seconds: **7.603727 seconds before the deadline**. Every validation filename timestamp plus its saved duration lies within this interval; these are approximate invocation times, not separately timestamped events. The final audit replay completed at event 221 before both finalizer attempts. All **107 started items** have completion events in the 229-line stream. Thus the retained successful finalizer, report and manifests precede the controller's completed receipt; there is no unfinished recorded validation/finalizer action or evidence of a post-deadline result being counted.

Individual invocation receipts bind source snapshots but **do not hash object bytes at invocation time**. Final object binding rests on manifest/controller/archive agreement and successful recorded chronology. This audit adds neither independent kernel execution nor a live process check. Controller outcome is `completed`, return code zero, `mathematical_resolution: false`; full root closure remains unresolved.

Supporting checks and input hashes: [markov_worker_000076_validation_audit_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000076_validation_audit_evidence.json).
