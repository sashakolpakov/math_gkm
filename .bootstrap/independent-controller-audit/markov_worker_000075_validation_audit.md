# Worker 000075 validation audit

Read-only validation audit of completed request `6905e489e1b94101b2cfdfbd54247a99` on 2026-10-15. No project code was run or imported, no Lean or experiments were rerun, no project files were changed, and no active successor was inspected. Mathematical interpretation is covered separately by the requesting auditor.

**All final validation bindings checked here agree.** The saved evidence contains **13 successful source builds and 13 successful alternate-driver replays**: twelve mathematical modules plus `MarkovAudit6905`, which contains imports and axiom-print commands rather than additional mathematical theorem declarations. All 26 selected records return zero, with no timeout and empty stderr. Each replay prints the expected module's begin/pass messages. Every selected current source hash agrees with its validation index, build and replay receipts, and both source snapshots. Commands name pinned Lean 4.32.2 and the expected source/object/module.

| Module | Named theorems |
|---|---:|
| `MarkovTriplePatterns6905` | 11 |
| `MarkovCyclicPatterns6905` | 6 |
| `MarkovProjectionJet6905` | 7 |
| `MarkovCubicClusters6905` | 8 |
| `MarkovCubicCycle6905` | 3 |
| `MarkovCubicSource6905` | 6 |
| `MarkovBooleanJets6905` | 4 |
| `MarkovCyclicMoments6905` | 6 |
| `MarkovThirdMoments6905` | 3 |
| `MarkovMomentSums6905` | 4 |
| `MarkovSourceMoments6905` | 3 |
| `MarkovPermutationMoments6905` | 3 |
| `MarkovAudit6905` | 0 |

All **115 indexed artifacts** agree across current bytes, worker archive bytes, controller receipt after-hashes and manifest expected hashes. Saved verification has exactly those 115 matching entries and no failures. The manifest and verification file themselves also match controller/archive hashes, giving **117 of 117 controller artifacts** agreeing. This covers all thirteen final objects, source files, successful and rejected receipts/snapshots, and final reports/scripts. All **99 preservation rows** agree between saved expected/actual hashes and current bytes. The 92 rows represented in the controller-before inventory also match it; the other seven lack entries there, rather than conflicting with entries. Pinned root and contract hashes remain unchanged; canonical contract digest matches the request.

**Retries are correctly distinguished.** There are 34 validation receipts in total: 26 successes and eight build failures, all return code one without timeout. The failures are `MarkovBooleanJets6905` (three), `MarkovCubicCycle6905` (two), `MarkovProjectionJet6905`, `MarkovCubicClusters6905`, and `MarkovThirdMoments6905` (one each). All eight failed snapshots differ from their current sources, and every failure precedes that module's successful final-source build and replay. The operational rejection inventory exactly matches these eight records. All 34 receipts exactly match their JSON payloads in the controller events and their corresponding snapshot hashes; none is silently counted as a pass.

The interrupted worker 72 source `research/MarkovTriplePatterns5fcf.lean` is preserved at SHA-256 `43f969d84a9affde2e141507e4186d9acc0b16cc58e3aef9b279ae750891f20b`. It is **not** a selected passing module. Worker 75's repaired `MarkovTriplePatterns6905.lean`, SHA-256 `8044971653b2278c1db330009f5ba90c8408177833392e6142cdb472c31ece5d`, has its own successful new build (`1792041066679291000`) and replay (`1792041169350246000`) receipts. It imports `MarkovAdjacency446`; no new module directly imports the failed `MarkovTriplePatterns5fcf`. Retained worker 72 failures are preservation evidence, not new validation successes.

**Axiom coverage is complete for the 64 named theorem declarations.** Independently extracted source names, the saved inventory, all 64 audit-source requests, all 64 axiom lines in the successful audit build, and the final validation axiom map match exactly, without duplicates. Every printed closure is a subset of `{propext, Classical.choice, Quot.sound}`. Static token inspection of the mathematical sources after comment removal finds no `sorry`, `admit`, `native_decide`, `axiom`, `unsafe`, or `debug.skipKernelTC`. Unlike worker 71's smaller set of printed transitive closures, worker 75 prints each named theorem individually.

The alternate driver `research/ReplayKnown6d2c.lean` is unchanged from the controller-before baseline: SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Its previously audited per-module body uses Lean's replay/kernel path; its explicit-module operational CLI remains distinct from official `leanchecker` CLI invocation. **No official-CLI receipt is established here.** The validator prepends the current evidence directory to inherited `LEAN_PATH`, reusing compiled imports. Audit-module replay does not itself recheck the proofs of every imported module; the twelve separate module replay receipts supply that recorded coverage for the new mathematical modules. This is not a fresh whole-source rebuild/replay of the inherited environment.

The controller records start **05:09:50.074574 UTC**, finish **05:36:38.532962 UTC**, elapsed **1608.458388 seconds** against 1800 seconds: **191.541612 seconds before the deadline**. Every receipt timestamp plus its recorded duration lies within the controller interval; these are approximate invocation times, not separate event timestamps. All 93 started items have completion events in the 200-line event stream. The single finalizer invocation succeeds at event line **198**, reporting 13 modules, 64 theorems, eight rejected runs, 115 artifacts, 99 preservation checks and `completion: null`. Final report and turn completion follow at lines 199–200. There is no failed finalizer or unresolved started event. Checkpoint wording that finalization remained outstanding is resolved by this later successful finalizer record; no corresponding pending action remains in the saved stream.

Individual run receipts bind source snapshots, but **do not hash object bytes at invocation time**. Final object binding therefore rests on the final manifest/controller/archive agreement plus recorded successful build/replay chronology. This audit does not add an independent kernel execution or a live process check. Controller outcome is `completed`, return code zero, `mathematical_resolution: false`; full root closure remains unresolved.

Supporting record checks and input hashes: [markov_worker_000075_validation_audit_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000075_validation_audit_evidence.json).
