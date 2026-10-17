# Worker 000173 — retained replay method and import audit

Request 139fed75c29240ba95427717b28c29a7; evidence markov-139fed75; suffix M139. This is a static, archive-first audit of the closed worker, over exact named current and inherited counterparts. The host outcome remains completed / return code 0 / delivered report, with no root-completion claim. No project program, compiler, Lean checker, replay, finalizer, generator, experiment or CAS was run. No mathematical value was recomputed. All audit writes are under /private/tmp/math_gkm_godel_20261013. Active worker174 and successors, proposer interaction, project edits and separate documentation content are excluded.

Sixteen final mathematical sources contain 56 named theorems and 11 definitions. Each final version has a matching successful compiler receipt and retained source snapshot, a current/archive source and object association, successful joint replay, and theorem-print coverage. This supports the selected final statements over inherited compiled imports. It does not supply a fresh whole-source rebuild, independently executed kernel replay, blanket binary provenance or full-root proof.

The evidence JSON retains the source/object associations, exact rejected snapshots, complete receipt fields, driver and wrapper hashes/diffs, source graph, ordered inherited object candidates, endpoint closures and historical qualifications. The separate inherited_pair_expectations.json supplies exact prior identities; no missing expectation was filled from current bytes.

| Selected module | Theorems | Definitions |
| --- | ---: | ---: |
| MarkovBandBoundaryReductionM139 | 4 | 2 |
| MarkovBandBudgetCoeffsM139 | 3 | 1 |
| MarkovBandBudgetObstructionM139 | 6 | 1 |
| MarkovBandGainM139 | 3 | 2 |
| MarkovBandLeadingM139 | 4 | 0 |
| MarkovBandLinearM139 | 2 | 0 |
| MarkovBandQuadraticM139 | 2 | 1 |
| MarkovBandRecurrenceM139 | 5 | 2 |
| MarkovBandShapeM139 | 6 | 0 |
| MarkovBandShiftM139 | 2 | 1 |
| MarkovBandSourceWitnessM139 | 5 | 0 |
| MarkovBandSupportM139 | 3 | 0 |
| MarkovBandTopM139 | 2 | 0 |
| MarkovBandTransportM139 | 3 | 0 |
| MarkovFibBandM139 | 4 | 1 |
| MarkovFibShiftM139 | 2 | 0 |

## Versions and compiler evidence

There are 33 compiler attempts: 17 successes, comprising the 16 mathematical modules and one Audit module, and 16 return-code-1 failures. There are no compiler timeouts, extra compiled-only mathematical modules, selected-but-unbuilt modules or pending new mathematical source files. Open predicates inside selected sources are not excluded candidate modules. The ordinary mathematical invocations have a 120-second bound; the Audit uses 100 seconds and the joint replay 180 seconds.

Every mathematical module has exactly one successful final-source version. No superseded successful version requires later selection. All failed snapshots differ from their final sources; names and declaration counts remain unchanged. Fifteen failed snapshots retain the normalized final theorem headers; the first BandLinear rejection changes a statement. Fifteen retain the final import list; the first SourceWitness rejection changes imports. The audit compares literal statements and source structure, not their numerical truth. No failed version receives proof credit.

The first rejected BandLinear receipt build-1792208469216739000.json states the false-residue right-hand side as k*(3*k*q−3*k²+7*k+4). The final statement uses k*((3*k−1)*q−3*k²+8*k−1). This is a changed mathematical claim, not merely a tactic repair. Later BandLinear failures already have the final header. The first SourceWitness receipt build-1792209275411393000.json imports BandBudgetObstruction alone; the final source also imports BandTransport. Its theorem headers remain unchanged. Later SourceWitness failures concern the lower-row calculations and receive no retrospective credit.

