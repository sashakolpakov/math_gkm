# Worker 84 replay-method continuation audit

Read-only review of `evidence/markov-8833a0fb`; no Lean/project code, replay, or experiment was executed. Parent audit owns receipt/object/controller binding and Audit snapshot chronology.

The two overlapping groups select **8 then 9 modules: 17 selections, 9 distinct mathematical modules**. The final group contains the earlier eight at identical source hashes and adds `MarkovDiagonalCore8833`. Unique selected sources contain 55 explicit theorems and 3 definitions. No target-source mismatch, duplicate explicit name, selected-module contamination, target-name collision in retained local sources, or source import cycle was found.

| Receipt suffix | Targets | Theorems / definitions | Local base closure | New worker-84 modules in base |
|---|---:|---:|---:|---:|
| 1792058010136894000 | 8 | 52 / 2 | 353 | 0 |
| 1792058276476368000 | 9 | 55 / 3 | 371 | 0 |

`MarkovThirdGlobal8833` and `MarkovResidual8833` are explicit targets of both groups. `MarkovDiagonalCore8833` is an explicit target of the final group. Their declarations are therefore selected for replay rather than only inherited through imports. This is a coverage observation, not a claim that the root conjecture is proved.

Both replay drivers match worker-84 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both union records contain the matching batch-driver hash.

`replay_union_8833.py` hashes selected sources before execution (line 6), requires successful matching source/hash/build-mode receipts (lines 7–8), invokes replay (line 13, 180-second timeout), then hashes the driver while forming the result (line 16). It records no invocation-time object digest and does not freeze source/driver files throughout execution.

All preexisting local base sources match their before-run hashes. The source closures retain external Mathlib imports as a trusted boundary. The unchanged method collects each object’s most-private available constants, excludes requested modules from direct imports, then invokes one union kernel replay. It skips unsafe/partial constants, admits axioms as axioms, overwrites duplicate union-map names, and can skip proof-body comparison for matching already-imported theorems. No explicit-name or source-import route to such a target skip was found. Pending dependency recursion does not insert declarations as proof assumptions.

**Exact binary qualification:** source import and explicit declaration-name checks do not inspect actual compiled import tables or compiler-generated/private constant inventories; the group outputs provide neither. These findings support the method under reused dependencies, not an independent per-declaration binary witness, official CLI replay, or fresh whole-source rebuild. Full local source closure graphs and input hashes are in the companion JSON.
