# Worker 000079 validation audit

Read-only audit of request `fddabb33d2704cfe80b4fa474cf8edc1`, performed 2026-10-15. No project code was executed or imported, no Lean or experiments were rerun, no missing checks were completed, no project files were changed, and no active successor was inspected. Mathematical scope is covered separately by the requesting auditor.

**The 23 mathematical modules and final audit passed their recorded checks, but aggregate finalization failed.** All have matching final-source successful builds and alternate-driver replays. The inventory's additional `MarkovImportProbeFDDA` is a diagnostic file containing nine imports and one `#check`, with no mathematical declarations. It compiled but has **no separate replay receipt**. The finalizer demanded that missing receipt and failed before writing any aggregate outputs. This is a real operational limitation and explains the absent final validation/manifests; it does not erase the retained mathematical-module checks.

| Module | Named theorems | Final-source recorded checks |
|---|---:|---|
| `MarkovAllCoefficientsFDDA` | 2 | Build + replay |
| `MarkovAuditFDDA` | 0 | Build + replay |
| `MarkovExtractAllFDDA` | 1 | Build + replay |
| `MarkovExtractFDDA` | 6 | Build + replay |
| `MarkovImportProbeFDDA` | 0 | Build only |
| `MarkovInteriorSourceFDDA` | 9 | Build + replay |
| `MarkovNormalBandProof0FDDA` | 1 | Build + replay |
| `MarkovNormalBandProof1FDDA` | 1 | Build + replay |
| `MarkovNormalBandProof2FDDA` | 1 | Build + replay |
| `MarkovNormalBandProof3FDDA` | 1 | Build + replay |
| `MarkovNormalBandsFDDA` | 3 | Build + replay |
| `MarkovNormalCombineFDDA` | 1 | Build + replay |
| `MarkovNormalFirstSecondFDDA` | 2 | Build + replay |
| `MarkovNormalJetsFDDA` | 16 | Build + replay |
| `MarkovNormalLocal000FDDA` | 1 | Build + replay |
| `MarkovNormalLocal001FDDA` | 1 | Build + replay |
| `MarkovNormalLocal010FDDA` | 1 | Build + replay |
| `MarkovNormalLocal011FDDA` | 1 | Build + replay |
| `MarkovNormalLocal100FDDA` | 1 | Build + replay |
| `MarkovNormalLocal101FDDA` | 1 | Build + replay |
| `MarkovNormalLocal110FDDA` | 1 | Build + replay |
| `MarkovNormalLocal111FDDA` | 1 | Build + replay |
| `MarkovNormalPartsFDDA` | 3 | Build + replay |
| `MarkovNormalSourceFDDA` | 1 | Build + replay |
| `MarkovNormalSourcePartsFDDA` | 12 | Build + replay |

There are **62 run receipts**: fifty successes, nine failed builds with return code one, and three timeouts. Reconstructing latest successful final-source checks gives **49 receipts**: 46 for the 23 mathematical modules, two for `MarkovAuditFDDA`, and one build for the import probe. The fiftieth success is an older `MarkovExtractFDDA` build on a superseded source hash; its final source has a later successful build/replay pair. All 48 selected mathematical/audit receipts return zero with empty stderr, expected replay-pass output and correctly ordered build/replay events. Their current source hashes, snapshots and records agree. The diagnostic build also matches its final source.

The three timed-out attempts were two `MarkovNormalBandsFDDA` builds (approximately 90.18 and 60.18 seconds) and an earlier `MarkovNormalCombineFDDA` build (approximately 180.22 seconds). The 60-second NormalBands timeout used the same source hash as the later successful build; a timeout is not a proof rejection, and the later success is the retained accepted check. All affected modules have final successful build/replay pairs. No failed or timed-out result is treated as a pass.

**All 194 controller-listed artifacts agree** across current bytes, controller receipt after-hashes and worker archive bytes. This includes the 25 final source files, 25 retained objects, run receipts and snapshots, documentation, scripts, and inventory. There is no worker artifact manifest to compare: `validation.json`, `artifacts.json`, `artifact-verification.json`, `preservation.json` and `operational-observations.json` are absent. This audit independently rehashed the initial reconciliation's 343 checks plus eight pins: **351 current hashes match**; all 344 entries represented in the controller-before inventory also match. The other seven lack baseline entries, rather than conflicting with entries. These are observer checks, not a worker-produced preservation certificate. Root and canonical contract hashes remain correct.

