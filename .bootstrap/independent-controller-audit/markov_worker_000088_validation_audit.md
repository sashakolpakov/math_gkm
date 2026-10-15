# Worker 88 retained-validation audit

Request `062809bac9f44b50b45dfdee483159d5`; controller `.control/markov/workers/000088`; evidence `evidence/markov-062809ba`. Static read-only review only: no project code execution/imports, Lean/build/replay/experiment runs, missing-check completion, project writes, researcher contact, or successor inspection. Auditor-owned parsing/hash reports are under `/private/tmp/math_gkm_godel_20261013`. Mathematical scope and finite-input coverage are reviewed separately.

**Result:** retained evidence supports successful final builds of **27 mathematical modules plus Audit**, alternate kernel replay of those 28 selected modules through **two unions**, and **782 directly printed permitted axiom closures**. All final artifact bindings match. Ten other mathematical source files remain explicitly excluded. No proof through slope 4/5 or full-root resolution is established by these records.

## Final hashes and successful records

All **173** controller afterhashes match both current files and worker-88 archive copies. All paths are new in the controller change set. All **171** manifest entries match independently recomputed current/archive hashes and controller afterhashes. The manifest excludes only itself and its verification JSON from its own index. Final source files, 28 selected objects, snapshots, receipts, scripts, notes, and ten excluded drafts are all consistently preserved. There are no additional current worker-88 files outside its archive, post-finish artifact mtimes, or files remaining in the unique temporary directory.

The **36 ordinary invocation receipts are all builds**: **28 successful**, **four return-code-1 failures**, and **four timeouts**. Thus “eight rejected builds” includes the four timeouts. There is no ordinary direct replay receipt, and no extra successful build of an obsolete version. Each selected final source has a successful matching build, preserved object, and successful union coverage. Every one of the 36 recorded source hashes matches its saved snapshot. Full source, snapshot, object, receipt, archive and controller hashes are in the companion JSON.

There is an explicit event-output qualification. At events **80–81**, the validator changes successful stdout/stderr event logging from content to `N chars retained in receipt`. **25** successful receipt/event pairs use these length summaries. Other fields, including status, source hash, command and elapsed time, match exactly; the lengths match the complete saved receipt. The final Audit event says **73726 chars retained in receipt**, rather than containing the 782 axiom lines. The complete output is present and independently hash-bound by the retained receipt/manifest/archive/controller. Failed-output events match complete output or the documented 8000-character prefix. Neither a matching length nor this audit claims byte-for-byte event-body duplication where only lengths were logged.

One batch command exits 1 at event 166 because its later Gauge3 build times out. Its earlier embedded successful Lower build receipt remains a separate successful build; the enclosing batch failure does not change that build's status. All corresponding receipt payloads and the batch chronology are retained.

## Actual replay coverage and order

| Union receipt | Selected modules | Named theorems / definitions | Completed event |
|---|---|---:|---:|
| `kernel-union-1792065112731403000.json` | 25 mathematical modules | 744 / 42 | 164 |
| `kernel-union-1792065215175651000.json` | `ThreeCert2K062`, `ThreeCert5K062`, Audit | 38 / 6 | 176 |

Both return 0, have empty stderr, and print `replay union passed`; their complete payloads match completed controller events. The groups are disjoint: **27 mathematical modules plus Audit**, not repeated coverage of all modules in each union. All matching successful builds precede the relevant union launch. The first union's estimated interval is **11:49:20.182872–11:51:52.731403 UTC**; the second is **11:53:16.786461–11:53:35.175651 UTC**. Intervals use the wrapper's end filename stamp minus its recorded monotonic duration.

`MarkovResidualTwoK062` is an explicit target of the first union. `MarkovAuditK062` is included in the second union, not passed to a standalone `ReplayKnown6d2c` invocation. Its final source digest is `ace9667e2e6bec45ea053e9775e7b6f9be23de4706318cf980eba64c7372ac5b`; its matching successful build is `run-MarkovAuditK062-build-1792065135045562000.json`, event 172.

