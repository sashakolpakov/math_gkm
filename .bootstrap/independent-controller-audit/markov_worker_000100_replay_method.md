# Worker 000100 replay method audit

Read-only audit of request `1b02dddc008a41708b03d1cb474e0824`, using retained files in `/Users/sasha/math_gkm`. Only standard-library parsing/hashing and audit-file writes were performed. No project execution, imports, Lean, builds, replays, finalizers, experiments, missing-check completion or project edits. The parent audit owns full artifact bindings, axiom output and controller timing/finalization.

## Exact selected scope

One successful union receipt exists: `kernel-union-1792085904369390000.json`, return code zero, `replay union passed`, approximately 32.338 seconds elapsed. It selects exactly the 27 mathematical modules in `accepted-modules.json`, containing 114 explicit theorems and 117 definitions. Every accepted source is new relative to before100 and matches its union receipt hash. `declarations.json` exactly matches the 114 source theorem names. There are no direct replay receipts and no definition-only accepted module.

Explicit union targets include `MarkovBackwardTwoM1B`, `MarkovBackwardTwoSourceM1B`, `MarkovFourthFinalSixM1B`, `MarkovFourthMiddleSixM1B`, `MarkovOnsetSixAllM1B`, `MarkovOnsetSixExceptionM1B`, all six OnsetSixSource modules, all six OnsetSource modules, all six OnsetValues modules, `MarkovPenultimateM1B`, `MarkovReflectBlocksM1B`, and `MarkovResidualSixM1B`. These are selected objects, not merely inherited imports.

`MarkovAuditM1B` imports exactly those 27 modules, prints the matching 114 theorem axiom closures, and has no explicit mathematical declarations. It is not a replay target. Its build and printed-closure evidence are separate from the union's selected mathematical declarations.

## Imported source boundary and exclusions

The union has 23 explicit inherited roots plus implicit Init, matching its recorded 24 inherited imports. The transitive local source base contains 790 modules. All local base sources existed before worker100 and retain their before100 hashes; there are no newly introduced worker100 modules in this base.

The imported closure contains no selected module or selected explicit declaration name. No explicit selected name is duplicated, and no source import cycle was found. Selected source texts contain no raw `sorry`, `admit`, `native_decide`, `unsafe`, `partial`, `axiom`, or `skipKernelTC` token. The evidence JSON records all roots, graph edges and declarations; external Mathlib boundaries were recorded rather than independently scanned or rebuilt.

All 35 accepted worker99 modules occur as imported dependencies here. They are not additional worker100 replay targets, and their earlier successful replay remains separate evidence. In particular, this boundary reuses older backward chamber/column-gap declarations and earlier final/middle/residual modules while selecting the new M1B declarations explicitly.

There are 87 other `Markov*M1B.lean` source filenames besides the 27 accepted modules and Audit: two FourthAfterMiddle/Middle drafts, six OnsetAdapter drafts, OnsetAll, six OnsetChamberGaps, 36 OnsetColumns and 36 OnsetGap drafts. None is selected or appears in the inspected import closure. Worker99's twelve excluded BackwardGap/BackwardStagedGap draft names are also absent. This is a source-filename/import-graph exclusion; object availability and attempted-build histories are covered by the parent binding audit. Earlier failed versions of subsequently accepted module names remain distinct from excluded draft names.

## Procedure and trust limits

Both drivers match before100. `ReplayBatch07F1.lean` remains SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` remains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The new union wrapper (`aa31d6b23f9af44842ce207a16bdaf8e608084795fb1fb65df2fa3fcc991a0c7`) equals worker99's after substituting the request identifier. The validator (`adb2bdf0a4ab5d054844997ce3505baaa7f0bebfcda8500a843876c0432aeb5e`) differs only by that identifier and changing its TMPDIR suffix from `-tmp` to `-work`. The replay algorithm and evidence-capture procedure are unchanged.

The union wrapper hashes selected source files before launch, requires matching successful build receipts from `run-Markov*.json`, prepends the current evidence directory to inherited LEAN_PATH, and invokes pinned Lean v4.32.2 with a 120-second subprocess bound. It hashes the driver after subprocess return and timestamps/writes the union receipt afterward. Actual loaded object files are not frozen or hashed at invocation. The validator snapshots source bytes before running; successful event summaries retain output lengths while full output remains in JSON receipts. Its unused direct replay branch supplies no direct replay evidence.

The batch driver merges selected objects' most-private constants, excludes selected direct import names, and performs one replay relative to the imported environment. Safe nonpartial declarations reach kernel checking; imports are trusted, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate union-map names can overwrite entries, and an imported theorem agreeing on relevant name/type metadata can avoid proof-body replay. The inspected explicit names and target-free graphs reveal no such shortcut. Pending-state handling does not insert a proof assumption; ordinary declarations still require kernel acceptance, with inductives using the kernel's inductive path.

Static source inspection does not independently establish binary import tables, private/generated constant names, exact loaded object bytes or load times, a fresh rebuild of inherited sources, or an allowed-axiom policy. Before/current driver equality and post-run driver hashing are separate from invocation-specific binary measurements. The retained successful union supports its 27 selected modules without completing excluded work or erasing prior unsuccessful attempts.

Evidence: `markov_worker_000100_replay_method_evidence.json`, SHA256 `acb18308a8cafc18a293d285b2b6a9020833e4976bd0073ab1498bb33f74ecec`, records exact targets, declarations, source graphs, inherited membership, excluded filenames, before/current comparisons and 869 input hashes.
