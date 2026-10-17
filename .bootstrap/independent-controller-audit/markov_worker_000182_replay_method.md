# Closed worker 182: retained replay method, import boundary and provenance

This is an independent static audit of closed request `b3eed36486ad48a08ac07be4c9b62794`, using the controller archive for worker 000182 first, exact named current counterparts, and previously sealed inherited identities. It does not execute the project, Lean, a checker, a replay, a finalizer, an experiment or a generator; it does not recompute mathematical values or random samples. Active worker 183 and all successors are excluded. All audit writes are confined to `/private/tmp/math_gkm_godel_20261013`. Earlier observations and seals remain historical. Separate documentation-task files are outside this review.

The host outcome is `completed`, return code 0, with a delivered report, null completion and no root-resolution credit. Nine selected mathematical modules have 45 theorem declarations and nine definitions. All nine final sources have source-matching successful compiler receipts, a successful full-set kernel replay and one 45-name permitted-axiom Audit. An earlier successful replay covers eight of those modules, before TopSupport was added. There are no additional compiled-only or pending current mathematical modules. These recorded checks do not freshly rebuild or replay inherited bodies or authenticate the English mathematical conclusion by themselves.

## Selection, versions and compiler receipts

| Module | Theorems | Definitions | Final matching compiler receipt |
| --- | --- | --- | --- |
| MarkovTopCoefficientsMB3E | 8 | 1 | build-1792222921735559000.json |
| MarkovTopEdgeGapMB3E | 1 | 2 | build-1792222960745725000.json |
| MarkovTopEdgeSourceMB3E | 3 | 0 | build-1792223004926763000.json |
| MarkovTopEdgesMB3E | 5 | 0 | build-1792222951592905000.json |
| MarkovTopEquationMB3E | 8 | 1 | build-1792222209784325000.json |
| MarkovTopRegionMB3E | 5 | 2 | build-1792223013867093000.json |
| MarkovTopSumMB3E | 7 | 0 | build-1792222794967284000.json |
| MarkovTopSupportMB3E | 4 | 0 | build-1792223239842139000.json |
| MarkovTopTemplateMB3E | 4 | 3 | build-1792222581847603000.json |

Twenty-one compiler attempts comprise 11 successes, nine return-code-1 failures and one timeout. The successes comprise ten mathematical compilations across nine distinct modules and one Audit compilation. The ten unsuccessful attempts receive no final-proof credit. In particular, `build-1792222588926974000.json` is a TopSum timeout after 120.155120958 seconds; its raw record omits the `returncode` field, normalized to null in this audit. It is not a tenth return-code-1 failure.

TopTemplate has a superseded successful version: `build-1792222426494985000.json` has four theorems and two definitions; the final `build-1792222581847603000.json` has four theorems and three definitions, adds `topDiagonalDeltaMB3E`, and changes the template/source-template blocks. The earlier successful body is retained as a separate version. Both successful replays use the final template bytes. Every other successful mathematical snapshot and the Audit snapshot is final-identical.

| Unsuccessful receipt | Module | Outcome | Changed common blocks / final additions |
| --- | --- | --- | --- |
| build-1792222152151332000.json | MarkovTopEquationMB3E | return 1 | fib_rows_topMB3E |
| build-1792222309392369000.json | MarkovTopTemplateMB3E | return 1 | source_top_templateMB3E, topTemplateMB3E ; adds topDiagonalDeltaMB3E |
| build-1792222490472953000.json | MarkovTopTemplateMB3E | return 1 | source_top_templateMB3E |
| build-1792222588926974000.json | MarkovTopSumMB3E | timeout | top_diagonal_equationMB3E, top_template_parameterMB3E |
| build-1792222748696886000.json | MarkovTopSumMB3E | return 1 | top_template_parameterMB3E |
| build-1792222804316839000.json | MarkovTopCoefficientsMB3E | return 1 | top_delta_highMB3E, top_delta_oneMB3E, top_delta_twoMB3E, top_positive_supportMB3E |
| build-1792222866836112000.json | MarkovTopCoefficientsMB3E | return 1 | top_delta_highMB3E, top_delta_oneMB3E, top_delta_twoMB3E |
| build-1792222935347936000.json | MarkovTopEdgesMB3E | return 1 | choose_weighted_generalMB3E, top_edge_coeffsMB3E |
| build-1792222968280232000.json | MarkovTopEdgeSourceMB3E | return 1 | top_template_first_strictMB3E |
| build-1792223209461830000.json | MarkovTopSupportMB3E | return 1 | source_top_zero_tailMB3E, top_template_supportMB3E |