The **782** source theorem/module pairs exactly match the inventory, Audit requests, complete saved stdout closures, and validation axiom map. Each closure uses only a subset of `propext`, `Classical.choice`, and `Quot.sound`. These are all explicit named theorem declarations, including helpers: **512 cut helpers**, **174 two/three-gap lemmas**, and **96 other named theorems**. The ten short-cycle modules contribute 552 declarations, including the 512 cut helpers. This is not a count of 782 separate source-level conjectures or of unlisted generated/private constants.

| Selected module | Explicit named theorems |
|---|---:|
| MarkovFourthLowerK062 | 5 |
| MarkovFourthGauge2K062 | 4 |
| MarkovFourthTwoLocalK062 | 1 |
| MarkovFourthTwo0K062 | 15 |
| MarkovFourthTwo1K062 | 16 |
| MarkovFourthTwo2K062 | 16 |
| MarkovFourthTwo3K062 | 17 |
| MarkovFourthTwo4K062 | 17 |
| MarkovFourthTwo5K062 | 18 |
| MarkovFourthThreeCert0K062 | 17 |
| MarkovFourthThreeCert1K062 | 18 |
| MarkovFourthThreeCert2K062 | 18 |
| MarkovFourthThreeCert3K062 | 19 |
| MarkovFourthThreeCert4K062 | 19 |
| MarkovFourthThreeCert5K062 | 20 |
| MarkovFourthShort221K062 | 32 |
| MarkovFourthShort231K062 | 44 |
| MarkovFourthShort232K062 | 48 |
| MarkovFourthShort241K062 | 56 |
| MarkovFourthShort243K062 | 64 |
| MarkovFourthShort321K062 | 40 |
| MarkovFourthShort331K062 | 56 |
| MarkovFourthShort332K062 | 60 |
| MarkovFourthShort341K062 | 72 |
| MarkovFourthShort343K062 | 80 |
| MarkovFourthTwoSourceK062 | 8 |
| MarkovResidualTwoK062 | 2 |
| MarkovAuditK062 | 0 |

Final selected sources have no audited `sorry`, `admit`, `native_decide`, explicit `axiom`, `unsafe`, or `partial` tokens. Accepted build warnings are linter messages about unused variables, ineffective/unreachable tactics, or tactic sequencing. The actual saved permitted-axiom closures provide the substantive axiom check.

## Failed, retried, and excluded sources

The four non-timeout failures are old versions of `MarkovFourthLowerK062`, `MarkovFourthShort243K062`, `MarkovFourthTwo0K062`, and `MarkovFourthTwo1K062`. All four differ from the final accepted source hashes and are excluded from selected checks. Their retained errors concern an unfinished staged normalization, solved-goal/zero-tail tactics, and truncated-count cast bridges. The audit does not repair them.

`MarkovFourthGauge2K062` first times out after 100.184186 seconds, then succeeds after 105.019374 seconds under the longer invocation bound at the **same final source hash**, `3273a1d145e718b5d318108c6a96c2102066ca250105fa4cdd5d0859214a4686`. Its later successful build and union establish its selected status; the first timeout is not a pass.

`MarkovFourthGauge3K062` has three timed-out builds: approximately 100.160116, 300.215662, and 300.240595 seconds. The first two use an earlier source; the third matches final source digest `8d02fa4fe406f8b42a800a97802fc40192c49c4907a395fde4c2d4d4a034820d`. It has no successful build, object, or replay and remains excluded. The other nine excluded source files have no build/replay invocation receipts. None of the ten has a retained object.

The excluded and not-replayed lists agree exactly with `pending-modules.json`:

`MarkovResidualK062`; `MarkovFourthThree4K062`; `MarkovFourthThree5K062`; `MarkovFourthThreeSourceK062`; `MarkovFourthThree3K062`; `MarkovFourthThree2K062`; `MarkovFourthGauge3K062`; `MarkovFourthThreeLocalK062`; `MarkovFourthThree0K062`; `MarkovFourthThree1K062`.

These source files are preserved, not admitted as checked results. Accepted `ThreeCert0`–`ThreeCert5` are separate certificate modules; their acceptance does not complete the excluded run-three source bridge or its stronger residual. There is no unrecorded accepted fourth-fifths source result inferred here.

