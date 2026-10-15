# Worker 000080 validation and replay-method audit

Read-only audit of request `07f1d4107cd9444f9e7c04207d4f33d9`, performed 2026-10-15. No project code was executed or imported, no Lean or experiments were rerun, no missing checks were completed, no project/archive files were changed, and no active successor was inspected. Mathematical interpretation is covered separately by the requesting auditor.

**Forty mathematical modules compiled, but replay coverage and finalization were incomplete at controller cutoff.** Their final sources contain **75 named theorems**. The controller archive retains successful individual `ReplayKnown6d2c` records for fifteen modules and one successful two-module union replay for two additional modules: **seventeen distinct modules have archived completed replay evidence**. A later, successful 39-module union receipt exists only in the current evidence directory; it was written after controller finish and still omits `MarkovTwoBandsSource07F1`. The generated audit and aggregate finalization did not run.

| Evidence category | Exact retained status |
|---|---|
| Final mathematical compilations | 40 successful final-source build records; 75 theorem declarations |
| Ordinary individual replay | 15 successful final-source records, all archived |
| Two-module union replay | One syntax failure followed by one success; both archived |
| 39-module union replay | Started before cutoff; no completion event/archive receipt; later current-only success |
| Final two-band source module | Compiled successfully; no individual or union replay |
| Generated axiom audit | Inventory has 39 modules/72 theorems; Audit source has no build/replay |
| Aggregate finalizer | No invocation; validation/manifests/preservation outputs absent |

The **68 ordinary run receipts** comprise forty successful builds, fifteen successful individual replays, eleven failed builds and two timed-out builds. All are archived, bind the recorded Lean source snapshots, and agree with current successful source hashes where selected. Their saved event payloads match either the complete records or the validator's documented 6000-character display prefix. Final successful builds supersede rejected attempts; rejected error-recovery axioms are not accepted evidence. The two timeouts belong to earlier `MarkovSecondOne07F1` and `MarkovSecondSmall07F1` builds; both final sources subsequently compile successfully.

The fifteen individually replayed modules are:

- `MarkovFirstCoefficients07F1`
- `MarkovFirstGap007F1`
- `MarkovFirstGap107F1`
- `MarkovFirstGap207F1`
- `MarkovFirstGap307F1`
- `MarkovSecondShape07F1`
- `MarkovShapeGap007F1`
- `MarkovShapeGap107F1`
- `MarkovShapeGap207F1`
- `MarkovShapeGap307F1`
- `MarkovShapeGap407F1`
- `MarkovShapeGap507F1`
- `MarkovShapeGap607F1`
- `MarkovShapeLC07F1`
- `MarkovShapeParts07F1`

The archived successful union adds `MarkovFirstSource07F1` and `MarkovSecondCoefficients07F1`. Its receipt is `kernel-union-1792051510870884000.json`, return code zero, with matching final-source and corrected-driver hashes and completion event169. The earlier two-module attempt `1792051377127313000` fails at driver parsing and is not accepted. No individual replay receipt exists for either selected union target; their status is specifically union replay.

**The final source composition is a separate status.** Inventory generation completes at event194 and the 39-module replay starts at 195. Only afterward does `MarkovTwoBandsSource07F1` begin its first build, which fails. Its repaired final source compiles at event203, with source hash `bfc810c1595d3cd18611995a2dd825d530c95bec0cb923594762b275e806f949`. It has three theorems: `third_crossing_lc07F1`, `third_two_bands_lc07F1`, and `source_third_two_bands07F1`. The successful build prints permitted closures for the latter two, whose source proofs reference the first. This module is absent from both the inventory and the later39-module union. Thus the stale39/72 inventory is not the final40/75 mathematical source inventory.

**All250 controller-listed artifacts match** their current bytes, archived bytes and controller after-hashes, including all 42 worker-specific Lean files (forty mathematical sources, Audit and replay driver), retained objects, snapshots, receipts and reports. There are zero live/archive/controller differences. The sole extra current worker 80 file is:

`evidence/markov-07f1d410/kernel-union-1792051911627555000.json`

SHA-256: `13530b05854227766d621842b84fc17c6e41719b661394581bf4c0fa98c276cd`.

It is absent from the controller change list and archive and has no completion event in the retained worker stream. The wrapper timestamps union filenames **after execution**, so its suffix is a completion/write time, unlike the start-time suffix used by ordinary build/replay receipts. It reports a successful39-module replay taking 176.130911 seconds, with source hashes and corrected-driver hash matching the current archived source versions. Its completion time is **2026-10-15T08:11:51.627555+00:00**, **68.711966 seconds after controller finish**. This is actual retained evidence of a later reported completion, separately identified; it cannot be relabeled as an in-window archived controller result. Its selection excludes the final two-band source module even if the late result is considered separately.