| Rejected receipt | Module | Changed common blocks | Header change | Import change |
| --- | --- | --- | --- | --- |
| build-1792208004785025000.json | MarkovFibBandM139 | fib_band_factorM139 | no | no |
| build-1792208113757896000.json | MarkovBandGainM139 | band_gain_factorM139 | no | no |
| build-1792208172829649000.json | MarkovBandRecurrenceM139 | source_band_factorM139 | no | no |
| build-1792208274981715000.json | MarkovBandShapeM139 | band_Q_constantM139, band_gain_constantM139, band_gain_degreeM139, fib_band_degreeM139 | no | no |
| build-1792208304535029000.json | MarkovBandShapeM139 | band_Q_constantM139, band_gain_constantM139, band_gain_degreeM139, fib_band_degreeM139 | no | no |
| build-1792208325394488000.json | MarkovBandShapeM139 | band_gain_degreeM139, fib_band_degreeM139 | no | no |
| build-1792208469216739000.json | MarkovBandLinearM139 | band_gain_linearM139 | yes | no |
| build-1792208498051948000.json | MarkovBandLinearM139 | band_gain_linearM139 | no | no |
| build-1792208540818863000.json | MarkovBandLinearM139 | band_gain_linearM139 | no | no |
| build-1792208625949117000.json | MarkovBandTopM139 | band_gain_topM139, fib_band_topM139 | no | no |
| build-1792208697690203000.json | MarkovBandBudgetCoeffsM139 | band_Q_linear_positive_formM139 | no | no |
| build-1792209002328017000.json | MarkovBandBoundaryReductionM139 | band_nonneg_monoM139 | no | no |
| build-1792209166869056000.json | MarkovBandQuadraticM139 | band_gain_quadraticM139 | no | no |
| build-1792209275411393000.json | MarkovBandSourceWitnessM139 | budget_witness_lower3M139, budget_witness_lower4M139 | no | yes |
| build-1792209327326850000.json | MarkovBandSourceWitnessM139 | budget_witness_lower3M139, budget_witness_lower4M139 | no | no |
| build-1792209380783669000.json | MarkovBandSourceWitnessM139 | budget_witness_lower4M139 | no | no |

The evidence preserves all diagnostics and source hashes. Final source mtimes do not fall inside their own successful compiler intervals; there are no same-module attempt overlaps, and accepted dependency builds precede dependent final builds. These observations do not turn a precompiler snapshot into an atomic compiler-input attestation. A compiler receipt binds its captured source map and retained process result; final object hashes are subsequent observed bytes. No separately preserved rejected object is inferred.

## Checker, wrapper and print boundary

The isolated checker SHA256 is f2e304f85f1ae6d83383714316ffe3263e334d824fbacb399c4db436480d4216. It is an exact worker172 retag; its ordinary replay body agrees with the retained worker110 body after removing the added guard. The validate, audit and finalize scripts are exact worker172 retags. Setup is materially different and is discussed below.

The checker imports a base after removing selected target modules, collects target-module constants, and reconstructs ordinary declarations against that base. Every collected name with prefix MathGKM.Markov. and suffix M139 must be absent from the initial environment and must not be unsafe or partial. The repeated same-suffix disjunction is redundant. This guard is not restricted to the wrapper's lexical list. Here the observed guarded count is 67, matching all 56 named theorems and 11 definitions. Differently named generated/private constants retain ordinary replay behavior and are not covered by the extra suffix guard merely because they belong to a selected file. Optional binary/server parts and private-data handling retain the historical driver's limitations; no broader coverage is inferred from the success line.

The wrapper's lexical extraction agrees with the actual selected declarations in this round. The selected names do not collide with the imported base or each other. No source-resolution cycle or ambiguity was found. The base contains the direct project imports MarkovFactoredRowM964, MarkovFibSecondRowMC3E and MarkovSecondJet8934, plus implicit Init: four direct imports in total. Their transitive bodies are inherited compiled inputs, not freshly rebuilt or replayed by this invocation.

One successful replay, replay-1792209475075264000.json, binds all 16 final source hashes and all 67 explicit declarations. One Audit source, MarkovAudit1792209475075392000M139, imports the selected modules and prints all 56 theorem axioms. Its compiler receipt is build-1792209475075492000.json; axioms-1792209487216653000.json is the later print-record write. There are exactly 56 rows and 56 distinct theorem names: 53 closures use propext, Classical.choice and Quot.sound; band_exponent_falseM139, band_exponent_trueM139 and choose_add_twoM139 use only propext and Quot.sound. Definition bodies participate in replay but are not 11 additional theorem-closure print results. Axiom printing alone is not body replay.

