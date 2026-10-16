# Worker 000157: retained replay method and import audit

Request `1bb0aa1ee066482294f620401d001bf2`. Controller outcome is **completed, return code 0, delivered report**, elapsed **1,452.5060958862305 seconds**. This static review uses the completed worker-157 archive/controller records, exact named current counterparts and sealed inherited evidence. **Active worker 158 is excluded.** No project program, Lean compiler, proof, checker, replay, finalizer, experiment or generator was executed. No mathematical value was recomputed, proof repaired, proposer contacted or project file edited. Only audit files in `/private/tmp/math_gkm_godel_20261013` were written.

**Result:** eight new mathematical modules have matching final compilation, a successful joint replay and 43 explicit theorem-closure prints. They contain **43 theorems and 12 definitions**, or 55 explicit declarations. Separately, all **12 preserved worker-156 final modules**, containing **44 theorems and 16 definitions**, receive a successful new joint replay and 44 prints in worker 157. These are two successful replay invocations, not one twenty-module union.

The recovery is credited to worker 157 only. Worker 156 remains historically TIMEOUT / return code 0 / null report, with seven successfully replayed modules, five compiled-only modules and zero explicit prints at its sealed cutoff. No old source was recompiled in this recovery; existing final compiled objects were selected. Recovery adds successful body replay for the five previously unreplayed modules and repeats it for seven, while supplying all 44 previously absent theorem prints. It does not change earlier observation windows or constitute recovery of the separate old worker-121 backlog.

The root remains open. Explicitly checked equivalences do not prove their remaining predicates, and conditional imported shape statements do not discharge their premises. Mathematical/source correspondence, exact source regions and finite evidence are handled by the source companion. This note concerns validation method, identities, versions, imports and chronology.

## Current inventory and final byte bindings

The archive and controller contain **96 matching artifacts**. The manifest also has **96 entries**, but the sets are not identical: **93 paths are common**, with three paths unique to each. There are eleven archived `.olean` objects: eight mathematical objects and three Audit objects. Current final source bytes, compiler snapshots, replay source maps, Audit source maps and saved object hashes agree for the eight new modules. No new mathematical source is unbuilt, pending, omitted from final validation or superseded after a successful build.

The actual `validation.json` schema uses `new_modules`, `reconciled_inherited_modules`, `source_sha256`, `successful_new_builds`, `joint_replays`, `axiom_audits` and `compiled_hashes`; it does **not** contain the older `modules` table. Machine-readable method evidence preserves that raw schema and provides a separately labelled normalized new-module table for subsequent identity comparisons.

| Module | Theorems | Definitions | Final successful build | Final source SHA256 |
| --- | --- | --- | --- | --- |
| MarkovCrossCertificateM1BB | 9 | 5 | 1792181551863091000 | `065a3387014f700897da133f69eee179b83b0136247dda9c2c18d089f9ffee28` |
| MarkovCrossingLCM1BB | 4 | 0 | 1792181667682144000 | `3aa836496862b013cbd24ca91e6ba219218e05d20b5692cbfdd4f9f5614a1ee1` |
| MarkovFirstForceM1BB | 3 | 0 | 1792181163371230000 | `75c6c6aac47048024ffddfb7a4d7823da5eb22fa45569ffaef50d315433cfc5d` |
| MarkovFirstRowM1BB | 5 | 1 | 1792181883565625000 | `a084d18bc57d86ebb3da47b87033976a0d6e0188fe9d6bff2bcad0f858251149` |
| MarkovResidualM1BB | 3 | 1 | 1792181798109679000 | `6cddfed02de01826d78dc20ba293a5bbac74832de3306361e5b8c63708ebf2c4` |
| MarkovTailBinomialM1BB | 7 | 0 | 1792181667682334000 | `9c3f178f941f380bc693fa1704fd876cd304c7503e820c15af283be34c1dc476` |
| MarkovTailCorrectionM1BB | 5 | 2 | 1792181405084525000 | `61931d91e3b86a3cb22606d8e363c4d78b989ef9db878926062fc65a1c943ae3` |
| MarkovTailSourceM1BB | 7 | 3 | 1792181491254620000 | `78d113dde292021af08d5512f900eb6216c3dd43709d6195e5e70989662e8dbd` |

