# Worker 000094 replay method audit

Read-only audit of completed-timeout request `04290504255048ec8a33fbe263ddb123` in `/Users/sasha/math_gkm`. Only retained sources, receipts and relevant event records were parsed and hashed. No project code, Lean, builds, imports, replays, experiments or missing checks were executed; no project files were changed. The parent audit owns full artifact binding, deadline and finalization findings.

## Scope: nine successfully replayed modules, eighteen imported algebra modules

The final mathematical inventory has 27 modules, 64 explicit theorems and 135 definitions. Three successful unions cover nine distinct modules containing 25 theorems and 63 definitions. The other 18 inventoried modules contain 39 theorems and 72 definitions: these have successful build evidence handled by the parent, but no successful replay receipt when selected. Their declarations are imported assumptions in successful downstream replays. This distinction is material to any claim that all 64 source theorem declarations were independently replayed.

| Receipt suffix | Outcome | Exact target scope | Theorems | Definitions |
|---|---|---|---:|---:|
| `1792075504741885000` | success | `MarkovResidualSmallM042` | 1 | 2 |
| `1792075621830154000` | 180-second timeout | all 26 inventory modules except ResidualSmall | 63 | 133 |
| `1792075711875624000` | success | `MarkovBlockSmallM042`, `MarkovEarlyBlockM042` | 9 | 1 |
| `1792075776363036000` | success | `MarkovBlockLDefsM042`, `MarkovBlockLGap4M042` through `MarkovBlockLGap8M042` | 15 | 60 |
| `1792075784330549000` | 120-second timeout | six B modules: Chart, Defs, Gap0, Value0, Value1, Value2 | 13 | 24 |
| `1792075784355343000` | 120-second timeout | corresponding six A modules | 13 | 24 |
| `1792075784395652000` | 120-second timeout | corresponding six D modules | 13 | 24 |

All receipts are `kernel-union-<suffix>.json` under `evidence/markov-04290504`. Every attempted selected source hash matches its retained current source. All seven union commands have completed event records; the smaller groups were pending at an earlier checkpoint but are not pending in the final retained event stream. No direct replay receipt exists. Timeout records have no successful return code and retain stdout/stderr as the string `None`; they do not identify an independently justified subset of successfully replayed declarations.

`MarkovAuditM042` imports all 27 inventory modules and prints exactly the matching 64 theorem axiom closures. It declares no mathematical constants and is not a replay target. Printed closure counts do not add successful replay targets.

## Imported-base and name checks

All seven attempted groups have target-free static transitive local source bases, no selected explicit declaration name in their base, no duplicate explicit names within the target sets, and no source import cycle. There is also no explicit-name duplication across the full 27-module inventory. Existing inherited local sources retain their before94 hashes. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token.

The successful ResidualSmall group's local imported closure has 559 modules. It includes 19 new worker94 modules: BlockSmall and all 18 A/B/D algebra modules. Its three explicit roots plus implicit Init agree with the recorded four inherited imports. The successful BlockSmall/EarlyBlock closure has 184 local modules, including all 18 A/B/D algebra modules; its four explicit roots plus Init agree with the five recorded imports. The successful L group has no local source base; its two external Mathlib tactic roots plus Init agree with three recorded imports. Its 60 definitions and 15 theorems are selected explicitly. The unsuccessful broad group's local closure is 166 modules; each A/B/D retry's local closure is 156. External Mathlib boundaries are listed in the evidence JSON, not independently scanned or rebuilt.

Nine excluded `MarkovSplitAG00M042` through `MarkovSplitAG08M042` sources each declare one definition and one theorem whose names duplicate the corresponding declarations in `MarkovBlockAGap0M042`. None of these split modules is selected or occurs in any of the seven inspected source import closures, so these excluded source duplicates do not contaminate the inspected bases. Their historical successful builds/objects, and the later skip list, remain separate from replay scope; a later skip instruction does not erase earlier build receipts. Actual compiled import tables remain subject to the binary qualification below.

## Procedure and limits

`ReplayBatch07F1.lean` retains before94 SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` retains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The new request-specific union wrapper is SHA256 `6a26ab604b6d3a4f24d973fb399800b1b9ec14a81cbbeef7b5ead64104dc1fe0` and validator `6c9690f85046dd99d9d7a6ba5df1ffdcef1e14b92c52d654a4005638fba7961f`; neither was present in before94. Events 164–165 record reducing the wrapper subprocess timeout from 180 to 120 seconds. Replay-driver semantics are unchanged.

The wrapper hashes selected sources before launch, requires matching successful build receipts, uses the current evidence directory before the inherited LEAN_PATH, and runs pinned Lean v4.32.2. Driver hashing occurs after the subprocess returns; receipt timestamps/writes occur afterward. No loaded object is frozen or hashed at invocation. The validator captures source bytes before invocation and can emit explicitly skipped queued-build receipts. Successful event output is length-only, with full output retained in the JSON receipts; failures are truncated in event summaries. None of these capture mechanisms supplies a missing replay success.

The unchanged batch driver merges selected modules' most-private object constants, excludes their direct import names, and performs one environment replay. Safe nonpartial declarations reach kernel declaration checking; imports are trusted, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate union names can overwrite each other, and an already imported theorem with matching relevant name/type metadata can avoid proof-body replay. The inspected explicit source names and target-free graphs expose no such shortcut for actual selected targets. The pending-set dependency mechanism does not insert a proof assumption; ordinary declarations must still kernel-check, with inductives using the kernel's inductive path.

Static source checks do not independently establish binary import-table contents, private/generated constant names, exact loaded object bytes or load times, a fresh rebuild of the inherited tree, or an allowed-axiom policy. Downstream replay does not replay the 18 imported A/B/D modules; it checks downstream declarations relative to them. No missing checks or predecessor boundary issues are repaired by this audit.

Evidence: `markov_worker_000094_replay_method_evidence.json`, SHA256 `35c66acdf67c2b581e68ccf542431d147433b53310c6757dd9a3f866b02b0a38`, records exact target lists, outcomes, declarations, graph edges, excluded split-name overlaps, relevant event commands, before/current comparisons and 663 input hashes.