## Method and imported-base boundary

Both driver hashes remain unchanged from the worker before snapshot: `ReplayBatch07F1.lean` is `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` is `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both union receipts record the matching batch hash. Only the batch driver is invoked for these new replays.

The union wrapper captures source hashes and requires successful matching build receipts before replay, then records the driver hash after the subprocess. The ready-selector considers inventory plus Audit, skips current hashes already covered by successful union records, and selects the remaining successfully built current hashes. It does not add excluded drafts. Neither wrapper freezes inputs throughout the subprocess or records invocation-time object digests; final retained objects are instead bound by the manifest/controller/archive.

The independent static method audit found **48 definitions** alongside the 782 theorems. Local imported source-base closures have **415** modules for the first union and **440** for the second. The second base contains the first 25 worker-88 mathematical modules but neither selected ThreeCert2/ThreeCert5 module nor their explicit declaration names. Audit imports all 27 math modules, but the selected certificates are removed from its retained direct imports. No target-source mismatch, explicit name collision/duplicate, import cycle, selected-target contamination, or preexisting source mismatch was found.

Audit has 27 imports and 782 print commands but no explicit new declaration. Including it in replay does not recheck the 25 mathematical modules left in the imported base; the first union supplies their replay coverage. The batch driver collects all constants from selected final/private object parts, including helpers, and invokes Lean replay/kernel checking. The unchanged replay method can skip unsafe/partial constants, admit axioms as axioms, overwrite duplicate map names, and skip proof-body comparison for already imported matching theorems. Static source/base/name checks found no selected-target route to those skips. Pending dependency recursion does not insert declarations as proof assumptions.

This remains an alternate replay check over retained compiled dependencies. Actual binary import tables and generated/private constant inventories are not listed in the outputs and were not extracted here. There is no independent per-declaration binary witness, official `leanchecker` CLI invocation, or fresh whole-source rebuild. These qualifications and exact source closures are in `markov_worker_000088_replay_method.md` and its evidence.

## Finalizer, preservation, and timing

The finalizer runs **twice successfully**, at events **180–181** and **184–185**, each reporting 27 mathematical modules, 782 closures, 171 artifacts, 116 preserved hashes, eight rejected receipts, the ten exclusions, and null completion. Events **182–183** update only the mathematics and checkpoint documents between those runs. The second successful pass refreshes the final index to those final document bytes. There is no failed-finalizer repair or unresolved partial finalization.

All **116** preservation entries match their initial expected and current hashes. The **107** initial reconciliation checks are a subset and match; these overlapping counts must not be summed as distinct files. Shared controller-before hashes agree. Raw contract digest `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, canonical JSON digest `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, and root source digest `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` match their respective pins. Inherited reconciliation reports completed worker 87 and preserves earlier interrupted-worker distinctions; no inherited finalizer/check is rerun here.

Controller start is **2026-10-15 11:25:57.702438 UTC**; deadline **11:55:57.702438 UTC**. Final validation mtime is **11:54:47.621770**, preservation **11:54:47.757602**, and artifact verification **11:54:48.515766**, **69.186672 seconds before deadline**. Verification reports 171 hashes and no failures. Final agent JSON is event **186**, followed by `turn.completed` at **187**. `final.json`, final message JSON, and controller report agree. Controller outcome is completed at **11:55:22.436512**, elapsed **1764.734075 seconds**, **35.265926 seconds before deadline**. There are no unmatched started items, late/unarchived files, or outstanding invocation/manifest effects in these records.

The controller's mathematical-resolution flag remains false and completion remains null. The accepted residual iff is not a proof of that residual or of full Conjecture 6.3.

**878 input hashes** were rechecked unchanged at **2026-10-15T12:16:03.270628+00:00**. Companion: `markov_worker_000088_validation_evidence.json`. Method report SHA256 `76b5e1317f78ae9e4d3e2c0f7c6435d0e8fc529d52d3acc55b79c2fbfbeac452`; method evidence SHA256 `ed9aea420e7e912cdbaff454e464344388addceaccf075ecd18bec74eb7528fd`.
