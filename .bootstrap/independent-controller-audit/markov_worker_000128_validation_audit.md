# Worker 000128 retained validation audit

Request `263d8c71d1e34c09988ae5004b76a354`. **Controller outcome remains timeout, report null, elapsed approximately1837.140s, despite returncode0 and a successful finalizer.** No final.json or turn.completed is retained. This audit reads the completed worker128 archive/controller and exact named current/predecessor counterparts, using only static parsing and hashing. No project program, Lean, proof, checker, replay, experiment or finalizer was executed; no active129 research was inspected, no project file changed and no proposer contacted. Mathematical interpretation and finite-domain recounting are separate parent supports.

The final retained source inventory has **27 mathematical modules**: **26 accepted modules with85 theorem closures and16 definitions**, plus **one unvalidated ClusteredObstruction draft with seven theorem headers and two definitions**. Every accepted final source has matching successful build/snapshot/object/replay/axiom records. The pending draft has two timed-out compiler attempts and no retained object, successful build, replay or printed closure. No compiled-only accepted candidate exists. The exact accepted list is read by the finalizer from `mathematical-modules.json`; that list is not a claim that all archived mathematical sources succeeded. There is no compiled-inventory.json.

## Source, build, replay and print inventory

| Accepted module | Theorems | Definitions | Successful compiler receipt |
|---|---:|---:|---|
|`MarkovTerminalGapDefsM263`|1|3|`build-1792129449816148000`|
|`MarkovTerminalGap0OneTwoM263`|3|0|`build-1792129531460505000`|
|`MarkovTerminalGap0OneLargeM263`|3|0|`build-1792129543188540000`|
|`MarkovTerminalGap0TwoOneM263`|3|0|`build-1792129551186305000`|
|`MarkovTerminalGap0TwoTwoM263`|3|0|`build-1792129559258870000`|
|`MarkovTerminalGap0TwoLargeM263`|3|0|`build-1792129566214839000`|
|`MarkovTerminalGap0LargeOneM263`|3|0|`build-1792129574185767000`|
|`MarkovTerminalGap0LargeTwoM263`|3|0|`build-1792129582870987000`|
|`MarkovTerminalGap0LargeLargeM263`|3|0|`build-1792129593119889000`|
|`MarkovTerminalGap1OneTwoM263`|3|0|`build-1792129625305747000`|
|`MarkovTerminalGap1OneLargeM263`|3|0|`build-1792129632435859000`|
|`MarkovTerminalGap1TwoOneM263`|3|0|`build-1792129640372250000`|
|`MarkovTerminalGap1TwoTwoM263`|3|0|`build-1792129648128485000`|
|`MarkovTerminalGap1TwoLargeM263`|3|0|`build-1792129655861258000`|
|`MarkovTerminalGap1LargeOneM263`|3|0|`build-1792129663553070000`|
|`MarkovTerminalGap1LargeTwoM263`|3|0|`build-1792129677896950000`|
|`MarkovTerminalGap1LargeLargeM263`|3|0|`build-1792129687706043000`|
|`MarkovTerminalGapM263`|3|0|`build-1792129717891420000`|
|`MarkovTerminalRowM263`|5|4|`build-1792129758768705000`|
|`MarkovTerminalWordFormulaM263`|4|3|`build-1792129663857102000`|
|`MarkovTerminalSmallM263`|2|0|`build-1792129758766371000`|
|`MarkovTerminalAllM263`|4|0|`build-1792129868913211000`|
|`MarkovSourcePrefixSecondM263`|1|0|`build-1792130034698051000`|
|`MarkovAtomicObstructionM263`|5|1|`build-1792129965320378000`|
|`MarkovMixtureObstructionM263`|10|5|`build-1792130326123616000`|
|`MarkovMixtureScopeM263`|2|0|`build-1792130589552083000`|

All26 accepted entries exactly match final declarations, source hashes, successful build receipts and snapshots, retained archive/current/controller object hashes, matching replay targets and named axiom records. No successful source version was later superseded. The archive contains **220 artifacts**, exactly matching the controller change set:32 final Lean sources (27math+4Audit+driver),54 compiler snapshots,30 objects,83JSON files,16Python files and five Markdown files. All54 build receipts have matching immutable snapshots; no snapshot-only invocation is present. The54 attempts partition as30successes (26math+4Audit),22returncode1 failures, and two timeouts whose receipts have timeout=true and no successful returncode. There are five successful replay receipts and no failed/timed-out replay.

