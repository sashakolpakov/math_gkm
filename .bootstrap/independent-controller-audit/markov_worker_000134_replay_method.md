# Worker 000134: separate compilation, axiom-print and replay scopes

Request `81f80b2ddbc44c6e86d8079cfc7a8e81`. This archive-first static review reads saved worker134 records, exact named counterparts and sealed predecessor evidence. It executes no Lean, proof, checker, replay, experiment, finalizer or project program, changes no project file, and inspects no successor work. Mathematical reasoning and full artifact/object/timing validation are separate audits. A separately preserved late failed Audit receipt is described below without adding it to cutoff coverage.

The retained result has three distinct validation levels:

| Final mathematical source status | Modules | Theorems | Definitions |
|---|---:|---:|---:|
|Successfully compiled, axiom-printed and selected in successful replay|16|40|65|
|Compiled and axiom-printed, without successful replay|23|247|0|
|Compiled, without successful axiom print or replay: Cone2Gap|1|8|0|
|Unbuilt: HighGap, HighAll, Residual|3|4|1|
|All final mathematical sources|43|299|66|

Thus40 final mathematical sources compile,39 have successful named axiom-print coverage, and16 are successfully replayed. The finalizer intentionally records those separate states; its39 validation entries do **not** mean39 replayed modules. Three successful replay selections cover8+6+2 distinct targets, while two larger cone unions time out. There is no retained unconditional high-cone assembly or new checked residual: those final sources remain unbuilt.

The historical controller outcome remains **timeout, returncode0, reportnull**, elapsed1904.2283971309662seconds. There is no `final.json` or `turn.completed`. A successful finalizer with explicit exclusions does not upgrade that outcome or establish mathematical completion. Old worker121's212/195 backlog is absent from the successful current replay and compiled-source bases; it remains reachable only through the unbuilt final draft graph and is unrecovered.

## Exact successful replay inventory

All names in the table have prefix `Markov` and suffix `M81F`. Cone0/1/2 groups each denote three distinct modules.

| Source or group | Modules | Theorems | Definitions |
|---|---:|---:|---:|
|Falling|1|4|1|
|FallingSeed3/5/7|3|3|0|
|HighDefs|1|0|4|
|HighSource|1|3|0|
|HighScaling|1|3|0|
|HighTransfer|1|1|0|
|HighCone0/1/2Defs|3|0|60|
|HighCone0/1/2Expand|3|12|0|
|HighCoefficients|1|3|0|
|HighSmall|1|11|0|
|Total|16|40|65|

All105 explicit selected names are unique, in namespace `MathGKM.Markov`, and end in `M81F`. Source hashes, declared-name lists and reported isolation counts19+72+14 match the final versions. No selected forbidden-token flag, duplicate explicit name, selected/base collision, target imported in its own base or missing matching prior successful build is found. Four definition-only targets—HighDefs and the three ConeDefs modules—contribute64 definitions and no theorem-print rows. Falling contributes the other definition.

Twenty-one ConeCert modules each contain11 theorems, totaling231. They all compile and receive successful axiom prints but have no successful replay. Cone0Gap and Cone1Gap each add eight compiled/printed/unreplayed theorems, yielding the23-module/247-theorem second row above. Cone2Gap also compiles, with eight theorems, but its final Audit has no archived outcome and the separately observed late outcome is timeout. All24 compiled-but-unreplayed modules contribute255 theorem declarations and zero definitions.

The two failed unions select the seven certificates, Defs, Expand and Gap of cone0 and cone1 respectively: ten targets and109 explicit declarations each (89 theorems/20 definitions). Later successful replay covers their Defs/Expand pairs, plus the cone2 pair. It does not recover the certificate or Gap bodies. Sixteen current modules occur only in failed replay selections (14 cone0/1 certificates and two Gaps); eight compiled modules were never selected for replay (seven cone2 certificates and Cone2Gap). Three unbuilt sources likewise have no replay selection.

There are48 final new Lean sources:43 mathematics, four Audits and the driver. One Audit exists only as source/snapshot within the archive, without compiler JSON or axiom JSON. There is no saved mathematical-modules list, compiled inventory or source-dependency inventory. The new finalizer enumerates suffix-matching sources, and independent enumeration confirms every43 mathematical source is accounted for.

## Axiom-print coverage and the missing final Audit

