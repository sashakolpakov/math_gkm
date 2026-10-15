# Worker 000084 validation audit

Read-only static audit of completed request `8833a0fb588547db9bdf18872634da54` in `/Users/sasha/math_gkm`. No project code, Lean, replay, experiment or finalizer was executed. No project/archive file was changed, no missing check was completed and no successor was inspected. Mathematical scope is audited separately.

**All nine final mathematical modules and the final Audit module have matching successful build and alternate kernel-replay records. All 55 named final theorem closures are directly printed and use only permitted axioms. Finalization and the final response completed before the deadline. No source/object/receipt/manifest/archive mismatch was found.** This is retained local validation over inherited compiled dependencies, not a fresh whole-source rebuild or full-root completion certificate.

## File and receipt bindings

All **84** controller `receipt.json` after-hashes equal both current and worker-84 archived bytes. All **82** artifact-manifest entries also equal current/archive/controller hashes. The only controller changes excluded from the manifest are `artifacts.json` and `artifact-verification.json` themselves. The latter reports 82 verified, zero failures. All ten final source/object pairs are covered. There are no current worker-84 files outside the archive; its named temporary directory is empty.

There are **17 ordinary validator receipts**:

| Result | Count | Scope |
|---|---:|---|
| Successful build | 11 | Nine mathematical modules plus earlier and final Audit versions |
| Successful individual replay | 2 | Earlier and final Audit versions |
| Failed build | 4 | TwoTail, TwoCoefficients, TwoSource and ThreeBridge attempts |
| Timeout | 0 | None |

Every failed mathematical attempt is followed by a successful build of the final source. The final validation selects ten builds and excludes the superseded Audit version from final closure coverage.

Two successful union receipts cover eight modules and then all nine. These are **17 selections of nine distinct modules**, not 17 mathematical modules. The earlier eight source hashes are identical in both groups. `kernel-union-1792058010136894000.json` completes at event 145; `kernel-union-1792058276476368000.json` at event 176. Both record return code 0 and `replay union passed`. The final nine-module union explicitly adds `MarkovDiagonalCore8833`; it covers every final mathematical source.

All 17 ordinary receipt digests equal their retained source snapshots. All final selected build/replay digests equal current and archived sources. Every ordinary and union receipt matches its completed controller-event payload; truncated stdout/stderr are exact prefixes under the validator's 8,000-character limit. Each final mathematical build precedes its union invocation. Each Audit replay follows the successful build of that exact Audit source version. Final object bytes are bound by manifest/current/archive/controller hashes and chronology; invocation-time object digests are not recorded.

The **159** final preservation checks and **40** initial reconciliation checks still match. Worker 83's **189** inherited manifest entries also independently match their expected and recorded hashes. These overlapping checks should not be summed as distinct files. The pinned root and canonical contract hash remain unchanged. The eight older-source hashes listed in `upper-six-reconciliation.json` also match; their stored statuses distinguish six compiled-and-replayed modules, one compiled-only module and one unaccepted draft. This source-digest comparison is not a new replay of those inherited modules.

## Final axiom coverage and central modules

The first successful Audit build/replay uses source SHA-256 `8e5aa0ee53eca7031e3dbfb05ee06b0d8b6d2c8982e332bb1119b1b5e48fdea1` and prints 52 theorem closures. The later successful final Audit build/replay uses `facdafb42b5a42f96dfb359f5e27a8bdb9725ec746c98937795d8379d0c60f9c` and prints **55**. The added three theorem names belong to `MarkovDiagonalCore8833`.

The final 55-name set equals the nine mathematical sources' declarations, final inventory, explicit Audit `#print axioms` requests, full successful build output and `validation.json`. Every axiom list is a subset of `propext`, `Classical.choice`, `Quot.sound`. This is direct final coverage, not extrapolation from the earlier 52 printed closures or from transitive dependency counts.

The three central modules are explicitly replay targets:

| Module | Final source SHA-256 | Target coverage |
|---|---|---|
| MarkovThirdGlobal8833 | `cad5fbec1cbc4fc6dd51a0fe7a8a9ccd659abd1f58efb153cc9616b53f1a3ee1` | Both unions |
| MarkovResidual8833 | `e5671c4ab0a23e45c01916ef7b23c083ed7b105e6048f853a1b686ca4249c090` | Both unions |
| MarkovDiagonalCore8833 | `8a9257ddf87503e29066be6f8552df7c39ebf86ceedbdac2607dc181f52c714c` | Final union |

Their object hashes and exact accepted build receipts are in the companion evidence. In particular, `source_third_lower8833`, `root_iff_interior8833` and `root_iff_core8833` are included in the final direct axiom audit. The final root-equivalence result is not a proof of its residual predicate: the controller retains `mathematical_resolution: false` and the final report has `completion: null`.

## Replay method and imported boundary

The drivers match the worker-84 before-state:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

Both union receipts also carry the latter digest. The wrapper hashes target sources before replay, requires a successful matching build, runs the unchanged batch driver with a 180-second timeout, and hashes the driver after replay. All pre-replay target digests match final archived sources.

These are alternate Lean replay procedures, distinct from ordinary compilation and the official `leanchecker` CLI. The batch driver unions all constants in each selected object's most-private available part, removes selected names from direct imports and calls `env.replay`. It checks more than the named theorem list. Lean.Replay invokes kernel declaration checks for safe nonpartial declarations; unsafe/partial declarations are skipped, axioms are admitted as axioms, and already imported equal theorems can bypass proof-body comparison. The separate axiom audit remains necessary. Dependency recursion does not add unfinished proofs as assumptions.

The delegated static method audit finds no selected-module import contamination, explicit-name duplicates or target/base collisions, source import cycles, forbidden-token occurrence or retained-source baseline mismatch. The groups contain 52 then 55 explicit theorems, and two then three definitions. Their local base-source closures contain **353 and 371 modules**, respectively; neither includes any new worker-84 module. Global and Residual are explicit targets in both groups, and Core is explicitly targeted in the final group.

This is source import and explicit-name analysis, not inspection of actual binary import tables or private/generated-constant inventories. External Mathlib imports and inherited compiled objects remain the trust boundary. Before-state/receipt driver hashes, source snapshots, build ordering and final object bindings do not establish invocation-time object measurements or a fresh rebuild of the dependency tree. The companion method note states these limits.

## Finalization and completion timing

The single finalizer invocation, events **194–195**, succeeds with nine mathematical modules, 55 closures, 82 artifact hashes, 159 preserved inputs and four failed builds. No failed or interrupted finalizer invocation is retained. The operational notes distinguish shell capability failures and a repaired checkpoint-documentation patch from mathematical build failures. Those repairs do not add accepted theorem or replay records.

Final validation was written at **2026-10-15 10:01:22.227146 UTC**, preservation at **10:01:22.450945**, and manifest verification at **10:01:22.494491**. Verification finished **383.955369 seconds before** the **10:07:46.449859** deadline. Both union runs and the final Audit replay had already completed.

The final agent JSON is event **196**, followed by `turn.completed` at **197**. Controller `final.json` exists and equals both the final agent JSON and controller report. There is no separate local evidence report file, which is not needed to establish this retained final response. The controller outcome is **completed**, finishing at **10:02:01.453627 UTC**, elapsed **1455.003768 seconds**, 344.996232 seconds before deadline. There are no unmatched started items, missing finalization outputs, unfinished replays or late/unarchived worker-84 files.

Companion evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000084_validation_evidence.json`, containing exact file/receipt/event/chronology comparisons and **397 input hashes**, all stable at the timestamp recorded there. Method note: `/private/tmp/math_gkm_godel_20261013/markov_worker_000084_replay_method.md`; its companion JSON contains 387 input hashes and source-closure graphs. This audit completed no missing research checks.
