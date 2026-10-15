# Worker 91 retained-validation audit

Request `0b212317001348aaa31bde36d93913b1`; controller `.control/markov/workers/000091`; evidence `evidence/markov-0b212317`. Static read-only inspection only. No project execution/imports, Lean/build/replay/experiments, missing-check completion, project writes, researcher contact or successor inspection. All selections below are **auditor reconstruction**, not a generated worker validation manifest or controller mathematical admission.

**Result:** 25 final mathematical modules plus Audit have matching successful builds. Final Audit prints all **51 named theorem closures**, each permitted. A completed pre-deadline event records union replay of **24 mathematical modules / 50 theorems plus an older Audit**. A separate successful receipt for **Residual plus final Audit** is retained in the controller/archive, but its receipt timestamp is just after the deadline and the event stream lacks its completion event. The finalizer never runs; aggregate validation and final report are absent. Do not describe this as completed pre-deadline finalization or replay of the full final inventory.

## Hash and build status

All **193** controller afterhashes equal both current-file and original archive SHA256 values. All changes are new paths. There are no extra current worker-91 files outside the archive, no post-controller-finish artifact changes, and the unique temporary directory is empty. The worker has no artifact manifest to compare; the 193 bindings are controller/archive bindings, not a locally finalized artifact index.

There are **52 ordinary receipts**, all builds: **28 successes**, **17 return-code-1 failures**, and **seven wall timeouts**. No direct individual replay receipt exists. The successes comprise **26 final selections** (25 mathematical modules plus Audit) and **two superseded source versions**: the first Audit and an earlier GapPart4. Every final selected source has a matching successful build, snapshot and object. All 52 receipt source hashes match their snapshots. Full source/object/snapshot/controller/archive hashes and statuses are in the companion JSON.

Every ordinary receipt has a completed event. All 28 successful events log stdout/stderr lengths, not bytes; these lengths match the complete retained receipts. Other receipt fields agree exactly. Failure output is complete or the validator's 8000-character prefix. Old Audit has 50 print requests / 4356 output characters; final Audit has **51 / 4449**. Complete final stdout names equal inventory theorem/module pairs and final source theorem names; every closure uses a subset of `propext`, `Classical.choice`, and `Quot.sound`. No final selected source contains the audited `sorry`, `admit`, `native_decide`, explicit `axiom`, `unsafe` or `partial` tokens.

Relevant final checks are:

| Module | Final source SHA256 | Build receipt suffix |
|---|---|---|
| MarkovFourthInitialLCK0B | `b6e16b10faef775fa3bdb06740daa8bebb5db7f1bb593ca07f35ddb1f8b0eff6` | `1792070285091072000` |
| MarkovResidualK0B | `bf2763f6ae940e43cdb05a1dddbdaf9afd0e5c67dc98d6c392a2a15c70630f7a` | `1792070405588800000` |
| MarkovAuditK0B | `56deefdc778e91cd28a6cbf573cb7b2d73e19ebce09679c7181bccca8923c6e1` | `1792070449958006000` |

The source inequality in InitialLC belongs to the first replay batch; Residual's `root_iff_coreK0B` is printed by the final Audit but belongs only to the second replay receipt. All three builds and final printed closure output occur before the deadline. Mathematical interpretation is handled separately.

The two extra successful versions are old Audit digest `8692ba3f26be1779a61ec67f2cee5ef06c54d980b7ae48377a17f69f19e02fe6`, and old GapPart4 digest `9e0b57cdd37edcdc2e69596157f30b33be0ffe065b0d37ec493f93e1dbe27636`; both have later matching builds for final sources. An enclosing batch event containing old GapPart4 exits 1 after another attempt fails; this does not change its embedded successful receipt status.

## Replay chronology and overlapping Audit rebuild

First receipt: `evidence/markov-0b212317/kernel-union-1792070466611789000.json`, SHA256 **`be6c8f697513b96657305f4c126b8456abd137811f35b62ee169823ff48872e2`**. Event **256** completes successfully. It selects 24 final mathematical modules plus **old Audit**, returns 0, prints `replay union passed`, and records two inherited imports. Its duration is 30.466174667 seconds; approximate wrapper interval **13:20:36.145614–13:21:06.611789 UTC**. Matching builds precede its start.

Audit is regenerated from 24 modules / 50 theorems to 25 / 51 at events **252–253**, adding Residual. The final Audit build starts at **13:20:49.958006**, ends approximately **13:21:02.279122**, and overwrites the retained Audit object at mtime **13:21:02.114173**—during the first union. The first receipt's old source digest alone therefore does **not** prove which Audit object was read at load time.

The recorded import-header count materially constrains this overlap. With the hash-matched old Audit snapshot, the first union retains `MarkovFourthBinomialBC` plus default `Init`: **two** imports, as observed. Substituting final Audit's known header adds unselected `MarkovResidualK0B`: **three** imports. That counterfactual would transitively reimport 20 selected modules, colliding with 44 theorem and 46 definition names. The unchanged driver constructs/deduplicates imports while reading selected object parts and prints the count after collecting them, before replay. Pinned Lean import elaboration supplies the default Init import. Thus the actual count **2** is consistent with old Audit and incompatible with the known final Audit header **under ordinary source-to-object correspondence**. This is strong retained-header evidence against that specific contamination route, not an invocation-time object digest or load timestamp. No immutable old Audit object is retained, and the concurrent overwrite remains an explicit qualification.

