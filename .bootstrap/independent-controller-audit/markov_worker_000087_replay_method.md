# Worker 87 replay-method continuation audit

Read-only audit of request `be5676f95b2a42969d21ef1f51f30bc6`. No project/Lean code, replay, or experiment was executed. Parent audit owns artifact/receipt/controller binding, timing, and finalization.

Two union receipts select **11 then 14 modules**, totaling 25 selections and **14 distinct mathematical modules**. The final group retains the original eleven at identical hashes and adds `MarkovFourthOneSourceBE`, `MarkovFourthAllCyclesBE`, and `MarkovResidualBE`. Unique selected sources contain **108 explicit theorems and 32 definitions**.

No target-source mismatch, explicit-name duplicate/collision, selected-module contamination, source import cycle, or preexisting-base source mismatch was found.

| Replay receipt suffix | Target modules | Theorems / definitions | Local base closure | Earlier worker-87 modules in base |
|---|---:|---:|---:|---:|
| 1792063121662108000 | 11 | 94 / 28 | 98 | 0 |
| 1792063395010606000 | 14 | 108 / 32 | 401 | 0 |
| 1792063444745359000 | 1 | 0 / 0 | 415 | 14 |

The only direct replay receipt selects `MarkovAuditBE` through `ReplayKnown6d2c`. Audit contains 14 imports and 108 `#print axioms` commands, with no explicit new declaration. Its replay does not recheck the mathematical declarations it imports; the saved build-output axiom closures are a separate validation artifact.

Both drivers match worker-87 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both union receipts record the matching batch-driver hash. The direct receipt identifies its driver in the command without a dedicated driver-hash field.

The union wrapper hashes sources before execution (line 6), requires successful matching source/hash/build-mode receipts (line 8), invokes replay (line 13, 180-second timeout), then hashes the driver while forming the result (line 16). The direct validator reads and snapshots source bytes before execution and computes its recorded hash from those captured bytes. Neither records invocation-time object hashes; neither freezes source/driver files throughout execution.

The unchanged method collects final-part object constants, excludes selected modules from direct imports, and invokes kernel replay. Unsafe/partial constants are skipped; axioms are admitted as axioms; duplicate map names overwrite; already-imported matching theorems can skip proof-body comparison. Source name/import checks found no selected-target route to those skips. Pending dependency recursion does not insert declarations as proof assumptions.

**Exact binary qualification:** source import and explicit declaration-name checks do not inspect actual compiled import tables or generated/private constant inventories, which the saved outputs do not list. Retained Mathlib and project dependencies remain trusted. No independent per-declaration binary witness, official CLI replay, or fresh whole-source rebuild is established here. Full local source closures and input hashes are in the companion JSON.