Preparation lists 15 selected modules at event249 and 16 at event273, adding BandSupport. There is only one retained replay/Audit validation stage, for all 16. The 15-module preparation is not an earlier successful validation stage. The final SourceWitness build completes at event274, after preparation and before the joint replay.

## Imports and inherited coverage

The selected base has 2,675 inherited modules: 2,669 sealed worker172 inherited pairs plus the six accepted worker172 modules CorrectionBudget, FactoredRow, LiftBudget, RobustCut, ThirdOutput and TwinKernel, each with suffix M964. The selected mathematical source closure has 2,691 local nodes; adding Audit gives 2,692. Ordered object candidates and the actually resolved object for each inherited name are recorded. Identities come from sealed earlier records and controller-before173 source/object maps; the worker initial snapshot excludes objects. There is no current-hash fallback.

The independent validator compared all 2,675 source/object pairs during 2026-10-17 04:03:32.511344–04:03:53.825408 UTC and found no mismatch. This separate observation is retained with its own scope and does not become the method's later final window.

Fourteen endpoints inherit 2,534 modules; BandTransport and BandSourceWitness inherit 2,675. Every endpoint imports all 212 old worker121 unrecovered modules, including the 195 subset, plus the separate 19 historically accepted modules. The 195 are not additive to 212. The inherited backlog remains unrecovered; successful replay of new declarations over those imports does not freshly replay the imported bodies.

| Endpoint | Current modules in closure | Inherited modules | Old 212 / 195 subset / separate 19 | Window / Abel |
| --- | ---: | ---: | --- | --- |
| MarkovBandBoundaryReductionM139 | 9 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandBudgetCoeffsM139 | 6 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandBudgetObstructionM139 | 8 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandGainM139 | 2 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandLeadingM139 | 6 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandLinearM139 | 5 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandQuadraticM139 | 7 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandRecurrenceM139 | 3 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandShapeM139 | 4 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandShiftM139 | 8 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandSourceWitnessM139 | 10 | 2,675 | 212 / 195 / 19 | both |
| MarkovBandSupportM139 | 7 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandTopM139 | 5 | 2,534 | 212 / 195 / 19 | both |
| MarkovBandTransportM139 | 5 | 2,675 | 212 / 195 / 19 | both |
| MarkovFibBandM139 | 1 | 2,534 | 212 / 195 / 19 | both |
| MarkovFibShiftM139 | 7 | 2,534 | 212 / 195 / 19 | both |

Worker172 ThirdClosed is preserved comparison material outside this dependency graph. The inherited root equivalence remains available historically; this round does not import a new root endpoint or prove a new equivalence. Thirteen worker171 modules are imported; ThirdEdge is outside. Eleven worker167 modules are imported, with LowerCross, AugmentedObstruction and the extra ExpressionData outside. Worker166 contributes CorrectionFactor only: its seven compiled/printed but unreplayed prefixes remain outside and unrecovered. Worker165 contributes no selected mathematical module to this graph.

The exact historical memberships are retained separately for every worker. Corrected worker145 Scalar is the inherited version; its superseded source is not credited. Worker156's original timeout and missing final bundle remain historical facts; worker157's explicit twelve-module/44-closure recovery is separately bounded. No worker173 action upgrades the old worker160 KernelLimit, worker161 Column0, worker163 PairCleared, worker164 half/pair candidates, or the combined worker168 BoundaryCertificate/BoundarySource candidates. Later names and split proofs do not backdate those unsuccessful products.

WindowLC retains its historical successful compilation association and two explicit prints, runInterval_cross6d34 and runInterval_smoothed_lc6d34, with empty checker stdout. The stronger imported crossLC_balanced6d34 does not acquire a third historical print or independently authenticated replay. Abel similarly retains the historical prints tail_weight_nonneg65c4 and centered_weight_nonneg65c4; crossLC_center_weights65c4 is not one of those prints. Exact named source/object pairs are bound, without upgrading inherited compiled-body trust.

Worker134/135/136 boundaries remain as recorded: the successful replacement HighCone2GapMF25 is distinguished from the unsuccessful old M81F source; FallingGapMF25, SourceFallingMF25 and InteriorWitnessMF1E are outside the current graph. The named external library pins do not exhaust the transitive Mathlib/Lean tree and establish no fresh binary build authentication.

