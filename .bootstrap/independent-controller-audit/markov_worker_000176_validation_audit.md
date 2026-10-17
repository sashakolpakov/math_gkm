# Worker 000176 retained validation and provenance audit

Request **be35517714ad4fa2a3e9e4312d96ce0a**, suffix **MBE3**, closed archive `/Users/sasha/math_gkm/.control/markov/workers/000176/artifacts`. Retained host outcome is **completed / return code 0 / structured report delivered**, with mathematical_resolution false. Receipt is 17,567 bytes, SHA 33543e3df060c25c91ca328bd183ecb926791204bba67bed6a74f56e182af1e7.

All eight final mathematical modules, containing 46 named theorems and eight definitions, have successful final-source compilation, one joint selected replay and matching axiom prints. The initial Audit prints seven modules/42 closures; the final Audit prints eight/46. There is no new pending, unbuilt or compiled-only mathematical module. These retained checks reuse inherited compiled imports; they are not a fresh whole-source rebuild or a proof of the full root.

This audit is archive-first, read-only and static. Own helpers parse text/JSON or hash exact named records. No project code, compiler, Lean proof, checker, replay, experiment, generator, CAS or finalizer was executed; no mathematical values or random draws were recomputed. No proposer contact/help or project modification occurred. Active177 and all later workers remain excluded. Audit writes are confined to the designated temporary directory, with all prior sealed files and observation windows unchanged.

## Final selected inventory

| Module | Theorems | Definitions | Selected successful build |
| --- | --- | --- | --- |
| MarkovTransposedBoundsMBE3 | 7 | 2 | build-1792213319154834000.json |
| MarkovTransposedSharpMBE3 | 8 | 3 | build-1792213534731679000.json |
| MarkovSeparatedChooseMBE3 | 3 | 0 | build-1792213592840214000.json |
| MarkovSharpMarginMBE3 | 4 | 2 | build-1792213685413240000.json |
| MarkovSharpTransportMBE3 | 6 | 1 | build-1792213762601210000.json |
| MarkovSharpObstructionsMBE3 | 8 | 0 | build-1792213863547046000.json |
| MarkovUniformCorrectionMBE3 | 6 | 0 | build-1792213884003566000.json |
| MarkovSharpScalarMBE3 | 4 | 0 | build-1792214068207388000.json |

Final source hashes agree across archive/current, controller changes, manifest, successful compiler snapshots, validation, replay and axiom-source maps. Ordinary objects agree across archive/current/controller/manifest and the finalizer’s post-selection olean_sha256 fields. Audit sources, objects, receipts, stdout, requested print names and emitted axiom JSON are independently matched.

Compiler receipts snapshot source before invoking the compiler on the live named source, and do not contain a produced-object digest. Finalizer object hashes are observations after build selection. Thus these checks do not create an atomic compiler-read/output attestation. No completed selected-source edit occurs inside its retained foreground build command; no same-module build intervals overlap; final source mtimes are outside their own build intervals and all final objects predate the final replay. One earlier successful SharpObstructions version is superseded, as detailed below.

| Module | Final source SHA 256 | Ordinary object SHA 256 |
| --- | --- | --- |
| MarkovTransposedBoundsMBE3 | f1bb6298336c8ffcce84361beef414aa8570577527deee55c84fc05d95304b2c | 5b6ec93ec95d8ecf0d6cb3676cb8aba1cc516037bb405a53cc309ad6a3fbd5f4 |
| MarkovTransposedSharpMBE3 | fc2b965ecef4320f4b928939d3397d9a5ba4c6828c688254e3d517a385388efe | 28c664df27ab3e535dc707a01bca1853ca97ad8ec5d6c148b765dce1f977861c |
| MarkovSeparatedChooseMBE3 | b4cf75026c5d4276a8658fc75b6caf7b48cc3bf995a2a3a6365e81a900a3b9b3 | 686572155f38b8a5e598833669bd0cecd40a1a95cc2f041eb49cee87f4fe8480 |
| MarkovSharpMarginMBE3 | a82f97ea84cd99a93293bb348624c0e291e60d748e952085a47d6cc02bee05fb | 1f64b0d2afbc00313b79e50a539c027a6457bc5e3e8b94a28b40bca2a04c772d |
| MarkovSharpTransportMBE3 | 4273e5e8eb56b1c80eaf0d84685efa33fe617178b58f3f2de3cb23b56c4d9c41 | 681e58f9b5c180e564a2f0c0105d87dd040ec99278be7924988892f52e56b78d |
| MarkovSharpObstructionsMBE3 | 09340dca34ccc77fb35ae59e618e374e1e52745385cb85c0df104014e14bbc67 | aa37997266b4731369860395f97fe9ad743a72546818a5c7fe2e1ca5547be8e0 |
| MarkovUniformCorrectionMBE3 | fabaa6f1fd479f0bd0b2f49f7cdd0e116af5f42061c00fef86626790068b3c7c | 1a3ff857ab9b432fd740fa59dda8c84de5f339904388201cb3879e1038632112 |
| MarkovSharpScalarMBE3 | f04dd93d45d8ade7273073a991390fcd6fe5e0f64188780d591a6bc2ebd8cce8 | 90b3635b6ab51439c89aea6e2a5bbdc97ec38642a3a2f93dc75f6df82006b11d |