All ten unsuccessful snapshots differ from the final source. Their imports and common theorem headers agree after whitespace normalization; the first failed TopTemplate snapshot lacks the later definition. No declaration is removed. The TopSupport header difference is whitespace around `t < i`. These are lexical comparisons, not a proof-equivalence assertion. Diagnostics are retained literally; an elaborator-generated admission in an error message is not a source admission. No selected final source contains a parsed `sorry`, `admit`, `axiom`, `native_decide`, `unsafe` or `partial` token.

The wrapper hashes the source and copies it to a named `.lean` snapshot, then compiles the live research path using Lean 4.32.2 with `-j 1` and an evidence-directory `.olean` output. The source hash and copied snapshot agree for every retained build. Snapshotting is not an atomic compiler-input guarantee. No retained completed same-source edit event, final-source modification time or overlapping same-module compiler interval was found within the corresponding build. Batch command envelopes can contain successive builds; their outer exit code can be 1 even when an earlier constituent build succeeded. Each compiler receipt is classified independently. Mathematical build bounds are 90 or 120 seconds; the Audit bound is 100 seconds and both replay bounds are 120 seconds.

## Isolated replay and axiom coverage

| Replay receipt | Modules | Theorems / definitions | Observed guard count | Direct imported modules including Init |
| --- | --- | --- | --- | --- |
| kernel-1792223147507813000.json | 8 | 41 / 9 | 50 | 2 |
| kernel-1792223258039818000.json | 9 | 45 / 9 | 54 | 2 |

The first replay targets the eight final sources other than TopSupport (41 theorems plus nine definitions). The second targets all nine (45 plus nine). Their sole explicit inherited direct import is `MarkovHalfPlaneM5BF`; `Init` makes the reported import count two. Each target’s earlier source-matching successful build is identified. All source maps and checker hashes match the retained final bytes. The final validation summary selects only `kernel-1792223258039818000.json`; it does not erase or retroactively expand the earlier eight-module replay.

The retained checker `ReplayIsolatedMB3E.lean` has SHA-256 `391a3f43eea2eeee74de7d847b3f262eb28030f660085f55f9ea528c7a04f7b4`. It is an exact suffix retag of worker 181’s checker. After removing the explicit guard and normalizing whitespace/comments and the entry name, its replay body matches the retained worker 110 wide checker. This is a static text comparison, not fresh checker execution.

For each selected module the checker resolves its ordinary object; if a server companion exists it also loads that file and, conditionally, a private companion. It collects constants from the final loaded module-data part, unions them by name, and imports only direct dependencies whose module names are outside the selected set. It then finalizes that inherited environment. Every collected name with prefix `MathGKM.Markov.` and suffix `MB3E` must be absent from the imported base and neither unsafe nor partial. The duplicated suffix disjunction is redundant. This guard applies to every collected matching name, not merely the wrapper’s lexical list. It reports 50 and 54 matching names, agreeing with the explicit selected inventories, before calling `env.replay newConstants` and printing the success marker.

The wrapper separately enumerates anchored `theorem|def|abbrev` names and requires the selected suffix. Static source comparison confirms that its names match all selected declarations here. No target appears in its own inherited base; no selected explicit name collides with an inherited explicit name; no current source dependency cycle or duplicate selected declaration is found. This does not enumerate every generated/private constant or prove absence of binary name collisions. Differently named generated constants retain ordinary Lean replay handling. The checker is unsafe operational code, not a mathematical theorem or an independent kernel implementation. The toolchain, imported compiled bodies, optional module-data companions and dynamic object lookup remain trust boundaries; this audit does not freshly authenticate their production.

Only one axiom Audit is retained: `axioms-1792223268724899000.json`, generated from `MarkovAudit1792223258046800000MB3E` and successful build `build-1792223258046903000.json`. Its import/source map equals the final nine selected sources. All 45 literal `#print axioms` names match the 45 theorem declarations exactly; the raw successful compiler output reproduces every saved axiom list. Every list is `propext`, `Classical.choice`, `Quot.sound`. There is no separate first-stage Audit. The source map is sampled after compilation; the auditor’s static associations are stronger than an unqualified “success” label but are not fresh object-production authentication.

## Inherited dependency identities and historical limits

The selected source closure has 2,797 local modules: nine current mathematical modules and 2,788 inherited source/object pairs. Including the current Audit gives 2,798 local graph nodes. Both replay bases contain those same 2,788 inherited modules. Every one of the nine endpoint closures has 2,788 inherited nodes. The pair map comes from 2,782 sealed worker 181 inherited pairs plus six accepted worker 181 source/object pairs; there is no current-file fallback for missing expected identities. Controller-before182 source and object hashes agree with those sealed identities. The first existing object candidate in the saved inherited search-path order agrees with the expected object path. External library imports are listed separately; the entire external graph is not freshly traversed.

