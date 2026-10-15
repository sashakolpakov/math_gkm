# Worker 90 retained-validation audit

Request `bc8d3b6f136b465a886c6f157ae90136`; controller `.control/markov/workers/000090`; evidence `evidence/markov-bc8d3b6f`. This is static read-only verification of retained evidence: no project code/imports, Lean/build/replay/experiments, missing-check completion, project writes, researcher contact, or successor inspection. Auditor-owned parsing/hash reports alone were written under `/private/tmp/math_gkm_godel_20261013`. Mathematical scope and finite coverage are reviewed separately.

**Result:** final retained records support **14 mathematical modules plus Audit** with matching successful builds and one successful alternate kernel union replay, and **100 directly printed permitted axiom closures**. All final artifact bindings match. **25** drafts remain excluded, including the optional numerator-identification source. No new log-concavity range or full-root completion follows from this validation record.

## Final bindings and selected records

All **162** controller changes are new paths. Each controller afterhash equals its current-file and archived-file SHA256. Every one of the **160** manifest entries also equals independent current/archive hashes and controller values. The manifest excludes only itself and `artifact-verification.json` from its own index. All selected sources, 15 objects, snapshots, invocation receipts, scripts, documents, local report and excluded drafts are consistently retained. There are no additional current worker-90 files outside its archive, post-finish artifact mtimes, or files remaining in its unique temporary directory.

There are **35 ordinary build receipts**: **15 successes**, **15 return-code-1 failures**, and **five wall-clock timeouts**. Thus “20 rejected builds” includes the five timeouts. Every successful build belongs to a final selected source; there is no successful obsolete-source extra. All 35 receipt source hashes equal saved snapshot hashes. Each final selection matches its successful build, validation digest, union digest and preserved object. Full source/object/receipt/snapshot/controller/archive hashes are in the companion JSON. Object digests are bound by final artifact evidence, not by invocation-time object-digest fields.

All receipt/event bindings agree with the validator's actual output schema. **All 15 successful build events contain output lengths rather than stdout/stderr bytes.** Audit reports **9420 chars retained in receipt**, matching its complete saved output. The full 100-closure output is independently hash-bound in receipt/manifest/controller/archive; it is not repeated in the event body. Other fields match exactly. Rejected output is complete or a documented 8000-character prefix. The entire union payload matches its completed event.

| Selected module | Named theorem declarations |
|---|---:|
| MarkovBinomialExtractBC | 2 |
| MarkovFirstNormBC | 1 |
| MarkovFourthBinomialBC | 4 |
| MarkovGaugeNorm00BC | 11 |
| MarkovGaugeNorm01BC | 11 |
| MarkovGaugeNorm10BC | 11 |
| MarkovGaugeNorm11BC | 11 |
| MarkovJetNorm0BC | 4 |
| MarkovJetNorm1BC | 5 |
| MarkovJetNorm2BC | 4 |
| MarkovJetNorm3BC | 5 |
| MarkovLocalStructuredBC | 27 |
| MarkovMomentScaleBC | 3 |
| MarkovSecondNormBC | 1 |
| MarkovAuditBC | 0 |

Every source theorem/module pair equals its inventory pair. The 100 names also exactly equal Audit requests, complete saved stdout closures, and validation axioms. Each closure uses a subset of `propext`, `Classical.choice`, and `Quot.sound`. No final selected source contains audited `sorry`, `admit`, `native_decide`, explicit `axiom`, `unsafe`, or `partial` tokens. This textual check supplements the actual printed axiom evidence.

Final `MarkovFourthBinomialBC` digest is **`655ec7d6852c66069d71e2b87af861dfbe1ed0bfffa9d40a39e45725df967fe9`**. Final Audit digest is **`a355354934e293228db3f64c8059e076c2d931e310e5a20e2ebeeef2c570ceff`**. Both have matching successful builds and explicit selection in the replay union; the final source theorem names are directly audited.

## Rejected attempts and explicit exclusion

The **15 return-code-1 failures** comprise three BinomialExtract attempts, one FourthBinomial attempt, six gauge attempts (00 twice, 01 once, 10 twice, 11 once), four JetNorm attempts, and the excluded ThirdNorm111 draft. The fourteen failures in ultimately accepted modules use hashes different from the respective final source. ThirdNorm111's failure matches its final excluded source. None is counted as successful.

The **five timeouts** are:

| Module | Recorded seconds | Final status |
|---|---:|---|
| FourthNorm0000BC | 120.569150 | Earlier draft hash; final draft also unchecked |
| FourthNorm1111BC | 160.230520 | Final draft hash, excluded |
| GaugeNorm00BC | 160.240297 | Same final hash later builds successfully |
| GaugeNorm10BC | 160.268903 | Same final hash later builds successfully |
| FourthLowBC | 100.132784 | Final optional draft hash, excluded |

The final GaugeNorm00 and GaugeNorm10 sources subsequently succeed in approximately 134.645959 and 139.161002 seconds respectively, and are explicitly replayed. Their prior timeouts remain rejected records, not accepted proofs.

The **25 excluded sources** are all 16 `MarkovFourthNorm` binary-word drafts, all eight `MarkovThirdNorm` binary-word drafts, and `MarkovFourthLowBC`. Their pending/validation exclusion sets agree exactly. No excluded module has a retained object, successful build, or replay. Four have failed/timed-out invocation receipts (FourthNorm0000, FourthNorm1111, ThirdNorm111, FourthLow); the other **21** have no invocation receipts.