## Compiler versions and retained failures

There are **19 compiler attempts**: 11 successes (nine mathematical builds, including one superseded version, plus two Audit modules), eight return-code-1 failures, and no timeout. All failed snapshots and diagnostics remain retained; no failed version receives proof credit.

The first Bounds failure has a different correction_relativeMBE3 statement: its left multiplier is transposedBaseMBE3, whereas the final theorem uses liftTermMAE9 j s 0. The final source adds correction_second_relativeMBE3, correction_term_nonnegMBE3, shifted_choose_budgetMBE3 and correction_choose_budgetMBE3. The next Bounds failure already has the final theorem headers; repair introduces an explicitly typed cast intermediate. Sharp, SeparatedChoose, Transport and Scalar failures retain their final headers and imports, with proof-body normalization/cast/rewrite repairs. Margin changes the premise binder H to HM to avoid collision with a local natural H; this is a binder-name correction, not a new premise type. The failed Uniform version precedes three added theorems: weighted_value_boundMBE3, band_output_uniformMBE3 and source_band_uniformMBE3; common headers remain unchanged.

Successful Obstructions receipt 1792213781265187000 binds source75fb874fe2fd3959f40add01b980605c34e6a2786b09fa762bcf4eac6e3fe65e. Final source09340dca34ccc77fb35ae59e618e374e1e52745385cb85c0df104014e14bbc67 adds source_three_eleven_pathMBE3 and is rebuilt by1792213863547046000. Existing theorem proof blocks are unchanged; trailing end segmentation must not be described as a changed gap proof. The earlier ordinary object is not separately authenticated by the final object. Both later Audit stages and the final replay bind the final source including the path theorem.

| Non-final receipt | Module | Return code | Changed headers | Added theorem names |
| --- | --- | --- | --- | --- |
| build-1792213183348932000.json | MarkovTransposedBoundsMBE3 | 1 | correction_relativeMBE3 | correction_choose_budgetMBE3, correction_second_relativeMBE3, correction_term_nonnegMBE3, shifted_choose_budgetMBE3 |
| build-1792213274385751000.json | MarkovTransposedBoundsMBE3 | 1 | none | none |
| build-1792213481424387000.json | MarkovTransposedSharpMBE3 | 1 | none | none |
| build-1792213527241400000.json | MarkovSeparatedChooseMBE3 | 1 | none | none |
| build-1792213618939808000.json | MarkovSharpMarginMBE3 | 1 | sharp_cut_marginMBE3 | none |
| build-1792213698035521000.json | MarkovSharpTransportMBE3 | 1 | none | none |
| build-1792213781265187000.json | MarkovSharpObstructionsMBE3 | 0 | none | source_three_eleven_pathMBE3 |
| build-1792213830219975000.json | MarkovUniformCorrectionMBE3 | 1 | none | band_output_uniformMBE3, source_band_uniformMBE3, weighted_value_boundMBE3 |
| build-1792214014634455000.json | MarkovSharpScalarMBE3 | 1 | none | none |

## Replay and axiom chronology

Event173 writes the initial seven-module list and runs Audit, producing 42 print rows. Event187 appends SharpScalar. The only replay then covers all eight final modules, and the final Audit covers all 46 theorems. Total retained print rows are 88, with 46 distinct names, all using exactly propext, Classical.choice and Quot.sound. The first Audit is not an earlier seven-module replay.

