# Worker 000157 retained validation audit

Request `1bb0aa1ee066482294f620401d001bf2`. This is an archive-first, static audit of completed worker 157 and exact named predecessor/current counterparts. Active 158 is excluded. No project code, compiler, Lean proof, checker, replay, experiment, generator or finalizer was executed by the auditor; no mathematical values were recomputed. Only audit parsing, hashes, lexical inventories and saved-record consistency were computed. No project edits or proposer contact/help occurred. Earlier audit seals and their observation windows remain unchanged.

The controller records **completed / return code 0 / delivered structured report**, with `mathematical_resolution=false` and report `completion=null`. Eight new final mathematical modules have matching successful compiler receipts, a successful eight-module joint replay, and 43 printed theorem closures. Twelve unchanged worker 156 modules receive a separate successful joint replay and 44 printed closures in worker 157. Their compilation remains the saved worker 156 compilation. This is new recovery evidence; worker 156's historical timeout/null report, failed final replay/Audit, and absence of closure coverage at its sealed observation are not rewritten. The pinned root remains unresolved.

All claimed validation is assessed within ordinary compiled-import trust. This is not a fresh whole-source build, independent English/source completion audit, authentication of a compiler executable, or proof that the process loaded only the presently observed bytes.

## Inventory and source/object binding

There are 96 controller-recorded changed files and 96 regular archived files: 36 JSON, 30 Lean, 11 object, 11 Python and eight Markdown files. The Lean files are 18 build snapshots plus eight new mathematical sources, three Audit sources and one replay driver. Objects are eight new mathematical objects and three Audit objects. They are retained regular files, not merely names claimed in a report. An initial `rg --files` listing by the main auditor omitted ignored `.olean` names; explicit archive enumeration established their presence. No missing-object conclusion is drawn from that listing.

All 96 controller/archive/current hashes agree. Every build snapshot hashes to its receipt's source map. All eight final new sources match their archive/current/controller source hashes, selected successful snapshot, final replay map, matching Audit JSON source map and validation source map. Final objects match archive/current/controller and `validation.compiled_hashes`. All 12 recovered sources and objects match sealed 156 final bindings, controller `before 157`, preserved worker 156 archive, and current exact paths. Their matching successful worker 156 receipt and snapshot remain available. No final mathematical module is pending, compiled-only or unbuilt; no superseded successful new mathematical version exists.

The saved validation schema is `new_modules`, `reconciled_inherited_modules`, `source_sha256`, `successful_new_builds`, `joint_replays`, `axiom_audits`, and `compiled_hashes`; it has no prior-style `modules` table. Counts are independently obtained from actual final source declarations: new 43 theorems + 12 definitions = 55 explicit mathematical names; recovered 44 + 16 = 60. Definitions are included in replay isolation counts and are not additional theorem-print closures.

| New final module | Theorems / definitions | Selected successful build suffix |
|---|---:|---|
| `MarkovFirstForceM1BB` | 3 / 0 | `1792181163371230000` |
| `MarkovTailCorrectionM1BB` | 5 / 2 | `1792181405084525000` |
| `MarkovTailSourceM1BB` | 7 / 3 | `1792181491254620000` |
| `MarkovTailBinomialM1BB` | 7 / 0 | `1792181667682334000` |
| `MarkovCrossCertificateM1BB` | 9 / 5 | `1792181551863091000` |
| `MarkovCrossingLCM1BB` | 4 / 0 | `1792181667682144000` |
| `MarkovResidualM1BB` | 3 / 1 | `1792181798109679000` |
| `MarkovFirstRowM1BB` | 5 / 1 | `1792181883565625000` |

The first recovery Audit imports 11 ME9C modules and prints 42 closures; the second imports LowerDomain alone and prints its two. All 12 are selected in the recovery replay. All eight new modules are selected together in the final replay and new Audit. Across the three successful Audits, 87 requested rows are actually printed, all names distinct and exactly matching the final theorem inventory. The axiom JSON declarations match the corresponding successful compiler stdout; source maps match the imported final sources. Observed sets are 82 closures with `{propext, Classical.choice, Quot.sound}`, four with `{propext, Quot.sound}`, and one with `{propext}`. No disallowed axiom is printed.

