# Worker 000183 retained replay-method and provenance audit

This is a static audit of **reconciled partial worker183**, request `55cf20d29efe4eebb6677e949f2beb36`. The controller record says `uncertain_effects`, reason `interrupted controller/watchdog`, report null and mathematical resolution false. There is no receipt or delivered final report. Ten individual successful compiler receipts are retained, but there is **no retained kernel replay, explicit axiom audit, final validation, artifact manifest or finalizer**. These are different evidence levels; the successful builds do not upgrade the host outcome.

The auditor did not run or import Lean, project scripts, compiler/checker/replay/finalizer programs, experiments, generators, mathematical computations or RNGs. No project/source edits, proposer contact or assistance, documentation-task content, or active184-and-later inspection occurs. Exact named183 archive records were read first. Missing nonbinary counterparts were read from the validator's separately preserved copies with original-path/hash provenance. Current ordinary objects were only hashed, never decoded or executed. Earlier audit observation windows remain historical.

## Retained scope and source versions

All ten current mathematical modules have one successful build receipt whose source hash equals the saved snapshot and current final source bytes. They contain54 theorem declarations and26 definitions. They are **compiled-only**, with no final selected/replayed/printed set. The operational replay driver is not a mathematical module. There are no additional current unbuilt mathematical sources in the exact inventory.

| Module | Theorems | Definitions | Successful receipt | Original archive object |
| --- | --- | --- | --- | --- |
| MarkovTopFourthM55C | 4 | 1 | build-1792223836799717000.json | object absent |
| MarkovTopKernelM55C | 6 | 5 | build-1792224007673197000.json | object absent |
| MarkovTopLeadingM55C | 4 | 1 | build-1792224671054702000.json | object absent |
| MarkovTopMomentsM55C | 11 | 5 | build-1792224064430968000.json | object absent |
| MarkovTopObstructionsM55C | 8 | 3 | build-1792224358713656000.json | object absent |
| MarkovTopParameterPolyM55C | 7 | 3 | build-1792224611195137000.json | matching ordinary object |
| MarkovTopRegionM55C | 2 | 2 | build-1792224597252065000.json | object absent |
| MarkovTopSecondGapM55C | 1 | 4 | build-1792223996054497000.json | empty mismatched object |
| MarkovTopSecondSourceM55C | 5 | 0 | build-1792224064431385000.json | object absent |
| MarkovTopSectorM55C | 6 | 2 | build-1792224238093435000.json | object absent |

The partial controller archive has24 paths. Twenty-three match their named current counterparts; `MarkovTopSecondGapM55C.olean` is an empty file there and does not match the current ordinary object. `MarkovTopParameterPolyM55C.olean` is the sole matching archived object. The other eight current ordinary objects are absent from the archive. Original archive and current files are unchanged. Parent separately authorized nine independent binary clones after the initial hash-only choice; these add retention, not validation credit.

The exact current inventory has78 paths, including54 absent from the original archive:46 nonbinary files and8 ordinary objects. The46 separately preserved files total2,952,709 bytes. They include six current mathematical sources absent from the archive, operational scripts, build receipts/snapshots and saved JSON evidence. The original four archived mathematical sources and separate six-source supplement are clearly distinguished in the machine-readable record. These later copies preserve observed bytes and selected metadata; they do not establish original archive completeness or producer timing.

The nonbinary supplement was copied08:30:20.848268–08:30:20.859522 UTC, after the initial inventory08:29:17.694853. Its two companion JSONs sit alongside `markov_worker_000183_partial_retention_bundle` in T. The nine separate ordinary-object clones total12,946,720 bytes and were made08:35:29.513244–08:35:29.550674 in `markov_worker_000183_partial_binary_bundle`, with their own two companions. The method independently hashes these copies and compares byte count, mode, uid, gid and mtime; it does not load or interpret them. Source/copy independent inodes and source stability except possible atime are recorded by the validator. No historical atime or physical-space savings claim follows. Compiler receipts do not contain object-output hashes. Thus even a matching later clone does not repair the original archive or authenticate an original compiler-output digest.

Copies are not worker-produced manifest entries. No cache files were in the exact inventory. The current TopSecondGap object is8,976,480 bytes; the zero-byte archived object remains separately retained as evidence of the gap.

## Attempts and failure boundaries

There are18 compiler receipts:10 successes and8 return-code1 failures, no compiler timeout. First failed Fourth and its successful retry use90-second bounds; the other16 attempts use120 seconds. All18 raw receipt summaries exactly match the corresponding completed command event, including source-specific receipt name, return code, duration and wrapper-selected output. Failure summaries expose only the last2,500 stdout characters; full stdout/stderr remain in the JSON receipts. Successful command summaries intentionally print empty stdout even when the raw receipt contains compiler warnings.