All mathematical build limits are 120 seconds, Audit limits100, and the final replay limit180. Final replay and Audit overlap; their own receipts and events are separately bound. Inner timestamp-derived starts and duration-derived finishes below are estimates, distinct from outer command event order and from archive-copy timestamps.

| Receipt | Mode | Modules | Start UTC | Estimated finish UTC | Saved seconds |
| --- | --- | --- | --- | --- | --- |
| build-1792213976521583000.json | build | 1 | 2026-10-17T05:12:56.521583+00:00 | 2026-10-17T05:13:05.340226+00:00 | 8.818643332982901 |
| replay-1792214091215313000.json | replay | 8 | 2026-10-17T05:14:51.215313+00:00 | 2026-10-17T05:15:05.114771+00:00 | 13.899458375002723 |
| build-1792214092382705000.json | build | 1 | 2026-10-17T05:14:52.382705+00:00 | 2026-10-17T05:15:05.136748+00:00 | 12.75404254096793 |

The two axiom JSON files are axioms-1792213985323524000.json and axioms-1792214105140084000.json, generated from Audit modules 1792213976521510000 and 1792214092382602000 respectively. The compiler receipt identifiers differ from those Audit module identifiers; they are not interchangeable.

Checker SHA is b8ea66a48749b1d1f1f299bae4d5b23d855fb0f35a1f2ff11657a6e3822df63a. It gathers all selected module constants, imports only dependencies outside the selected list, rejects every collected MathGKM.Markov name ending MBE3 that is already imported, unsafe or partial, and calls ordinary environment replay. The repeated MBE3 suffix disjunction is redundant. Observed guard54 equals46 explicit theorems plus 8 definitions. This is not an exhaustive named inventory of generated/private constants; those retain ordinary module replay handling. Validate, Audit, driver and finalizer are exact predecessor retags after complete current/predecessor normalization. Setup differs substantively by also bootstrapping Audit, inlining root/contract calculations and revising prose.

## Inherited import and historical boundaries

Independent expected identities reconstruct **2,736 inherited source/object pairs** from sealed 175:2,724 inherited pairs plus 12 accepted175 modules. No expected identity is inferred from current bytes. The retained 05:23:19.841707–05:23:19.856160 dependency interval compares cached input digests; it is not a fresh byte-hashing window. The preliminary digest-population pass has no complete retained timing record. The final bounded pass will hash every pin afresh. Every pair matches controller-before 176 and current source/object hashes, and the independent method map. The worker initial snapshot excludes ordinary objects, so it is not the expected-object source.

The selected mathematical closure contains 2,744 modules, or2,746 including the two Audits. There are two direct inherited imports in the joint replay: MarkovTransposedKernelM657 and implicit Init. Every selected endpoint inherits the same2,736-module base. This includes the old212 worker 121 backlog, including its195 subset, plus the separate19 historically accepted modules. Current replay does not newly recover those212 compiled bodies. WindowLC and Abel retain historical object-production/empty-checker-output/two-printed-closure limitations; importing their stronger helper bodies is not a fresh body replay or print audit.

Worker 166’s seven compiled-and-printed but unreplayed prefix modules remain excluded, with no recovery; its accepted correction component remains inherited. Worker 156’s original timeout and worker 157’s later twelve-module recovery are distinct historical facts. Worker 160 KernelLimit, worker 161 Column0, worker 163 PairCleared and old combined168 candidates retain their original statuses. Nothing in worker 176 retroactively upgrades an earlier report or absent validation.

The separate reconcile_be355177.py invocation at event 171 checks old171 raw event SHA a44e032f46681be10e6e0ec9ba62796b499e6ea8eb36e804602fbfd4c6594ba1, all 280 events including the final four, and 127 manifest hashes. Its historical host status remains missing_or_malformed_report / return code1 / null report. The script’s causal prose is a retained interpretation, not a new controller classification or replay. Independent checks preserve that status.

## Initial preservation, finalizer and report

The suffix-filtered initial map covers research/evidence/MathGKM .lean, .py, .md, .json and .toml paths, excluding the current evidence directory. All 21,355 entries match, with no owned exemptions. The two current-owned entries are setup_be355177.py and markov-be355177-checkpoint.md; the other21,353 entries are an inventory distinction, not a creation chronology. Checkpoint-2 is separate. Objects and cache/CAS extensions are absent from this suffix map. Documentation contents are not reviewed.

