# Worker 88 replay-method continuation audit

Read-only audit of request `062809bac9f44b50b45dfdee483159d5`. No project/Lean code, replay, or experiment was executed. Parent audit owns artifact/controller binding, timing, and finalization.

Actual replay receipts are **two unions: 25 mathematical modules, then two further mathematical modules plus Audit**. They select 27 distinct mathematical modules plus `MarkovAuditK062`, with no direct per-module replay receipt. Mathematical target and theorem-name sets exactly match the saved inventory; excluded drafts receive no coverage from this audit.

Selected sources contain **782 explicit named theorems and 48 definitions**. The theorem total includes 512 explicitly named `cut…K062` helper declarations and 174 `fourth_two_gap_…` / `fourth_three_gap_…` declarations, leaving 96 other named theorems. These counts include source-level helpers, not unlisted compiler-generated constants.

No target-source mismatch, explicit-name duplicate/collision, selected-module contamination, source import cycle, or preexisting-base source mismatch was found.

| Receipt suffix | Targets (math + Audit) | Theorems / definitions | Local base closure | Earlier worker-88 modules in base |
|---|---:|---:|---:|---:|
| 1792065112731403000 | 25 | 744 / 42 | 415 | 0 |
| 1792065215175651000 | 3 | 38 / 6 | 440 | 25 |

The second union explicitly selects `MarkovFourthThreeCert2K062`, `MarkovFourthThreeCert5K062`, and Audit. Audit imports all 27 mathematical modules, but the union excludes its two selected certificate modules from the retained direct imports. The checked transitive source base contains neither selected certificate nor their explicit declaration names. Thus adding Audit does not reveal a source-level route for those certificates to be inherited and skipped. `MarkovResidualTwoK062` is an explicit target of the first union.

Audit contains 27 imports and 782 `#print axioms` commands, with no explicit new declaration. Including Audit in replay does not recheck mathematical declarations left in the imported base; its saved build-output axiom closures are a separate validation artifact.

Both drivers match worker-88 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both unions record the matching batch-driver hash.

The union wrapper hashes sources before execution (line 6), requires successful matching source/hash/build-mode receipts (line 8), invokes replay (line 13, 180-second timeout), then hashes the driver (line 16). The ready-selector scans inventory plus Audit, skips current hashes already in successful unions, and selects remaining current hashes having successful builds. It does not add unfinished drafts. No invocation-time object hashes or file freezing are provided.

The unchanged method skips unsafe/partial declarations, admits axioms as axioms, overwrites duplicate map names, and may skip proof-body comparison for already-imported matching theorems. Source name/import checks found no selected-target route to those skips. Pending dependency recursion does not introduce declarations as assumptions.

**Exact binary qualification:** source import and explicit declaration-name checks do not inspect actual compiled import tables or generated/private constant inventories, which the outputs do not list. Retained Mathlib/project dependencies remain trusted. No independent per-declaration binary witness, official CLI replay, or fresh whole-source rebuild is established here. Full local closures and input hashes are in the companion JSON.
