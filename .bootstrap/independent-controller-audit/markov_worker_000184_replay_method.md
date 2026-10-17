# Worker 184 retained method, import and provenance audit

Request `eb6a900170904ab59255de637301f446`; completed / return code 0 / delivered report / mathematical_resolution=false. This is an independent static reading of closed worker 184 records. No project program, compiler, Lean proof, replay checker, finalizer, generator, experiment or CAS was executed or imported. No mathematical values or random paths were recomputed; active worker 185 and later material was not inspected. Writes are confined to the audit temporary directory. The root conjecture remains open.

The selected inventory comprises **21 mathematical modules, 94 theorems and 46 definitions**: eleven new worker 184 modules (40/20) and ten unchanged worker 183 modules (54/26) now rebuilt and jointly replayed in worker 184. There are no additional compiled-only or pending mathematical modules in this closed inventory. The Audit module is operational and counted separately. Historical worker 183 remains uncertain_effects, interrupted controller/watchdog, null report, no receipt and no recorded replay/axiom prints. Recovery is dated to worker 184; the original zero-byte partial archive object and all worker 183 observation windows remain unchanged.

## Inputs and exact validation coverage

Reads began with `.control/markov/workers/000184/artifacts`. Eleven new final research sources are archived there. The ten old-tag recovered sources are in the manifest but were not changed controller paths, so their successful worker 184 archived build snapshots supply retained source bytes. Each matches its sealed worker 183 source, controller-before184 and initial-input hashes, current named counterpart, successful build snapshot, final validation source map, replay map and axiom source map. Each new final source has the same final-source chain. Archived/current ordinary objects hash-match; all ten rebuilt recovered objects also equal the sealed worker 183 ordinary-object bytes.

Compiler receipts record source hashes and source snapshots before invoking Lean on live paths. They do not record the compiler output object digest at completion. Archive/current object equality is a later observation, not an atomic source-to-object attestation. Static event ordering found no completed same-source edit inside its build command interval, no same-module estimated build overlap, and no final source mtime inside its own estimated build interval. These negative observations do not remove the general live-path or binary-trust limitation.

| Selected module | Theorems | Definitions | Status | Inherited project closure |
|---|---:|---:|---|---:|
| `MarkovTopFourthM55C` | 4 | 1 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopSecondGapM55C` | 1 | 4 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopSecondSourceM55C` | 5 | 0 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopKernelM55C` | 6 | 5 | Recovered 183, checked 184 | 2,792 |
| `MarkovTopMomentsM55C` | 11 | 5 | Recovered 183, checked 184 | 2,792 |
| `MarkovTopSectorM55C` | 6 | 2 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopObstructionsM55C` | 8 | 3 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopRegionM55C` | 2 | 2 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopParameterPolyM55C` | 7 | 3 | Recovered 183, checked 184 | 2,797 |
| `MarkovTopLeadingM55C` | 4 | 1 | Recovered 183, checked 184 | 2,797 |
| `MarkovPolynomialBoundMEB6` | 1 | 2 | New 184 | 0 |
| `MarkovTopGapPolynomialMEB6` | 7 | 3 | New 184 | 2,797 |
| `MarkovTopFiniteStripMEB6` | 4 | 2 | New 184 | 2,797 |
| `MarkovTopSourceRegionMEB6` | 5 | 2 | New 184 | 2,797 |
| `MarkovTopVandermondeMEB6` | 4 | 1 | New 184 | 2,797 |
| `MarkovTopThirdGapMEB6` | 3 | 1 | New 184 | 2,797 |
| `MarkovTopTailKernelMEB6` | 3 | 0 | New 184 | 2,797 |
| `MarkovTopTailScalarMEB6` | 1 | 6 | New 184 | 2,797 |
| `MarkovTopTailClosedMEB6` | 3 | 0 | New 184 | 2,797 |
| `MarkovTopTwoEdgesMEB6` | 6 | 1 | New 184 | 2,797 |
| `MarkovTopFrontierMEB6` | 3 | 2 | New 184 | 2,797 |



The 29 immutable build receipts partition as 21 successful mathematical builds, one successful Audit build, and seven return-code-1 failures. There is no timeout. Every successful snapshot is final-identical; there is no superseded successful mathematical body. The 28 mathematical attempts were invoked with a 120-second bound; the Audit build had 100 seconds. The final joint replay had a 300-second bound, and the outer Audit subprocess in finish_validation had 180 seconds. Failed versions do not receive final-source proof credit.

