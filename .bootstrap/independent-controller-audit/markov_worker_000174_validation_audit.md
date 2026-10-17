# Worker 000174 retained validation and provenance audit

Request **831d426f49894488b2803a879f0bf56a**, suffix **M831**, archive `/Users/sasha/math_gkm/.control/markov/workers/000174/artifacts`. Retained outcome is **completed / return code 0 / structured report delivered**, with mathematical_resolution false. Receipt SHA256 is cd8f0b1bdd5390230c189e1f69b52476e367b6c9158f1399641c79d951cf46cb (19,325 bytes).

Eleven final mathematical modules (67 named theorems and 12 definitions) have successful source-bound compilation, one joint selected replay and one 67-closure axiom audit. There is no additional current pending or compiled-only mathematical module. This is retained validation over inherited compiled imports; no fresh whole-source rebuild or root completion is inferred.

Review is archive-first and static only. Audit-owned helpers parse text/JSON and hash exact named inputs; none imports or executes project code, Lean, a compiler, checker, replay, experiment, generator, CAS or finalizer. Mathematical values are never recomputed. No proposer contact/help or project edit occurred. Active175 and later successors are excluded. Writes are confined to the designated temporary audit directory. Earlier seals/windows remain unchanged.

## Final selected inventory

| Module | Theorems | Definitions | Successful compiler receipt |
| --- | --- | --- | --- |
| MarkovFibCoeffM831 | 2 | 0 | build-1792209789463660000.json |
| MarkovBoundaryPositiveM831 | 5 | 2 | build-1792210185745845000.json |
| MarkovFibShapeM831 | 6 | 1 | build-1792210186915479000.json |
| MarkovBandShiftM831 | 5 | 0 | build-1792210374582527000.json |
| MarkovBandPositiveM831 | 11 | 0 | build-1792210467302085000.json |
| MarkovBandSumM831 | 10 | 1 | build-1792210639905127000.json |
| MarkovBoundaryLCM831 | 7 | 5 | build-1792210692546513000.json |
| MarkovBandSourceM831 | 5 | 0 | build-1792210727083347000.json |
| MarkovBandCrossM831 | 7 | 1 | build-1792210775372261000.json |
| MarkovBandResidualM831 | 6 | 2 | build-1792210949023875000.json |
| MarkovBandObstructionM831 | 3 | 0 | build-1792210958801687000.json |

All selected final source hashes match the archived/current sources, retained successful build snapshots, controller changes, final manifest, validation.json, joint replay maps and axiom-source maps. Ordinary object hashes match archive/current/controller/manifest and the finalizer's olean_sha256 fields. Audit source/object/receipt/output and exactly requested print names are also bound. These independent comparisons do not turn the wrapper's source snapshot into an atomic compiler-read attestation: the compiler reads the named live source, and its receipt lacks a digest of the object it produced. The finalizer's object hashes are post-selection observations.

No final source edit is retained inside a selected foreground build, no same-module build intervals overlap, and no final object mtime follows the successful replay. All successful mathematical source versions are final-identical. There is no superseded successful mathematical source.