Setup records inherited/predecessor mismatch lists without enforcing all of them before writing; independent actual comparisons pass. Finalizer checks all initial hashes, all 353 predecessor175 manifest entries, fixed root and canonical contract. Only110 predecessor entries occur in the worker’s suffix map and 137 in controller-before 176; complete353 preservation is separately checked. Its stale comment claiming setup excluded the current prefix does not match the retained setup.

Finalizer selects successful current-source build entries and records current object hashes, requires successful current-source replay coverage, current-source axiom maps covering selected theorem names, and permitted axioms for those names. It does not itself require singleton build maps, a single joint replay, matching checker hash, replay success text, exact theorem-name-set equality, or direct binding to successful Audit receipt/object/stdout. Independent retained-record checks establish the actual stronger bindings. Its comment-stripped forbidden-token check is lexical. The recorded version-command return code is zero but is not asserted by finalizer; no output-creation lock exists.

One finalizer invocation at197–198 succeeds with 8modules/46 closures/8 failures,328 indexed paths,21,355 unchanged inputs and 353 prior paths. Its preservation object equals last-verification.json. Final validation SHA 243a6544bbd43e6dee802374331983b480a2a1fe85aff1680b65a0d4255492de and manifest SHA d61c1fa6e4e28dd9862e072e0c2526cacb4369f045e99048ca6c0823f1af1837 agree with current/archive bytes. Report199 equals final.json and controller.report, followed by turn.completed200. No separate report draft is retained; no absent-report check applies to this completed run.

## Manifest-only retention

Controller/archive have100 paths:10 objects,42 JSON,30 Lean,12 Python and 6 Markdown. The328-entry manifest shares98 paths with archive. The two administrative archive-only files are manifest.json and last-verification.json. The230 manifest-only paths comprise219 .pyc,9 .g,1 .sing and 1 .txt files. They are not all new and not all caches: finalizer also includes research paths absent from its suffix-filtered initial map.

Exactly 227 match sealed 175 manifest-only hashes. Three additional exact176 paths are research/__pycache__/scalar_probe_be355177.cpython-314.pyc, transposed_stress_be355177.cpython-314.pyc and validate_be355177.cpython-314.pyc. Initial exact-request inventory at05:20:11.030639 UTC finds100 archive/103 current paths. Archive/manifest union330 is a different scope. No missing current counterpart or unrecorded archive path was observed.

Under explicit authorization, all 230 manifest-only files were copied opaquely to markov_worker_000176_manifest_only_bundle/, with two companion JSON records. Metadata observation 05:23:04.987760 UTC is separate from the initial inventory; copy window 05:23:05.049588–05:23:05.096073. Total 2,083,558 bytes; source/copy bytes, mode, uid, gid and mtime agree. No bytecode interpretation, execution or creation/process/source/successor attribution is made. Original archive/index/controller and old seals remain unchanged. Required preservation is 12 core audit files plus 232 supplemental files,244 total including integrity.

Bundle JSON SHA dce13533c3cbacb0d283242b2f9feaaaa0211b323a2991166e4f00de9d814225; observation JSON SHA 3eb8078188aeb90ff9a64526c3028c94074ecaac5d6832d128a47f85e4f1af9a. They enumerate every exact source/copy path and hash. Prior authorized closed172–174 storage COW is a separate operation preserving content/mode/uid/gid/mtime; inode/ctime/birth/access metadata is not mathematical evidence or an extension of prior windows.

## Saved finite and generator records

| Result | Event | Projection |
| --- | --- | --- |
| transposed-stress.json | 40 | full |
| robust-probe.json | 54 | full |
| scalar-probe-first-observed.json | 77 | full |
| scalar-probe.json | 130 | line 1 |
| relative-margin-probe.json | 87 | full |
| source-experiment.json | 163 | full |
| candidate-stress.json | 171 | line 2 |

All seven saved objects match their retained stdout projections. Source-progress equals source-experiment without seconds. The scalar program executes at top level: event 77 is its first run; importing parts at130 reruns it and overwrites scalar-probe.json. Event171 materializes scalar-probe-first-observed.json by substituting the first elapsed-time literal. Exact event 77/130 comparisons independently confirm all other fields agree. This is transparent reconstructed first-output retention, not a separately captured original file version.

