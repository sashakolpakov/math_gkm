# Worker 000078 validation audit

Read-only audit of request `bdee9a64cacb4562b1d69ef649d7da48`, performed 2026-10-15. No project code was executed or imported, no Lean or experiments were rerun, no project files were changed, and no active successor was inspected. Mathematical scope is covered by the requesting auditor.

**All final validation bindings checked here agree, while the controller outcome remains timeout.** The retained validation selects **eighteen mathematical modules plus `MarkovAuditBDEE`**, each with a successful final-source build and alternate-driver replay. All 38 selected receipts return zero, with no timeout and empty stderr. Each replay reports success for the expected module. Current source bytes, validation source hashes, selected receipts and both source snapshots agree. Every selected replay starts after its corresponding successful build-completion event. The final audit build completes at event 267; its replay starts at 270 and passes at 273. No unselected successful receipt or excluded current `Markov*BDEE.lean` module was found.

| Accepted module | Named theorems |
|---|---:|
| `MarkovRunScalarBDEE` | 4 |
| `MarkovRunJets0BDEE` | 6 |
| `MarkovRunJets1BDEE` | 6 |
| `MarkovRunJets2BDEE` | 6 |
| `MarkovRunJets3BDEE` | 6 |
| `MarkovRunFieldBDEE` | 7 |
| `MarkovThirdClosedBDEE` | 13 |
| `MarkovShapePartsBDEE` | 3 |
| `MarkovShapeGap0BDEE` | 1 |
| `MarkovShapeGap1BDEE` | 1 |
| `MarkovShapeGap2BDEE` | 1 |
| `MarkovShapeGap3BDEE` | 1 |
| `MarkovShapeGap4BDEE` | 1 |
| `MarkovShapeGap5BDEE` | 1 |
| `MarkovShapeGap6BDEE` | 1 |
| `MarkovShapeLCBDEE` | 2 |
| `MarkovThirdInteriorTransferBDEE` | 1 |
| `MarkovShapeBinomialBDEE` | 4 |
| `MarkovAuditBDEE` | 0 |

All **182 indexed artifacts** agree across current bytes, archived bytes, controller receipt after-hashes and manifest hashes. `artifact-verification.json` records 182 checks, `all_match: true`, and the correct retained-manifest digest. Both the manifest and verification file themselves match their controller hashes and archived bytes: **184 of 184 controller artifacts agree**. These include all nineteen final objects, sources, snapshots, successful/rejected receipts, scripts and reports. All **169 preservation rows** agree between saved expected/actual hashes and current bytes. The 162 represented in the controller-before inventory also match it; the other seven have no baseline entry rather than a conflicting entry. Pinned root and canonical contract hashes agree with the request.

The exact validation history is **59 receipts: 38 successes, twenty failed builds with return code one, and one timed-out build**. All 59 receipt payloads match their controller events and corresponding source snapshots. The operational rejection inventory matches all 21 rejected attempts. Every rejected source snapshot differs from its current accepted source, and every rejection precedes that module's final successful build and replay. The timeout is `MarkovRunJets0BDEE-build-1792046578739840000`, approximately 120.208 seconds; a later changed source passed. The early `MarkovThirdClosedBDEE-build-1792047041942326000` failed because `MarkovRunFieldBDEE` was not yet available. That dependent module subsequently passed with the accepted source. No failed or timed-out result is counted as a successful check; no validation invocation is left pending in the event stream.

**All 65 named theorem declarations have individual permitted axiom closures.** Extracted source module/name pairs equal the inventory; the 65 audit-source requests, 65 printed results in the selected successful audit build, and final validation axiom map agree exactly without duplicates. Every closure is a subset of `{propext, Classical.choice, Quot.sound}`. Static inspection after comment removal finds no `sorry`, `admit`, `native_decide`, `axiom`, `unsafe`, or `debug.skipKernelTC` in the accepted mathematical sources. The audit module contributes no mathematical theorem declaration. Error-recovery axioms in rejected build output are not accepted theorem evidence.

`research/ReplayKnown6d2c.lean` is unchanged from the controller-before baseline: SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Its previously audited body uses Lean's replay/kernel path with explicit module selection. These are **alternate-driver receipts, not official `leanchecker` CLI receipts**. The validator places the current evidence directory first on inherited `LEAN_PATH` and reuses compiled imports. Audit-module replay does not itself replay all imported proofs; the eighteen individual module replay records supply the recorded new-module coverage. This is not a fresh whole-source rebuild/replay of inherited dependencies.

**The finalizer succeeded twice, with no failed invocation.** Event **275** records a successful result: eighteen mathematical modules, 65 closures, 21 rejected attempts, 182 artifacts and preserved inputs. Event **276** contains a raw agent status message reporting validation completion. A checkpoint append completes at **278**, after which the finalizer succeeds again at **280**, regenerating hashes to include that update. The retained manifest and verification match the final checkpoint and all final bytes. This is a completed second finalization, not a stale first manifest or pending repair. All **134 started items** have completion events in the 280-line stream.

The controller nevertheless records `outcome: timeout`, `mathematical_resolution: false`, and process return-code field zero. There is **no structured `final.json`, controller report, or `turn.completed` event**. The raw status message at 276 should not be described as absent; it is followed by further tool actions and is not the missing structured final report.

Controller start is **06:36:59.434045 UTC**; deadline is **07:06:59.434045 UTC**; controller finish is **07:07:02.138087 UTC**, elapsed **1802.704042 seconds**, approximately **2.704042 seconds after deadline**. Every validation filename timestamp plus saved duration precedes the deadline; the latest final audit replay finishes approximately **36.179320 seconds before it**. These are approximate invocation timings, not separate event timestamps. The final event-file modification time is **07:06:55.435884 UTC**, approximately 3.998161 seconds before deadline. The last activity timestamp is **07:06:59.680490 UTC**, approximately 0.246445 seconds after deadline, and its byte count **697,771** equals the complete retained event file. Thus successful finalization is retained before controller termination, and file metadata supports a final write before the nominal deadline; the activity record alone cannot establish that bound. Individual finalizer events have no wall-clock timestamps, so exact finalizer start/end times remain unavailable. No validation result recorded after deadline was accepted; the authoritative timed-out controller status is unchanged.

Individual run receipts hash source snapshots, **not object bytes at invocation time**. Final object binding therefore rests on the manifest/controller/archive agreement plus the recorded successful build/replay chronology. This audit adds neither independent kernel execution nor a live process check. No final artifact-binding discrepancy was found; the remaining validation qualifications are inherited-environment reuse, absence of invocation-time object hashes, and the missing completed controller turn/structured final report.

Supporting checks and input hashes: [markov_worker_000078_validation_audit_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000078_validation_audit_evidence.json).
