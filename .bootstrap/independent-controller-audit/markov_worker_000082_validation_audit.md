# Worker 000082 validation audit

Read-only static audit of completed request `e2cd486cc57d40438212692fe73d38ca` in `/Users/sasha/math_gkm`. No project code, Lean, replay, experiment or finalizer was executed, no project/archive file was changed, and no successor was inspected. Mathematical scope is audited separately.

**All 15 final mathematical modules and the Audit module have matching successful build and alternate kernel-replay records. The compiled audit directly prints all 74 named theorem closures, using only permitted axioms. The repaired finalizer and final response completed before the deadline. No final-source, object, receipt, manifest or archive hash mismatch was found.** This establishes the retained local validation status; it does not establish a fresh whole-source rebuild or resolution of Conjecture63.

## Exact binding and counts

All **129** controller `receipt.json` after-hashes equal both current and worker-82 archived bytes. All **127** artifact-manifest entries independently equal their current/archive/controller hashes. The only controller changes omitted from the manifest are `artifacts.json` and `artifact-verification.json` themselves. The latter reports 127 verified, zero failures. All 16 final `*E2.lean` files and their objects are covered. No current worker-82 research/evidence file is outside this archive, and no post-archive mutation was found.

There are **27 ordinary validator receipts**: 21 successful builds, five failed builds, one successful individual replay and no timeout. The final validation selects 16 builds: 15 mathematical modules and `MarkovAuditE2`. The five extra successful builds comprise two obsolete-source passes (`MarkovTerminalAlgebraE2`, `MarkovTerminalGapsE2`) and three earlier passes with the same source bytes (`MarkovFourthPolyE2`, `MarkovTerminalExtractE2`, `MarkovTerminalChambersE2`), subsequently rebuilt. They are not five extra modules or five additional final source versions.

Four successful union replays cover **all 15 mathematical modules exactly once**, in groups of 5, 2, 5 and 3. They completed at controller event lines 141, 184, 194 and 216 and each records return code 0 and `replay union passed`. The Audit has its own successful `ReplayKnown6d2c` receipt, completing at event 224.

Every ordinary receipt digest equals its saved source snapshot. All final selected build and replay digests equal the current archived source. All 27 ordinary receipt payloads agree with their completed controller events; stdout/stderr are exact prefixes where truncated. Events 166–167 record the validator's output-limit change from 6,000 to 1,500 characters, explaining the earlier longer event output. All other fields match exactly. Union receipt payloads also match their completed controller events. Every final target build completed before the corresponding union began.

Final object bytes are bound by manifest/current/archive/controller hashes and build/replay chronology. No wrapper records invocation-time object digests. The 169 final preservation checks and 165 initial reconciliation checks all still match their expected hashes.

## Rejected candidate and accepted source versions

Controller event 93 records the exact failed terminal experiment assertion `(3, 5, 3, 13, 3600, 32)`: the predicted scaled coefficient was 3600, while the raw coefficient was 32, hence 2880 after the recorded factor 90. `terminal-experiment-failure.json` retains this witness. This was a source-coefficient prediction failure, not a counterexample to a final accepted source theorem.

Events 94–95 preserve initial probe outputs and record the correction of the middle chamber for `min(c-r, 3r-c)`, whose branch threshold is `c=2r`. Events 101–102 regenerate the changed helpers. The final Algebra source replaces `(3*r-c)` by `(c-r)` in its middle-chamber fourth-coefficient formulas and changes `terminalmid2E2`; final Gaps changes the corresponding polynomial certificates. The older successful Algebra/Gaps snapshots prove statements about their old auxiliary formulas, not the eventual source-family coefficient bridge. Their old digests are excluded from final acceptance.

The corrected Algebra build completed at event 107; the recorded experiment passed at event 106. Final helper rebuilds precede the first successful union. The final `MarkovTerminalCoefficientsE2` source-coefficient bridge has a failed earlier build and a later successful matching build (`run-MarkovTerminalCoefficientsE2-build-1792054693049044000.json`), followed by successful replay in the second group. The source theorem module is built and replayed afterwards. Thus the final source bridge uses the corrected chamber formula; the finite failure was retained rather than counted as a successful validation. Generator scripts preserve historical recipes and are not a substitute for the final archived source/snapshots.

## Axiom and root-equivalence scope

