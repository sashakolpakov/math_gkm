# Worker 000093 replay method audit

Read-only audit of completed-timeout request `cc599cf12cc74c9e84112aac7bc0f9ac`, using retained source and receipts in `/Users/sasha/math_gkm`. No project code, Lean, builds, imports, replays, experiments or missing checks were executed; no project files were changed. Controller timing, object/archive bindings and finalization are the parent audit's responsibility.

## Exact scope

Two successful retained union receipts exist; there are no direct replay receipts:

| Receipt | Selected modules | Explicit theorems | Explicit definitions | Local imported-source closure |
|---|---:|---:|---:|---:|
| `kernel-union-1792072855989621000.json` | 1: `MarkovFirstShiftCC` | 5 | 1 | 168 |
| `kernel-union-1792073960241231000.json` | 16, exactly the final mathematical inventory | 41 | 27 | 525 |

This is 17 selections of 16 distinct mathematical modules, not 17 distinct modules. The final union explicitly selects `MarkovResidualCC` and the definition-only `MarkovFourLinearDefsCC`. Every selected current source hash matches its corresponding receipt, including the repeated `MarkovFirstShiftCC`. The final source theorem-name set exactly matches all 41 inventory entries. `MarkovAuditCC` has 16 imports, 41 matching `#print axioms` commands and no explicit mathematical declarations. It is not selected by either union and has no direct replay receipt; its build/printed-closure evidence is separate.

## Imported base and names

For the first union, the sole explicit inherited root is `MarkovFirstShiftSourceF2`; adding implicit `Init` agrees with the recorded two inherited imports. For the final union, the five explicit inherited roots are `MarkovFirstShiftCoeffF2`, `MarkovFirstShiftSourceF2`, `MarkovFourthBoundaryF2`, `MarkovResidualN6604`, and `MarkovShiftProductF2`; adding implicit `Init` agrees with the recorded six imports.

Recursive local source inspection finds no selected module in either imported closure, no selected explicit declaration name in the closure, no duplicate explicit names within either selected union, and no source import cycle. Every local inherited source in each closure was present before worker 93 and retains its recorded before93 hash. No new worker93 source is imported through either base. Selected sources contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token. Graph traversal stops at external Mathlib source boundaries listed in the evidence JSON.

## Procedure and retained limits

`ReplayBatch07F1.lean` remains SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` remains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both match before93. The request-specific wrapper and validator are new files, absent from before93; their current hashes are recorded in the evidence JSON. No change to the established replay method was found.

The union wrapper hashes selected source files before launching Lean, requires matching successful build receipts, puts this request's evidence directory first in the inherited `LEAN_PATH`, and runs the pinned v4.32.2 driver with a 180-second subprocess limit. It hashes the replay driver after subprocess return and timestamps/writes the union receipt afterward. It does not freeze or hash actual loaded objects at invocation. The validator captures source bytes before the run; successful event summaries retain output lengths while full output remains in the JSON receipts.

The unchanged batch driver merges selected modules' most-private object constants, excludes selected direct import names, and calls `env.replay` once. Safe nonpartial declarations reach kernel declaration checking; imported declarations are assumed, axioms remain axioms, and unsafe/partial declarations are skipped. The map can silently replace duplicate names; replay can skip comparison of a duplicate theorem's proof when an already imported theorem agrees on the relevant name/type metadata. These static checks found no corresponding explicit-source collision or target reimport. The replay pending-set mechanism is not an inserted proof assumption; ordinary dependencies still require kernel acceptance, with inductives handled by their kernel path.

These conclusions describe the inspected source graphs and retained successful receipts. They do not independently establish compiled import-table contents, private/generated constant names, exact object bytes/loading times, a fresh rebuild of the inherited tree, or a separate allowed-axiom policy. They do not retroactively complete or strengthen predecessor worker91's old-Audit overlap or post-deadline second-receipt boundary. Receipt completion/deadline acceptance is left to the parent timing audit.

Evidence: `markov_worker_000093_replay_method_evidence.json` contains exact targets, declaration lists, graph edges, before/current hashes, comparisons and 580 input hashes. Its SHA256 is `1c343d580f9aeec4c9ca19150f21ec0d99b4bc2f763ac38d329004ed76b2a80a`.