## Setup, finalization and retained schemas

Setup verifies six fixed inherited bindings and the 187 entries of worker172's manifest. Unlike worker172 setup, it no longer reads and embeds predecessor raw-event digests, final-event suffixes or explicit outcome/return-code fields. It states that worker172 completed and that worker171 was already reconciled. The audit separately binds the exact earlier reconciliation and sealed status: worker171 remains missing_or_malformed_report / return code 1 / null report. Reconciliation preserves existing effects; it is neither a new replay nor a replacement for the missing historical report.

Setup excludes basenames containing lowercase 139fed75 before building its initial snapshot. The finalizer has no owned-input exemptions and checks all 7,340 initial entries. That snapshot is not an object inventory. The saved capability record reports Sage unavailable, GAP at /opt/homebrew/bin/gap and denied scratch access. These are retained capability observations, not additional execution authority or evidence that a tool ran successfully.

The finalizer selects the last sorted successful matching-source build for each module. Its generic predicate does not require a singleton build module map. It then samples each compiled object hash; this is a worker-supplied postselection module-object map, not an immutable compiler-output digest. Here the independent receipt comparison finds exactly one matching final success per selected module.

Successful replay source maps must cover the selected modules, but the generic finalizer does not require a single joint replay, checker-hash equality or replay success-marker text. Actual retained evidence establishes the one joint invocation, exact source maps, checker hash and success text in this round. Current-source axiom JSONs must cover the selected theorem-name subset with permitted axiom sets. The predicate does not separately enforce exact axiom-name equality or raw Audit object/output linkage; the independent comparisons establish those actual associations.

The banned-token scan strips comments with a regular expression and then checks sorry, admit, axiom and native_decide. It is not a full parser for nested Lean comments or strings. The version subprocess result is retained rather than its return code asserted; the actual retained return code is zero. Root and canonical contract hashes are compared with reconciliation; initial inputs, predecessor manifest and final manifest hashes are checked. This creates no future-write lock or stop guarantee.

There is one finalizer invocation, events288–289, returning zero. Its echoed module/theorem/rejection counts agree with validation, and its preservation subobject equals last-verification.json; no whole-object equality between these differently shaped records is claimed. Delivered report290 agrees with controller final.json and receipt report; turn.completed291 follows. There is no current missing report, draft-report substitution or failed-finalizer recovery. Separate final-check.json is not part of this round's retained output schema.

## Mathematical and finite-evidence limits

The new identity concerns actual numerator-three sources with q≥2, j=q+k+1 and 2j+1≤b. The correction is X²(X+1)^d Q with d=b−2j−1. Exact degree, selected coefficients, correction endpoint and zero tail are proved in their stated domains. They do not prove absence of internal holes or coefficientwise positivity of all Q. The auxiliary boundary parameterization includes d=0, k=0 and false residue with q=1; the actual source factor theorem retains q≥2.

The source LC transport is conditional on coefficient nonnegativity, an explicit binomial coefficient budget and a scalar robustness margin. The boundary equivalence and implication from BandBoundaryFormulaM139 are proved; that Prop definition is not itself proved. The actual 3/221 witness refutes the proposed universal choice c=Q.coeff 1, while its polygon-valid raw triple has a formally positive LC gap. No new unconditional raw-LC region or root counterexample follows. The inherited exact root remains ThreeBeyondThirdM964 together with OtherFourM9E2; both are open.

Saved experiment outputs are bound to their named commands and retained final scripts, without executing them or inventing atomic Python source-at-invocation attestations. Event72 omits samples; event93 prints the Newton summary and selected sample rows. Other named event/result comparisons retain their actual projections. Budget reproduction agrees byte-for-byte with its first result; event236 prints the separate source witness. The margin-support record is an index/support diagnosis of a sufficient scalar criterion, not a sign recomputation or source-LC failure. Finite interpolation, guessed identities, value-dependent trimmed lengths, saved zeros and failures remain finite evidence. Mathematical source and finite-domain companions provide the exact domains and distinguish independently counted indices from saved values.

## Retention and chronology