| Inherited worker 181 status | Modules |
| --- | --- |
| Imported | MarkovDriftClosedM5BF, MarkovFullBandRegionM5BF, MarkovHalfPlaneM5BF, MarkovOutwardMomentsM5BF, MarkovOutwardRatesM5BF, MarkovRadialCovarianceM5BF |
| Outside this graph | MarkovDriftStrictM5BF, MarkovDropObstructionM5BF |

The six imported worker 181 modules retain their original accepted scope. `MarkovDriftStrictM5BF` and `MarkovDropObstructionM5BF` remain comparison-only here. Importing a module does not mean every declaration is used in a new proof, and no imported body is newly replayed solely because it is in this base.

All nine endpoints include the old 212 unrecovered modules, including the 195-module subset, plus the separate 19 accepted modules. The 195 is not an additional backlog. Current validation neither recompiles nor replays the old 212 bodies. `MarkovWindowLC6d34` retains its historical empty-checker/two-print boundary (`runInterval_cross6d34`, `runInterval_smoothed_lc6d34`); no new print or body replay is granted to `crossLC_balanced6d34`. `MarkovAbel65c4` retains its separate historical source/object and two-print boundary (`tail_weight_nonneg65c4`, `centered_weight_nonneg65c4`), without a fresh closure print for `crossLC_center_weights65c4`. These limitations are not conflated.

Worker 166’s host completed with return code 0 and a report; its large combined replay timed out. The seven then compiled/printed but unreplayed prefix modules remain outside the current graph. Only `MarkovCorrectionFactorMDB2` is imported from that worker. There is no recovery or retroactive replay credit. The inherited nested phrase “historical 166 timeout” refers to that replay, not a failed host outcome. Worker 179’s compiled-only `MarkovDetTestMBEC` remains absent and receives no selected/replayed/printed credit.

Worker 156’s timeout/null-report history and the separate worker 157 twelve-module/44-closure recovery remain distinct. The worker 160 KernelLimit, 161 Column0, 163 PairCleared, 164/168 pending boundaries and later accepted/excluded versions retain their sealed qualifications. Worker 180’s RisingConvolution live-build overlap and FixedZeroClosed natural-subtraction correction remain historical qualifications, not new observations or recovery. Worker 171 remains `missing_or_malformed_report`, return 1, null report. Current setup compares its retained 280 raw events and last four events, and preserves its 127 artifacts; this reconciliation neither repairs the report nor establishes a new mathematical check. Earlier observation windows are not extended.

The independent validator’s named-pair observation is embedded verbatim: `{"all_unchanged": true, "audit_only_copy_path": "/private/tmp/math_gkm_godel_20261013/markov_worker_000182_independent_dependency_observation.json", "audit_only_copy_sha256": "1aff5e4fe2125ec886c9543448d41654e255fd15af8dea589da31bc9792e9d17", "cached_digest_lookup_used_for_pair_observation": false, "expected_basis": "Independent sealed181 validation evidence; method pair map crosschecked against those identities, no fallback current hashes.", "finish_utc": "2026-10-17T07:53:21.007719+00:00", "fresh_digest_for_every_source_and_object": true, "pairs": 2788, "start_utc": "2026-10-17T07:52:54.039852+00:00"}`. This is an independently recorded fresh hashing pass, separate from the final broader validation window.

## Wrapper, setup, finalizer and inventory boundaries

The validation wrapper, Audit wrapper, replay driver and finalizer match their worker 181 versions after exact request/suffix/predecessor retagging. Setup adds the raw contract SHA to reconciliation, uses an explicit `importlib.util` import and records the heredoc capability-failure description. The saved Python version is 3.14.6; GAP is found, Sage is absent and the SymPy lookup is false. These are worker observations, not fresh auditor capability tests; no GAP invocation is recorded in this request.

The raw `validation.json` has `modules` entries with `source_sha256`, a list of `build_receipts`, and `olean_sha256`; it has `kernel_replays`, one `axiom_audit`, `closures`, permitted axioms, rejected receipts, limits and null completion. The audit’s `compiled`/`successfully_replayed` views are explicit derived aliases. Finalizer object hashes are sampled after receipt selection, not stored in each compiler receipt.