This audit also rehashed the initial reconciliation's pins, inherited FDDA artifacts and earlier artifact checks: **545 entries match**. These are observer checks, not a completed worker preservation certificate. `inherited-fdda-validation.json` reconciles worker 79's23 mathematical modules plus audit from existing receipts and explicitly excludes its import-only diagnostic. It does not complete the old missing probe replay or rewrite predecessor evidence.

**Axiom evidence is24 printed dependency closures, not 75 individual printouts.** Successful final build records print 24 distinct named theorem closures, all contained in `{propext, Classical.choice, Quot.sound}`. Explicit source-reference chains from those printed theorems reach all 75 current named theorem declarations. This is an observational source dependency check, not a new executed Lean closure query. The generated 72-request `MarkovAudit07F1.lean` has no successful build record, no object and no replay. No claim of a completed aggregate all-name axiom audit is justified. Static source inspection finds no `sorry`, `admit`, `native_decide`, custom `axiom`, `unsafe`, or kernel-skip option in the forty mathematical modules.

**The new replay method calls the actual Lean replay/kernel path, with important limits.** The independent method subaudit confirms `ReplayBatch07F1.lean` loads all name/constant pairs from each requested module's final available object part and unions them into one map; it does not select only theorem names. It removes requested modules from direct imports, deduplicates the remainder, constructs the imported environment at trust level zero, and calls `env.replay`. The underlying safe-declaration path reaches `Kernel.Environment.addDeclCore`/`lean_add_decl`. Imported dependencies are loaded, not freshly rechecked. There is no official `leanchecker` CLI or fresh whole-tree rebuild receipt.

For the successful two-module batch, static local import closure has 138 modules, including fifteen other worker 80 modules. Its boundary is therefore inherited relative to the selected pair, not exclusively pre-worker 80. The39-module batch's local closure has 123 modules, all unchanged from before-run hashes. Neither inspected source closure contains a selected module, explicit target declaration name or source import cycle. No explicit target-name collision was found. This supports absence of a target already present in the imported environment under the retained source/dependency boundary; the records do not dump actual compiled constant/import inventories.

Lean replay skips unsafe/partial constants and admits axioms as axioms; these constructs are absent from the selected mathematical sources. Its duplicate-theorem shortcut compares name/type/level parameters/mutual-block information but does not compare proof bodies. The static import/name check found no route for it to skip explicit target declarations. Union map duplicates would keep the last value, but no explicit name duplicates were found. Pending-dependency cycle bookkeeping does not insert an assumption: ordinary declarations must still pass the kernel against already available declarations. The wrapper records source hashes before replay and the driver hash afterward; it does not capture per-invocation object hashes or a complete compiled declaration inventory. Those limits remain explicit rather than claiming a separate per-declaration witness.

The established driver remains unchanged: `ReplayKnown6d2c.lean` SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Corrected union driver SHA-256 is `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, matching both successful union receipts and the controller archive. Detailed method analysis and source hashes are in [the method audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_replay_method.md).

Controller start is **2026-10-15T07:40:37.633314+00:00**, deadline **2026-10-15T08:10:37.633314+00:00**, finish **2026-10-15T08:10:42.915589+00:00**, elapsed 1805.282276 seconds. The outcome is `timeout`, `mathematical_resolution: false`, process return-code field zero. Every ordinary validation record's timestamp-plus-duration estimate precedes deadline; the latest final build finishes approximately 35.762469 seconds before it. The retained 203-line stream has 97 started items and one unmatched start: union item 100 at event 195. There is no finalizer invocation, structured final report or completed-turn event. The later current-only receipt accounts for a later reported union completion but does not alter the frozen archive boundary. No live process inspection was performed.

`validation.json`, `artifacts.json`, `artifact-verification.json`, `preservation.json` and `operational-observations.json` are absent. Mathematics and correspondence references to `validation.json` are premature. The unresolved validation facts are the unreplayed final source composition, uncompiled aggregate audit, unperformed finalizer, and the distinction between archived and late replay evidence. No missing work was completed by this audit, and no archived byte-binding discrepancy was found.

Supporting checks and input hashes: [validation evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_validation_audit_evidence.json), [method evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_replay_method_evidence.json).