The optional numerator-identification draft is pinned to source digest **`bb2d5cc539adb75f4a33bef74bde413d66f8e02811e705e8376faf5abcea6f6e`**. Its attempt `run-MarkovFourthLowBC-build-1792068439043315000.json` times out after 100.132784 seconds, with no return code and no object. Its completed failure event is **209**, after successful union event 207 but before either finalizer. It was already excluded from the 14-module inventory and remains excluded in final validation. It is neither pending at controller finish nor implicitly covered by the successful union.

## Replay scope, ordering, and method

The sole replay is **`kernel-union-1792068515030343000.json`**, completed at event **207**. It selects the 14 mathematical modules plus Audit, returns 0, has empty stderr, and prints `replay union passed`. The recorded duration is **20.868387333 seconds**; its estimated interval is **12:48:14.161956–12:48:35.030343 UTC**, using the end filename stamp minus duration. Every matching successful final build precedes its launch. There are **no direct individual replay receipts**.

The source inventory contains **100 explicit theorems plus 78 definitions**. Audit has 14 imports and 100 axiom-print commands, with no explicit new declaration. All new mathematical imports are selected in the same union. Its inclusion does not itself replay inherited mathematics; the union directly selects the new mathematical objects.

Both driver hashes match the before-run snapshot: batch **`502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`**, established direct driver **`18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`**. The union records that batch hash. The direct driver is unchanged but is not invoked for a separate worker-90 replay.

Independent static method review finds **107 local modules** in the imported source base, with **no new worker-90 targets**. The explicit retained local root is `MarkovFourthClosedN6604`. No target-source mismatch, explicit-name collision/duplicate, selected-target import contamination, source import cycle, or preexisting source mismatch was found. Excluded normalization/numerator drafts do not receive selected replay coverage.

The union wrapper hashes source bytes and requires matching successful source/build-mode receipts before replay; it records the driver hash afterward. The validator snapshots source bytes before building. Neither freezes source/driver files throughout subprocess execution nor records invocation-time object digests.

The unchanged batch method collects all selected final/private object-part constants, including helpers and definitions, and invokes Lean replay/kernel checking. Unsafe/partial declarations can be skipped; axioms are admitted as axioms; duplicate map names overwrite; already-imported matching theorems can skip proof-body comparison. Static source/name/import checks found no selected-target route to those skips. Pending dependency recursion does not inject declarations as proof assumptions.

These are source-level boundary checks. Actual binary import tables and generated/private constant inventories are not listed in saved output and were not independently extracted. Retained Mathlib/project compiled dependencies remain trusted. There is no independent per-declaration binary witness, official `leanchecker` CLI invocation, or fresh whole-source rebuild established here. Exact closures, source hashes and qualification are in the companion method files.

## Finalization and terminal boundary

The finalizer succeeds at events **212–213**, indexing **159** artifacts. Documentation updates to checkpoint/mathematics/next occur at **217–218**, and the local report is added at **219–220**. The finalizer succeeds again at **221–222**, indexing **160** final artifacts. The second command also independently rehashes all 160 entries and reports success. Both finalizers report 14 mathematical modules, 100 closures, 169 preserved inputs, 20 rejected builds, all 25 exclusions, and null completion. There is no failed-finalizer repair or unresolved partial state.

The local `evidence/report.json` is hash-bound but differs from the final response in wording/list structure. Its request ID, summary and null completion agree exactly. Its fuller description and the final response agree on retained counts, no newly proved log-concavity range, experimental status and excluded optional identification; the final response explicitly gives the final 160-artifact count. `final.json`, final agent JSON and controller report agree exactly. The companion JSON preserves the actual local/final field differences rather than treating them as identical.

All **169** final preservation checks equal initial/current hashes. The **160** initial reconciliation checks are a subset and also match; these overlapping counts are not distinct-file totals. Shared before-run entries agree. The raw contract digest remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, canonical JSON digest `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, and root digest `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`, matching their respective pins.

Controller start: **2026-10-15 12:22:33.788732 UTC**; deadline **12:52:33.788732 UTC**. Final validation mtime is **12:50:48.228218**, preservation **12:50:48.321411**, and artifact verification **12:50:48.414976**, **105.373755 seconds before deadline**. Final agent JSON is event **223**, followed by `turn.completed` **224**. Controller outcome is completed at **12:51:14.613914**, elapsed **1720.825182 seconds**, **79.174818 seconds before deadline**. No unmatched started items, late/unarchived files, unfinished optional process or outstanding finalizer effect remains.

Completion is null and controller mathematical resolution false. Accepted exact formulas and their replay do not resolve the inherited residual or full Conjecture 6.3.

**611 input hashes** rechecked unchanged at **2026-10-15T13:00:00.448613+00:00**. Companion: `markov_worker_000090_validation_evidence.json`. Method report SHA256 `d3f57ea51061c72847aa713579b72e1cfccf98e7c5586b7d7136054db3ba556f`; method evidence SHA256 `754befd5fac3db95116d2251e0ab9afde82d81ac1737ba43d653d204c8bc86b7`.