| Replay receipt | Targets | Theorems | Definitions | Explicit isolation count |
|---|---:|---:|---:|---:|
|`replay-1792129966670460000`|22 terminal modules through TerminalAll|67|10|77|
|`replay-1792130073308603000`|AtomicObstruction|5|1|6|
|`replay-1792130085817010000`|SourcePrefixSecond|1|0|1|
|`replay-1792130410257552000`|MixtureObstruction|10|5|15|
|`replay-1792130665842076000`|MixtureScope|2|0|2|
|Total|26distinct modules|85|16|101|

All26 modules are explicitly selected once. Each receipt records final source bytes, exact ordered theorem/def/abbrev names, the final checker SHA `4e8e537686884957269f5b9624007e3e47d557b364cbc29355365dfd3aae08c9`, and the matching stdout isolation count. No definition-only or import-only target is included. Four successful Audit builds print67,6,10,2closures:85rows and85distinct final names, without missing/extra/duplicate names. The six-name Audit imports AtomicObstruction and SourcePrefixSecond. Source-hashed axiom JSON, Audit sources/imports, compiler output and final validation pointers all agree.

The85 axiom closures comprise80full triples `{propext,Classical.choice,Quot.sound}`, one `{propext,Quot.sound}` for `terminal_stat_boundM263`, three `{propext}` for `badAtomic_not_expandedM263`, `badAtomic_not_sourceM263`, `expanded_no_adjacent_CM263`, and one empty set for `mixture_equal_countsM263`. The corrected name-aware parser recognizes that empty output; there is no new parser rejection. No disallowed axiom is printed.

## Failed attempts and the excluded final draft

The initial sixteen chart failures are **the same exact source bytes later successfully compiled and accepted**. Each fails because the TerminalGapDefs object is not yet available; all16 finish before its successful build finishes at an estimated05:45:00.550949 UTC. These are dependency-availability failures, not superseded mathematical sources. Later successful source-matching builds supply their actual accepted evidence. Their initial failures remain failures.

Six additional returncode1 failures use obsolete source versions: TerminalWordFormula,TerminalSmall,TerminalRow,TerminalAll,MixtureObstruction,MixtureScope, once each. They concern coefficient simplification, extra tactics after solved goals, zero-product positivity, constant casts and expected types. Their final theorem-name inventories are unchanged and matching successful replacements exist. The evidence contains each snapshot/hash/stdout and final-source comparison. No unsuccessful compiler receipt is silently discarded.

| Remaining failed/draft receipt | Module | Outcome | Snapshot SHA-256 |
|---|---|---|---|
|`build-1792129585827109000`|`MarkovTerminalWordFormulaM263`|rc1|`9908d33d4c058a5e1e58b91769620abfc3f471edced57e910c67cca91046a7dc`|
|`build-1792129714942873000`|`MarkovTerminalSmallM263`|rc1|`1bc58e8aaf639926b4142a1bdaa0208e4d158ec7ac4a3149a3d465f2e26a9afe`|
|`build-1792129727228483000`|`MarkovTerminalRowM263`|rc1|`2bd9e176c59ea591d16b2c76a07571558b092b91606417b9491625e3d233a0fc`|
|`build-1792129822166972000`|`MarkovTerminalAllM263`|rc1|`30237b0a0c2e906e03c29fc5e64e948b75a275635a7688973180ccb95056497b`|
|`build-1792130213240829000`|`MarkovMixtureObstructionM263`|rc1|`6d876751783eb0d6934d9c0108555e69895e49f5a758bbad44f62e0ad56bfa80`|
|`build-1792130537975688000`|`MarkovMixtureScopeM263`|rc1|`8a0420193d31fec07bb2a083c0903caca946008242daee8cd43712ffe46e6d41`|
|`build-1792130664629356000`|`MarkovClusteredObstructionM263`|timeout|`a787f9474a6423597f844d6b15fe9062a62780e024be72a830e7b31d9ac5ee4f`|
|`build-1792130879692652000`|`MarkovClusteredObstructionM263`|timeout|`328bce81378e6eb60a684773c98feaa693c24695956870bb5689686337dd718f`|

The first Clustered attempt has six theorem headers and two definitions and times out after150.268536s. The revised final draft adds `clustered_prefixM263`, for seven headers/two definitions, and times out after120.200624s. Its final source SHA is `328bce81378e6eb60a684773c98feaa693c24695956870bb5689686337dd718f`; the second timeout snapshot matches it exactly. Neither attempt produced a retained object or successful proof check. It remains indexed documentary/source evidence and is excluded from mathematical-modules.json/validation. Its seven textual theorem declarations, including the source exclusion and vertical obstruction claims, are not accepted theorem closures. The finalizer's successful summary does not validate this excluded source.

## Method and dependency boundary