| Rejected receipt | Module | Recorded version distinction |
|---|---|---|
| `build-1792225901591750000.json` | `MarkovPolynomialBoundMEB6` | Changed proof blocks: `polynomial_positive_afterMEB6`. |
| `build-1792225990240693000.json` | `MarkovTopGapPolynomialMEB6` | Changed proof blocks: `top_gap_poly_degree_leMEB6`. |
| `build-1792226008825929000.json` | `MarkovTopGapPolynomialMEB6` | Changed proof blocks: `top_gap_poly_degree_leMEB6`. |
| `build-1792226233812279000.json` | `MarkovTopVandermondeMEB6` | Changed proof blocks: `top_kernel_vandermondeMEB6`. |
| `build-1792226302361272000.json` | `MarkovTopVandermondeMEB6` | Changed proof blocks: `top_kernel_vandermondeMEB6`. |
| `build-1792226612672618000.json` | `MarkovTopTailClosedMEB6` | Final-identical source; missing TailScalar import while that dependency was compiling. |
| `build-1792226760445144000.json` | `MarkovTopFrontierMEB6` | Changed proof blocks: `source_top_closedMEB6`. |



All seven failed snapshots retain the final import lists, explicit declaration names and whitespace-normalized common headers. Six contain proof-body edits before successful validation. TailClosed is different: build-1792226612672618000 returns immediately with unknown module prefix MarkovTopTailScalarMEB6, despite bytes identical to the eventual success. The TailScalar build interval is estimated 08:43:19.851188–08:43:36.512521 UTC; the failed TailClosed interval is 08:43:32.672618–08:43:32.887087. Its unchanged successful retry begins 08:44:03.657070. This is an observed dependency-availability failure, not a theorem-statement correction. Two other cross-module overlaps are between the independent polynomial-bound attempt and the sequential recovered Obstructions/Region builds. None is a same-module overlap.

## Replay checker, multi-suffix guard and axiom output

The checker `research/ReplayIsolatedMEB6.lean` has SHA256 `e6e4c2d5978d872af2fa6cb975c7c76ec64b9b413ce9a9999a513692791827f2`. Its body equals the sealed worker 183 checker after replacing the second duplicate M55C suffix disjunct with MEB6. The worker 183 checker itself carries the previously established ordinary-replay body relationship to the older checker; this audit does not freshly reopen that historical source. The retained unsafe driver function name remains replayIsolatedM55C; it is operational checker code, not a selected safe mathematical declaration.

The wrapper enumerates anchored theorem/def/abbrev names and requires each to end in M55C or MEB6. For these 21 exact sources it enumerates 140 names, agreeing with the direct declaration parser (94 theorem/46 definition). The validate wrapper differs from the old wrapper by tag/path retagging and the duplicate `(M55C,M55C)` tuple becoming `(M55C,MEB6)`; the Audit wrapper is an exact tag retag and intentionally retains an M55C Audit name. A saved isolation_scope prose string still says only M55C. Actual code and observed coverage, rather than that stale label, determine the current two-suffix scope.

The driver collects the selected module constants, constructs an inherited environment without selected targets, and guards **every collected name** matching the MathGKM.Markov namespace and either suffix against pre-imported presence and unsafe/partial status. Its scope is not restricted to the wrapper’s explicit name list. Ordinary Environment.replay then checks the collected bodies over that base; optional server/private data and compiler-generated differently named constants retain ordinary replay handling. The observed count 140 does not certify every conceivable generated/private constant or rebuild inherited bodies. Lean, Mathlib, other imported library objects and the checker implementation remain part of the trusted boundary.

One replay receipt, `replay-1792226814467883000.json`, returns 0. Its exact source map equals the selected final map and axiom source map. The saved output reports 21 modules, four inherited imports, 140 isolated mathematical constants and replay union passed. Three inherited imports are explicitly written: MarkovTopCoefficientsMB3E, MarkovTopSupportMB3E and Mathlib. The fourth observed compiled import is implicit Init. No object decoding was performed to invent an alternate dependency graph.

The generated Audit source is `MarkovAudit1792226823913821000M55C`, SHA256 `a6a116434758fc4a57d27b068843845b5746da4434135705d440568eaada3c7a`. Its 21 imports and 94 #print axioms lines match the selected modules and every final theorem exactly once. Build-1792226823914057000 succeeds; axioms-1792226830853968000.json agrees with the literal stdout and final source hashes. Ninety-two closures use propext/Classical.choice/Quot.sound; top_kernel_stepM55C and top_kernel_row_stepMEB6 use propext/Quot.sound. The permitted-set check is independent of mathematical completeness: exact names/source maps were separately compared here.

This same Audit source was only opaque late retention in the worker 183 audit. Its now-readable closed worker 184 generation/build/output records provide later attribution and validation. The M55C suffix alone does not establish worker 183 production or execution. No worker 183 historical absence, host status, or opaque observation is retroactively changed.