Every final matching build finishes before any dependent final matching build starts. The final eight-module replay and Audit occur after all eight matching builds. Object hashes in method evidence bind the exact current/archive/controller bytes and the aggregator’s `compiled_hashes`. Ordinary compiler receipts name the object output path but do not independently hash the produced object at the instant of compilation. These are preserved source/object associations, not continuous compiler-read or object-production authentication.

The source inventory finds no literal admission, new axiom, `native_decide`, unsafe or partial declaration in these mathematical sources. All explicit new names end in M1BB and all recovered names end in ME9C. This literal scan supplements the actual replay/print records; it does not assert a whole-source mathematical audit.

The three manifest-only paths are Python caches, not proof objects:

- `research/__pycache__/lower_rows_1bb0aa1e.cpython-314.pyc`
- `research/__pycache__/row_probe_e9cdd527.cpython-314.pyc`
- `research/__pycache__/validate_1bb0aa1e.cpython-314.pyc`

They are absent from the completed controller/archive inventory. The validation companion separately checks their exact current bytes against manifest pins and preserves audit copies without executing/importing them. This difference is not evidence of a late proof check and does not allow a blanket “all 96 manifest files are archived” claim. The three archive-only paths are the already-initial setup script plus `manifest.json` and `last-verification.json`. The 93 common artifacts include all mathematical objects and retained compiler/replay/Audit receipts.

## Exact worker-156 recovery

Recovery replay `replay-1792180985973566000.json` selects all twelve final ME9C modules and reports **12 modules, six total direct inherited imports including implicit Init, 60 isolated mathematical constants, replay union passed**. Its source hashes equal sealed worker-156 final source hashes and before-157 pins. Each inherited object equals the sealed final worker-156 object and current/archive bytes. The corresponding old successful build and snapshot are individually bound; none is replaced with a superseded successful snapshot.

No worker-157 mathematical compiler command targets these old twelve modules. The inherited Audit commands compile new operational sources importing those objects. The first Audit prints 42 theorems from eleven modules, deliberately excluding LowerDomain from that invocation; a later Audit prints LowerDomain’s two theorems. Together they cover all 44 theorem names once.

| Recovery Audit | Selected inherited modules | Prints | Compiler build |
| --- | --- | --- | --- |
| MarkovAudit1792180996014432000M1BB | 11 | 42 | build-1792180996014696000.json |
| MarkovAudit1792181429365146000M1BB | 1 | 2 | build-1792181429365529000.json |

All twelve recovered modules remain separately identified in `recovered_worker156_bindings`. Six occur in the new eight-module replay base: LowDifference, LowForce, LowSolutions, LowSource, LowLC and LowerUniform ME9C. The other six—LowResidual, LowLimit, LowKernelLimit, LowerShape, LowerReduction and LowerDomain—are independently recovered but outside the new-module dependency graph. Their new checks do not imply that all twelve are dependencies of the new result.

Reconciliation records **13 old successful build receipts**: twelve final matching source versions and the earlier successful LowDifference whitespace variant. That earlier variant correctly has `sources_match: false`; the final separately rebuilt LowDifference is selected for recovery. Its old superseded produced object was not separately preserved or hashed, and it receives no current selection credit. The retained false flag is an expected version distinction, not final-source corruption.

The old worker-156 timeout receipts, absent finalizer outputs and null report are not rewritten or backfilled. New successful records live only in worker 157’s paths. This is new evidence over preserved compiled bodies, not a fresh reconstruction of the previous run.

## Rejected versions and bounded commands

There are **18 compiler attempts: eleven successes and seven return-code-1 failures, with no timeout**. The eleven successes are eight final mathematical sources and three Audit sources. There is no superseded successful new mathematical version. Both separate replay invocations succeed. Every rejected snapshot retains the same explicit declaration inventory and normalized theorem headers as its module’s final version; the changes are in proof blocks. Failure never grants partial theorem credit.