All eight unsuccessful snapshots differ from the final source. Their imports and declaration-name sets agree with the final source. Seven retain identical common declaration headers. The first ParameterPoly snapshot (`build-1792224487824757000.json`) instead writes `.eval d` in two theorem headers; the final source explicitly uses `.eval (d:ℚ)`. Its retained diagnostics show coefficient-type errors. This is a real source-header distinction, not whitespace normalization. None of the failed snapshots is credited as validated. No literal `sorry` or `admit` occurs in these retained source snapshots; diagnostic placeholders produced after elaboration errors are not source admissions or accepted theorems.

The successful sources are not superseded by later successful versions. The retained command envelopes show no completed source-edit event inside the corresponding build envelope; final source mtimes are outside their own estimated build intervals, and there is no same-module build overlap. Successful current dependencies each have an earlier matching successful build. These bounded observations cannot exclude an unrecorded edit. The wrapper hashes and copies source bytes before invoking Lean on the live named research path, so it does not authenticate an atomic compiler-input snapshot.

| Rejected receipt | Module | Header qualification |
| --- | --- | --- |
| build-1792223798615328000.json | MarkovTopFourthM55C | common headers unchanged |
| build-1792223879275728000.json | MarkovTopSecondGapM55C | common headers unchanged |
| build-1792223919079614000.json | MarkovTopSecondGapM55C | common headers unchanged |
| build-1792223973013537000.json | MarkovTopKernelM55C | common headers unchanged |
| build-1792224304386942000.json | MarkovTopObstructionsM55C | common headers unchanged |
| build-1792224487824757000.json | MarkovTopParameterPolyM55C | explicit rational cast added to two headers |
| build-1792224576612236000.json | MarkovTopParameterPolyM55C | common headers unchanged |
| build-1792224645382781000.json | MarkovTopLeadingM55C | common headers unchanged |

## Retained validation mechanism, without execution credit

`setup_55cf20d2.py`, `validate_55cf20d2.py` and `audit_55cf20d2.py` are exact previous182 versions after the explicit request/predecessor/suffix retag. The retained driver is likewise exactly `ReplayIsolatedMB3E.lean` retagged toM55C. The inherited182 audit established equality of the underlying ordinary replay body to the old wide checker after removing the isolation guard; that historical comparison is referenced, not newly executed.

The compiler wrapper uses the named Lean4.32.2 binary, one compiler thread and the current evidence directory followed by the saved inherited `LEAN_PATH`. It snapshots each source before compiling its live path to an ordinary `.olean`, and stores a per-invocation JSON record. The inherited compiled imports are reused. No fresh build from all imported source bodies is claimed, and object/source associations do not independently authenticate production of every imported binary.

For its unexecuted kernel mode, the wrapper enumerates anchored top-level theorem/def/abbrev names and checks the suffix; it would invoke the driver with a requested stack size. The driver reads module-data parts, optionally including server/private parts, collects the selected ordinary constants, and imports only direct module dependencies outside the passed target set. It checks **every collected name** with `MathGKM.Markov.` prefix andM55C suffix for absence from the base and unsafe/partial flags. It then calls ordinary `env.replay` on the collected union. The name guard is not limited to the wrapper's lexical list, but differently named generated/private constants retain ordinary replay limits. Optional parts and the external toolchain remain trust boundaries.

No kernel invocation, kernel receipt, observed guard count, replay-union success marker, Audit module or axiom JSON is retained for183. The audit wrapper, if run, would import the given modules, emit `#print axioms` for anchored theorem names, compile with100 seconds, check each printed name against `{propext, Classical.choice, Quot.sound}`, and then write source hashes. That capability is **not an observed39/45/54-closure result**. The actual183 explicit-print count is zero.

There is no retained `finalize_55cf20d2.py`, no mathematical-modules list and no validation/manifest/last-verification JSON. Accordingly this note does not infer the preceding round's finalizer predicates ran, or fabricate a selected set from the ten builds. No compiler/axiom/replay check has been backfilled by the auditor.

## Source/object graph and inherited limits

The static graph has2,807 project source nodes:10 current modules plus2,797 inherited source/object pairs. Expected identities come from sealed182 and controller-before183, never from current-file fallback guesses. The2,797 pairs are2,788 previously inherited bindings plus all nine accepted182 modules. Saved inherited-path order selects each expected ordinary object first among the before183 entries. A separate validator observes current named bytes; the method's expected-identity derivation itself does not claim a fresh whole-body compiler check.

TopKernel and TopMoments import2,792 inherited project nodes; the other eight endpoints import2,797. The raw dependency union outside the ten current sources begins with `MarkovTopCoefficientsMB3E` and `MarkovTopSupportMB3E`. These are compiler/source-graph facts, **not a performed replay base**. No selected or successful replay base is populated in the evidence. There are no source-graph cycles or duplicate current mathematical declaration names.

