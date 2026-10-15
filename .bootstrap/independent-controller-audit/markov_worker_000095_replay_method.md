# Worker 000095 replay method audit

Read-only audit of request `96dea62b6a264d13939c64cc19dbe945`, using retained files in `/Users/sasha/math_gkm`. Sources and receipts were parsed and hashed with standard-library audit code only. No project code, Lean, builds, imports, replays, finalizers, experiments or missing checks were executed; no project files were changed. The parent audit owns full artifact/controller bindings, timing and finalization.

## Exact completed replay scope

There are 78 successful individual `ReplayKnown6d2c.lean` receipts and zero union receipts. Every receipt names a distinct mathematical module, reports return code zero and the matching replay-passed message, and binds the current source hash.

| Scope | Modules independently selected | Explicit theorems | Explicit definitions |
|---|---:|---:|---:|
| New worker95 inventory | 60 | 261 | 344 |
| Later checks of worker94 A/B/D modules | 18 | 39 | 72 |
| Total | 78 | 300 | 416 |

The new set exactly covers the 60-module mathematical inventory and all 261 inventory theorem names. Definition-only modules are `MarkovOnsetDefsM96`, `MarkovOnsetPartsM96`; they also have individual replay receipts. `MarkovResidualOnsetM96`, `MarkovPrefixM96` and `MarkovFourthPolygonM96` are explicit targets, not merely imports.

The recovery set is exactly worker94's previously unreplayed 18 A/B/D modules: for each of A, B and D, the Chart, Defs, Gap0 and Value0/1/2 modules. All 18 sources retain their before95 hashes. These worker95 receipts add later successful selected-module checks; they do not change worker94's earlier broad/small union timeouts or turn its imported dependencies into historical worker94 replay successes. Worker94's nine excluded SplitAG modules are not among these targets.

`MarkovAuditM96` imports the 60 new inventory modules and prints exactly their 261 matching theorem axiom closures. It has no explicit mathematical declarations and is not a replay target. The audit source's imported mathematics is covered by the separate 60 direct receipts, not by treating its import commands as replay.

## Source import and name checks

For every one of the 78 direct checks, its transitive local imported-source closure excludes that check's selected module and every explicit declaration name of that module. No target contains duplicate explicit names; there are no explicit-name duplicates across the entire selected 78-module set and no source import cycle in any inspected graph. All preexisting inherited local sources match their before95 hashes. Every newly introduced worker95 source appearing in a replay's imported base also has its own successful direct replay receipt. No excluded SplitAG module appears in any inspected base.

The 78 local imported closures range from zero to 617 modules; `MarkovResidualOnsetM96` has the 617-module closure. Up to 57 new worker95 modules occur in an individual imported base. Those are imported assumptions during that particular invocation even though separately selected in their own successful invocations. The evidence JSON lists exact per-target roots, closures and declarations. External Mathlib source boundaries are recorded but not independently scanned or rebuilt. Selected sources contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token.

## Procedure and retained limits

Both drivers match before95: `ReplayKnown6d2c.lean` is SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; `ReplayBatch07F1.lean` is `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The request-specific validator (SHA256 `d806347d095b8fb71aa9ce48405dde2ee9564b9140536f99b606bb8ae9c7b8b0`) and unused union wrapper (`452689b49e1f42f858ecba13460f32dce6232e76fc648817a60d99bada3c397e`) are new files and exactly match worker94's versions after substituting the request identifier. The operational change is using individual direct replays rather than union replays; the underlying direct replay method is unchanged.

The validator captures source bytes and writes its snapshot before launching pinned Lean v4.32.2, using the current evidence directory before inherited LEAN_PATH entries. Direct mode invokes `lean --run research/ReplayKnown6d2c.lean <module>`. The receipt stores the captured source hash, command, output and elapsed time; its filename stamp is chosen before invocation. It does not store an invocation driver hash or loaded object digest. Successful event summaries retain output lengths while full output remains in the JSON receipt. The unused union wrapper retains pre-launch source hashing, post-subprocess driver hashing and a 120-second bound, but its mere presence supplies no union evidence.

The unchanged direct driver loads the selected module's most-private object constants, constructs an environment from that object's imports, and calls environment replay. Safe nonpartial declarations reach kernel checking; imported declarations are trusted, axioms remain axioms, and unsafe/partial declarations are skipped. An already imported theorem agreeing on the relevant name/type metadata can avoid proof-body replay; no such explicit-source target contamination was found. Replay's pending set does not insert a proof assumption; ordinary declarations still require kernel acceptance, with inductives handled by their kernel path.

These are separate successful checks against retained compiled imports, not one fresh simultaneous reconstruction of the entire inherited environment. Static source graphs do not independently establish binary import-table contents, private/generated constant names, exact loaded object bytes or load times, a fresh rebuild of inherited sources, or an allowed-axiom policy. Before/current driver agreement is separate from an invocation-specific driver digest, which these direct receipts omit. No predecessor deadline or incomplete-check boundary is retroactively repaired.

Evidence: `markov_worker_000095_replay_method_evidence.json`, SHA256 `e1417c3f73157857529d42b8af550d15adb4e2f2e4ccc2560655dbc366a0a602`, contains exact target/receipt associations, new versus recovery classification, all source import graphs, before/current hashes and 776 input hashes.