The final `MarkovAuditE2` compiled output directly contains all **74** named theorem axiom closures. Their name set equals the 15 modules' source declarations, inventory and explicit `#print axioms` requests, and their axiom lists equal `validation.json`. Every list is a subset of `propext`, `Classical.choice`, `Quot.sound`; there are no extra axioms. This is 74 direct print results, not inferred transitive coverage.

`MarkovResidualE2` is explicitly a replay target in the final three-module group, not merely an imported dependency. Its final source SHA-256 is `e42a02896fb503650c1ae7aaaf42c7f4c5002d6ee7329bfb94e40d0974018b4b`; object SHA-256 is `be684e59c3d9f42e254ff2323ecd2f2dc38eef18f23edea9f7d1ab1fb7494abc`. Its successful build is `run-MarkovResidualE2-build-1792055232705855000.json`; replay is `replay-group-1792055297353539000.json`; `root_iff_interiorE2` is printed in the final axiom audit.

That theorem states `Conjecture63 ↔ Interior63E2`. The module defines the remaining proposition and proves this equivalence, not `Interior63E2` itself. The final report correctly keeps `completion: null` and the controller records `mathematical_resolution: false`.

## Replay method and retained trust boundary

Both drivers match worker 82's before-state:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

The previously audited procedure is unchanged. These are alternate Lean replay drivers, distinct from ordinary compilation and from the official `leanchecker` CLI. The union driver collects all selected-object constants from the most-private available part, including helper definitions, removes selected names from direct imports and invokes `env.replay`; it does not merely select the 74 public theorem names. Lean.Replay calls kernel declaration checks for safe nonpartial declarations. Unsafe/partial declarations are skipped; axioms are admitted as axioms; an already imported equal theorem can skip proof-body comparison. Separate axiom checking remains necessary. Pending recursion does not insert unfinished proofs as assumptions.

The delegated static audit finds no target-module import contamination, explicit target-name collision or duplicate, source import cycle, or checked forbidden token in the four target sets. They select 15 modules containing 74 explicit theorems and 25 definitions. Local base-source closure sizes are 129/187/129/319 and contain 0/5/0/12 earlier worker-82 modules respectively. In the last group, `LongLargeE2`, `Interior63E2` and `root_iff_interiorE2` belong to the target union.

This is a source import/declaration check, not a dump of compiled import tables or generated/private constant inventories. External Mathlib imports and inherited compiled objects remain trusted dependencies. Union wrappers hash target source files after subprocess completion and omit a driver digest from each receipt. Here unchanged before-state drivers, source snapshots, preserved dependency checks, final objects, build ordering and completed receipts support the binding; they are not invocation-time binary measurements or a fresh rebuild of the entire dependency tree.

## Finalizer repair, final report and timing

The first finalizer failed at events 225–226 by comparing the raw contract-file digest to a canonical-JSON digest. Its script had already written `validation.json`; the assertion preceded writes of preservation, operational observations and manifests. The repair is recorded in `finalizer-reconciliation.json` and events 227–231. The second invocation, events 232–233, completed successfully and regenerated the final outputs.

Static hashing confirms unchanged raw contract bytes `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, matching the initial reconciliation pin. Canonical sorted compact ASCII JSON yields `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, exactly the request contract hash. The pinned root file still matches the contract root digest `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The repair changed the comparison, not the contract or root.

Final validation was written at **2026-10-15 09:10:17.561412 UTC** and manifest verification at **09:10:17.962410**, **66.412851 seconds before** the **09:11:24.375261** deadline. The final agent JSON appears at event 234, followed by `turn.completed` at event 235. Controller `final.json` exists and equals both the final agent JSON and controller report. The local evidence `report.json` uses different, more detailed wording and is separately hash-bound; it is not byte-identical to the final response.

The controller outcome is **completed**, finishing at **09:10:53.528209 UTC**, elapsed **1769.152948 seconds**, 30.847052 seconds before deadline. There are no unmatched started items, interrupted replay groups, missing finalization outputs or late/unarchived worker-82 files.

Companion evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000082_validation_evidence.json`, containing exact file/receipt/event/chronology data and **448 input hashes**, all stable on recheck at 2026-10-15 09:18:36 UTC. Method note: `/private/tmp/math_gkm_godel_20261013/markov_worker_000082_replay_method.md`, with a companion evidence file containing 330 input hashes and source closure graphs. No missing checks were completed by this audit.
