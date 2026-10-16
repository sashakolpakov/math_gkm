# Worker 000158 retained replay method and import audit

Request `ffd747f5c7a147069d5bfcaffb3e60e8`. Completed archive-first static review of retained worker 158 evidence and exact named current/prior counterparts. Active worker 159 is excluded. No project program, Lean compiler, checker, replay, experiment, generator or finalizer was executed; no mathematical values were recomputed, proofs repaired, project files edited or proposer contacted. Only audit parsing and hashes were run, with outputs under `/private/tmp/math_gkm_godel_20261013`. Earlier seals remain unchanged.

The retained evidence supports final source compilation, one successful joint replay of 11 selected modules, and explicit permitted-axiom prints for all 43 selected theorems. These modules also contain 14 definitions: 57 explicit declarations were checked by the isolation guard. The controller reports completed / return code 0 and delivers a report with `completion: null`. The separate generated candidate has 16 theorems and remains uncompiled, unselected, unreplayed and unprinted. This is evidence about the selected statements and inherited compiled import boundary, not full conjecture completion or a fresh whole-source build.

## Selected source and object bindings

Every selected source matches its retained successful source snapshot, successful build source map, replay source map, Audit source map, validation source map, controller after-hash and current source bytes. Each retained mathematical `.olean` matches the controller after-hash and exact current object. The worker validation record does not itself hash objects; the object associations below come from the independent static binding. All 11 successful mathematical versions equal final bytes; there is no superseded successful mathematical version in this run.

| Module suffix MFFD | Theorems | Definitions | Final build ID |
|---|---:|---:|---|
| RowBinomial | 3 | 1 | `1792182767572323000` |
| RowOperators | 11 | 4 | `1792182830794145000` |
| RowRecurrence | 5 | 3 | `1792182920844031000` |
| RowRational | 2 | 2 | `1792183206336315000` |
| FifthShape | 6 | 2 | `1792183166881983000` |
| FifthIdentity | 2 | 0 | `1792183402157729000` |
| RowTransfer | 3 | 1 | `1792183428028193000` |
| FifthSmall | 2 | 0 | `1792183485100034000` |
| FifthSource | 3 | 0 | `1792183612919655000` |
| Residual | 3 | 1 | `1792183644491775000` |
| RowDegree | 3 | 0 | `1792183690752471000` |

Full source/object hashes, paths and receipt bindings are retained in `compiled_source_object_bindings`. The one operational Audit source and object are separately bound to its successful build and 43 exact print directives. The checker is operational `unsafe` host code, outside the mathematical import graph; the Audit introduces no mathematical theorem declaration.

## Rejected versions and unused candidate

There are 22 compiler attempts: 11 successful mathematical builds, one successful Audit, eight return-code-1 failures and two timeouts. All ten unsuccessful snapshots retain the final declaration inventory and normalized statement headers; none contains an anonymous example or literal admission. Both timed-out RowOperators and RowBinomial snapshots are byte-identical to the later successful final sources. Acceptance comes from those later successful records, not the timed-out attempts.

| Unsuccessful build ID | Module | Outcome | Changed common declaration blocks versus final |
|---|---|---|---|
| `1792182576258418000` | RowBinomial | return code 1 | `rowJ_factor_coeffMFFD`, `weighted_binomial_coeffMFFD` |
| `1792182649664894000` | RowOperators | timeout | none; exact final bytes |
| `1792182656686451000` | RowBinomial | timeout | none; exact final bytes |
| `1792182869404679000` | RowRecurrence | return code 1 | `lower_row_formulaMFFD` |
| `1792182989049364000` | RowRational | return code 1 | `rowJ_mapMFFD` |
| `1792183096048609000` | FifthShape | return code 1 | `fifth_coeffMFFD`, `fifth_crossMFFD` |
| `1792183138339497000` | RowRational | return code 1 | `rowJ_mapMFFD` |
| `1792183269567944000` | FifthIdentity | return code 1 | `fifth_residual_rationalMFFD` |
| `1792183371652212000` | FifthIdentity | return code 1 | `fifth_residual_rationalMFFD` |
| `1792183654073598000` | RowDegree | return code 1 | `rowH_degreeMFFD` |