Using the old Audit source snapshot, the first source base is **121 local modules**, with no selected target/name overlap or cycles; its selected mathematical sources contain **50 theorems and 48 definitions**. The remaining 24 target source/object versions have matching final builds and no observed concurrent mutation.

## Second receipt and precise deadline boundary

Second receipt: **`evidence/markov-0b212317/kernel-union-1792070481020777000.json`**, SHA256 **`403638969d37d89491557873a28afebdab5e3517c26ded4dfefcf3bf037f5480`**. It selects final Residual plus final Audit, returns 0, prints `replay union passed`, and has empty stderr. Matching builds precede its launch. Recorded duration is **10.899970875 seconds**. Its source base has **502 local modules**, with no selected target/name overlap or cycles; expected and reported direct imported-module count is **26**. It contains one mathematical theorem and two definitions. Final inventory totals are **25 mathematical modules / 51 theorems / 50 definitions**.

Controller start is **2026-10-15 12:51:20.698981 UTC**; deadline **13:21:20.698981**; controller finish **13:21:27.004098**, timeout outcome, elapsed **1806.305117 seconds**. The second receipt filename timestamp is **13:21:21.020777**, **0.321796 seconds after deadline** and **5.983321 seconds before finish**. Its file mtime is **13:21:21.021278**, **0.322297 seconds after deadline** and **5.982820 seconds before finish**.

That timestamp is assigned while assembling the receipt after the subprocess result and driver hash. It is **not a separately logged Lean-return time**. The evidence does not establish that kernel return itself was before or after the exact deadline. It establishes a successful **post-deadline receipt**, retained before archive capture. Event **257** only starts `item_132`; no completed event follows. The saved receipt reports subprocess success, while wrapper/event completion is not recorded. Do not call this a completed pre-deadline event, or infer an unfinished kernel process solely from the unmatched start.

This receipt is the **only artifact with a current mtime after deadline**. It is already controller-indexed and archived byte-for-byte; no late unarchived file or post-controller-finish artifact is observed. The first receipt is likewise archived/indexed. These exact paths/digests require no archive repair or separate invention of acceptance.

## Pending sources, absent finalizer, and preservation

`pending-modules.json` excludes four final sources: `MarkovFourthBoundaryK0B`, `MarkovFourthGapK0B`, `MarkovFourthShiftK0B`, and `MarkovFourthSourceK0B`. None has an object or successful final build/replay. Boundary has a failed matching final build; Gap has four timed-out attempts, the last matching final source; Shift has a failed attempt and two timeouts, the last matching final source; Source has no build invocation. These unvalidated drafts are not included in the 25-module inventory.

The seven timeout receipts comprise Gap (approximately 180.166, 60.203, 60.192, 100.260 seconds), Shift (80.179, 100.261 seconds), and an older SqZero (120.587 seconds); final SqZero later succeeds and is replay-selected. Seventeen rejected return-code-1 attempts are individually indexed with exact hashes/errors in the companion. None is treated as successful. The two superseded successful builds are distinguished from these failures.

`research/finalize_0b212317.py` exists but has **no invocation** in retained events. The following are absent: `validation.json`, `preservation.json`, `operational-observations.json`, `source-review.json`, `artifacts.json`, `artifact-verification.json`, and `report.json` in the worker evidence directory, plus controller `final.json`. There is no `turn.completed` event and no controller report. The controller mathematical-resolution flag is false. This audit did not run the finalizer or manufacture missing aggregate files.

All **166 initial reconciliation checks** match current hashes. The auditor independently compared **175 initial hashes** with current bytes and found no mismatch; these are overlapping counts and the latter is an auditor-only comparison, **not** a worker-produced final preservation receipt. Shared before-run entries match. Raw contract digest `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, canonical JSON digest `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, and root source digest `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe` match their respective pins.

## Method limits

Drivers remain unchanged: `ReplayBatch07F1.lean` SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c.lean` SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Both union receipts carry the matching batch hash. The wrapper checks source hashes and successful builds before execution, then hashes the driver afterward; no per-invocation object hashes or file freezing are provided.

The driver collects all selected final/private object constants, not only named theorems, and invokes Lean replay/kernel checking. Unsafe/partial declarations can be skipped; axioms are admitted as axioms; duplicate map names overwrite; already-imported matching theorems can skip proof-body checking. The version-specific source/import checks and first receipt's header-count discriminator are therefore material. Pending dependency recursion does not create assumed declarations. Actual binary/generated/private inventories and object-at-load identity are not independently enumerated here. Reused compiled dependencies remain trusted; no official `leanchecker` CLI run, fresh whole-source rebuild, or independent per-declaration binary witness is established.

**1040 input hashes** rechecked unchanged at **2026-10-15T13:35:25.026366+00:00**. Supporting evidence: `markov_worker_000091_validation_evidence.json`; method note SHA256 `fe9372befcbfec830d2369be8111b6e60fc76f7e08f1885975a9ccec2cb822f2`, method evidence SHA256 `21edc5e2014899a1b1d779c45128d3a7e60bc9bcb677fbe542431899f080b667`.