| Rejected build | Module | Changed final proof blocks |
| --- | --- | --- |
| build-1792181077650893000.json | MarkovFirstForceM1BB | lower_force_twoM1BB |
| build-1792181147589416000.json | MarkovTailCorrectionM1BB | first_forceM1BB, first_gain_binomialM1BB |
| build-1792181226505571000.json | MarkovTailCorrectionM1BB | first_forceM1BB, first_gain_binomialM1BB |
| build-1792181335247329000.json | MarkovTailCorrectionM1BB | first_gain_binomialM1BB |
| build-1792181491254621000.json | MarkovTailBinomialM1BB | binomial_second_solveM1BB, first_diff_exceptionalM1BB |
| build-1792181545922168000.json | MarkovTailBinomialM1BB | first_diff_exceptionalM1BB |
| build-1792181798109670000.json | MarkovFirstRowM1BB | exceptional_source_not_refutedM1BB |

The first FirstForce attempt fails with a simplifier no-progress diagnostic. TailCorrection’s first two rejected attempts have identical source bytes: the first fails because FirstForce has not yet produced an importable object; the second reaches elaboration after that dependency succeeds. A third TailCorrection attempt fails at a natural-predecessor rewrite. These are distinct operational outcomes, not different theorem statements.

The first TailBinomial failure includes arithmetic elaboration and compact-token parsing/type diagnostics at the literal `1<i+2`; the later rejected version retains only the exceptional-case proof failure. Its final successful version has the same seven theorem headers. FirstRow’s rejected version fails in the concrete source-example proof; the final changes that proof block without altering its five theorem headers or one definition. These diagnostic descriptions are historical observations, not proof repair or advice.

Early mathematical builds have a **120-second bound**. The final CrossingLC and TailBinomial builds, both FirstRow attempts and the Residual build use **150 seconds**. All three Audit compilations use **100 seconds**. Both joint replays use **180 seconds**. No 157 failure is a timeout, and the prior-156 100-second final timeouts remain their separate history.

No same-module build intervals overlap. The retained event predicate finds no completed same-source `file_change` item within a build interval; this does not authenticate every shell/generator write or the compiler’s read instant. At events **150–151**, while final replay/Audit run, the worker edits the two Python generator templates. These are generator-text edits, not changes to the selected final Lean sources. Their final source-map bindings still match. The auditor does not run the revised generators or infer that final generator bytes were used for earlier generation.

## Replay isolation and explicit closures

The driver remains ordinary Lean environment replay, with the unchanged joined task and stack option. It reads selected object parts, constructs the union of their constants and imports only direct dependencies outside the selected list. It checks explicit collected mathematical names in namespace `MathGKM.Markov` ending in **M1BB OR ME9C** for absence from the imported base and rejects unsafe/partial constants. It then invokes ordinary `env.replay`. Removing only that guard yields the same normalized earlier Wide checker body.

The substantive changes from the retagged worker-156 driver/validator are the dual-suffix guard and the validator’s dual-suffix declaration assertion. The Audit wrapper is an exact full retag with the same 100-second compilation bound. However, the saved `isolation_scope` prose still says “Every explicitly declared mathematical name is suffixed M1BB.” That literal metadata is stale for recovery. The actual driver/assertion accept both suffixes, the exact selected source names match, and the successful recovery stdout reports all 60 constants. Metadata wording is not substituted for code or observed output.

The new replay `replay-1792181929291520000.json` selects exactly the eight M1BB modules and reports **eight modules, three total direct imports including Init, 55 isolated mathematical constants and passed replay**. The recovery and new selections are disjoint. Neither selected set appears in its imported base; static explicit-name comparisons find no duplicate selected names or collision with the corresponding base. New replay imports six already recovered ME9C modules as dependencies; it does not reselect their bodies in that invocation.

Driver SHA256: `61baad3c11a181801c3a30f623de790942313c32a325d6f7fa03fc46273cf564`.
| Replay | Selected modules | Explicit names | Direct imports including Init | Transitive local base |
| --- | --- | --- | --- | --- |
| replay-1792180985973566000.json | 12 | 60 | 6 | 2509 |
| replay-1792181929291520000.json | 8 | 55 | 3 | 2515 |

