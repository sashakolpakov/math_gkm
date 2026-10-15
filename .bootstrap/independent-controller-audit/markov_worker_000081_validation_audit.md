# Worker 000081 validation audit

Read-only static audit of completed, timed-out request `53d5229e9f134234a21bc350e491d476` in `/Users/sasha/math_gkm`. No project code, Lean, replay, experiment or finalizer was executed; no project/archive file was changed and no successor was inspected. Mathematical scope is audited separately.

**The retained records support compilation and alternate kernel replay of all 21 new mathematical modules, containing 76 named theorems, plus the final axiom-audit module. Finalization completed before the deadline. Worker 80's previously unreplayed two-band source now has a successful individual replay.** The host still recorded a timeout without a final response; this is not a fresh whole-source rebuild or root-resolution certificate.

## Hash and receipt binding

All **162** controller `receipt.json` after-hashes match both current files and the worker-81 `artifacts/` archive. All **159** entries in `evidence/markov-53d5229e/artifacts.json` also match current files, archive and controller. `artifact-verification.json` reports 159 verified and zero failures, agreeing with this independent static comparison. No current worker-81 evidence/research file lies outside the controller archive. All 23 `*53D.lean` sources are covered, including the final audit and inherited audit.

The three controller changes outside the 159-entry manifest are the manifest itself, its verification file, and the old late worker-80 union receipt `evidence/markov-07f1d410/kernel-union-1792051911627555000.json` (SHA-256 `13530b05854227766d621842b84fc17c6e41719b661394581bf4c0fa98c276cd`). That receipt is now archived under worker 81; the worker-80 archive boundary remains unchanged.

There are **37 ordinary validation receipts**:

| Result | Count | Meaning |
|---|---:|---|
| Successful build | 24 | 21 mathematical modules, final Audit, superseded Audit and InheritedAudit |
| Successful individual replay | 4 | TailShape53D, TailPolygon53D, final Audit53D and predecessor TwoBandsSource07F1 |
| Failed build | 4 | Superseded attempts |
| Timed-out build | 5 | Superseded attempts |

The final validation selects 22 matching successful builds: 21 mathematical modules plus Audit. Four further successful union receipts select **19 disjoint new mathematical modules**, in groups of 7, 6, 2 and 4. Together with the individual TailShape/TailPolygon replays, this covers all 21 new mathematical modules. The final Audit has its own successful individual replay.

Every ordinary receipt's source digest equals its saved snapshot. Every final selected build/replay source digest equals the current archived source. All 37 ordinary receipt payloads match their completed controller event payloads, allowing the validator's documented 6,000-character stdout/stderr truncation in event output. The four union receipts likewise match completed events (lines 136, 199, 219, 221), all with return code 0 and `replay union passed`. Each target's successful final build precedes its union invocation. Final object bytes are bound by manifest, current/archive/controller hashes and this chronology. The wrappers do not record invocation-time object digests.

## Predecessor status and axioms

`run-MarkovTwoBandsSource07F1-replay-1792052403931742000.json` is a successful **new individual ReplayKnown replay**, lasting 43.960888416 seconds, of source SHA-256 `bfc810c1595d3cd18611995a2dd825d530c95bec0cb923594762b275e806f949`. Its source/snapshot matches worker 80's successful final build. The original build receipt, snapshot, source and object each match worker-80 controller/archive, worker-81 before-state and current bytes. The object SHA-256 is `d802441fd41af62da302413679e2635ae1a3135d2e6c4c9faa01638428cd5d25`. Thus the prior missing replay is completed by this record, independently of the new groups.

The final compiled `MarkovAudit53D` prints **all 76 named new theorem axiom closures**, exactly matching source declarations, inventory, `#print axioms` requests and `validation.json`. Every closure uses only `propext`, `Classical.choice`, and/or `Quot.sound`; none contains an extra axiom. This is direct coverage, not a count inferred from 76 transitive dependencies.

`MarkovInheritedAudit53D` separately compiled and printed the 72 theorem closures from worker 80's earlier 39-module inventory. It is not selected as new mathematical progress and has no individual replay receipt. It excludes worker 80's final three-theorem TwoBandsSource module. The latter's original matching build prints two top-level closures; its third theorem is called by the printed two-band lemma. Do not describe the inherited audit as 75 individually printed predecessor closures.

Worker 81's fresh inherited 39-module union attempt is separately recorded in `inherited-union-replay.json` as a **150.239250916-second timeout**, not a pass; its target list excludes TwoBandsSource. Worker 80's earlier late 39-module success is a different process/receipt, completed after worker 80's cutoff and now captured by worker 81. Prose saying worker 80 “left no receipt” is accurate only with the old archived-cutoff qualification, not as a statement about all retained files now.

## Replay method and boundary

The drivers remain unchanged against the worker-81 before-state:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` (also matches its worker-80 archive and preservation record).

These are alternate Lean replay procedures using pinned Lean 4.32.2, not invocations of the official `leanchecker` CLI. ReplayKnown uses the previously audited per-module replay body; ReplayBatch collects all constants in each selected module's most-private available object part into one map, removes selected names from direct imports and calls `env.replay`. It is not restricted to the named theorem list. Lean.Replay calls the kernel for safe nonpartial declarations; unsafe/partial declarations are skipped, axioms are admitted as axioms, and already imported equal theorems can be skipped without comparing proof bodies. The separate axiom audit matters. Dependency recursion does not supply unfinished proofs as assumptions.

The delegated static method audit finds no selected-module contamination through source imports, duplicate explicit target names, imported target-name collision or source cycle for any of the four groups. Their local base-source closures have 126/133/179/131 modules and retain 1/7/16/5 earlier worker-81 modules respectively. The two-module group imports TwoBandsSource07F1 as a dependency; that fact alone would not replay it. Its separate individual receipt does.

The source graph check is not a dump of actual binary import/private/generated-constant inventories. Four Mathlib imports remain outside its local source traversal, and imported compiled dependencies remain the trust boundary. Union wrappers hash target sources **after** subprocess completion and do not include a driver digest in each receipt. Here the preserved before-state, unchanged driver, controller snapshots, successful-build ordering and final object hashes support the binding; they do not constitute per-invocation object measurements or a fresh whole-tree rebuild. See the companion method note for the exact limits.

## Finalization and timing

The finalizer's single retained invocation completed successfully at controller event lines 245–246. It reports 21 modules, 76 theorems, no exclusions, no missing replays, 159 artifact hashes, 259 preserved inputs and nine unsuccessful ordinary receipts. The 259 final preservation checks and 343 initial reconciliation checks all still match their expected hashes. The separate inherited-union timeout is not part of those nine ordinary failures/timeouts.

The validation file was written at **2026-10-15 08:40:22.672890 UTC**; manifest verification at **08:40:25.032244**; the final completed-event log mtime is **08:40:25.062383**, **29.445701 seconds before** the **08:40:54.508084** deadline. All ordinary validation attempts finished earlier; the final Audit replay ended at approximately 08:40:17.745298. The host recorded `timeout` at **08:41:01.616671**, elapsed 1807.108588 seconds. There are no unmatched started items. There is no `turn.completed`, controller `final.json`, or controller report, although a local evidence `report.json` was written and archived. No worker-81 late/unarchived artifact was found.

Companion evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000081_validation_evidence.json` contains exact per-file comparisons, records, event lines, times and **944 input hashes**, all rechecked stable at 2026-10-15 09:04:49 UTC. Method note: `/private/tmp/math_gkm_godel_20261013/markov_worker_000081_replay_method.md`; its evidence stores another 190 input hashes/source graphs. No missing checks were completed by this audit.
