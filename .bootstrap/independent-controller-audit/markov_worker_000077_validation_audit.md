# Worker 000077 validation audit

Read-only audit of request `8bbb934ec26943b7821334f3647f77cf`, performed 2026-10-15. No project code was executed or imported, no Lean or experiments were rerun, no project files were changed, and no active successor was inspected. Mathematical scope is covered by the requesting auditor.

**The controller turn timed out, but a complete finalizer result and validated mathematical artifacts were retained.** `validation.json` selects **fourteen mathematical modules plus `MarkovAudit8BBB`**, each with a successful build and an alternate-driver replay matching its final source. All 30 selected receipts return zero with no timeout and empty stderr; replay output names the expected module and reports success. The current source, index hash, selected receipt hashes and source snapshots agree. Each selected replay's start event follows its selected build's completion event. The audit module adds no mathematical theorem declarations.

| Accepted module | Named theorems |
|---|---:|
| `MarkovInterior8BBB` | 1 |
| `MarkovThirdAllCycles8BBB` | 3 |
| `MarkovThirdCorrectionSupport8BBB` | 1 |
| `MarkovThirdOneBridge8BBB` | 3 |
| `MarkovThirdOneHigh8BBB` | 8 |
| `MarkovThirdOneJets8BBB` | 8 |
| `MarkovThirdOneLarge8BBB` | 2 |
| `MarkovThirdOneLow8BBB` | 8 |
| `MarkovThirdOneMidHigh8BBB` | 8 |
| `MarkovThirdOneMidLow8BBB` | 8 |
| `MarkovThirdOneSeq8BBB` | 1 |
| `MarkovThirdOneSmall8BBB` | 7 |
| `MarkovThirdTwoThirds8BBB` | 2 |
| `MarkovTwoRunCorrection8BBB` | 6 |
| `MarkovAudit8BBB` | 0 |

All **155 manifest entries** agree across current bytes, archived bytes, controller receipt after-hashes and expected manifest hashes. `artifact-verification.json` records 155 checks, `all_match: true`, and the correct retained-manifest digest. The manifest and verification file themselves also match controller/archive bytes: **157 of 157 controller artifacts agree**. This covers fifteen final object files, all eighteen source files, accepted and rejected records, reports and scripts. Inclusion of the three draft sources in the manifest only preserves their bytes; it does not validate their mathematics. All **135 preservation rows** agree between saved expected/actual hashes and current bytes; the 128 represented in the controller-before inventory also agree with it. Seven lack baseline entries rather than conflicting with entries. Root and canonical contract hashes remain correct.

**The exact receipt inventory is 46:** 30 selected successes, three additional successes, ten failed builds with return code one, and three timed-out builds without a return code. All 46 saved receipt payloads match their controller event payloads and corresponding snapshot hashes. The operational rejection list matches all thirteen rejected attempts. Nine failed builds on accepted modules were subsequently repaired under changed source hashes: `MarkovThirdOneBridge8BBB` (three), `MarkovThirdOneJets8BBB` (three), `MarkovThirdOneSmall8BBB` (one), and `MarkovTwoRunCorrection8BBB` (two). Their final successful build/replay records are later than those failures and match current source bytes.

The three **unaccepted** modules are:

- `MarkovThirdInteriorShape8BBB`: one earlier failed build, then two current-source timeouts at approximately 120.276 and 180.230 seconds; no successful build or replay and no object file in the worker evidence directory.
- `MarkovThirdInteriorFast8BBB`: one current-source timeout at approximately 120.438 seconds; no successful build or replay and no object file.
- `MarkovThirdInteriorTransfer8BBB`: no validation receipt and no object file; retained only as a draft.

These modules are explicitly excluded by `audit_8bbb.py`, the final inventory and validation index. Their theorem declarations are outside the 66 accepted theorem closures.

**The final audit has 66 individually printed permitted theorem closures.** Extracted source module/name pairs equal the inventory. All 66 audit-source requests, all 66 print results in the selected successful audit build and the final validation axiom map agree, with no duplicate names. Every closure is a subset of `{propext, Classical.choice, Quot.sound}`. Static inspection after comment removal finds no `sorry`, `admit`, `native_decide`, `axiom`, `unsafe`, or `debug.skipKernelTC` in the accepted mathematical modules. Rejected build output is not accepted axiom evidence.

The **three extra successful records all concern the audit module**. Its old build `1792045403833884000` and replay `1792045510484792000` refer to an older audit source hash and are not selected. A replay of the final audit source was launched at event 261 (`1792046141498456000`) before the final audit build completed at event 262. It returned success at event 263, but its source snapshot alone cannot establish which object version it loaded. The worker recorded this issue and repeated the replay: selected replay `1792046164584939000` starts at event **264**, after the final build's confirmed completion, and succeeds at event **267**. The finalizer correctly selects that later replay. All other selected build/replay pairs also have the required event order.

The alternate driver `research/ReplayKnown6d2c.lean` is unchanged from the controller-before baseline: SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Its previously audited body uses Lean's replay/kernel path with explicit module selection. These are alternate-driver receipts, **not official `leanchecker` CLI receipts**. Inherited compiled imports were reused; audit-module replay does not itself replay imported proofs, while the fourteen individual mathematical module replay records provide the saved coverage for these modules. No fresh whole-source rebuild/replay of inherited dependencies is established.

**Finalization and timeout are distinct recorded facts.** The sole finalizer invocation starts at event 270 and completes successfully at event **271**, reporting fourteen mathematical modules, 66 theorem closures, thirteen rejected runs, 155 artifacts and preserved inputs. All finalizer outputs are retained and hash-bound. The 271-line event stream has 129 started items, each with a completion event; there is no pending recorded build, replay or finalizer command. There is nevertheless **no `final.json`, final agent response, or `turn.completed` event**, and the controller receipt classifies the turn as `timeout` with `mathematical_resolution: false` (its process return-code field is zero).

Controller start is **06:06:45.812366 UTC**; the 1800-second deadline is **06:36:45.812366 UTC**; controller finish is **06:36:49.135398 UTC**, elapsed **1803.323033 seconds**, about **3.323032 seconds after deadline**. All 46 validation filename timestamps plus saved durations precede the deadline; the latest selected replay finishes approximately **26.114806 seconds before it**. The last activity record is **06:36:45.599133 UTC**, 0.213233 seconds before deadline, and reports **651,778 bytes**, exactly the complete retained event-file size. The observed event-file modification time is **06:36:27.992473 UTC**. These support retention of the successful finalizer event before the deadline, but individual events carry no wall-clock timestamps, so its precise start/end time is unavailable. The completed artifacts do not change the authoritative timeout classification or supply a missing final response.

Individual invocation receipts hash source snapshots, **not object bytes at invocation time**. Final object binding therefore rests on the final manifest/controller/archive agreement and the recorded successful build/replay chronology. This audit adds neither an independent kernel run nor a live process inspection. No unresolved artifact-binding discrepancy was found; the explicit limitations are the three unvalidated drafts, inherited-environment reuse and the missing completed controller turn/final response.

Supporting checks and input hashes: [markov_worker_000077_validation_audit_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000077_validation_audit_evidence.json).