| Module | Final source SHA256 | Ordinary object SHA256 |
| --- | --- | --- |
| MarkovFibCoeffM831 | 77a51fadc9bb1a988f54eff3415f83cd769cc23228f24b7625c6d9a1e53f16ce | b5c12b866820f33e9601ac7f1f56e215dc5e3846511140949a62391d5a2048ca |
| MarkovBoundaryPositiveM831 | e70bc618da4bd7439a77256e4f8c40aefced0d9d0cda00c08ba84c4d028a6333 | b8a9ae64d334e035a59838f628fb75690c7c6a0b722e9a3e9ae7e412daaf6f77 |
| MarkovFibShapeM831 | 23722a660f6200d94ef3bd6d5c6c0d4258153c87f5acf8e0f293f894801e26e9 | a5168b680bd2a68edf937482cbec23fcc4b282db0e6a1a5569284d3a110d359b |
| MarkovBandShiftM831 | be6581e5bb5a77bdcaef0939ad54ef81adee92863f3933487f296ec91e931d7e | 0e959bfc694327de7df2ce6d0042a8b866998ceb9bb6b230fa8a2aeec322ec8a |
| MarkovBandPositiveM831 | 155d9b01af77cf3240ba7c81c4e3bb56acda28ca7f25848f7e68089932dca9ba | 3f0e6334e162ca187e609a539f60767639211fef4a5f742fbe6190ac6c144b7e |
| MarkovBandSumM831 | 4f73eaba5555af8ce358e14f0975e0374fd02309452d39bb9f26a27c3431655a | cc504355472748b2218046b6ab8e5d04c471cf3c5b7d63ca780bacb42fc27e0d |
| MarkovBoundaryLCM831 | 9b21b6b210f49164712ebe414aab19130e486db9a88ba7f12b1477f1a2e4a334 | 9c388f0381742e62987d206c927d07c6008d6fdcdc17dd74617719f6931d22e0 |
| MarkovBandSourceM831 | 202cd010ae8117e8d1cbadcbf64614b155c782490131b47cdb67ce314f66ff38 | 2ddeaae823d99c0a9c9872e7cde1a58b5cb830339bdf5dcad2ab785bf7ad26b2 |
| MarkovBandCrossM831 | 1ed2ceebabe0726073d2ae64bbec8b12e91ac3deac17addc9afb220f1ad0101c | e9076b3f7a3dec95efe99fc60a030b620cf4526781f1ec0c643817663fd62d39 |
| MarkovBandResidualM831 | b2f30dd418bd6bac80dcee50505c7bb457f0a7c1c708e0fbb26db3e5668e02db | 148427666565afae5e4761b0ed6449b7f7313a458cd2bf76c518594002733190 |
| MarkovBandObstructionM831 | 211a467f2310b9ca29e4b4a1791117946fcc56add5c02a9893c34a52fa6eb04d | 6a01ceef84a68fbe8a0a8a3e3ebd9eb9ea81a0ce0ab4734f79713816e86b8ca1 |

## Rejected versions and coverage

There are 26 compiler attempts: 12 successes (11 mathematics plus one Audit), 14 return-code-1 rejections and no compiler timeouts. All 14 rejected source snapshots, diagnostics and full diffs remain in evidence. Their normalized theorem headers, declaration names and imports agree with the final versions; repairs concern proofs and parsing/formatting. The failed BandCross snapshot has a whitespace/token parsing repair, so lexical header agreement must not be interpreted as successful elaboration of the rejected version. Every rejected version receives no proof credit.

The proof repairs include choose-symmetry direction and summation namespace/normalization, signs in linear combinations, recurrence index normalization, mapped polynomial constants, a natural zero-branch case split, and polynomial coefficient evaluation. Auditors did not finish or rerun these proofs.

| Rejected receipt | Module | Header/import comparison |
| --- | --- | --- |
| build-1792209750492704000.json | MarkovFibCoeffM831 | Normalized headers/imports agree; rejected |
| build-1792210114138071000.json | MarkovBoundaryPositiveM831 | Normalized headers/imports agree; rejected |
| build-1792210315852761000.json | MarkovBandShiftM831 | Normalized headers/imports agree; rejected |
| build-1792210409935333000.json | MarkovBandPositiveM831 | Normalized headers/imports agree; rejected |
| build-1792210499891441000.json | MarkovBandSumM831 | Normalized headers/imports agree; rejected |
| build-1792210552242138000.json | MarkovBandSumM831 | Normalized headers/imports agree; rejected |
| build-1792210585578599000.json | MarkovBandSumM831 | Normalized headers/imports agree; rejected |
| build-1792210660426853000.json | MarkovBoundaryLCM831 | Normalized headers/imports agree; rejected |
| build-1792210684815438000.json | MarkovBandSourceM831 | Normalized headers/imports agree; rejected |
| build-1792210727083381000.json | MarkovBandCrossM831 | Normalized headers/imports agree; rejected |
| build-1792210792968071000.json | MarkovBandObstructionM831 | Normalized headers/imports agree; rejected |
| build-1792210809915696000.json | MarkovBandObstructionM831 | Normalized headers/imports agree; rejected |
| build-1792210851183562000.json | MarkovBandObstructionM831 | Normalized headers/imports agree; rejected |
| build-1792210907756456000.json | MarkovBandObstructionM831 | Normalized headers/imports agree; rejected |

