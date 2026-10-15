# Worker 000098 replay method audit

Read-only audit of request `06b5b1f918814d79ba331dcc5c327605`, using retained files in `/Users/sasha/math_gkm`. Only standard-library source/receipt parsing and hashing were performed. No research execution, Lean, builds, imports, replays, finalizers, experiments, missing-check completion or project writes. The parent audit owns full bindings, axiom output and controller timing/finalization.

## Exact successful scope

One successful union receipt exists: `kernel-union-1792082364080084000.json`, return code zero, `replay union passed`, retained elapsed time approximately 84.929 seconds. It explicitly selects all 31 modules in `accepted-modules.json`. Their source declarations comprise 155 theorems and 121 definitions, with no definition-only module. All 31 sources are new relative to before98; all current source hashes match the union receipt. `declarations.json` lists exactly the 155 source theorem names. There are zero direct replay receipts.

The explicit targets include `MarkovFullCoefficientLCM06`, `MarkovFullTailSourceM06`, `MarkovResidualM06`, `MarkovTailAllM06`, all six new source-chamber adapters, all six tail chambers, and all six tail-source modules. These are selected declarations, not merely inherited imports. The complete target list and declaration lists are in the evidence JSON.

`MarkovAuditM06` imports exactly these 31 mathematical modules, prints the matching 155 theorem axiom closures, and has no explicit mathematical declarations. It is not selected by the union. Its build/closure output is separate from the union's mathematical replay scope.

## Imported base and names

The union has eleven explicit inherited roots: `MarkovFourthLowSource897`, `MarkovFullChamber0FA`, `MarkovFullChamber1FA`, `MarkovFullCoeff0FinalFA`, `MarkovFullCoeff1FinalFA`, `MarkovFullCoeff2FA`, `MarkovFullCoeff3FA`, `MarkovFullCoeff4FA`, `MarkovFullSourceFA`, `MarkovResidualM806`, and `Mathlib`. Implicit Init accounts for the recorded twelve inherited imports.

Its transitive local source base contains 735 modules. Every local base source existed before worker98 and retains its before98 hash; no new worker98 module occurs in the base. No selected module is transitively imported. There are no selected explicit declaration names in the base, no duplicate explicit names in the selected union, and no source import cycles. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token.

All 49 accepted worker97 mathematical modules occur in this imported base. They are imported-only during worker98's union and are not another 49 worker98 replay targets; their earlier replay receipts remain separate evidence. Worker97's excluded Chamber2–5 sources and all six excluded source-chamber adapters are absent from the inspected base. External Mathlib boundaries are listed in the evidence JSON, not independently scanned or rebuilt.

## Unchanged method and retained limits

Both drivers match before98. `ReplayBatch07F1.lean` remains SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` remains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The request-specific union wrapper (`c5b4b853eeb1e9353ee89e69b2e557620af59b03e50d5d9c206060c4b6f9fec9`) and validator (`f3e47deb18aba4a1a442d2ad3411b4394022a7e2832cb5ad927a9e83e053cbbb`) are new files, each identical to worker97's after request-ID substitution. No replay-method change was found.

The union wrapper hashes selected sources before launch and requires matching successful build records found through `run-Markov*.json`. It puts the current evidence directory before inherited LEAN_PATH entries, launches pinned Lean v4.32.2 with a 120-second subprocess limit, and hashes the replay driver after return. Receipt timestamping/writing occurs afterward. It does not freeze or hash actual loaded object files at invocation. The validator snapshots source bytes before its run; successful event summaries retain output lengths while full output remains in receipt JSON. Its unused direct replay branch does not supply direct replay evidence.

The batch driver merges selected objects' most-private constants, excludes selected direct import names, and performs one environment replay relative to the imported base. Safe nonpartial declarations reach kernel checking; imports are trusted, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate union-map names can overwrite prior entries, and a matching imported theorem's metadata can avoid proof-body replay. The inspected explicit source names and target-free graphs reveal no such shortcut. Dependency pending-state does not insert a proof assumption; ordinary declarations still require kernel acceptance, with inductives using their kernel path.

Static source inspection does not independently establish compiled import-table contents, private/generated constant names, exact loaded object bytes or load times, a fresh rebuild of the inherited environment, or an allowed-axiom policy. Before/current driver equality and the wrapper's post-run driver digest are not invocation-specific loaded-object measurements. The successful union supports the selected 31-module scope without completing excluded predecessor work or rewriting its historical timeout boundaries.

Evidence: `markov_worker_000098_replay_method_evidence.json`, SHA256 `a8a50382f40ba90c400202c5e9bd83760e039cbe0599c5c8768cf6daaf051da2`, records exact targets, declarations, source graphs, predecessor import membership, before/current hashes and 828 input hashes.