Three successful Audits print14,178 and95 disjoint theorem names, totaling **287 rows/287 unique closures**, all using `{propext, Classical.choice, Quot.sound}`. Their imports partition the39 compiled-and-printed modules: the initial eight bridges, both complete cone0/1 ten-module groups, then cone2's nine Defs/Cert/Expand modules plus HighSmall and HighCoefficients. Their exact requests, compiler output, source-hashed axiom JSON and validation references agree. Every imported source matches its latest successful build before the relevant Audit and is the final source version.

Only40 of those287 theorem prints belong to successfully replayed targets. Printed closure coverage must not be described as287 replayed theorem bodies. Definitions are present in Audit imports/source maps but add no theorem-print rows. In particular, the178-name Audit succeeds while the two large cone replays are still running and eventually timeout; printing axioms does not replace replay.

After Cone2Gap's successful final build, the last Audit source `MarkovAudit1792141544716755000M81F` requests exactly its eight theorem names. Immutable snapshot `build-1792141544717794000.lean` matches that source. Its command starts at event196; no saved completion, numeric build JSON or corresponding axiom JSON is in the controller/archive/index. Finalizer197–198 runs while that Audit remains unresolved in the saved stream and excludes Cone2Gap for missing axiom coverage. No requested print is counted as an observed successful print.

## Unchanged driver, scheduling and changed finalizer predicate

`ReplayIsolatedM81F.lean` has SHA-256 **`1e10c9e3856b15a87fc742608fc736945764af682bb6d3157c97c3dfcd834f2d`**. It is exactly worker133's driver after suffix substitution. Removing its explicit guard and normalizing the entry name, comments and whitespace matches the retained Wide replay body; predecessor hashes match before134 pins. Compiler `-j1`, stack131072, joined task and propagated result are unchanged. The smaller successful target selections are not a checker or stack bypass.

The driver collects target module-data constants, including available server/private parts, excludes target modules from direct imports, constructs the base and invokes ordinary `env.replay`. Its guard rejects collected `MathGKM.Markov.*M81F` names already imported or marked unsafe/partial. All105 explicit successful names are covered. Generated/private/inherited constants outside that predicate retain ordinary replay handling; static declaration comparison does not reconstruct every binary constant or freshly check imported bodies.

Every replay receipt, including both timeouts, has the same matching `checker_sha256`. Selected module source hashes and names are recorded before invocation; checker-source hashes are measured after subprocess return, and axiom source maps after Audit completion. These measurements do not identify every loaded executable, library or optional binary part, or independently reconstruct the source-to-object relation.

The validation wrapper is an exact retagged worker133 copy. Successful console summaries suppress stdout while receipts retain captured output. The new batch helper merely runs that same build wrapper with150second limits in a three-worker ThreadPoolExecutor and returns0 only if every result has returncode0. Each Lean build still uses `-j1`; this is foreground scheduling, not a different checking method.

The Audit wrapper's only final change after retagging is its limit180→35seconds, made at events194–195 for the final Cone2Gap Audit. The earlier three successful Audits run with180second limits. Exact-name matching, axiom-free recognition, permitted-set checks and successful-compiler requirement are unchanged. The shortened last Audit supplies no successful result.

The finalizer is **materially rewritten**, rather than merely retagged. It enumerates mathematical `*M81F.lean` files, excluding Replay/Audit files, instead of reading an explicit module list. It admits a validation entry when a matching successful build and source-matching axiom JSON exist. A matching successful replay is optional and is recorded as a receipt path or **null**. Missing compilation or axiom coverage produces an explicit exclusion entry rather than an assertion failure. No old acceptance boolean is carried forward.

This predicate deliberately permits a successful finalizer while replay gaps and excluded sources remain. It reports39 compiled/axiom-audited modules,16 replayed modules,287 printed theorem closures and four exclusions. Independent checks establish that the non-null replay entries equal exactly the16 successful targets and that validation plus exclusions exhaust all43 final mathematical sources. It does not itself enforce expected counts/checker hash, re-evaluate axiom sets, bind axiom JSON to compiler stdout or prove imported-source reconstruction. Those actual saved associations are independently checked. The unsuccessful-receipt count now includes both compiler and replay outcomes.

## Target isolation and source graph boundaries