Preparation executes once at events215–216 with ten modules. Its retained script still lists ten. Event239–240 appends BandResidual to mathematical-modules.json, yielding eleven. There is one successful eleven-module replay and one eleven-import Audit; the ten-module preparation is not an earlier successful validation stage.

All ordinary mathematical build bounds are 120 seconds, Audit 100 and replay 180. The outer Audit command starts in event242 before replay's outer command243, while inner receipt filename epochs place replay at 04:22:53.832355 and Audit compilation at 04:22:53.835987. These are distinct outer/inner observations. Audit ends at an estimated 04:23:03.286121 and replay at 04:23:04.147367, so the two operations overlap. Their saved durations are 9.450134125014301 and 10.31501154199941 seconds. Filename epochs plus durations are timing estimates, not authenticated nanosecond compiler telemetry.

The axiom JSON is axioms-1792210983290374000.json. All 67 requested theorem names occur exactly once and agree with the successful Audit output. Sixty-six closures use propext, Classical.choice and Quot.sound; one uses propext and Quot.sound. The twelve definitions are selected replay targets, not twelve extra theorem-closure print results. The joint replay reports 79 isolated mathematical constants, matching the explicit source/wrapper inventory.

## Method, inherited objects and historical boundaries

The isolated checker SHA256 is e569fe2194ef2900bd249a7947321d713c070c0a60182343bad74cccb9af6d0a. Checker, validation and Audit wrappers are exact predecessor request/suffix retags. The checker excludes selected-suffix names already present in the imported environment and rejects unsafe/partial selected declarations. Explicit target coverage is 79; generated/private names and optional binary parts retain the established ordinary-replay limitations.

The independent inherited map has **2,688 pairs**: 2,675 sealed worker173 inherited pairs plus thirteen successfully compiled/replayed/printed worker173 modules. Expected identities come from sealed validation evidence and controller-before174 hashes, not current-hash fallback. Worker initial input-hashes.json excludes ordinary objects. All source/object pairs match in the separate bounded dependency observation. Selected source closure is 2,699 modules, or 2,700 with Audit; there are nine direct inherited project imports plus implicit Init. Four endpoint bases contain 2,543 inherited modules, five contain 2,545, and BandSource/BandResidual contain 2,688.

All eleven endpoints import the old worker121 backlog of **212 modules including the 195 subset**, plus the separate **19 historically accepted modules**, and the inherited WindowLC/Abel boundaries. These bodies are trusted as compiled imports, not freshly rebuilt, replayed or reprinted here. Old WindowLC and Abel each retain their two historical printed closures and empty-checker limitation; stronger imported helper bodies receive no new independent print/replay claim.

Imported worker173 modules exclude BandBudgetObstruction, BandQuadratic and BandSourceWitness. Their historical accepted status is preserved separately. The old worker166 seven compiled/printed but unreplayed prefixes remain outside newly credited recovery. Worker156's original timeout and worker157's later twelve-module recovery remain separate. Worker160 KernelLimit, worker161 Column0, worker163 PairCleared and old combined worker168 candidates are not retroactively recovered by this round. Earlier root equivalences remain historical; inherited import is not new root closure.

The separately retained worker171 reconciliation matches its exact raw event hash, all 280 events and final four events, and all 127 old manifested artifact hashes. Its actual outcome remains missing_or_malformed_report / return code 1 / null report after a capacity error. Its saved successful mathematical checks and finalizer are distinguished from failed report delivery. This round's reconciliation is preservation, not another execution or host-status upgrade.