## Import identity and historical boundaries

The source graph has 2,818 project modules: 21 selected plus **2,797 inherited source/object pairs**. The independent expected pair map is reconstructed from sealed worker 183 inherited identities and controller-before184 hashes; all named ordered inherited-path candidates select the same first object as that map. Ten recovered modules are excluded from the inherited replay base and rebuilt under the new evidence path. This is the critical distinction from importing their ordinary worker 183 binaries. No graph cycle, unresolved project source or selected explicit-name collision was found.

M’s pair reconstruction is an expected-identity/static reconciliation, not a separately timed fresh full byte-hashing pass over all inherited objects. V independently hashes the exact pairs against these expectations and includes them in its later broader final window. M’s own named-input map and final window cover its explicitly read static inputs; those scopes are not conflated.

PolynomialBound has no inherited project source. TopKernelM55C and TopMomentsM55C each have 2,792 inherited project modules; the remaining eighteen selected endpoints have 2,797. All twenty project-dependent endpoints import the historical 212 worker 121 modules, including their 195-module subset, plus the separate 19 accepted modules. The 195 are not additive to 212. There is zero new body-recovery credit for this older backlog; current selected replay checks only the 21 new/recovered targets over the inherited environment.

WindowLC retains its historical empty-checker boundary and the two prints runInterval_cross6d34/runInterval_smoothed_lc6d34; crossLC_balanced6d34 has no new printed closure. Abel retains its historical source/object binding and tail_weight_nonneg65c4/centered_weight_nonneg65c4 prints; crossLC_center_weights65c4 has no new printed closure. The evidence labels copied before183/replay=false fields as historical183_binding and adds current184_binding with true inherited-base membership. Those earlier false flags describe partial worker 183 selection, not current import absence.

Worker 166’s host completed with return0/report; its large combined replay timed out. Only MarkovCorrectionFactorMDB2 is imported from that worker in the present graph. Its seven compiled/printed but unreplayed prefix modules remain absent and unrecovered. The carried current183_* fields are explicitly historical, alongside current184 flags. Worker 171’s malformed/missing report and return1 are unchanged. Worker 179’s compiled-only DetTest remains outside the graph. Prior pending, failed-version, recovery and worker 180 live-build/natural-subtraction qualifications remain those of sealed history. No fresh whole-source rebuild is claimed.

## Setup, finalizer and retained program interfaces

Setup scans the stated research/evidence/MathGKM text suffixes, freezes 22,101 input hashes without exceptions, and compares the predecessor worker 182 manifest’s 95 artifacts because worker 183 had no finalized manifest. It independently records worker 183 raw event/build reconciliation, copies the old inherited path, and identifies ten source-matching ordinary compiles for explicit recovery. Rebuild_interrupted runs their exact list sequentially with 120-second bounds and writes recovered-modules.json only after all succeed. The setup reconciliation and capabilities JSON objects match their literal event output; no reconciliation substitutes for later replay.

Finish_validation combines ten recovered and eleven new module names, selects current-source matching successful build receipts, scans raw source text for forbidden admission tokens (including comments), requires the joint replay’s return0, and requires the Audit subprocess return0. Build enumeration is unsorted, but the retained data have exactly one final-matching success per module. The axiom record chosen from sorted filenames is the sole retained axiom record. The resulting validation JSON binds final source maps and successful receipts; it does not contain an independent compiler-output digest attestation.

The finalizer checks current source hashes, selected successful build receipts, permitted saved axiom sets, an exact-source successful replay, all 22,101 initial inputs, all 95 predecessor artifacts, inherited bindings, root/toolchain/contract pins and STOP state. Its allowed-axiom loop alone does not assert exact complete source/name coverage; the independent checks above do. It manifests 139 paths and writes last-verification. Event189’s output equals that saved verifier object exactly. Manifest selection explicitly adds the ten old-tag selected sources and M55C Audit source, beyond direct newtag/MEB6 research paths and the new evidence directory. The manifest and verifier are excluded from their own manifest.

Five finite/generator Python scripts are retained alongside six operational scripts. Source_experiment imports the named inherited three-source frame and upper-sector adapter plus current short/gap helpers. The two generators import the named inherited top_symbolic_b3eed364 helper. Source, gap and short probes have __main__ guards; generators do not. These interfaces were parsed statically, never imported. Final generator files and event invocations plus generated Lean snapshots provide retained provenance; this does not authenticate unsaved intermediate script bytes. Compiler validation of the resulting finite symbolic identities is separate from finite experiments or Python arithmetic.

