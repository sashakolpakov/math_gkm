# Worker 80 replay-method subaudit

Read-only audit of completed timeout request `07f1d4107cd9444f9e7c04207d4f33d9`. No project code, Lean, replay, or experiment was executed. This report concerns the replay procedure; the parent audit owns complete artifact and timing validation.

**The new driver is a union replay of all collected module constants, not a named-theorem selector. The saved evidence does not establish replay of all 40 finally compiled mathematical modules.** The late successful batch contains 39 modules, with 72 explicit theorems and 90 definitions. `MarkovTwoBandsSource07F1` and its three theorems are absent despite a later successful, final-source-matching build. Inventory generation completed at events line 194; batch replay started at 195, before the first TwoBandsSource build at 196. Its repaired successful build completed at 203. No Audit-module replay is provided by this batch.

| Saved union receipt suffix | Result | Scope | Controller binding |
|---|---|---|---|
| 1792051377127313000 | Syntax error, exit 1 | Two modules | Archived and recorded |
| 1792051510870884000 | Passed, exit 0 | Two modules | Archived; completion event line 169 |
| 1792051911627555000 | Passed, exit 0 | 39 modules | Current file only; absent controller archive/list and completion event |

The last receipt was written 68.711966 seconds after controller finish. It is evidence of a late reported result, not an in-window completed controller receipt. Initial driver failure was the malformed paired `for` syntax; reversing the logged one-line repair reconstructs its recorded SHA-256 exactly.

`ReplayBatch07F1.lean` loads each explicit argument's `.olean` plus available server/private parts and inserts all name/constant pairs from the last, most-private part into one map. This extraction matches pinned `LeanChecker.replayFromImports` and `ReplayKnown6d2c.lean`. It removes requested module names from direct imports, deduplicates other imports by module name, constructs an imported environment with trust level 0 and empty options, then calls `env.replay` once. It does not use the official CLI's discovery or `--fresh` procedure. Imported dependency declarations are loaded rather than replayed.

The successful two-module batch has six explicit retained roots, whose local source closure contains 138 modules, including 15 other worker-80 modules. Thus its “inherited import boundary” is relative to the selected pair, not exclusively pre-worker-80 material. The 39-module batch has two explicit retained roots (`MarkovInteriorSourceFDDA`, `MarkovShapePartsBDEE`), with 123 local transitive modules, all matching their before-run source hashes. Neither source closure contains a selected module, an explicit target declaration name, or a source import cycle. Four Mathlib import leaves form the external trusted boundary. Driver output reports seven and three metadata imports respectively; it does not print their names.

Pinned `Lean.Replay` recursively processes dependencies, then uses `Kernel.Environment.addDeclCore`, the `lean_add_decl` primitive, for safe nonpartial declarations. Unsafe and partial constants are skipped; axioms are admitted as axioms; constructors/recursors are compared with those regenerated from inductives. There are no corresponding unsafe/partial/custom-axiom/sorry tokens in the 39 selected mathematical sources. Replay itself does not check an allowed-axiom policy.

Duplicate names in the union map silently retain the last inserted constant. No duplicate explicit source names were found. Separately, Lean.Replay skips an already-present theorem when name, type, level parameters, and mutual-block field match, without comparing proof bodies. The static closure/name inspection found no route for this shortcut to skip the explicit target declarations. It is not a dump of actual compiled constant tables, which these receipts do not provide.

For cycles, `isTodo` removes a declaration from `remaining` and marks it pending before dependency recursion. Revisiting a pending declaration does not add a theorem or axiom. Ordinary declarations must still pass the kernel against declarations already present; this bookkeeping does not license circular proof assumptions. Mutual inductives follow the kernel's inductive-declaration path. No additional cycle or self-assumption shortcut is introduced by the batch driver.

The wrapper hashes selected sources before replay, requires a successful matching build record, and records the driver hash after replay. It does not hash loaded objects at invocation time, record a compiled constant count/list, or assert that retained transitive imports contain none of the selected names. Consequently this static audit supports the described method under the reused dependency boundary, while preserving those evidence limits and the omitted-module/late-receipt gaps.

The corrected batch driver hashes to `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, matching both successful union receipts and its controller snapshot. The unchanged established driver hashes to `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Full input hashes and static closure graphs are in the companion evidence JSON.