The first RowBinomial diagnostics concern an unequal algebraic goal and a natural-number bound conversion. RowRecurrence fails a definitional rewrite; RowRational fails cast/map rewrites; FifthShape has coefficient simplification and integer/natural index-bound failures; FifthIdentity first reaches the simplifier recursion bound, then leaves natural choose expressions; RowDegree leaves an arithmetic degree bound. No statement change or explicit parser defect is inferred from these diagnostics. Block comparisons are syntactic slices and can include following local option/attribute commands; they do not authenticate all elaborator behavior.

The first three mathematical attempts use 100-second bounds. The accepted RowBinomial build uses 220 seconds, most later mathematical builds use 180 seconds, and the final RowDegree rebuild uses 120 seconds. `build_batch_ffd747f5.py` runs modules sequentially at 180 seconds each and stops at the first nonzero/timeout outcome. The two 100-second timeouts overlap across different modules. No same-module build overlaps or completed same-source `file_change` item inside a recorded build event span were found. Every new dependency has a completed final-source successful build before its dependent final build starts. These checks do not establish compiler read instants or exhaustively authenticate shell/generator writes.

The candidate SHA is `4b63123fb40715ddc3dc7e19b775e1b0b44c2d8ce2513c5959fb63fa884725e7`. Its 16 distinct `fifth_small_poly…MFFD` / `fifth_small_row…MFFD` names do not collide with the selected 43 theorem names. It was generated at events 194–195 under `research/MarkovFifthSmallRowsMFFD.lean`, while the separate selected FifthSmall batch remained pending, then renamed at events 208–209 to `evidence/markov-ffd747f5/unused-small-rows-candidate.lean` before final validation. No build source map or snapshot matches its hash. Its imports add zero modules beyond the accepted inherited base. The generator's description that Lean checks every equality gives this unused candidate no validation credit. The selected FifthSmall instead has the two final theorems `fifth_small_boundedMFFD` and `fifth_small_allMFFD`.

## Checker, isolation, replay and axiom closures

The retained driver SHA is `54c76b2e019480f23d4dc9dd2d6cbeef9acd9a5b31a9fea142ebd29d50a55e45`. It is exactly worker 157's driver with both old suffix alternatives retagged to MFFD. Thus its literal condition repeats `endsWith "MFFD" || endsWith "MFFD"`, and the Python declaration assertion repeats `('MFFD','MFFD')`; both effectively select the single MFFD suffix. Every explicit selected mathematical declaration has that suffix. The guard requires absence from the inherited environment and rejects unsafe or partial selected constants. Its retained count is 57, matching the parsed 43 theorems plus 14 definitions.

Removing the isolated guard and normalizing whitespace leaves the previously retained Wide replay body unchanged. The driver loads selected object module data, unions constants, removes selected module names from the inherited direct-import union, imports that base, checks isolation, then calls Lean `env.replay newConstants` on a joined task with the requested stack. Repeated selected names, selected names in the local imported base, graph cycles and explicit selected-name collisions are absent. Compiler-generated equation names remain subject to ordinary Lean replay handling; the explicit-name audit is not an independent exhaustive proof of all generated-name behavior.

The single replay `replay-1792183723395969000.json` returns 0 after 56.558085042 seconds and reports 11 modules, seven total direct imports, 57 isolated mathematical constants and `replay union passed`. Its source map and declared-name map match all final sources; its post-subprocess checker hash matches the retained driver. The Audit `axioms-1792183806088311000.json` derives from `build-1792183780032815000.json` and prints exactly the selected 43 theorem names once. Forty-two closures have `propext, Classical.choice, Quot.sound`; only `raw_S_localMFFD` has `propext, Quot.sound`. There are no disallowed axiom sets, missing names or extra printed theorem names.