The recovery uses exact worker 156 final hashes, including final LowDifference `59fe100078d8cac6c32e151b2bc12015ea2aec796b7845552e34a390c2eb5060`. Reconciliation lists 13 successful old compiler receipts: 12 match final sources and the superseded LowDifference receipt correctly reports `sources_match=false`. The earlier `562890b5…` source differs only in whitespace from that final source under the sealed 156 review. A false flag for this superseded receipt is not a failure of the final recovery binding. Recovery adds successful replay for the five modules that had only compilation in 156 and first explicit print coverage for all 44; it does not create new 156 receipts or alter its timeout classification.

## Rejected versions and chronology

Eighteen compiler attempts comprise 11 successes (eight mathematical + three Audit) and seven return-code-1 failures. There are no compiler timeouts in 157. Both replay invocations succeed; they are separate from the 18 compiler attempts. All seven rejected snapshots differ from the final selected source. Their declaration inventories and normalized theorem headers match the final statements; retained differences are proof/elaboration and local-option changes. No failed candidate supplies the validation of a later changed body.

The rejected versions are:

| Module | Receipt suffix | Retained failure / correction |
|---|---|---|
| FirstForce | `1792181077650893000` | `simp_all` demanded progress; final proof adds `try`. |
| TailCorrection | `1792181147589416000` | Missing FirstForce import object after its failed attempt. |
| TailCorrection | `1792181226505571000` | Identical source hash to previous failure, now elaborated after successful FirstForce; function equality and binomial/Pascal steps fail. |
| TailCorrection | `1792181335247329000` | Successor notation prevents the attempted rewrite; final proof separates rewrite and simplification. |
| TailBinomial | `1792181491254621000` | Arithmetic step plus compact `1<i+2` parser/type ambiguity and Boolean rewrite failure. |
| TailBinomial | `1792181545922168000` | Remaining Boolean equality rewrite; final uses `if_pos rfl`. |
| FirstRow | `1792181798109670000` | Ordinary `decide` cannot reduce the locally irreducible raw-coefficient function; final explicitly unfolds it. |

The first two TailCorrection snapshots share SHA `7bf045a338a4a7725bb189b61521b020b97298684d13e79dffc929e771887715`; the successful final is `61931d91e3b86a3cb22606d8e363c4d78b989ef9db878926062fc65a1c943ae3`. Source equality across those two failures does not imply identical available imports. The final FirstRow hash is `a084d18bc57d86ebb3da47b87033976a0d6e0188fe9d6bff2bcad0f858251149`, selected only after the successful retry.

Early mathematical builds use 120-second bounds. Final CrossingLC and TailBinomial, both FirstRow attempts and Residual use 150 seconds. All three Audits use 100 seconds, and both replays use 180. The saved method review finds no same-module compiler overlap and no completed same-source `file_change` item inside a build event interval; this is a bounded event-log predicate, not continuous filesystem observation and not a blanket exclusion of shell/generator writes.

Generator templates are separately corrected at events 150–151 while the final replay/Audit run. These edits affect Python template text, not the final Lean source being checked. FirstForce generation ran at 56; its generated proof was edited before its final build. Crossing certificate generation ran at 74; generated Lean was edited at 77–78 before its successful build. The final archived generator source is therefore not an invocation-time hash. Old generator bytes are not separately archived; saved commands and source snapshots preserve the specific visible corrections. No generator was rerun by this audit.

## Replay and print method

The ordinary driver reads selected object parts, forms their union of constants, removes selected module names from the direct imported base, imports that inherited base, checks guarded mathematical constants for prior presence and unsafe/partial status, then calls ordinary `env.replay`. The body runs on an `IO.asTask` and the caller joins its result. This is not a distinct proof-producing checker and does not freshly replay inherited compiled bodies. Conditional server/private object-part loading and invocation-time object/executable identity retain the limits documented in the companion method audit.

The actual validator suffix guard and driver namespace/suffix guard accept both M1BB and ME9C. The saved receipt `isolation_scope` prose still says names are suffixed M1BB only; that prose is stale. Actual code, complete selected-name maps and stdout establish 60 explicit ME9C names checked in the recovery replay and 55 M1BB names checked in the final new replay. Neither succeeds merely from a receipt's prose claim.