## Setup and finalizer schema changes

Setup now writes **input-hashes.json**, scanning research, evidence and MathGKM recursively but only suffixes .lean, .py, .md, .json and .toml, excluding its current evidence directory. It records **21,142 entries**: 7,118 research, 14,004 evidence and 20 MathGKM. Its own setup source and first checkpoint are included and checked unchanged; 21,140 are the other entries, with no inferred creation-time ordering. No owned exceptions are used. Unlike the prior setup, it does not exclude the current basename and does not snapshot docs/contracts/configuration through that old schema. The pinned root/contract is separately checked.

The setup computes inherited-binding/predecessor mismatch fields but no longer asserts those booleans before writing them; actual values are true/empty and independently checked. The finalizer asserts initial file hashes, all 142 immediate predecessor manifest hashes, and root/contract agreement. Its stale comment saying setup excluded the request prefix is not a true description of the new snapshot.

The finalizer requires successful matching-source build entries and replay coverage, current-source axiom maps covering selected theorem names and permitted axioms. It does not itself require singleton build maps, one joint replay, checker-hash equality, replay success-marker text, exact theorem-name equality or a direct successful Audit-object/output binding. The independent retained-record audit establishes these stronger actual bindings. Comment-stripped forbidden-token matching is a lexical scan, not a complete Lean parser. Version return code is recorded rather than asserted; the retained value is zero. No future-write/output lock exists.

Finalizer events253–254 and267–268 both succeed. First output records 332 manifest entries; final output records 334, with the same validation SHA. Between them, interruption-reconciliation.json and a validation note are added, and the operational note is edited. Separate first manifest and first last-verification bytes are not retained; their first hashes/counts survive in event254. No reconstruction is misrepresented as the original bytes. The preservation subobject in final event268 equals last-verification.json; its outer 11/67/14 counts agree with validation. Report269 equals final.json and the controller receipt report, followed by turn.completed270.

## Manifest scope and separate retention

Controller/archive contain **113 paths**. The final manifest contains **334 paths**, with **111 common**. Its two administrative archive files (manifest.json and last-verification.json) are unindexed. The manifest has **223 additional paths**: 212 .pyc, nine .g, one .sing and one .txt. The finalizer's research rule includes every path absent from the suffix-filtered initial map; therefore old excluded file types enter the manifest without being new worker artifacts.

Exactly **222 of these manifest-only paths match sealed173 input hashes**. Eleven non-cache paths also occur in controller-before174; the 211 historical caches are absent from that map, which is a coverage distinction rather than a mismatch. The only new exact-request extra is research/__pycache__/validate_831d426f.cpython-314.pyc, 5,808 bytes, SHA256 d4a78e5f734bcacc64fc028f542ce64f2b1a47a0b6473ce471ccbb6d6675a569. The initial exact174 scope contains **114 paths**, distinct from the union of manifest and archive (**336 paths**). Neither union should be called 334 newly created files.

With explicit authorization, all 223 manifest-only files were copied byte-for-byte under markov_worker_000174_manifest_only_bundle/, with manifest_only_bundle.json and manifest_only_observation.json companions. Total **2,036,289 bytes**; bytes, mode, uid, gid and mtime match. These copies are opaque retention, without interpreting or executing any file or assigning creation time/process/source version/successor. Original archive/controller/index and all older seals remain unchanged. The two old worker173 cache gaps remain historically separate; their bytes now also have the explicit174 supplemental retention.

Required total preservation is twelve core audit files plus 225 supplemental files (223 copies and two JSON companions), **237 files including integrity**. The supplemental manifest gives every exact path/hash; no broad historical copying beyond those 223 listed entries occurred.

## Saved finite records

| Result | Event | Exact saved-output projection |
| --- | --- | --- |
| positive-boundary-probe.json | 81 | omit_lambda_prefix |
| roots-probe.json | 143 | full |
| boundary-ratio-candidate.json | 157 | residue_negative_only |
| source-experiment.json | 204 | full |
| augmented-residual-probe.json | 225 | full |