For each selected module the finalizer scans raw text, including comments, for `sorry|admit|native_decide|axiom`; finds all unsorted successful receipts whose module-map entry matches the current source; and hashes the current object. It does not require an exact singleton receipt map. It requires a successful kernel receipt with exactly the selected module set and all current source hashes, but does not itself assert the checker hash, the printed success marker or raw isolation output. It takes the last unsorted current-source full-set axiom summary and checks permitted axiom sets, without independently asserting exact theorem-name coverage. The Audit wrapper itself verifies source-derived printed names and compiler success; this audit independently binds their actual retained records.

The finalizer writes validation before preservation checks, then asserts unchanged hashes for all 21,945 initial inputs and all 79 predecessor manifest entries, and the pinned root plus canonical-contract hashes. It builds the new manifest from matching top-level research filenames and files recursively under the current evidence directory, excluding manifest and last-verification themselves. It computes and reports `artifacts_verified` without a separate assertion of that field. There is one successful finalizer call, completed event 208; its entire output equals saved last-verification and reports true. Event 210 is a later count/stop check. The delivered report is event 211; event 212 is `turn.completed`.

The initial snapshot scans only `research`, `evidence`, and `MathGKM` files with suffix `.lean`, `.py`, `.md`, `.json`, `.toml`, excluding the current evidence directory. It does not globally exclude the current tag: `research/setup_b3eed364.py` is included, with no owned exemption. Objects/caches and `.g`/`.sing`/`.txt` files are outside this suffix scan. The fixed root/contract checks are separate from it. No separate documentation task is inspected here.

There are 95 manifest entries, all archived and hash-bound, and 97 archive/controller paths because manifest and last-verification are unindexed administrative files. The narrow manifest has no manifest-only retention gap. Exact current-request extra files, if any, are assessed separately by the validator; the predecessor’s broad historical supplements are neither silently recaptured nor given new proof credit. Archive-copy mtimes are distinct from original validation/report mtimes.

The archived `evidence/markov-b3eed364/report.json` is a longer pre-finalization draft. It shares the request ID, summary and null completion with the delivered report but differs in its actions, observations and agenda. The controller’s final.json, receipt report and event 211 agree with one another. The two report versions are retained separately; report existence does not replace compiler/replay evidence.

Contract serialization qualification: `{"compact_sorted_ensure_ascii_false_sha256": "f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4", "event": 49, "pinned_compact_ascii_sha256": "6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc", "raw_file_sha256": "cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068", "scope": "Raw file bytes, pinned ASCII-escaped compact JSON and ensure_ascii=False compact JSON are different encodings of the same parsed contract. Saved event49 labels the last encoding canonical; it is not the pinned canonical digest. No contract mutation inferred.", "stripped_file_sha256": "6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc"}`.

Opaque supplementary retention: `{"all_copy_hashes_and_selected_metadata_match": true, "bundle_path": "/private/tmp/math_gkm_godel_20261013/markov_worker_000182_unindexed_cache_bundle.json", "bundle_sha256": "eef84f26bc07f7a948e72225db40bfd8e05fb1139f4b66f25e9f7ea471fb0b34", "copies": 3, "manifest_only_count": 0, "observation_path": "/private/tmp/math_gkm_godel_20261013/markov_worker_000182_unindexed_cache_observation.json", "observation_sha256": "10129d2e1dc5d320b74c4a91d364165f126d0cb3d897f4cdfba6a41b0692a4ea", "scope": "Audit-files-only binding of three opaque copies; no source read, bytecode interpretation or execution. Complete companion records embedded. Initial97archive/100current exact-request scope is distinct from95manifest. No creation/process/source-version/successor attribution; older supplements remain separate.", "total_bytes": 20092}`. Complete companion records are embedded in the evidence. Copies are opaque byte records, with no bytecode interpretation, execution, production/source-version attribution or claim about a later worker.

## Timing and method limitations

| Record | Start UTC | Finish UTC (compiler estimates where applicable) |
| --- | --- | --- |
| Host | 2026-10-17T07:23:42.273260+00:00 | 2026-10-17T07:51:12.957626+00:00 |
| kernel-1792223147507813000.json | 2026-10-17T07:45:47.507813+00:00 | 2026-10-17T07:45:56.779974+00:00 |
| kernel-1792223258039818000.json | 2026-10-17T07:47:38.039818+00:00 | 2026-10-17T07:47:49.288180+00:00 |
| build-1792223258046903000.json | 2026-10-17T07:47:38.046903+00:00 | 2026-10-17T07:47:48.721875+00:00 |