Recovery replay `1792180985973566000` selects the 12 exact final ME9C sources and succeeds over six total direct imports, including implicit Init. Its duration is 72.66485933301738 seconds. The new replay `1792181929291520000` selects eight final M1BB sources and succeeds over three total direct imports, including Init, in 50.61613824998494 seconds. New direct union is LowLCME9C, LowerUniformME9C and Init. Recovery direct union is BinomialTableM295, KernelShapeM4F4, LowerCandidateM96A, ThreeForceM96A, ThreeSolverM96A and Init.

Build wrappers hash sources and save a snapshot before compiling the live source path. Replay records hash sources before launch, parse explicit declarations, and hash the checker after execution. Audit source hashes are collected after compilation. Therefore source/snapshot/object/current agreement is strong retained-record consistency but does not authenticate every byte continuously through execution. No output object hash is recorded at compiler completion by the wrapper; the final source/object map is a later hash observation independently checked here.

## Inherited import boundary

The method map contains 2,521 inherited source/object identities: 2,509 sealed 156 inherited pairs plus the 12 sealed 156 final compiled pairs selected for recovery. Recovery replay excludes those 12 from its base, leaving 2,509. New replay's base has 2,515 nodes: the 2,509 older base plus six recovered 156 modules—LowDifference, LowForce, LowSolutions, LowSource, LowLC and LowerUniform. The other six recovered modules are not in the new replay base. New mathematical source closure is 2,523 nodes; recovery source closure is 2,521; their union plus three Audits is 2,532. All graph counts refer to static named import graphs, not new whole-source compilations.

All 212 historically compiled-but-unreplayed worker 121 backlog modules are inherited in both replay bases and every endpoint. The 195 historical subset and separate 19 historically accepted modules retain their distinct provenance. **Zero old 212 modules are selected or recovered here.** Recovery concerns the 12 worker 156 modules only. Imported old bodies do not gain fresh replay credit from successful target replay. Historical 134/135 recovery and failed/unbuilt alternatives retain their sealed distinctions: failed HighCone2GapM81F is distinct from accepted/imported HighCone2GapMF25; FallingGapMF25 and SourceFallingMF25 are not promoted.

WindowLC6d34 remains inherited and is neither among 12 recovery targets nor in old 212. Its exact source/object hashes match sealed 151-through 156 and before 157/current. Historical named build/leanchecker receipts and snapshots support limited old provenance and two old printed closures. The older receipt names its output path without an object hash, and the object was outside the older initial file snapshot used in the sealed 151 review. No new replay of this inherited body or authentication of its original compiler production is claimed. Named library source/object pins likewise remain imported-library observations, not fresh library checks.

The main auditor's 234 named older source comparisons agree with before 157/current and saved prior pins. Of these, 160 occur in the new replay base and 74 lie outside it; 166 occur in the union inherited/recovery pair inventory. All eight new source inventories agree across the mathematical and validation supports. Nine exact external source/object pairs are separately hash-bound; no inference that every named comparison is a currently selected replay target is made.

## Preservation, manifest gap and report predicates

The initial snapshot has 6,564 paths, including the request's own setup script and 189 bytecode files. All match current bytes. This means 6,563 entries after excluding the own setup, although the worker consistently reports the inclusive 6,564 as “inherited inputs.” Unlike the prior unused 156 finalizer, this finalizer excludes no own setup entry. The saved probe at 172 and finalizer 177 report no changes. There are 200 initial entries absent from controller before: 189 caches, own setup and 10 other named protected/configuration files. No contradiction is found among shared before/initial hashes; initial-only entries do not acquire invocation-start provenance. All 98 archived worker 156 artifacts remain hash-identical.

The 96-entry manifest and 96-file controller archive have only 93 common paths. The archive/controller-only paths are setup_1bb0aa1e.py, manifest.json and last-verification.json. Setup already belongs to the initial snapshot and is excluded from finalizer's “new research” list. Manifest/verifier exclude themselves. The manifest-only paths are:

| Exact project path | Bytes | Manifest/current SHA256 |
|---|---:|---|
| `research/__pycache__/lower_rows_1bb0aa1e.cpython-314.pyc` | 6,507 | `2eb97efc207596dcec20b5e51c54cf9a6287b243db2eed0e3d516aa3140e1046` |
| `research/__pycache__/row_probe_e9cdd527.cpython-314.pyc` | 3,654 | `8bc8c361e77bee39d1c50508b2f9f0ca5977995a43181bab49135b63866a0589` |
| `research/__pycache__/validate_1bb0aa1e.cpython-314.pyc` | 5,809 | `0ccd07d4c1baf9b33b97c11dd0edd2a76b24d0c5f1c12dd1a2bc86c8839ffd1e` |

All three exact current paths match saved manifest hashes; none is in the closed archive/controller changes or worker initial snapshot/controller before. The older-named row_probe cache is newly materialized here while its source is inherited and preserved. Their recorded mtimes are 20:18:42.778267, 20:15:13.173275 and 20:03:15.991047 UTC, before finalization/deadline. They are a retention gap, not inferred late effects. Opaque byte copies are preserved only under the audit temporary directory in `markov_worker_000157_manifest_only_inputs/`, with companion `markov_worker_000157_manifest_only_inputs.json` recording exact paths, size, hashes, mode, owner and mtime. No cache was imported, decoded or executed and no original archive/controller entry was manufactured. The manifest's 7,020,616-byte total is verified using its 93 archived members plus these three current matching caches, not by pretending all 96 are archived.

Reconciliation's six administrative booleans agree with the carried exact file hashes. Its prior 156 event hash, 219 events and last five event records match retained controller history, including both timeout outcomes. Current `.control/markov/inherited.json` is not read by this audit and no current-index/invocation-index identity is inferred.

The rewritten pipeline separates `validate_report_1bb0aa1e.py` aggregation (events 161–162) from finalizer 176–177. Aggregator requires successful exact new source build maps; successful old/new replay maps, pass text and checker hash; permitted axiom JSONs with matching source subsets; coverage of every theorem name; forbidden-token scanning of new sources; and presence/hash recording of compiled objects. It does not rebuild old sources or itself revalidate each axiom JSON's Audit return code and module-to-theorem ownership. Those actual receipts/maps/prints are independently checked in this audit. Finalizer requires unchanged initial hashes, pinned root/contract, null completion and new_theorems=43, then writes final-check/manifest/verifier. It relies on the saved validation JSON rather than rerunning validation. No finalizer/proof/experiment was executed by the auditor.

There is no saved report-draft JSON produced by this finalizer. The delivered final.json, receipt report and final event 182 parse identically; event 183 records turn.completed. The structured report remains partial mathematical progress and completion null. “Completed” describes this invocation, not resolution of the root.

## Saved experiment provenance

Tail output 102 exactly matches tail-experiments.json, lower-row output 128 exactly matches lower-row-experiments.json, and next-row output 170 exactly matches next-row-experiments.json. Correction-band output 147 equals the saved record after omitting only its examples field; all other values, including the runtime, match. Crossing generator output 74 prints the four `all_coefficients_positive` flags, matching that projection of crossing-certificates.json; it does not print the coefficient table. Source/manifest hashes bind the full saved table. These are retained-output bindings, not recomputation of values or sign claims.

The new finite scripts are main-guarded; lower_rows imports guarded older row_probe/alternate_shape, correction_band imports guarded lower_rows, and tail/next scripts import guarded low_probe/sparse helpers. The inherited sparse→three→probe chain remains guarded. FirstForce generator is top-level. None is imported/executed by the auditor. There are no runtime script-input hash tables or interpreter-start identities in the results. Final generator text follows events 150–151 and is qualified accordingly. One-off 93's saved cubic discriminant is documented without recalculating it.