The checker is worker127's driver after suffix retagging. It guards collected `MathGKM.Markov.*M263` names against pre-imported presence, unsafe and partial declarations, then uses ordinary `env.replay` with the collected constants. All101 explicit source declarations lie inside the guard. Generated/private/inherited constants outside it retain ordinary Lean replay behavior. Source-name matching does not reconstruct every binary constant; checker source is hashed after subprocess return, not at invocation. The retained command points at Lean4.32.2, compiler-j1 and replay stack131072, but no independent runtime executable/object measurement or whole-source rebuild was done.

The low-level wrapper change suppresses console stdout for successful runs. Full stdout remains in the immutable receipt. Thirteen summaries differ from the old tail2500 convention for this reason; this audit separately checks that each is exactly blank with returncode0 and binds its other receipt fields, rather than misreporting an evidence mismatch. Failure summaries still retain their stdout tail. All59 compiler/replay receipts are matched to completed controller command events under the actual policy.

The name-aware axiom wrapper retains successful compilation, permitted-axiom and expected-name checks; its default module selection now reads mathematical-modules.json. The finalizer similarly uses that list. Its source-matching build/replay/axiom-JSON predicate and object hashing remain narrower than an independent checker: it does not itself require checker identity, reevaluate axiom sets, bind axiom JSON back to compiler output, reconstruct objects or require all source candidates to be accepted. This audit independently verifies those retained name/hash/output comparisons for the26 selected modules. No old compiled module becomes freshly replayed through preservation.

