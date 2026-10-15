# Worker 85 replay-method continuation audit

Read-only method review of `evidence/markov-01f51d63`. No Lean/project code, replay, or experiment was executed. Parent audit owns object/controller binding, timing, and the timeout boundary.

The union selects **13 mathematical modules**; the direct `ReplayKnown6d2c` invocation separately selects **`MarkovFourthConditional01F`**, bringing coverage to **14 distinct mathematical modules**, with 94 explicit theorems and 32 definitions. No target-source mismatch, explicit-name duplicate/collision, selected-module contamination, source import cycle, or preexisting-base source mismatch was found.

| Replay | Mathematical targets | Explicit theorems / definitions | Local imported-base closure | Earlier worker-85 modules in base |
|---|---:|---:|---:|---:|
| union | 13 | 87 / 32 | 83 | 0 |
| direct_conditional | 1 | 7 / 0 | 93 | 10 |
| direct_audit | 0 | 0 / 0 | 97 | 14 |

The Conditional replay processes its own final-part constants over its imported base. Neither the module nor any explicit declaration name from it occurs in that base's checked source closure. Its explicit theorem names are `fourth_raw_from_sequence01F`, `source_fourth_chamber_001F`, `source_fourth_chamber_101F`, `source_fourth_chamber_201F`, `source_fourth_chamber_301F`, `source_fourth_chamber_401F`, `source_fourth_chamber_501F`. Its inherited worker-85 dependencies remain imported rather than being rechecked by this individual replay.

`MarkovAudit01F` contains 14 explicit imports and 94 `#print axioms` commands, with no explicit new declaration. Its direct replay does not replay the mathematical declarations that it imports. Saved build-output axiom coverage is a separate check handled by the parent audit. The raw token `axiom` occurs only in a documentation comment in Conditional (line 8), not in an axiom declaration.

Both drivers match worker-85 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The union records the matching batch-driver hash; direct receipts identify the established driver in their command but have no dedicated driver-hash field.

The union wrapper hashes sources before execution (line 6), asserts a successful matching source/hash/build-mode receipt for every target (line 8), runs replay (line 13, 180-second timeout), then hashes the driver when forming the receipt (line 16). It does not record invocation-time object hashes or freeze source/driver files.

The prior method conclusions apply unchanged: all selected final-part constants enter the replay map; unsafe/partial declarations are skipped; axioms are admitted as axioms; duplicate names overwrite within the map; already-imported matching theorems can skip proof-body comparison. Source import/name checks found no route for a selected mathematical declaration to be skipped through those cases. Pending dependency recursion does not introduce declarations as assumptions.

**Exact binary qualification:** these are source import and explicit declaration-name checks, not inspection of actual compiled import tables or generated/private constant inventories. Those are not listed in the saved outputs. External Mathlib imports remain a trusted boundary; there is no independent per-declaration binary witness, official CLI replay, or whole-source rebuild established here. Full local closure graphs and input hashes are in the companion JSON.