Six mathematical programs and one generator are retained. Transposed stress, candidate stress and source experiment have guarded main routines; robust/scalar/relative probes execute at top level. The exact inherited source, three and column helper main guards were read statically. One-offs91,130 and 139 are retained literal observations only. Generator/build commands114 and 122 preserve rejected and successful generated Lean snapshots; final generator includes H→HM repair, while earlier generator bytes are not separately snapshotted. No invocation-time generator authenticity is inferred from final bytes alone.

The mathematical companions distinguish deterministic index counts from saved random/value-dependent totals. Stress has 4,032 deterministic triplets/3,667,104 deterministic coefficient positions plus 600 saved random cases; the combined9,809,279 is not independently regenerated. Candidate has 896 deterministic tuples less75 guard exclusions=821 eligible plus 2,000 saved random cases, and 11,851 deterministic complete-coefficient positions. Source has 44 families/319 rows/24,055 coefficients/23,417 triples, including 12,636 polygon triples,23,098 kernel identities and 19,648 uniform-bound positions. Zero count10,781 is saved-only. No polynomial/coefficient/gap/sign/random computation occurs in this audit.

Accepted source scope is auxiliary sharp bounds, conditional complete-margin/top-scalar transport and a concrete actual 3/11 witness. SharpCompleteMarginMBE3 and SharpTopScalarsMBE3 remain unproved. The top-scalar equivalence retains the complete-margin premise and index guards. The old quantitative certificate and a termwise shortcut fail in their own precise auxiliary senses; this does not refute raw LC. No new root clause is removed; ThreeBeyondBandM657 and OtherFourM9E2 remain.

## Timing and audit observations

| Observation | UTC |
| --- | --- |
| Controller start | 2026-10-17T04:54:15.876559+00:00 |
| Nominal deadline | 2026-10-17T05:24:15.876559+00:00 |
| Host finish | 2026-10-17T05:17:50.586224+00:00 |
| events.jsonl | 2026-10-17T05:17:20.638363+00:00 |
| final.json | 2026-10-17T05:17:22.535214+00:00 |
| Activity content | 2026-10-17T05:17:22.253346+00:00 |

Saved elapsed is 1414.709665775299 seconds; direct timestamp difference is 1414.7096650600433. Their difference 7.152557373046875e-07 seconds is about 0.715256 microseconds, retained as floating-point bookkeeping discrepancy. Host finish is 385.29033493995667 seconds before deadline; final-report mtime is 413.341344833374 seconds before deadline. All original controller-listed artifact mtimes precede finish/deadline. Validation current mtime 05:16:41.723962 and last-verification 05:16:45.165841 are distinct from later archive-copy mtimes. No cause of the report-to-host-finish interval is inferred.

There are 200 events and 94 started items with terminal records. Event-log 444,934 bytes plus empty stderr match activity byte accounting 444,934. Neither new pending-object nor absent-report checks apply, and historical absence observations are not extended.

## Audit-owned refinements and closing status

An initial dependency-helper call yielded before output capture. Its later unsealed evidence write omitted already-written supplement fields; the supplemental parser detected this before its own output write. The unchanged companion records and 230 copies were rebound, followed by completed independent dependency/supplement/version checks. No project or retained-copy bytes changed and no closing window existed. A preliminary wrapper comparison also incompletely normalized the full request identifier; the corrected comparison preserves the earlier audit diff and accurately identifies setup changes versus exact finalizer retag. The prior boundary prose count was corrected to 227. These are pre-window audit-file corrections, not source or mathematical changes.

Mathematical companions match all final declarations and source hashes, 516 older source pins (384 imported / 132 comparison-only), 16 external source/object pairs, 75 inherited scripts and 11 result pins. Saved finite records agree without value recomputation.

Independent method agreement: 79 fields, 2736 inherited pairs, 373 shared hashes; no mismatch.

Final bounded observation: 25188 unchanged named inputs, 2026-10-17T05:33:16.985012+00:00–2026-10-17T05:33:41.899745+00:00. Exact-request scan 2026-10-17T05:33:41.921037+00:00: 100 archive/103 current paths, the same three caches and no additional/missing paths. All 230 source counterparts and 230 copies pass selected metadata/hash checks. No new absence observation applies. Project reads are closed; 478 temporary pins recheck unchanged. Subsequent work is audit-files-only.
