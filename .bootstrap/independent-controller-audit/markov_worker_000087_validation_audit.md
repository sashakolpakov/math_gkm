# Worker 87 retained-validation audit

Request `be5676f95b2a42969d21ef1f51f30bc6`; controller `.control/markov/workers/000087`; evidence `evidence/markov-be5676f9`. Audit is read-only: no project code execution/imports, Lean invocation, experiment, repair, missing-check completion, or successor inspection. Only retained-file parsing/hashing and auditor-owned temporary reports were used. Mathematics and finite-domain interpretation are handled separately.

**Result:** the retained records support successful compilation of **14 mathematical modules plus Audit**, successful alternate kernel replay of all 14 mathematical modules, and **108 directly printed permitted axiom closures**. All final bindings examined agree. This is not full-root completion, an official `leanchecker` CLI run, or a fresh whole-source rebuild.

## Final artifact and receipt bindings

All **103** controller changes are new paths, and every controller afterhash equals both the current-file and worker-87 archived-file SHA256. All **101** artifact-index entries also equal current/archive/controller hashes. The two controller artifacts omitted from their own manifest are `artifacts.json` and `artifact-verification.json`. Every final source, source snapshot, object, receipt, script, and document selected by that manifest is retained consistently. There are no additional current worker-87 files outside its controller archive, no post-finish artifact mtimes, and the unique temporary directory is empty.

There are **22 ordinary receipts**: **15 successful builds**, **six failed builds**, and **one successful direct Audit replay**. No ordinary receipt times out; no successful build is an obsolete-source extra. Every ordinary receipt source digest matches its saved source snapshot. Every receipt has a matching completed controller event; full output matches the saved event output, allowing the validator's documented 8000-character stdout/stderr prefix. Both union receipt payloads match their completed events exactly. Final object hashes are independently bound through the manifest/controller/archive; the invocation receipts do not record per-invocation object digests.

All 15 validation selections have matching final source/build hashes, successful selected replay coverage, and retained objects. Exact source hashes and theorem counts are:

| Module | Named theorems | Final source SHA256 |
|---|---:|---|
| MarkovFourMomentBE | 6 | `192451f02c7d9fdf36aca43c19b2de5124bb53c8d96fd26a373e71f88a16a73f` |
| MarkovFourthRunMomentBE | 7 | `c13a0ce85d6ab9423f15a533dbe6dce0558488e7cd9109c19f973b82518174d9` |
| MarkovFourthOneLocalBE | 1 | `49bba59b8eb27d256313d6b0bb418667c0a95d5d4cdb25ea85c89aec5b9a22ae` |
| MarkovFourthOne0BE | 11 | `38ec60eb86eecace5277933ebbe64657fcbd12b28d0452e6725b63785a4b75db` |
| MarkovFourthOne1BE | 12 | `88cca0e825df77647c2a02ee1074bd73720275f1c8a713cace802757ada9acdd` |
| MarkovFourthOne2BE | 12 | `8c0852f03d05d7f8b1e63795a826a5372188773856798e5b71534a7a5e707239` |
| MarkovFourthOne3BE | 13 | `c4e12dc35ad93f78a780557bbf686b46709ea8ecfb234d9502804da236f9c899` |
| MarkovFourthOne4BE | 13 | `3e02960663467383bea792deea0c0625dbd46a546caa8ec8c7eb201d9dd4e7b4` |
| MarkovFourthOne5BE | 14 | `d66c9a4c830e07c85bb338074c2264fa56f2c88a9ff97ea565c2e4615573ce08` |
| MarkovFourthOneSmallBE | 2 | `0afc41ccfd504069b076278983414ea16bfa2eb112e5a7d41997abcffe3cf0ca` |
| MarkovFourthOneSmallPolyBE | 3 | `06d4da939da9d88c053a14dc6ecf5031680ee6a8fb93e6f7b863e613c442248a` |
| MarkovFourthOneSourceBE | 9 | `a221abc30e95d12e3a4163bbea3ef551e88e58b18fa9274f29d2c7af136ed849` |
| MarkovFourthAllCyclesBE | 4 | `5fe116a1a467d99e94a37b28e5b881ffdc7f7897ce217b67cbb7af1f4456afb8` |
| MarkovResidualBE | 1 | `7e35f4a9dff75510fe569c4be863fa0220dc9f4bafd41cf199f2960738ff0181` |
| MarkovAuditBE | 0 | `e69053b79eafe4be99046c2c770ccce019ddf36d6e6424f451651672ecddd3db` |

The machine-readable companion records full source/object/snapshot/archive/controller hashes and the exact selected receipt paths.

## Replay ordering and direct axiom coverage

`kernel-union-1792063121662108000.json` passes with 11 mathematical modules / 94 named theorems at unchanged final hashes (event 153). `kernel-union-1792063395010606000.json` passes with all 14 / 108 (event 183), retaining the original eleven and adding `MarkovFourthOneSourceBE`, `MarkovFourthAllCyclesBE`, and `MarkovResidualBE`. These are **25 selections but 14 distinct modules**, not 25 independently new modules. Every selected source has a successful matching build before the relevant union starts.

The union intervals estimated from end stamps and recorded monotonic durations are 11:17:37.861737–11:18:41.662108 UTC and 11:22:17.728997–11:23:15.010606 UTC. They both print `replay union passed`, return code 0, and empty stderr. The final Audit build (event 182) and subsequent Audit direct replay (event 191) match final Audit SHA256 `e69053b79eafe4be99046c2c770ccce019ddf36d6e6424f451651672ecddd3db`. Audit direct replay begins at 11:24:04.745359 UTC and has recorded duration 30.870681333 seconds; its matching build completes first.