Positive-boundary event81 omits lambda_prefix; roots event143 matches its full saved object; ratio event157 prints only each residue and negative count; source event204 and augmented-residual event225 match their full saved objects. Source-progress is source-experiment without elapsed time. Event85 is a saved one-off literal list. These comparisons parse saved data without reevaluating coefficients, signs, products, ratios, gaps, roots or random sequences.

Five mathematical programs are retained. Their Python source and recorded invocations are bound; unrecorded invocation-time source hashes are not invented. Imported band/source/three utilities have guarded main routines, statically inspected without importing them. The historical GAP/Singular files included by the manifest rule do not imply new CAS executions. Parent mathematical/finite companions distinguish index counts, value-dependent trimming and saved value outcomes. No finite experiment proves an unproved universal residual hypothesis.

## Timing and observation limits

| Observation | UTC |
| --- | --- |
| Controller start | 2026-10-17T03:59:52.211517+00:00 |
| Nominal deadline | 2026-10-17T04:29:52.211517+00:00 |
| Host finish | 2026-10-17T04:26:29.645357+00:00 |
| events.jsonl | 2026-10-17T04:25:57.782788+00:00 |
| final.json | 2026-10-17T04:25:58.659196+00:00 |
| Activity content | 2026-10-17T04:25:58.388966+00:00 |

Saved elapsed is **1597.433841228485** seconds; direct timestamp subtraction is **1597.4338402748108**, differing by **9.5367431640625e-07 seconds** (0.95367431640625 microseconds). Host finish is **202.5661597251892 seconds before deadline**. Final report file mtime is **233.55232095718384 seconds before deadline**. All original controller-listed artifact mtimes precede host finish/deadline. Archive-copy mtimes record retention and are not validation execution. No cause for the remaining host gap is inferred.

There are 270 events, 128 started items with terminal records, 520,288 event-log bytes and empty stderr. No current report absence, pending-object absence or retroactive old absence check is needed. Later audit-file sealing cannot extend the bounded project observations.

## Audit helper provenance and closing checks

Own base, dependency, retention and supplementary static helpers passed their first executions. The rejected-header comparison had two pre-output stops: an assumption excluding let binders, then a tactic-only delimiter that failed on term proofs. Both failed helper versions and hashes were retained. The final lexical top-level-assignment parser preserves the exact let premises and handles these term/tactic headers; all fourteen comparisons pass. Complete diffs were also read. These parser refinements change no project source, theorem status or mathematical value.

Mathematical companions agree on all new declarations/source hashes; 491 older named sources, 16 external source/object pairs and 63 inherited scripts. The finite saved objects match without value recomputation.

Before the final window, the three mathematical support pins were rebound at 2026-10-17T04:39:16.772596+00:00 after audit-only residual-union/parser-provenance wording and saved-output projection amendments. Evidence retains every old/new digest. All source/declaration/external identities and saved finite objects agree with the preceding audit. The rebind helper initially stopped before writing evidence because its structure comparison did not exclude the additional imports key; correcting that audit-only schema assumption changed no project record or mathematical result.

Independent method agreement covers 77 fields, 2,688 inherited pairs and 384 shared hashes, without mismatch.

All 24,730 named inputs remained unchanged during 2026-10-17T04:40:25.861946+00:00–2026-10-17T04:40:50.574945+00:00. Closing exact-request inventory at 2026-10-17T04:40:50.601120+00:00 preserves the 113 archive / 114 current scope and the same one current cache. All 223 manifested supplement copies and their 223 source counterparts pass bytes/mode/uid/gid/mtime checks. No additional current, missing current or extra/missing archive paths occur beyond the known cache. The manifest has 334 entries and the archive/manifest union 336, separately from the exact-request inventory. Project reads are closed; later work is audit-files-only. No new absence check applies. All 248 bound temporary inputs also recheck unchanged.
