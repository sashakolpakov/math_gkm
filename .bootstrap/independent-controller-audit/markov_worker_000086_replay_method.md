# Worker 86 replay-method continuation audit

Read-only method review of `evidence/markov-897eabb3`; no Lean/project code, replay, or experiment was executed. Parent audit owns source/object/controller/receipt binding.

The union explicitly selects **7 mathematical modules, 51 theorems and 14 definitions**, including `MarkovResidual897` (`root_iff_core897`). No target-source mismatch, explicit-name duplicate/collision, selected-module contamination, source import cycle, or preexisting-base source mismatch was found.

| Replay | Mathematical targets | Explicit theorems / definitions | Local imported-base closure | Earlier worker-86 modules in base |
|---|---:|---:|---:|---:|
| union | 7 | 51 / 14 | 394 | 0 |
| direct_audit | 0 | 0 / 0 | 401 | 7 |

The union's retained base contains 14 worker-85 modules; they are inherited declarations, not targets of this union. Worker 85's prior build/replay evidence remains a separate dependency boundary. This review neither supplies its missing finalizer nor completes any missing predecessor checks.

`MarkovAudit897` has 7 imports and 51 `#print axioms` commands, with no explicit new declaration. Its direct `ReplayKnown6d2c` replay does not recheck imported mathematical declarations. Its axiom-print build output is a distinct validation artifact.

Both drivers match worker-86 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The union records the matching batch-driver hash; Audit identifies the established driver in its command without a dedicated driver-hash field.

The union wrapper hashes source files before execution (line 6), requires successful matching source/hash/build-mode receipts (line 8), runs replay (line 13, 180-second timeout), and hashes the driver after that invocation (line 16). It records no invocation-time object hashes and does not freeze source/driver bytes during execution.

The unchanged replay method collects selected object constants from their most-private available parts and excludes selected modules from direct imports. It skips unsafe/partial declarations, admits axioms as axioms, overwrites duplicate map names, and can skip proof-body comparison for matching already-imported theorems. Source name/import checks found no such target-skip route. Pending dependency recursion does not introduce declarations as assumptions.

**Exact binary qualification:** source import and explicit declaration-name checks do not inspect actual compiled import tables or generated/private constant inventories, which the saved outputs do not list. External Mathlib dependencies remain trusted. No independent per-declaration binary witness, official CLI replay, or fresh whole-source rebuild is established by this note. Full local source closure graphs and input hashes are in the companion JSON.