The exact request budget is 1,800 seconds. Stored elapsed time is 1650.6843659877777 seconds, matching the host timestamp difference. Host finish precedes the deadline `2026-10-17T07:53:42.273260+00:00` by 149.315634012 seconds. The final selected mathematical build finishes at approximately `2026-10-17T07:47:26.623809+00:00`. The final replay and Audit overlap; the earlier replay is separate. The axiom JSON filename timestamp denotes its later write, not the Audit compiler start. Compiler interval estimates use the receipt filename timestamp plus recorded monotonic duration and do not authenticate a wall-clock start/finish independently.

The retained event log has 212 events, 100 started items and 65 command starts. Stderr is empty. Event-log bytes plus stderr bytes equal the recorded activity byte count. File mtimes, the activity record, report transport and host finish are separate clocks; no cause is inferred for their intervals. Earlier build failures, inspection-command failures and saved capability limitations are not converted into successful proof attempts.

Five final Python mathematical programs are retained: upper probe, symbolic probe, real-root probe, source experiment and edge generator. The four probes/experiments have `__main__` guards; the generator has top-level computation/writes and imports the guarded symbolic module. The real-root probe imports the two guarded probes and the inherited frame helper. This audit parses their interfaces without importing them. Generated source snapshots, final generator bytes and command/edit records are distinct provenance; no blanket assertion that all earlier invocations used the final generator is made. Finite domains, literal saved JSON/event projections and polynomial-serialization occurrences are reviewed in the primary companion. Experiments and saved counterexamples to stronger properties are not universal raw-LC proofs or refutations.

## Audit-owned refinements and companion review

- Pre-window own lexical parser refinement: First details pass stopped before evidence write on equation-style topTemplateMB3E def without :=. Original helper retained; added a lexical first-equation-clause header delimiter; second pass succeeded. No project code executed.
- Pre-draft message-only corrections: Early message called ten unsuccessful attempts ten rc1 and mislabeled one excluded181 module. Saved evidence always recorded9rc1/1timeout; corrected message to DriftStrict and DropObstruction exclusions. No source, receipt, graph or sealed input changed.
- Pre-window own report comparison: Augment pass stopped before evidence write on an overstrong equality assertion for saved report.json versus delivered report. Exact comparison showed same request/summary/null completion but different action/observation/agenda wording; both versions now explicitly retained.
- Audit-files-only companion comparison: The first audit-only adaptation stopped before writes on an accidental776 literal (broad count replacement); corrected to576. A subsequent pre-write equality assertion exposed that the primary symbolic saved object omits rows; compare its exact projection plus literal serialized row/term counts separately. No coefficients or signs evaluated. Auditor-owned182 adaptation compares literal saved finite records only. Domain arithmetic and mathematical values are not evaluated by this helper.

The audit-files-only H/S/F crosscheck passes: 576 named older mathematical source pins split 436 imported and 140 comparison-only; 18 external source/object pairs, 109 inherited scripts and 7 result identities. All selected source/declaration/import/object associations agree. The complete crosscheck is embedded in method evidence; its standalone temporary file is not an additional preservation dependency. No RNG or mathematical values were recomputed.

## Final bounded observation

`{"absence_check_count": 0, "absence_observation_applicable": false, "absence_observed_utc": "2026-10-17T08:04:44.391567+00:00", "absence_qualification": "Not applicable: all 9 current mathematical modules have retained successful ordinary objects. No new candidate-object absence observation and no extension of any old absence window.", "all_unchanged": true, "audit_only_input_count": 27, "finished_utc": "2026-10-17T08:04:44.391558+00:00", "input_count": 164, "mismatches": [], "object_absences": {}, "scope": "Exact named inputs only; no project program, mathematical computation, directory enumeration, documentation contents or active 183/successor reads. The three unindexed opaque supplemental copies are hashed without interpretation. This closes method project reads; later review is audit-files-only and prior windows remain unchanged.", "started_utc": "2026-10-17T08:04:44.337939+00:00"}`

`{"applicable": false, "observed_utc": "2026-10-17T08:04:44.391567+00:00", "paths": {}, "scope": "No new candidate-object absence check: every current mathematical module has retained ordinary object; prior absence windows unchanged."}`

Project reads are closed after this bounded named-input observation. Subsequent footer/sealer review is audit-files-only. It does not extend the observation or assert stability of unnamed/current-global files.

Audit-files-only correction at `2026-10-17T08:06:53.417129+00:00`: the companion summary and rendered paragraph had retained the stale inherited-script label 106, although the unchanged executed helper asserted 109 and compared every entry of the 109-script source inventory. This note and the embedded summary now say 109. The original companion record, helper, all static-input hashes and both completed observation windows remain unchanged. The evidence retains the original summary and old note/evidence hashes alongside this correction; no project file was reread and no observation was rerun.