The validator saves complete stdout/stderr in receipt files but prints at most 6000 characters per stream after its display-truncation change. **53 event payloads equal the complete receipts; nine equal their documented display prefixes.** The initial large failed NormalJets output was printed in full. All 62 records are explained by these formats, and the complete receipt files match controller/archive hashes. In particular, the final audit's saved stdout has **6571 characters** although its displayed event output is shortened; the full retained record supplies the complete axiom inventory.

**All 68 named theorem declarations have individually printed permitted axiom closures.** Source module/name pairs, inventory, 68 audit requests and 68 full saved print results agree exactly without duplicate names. Every closure is a subset of `{propext, Classical.choice, Quot.sound}`. The import probe and audit module add no mathematical theorem declarations. Static source inspection after comment removal finds no `sorry`, `admit`, `native_decide`, `axiom`, `unsafe`, or `debug.skipKernelTC` in the inspected final modules. Rejected build output is excluded from accepted axiom evidence.

`research/ReplayKnown6d2c.lean` is unchanged from the controller-before baseline: SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. These are alternate-driver kernel-replay records, **not official `leanchecker` CLI receipts**. The validator reuses inherited compiled imports. The diagnostic probe has no mathematical declarations, but the audit module's successful replay must not be relabeled as the missing separate probe replay. No fresh whole-source rebuild/replay of inherited dependencies is established.

**Finalizer event 258 is a failure, not unfinished execution.** It exits one with `AssertionError: ('MarkovImportProbeFDDA', 'replay')` in the loop selecting accepted records, before its first output write. There is no successful finalizer invocation or aggregate file from a partially completed run. The final audit build completed at event 250; its replay started at 251 and passed at 254. A subsequent checkpoint append at 256 says preservation/manifest checks will follow. The attempted finalizer then fails at 258, the final event. All **123 started items** have completion events, so no recorded command is still pending; the unperformed probe replay and failed finalization remain outstanding work. This audit has not performed either.

**Documentation overstates finalization.** Mathematics lines 74–75 and correspondence line 6 cite a completed `evidence/markov-fddabb33/validation.json`, which does not exist. The checkpoint's statement that “24 mathematical modules” were separately replayed also overcounts: its inventory comprises 23 mathematical modules plus the import-only diagnostic, and that diagnostic was not replayed. The accurate result is successful individual validation of the 23 mathematical modules and final audit, with 68 permitted named theorem closures, but no completed aggregate acceptance index or artifact manifest.

Controller start is **07:07:08.729066 UTC**; deadline is **07:37:08.729066 UTC**; controller finish is **07:37:11.688953 UTC**, elapsed **1802.959887 seconds**, approximately **2.959887 seconds after deadline**. Its authoritative outcome is `timeout`, with `mathematical_resolution: false`, process return-code field zero, no structured `final.json` and no `turn.completed` event. All validation timestamp-plus-duration estimates precede the deadline; the latest audit replay finishes approximately **16.952942 seconds before it**. The last activity timestamp is **07:37:08.113665 UTC**, 0.615401 seconds before deadline, and reports **714,949 bytes**, equal to the complete retained event stream. The observed event-file modification time is **07:36:59.229773 UTC**. These support retention of the finalizer failure before cutoff; individual events have no wall-clock timestamps, so exact finalizer timing is unavailable.

Individual receipts hash source snapshots, not object bytes at invocation time. Final object binding here rests directly on controller/archive hashes and successful recorded chronology; there is no finalizer manifest. This audit adds no independent kernel run or live process inspection. The substantive discrepancy is missing aggregate finalization and inaccurate documentation of it; no retained source/object/controller/archive hash discrepancy was found.

Supporting checks and input hashes: [markov_worker_000079_validation_audit_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000079_validation_audit_evidence.json).