In particular, the third-gap generator executes at event126 and is edited at event149. That later textual replacement changes the proof side-condition to an explicit hT′/linarith argument; it does not edit the generated Lean file at that event. The final generator hash therefore does not authenticate its earlier invocation bytes. The generated certificate, final Lean source and successful snapshot/replay/print bindings are separately retained; no missing generator run is inferred.

Primary H/S/F companions agree on all 21 source hashes, imports, declaration names/kinds and 94/46 counts. Their source-scope descriptions preserve fixed-depth thresholds, all-starts depths5/6, both strict raw edges and zeros. TopInnerFiniteStripMEB6 remains universally unbounded in depth and unproved; Conjecture63 iff ThreeFrontierMEB6 and OtherFourM9E2 has two open conjuncts. The all-natural short sum and the positive 99-term/70-term certificates do not establish arbitrary-column coefficient positivity beyond their exact theorems.

Saved finite stdout bindings were compared literally: source output is the saved projection omitting labels; gap output omits saved negative/sample fields; Newton output summarizes the stored case-list length and stored negative counters; monomial output equals the saved list. This compares serialization/counters only, not coefficient signs or polynomial values. Primary domain counts distinguish 1,076 edge calls from 1,038 distinct positions (coincident starts at t=5), and saved 2,858 zeros from independent counting. RNG paths and finite arithmetic were not rerun. H/S/F were refreshed before any closing window to make the Newton projection and primary helper preparation history explicit.

## Clock and report boundary

The exact 1,800-second request starts at 2026-10-17T08:28:01.310879+00:00, ends at 2026-10-17T08:51:34.053195+00:00, and has nominal deadline 2026-10-17T08:58:01.310879+00:00. Elapsed 1412.7423160076141 seconds equals the timestamp difference; host finish is 387.25768399238586 seconds before deadline. There are 191 saved events and 56 started/completed commands. Stderr is empty.

The replay interval is estimated 2026-10-17T08:46:54.467883+00:00–2026-10-17T08:47:03.885487+00:00; the Audit compiler interval is estimated 2026-10-17T08:47:03.914057+00:00–2026-10-17T08:47:10.847999+00:00. The axiom JSON filename timestamp 2026-10-17T08:47:10.853968+00:00 denotes its later write, not the Audit compiler start. Filename nanoseconds plus saved duration give estimates rather than atomic proof-completion times.

The draft report mtime is 2026-10-17T08:50:36.257834+00:00; last-verification mtime is 2026-10-17T08:50:39.157284+00:00; controller final.json mtime is 2026-10-17T08:51:06.689609+00:00. Archive report copy mtime 2026-10-17T08:51:34.015316+00:00 is later preservation. Finalizer starts/completes at events188/189, delivered report is event190 and turn.completed is191. Delivered event, controller final and receipt report are equal. Draft report differs only in actions, observations and agenda; its summary/request/completion agree, and whole-object equality is expressly false. No cause is inferred for intervals between these observations.

## Retention and audit preparation

The initial closed inventory is 131 archive/controller files, 139 manifested paths and 144 explicit current paths. The manifest partitions as 129 archived intersections plus ten already-sealed recovered sources; the two archived unindexed administrative paths are manifest and last-verification. Three additional unindexed request-named caches are separately retained as opaque bytes (16,873 bytes total), with two companion JSONs and three copies. Their hashes/metadata are bound without bytecode interpretation, source-version inference or producer attribution. They add preservation evidence, not mathematical coverage. Old worker 183 text/binary/late supplements remain historical and are not silently reclassified.

The method helper recorded three pre-evidence assertion refinements: compiler events were distinguished from later summaries, the old duplicate suffix guard was normalized correctly, and three written imports were separated from four observed imports. Its augmentation stopped before writing on an overbroad draft-report equality assertion and a Newton summary-key lookup; both were corrected to exact recorded projections before the augmented evidence was written. No project code, source or historical sealed output changed. The complete stable primary and opaque companion records are embedded in the evidence; evolving main/V drafts are not immutable method input pins.

## Bounded final observation

Freshly hashed 191 exact named inputs during 2026-10-17T09:14:29.847035+00:00–2026-10-17T09:14:29.938150+00:00; every hash matched the existing static_input_sha256 map, with zero changed or missing paths. The map includes 19 temporary audit inputs. This is M’s bounded map, not the larger inherited-pair hash pass independently performed by V.

Pending-object absence is explicitly not applicable at 2026-10-17T09:14:29.938185+00:00: all selected ordinary objects are retained, paths={}. Project reads closed at 2026-10-17T09:14:29.938187+00:00. Subsequent review is confined to audit files and does not extend this window.