The final new Audit imports all eight modules and requests all 43 theorem names exactly once. Saved source, compiler snapshot, stdout and axiom JSON agree. Across all three Audit invocations, there are **87 rows and 87 distinct theorem names**: 44 inherited and 43 new. Definitions contribute to replay counts but are not additional theorem-print rows.

The inherited 44 prints divide into 42 using `{propext, Classical.choice, Quot.sound}` and two using `{propext, Quot.sound}`. The new 43 divide into 40 using the standard triple, two using `{propext, Quot.sound}`, and one using `{propext}`. Overall that is **82 / 4 / 1**. No empty-set print or other axiom is inferred.

The checker hash is recorded after subprocess completion. Replay source maps and compiler snapshots are taken before invocation, while the compiler reads live named sources; Audit source maps are taken after compilation. The aggregator hashes compiled objects after the checks. These timings do not authenticate invocation-start executable bytes, all optional object parts, the historical production of imported objects or a fresh rebuild of all imported sources. The retained executable path is Lean **4.32.2**, compilation uses `-j 1`, and replay uses stack size **131072**.

## Import graph and endpoint limits

The complete union across new modules and the three Audit sources has **2,532 local nodes**. New mathematical closure alone has **2,523 = eight new + 2,515 inherited**. Recovery closure has **2,521 = twelve recovered + 2,509 other inherited**. The independent pair map spans **2,521 inherited source/object identities** across both activities: 2,509 sealed-156 inherited pairs plus twelve sealed-156 compiled finals. All match before-157 pins with no fallback.

The recovery direct named union is BinomialTableM295, KernelShapeM4F4, LowerCandidateM96A, ThreeForceM96A and ThreeSolverM96A, plus implicit Init: **six total**. The new direct named union is LowLCME9C and LowerUniformME9C, plus Init: **three total**. Transitive counts are not direct-import counts.

| New endpoint | Local closure | New modules | Recovered 156 modules | Other inherited |
| --- | --- | --- | --- | --- |
| MarkovCrossCertificateM1BB | 2518 | 4 | 5 | 2509 |
| MarkovCrossingLCM1BB | 2520 | 5 | 6 | 2509 |
| MarkovFirstForceM1BB | 2515 | 1 | 5 | 2509 |
| MarkovFirstRowM1BB | 2518 | 4 | 5 | 2509 |
| MarkovResidualM1BB | 2521 | 6 | 6 | 2509 |
| MarkovTailBinomialM1BB | 2517 | 3 | 5 | 2509 |
| MarkovTailCorrectionM1BB | 2516 | 2 | 5 | 2509 |
| MarkovTailSourceM1BB | 2517 | 3 | 5 | 2509 |

FirstForce imports LowerUniform. TailCorrection imports FirstForce; TailSource and TailBinomial import TailCorrection; FirstRow imports TailBinomial. CrossCertificate imports TailSource; CrossingLC imports CrossCertificate and LowLC; Residual imports CrossingLC. The endpoint evidence records exact source paths and selected subsets. The new FirstRow branch does not import the entire crossing-certificate branch, and the residual branch does not import FirstRow/TailBinomial. The final joint replay still selects all eight.

Saved Lean-path order prepends the worker-156 object directory to its inherited path. Each mapped object is the first project-local candidate in that saved order according to before-157 metadata. This is an ordered preserved-candidate check, not a live search of active paths or blanket invocation-time resolver authentication. Source and object roles are not interchangeable. External Mathlib/library branches remain compiled imports; this reviewer does not expand their full transitive graph or freshly compile/replay their bodies. Named external source/object observations belong to the source companion and do not provide blanket library binary provenance.

### Historical backlog and excluded branches

Both replay bases and every new/recovered endpoint import **all 212 old worker-121 compiled-but-unreplayed modules**, including the distinguished 195 subset, plus the separate 19 historically accepted modules. None of those 212 is selected by the new compiler or either replay. **Current recovery of that old backlog is zero.** The twelve recovered worker-156 modules form a separate later group; recovering them does not recover inherited dependencies beneath them.

All 23 old worker-134 recoveries remain imported with worker-135 provenance. The four worker-135 accepted imports remain HighAll, HighCone2Gap, HighGap and Residual MF25; FallingGap and SourceFalling MF25 remain outside. Failed HighCone2GapM81F stays distinct from accepted replacement MF25. The three old unbuilt M81F branches and the historical late failed Audit remain excluded/unrecovered. No old failed receipt is upgraded.

