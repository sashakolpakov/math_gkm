# Worker 000099 replay method audit

Read-only audit of completed request `94b1de05f66043aeb7a32e517aeb2a6f`, using retained files in `/Users/sasha/math_gkm`. Standard-library source/receipt parsing and hashing only; no project execution, imports, Lean, builds, replays, finalizers, experiments, missing-check completion or project writes. The parent audit owns full artifact bindings, axiom output and event/deadline findings.

## Exact replay scope

The single successful union receipt `kernel-union-1792084138071324000.json` selects exactly the 35 modules in `accepted-modules.json`, reports return code zero and `replay union passed`, and records approximately 94.926 seconds elapsed. These sources contain 260 explicit theorems and 298 definitions. All 35 sources are new relative to before99, all current source hashes match the union receipt, and `declarations.json` exactly matches the 260 source theorem names. There are zero direct replay receipts and no definition-only accepted module.

Explicit targets include all six backward adapters, chambers and columns-gap modules, their extraction/general/source/assembly modules, `MarkovFourthFinalM94`, `MarkovFourthMiddleM94`, `MarkovFullDegree4M94`, `MarkovFullTailSourceM94`, `MarkovResidualM94`, and the new tail extraction/source/assembly modules. Their exact names and declarations are recorded in the evidence JSON.

`MarkovAuditM94` imports exactly the 35 accepted mathematical modules, prints the matching 260 theorem axiom closures, and has no explicit mathematical declarations. It is not a replay target. Its printed closures and build evidence remain separate from the union's selected mathematical declarations.

## Imported source boundary and names

The union has 17 explicit inherited roots plus implicit Init, consistent with its recorded 18 inherited imports. Its transitive local source base contains 755 modules. Every local base source existed before worker99 and matches its before99 hash. No new worker99 module appears in the imported base.

No selected module is transitively imported, no selected explicit declaration name appears in the base, no selected explicit name is duplicated, and no source import cycle was found. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token. The exact roots and closure are in the evidence JSON; external Mathlib source boundaries were recorded rather than independently scanned or rebuilt.

Eighteen of worker98's 31 accepted modules occur in this base as imported dependencies, not worker99 replay targets. The other thirteen are absent: FullChamber2–5M06, FullCoefficientLCM06, FullSourceChamber0–5M06, ResidualM06 and TailAllM06. Worker99's explicit inherited roots include the older `MarkovFullSourceFA`, `MarkovPrefixM806`, and `MarkovResidualM806`; the exact source-version boundary is the inspected graph.

The twelve excluded draft modules `MarkovBackwardGap0M94` through `MarkovBackwardGap5M94` and `MarkovBackwardStagedGap0M94` through `MarkovBackwardStagedGap5M94` are neither selected nor present in the imported closure. This name-based exclusion is distinct from earlier failed versions of finally accepted Extract, Degree4, Chamber0 and Adapter4 sources: those accepted module names are selected at their final receipt-matching hashes. An earlier failure under the same module name does not make its later accepted source an excluded draft. Build/object chronology remains the parent binding audit's responsibility.

## Unchanged method and limits

Both drivers match before99: `ReplayBatch07F1.lean` is SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` is `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The new union wrapper (`f7af31847665b0847cf8eb7ccb19d9961af9f6720d3c82b3826582c4abd29417`) and validator (`3d047e41f4b2321c7c2838d1c17c9ce458f697cc3ee5db86b850ee2c577b311a`) are each identical to worker98's after request-ID substitution. No replay-method change was found.

The wrapper hashes selected source files before launch, requires matching successful builds from `run-Markov*.json`, prepends the current evidence directory to inherited LEAN_PATH, and invokes pinned Lean v4.32.2 with a 120-second subprocess bound. Driver hashing occurs after subprocess return; union receipt timestamping/writing follows. Actual loaded objects are not frozen or hashed at invocation. The validator captures source snapshots before invocation; successful event summaries retain output lengths while full output remains in JSON receipts. Its direct replay branch supplies no direct evidence when unused.

The unchanged batch driver merges selected objects' most-private constants, excludes selected direct import names, and replays once relative to the imported environment. Safe nonpartial declarations reach kernel checking; imports are trusted, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate union-map names can overwrite entries; an imported theorem with matching relevant name/type metadata can avoid proof-body replay. No corresponding explicit-source duplicate or target reimport was found. Pending-state handling does not insert a proof assumption: ordinary declarations still require kernel acceptance, with inductives using their kernel path.

Static source inspection does not independently establish compiled import tables, private/generated constant names, exact loaded object bytes or load times, a fresh rebuild of inherited sources, or an allowed-axiom policy. Before/current driver equality and post-run driver hashing are separate from invocation-specific binary measurements. Replay supports the selected 35-module scope without completing excluded drafts or erasing earlier unsuccessful attempts.

Evidence: `markov_worker_000099_replay_method_evidence.json`, SHA256 `5a69457df157b7252198734b797c3ec2b39593e8b9b36e38d410316dac31fda1`, records exact targets, declarations, source graphs, predecessor import membership, excluded draft filename membership, before/current comparisons and 848 input hashes.
