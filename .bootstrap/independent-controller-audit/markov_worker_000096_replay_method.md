# Worker 000096 replay method audit

Read-only audit of request `8067e0c51ab944db8a1a44fb7403351d`, using retained files in `/Users/sasha/math_gkm`. Standard-library source/receipt parsing and hashing only: no project execution, imports, Lean, builds, replays, finalizers, experiments, missing-check completion or project writes. The parent audit owns full artifact bindings, axiom output, timing and finalization.

## Exact scope

There are exactly 65 successful individual `ReplayKnown6d2c.lean` receipts, one for each final mathematical inventory module. Each reports return code zero and the expected module-specific replay-passed output; every captured source hash matches the current source. There are no union receipts and no request96 union-wrapper file.

| Selected source origin | Modules | Explicit theorems | Explicit definitions |
|---|---:|---:|---:|
| New worker96 M806 sources | 35 | 66 | 42 |
| Inherited SplitLG sources, unchanged from before96 | 30 | 30 | 30 |
| Total inventory and direct replay targets | 65 | 96 | 72 |

The inherited targets are `MarkovSplitLG00M042`–`MarkovSplitLG08M042`, `MarkovSplitLG10M042`–`MarkovSplitLG17M042`, `MarkovSplitLG20M042`–`MarkovSplitLG26M042`, and `MarkovSplitLG30M042`–`MarkovSplitLG35M042`. They are part of the 65-module inventory, not an additional 30 targets. Their source hashes all equal before96. The only definition-only selected module is `MarkovBlockStageDefsM806`. `MarkovBlockSourceM806`, `MarkovPrefixM806` and `MarkovResidualM806` are explicit individual targets.

`MarkovAuditM806` imports all 65 inventory modules, has no explicit mathematical declarations, and prints the matching 96 inventory theorem axiom closures. It is not selected by a replay. Its printed closures are separate from the 65 mathematical modules' own direct receipts.

## Imported bases and names

Every direct target's static transitive local source base excludes the target module and all its explicit declaration names. There are no duplicate explicit names within any target or across all 65 selected modules, and no source import cycle in any inspected graph. Preexisting inherited local sources retain their before96 hashes. Every new worker96 source occurring in a replay's imported base has its own successful direct receipt. Thus no newly imported source lacks an individual check within this inventory.

Per-invocation local source closures range from one to 685 modules; `MarkovResidualM806` has the 685-module closure. Up to 33 new worker96 modules are imported during an individual invocation; their separate successful replays do not make them selected targets during that invocation. Source-name comparisons found no selected/base collision involving the inherited split declarations. This is a statement about the inspected selected modules and their transitive bases, not about arbitrary unimported draft files. External Mathlib boundaries are recorded in the evidence JSON rather than independently scanned or rebuilt. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token.

## Unchanged procedure and retained limits

Both drivers match before96. `ReplayKnown6d2c.lean` remains SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; `ReplayBatch07F1.lean` remains `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The new validator is SHA256 `da4631ff232423ab8bc20952cdb4658f147fbcd3a9cfb9e8db910cf30164cbbb` and is byte-identical to worker95's validator after replacing the request identifier. There is no changed replay procedure.

The validator captures and snapshots source bytes before invoking pinned Lean v4.32.2, using the current evidence directory first in LEAN_PATH and then inherited paths. Direct mode calls `lean --run research/ReplayKnown6d2c.lean <module>`. Its receipt contains the captured source hash, command, output and elapsed time; the filename stamp is chosen before launch. It does not capture an invocation driver hash or loaded object digest. Successful event output is length-only, while full stdout/stderr remains in the JSON receipt.

The unchanged direct driver reads the selected object's most-private constants, constructs an environment from its imports, and calls environment replay. Safe nonpartial declarations reach kernel checking; imports are assumed, axioms remain axioms, and unsafe/partial declarations are skipped. An already imported theorem matching the relevant name/type metadata can avoid proof-body replay; the inspected explicit source names and target-free graphs reveal no such shortcut. Dependency pending-state does not insert a proof assumption; ordinary declarations still require kernel acceptance, with inductives using their kernel path.

Successful individual replay is relative to retained compiled imports. Static source checks do not independently establish compiled import-table contents, private/generated constant names, exact loaded object bytes or load times, a fresh combined reconstruction of the inherited environment, or an allowed-axiom policy. Before/current driver agreement is not an invocation-specific digest. The checks do not rewrite predecessor timeout or incomplete-check histories.

Evidence: `markov_worker_000096_replay_method_evidence.json`, SHA256 `48734f3d459834d099e96e3e8e5829719914d857affb92e158c2e2d8ea04ee6b`, contains all exact target/receipt associations, source origins, declaration lists, import graphs, before/current comparisons and 829 input hashes.