The main mathematical/finite supports independently recount only input-index domains and explicit structural upper bounds. In particular, lower-row 8,450 and band 4,389 adjacent slots agree with saved counters but actual trimmed polynomial support/value computation was not repeated. Lower-row n includes 25 multiples of 3 (350 rows), outside actual numerator-three source classification; 52 admissible-residue n give 754 rows. Saved zeros, failures, coefficient values and positivity are not rerun or promoted into universal results. Precise mathematical scope, exceptional signed auxiliary correction, actual raw-LC witness and unproved recurrence/factorization bridges belong to the source audit.

## Timing and controller observations

Controller start is **20:01:25.395854 UTC**, epoch 1792180885.395854. The 1800-second deadline is **20:31:25.395854**. Host finish is **20:25:37.901950**, epoch 1792182337.90195, elapsed 1452.5060958862305 seconds, exactly matching finish minus start and 347.49390411376953 seconds before deadline. Checkpoint prose 20:01:34/20:31:34 is 8.604146 seconds later than the controller times; it does not replace them.

Recovery replay is estimated 20:03:05.973566–20:04:18.638425; first recovery Audit 20:03:16.014696–20:04:30.142126, overlapping it. LowerDomain's separate Audit is estimated 20:10:29.365529–20:10:55.790671. Last new source build is FirstRow 20:18:03.565625–20:18:29.675890. New replay is 20:18:49.291520–20:19:39.907658, overlapping new Audit 20:18:50.488234–20:19:43.573372. These finishes are receipt-identifier plus monotonic-duration estimates, not independently clocked process exits. All completed well before deadline by these estimates.

Observed current metadata: validation.json 20:21:48.660545; final-check 20:23:56.581384; manifest 20:23:56.606294; last-verification 20:23:56.616990. This last file is the latest changed artifact. Event-log mtime is 20:24:50.403024, heartbeat content time 20:24:51.206949, activity file mtime 20:24:51.207268, final.json mtime 20:24:51.315270, receipt mtime 20:25:37.902282. Distinguish heartbeat content from file mtime and event mtime from event timestamps. The host finish is 47.49892592430115 seconds after event-log mtime; no causal explanation is inferred.

The log has 183 events and 84 started items, all with completed counterparts. Event bytes 449,571 plus stderr 245 equal heartbeat 449,816 and the complete 183-line prefix. The 245 stderr bytes record a failed documentation patch-context match, not a mathematical compiler failure. Foreground failures include saved unavailable-capability/search/heredoc or SymPy incidents; no package installation or audit-side attempt to reproduce them occurs. End-of-log completion supports the bounded recorded invocation state, not an independent process census.

## Final bounded observation

All **9,488 exact named inputs** were rehashed unchanged from **2026-10-16T20:43:38.770323+00:00 through 2026-10-16T20:44:24.660861+00:00**. No named input was missing. This includes exact source/object pairs, controller/archive/current receipts, initial and prior pins, nine named external pairs, three mathematical/finite supports, sealed method note/evidence, pair map, and the three opaque cache copies plus companion. It is a bounded observation, not continuous runtime authentication or a claim of indefinite stability.

At **2026-10-16T20:44:24.682965+00:00**, archived/current exact report-draft paths were still absent and the three manifest-only cache paths remained absent from the original archive. Their current and separate-copy hashes still matched the saved manifest. At **2026-10-16T20:44:24.683011+00:00**, exact-request research-name and evidence-directory observation found no extra or missing current or archive artifact paths beyond the already documented manifest/archive set distinction. No late bundle was required. The separately preserved manifest-only cache bundle remains necessary and is not a late-file bundle.

Project reads closed at that late-observation time. Subsequent work is audit-files-only. A recheck of **11 bound audit-only inputs** was unchanged. The method companion's own 213-input window and 15 audit-only inputs remain its separately sealed observation; final integration agrees across 68 shared method fields, 2,521 independently reconstructed pairs and 202 shared input hashes. Earlier worker seals and project observation windows are preserved.

Final integration facts: {"fields": 68, "pairs": 2521, "shared_inputs": {"mismatches": {}, "shared_count": 202}}

Companion machine-readable evidence is `markov_worker_000157_validation_evidence.json`; independent replay-method support and inherited pair map are adjacent. All review artifacts are under `/private/tmp/math_gkm_godel_20261013`. The manifest-only cache copies are auxiliary retention evidence and preserve the gap in the original archive history.