The four worker-136 imports remain BinomialInterior, BinomialMixed, Residual and SourceInterior MF1E; InteriorWitness remains outside. The exact historical exclusion list, later worker boundaries and old-153 timeout/pending exclusions are preserved in evidence. No worker-153 accepted or unvalidated module enters either current graph. Pending worker-149 EightNewton remains outside; BinomialTableM295 is the sole accepted worker-149 mathematical import in these branches. Worker-155 imports are FibAddition, LowerCandidate, ThreeForce, ThreeSolver and ThreeSparse; BinomialInverse, InverseBoundary, SparseConvolution and SparseSign remain outside.

Corrected worker-145 Scalar, final worker-146 Global and final worker-151 DiagonalShape retain their sealed final identities and historical qualifications. No superseded earlier source is credited through an import. The named `MarkovWindowLC6d34` remains imported, separate from both old 212 and the twelve newly recovered ME9C modules. Its preserved source/object binding and old limited prints of `runInterval_cross6d34` and `runInterval_smoothed_lc6d34` remain the available historical support; old checker stdout was empty and the old compiler receipt did not hash its produced object. Worker 157 supplies no new Window body replay or all-declaration audit.

## Rewritten aggregation, finalization and reconciliation

A new `validate_report_1bb0aa1e.py` aggregates saved receipts at events **161–162**. It explicitly names eight new and twelve old modules; selects source-matching successful new builds; requires exact successful old/new replay source maps, success text and the current checker hash; collects source-map-matching axiom records with permitted sets; and requires every expected theorem name. It scans new source literals for `sorry|admit|axiom|native_decide|unsafe`. The filter restores `axiom` compared with the older finalizer history; it does not include `partial`, while the actual driver guard rejects partial selected constants and the independent source scan is clean.

The aggregator hashes `.olean*` files for the new and recovered modules and writes validation plus the eight-module list. It does not newly compile the old sources. It does not independently reconstruct each axiom JSON’s Audit source/build or assert that record’s compiler return code; this audit separately binds all three Audit sources, matching successful receipts and exact stdout. No arbitrary record is accepted merely because the aggregate says permitted.

The separate rewritten finalizer executes once at events **176–177** and returns 0. Before writing outputs it checks every initial entry and the pinned root/canonical contract. It loads validation and directly asserts only `completion is None` and `new_theorems == 43`; it does not rerun aggregation, replay or all 87 closures. Its manifest includes new research files relative to the initial snapshot, plus evidence files except manifest/verifier themselves. It writes final-check, hashes the manifest and **asserts an empty mismatch list** before writing last-verification. STOP presence is recorded, not asserted absent. These are exact static predicates, not a broader proof-completion certificate.

All **6,564 initial entries** are checked, including the own setup script; there is no own-setup exclusion. The saved foreground preservation check at **171–172** also reports all 6,564 unchanged. Final-check and last-verification report 96 manifest entries, with the cache/archive qualification above. The companion independently checks the complete initial inventory, all 98 old worker-156 archived artifacts, fixed administrative bindings and exact manifest/current identities.

Setup reconciliation records the prior worker-156 event log hash, **219 events and its last five events**, plus the 13 successful-build source checks. The field is now `event_count`; the previous `count`/old-153 nested schema is not assumed. It has no latest-155 manifest projection or old-153 reconciliation tail field. Earlier timeout and pending histories are preserved through sealed evidence; their effects are not replayed.

Setup reads the administrative inherited index, but this auditor does not read current `inherited.json` or infer its invocation-time identity. The worker’s own document describes earlier denied broad enumeration; that is attributed worker history and is not an auditor action. This review uses only exact named completed/current/prior paths and excludes the active successor.

No authored draft-report JSON is retained. Delivered structured report at **event 182** equals controller `final.json` and the receipt’s report; **event 183** is `turn.completed`. Null mathematical completion is distinct from successful administrative completion. Root and remaining predicates are not marked solved.

## Timing and observation limits

