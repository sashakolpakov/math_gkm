# Worker 000083 validation audit

Read-only static audit of completed request `fd72158c01ce41b48a159a8c0359decb` in `/Users/sasha/math_gkm`. No project code, Lean, replay, experiment or finalizer was executed. No project/archive file was changed, no missing check was completed and no successor was inspected. Mathematical scope is audited separately.

**All 32 final mathematical modules and the Audit module have matching successful build and alternate kernel-replay records. The final compiled audit directly prints all 281 named theorem axiom closures, using only permitted axioms. The finalizer and final response completed before the deadline. No final binding discrepancy was found.** These are retained local checks over inherited compiled dependencies, not a fresh whole-source rebuild or root-resolution certificate.

## Hash binding and accepted records

All **191** controller `receipt.json` after-hashes equal both current files and worker-83 archive bytes. All **189** entries in `artifacts.json` additionally equal the current/archive/controller hashes. `artifact-verification.json` reports 189 verified and no failures, agreeing with this independent static comparison. Only the manifest and verification file themselves are omitted from the manifest. All 33 final mathematical/audit sources and their objects are covered. No current worker-83 source/evidence file is outside the archive, and no later mutation was found among these files.

The **44 ordinary validator receipts** comprise exactly 33 successful builds, ten failed builds and one successful individual replay; there are no timeouts. Each final module has one successful build, so there are no redundant successful build versions. The ten rejected attempts belong to the SmallPoly2/3 and SmallCycles2/3 modules; every affected final source has a later successful matching build.

Five successful union receipts cover all **32 mathematical modules exactly once**:

| Receipt suffix | Targets | Completed event |
|---|---:|---:|
| 1792056444552502000 | 4 | 149 |
| 1792056556780734000 | 11 | 165 |
| 1792056661004659000 | 11 | 181 |
| 1792056724230615000 | 3 | 187 |
| 1792056881560243000 | 3 | 207 |

Every union records return code 0 and `replay union passed`. The Audit separately passed `ReplayKnown6d2c`, recorded in `run-MarkovAuditFD-replay-1792056949640473000.json` and controller event 216.

All 44 ordinary source digests match their retained snapshots. Every selected successful build and replay digest matches the final current/archived source. Every ordinary and union receipt matches its completed controller-event payload, allowing the validator's exact stdout/stderr prefix truncation at 4,500 characters. The batch's 18 successful module entries agree with their individual final build receipts; batch membership does not substitute for those receipts.

All final target builds completed before their union invocation. The union wrapper also explicitly checks for a successful build with the same source digest before launching replay. Final object bytes are bound by manifest/current/archive/controller hashes and this chronology. Invocation-time object digests are not recorded.

All **110** final preservation checks and **23** initial reconciliation checks still match. The separately recorded verification of worker 82's 127-entry manifest was independently rechecked against current bytes, also with zero mismatches. These checks overlap and should not be summed as distinct preserved files. The pinned root and canonical contract digest remain unchanged.

## Complete named-theorem coverage and residual status

The 281 source theorem names equal the inventory, the Audit module's 281 explicit `#print axioms` requests, the full successful Audit build output and `validation.json`. All printed lists are subsets of `propext`, `Classical.choice`, `Quot.sound`; none contains an extra axiom. This is direct coverage of all 281 named theorems, not a count inferred from a few top-level closures. The Audit source/build/replay share SHA-256 `477cb5a8d3525ab73741634ae7c3d4e6a95900175ec325da9dd248847d5ad495`.

`MarkovResidualFD` is explicitly targeted in the final three-module union. Source SHA-256: `3a83bd555efdd19e8b1a2d39fd4f08cd04995835ec2f204fb1d4ddc581cf5989`; object SHA-256: `5adc0b7f7be26bbc436b3c61c23058857ac189f338e95bf3eae1cc1d0bccab6d`. Its successful build is `run-MarkovResidualFD-build-1792056778981497000.json`; its replay is `kernel-union-1792056881560243000.json`. `root_iff_interiorFD` is printed both by that build and in the final Audit. Its statement is `Conjecture63 ↔ Interior63FD`; the module does not prove the residual proposition itself. The controller's `mathematical_resolution` is false and the final report's `completion` is null.

## Replay method and trust boundary

Both unchanged drivers match the worker-83 before-state:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

All five union receipts also carry the latter driver hash. Unlike workers 81–82's group wrappers, worker 83's wrapper hashes target sources **before** replay, asserts a successful matching build, then records the driver digest **after** replay. This restores the earlier worker-80 wrapper procedure, with the timeout changed from 180 to 150 seconds and a new evidence path. All pre-replay target digests match the final archived sources.

These are alternate replay procedures, distinct from ordinary compilation and the official `leanchecker` CLI. The batch driver collects all constants from each selected object's most-private available part, removes selected module names from direct imports and invokes `env.replay`. Targets include helper definitions and compiler-generated declarations, not only the 281 explicit theorem names. Lean.Replay invokes kernel declaration checks for safe nonpartial declarations. Unsafe/partial declarations are skipped, axioms are admitted as axioms, and an already imported equal theorem can skip proof-body comparison. The separate axiom audit remains relevant. Pending dependency recursion does not supply unfinished proofs as assumptions.

The delegated static audit finds no selected-module import contamination, target/base explicit-name collision, duplicate target name, source import cycle, forbidden-token occurrence or retained-source baseline mismatch. The five target sets contain 32 modules, 281 explicit theorems and 33 definitions. Local imported base-source closure sizes are **123/125/125/222/350**, containing **0/2/2/26/29** earlier worker-83 modules respectively. The last group explicitly includes the residual definitions and theorem, rather than importing that module as an unchecked dependency.

The source graph and explicit-name audit does not inspect actual compiled import tables or private/generated-constant inventories. External Mathlib imports and inherited compiled objects remain the trust boundary. Before-state hashes, receipt driver hashes, source snapshots, ordering and final object bindings support the retained record; they do not establish invocation-time object measurements or a fresh rebuild of all imports. The companion method note records these limits.

## Finalization, repairs and timing

The only retained finalizer invocation is controller events **224–225**, successful with 32 modules, 281 theorem closures, 189 artifact hashes, 110 preserved inputs and ten failed build receipts. There is no failed or interrupted finalizer attempt. A separate `documentation-repair.json` records a rejected documentation patch and later corrected patch; this is not a mathematical-validation or finalizer failure. The final documents and repair record are manifest-bound.

Validation was written at **2026-10-15 09:37:07.293955 UTC**, preservation at **09:37:07.336070**, and manifest verification at **09:37:07.619799**. The last is **236.084674 seconds before** the **09:41:03.704473** deadline. The Audit replay had already completed. The final agent JSON appears at event **226**, followed by `turn.completed` at **227**. `final.json` exists and equals both that final agent JSON and the controller report. The evidence `final-report.json` is a separate, more detailed wording and is independently hash-bound.

The controller outcome is **completed**, finishing at **09:37:37.283641 UTC**, elapsed **1593.579169 seconds**, with 206.420832 seconds remaining before deadline. There are no unmatched started items, unfinished replays, missing finalization outputs, or late/unarchived worker-83 files.

Companion evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000083_validation_evidence.json`, containing exact file/receipt/event/chronology comparisons and **541 input hashes**, rechecked stable at the timestamp recorded there. Method note: `/private/tmp/math_gkm_godel_20261013/markov_worker_000083_replay_method.md`; its companion JSON includes 364 input hashes and source-closure graphs. This audit performed no missing research checks.