| Replay selection | Outcome / limit | Local base | New134 modules in base | Direct imports including Init |
|---|---|---:|---:|---:|
|Initial eight bridges|pass /180s|208|0|6|
|Cone0 ten-module union|timeout /150s|108|1|2|
|Cone1 ten-module union|timeout /150s|108|1|2|
|Three Defs/Expand pairs|pass /120s|108|1|2|
|HighCoefficients and HighSmall|pass /90s|226|7|14|

Both timeout receipts retain literal `None` in stdout/stderr and no isolation/pass line. Their source maps still match the final sources. The successful first base has explicit roots BinomialRatios6a40, HorizontalFourthSeedM511, HorizontalFourthSourceM511, StripGeneralSourceMCE8 and Mathlib. The cone bases import HighDefsM81F, whose compilation and successful replay already completed. The final base imports HighScalingM81F, HighSourceM81F, ten named SmallHorizontal M9E1 sources (2/3,3/4,3/5,4/5,4/7,5/6,5/7,5/8,6/7,7/8) and Unique098. Complete names are in the evidence.

All selected targets and their explicit names are absent from their own base. Later bases contain other current modules; “target-free” does not exclude every current-round source. All such imported current modules have matching successful builds and prior completed matching replays. No compiled-only certificate or Gap is imported into a successful replay base. The union of successful bases is226=seven current+219 inherited local modules.

The successfully replayed source closure is **235=16new+219inherited**. The compiled-and-printed closure is258=39new+219inherited, and the compiled closure259=40new+219inherited. By contrast, the unbuilt final ResidualM81F source closure is **2394=43new+2351inherited**, with299 theorem headers/66 definitions. Adding all four Audit sources gives2398 local graph nodes. The larger draft graph is not a validated residual or imported replay environment. Driver and external Lean/Mathlib source trees are separate; no local source-resolution failure or cycle is found.

The full static mapping under `inherited_object_bindings_from_prior133_124.entries` has **2351 source/object pairs**:2322 sealed133 inherited bindings plus29 accepted133 modules, excluding the intermediate ResidualM570. All match before134 pins, with no fallback pair. Membership flags distinguish the219 inherited modules used by current successful/compiled scopes from2351 reached by the unbuilt draft graph. The inherited Lean path has136 entries behind the current evidence directory.

The companion validation auditor independently hashed all2351 exact current source/object pairs during **09:24:38.382283–09:25:38.691478UTC**, with no mismatch against sealed133 and before134 pins. The219 successful-base flags remain distinct from the broader draft boundary. This verifies preserved bytes, not runtime loading or inherited-body replay.

Zero old121212/195 backlog members occur in successful replay bases or compiled/printed source closures, and none is a current compiler or replay target. All212/195 remain reachable through the unbuilt final draft graph. Therefore no old backlog is recovered, and it would also be inaccurate to describe it as imported by the current successful replay. No worker133 mathematical module is in that successful base;29 occur only in the broader draft graph. Worker128's timeout, Clustered failure and worker133's timeout remain unchanged. No later observation or newly named source retroactively validates excluded historical versions.

## Compiler versions, exclusions and late failed evidence

The historical archive contains **58 numeric compiler receipts and59 immutable snapshots**. Numeric receipts comprise43 successes (40 final mathematical sources and three Audits),11 return-code1 errors and four wall timeouts. There is no superseded successful source. The extra snapshot is the unresolved final Cone2Gap Audit. Five numeric replay receipts add three successes and two timeouts; the finalizer's17 unsuccessful receipts are15 compiler outcomes plus two replay timeouts. That17 excludes the snapshot-only Audit.

All11 compiler-error snapshots differ from their final successful source. The four timeouts are Falling at120seconds (obsolete source), HighSmall at120seconds, Cone2Cert4 at150seconds and Cone2Gap at90seconds. The latter three match final bytes and later compile successfully. HighSmall also gains successful print/replay; Cone2Cert4 gains prints but remains unreplayed; Cone2Gap gains compilation only. It succeeds on a100second retry in74.387750seconds, with estimated finish09:04:51.678723UTC.

The rejected Falling versions lack the final `fall_zeroM81F` and `fall_succM81F` theorem declarations. Other recorded rejected-to-final theorem headers compare unchanged after ordinary whitespace normalization. Diagnostics concern arithmetic/coefficient-index goals, unfold ordering, redundant tactics, cast/chart boundary goals and coefficient-expression simplification. Reusing a name or unchanged header does not validate a failed body; final successful snapshots are separately bound.