Archive/controller and manifest each contain 142 paths, with 140 in common. Two administrative archive files are unindexed; two manifested caches are missing from archive/controller. The exact current scope therefore has 144 paths. Equal archive/manifest totals are not equal inventories. The two opaque caches are separately retained under the temporary late_cache_bundle directory and its two JSON companions; the archive/controller/index is unchanged.

The first exact-request inventory is 04:03:00.356079 UTC, metadata observation 04:03:44.859112, and copies 04:03:44.859766–04:03:44.860408. Copies total 15,732 bytes: band_experiment cache 9,924 bytes and validate cache 5,808 bytes. Bytes, mode, uid, gid and mtime match the named current counterparts. No bytecode was interpreted, executed or attributed to a later worker, process or source version. These timestamps do not establish creation time. Both cache copies and both companion JSONs are required preservation material. Worker172's prior two caches now occur in the initial worker173 snapshot; their original gap and earlier retention window remain unchanged.

Controller start is 03:31:41.344245 UTC. The final mathematical build finishes 03:57:19.308072. The joint replay runs 03:57:55.075264–03:58:10.558352; the Audit compiler runs 03:57:55.075492–03:58:07.212360. These execution times are estimates from receipt filename epochs and saved elapsed durations, not authenticated nanosecond wall-clock readings. They overlap: Audit starts about 0.000228 seconds later and finishes about 3.345992 seconds earlier. The axiom JSON filename timestamp denotes its later write, not the Audit compiler start.

Original validation, manifest and last-verification mtimes are respectively 03:58:32.863650, 03:58:33.665642 and 03:58:33.671970. Their archive-copy mtimes are 03:59:19.793137, 03:59:19.812497 and 03:59:19.794360; copy bookkeeping is not execution time. Event-log mtime is 03:58:50.387612, activity-content timestamp 03:58:50.791711, and delivered final.json mtime 03:58:51.359386. Host finish is 03:59:19.814574, before the 04:01:41.344245 deadline by 141.5296709537506 seconds. Stored elapsed 1658.4703290462494 seconds equals timestamp subtraction. There are 291 events, 139 started items, 90 command starts, 1,536,634 event bytes and zero stderr bytes. No cause is inferred for the gap before host finish.

## Companion comparison

The audit-files-only comparison agrees on all 16 selected inventories and source hashes, 56/11 declarations, 475 named older pins (323 imported and 152 outside), 181 historical pending/other-status sources, two operational histories, 16 named external source/object pairs, 57 inherited scripts and 11 result hashes. Saved finite objects are compared as data; no values are recomputed. The full comparison is embedded in the method evidence, as well as its path/hash binding. Evolving validator/main drafts are reviewed without entering the immutable method input map, avoiding circular seals.

## Audit helper provenance and closing observation

Own static helpers parse and hash only. The preliminary inherited-membership summary omitted a separate worker171 key during numeric retagging; it was restored to the already correct graph's 13 MC3E modules before sealing. Graph and pair expectations never changed. An attempted note-renderer tool call failed at JavaScript parsing before any shell or file write; the renderer was then written as an audit-only file. The first Python renderer then stopped before output on a saved-field lookup and was corrected to count saved declaration-kind labels. A preclosing audit-only assertion also stopped before writes on an empty mapping/list comparison; its schema handling was corrected. These audit-helper incidents ran no project code and changed no proof evidence.

Final bounded observation:

```json
{
  "absence_check_count": 0,
  "absence_observation_applicable": false,
  "absence_observed_utc": "2026-10-17T04:12:35.574543+00:00",
  "absence_qualification": "Not applicable: all 16 current mathematical modules have retained successful ordinary objects. No new candidate-object absence observation and no extension of any old absence window.",
  "all_unchanged": true,
  "audit_only_input_count": 22,
  "audit_only_input_sha256": {
    "/private/tmp/math_gkm_godel_20261013/audit_worker173_method.py": "7d8daf43fb7b0b5c7a8b1f79dc451f887333b4d7ebd5e02e41d72eb2ec29b12e",
    "/private/tmp/math_gkm_godel_20261013/audit_worker173_method_details.py": "c3899b829001ded4498e9f78db0d19e286e87287739c8a05aeabfea7bf8ba092",
    "/private/tmp/math_gkm_godel_20261013/augment_worker173_method.py": "bf1d0837b72f3e242ee844b7b9b6cc613044c99d7d3cb7e2b11f37700e25803f",
    "/private/tmp/math_gkm_godel_20261013/bind_worker173_method_retention.py": "38c05d3b010f26cb9c37f3820a3ff7cbfb420f280ecaad80deacbebdc5914c2c",
    "/private/tmp/math_gkm_godel_20261013/crosscheck_worker173_method_companions.py": "5be5d1611ab64c12e35c4a7d6e74ebb7e3eb6d62007c3de624c6155004550a65",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000121_replay_method_evidence.json": "ee31340f8122cb4345b6644cee7023494ed4e191d609a7dd6a149be7a5a9a0a5",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000172_late_cache_bundle.json": "79da27a14f3fc36e1318d23d25b75152406884cff6a5b64fe5f51d456b3efad1",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000172_mathematical_source_hashes.json": "46d5f120e16f3128eda2b358b61906707c0ea155d8932c56e8e0ba17739a9d89",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000172_replay_method_evidence.json": "624a56c96106a65eac06d47dc6631b53e8a870255ec68636c63e22aa8e9a3a38",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000172_validation_evidence.json": "f30a5941fb38c258bd7408abb75f9c7a2b3778bbbc01bfd984201f246a031fc1",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_dependency_observation.json": "e162499f164865476cf8d993147529496e6f0797fee9fd900e1cd30f3cc5bea1",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_finite_domain_audit.json": "10bade3e88080660ef20f0f29e5c3f53c06837407cbd7290d81eb778f2e8ac0b",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_inherited_pair_expectations.json": "a8a5dcdb042b0cacb1cb0b55e946d9ab1996758299a153df25b24a1040931a2d",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle.json": "5666af071337060a4cbcf5207e379733a976ac55fd8133033099759620ecd495",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle/research/__pycache__/band_experiment_139fed75.cpython-314.pyc": "db7d0ed69aab5a3749ffe323b70aa58c4fe0c2969bda359eb1587a027594a101",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle/research/__pycache__/validate_139fed75.cpython-314.pyc": "502e449c3fb81c3c6ce65589e12cd7590b24ee2c392cf95280208394a6fe4edd",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_mathematical_source_hashes.json": "bc26f94ae70721e321736a34451dc9b041bb24fae3aeb523114bcfa75178f9bf",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_method_companion_crosscheck.json": "8972ce2985fc6dee54a8c6255c34f290ea43449cc24b15436d0733618b228c22",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_source_structure_audit.json": "9efaf7360f9ddc86ca342a0aaeb01e19641d8e3147b767b1e8d5f40c533f8e5f",
    "/private/tmp/math_gkm_godel_20261013/markov_worker_000173_unarchived_cache_observation.json": "bda2d733f431af26722372a13b7d38f54be65cf9de4a1685685d04416e1b45be",
    "/private/tmp/math_gkm_godel_20261013/render_worker173_method.py": "bdd676e40e52f61c9ac4fc177b72568e9bf9b052f993b1f1a2b55a528032765a",
    "/private/tmp/math_gkm_godel_20261013/seal_worker173_method.py": "a55a4da9165fc3ea8c48cc79213cc6063482ed2f8b0634315aeeb07bdaad144b"
  },
  "finished_utc": "2026-10-17T04:12:35.574531+00:00",
  "input_count": 208,
  "mismatches": [],
  "object_absences": {},
  "scope": "Exact named inputs only; no project program, mathematical computation, directory enumeration, documentation contents or active 174/successor reads. Opaque cache copies hashed only. This closes method project reads; later review is audit-files-only and prior windows remain unchanged.",
  "started_utc": "2026-10-17T04:12:35.519967+00:00"
}
```

Pending-object absence qualification:

```json
{
  "applicable": false,
  "observed_utc": "2026-10-17T04:12:35.574543+00:00",
  "paths": {},
  "scope": "No new candidate-object absence check: every current mathematical module has retained ordinary object; prior absence windows unchanged."
}
```

After this method observation, no project content is reread by the method auditor. Later main/footer checks use audit files only and do not extend this window. The independent validator closes its separate broader observation afterward. All earlier worker seals remain unchanged.