| Endpoint | Current nodes | Inherited nodes | Old212 /195subset /separate19 |
| --- | --- | --- | --- |
| MarkovTopFourthM55C | 1 | 2797 | 212 / 195 / 19 |
| MarkovTopKernelM55C | 1 | 2792 | 212 / 195 / 19 |
| MarkovTopLeadingM55C | 8 | 2797 | 212 / 195 / 19 |
| MarkovTopMomentsM55C | 2 | 2792 | 212 / 195 / 19 |
| MarkovTopObstructionsM55C | 7 | 2797 | 212 / 195 / 19 |
| MarkovTopParameterPolyM55C | 7 | 2797 | 212 / 195 / 19 |
| MarkovTopRegionM55C | 7 | 2797 | 212 / 195 / 19 |
| MarkovTopSecondGapM55C | 2 | 2797 | 212 / 195 / 19 |
| MarkovTopSecondSourceM55C | 3 | 2797 | 212 / 195 / 19 |
| MarkovTopSectorM55C | 6 | 2797 | 212 / 195 / 19 |

All endpoints retain the old212 compiled-only unrecovered modules, including the195-module subset, plus the separate19 accepted modules. The195 are not additional to212. There is no current body recovery, and the ten new modules themselves have not been replayed.

WindowLC retains its historical empty-checker and two printed closures, `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; use of `crossLC_balanced6d34` is not a newly printed closure. Abel retains its historical source/object and two-print boundary (`tail_weight_nonneg65c4`, `centered_weight_nonneg65c4`); `crossLC_center_weights65c4` is not given additional print coverage. Their exact inherited identities are included in the pair map.

Worker166's host outcome was completed/return0/report; its large combined replay timed out. Only `MarkovCorrectionFactorMDB2` lies in the current graph. The seven compiled/printed but unreplayed166 prefixes remain absent and unrecovered. Worker179's compiled-only DetTest remains outside this graph. Original156 timeout/null-report status and157's twelve-module/44-closure recovery remain distinct; current imports do not create another recovery. The160/161/163/164/168 pending boundaries, prior correction/source-version limitations and180 live-build/natural-subtraction qualifications remain as sealed182.

Worker171's malformed/missing report, return1 and null report remain historical. The current setup's saved comparison contains the same raw-log hash, last four of280 events and127-artifact check as sealed182. That reconciliation is not a replay or recovery and does not independently establish the report failure's cause. Worker183's own interruption reconciliation is a different controller record.

## Setup, initial snapshot and partial-host chronology

Setup event23 exactly prints its saved reconciliation and capabilities records. It records all inherited binding flags true, no mismatched entries in predecessor182's95-entry manifest, and a22,032-entry initial snapshot. Its suffix-filtered research/evidence/MathGKM scan includes its own setup script with no exemption; objects, caches and unlisted suffixes are outside this snapshot. The setup code reports rather than asserts the binding flags. There is no183 finalizer or independent worker-produced final recheck of all initial entries. A later auditor stability check is a bounded audit observation, not that missing worker finalization.

The retained initial snapshot has20 MathGKM,14,627 evidence and7,385 research paths. No new docs-task contents are interpreted by this method audit. Capability records are saved worker observations rather than newly invoked capability tests.

The host process started07:51:48.818268 UTC with an exact1,800-second request and nominal deadline08:21:48.818268. There is **no receipt-derived finish time, elapsed time or host return code**. The raw event stream has180 events,86 started items and61 command starts; its last event is a completed library search, not `turn.completed` or a delivered report. The last successful compiler interval ends at an estimated08:11:21.928772. Event-file mtime is08:11:25.548105; activity content samples08:11:39.356847. Receipt filename timestamps plus measured durations yield estimated compiler intervals, not an independently synchronized host clock.

The watchdog log is a779-byte traceback ending in `OSError: [Errno 28] No space left on device` at the controller's artifact `write_bytes` operation; its mtime is08:12:08.421802. The archive contains the empty TopSecondGap target and the noted incomplete set. The trace supports failure during copying, while the precise full process/termination sequence is not inferred from these files. Empty worker stderr is not evidence of a normal finish. The controller reconciliation mtime is08:27:27.376529. Parent-supplied stopped-process/resume observations remain operational observations; this method did not inspect the active successor or reinterpret its actions.

Initial explicit absence observations cover controller receipt/final report and the exact183 validation, manifest, last-verification, module-list, report and finalizer paths. Pending mathematical object absence is not applicable: ten ordinary objects currently exist. The empty archived TopSecondGap is a **byte mismatch**, not a missing current object. Final bounded stability and absence observations will be taken only after full companion/main review.

## Mathematical and experimental interpretation boundary

The retained source formalizes strict horizontal start2 for actual numerator-three paths at rows `b+2−t`, with `5≤t≤q+2`, both denominator residues, plus polygon membership. `TopFinishedRegionM55C` combines starts `i≤2` with the zero-tail condition `t<i+2`. The source states the exact root equivalence `ThreeRemainingM55C ∧ OtherFourM9E2`; both residual obligations remain open. No full conjecture, fresh inherited proof or new universal whole-sector log-concavity is asserted here.

The full-sector equivalence to `TopMomentBoundM55C` and its interior version is conditional: the moment/drift sign has not been established universally. `top_leading_strictM55C` concerns auxiliary leading coefficients; it is not an eventual-parameter or raw-coefficient asymptotic theorem. False midpoint/geometric-weight shortcuts remain auxiliary obstructions; the separately formalized positive actual-source gap prevents confusing them with a source counterexample. All these descriptions retain the compiler-only/no-current-replay/no-current-axiom-print qualification above.

The four current Python programs are read as text/AST only. Source, midpoint and moment probes have `__main__` guards; the coefficient generator does not and imports the previously guarded182 symbolic helper. The worker also ran one-off finite probes retained in raw command text. No such imports or computations were repeated by the auditor. Compiler diagnostics, finite result JSONs, literal event outputs and deterministic-domain descriptions are provenance evidence, not substitutes for a universal theorem or missing validation stage.


## Companion crosscheck

Primary H/S/F and the reviewed validation draft agree on all ten compiled-only source/object bindings, 54 theorem declarations, 26 definitions, all 18 attempts and seven current scripts. Six saved finite objects match their retained literal outputs; the source output excludes only its labels. The generator scale and 56-term list length are compared literally; no coefficient, gap, polynomial, sign or random value was recomputed. The validator independently freshly hashed all 2,797 inherited source/object pairs at 2026-10-17T08:38:37.428160+00:00–2026-10-17T08:38:59.594619+00:00; every identity agrees with the method’s sealed182/controller-before expectations. That is the validator’s bounded byte observation, not a separate method pair-hashing window or proof replay. The evolving validation/main files are reviewed as drafts, not immutable method inputs.


## Final bounded observation

The method freshly hashed 127 named inputs from 2026-10-17T08:43:50.643683+00:00 to 2026-10-17T08:43:50.695134+00:00; all matched. The map includes 72 audit-only paths. Original observations and earlier seals are unchanged. The ten exact administrative absences were observed separately at 2026-10-17T08:43:50.695147+00:00; current mathematical object absence is not applicable. The inherited pair byte-hashing observation remains attributed to the validator. All method project reads are closed.

## Later audit-files-only qualification

The earlier method window and its 78-path initial inventory remain historical observations. A later validator inventory diagnostic at 08:48:01.285305 UTC found 80 current exact-request files, with the original 24-file archive unchanged. The two additions are `research/MarkovAudit1792226823913821000M55C.lean` (5,715 bytes, SHA256 `a6a116434758fc4a57d27b068843845b5746da4434135705d440568eaada3c7a`) and `research/__pycache__/source_experiment_55cf20d2.cpython-314.pyc` (7,754 bytes, SHA256 `65d43226330ce04622d96fc7602f4c355336286080a0dc5a73ac77ce9a780eb1`). Their metadata was observed at 08:48:20.039376 UTC; recorded mtimes are respectively 08:47:03.914037 and 08:44:04.875274. Discovery, mtime and creation or producer attribution are distinct.

Both were preserved opaquely during 08:49:33.662454–08:49:33.663178 UTC under `markov_worker_000183_late_observed_bundle/`, with separate bundle and observation JSON. The validator records matching bytes, mode, uid, gid and mtime. This method update reads only the four audit JSON records; it does not read the new Lean body or decode the cache, and makes no producer, execution, replay, printing or recovery claim. The earlier statements that no Audit source or cache was retained refer to the earlier inventory and reviewed cutoff, not an assertion of continued absence after that observation. The ten mathematical modules remain compiled-only and the host status remains uncertain_effects with no receipt or report.

This appendix and its separate evidence record were appended after the method project window closed. Every earlier method evidence field, the 127-input map, its 72 temporary pins, all timestamps and the ten absence observations are unchanged. The pre-append note SHA256 is `be2adfad9dc126396a8ad3760ddbab6a8b5347fe90175c8832f6fb975a7b0639`; the pre-append evidence SHA256 is `81d042048cc9a4b8e62f96945f5c2ba3156a344401506db654c72036274fbdd9`. Removing only this appendix and the newly named evidence field reconstructs those original bytes. The evolving validator files remain outside the method's closed input map.