The finalizer's four exclusions have different statuses: **Cone2Gap is compiled but unprinted/unreplayed**; HighGap, HighAll and Residual have no successful build. The three unbuilt drafts total four theorem headers and one definition, and have no retained objects. They do not become accepted because their constituent certificates or coefficient bridges compiled.

The companion validation auditor found an exact-current late numeric receipt for the snapshot-only Audit, absent from the controller/archive/index, and preserved it separately under `markov_worker_000134_late_evidence`. This review reads only that preserved copy and manifest. Its SHA-256 is **`68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`**; preservation manifest SHA-256 is **`a5b51ed21032e5162d7d7e128de0543a2584cd455590070e12458b54c9b8f8b1`**. Its source hash matches the archived Audit and immutable snapshot.

That receipt records a35.188140second **timeout**, no returncode, and literal `None` streams. Its project mtime is **09:06:19.909114UTC**,13.611864seconds after the nominal deadline, although before host finish. It supplies no successful compiler outcome, axiom print or theorem evidence. The historical archive remains58 numeric compiler receipts/59 snapshots; the late failed outcome is not backdated into those counts, the17-failure finalizer result,287 prints or any accepted proof scope. No later successful receipt is inferred.

## Finalization and timeout chronology

The sole finalizer, events197–198, succeeds with the separate39/16/287 levels, four exclusions,5889 unchanged prior inputs and246 indexed artifacts. The initial snapshot has5891 entries and excludes its own setup and checkpoint. The finalizer preserves worker132's100 and worker133's180 indexed artifacts. It checks root/canonical contract pins, writes the manifest and verifies its hashes. It performs no missing proof check and there is no subsequent documentation refresh or second finalizer.

Validation.json is written before later assertions, so its presence alone is insufficient; the successful saved finalizer output supports its stated checks. The event stream then ends at an unstructured progress message, event199. There is no final controller report, turn completion or archived return of Audit196. The companion validation accounting finds94 started items and93 completions, with that single Audit unmatched; all536463 event-log bytes are accounted for. The final heartbeat is09:06:06.303694,0.006444seconds after nominal deadline, and supplies no additional proof result. This remains a timeout history even though the finalizer returned0.

| UTC2026-10-16 milestone | Time |
|---|---|
|Controller start|08:36:06.297250|
|Initial successful replay finish estimate|08:56:23.000466|
|Cone0 / Cone1 replay timeout estimates|09:00:29.530513 /09:00:30.546403|
|Last successful95-closure Audit finish estimate|09:02:31.598218|
|Defs/Expand replay finish estimate|09:02:35.519965|
|HighCoefficients/HighSmall replay finish estimate|09:04:22.316876|
|Cone2Gap successful build finish estimate|09:04:51.678723|
|Validation current mtime|09:05:47.556626|
|Final-check current mtime|09:05:52.717831|
|Manifest current mtime|09:05:53.894330|
|Last-verification current mtime|09:05:54.820690|
|Nominal deadline|09:06:06.297250|
|Separately observed late Audit receipt mtime|09:06:19.909114|
|Controller finish|09:07:50.525646|

Receipt finish estimates add recorded durations to filename start identifiers; they are not independently timestamped process exits. File mtimes likewise are saved-write observations. Final verification precedes the nominal deadline by11.476560seconds; host finish follows it by about104.228397seconds. The archive verification copy mtime09:07:49.748471 is snapshot metadata, not the project write time. No mechanism for missing report or snapshot timing is inferred.

All five exact current numeric replay receipts and four finalization counterparts match their archived versions. Full artifact/event accounting, exact-request discrepancy observations and the separately preserved late compiler outcome belong to the companion validation audit. This review supplies no missing replay, whole-source rebuild, runtime binary reconstruction, independent completion audit or protected-root completion claim.

Final method byte-stability check: **218 exact static inputs unchanged at 2026-10-16T09:27:47.138288+00:00**. This includes the separately preserved late failed Audit receipt and manifest as late evidence, not historical acceptance. Exact input hashes, scope partitions and the companion current-object confirmation are retained in the evidence. No further project reads were made after this check.