The **108 theorem/module pairs** extracted from final sources exactly equal inventory pairs; theorem names exactly equal Audit print requests, all 108 complete saved stdout closures, and validation axioms. Every closure uses a subset of `propext`, `Classical.choice`, and `Quot.sound`. This is direct printed coverage for every named theorem, including the final source and root-residual results. Audit itself contains 14 imports and 108 print commands, with no explicit new declarations; replaying Audit does not replay its imported mathematics again. The unions provide that mathematical replay coverage.

## Rejected versions and successful final versions

Six return-code-1 attempts are retained and correctly excluded: `FourthOne0BE`, `FourthOne1BE`, and `FourthOne2BE` had unfinished cast-normalization goals; `FourthOneSmallPolyBE` had an unfinished coefficient tail simplification; `FourthOneSourceBE` had six natural-sum type mismatches; `FourthAllCyclesBE` had list-rewrite/unfinished classification goals. Each rejected source has a different hash from its corresponding successfully built/replayed final source. None is counted as accepted. Exact rejected/final digests and error locations are in the companion evidence.

Final accepted chamber builds retain only unused-variable / ineffective-`push_cast` linter warnings. No final source contains the audited `sorry`, `admit`, `native_decide`, explicit `axiom`, `unsafe`, or `partial` tokens. The permitted axiom-closure audit is stronger evidence than this textual token scan alone.

## Replay method and trust boundary

The established direct driver remains SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; the batch driver remains `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. Both agree with worker-87 before-run hashes. Both union receipts record that batch-driver hash. The union wrapper hashes sources and asserts matching successful builds before launching replay, and hashes its driver while recording the result afterward. The direct wrapper snapshots source bytes before execution and identifies its driver in the command, without a dedicated driver hash field.

The independent method review found **108 explicit theorems plus 32 definitions** in the final 14 selected mathematical sources. Static local import closures contain 98 modules for the first union, 401 for the final union, and 415 for Audit. Neither union's static base includes any of its selected target modules; Audit imports the 14 mathematical modules. No explicit name collision, selected-module contamination, import cycle, or preexisting source mismatch was found.

The unchanged batch method collects all constants from the final/private object parts, including helper definitions, rather than selecting only the 108 named theorems. It invokes Lean's replay/kernel mechanism. That mechanism skips unsafe/partial declarations, admits axioms as axioms, and may skip an already imported matching theorem without comparing proof bodies; duplicate collected map names overwrite. The static source/name checks found no selected-target route to these skips. Recursive dependency handling does not insert pending declarations as proof assumptions.

These are qualified source-level checks. Actual binary import tables and generated/private constant inventories are not listed in saved output and were not independently extracted here. Retained compiled Mathlib/project imports are reused; neither wrapper freezes files throughout execution or records invocation-time object hashes. No independent per-declaration binary witness, official CLI replay, or fresh whole-tree rebuild is established. Method detail and hashes are in `markov_worker_000087_replay_method.md` and its companion evidence.

## Finalizer, preservation, and terminal status

There is one invocation of `research/finalize_be5676f9.py`, started at event 196 and completed at 197 with exit code 0. Its reported counts are 14 modules, 108 theorem closures, 101 artifact hashes, 85 preserved hashes, six failed receipts, and null completion. No failed finalizer attempt or pending partial finalization is present. Its own final hash-verification assertion passes and `artifact-verification.json` reports 101 checks with no failures.

All **85** final preservation checks match independently recomputed current hashes and `initial-hashes.json`; the **76** initial reconciliation checks are a subset and also match. Shared before-run entries agree. These counts overlap and must not be added as distinct files. Raw contract digest `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, canonical JSON contract digest `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, and root source digest `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` agree with their respective pins. Raw and canonical JSON digests intentionally differ.

Reconciliation correctly distinguishes completed worker 86 from worker 85's interrupted aggregate finalization; worker 87's checks and finalizer concern its own artifacts. No old finalizer is invoked in this event stream. This audit does not reinterpret inherited imports as newly replayed modules.

Controller start: **2026-10-15 10:59:30.103385 UTC**; deadline: **11:29:30.103385 UTC**. Validation was written at 11:25:03.561073, preservation at 11:25:03.583293, and artifact verification at **11:25:03.948545**, **266.154840 seconds before deadline**. Final agent JSON is event 198, followed by `turn.completed` event 199. Controller finish is **11:25:40.387116**, elapsed **1570.283731 seconds**, **229.716269 seconds before deadline**. Final JSON, final agent message, and controller report agree; outcome is `completed`. There are no unmatched started items, late/unarchived files, or unfinished replay/manifest effects observed.

Both report completion and validation completion remain null; controller mathematical resolution remains false. The retained root iff does not establish its residual predicate.

Inputs: **700** hashed files, rechecked unchanged at **2026-10-15T11:44:32.071776+00:00**. Supporting evidence: `markov_worker_000087_validation_evidence.json`; method report SHA256 `7ebb909ed10cff382dbf251720898dd3dbf88e510b157f89abf3054ad81930ec`, method evidence SHA256 `c6bf08dd4c982396dec7f93e566168a17df6d4e2470d5f4eb153b7c6227eda10`.