The22-target terminal union includes internal dependencies and excludes all selected modules together from the base. Its local base has113 inherited modules and direct source imports SecondCoeff340,SecondRowMF52,SecondSmall8934,SecondWord8934,SecondWordMF52,Mathlib (plus implicit Init in stdout's import count). The other bases have31,135,27,28local nodes respectively. SourcePrefixSecond's135base comprises113old+22new terminal modules; MixtureScope's28base comprises27old+the newly accepted MixtureObstruction. All matching new target/base builds and required earlier replays finish before the relevant invocation. No target or explicit selected-name collision occurs in any base, and no replay overlaps unfinished dependency replay. There is no depth/antichain scheduler requirement for the union.

The **accepted mathematical closure is145nodes=26new+119inherited**. Its inherited pairs are106from worker127's inherited bindings,12accepted worker127 modules (all except SmoothingRescue), and RawPrefixM10D from worker126. The accepted roots are AtomicObstruction,MixtureScope,SourcePrefixSecond. No worker121 MAE2 module is in their successful bases.

The **pending Clustered source closure is2265nodes=one unvalidated draft+2264inherited** through its RawPrefixM10D and ThirdAllMF8 imports. It includes all212 historical worker121 compiled-but-unreplayed modules (including195Half dependencies) and19old accepted121 modules. No historical unbuilt121 candidate is reached. None of these old212 is newly built or selected for replay. **The backlog remains unrecovered and appears only in the pending draft's source closure, not in current accepted replay bases.**

The union of all mathematical source closures has2304nodes=27new+2277inherited; adding four Audit sources gives2308local nodes, with the driver and external Mathlib/Lean source trees separate. All2277 exact current source/object pairs were independently hashed and match before128 and sealed worker124–127 bindings. Accepted119 and pending2264 membership flags are preserved individually; overlaps do not add fresh validation. The full pair check ran06:23:09.315050–06:23:40.161029 UTC. It preserves bytes and identifies imports, not their dynamic loading or a fresh dependency rebuild.

## Preservation, finite event evidence and finalization

All220 archive/current/controller artifacts and all218manifest entries match. The manifest and last-verification are the only unindexed artifacts, separately controller-bound. Last-verification's digest and count exactly match the final manifest. No extra archived artifact, extra own current evidence file or missing counterpart was observed. The setup snapshot has5652entries; excluding the run's own setup script, which later changed, leaves5651unchanged prior inputs, including135cache `.pyc` byte files. No cache file was executed in this audit. The six inherited administrative inputs match. The worker reconciles predecessor127's112and worker121's1353manifest entries; this audit also checks their full114and1355controller/archive/current/before artifact sets. Prior event hashes/counts match, and worker121's timeout/nullreport/228events remain unchanged. Root/raw/canonical contract hashes retain their pinned values.

Finite observations are retained separately from accepted proof checks. Event238 prints the actual mechanical3/13word `(0,0,0,0,1,0,0,0,1,0,0,0,1)` and vertical triple `[1,8,34]`. Event270 writes the same source-comparison record with path `[false,false,false,true,true]`; the JSON is valid and SHA `e609cb2ac866f7d79a6534f436209f69d2be24a79d9e420e651e02f219d36dc1`. This is a retained experiment, not a fresh Lean theorem or a value computed by this audit. Events226/239 expose the structured pair examples including `[1,8,82]` and `[1,8,66]` with mixed gap−20. Their negative mixed test does not by itself check positive-weight mixture copositivity. No separate weighted-mixture calculation for the later stress examples was identified in the completed command outputs. The earlier formally checked unguarded mixture and the pending individual clustered draft are distinct evidence scopes. Parent mathematics/finite notes assess exact polygon/source implications; this audit does not recompute coefficients or gaps.

Three direct successful finalizer calls are retained, not one invariant inventory. Event199 reports24modules/73closures,index179,21unsuccessful builds, while MixtureObstruction's revised build is still running. The module list grows to25 at206 and26 at249. Event273 reports26/85,index217,23unsuccessful builds while the revised Clustered attempt is still running. Event274 then records its second timeout. Events276–277 update the scope documents; event279 reports26/85,index218,24unsuccessful builds. The added last receipt explains217→218. The pending final draft and its timeout remain excluded from the accepted list. Event281 reads back final last-verification. Event190 creates the finalizer and is not another finalizer execution. Earlier manifests are historical intermediate summaries; final retained hashes are not stale. No contract-serialization correction was required this round.

## Cutoff and absence of a final report

Times are UTC on2026-10-16. Receipt names identify starts/snapshot times; adding saved elapsed durations estimates subprocess finish rather than independently timestamping exits.

| Milestone | Time |
|---|---|
|Worker start|05:41:11.690288|
|22-module terminal replay completes, estimated|05:53:43.679365|
|67-closure terminal Audit completes, estimated|05:53:53.998420|
|Atomic replay completes, estimated|05:54:48.990128|
|SourcePrefix replay completes, estimated|05:54:55.627188|
|Combined6-closure Audit completes, estimated|05:54:57.378464|
|MixtureObstruction replay /10-closure Audit complete, estimated|06:00:29.374936 /06:00:32.074973|
|MixtureScope replay /2-closure Audit complete, estimated|06:04:36.335054 /06:04:37.490433|
|First Clustered timeout completes, estimated|06:06:54.897893|
|Final Clustered timeout completes, estimated|06:09:59.893275|
|Final validation mtime|06:10:40.927983|
|Final-check mtime|06:10:47.118247|
|Manifest mtime|06:10:47.381978|
|Last-verification mtime|06:10:47.528008|
|Final281-event log mtime|06:10:57.192507|
|Nominal1800-second deadline|06:11:11.690288|
|Activity time /file mtime|06:11:11.735805 /.735991|
|Controller timeout finish|06:11:48.830216|

All observed project artifacts and proof/timeout receipts precede nominal deadline. Final last-verification is24.162280s before it. Activity's timestamp is45.517milliseconds after nominal deadline, but its byte counter exactly covers the full636377-byte event log; stderr is empty. This is host bookkeeping, not evidence of a late proof result. All133 started events have completion partners, with146completed items total; there is no unmatched foreground invocation in the saved log. No independent system-wide process census is claimed.

The controller's retained elapsed field is1837.139928817749s; subtraction of floating-point start/finish fields gives1837.1399278640747s, about one microsecond different. It finishes37.139928s after nominal deadline and records **timeout**, **returncode0**, **report null**. These are separate retained fields. There is no final.json, no structured final report event and no turn.completed. The last prose update at275 and successful finalizer cannot substitute for that missing final response or change the controller outcome. All finalizer summaries keep completion null. No mathematical or historical status is upgraded because the artifact index finished before cutoff.

This audit establishes retained partial validation coverage and provenance. It supplies no missing Clustered certificate, no repair, no fresh inherited replay and no proof or refutation of the full pinned root.

## Final stability and supporting files

Final rereading of **10,491 hashed inputs**, from2026-10-16 **06:26:58.047088 to06:27:43.768923 UTC**, found no changed bytes. The scoped late-file observation at **06:27:43.768947 UTC** found no extra own evidence file or missing controller artifact; no late-evidence preservation was needed. The method audit separately found232inputs unchanged at **06:28:01.533173 UTC**. These checks use content hashes rather than inode/ctime and do not backdate evidence or upgrade the timeout. The parent mathematical source support independently matches all27source hashes/declaration inventories and the26accepted versus onepending split.

- `markov_worker_000128_validation_evidence.json` — SHA-256 `8a761e3923e3e97b03e381c6396ce8cffd60dbd37b9c7c3e824e6428aa1a5ded`
- `markov_worker_000128_replay_method.md` — SHA-256 `ec34874f42b7e465d10b7a80f8a20a7aea9e8680c882cf5b9298cce4442f5701`
- `markov_worker_000128_replay_method_evidence.json` — SHA-256 `afe96cb8d5d4593001fc84de8accdb16a0e5b74bfb8ff23da9e48a0fb7f2e97d`