The sequential finisher invokes replay with a 220-second bound, waits for success, then invokes the Audit Python wrapper with a 150-second outer bound. Audit itself calls its one Lean build with a 100-second bound and verifies every requested print plus return code 0 before writing its axiom JSON. The wrappers name Lean 4.32.2, use the saved inherited search path preceded by current evidence, and set the retained Git/PATH environment. These are retained command/configuration observations, not independent authentication of the executable at invocation time.

Build wrappers hash and snapshot sources before invoking the compiler on the live named source path. Replay hashes sources before invocation and the checker afterward; Audit hashes its imported source maps afterward. The current and retained final bytes agree, but these checks do not prove compiler read-time source identity. Ordinary `.olean` hashes do not exhaustively authenticate optional server/private module parts, inherited object production, external libraries or every resolver choice at invocation time.

## Exact imports and endpoint boundaries

The direct inherited union contains six named modules: `MarkovBinomialTableM295`, `MarkovCross774`, `MarkovHorizontalLCB46`, `MarkovLowerShapeME9C`, `MarkovLowerUniformME9C` and `MarkovResidualM1BB`. Including implicit `Init`, the total is seven. The parsed local mathematical closure has 2,533 nodes = 11 current + 2,522 inherited; adding the operational Audit gives 2,534. External Mathlib/Lean imports terminate this local source walk. No whole external dependency tree or fresh library compilation is claimed.

The separate inherited-pair file has 2,522 exact source/object identities: 2,516 from sealed worker 157 inherited mappings and six accepted new worker 157 mappings. All match before-158 pins; no fallback origin is used. For each module, the first project-local candidate in saved LEAN_PATH order from that inventory agrees with the mapped object. This ordered-candidate metadata is narrower than authenticating the runtime or external resolver. The primary validator independently hashes every exact current source/object pair; its observation is recorded separately when supplied.

| Endpoint | Local nodes | Current modules | Inherited | Old 212 | Old subset 195 | Old accepted 19 |
|---|---:|---:|---:|---:|---:|---:|
| FifthIdentity | 2,520 | 6 | 2,514 | 212 | 195 | 19 |
| FifthShape | 4 | 1 | 3 | 0 | 0 | 0 |
| FifthSmall | 2,516 | 1 | 2,515 | 212 | 195 | 19 |
| FifthSource | 2,524 | 9 | 2,515 | 212 | 195 | 19 |
| Residual | 2,532 | 10 | 2,522 | 212 | 195 | 19 |
| RowBinomial | 2,515 | 1 | 2,514 | 212 | 195 | 19 |
| RowDegree | 2,518 | 4 | 2,514 | 212 | 195 | 19 |
| RowOperators | 2,515 | 1 | 2,514 | 212 | 195 | 19 |
| RowRational | 2,518 | 4 | 2,514 | 212 | 195 | 19 |
| RowRecurrence | 2,517 | 3 | 2,514 | 212 | 195 | 19 |
| RowTransfer | 2,518 | 4 | 2,514 | 212 | 195 | 19 |

FifthShape is the small standalone branch: it imports Cross774 and has only three inherited local modules. Every other endpoint includes the broad inherited source boundary, all 212 historical worker-121 compiled-but-unreplayed modules, the historical 195-module subset and the separately accepted 19 modules. None of those old 212 is a new compiler/replay target, so the global historical backlog is not recovered. The current 43 axiom prints do not convert imported bodies into fresh replay targets.