Controller start is **2026-10-16T20:01:25.395854+00:00**, nominal deadline **2026-10-16T20:31:25.395854+00:00**, and host finish **2026-10-16T20:25:37.901950+00:00**. Stored elapsed equals the retained timestamp subtraction and host finish is **347.493904 seconds before deadline**. No cutoff overrun is inferred.

| Replay/Audit | Start UTC | Duration-derived finish UTC |
| --- | --- | --- |
| replay-1792180985973566000.json | 2026-10-16T20:03:05.973566+00:00 | 2026-10-16T20:04:18.638425+00:00 |
| replay-1792181929291520000.json | 2026-10-16T20:18:49.291520+00:00 | 2026-10-16T20:19:39.907658+00:00 |
| build-1792180996014696000.json | 2026-10-16T20:03:16.014696+00:00 | 2026-10-16T20:04:30.142126+00:00 |
| build-1792181429365529000.json | 2026-10-16T20:10:29.365529+00:00 | 2026-10-16T20:10:55.790671+00:00 |
| build-1792181930488234000.json | 2026-10-16T20:18:50.488234+00:00 | 2026-10-16T20:19:43.573372+00:00 |

The first inherited Audit begins **10.041129827 seconds after** recovery replay and finishes **11.503700256 seconds after** it. The final new Audit starts **1.196713924 seconds after** new replay and finishes **3.665714025 seconds after** it. These are overlapping checks, not serial “Audit after completed replay” claims. The separate two-print LowerDomain Audit occurs later than the recovery replay.

The stream has **183 events**, **449,571 event-log bytes**, **84 started items** and no unmatched start. Its final event is turn.completed. Event-log **mtime** is **2026-10-16T20:24:50.403024+00:00**; it is distinct from heartbeat content and does not timestamp every individual event. Receipt filename epochs plus stored monotonic durations yield finish estimates, not an independently recorded process-exit trace. Close receipt identifiers do not independently establish nanosecond wall-clock precision.

The validation companion independently observes original current artifact mtimes: validation.json **20:21:48.660545**, final-check.json **20:23:56.581384**, manifest.json **20:23:56.606294**, and last-verification.json **20:23:56.616990 UTC**. The method evidence separately labels its archived final-check/verifier mtimes as archive-copy bookkeeping; they must not be substituted for original writes.

The independent inherited-pair observation checks all **2,521 pairs** unchanged from **2026-10-16 20:36:39.381804 to 20:37:38.805251 UTC** against sealed156, before157 and exact current source/object bytes, with no mismatch or fallback. This attributed companion observation is not a new mathematical build or replay.

The finalizer/check/report chronology is retained independently from those estimates. Archive-copy metadata is not a new validation run. Full byte preservation, activity accounting, exact current/archive late observation and separately preserved manifest caches belong to the validation companion. Any later exact-request file would require separate attribution without retroactively improving earlier closed-run checks.

All **213 exact method inputs**, including **15 audit-only inputs**, remained unchanged during **2026-10-16T20:42:49.666335+00:00–2026-10-16T20:42:49.734953+00:00**. These include the three opaque cache preservation copies and their companion. The same bounded pass confirmed **five fixed absences**: the three manifest-only cache paths remain absent from the original archive, and no archived/current request report-draft JSON is present. This preserves the archive gap; it does not insert cache files into the original archive or infer continuous absence.

**Project reads stop at the end of this observation.** Subsequent crossreviews and integrity work use audit files only. The companion independently conducts its broader preservation and exact-request late-file observation. Earlier seals are not extended, and no missing validation check is rerun.

Sealed evidence: `markov_worker_000157_replay_method_evidence.json`, **13,059,784 bytes**, SHA256 `7ffddfd29390e0f4c1aa9377ca9e5c5654e5d659798142e6fabd1c3d599b929f`. Independent pair and original-artifact timestamp observations are explicitly attributed to the validation companion; archived artifact mtimes remain separately labelled copy bookkeeping.

Machine-readable method evidence: `markov_worker_000157_replay_method_evidence.json`. Pair identities and endpoint membership: `markov_worker_000157_inherited_pair_expectations.json` plus the evidence's endpoint table. All historical seals remain immutable. No missing check or proof was executed by this auditor.