WindowLC6d34 is imported in the broad branches and absent from FifthShape. It retains exact source `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its earlier build printed only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; its old leanchecker stdout was empty and the old build receipt named the object without an output hash. The object was outside that older initial snapshot. Later before/current pins preserve an association, not independent old production authentication. Window is neither the old 212 backlog nor one of worker 156’s twelve recovery targets, and receives no fresh body replay here.

Historical worker 134/135 boundaries remain: 16 previously accepted 134 modules and all 23 modules recovered in worker 135 are imported, with that recovery provenance. The failed `HighCone2GapM81F` and old unbuilt HighAll/HighGap/Residual M81F remain excluded; accepted replacement `HighCone2GapMF25` is imported. Worker 135 imports HighAll, HighCone2Gap, HighGap and Residual MF25, while FallingGap and SourceFalling MF25 remain outside. Worker 136 imports BinomialInterior, BinomialMixed, Residual and SourceInterior MF1E; InteriorWitness MF1E remains outside. Historical late failed Audit evidence is preserved without promotion.

Worker 149 contributes BinomialTableM295; its other 15 accepted modules and pending EightNewton are outside. Worker 150 contributes KernelShape, LowerDifference, TwoKernel and UpperDifference M4F4; GapDegree, NewtonFinite and RegionDegree M4F4 are outside. Worker 153’s ten accepted and three unvalidated modules remain outside, with its timeout/null-report history unchanged. Corrected final worker-145 UpperScalar, final worker-146 UpperGlobal and final worker-151 DiagonalShape remain imported with their previous source/object and read-time limits; no superseded 145 scalar certificate receives import credit. Worker 155 contributes FibAddition, LowerCandidate, ThreeForce, ThreeSolver and ThreeSparse M96A; its BinomialInverse, InverseBoundary, SparseConvolution and SparseSign are outside. The evidence carries the remaining accepted/excluded historical sets explicitly.

Seven worker-156 modules are imported: LowDifference, LowForce, LowLC, LowSolutions, LowSource, LowerShape and LowerUniform ME9C. Their complete replay/44-print recovery belongs to worker 157; worker 156’s historical 12 compiled / seven replayed / zero printed / timeout/null-report outcome is unchanged. LowKernelLimit, LowLimit, LowResidual, LowerDomain and LowerReduction ME9C are outside the current graph. Six accepted worker-157 modules are imported: CrossCertificate, CrossingLC, FirstForce, Residual, TailCorrection and TailSource M1BB. FirstRow and TailBinomial M1BB are outside. No inherited module is freshly compiled or replayed in worker 158.

## Reconciliation, rewritten validation and finalizer

The current inherited path is exactly prior-157 evidence prefixed to its saved inherited path. The archived interrupted reconciliation binds worker 156’s raw event-log SHA, 219 events and exact last four events. It records the old replay/Audit timeout and attributes subsequent twelve-module recovery to 157. Setup records six administrative binding checks and checks all 96 prior-157 manifest entries; this audit does not parse the current inherited administrative index or infer its invocation-time identity.

Worker 157’s historical manifest/archive gap remains explicit: both inventories had 96 entries but intersected in 93. Its three manifest-only Python caches were separately preserved as opaque audit copies with companion SHA `4b5332ae66607c9ce5baa62407ec5755f9a5bb5519faa6dc9b4f57405a4cd8ef`. They were not part of the original 157 archive and are not late proof evidence. Worker 158’s finalizer rechecks the prior manifest’s 96 current paths, including those three caches; this does not retroactively repair the old archive inventory. No cache was decoded, imported or executed by this audit.

The actual worker-158 validation schema is `request_id`, module-name array, source-hash map, successful build-receipt path array, replay-receipt path, axioms-receipt path, closure count, permitted-axioms flag, limits and null completion. The evidence also supplies a distinctly labelled audit-normalized source/object table for future identity mapping; it is not an invented worker record. This differs from the prior recovery-specific validation maps.

The new sequential finisher first finds a successful source-matching build for each current module, choosing the lexically latest matching filename, then runs replay and Audit. It chooses the latest replay and axiom filenames, records post-check source hashes and writes the summary. It does not independently recheck those selected records’ complete maps, success text or checker hash, nor does it record object hashes. In the actual retained single-replay/single-Audit run, independent inspection binds these choices exactly; the filename policy alone is not a general race-proof guarantee.

The rewritten finalizer checks null completion, the permitted flag and current source hashes; scans selected sources for `sorry|admit|native_decide|axiom`; checks inherited preservation, prior manifest, root/contract and STOP absence; and asserts ten unsuccessful compiler attempts. Its token filter omits unsafe/partial, which the actual isolated driver checks for selected guarded constants. It does not rerun replay/Audit or independently authenticate all closure/object bindings. The exact inherited count is 6,597 after excluding two of 6,599 initial paths using the owned substring predicate: unchanged `setup_ffd747f5.py` and changed own checkpoint. The initial snapshot contains 192 Python caches. Initial and controller-before scopes differ, so optional missing pins are not treated as hash mismatches.

The finalizer writes final-check and a retained authored report, then builds a recursive evidence manifest excluding manifest/last-verification and a top-level research-file scan matching the short request tag or MFFD. It does not recursively select research caches. All 100 indexed entries are present among 102 controller/archive artifacts; the two additional files are manifest and last-verification themselves. The verifier reports 7,042,264 indexed bytes and no mismatches. There is no current retention gap.

One finalizer invocation is retained at events 225–226. Its stdout exactly matches both saved final-check and last-verification objects. Delivered event 227, controller report and final.json agree; event 228 is turn.completed. The authored draft report remains separate and differs from delivered content only in actions, agenda, observations and summary. Both retain null completion. Draft and delivered prose are not interchangeable evidence.

## Chronology and bounded observation

Controller start is 2026-10-16T20:26:39.650895+00:00; host finish is 2026-10-16T20:53:22.057288+00:00; nominal deadline is 2026-10-16T20:56:39.650895+00:00. Stored elapsed is 1602.406393766403 seconds, exceeding subtraction of stored finish/start timestamps by 0.953674 microseconds. Host finish is 197.593607 seconds before deadline. This offset describes host finish, not every earlier report/artifact timestamp.

Last mathematical build finish is estimated at 2026-10-16T20:48:24.834298+00:00. Replay runs 2026-10-16T20:48:43.395969+00:00–2026-10-16T20:49:39.954054+00:00; Audit runs 2026-10-16T20:49:40.032815+00:00–2026-10-16T20:50:06.082344+00:00, beginning 0.078761339 seconds after replay finishes. These finish estimates add monotonic durations to receipt-ID epochs and do not imply independent nanosecond wall-clock precision.

Original current validation mtime is 20:50:06.103284 UTC; final-check 20:51:44.407501; draft report 20:51:44.407613; manifest 20:51:44.474841; last-verification 20:51:44.481893. Their archive-copy mtimes around 20:53:22 are separately labelled copy bookkeeping. Event-log mtime is 20:52:43.107344 and controller final.json mtime 20:52:44.357350. All are before the nominal deadline. The 469,173-byte event log has 228 events and 107 started items, all completed. Event-log mtime is not heartbeat content time.

The primary validator’s independently saved inherited-pair hash observation is included in the evidence, with its own exact window and scope. It is distinct from this method input observation.

Final method observation: 161 previously pinned inputs were unchanged during 2026-10-16T21:14:07.885730+00:00–2026-10-16T21:14:07.933058+00:00; mismatches: 0. This includes 16 audit-only inputs. Exact named absence checks at 2026-10-16T21:14:07.933297+00:00 are recorded separately. Project reads ended after this bounded pass. Later review is audit-files-only; no future stability is inferred.

Machine-readable evidence retains inventories, source/import graph, name maps, rejected snapshots and diagnostics, compiler bounds, exact selected/source/object bindings, endpoint sets, ordered object candidates, historical exclusions, wrapper diffs, actual and normalized schemas, chronology and input hashes. The separate pair map is the precise input list for independent inherited source/object verification. All conclusions remain within retained static evidence and inherited compiled-library trust.
