# Worker 000134 retained validation audit

Request `81f80b2ddbc44c6e86d8079cfc7a8e81`, saved archive `/Users/sasha/math_gkm/.control/markov/workers/000134/artifacts`. Only completed records, exact named current counterparts, static source parsing and content hashes were used. No Lean, proof, checker, replay, experiment, finalizer or project program was executed; no project file was changed, proposer contacted, or active successor135 inspected. The later exact-request failed receipt is preserved separately. This is retained provenance, not fresh proof checking or an independent completion audit.

**Historical outcome: TIMEOUT, returncode0, reportnull, elapsed1904.2283971309662seconds.** There is no final.json, structured final report or turn.completed. A successful predeadline finalizer records partial validation: **39 compiled-and-printed modules,16 successfully replayed modules and287 printed theorem closures**. Its predicate now permits a null replay field. It does not establish39 successful replays, validate the final all-source theorem, change the inherited residual, or resolve Conjecture63.

## Exact status partition

| Disjoint current mathematical status | Modules | Theorem declarations | Definitions |
|---|---:|---:|---:|
|Compiled, successfully replayed and printed|16|40|65|
|Compiled and printed, without successful replay|23|247|0|
|Compiled, neither printed nor successfully replayed|1|8|0|
|Unbuilt final mathematical drafts|3|4|1|
|All final mathematics|43|299|66|

The39 validation-listed modules total287 theorems/65 definitions. All40 successfully compiled mathematical sources total295 theorems/65 definitions. The audit JSON's legacy `accepted` field means the stronger16-module compile+replay+print set; it is not a relabeling of all39 worker validation entries. These distinctions are explicit rather than inferred from a finalizer's success.

| Final mathematical module | Theorems | Definitions | Retained status |
|---|---:|---:|---|
| `MarkovFallingM81F` | 4 | 1 | replayed + printed |
| `MarkovFallingSeed3M81F` | 1 | 0 | replayed + printed |
| `MarkovFallingSeed5M81F` | 1 | 0 | replayed + printed |
| `MarkovFallingSeed7M81F` | 1 | 0 | replayed + printed |
| `MarkovHighAllM81F` | 2 | 0 | unbuilt |
| `MarkovHighCoefficientsM81F` | 3 | 0 | replayed + printed |
| `MarkovHighCone0Cert0M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert1M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert2M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert3M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert4M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert5M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0Cert6M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone0DefsM81F` | 0 | 20 | replayed + printed |
| `MarkovHighCone0ExpandM81F` | 4 | 0 | replayed + printed |
| `MarkovHighCone0GapM81F` | 8 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert0M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert1M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert2M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert3M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert4M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert5M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1Cert6M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone1DefsM81F` | 0 | 20 | replayed + printed |
| `MarkovHighCone1ExpandM81F` | 4 | 0 | replayed + printed |
| `MarkovHighCone1GapM81F` | 8 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert0M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert1M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert2M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert3M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert4M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert5M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2Cert6M81F` | 11 | 0 | compiled + printed; unreplayed |
| `MarkovHighCone2DefsM81F` | 0 | 20 | replayed + printed |
| `MarkovHighCone2ExpandM81F` | 4 | 0 | replayed + printed |
| `MarkovHighCone2GapM81F` | 8 | 0 | compiled only; unprinted/unreplayed |
| `MarkovHighDefsM81F` | 0 | 4 | replayed + printed |
| `MarkovHighGapM81F` | 1 | 0 | unbuilt |
| `MarkovHighScalingM81F` | 3 | 0 | replayed + printed |
| `MarkovHighSmallM81F` | 11 | 0 | replayed + printed |
| `MarkovHighSourceM81F` | 3 | 0 | replayed + printed |
| `MarkovHighTransferM81F` | 1 | 0 | replayed + printed |
| `MarkovResidualM81F` | 1 | 1 | unbuilt |

The23 compiled-and-printed but unreplayed modules are all21 cone certificate files (231 theorem declarations) and Cone0Gap/Cone1Gap (eight each). Cone2Gap is the additional compiled, unprinted/unreplayed eight-theorem source. HighGap, HighAll and Residual have no matching successful build or object, containing one, two and one theorem headers respectively; only Residual adds a definition. Their final statements are drafts, not established results.

Four replayed modules are definition-only: HighDefs has four definitions, and the three cone Defs have20 each. They contribute64 explicitly guarded definitions and no theorem-print rows. Falling adds the65th definition. The48 final Lean sources comprise43 mathematics, four Audits (three successful, one outstanding in the archive), and the driver. No declaration-free diagnostic probe or superseded successful source was found.

Every final source hash matches archive, exact current counterpart, controller changes and index. All40 final compiled sources additionally match successful immutable build snapshots/receipts and retained object bindings. All43 objects (40 mathematics plus three Audits) match archive/current/controller/index. The39 validation source/object/build/axiom references agree; its16 nonnull replay references match successful final-source selections. Null replay is retained as missing coverage. Exact declaration names and all source/object hashes are in the accompanying JSON.

## Compiler versions and unsuccessful records

The completed archive has **58 numeric compiler receipts and59 snapshots**:43 successes,11 return-code1 failures, four wall timeouts, and one additional snapshot without its receipt. The43 successes are40 final mathematical builds plus three successful Audits. There is no successful superseded source. All58 numeric build snapshots match receipt source hashes; all archived build/replay summaries bind to controller output. Success summaries suppress stdout while immutable receipts retain captured output.

The final-check's **17 unsuccessful receipts** are15 compiler failures/timeouts plus two replay timeouts. It is not a count of17 failed builds. The final Audit snapshot-only invocation is outside that numeric receipt count. Its separately observed late timeout is described below and is not inserted into the archive counts.

| Unsuccessful compiler receipt | Module | Outcome | Final-byte relation | Snapshot SHA-256 |
|---|---|---|---|---|
| `build-1792140006923553000` | `MarkovFallingM81F` | rc1 | obsolete | `c5b65e4feddf87e3db93dbd45251b1adfe8dc09d20dc0c2406b481c6f8f71f8b` |
| `build-1792140191274350000` | `MarkovFallingM81F` | timeout | obsolete | `4b152e69c0f45457ac38d420c27bdcd83204793d5eb336d30356e4a8c5d8c863` |
| `build-1792140471175692000` | `MarkovHighCone0ExpandM81F` | rc1 | obsolete | `d0cc195965b7e4f30e3d3270b1776f16d2942e011ea3cc9c721da8ef2e04ad24` |
| `build-1792140471176178000` | `MarkovHighCone1ExpandM81F` | rc1 | obsolete | `42829b4887cfa6793473eb52e9bbfdf8d843568bb05d08b83445ffb218e5f006` |
| `build-1792140475408718000` | `MarkovHighCone2ExpandM81F` | rc1 | obsolete | `4eec86f35a2678ed9984a5bffe2dd87cd3fc22c081bb8ac13ee4251fbd905e8c` |
| `build-1792140512459796000` | `MarkovHighSourceM81F` | rc1 | obsolete | `53dada8e1889912dc68dfa8c042923f12c6b1f6bdc9fcd5d3841d03a5d631c87` |
| `build-1792140521651092000` | `MarkovHighCone0Cert5M81F` | rc1 | obsolete | `57c8de3902398942df99979e3ea54db2bea3b857551850d4ceff76ed918215bf` |
| `build-1792140562005056000` | `MarkovHighCone0Cert6M81F` | rc1 | obsolete | `50e4dcb6c5570dcd8850d2ecea10e816da903e03e3e9ac24caa8d41ca0531937` |
| `build-1792140829701014000` | `MarkovHighSmallM81F` | timeout | same final | `772b7dbb2107099d19abf45a0adb1cda073b2688c24ad94d9ea2c3d4c21992f7` |
| `build-1792140847517559000` | `MarkovHighCone0GapM81F` | rc1 | obsolete | `31a127a6e8ee65b9132a5a32e14a6afeb4847dfa4dde22aaf8c68eec8ec5eab5` |
| `build-1792140847537794000` | `MarkovHighCone1GapM81F` | rc1 | obsolete | `79f7ac9b1f7f43a353f12fd82ab10f2ddd9600778005f6afea4cd557829ae748` |
| `build-1792140847545653000` | `MarkovHighCoefficientsM81F` | rc1 | obsolete | `b54152711061910e05226df7e7a92a06abea48709266950194e5d33c7b6936ae` |
| `build-1792140872695319000` | `MarkovHighCone2Cert4M81F` | timeout | same final | `76596907b1a35bca95b0c404cc08def55cce577b5c09084397bc6ec038fdcdac` |
| `build-1792140975387505000` | `MarkovHighCoefficientsM81F` | rc1 | obsolete | `e2fc5525640114b8c7311222fe1b2a8f37f05fa7c3c021a5a969f26acb8584a3` |
| `build-1792141267598971000` | `MarkovHighCone2GapM81F` | timeout | same final | `3911de50d5b8383548d2cf9ad19be8f355a3cba9e2bfba9347dbdd8d248b2106` |

All11 rc1 snapshots are obsolete final-source versions. They include Falling arithmetic/cast goals; three Expand files using an inapplicable `unfold` list; HighSource's incorrect index-conversion proof expression; Cone0Cert5/6 residual tactics after goals closed; Cone0Gap/Cone1Gap cast/subtraction coverage issues; and two Coefficients rewrite/simplification failures. Exact diffs and diagnostics are retained. Falling's final source adds `fall_zeroM81F` and `fall_succM81F` to the two original theorem headers. Successful later names are not used to admit rejected proof bodies.

Of the four compiler timeouts, Falling is obsolete. HighSmall, Cone2Cert4 and Cone2Gap are exactly the eventual final source bytes and each later compiles successfully. The first two are later printed; HighSmall is also successfully replayed. Cone2Gap's final build succeeds at an estimated09:04:51.678723UTC but its subsequent Audit has no successful closure output and it remains unreplayed. Thus not every failed attempt is superseded by changed bytes or by complete validation.

Timeout JSON records have `timeout:true` and no returncode field; console null does not identify a compiler exit status. Literal captured `None` strings supply no proof-success output. Operational generator/syntax failures and the separately interrupted experiment are not numeric proof receipts and are not folded into the17 count.

## Successful replay, failed unions and printed closures

| Replay identifier | Targets | Explicit declarations | Retained outcome | Finish estimate UTC |
|---|---:|---:|---|---|
|1792140901677484000: Falling/Seeds, HighDefs/Source/Scaling/Transfer|8|19=14theorems+5defs|success|08:56:23.000466|
|1792141079318790000: full Cone0 union|10|109=89theorems+20defs|150s timeout|09:00:29.530513|
|1792141080333936000: full Cone1 union|10|109=89theorems+20defs|150s timeout|09:00:30.546403|
|1792141268372531000: all three cone Defs/Expand pairs|6|72=12theorems+60defs|success|09:02:35.519965|
|1792141418424453000: HighCoefficients and HighSmall|2|14theorems|success|09:04:22.316876|

The three successful batches are disjoint, yielding16 modules and **105 explicit declarations=40theorems+65definitions**. Their isolation counts19,72,14 and declared-name/source maps match final source. Across all attempts there are36 target occurrences but32 distinct targets; neither is successful coverage. Both failed full-cone unions use final source bytes and the final checker hash. They have no isolation-count/success output. The smaller successful six-module batch checks only Defs/Expand files, leaving every certificate file and every cone Gap without successful replay. Cone2's certificates/Gap were never selected for a numeric replay at all.

Three successful Audits print **14+178+95=287 rows and287 unique closures**, all exactly `{propext, Classical.choice, Quot.sound}`. They cover all39 listed sources and their exact theorem inventory. Latest successful source snapshots before each Audit match final source; requested names, output, axiom JSON maps and validation references agree. The21 certificate modules'231 named closures are printed but are not separately replayed. Definitions are included in source maps/imports without adding print rows.

The fourth generated Audit requests exactly Cone2Gap's eight theorem names. Its source and immutable snapshot exist in the historical archive, but no compiler JSON, object or axiom JSON does. It cannot raise the printed total to295. The later failed receipt likewise supplies no closure output.

## Method and imported scope

Final driver SHA-256 is `1e10c9e3856b15a87fc742608fc736945764af682bb6d3157c97c3dfcd834f2d`. The driver and validation wrapper are worker133 after request/suffix retagging. Ordinary Wide replay, compiler-j1, stack131072, joined-task execution and propagated results are unchanged. There is no larger-stack retry or alternate acceptance mechanism. The explicit guard rejects selected `MathGKM.Markov.*M81F` names already in the inherited environment or marked unsafe/partial. All105 successful explicit names are unique and covered. Generated/private/inherited constants outside that predicate retain ordinary replay handling.

Selected source hashes and declared-name lists are measured before invocation; checker-source hashes after subprocess return, and Audit source maps separately after Audit completion. These do not independently identify loaded runtime executables, replay-library binaries or optional module-data parts. Source/object preservation is not source-to-object reconstruction or a whole-source rebuild.

The Audit wrapper's final-only change lowers the build wall limit180→35seconds at events194–195. The three successful Audits precede that change and use180seconds; exact-name parsing, axiom-free recognition, permitted axioms and successful-compiler requirement are unchanged. The final35second Audit times out in the separate late record. Reducing its wall limit does not validate it.

| Replay selection | Local inherited base | Current134 modules in base | Direct imports including Init |
|---|---:|---:|---:|
|Successful first8|208|0|6|
|Failed Cone0 ten-target union|108|1|2 expected, no success output|
|Failed Cone1 ten-target union|108|1|2 expected, no success output|
|Successful six Defs/Expand|108|1|2|
|Successful Coefficients/Small pair|226|7|14|

Every base excludes that invocation's selected target modules and explicit names. Other current modules can be imported: the108-node base contains HighDefs plus107 old modules; the226-node base contains seven new and219 old modules. Matching new dependency builds precede compilation/Audit/replay; the current imported dependencies of successful later batches have earlier successful replay records. No successful batch imports the current unreplayed certificate or Gap modules.

The successful16-module source closure is **235=16new+219inherited** local nodes. The39 printed sources have258=39+219; all40 compiled sources have259=40+219. All of these scopes have **zero members of worker121's historical212-module replay backlog or195-module subset**. The unbuilt final residual's full draft closure is **2394=43new+2351inherited**, or2398 including four Audits; that draft graph reaches all old212/195 and19 previously accepted121 modules. None of the old212 is selected or rebuilt here: **zero backlog recovery**, and no claim that it is imported into the current successful short base.

All2351 exact named inherited source/object pairs, including the broader draft boundary, independently match before134 and sealed133 validation:2322 sealed133 inherited pairs plus29 accepted133 modules, excluding the intermediate ResidualM570. Only219 pairs are in the successfully replayed source closure. The observation ran09:24:38.382283–09:25:38.691478UTC without mismatch. Driver and external Lean/Mathlib source trees are separate from local graph counts. Preserved objects and prior byte-identical storage maintenance do not improve historical replay coverage.

`MarkovHighSourceM81F` itself belongs to the first fully replayed batch and has three printed source identities. The last prose's generic “source-statistic bridge unchecked” cannot override that exact status. The missing final cone/statistic and all-source assembly remains in the unbuilt HighGap/HighAll/Residual stack; no new unconditional all-source strip or residual equivalence is admitted from its text.

## Finalizer changes and preservation

The finalizer is materially rewritten from133. It enumerates all suffix-matching mathematical sources rather than reading a precommitted mathematical-module list. A source enters validation.modules when a matching successful compiler receipt and matching axiom source/name coverage exist; successful replay is optional and stored as null if absent. Missing compile or axiom coverage produces an explicit excluded entry. Independent source enumeration verifies the39 listed/four excluded partition and16 nonnull replay fields. This is a weaker membership predicate than133's required compile+replay+print, accurately reflected in the retained schema and summary.

It still records current object hashes, checks prior inputs and root/contract pins, then constructs and rehashes the manifest. It does not independently require a fixed count/checker hash, re-evaluate axiom sets, bind axiom JSON to compiler stdout or reconstruct source/object correspondence. Actual saved associations were checked independently here. Validation is written before later preservation assertions, so file existence alone is not a successful finalizer. Last-verification root/contract fields echo the earlier calculations in the same invocation. Stop absence is observed in final-check rather than asserted, and is not present in this round's last-verification.

The sole finalizer, events197–198, succeeds while the final Audit started at196 remains outstanding. It reports the exact partial statuses and246 indexed artifacts; the next agent prose at199 still makes no unconditional theorem claim. No final report or turn.completed follows. Finalizer success is not a substitute for that missing report, replay coverage or Audit completion.

There are **248 archive/controller artifacts,246 indexed**, with manifest.json and last-verification.json deliberately excluded from their own index but independently controller/archive/current bound. Types are43 `.olean`,77 `.json`,107 `.lean`,16 `.py`,five `.md`;107 Lean files comprise48 final sources plus59 snapshots. All historical content bindings match. The extra exact-request current JSON is preserved outside this inventory below.

The initial snapshot has5891 entries. The request-name filter excludes **two own files**: setup (unchanged) and checkpoint (changed during the run). This leaves **5889 byte-identical prior inputs**, including144 `.pyc` records. Initial checkpoint hash `9eb4814e08fad60802921e7ffd4336611db7bd3ce985548044b78197da3cb42a` differs from final `f74361b48d96de52202584defe8932d972ae00c3e9593d56871c29e7cea2b659`; this is an excluded own-file update, not broken prior preservation. Setup remains `d0a4f4872b2e84236bfe15858e680c25b23106818438433ca2c014c39ae95cf2`. Every overlapping controller-before pin and all six inherited administrative hashes agree.

Reconciliation preserves100 indexed132 artifacts and180 indexed133 artifacts. Full separate archive/controller checks cover102+182=284 predecessor artifacts. The interrupted133 record's238-event count, four final events, outcome, elapsed and raw-log SHA `ceaf97dd821ed2ddc12dc15607aa42c08a6ff62ab25668a8b62414efd2558dab` agree with the saved predecessor. **526=100+180+246** is the sum of three disjoint index groups, not worker134's own manifest size. Neither reconciliation nor this audit upgrades133 timeout or any earlier missing proof.

Root SHA remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted compact ASCII canonical contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request.

## Nominal deadline and separate late failure

| UTC2026-10-16 milestone | Time |
|---|---|
|Controller start|08:36:06.297250|
|First successful8-target replay finish estimate|08:56:23.000466|
|First14-closure Audit finish estimate|08:56:25.434178|
|178-closure Audit finish estimate|08:58:55.785259|
|Two full-cone replay timeout finish estimates|09:00:29.530513 /09:00:30.546403|
|95-closure Audit finish estimate|09:02:31.598218|
|Six-target replay finish estimate|09:02:35.519965|
|Same-final Cone2Gap compiler timeout finish estimate|09:02:37.790148|
|Last two-target replay finish estimate|09:04:22.316876|
|Successful Cone2Gap build finish estimate|09:04:51.678723|
|Final eight-name Audit snapshot/invocation start|09:05:44.717794|
|Validation project mtime|09:05:47.556626|
|Final-check project mtime|09:05:52.717831|
|Manifest project mtime|09:05:53.894330|
|Last-verification project mtime|09:05:54.820690|
|Event-log mtime|09:05:56.913617|
|Nominal deadline|09:06:06.297250|
|Last heartbeat time|09:06:06.303694|
|Separately observed late failed Audit receipt mtime|09:06:19.909114|
|Controller finish|09:07:50.525646|

Invocation filenames identify starts. Finish estimates add retained elapsed durations and are not independently timestamped process exits; project mtimes and command completion order are separate observations. All248 historical project artifact mtimes precede the nominal deadline. Last successful replay is103.980374seconds early, last successful build74.618527seconds early and final verification **11.476560seconds early**. Host finish is104.228396seconds after deadline and115.704956seconds after verification. The retained elapsed field1904.2283971309662 differs from saved epoch subtraction1904.2283959388733 by about1.19microseconds. Archive copy mtimes are later bookkeeping, not project verification times.

The199-event stream has94 started items and **one unmatched final Audit**. The activity counter536463bytes accounts for the entire log; stderr is empty. Its last heartbeat is about0.006444seconds after nominal deadline. The last event199 is ordinary agent prose, not a structured final report; final.json and turn.completed are absent. No cause for report loss or archive selection timing is inferred from these records.

A current exact-request file absent from controller changes, archive and finalizer manifest was observed and copied at **09:21:30.567632UTC**:

- Original: `/Users/sasha/math_gkm/evidence/markov-81f80b2d/build-1792141544717794000.json`.
- Preserved: `/private/tmp/math_gkm_godel_20261013/markov_worker_000134_late_evidence/build-1792141544717794000.json`, SHA-256 `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`.
- Observation manifest: `/private/tmp/math_gkm_godel_20261013/markov_worker_000134_late_evidence/manifest.json`, SHA-256 `a5b51ed21032e5162d7d7e128de0543a2584cd455590070e12458b54c9b8f8b1`.

This620-byte receipt exactly matches the archived final Audit source/snapshot hash. It records a **35.188140040962026second timeout**, no returncode, and literal `None` stdout/stderr. Its project mtime is13.611864seconds after nominal deadline but90.616532seconds before the later controller finish. Those two facts are retained together; host bookkeeping time does not insert an omitted receipt into the historical snapshot. The historical record remains58 numeric build receipts plus one snapshot-only Audit,15 failed builds plus two failed replays,287 successful prints. The later failure is separately documented, never backdated or promoted to a successful Audit.

Manifest SHA `5d588caf66e480c11d4e2e5d499f8d87dac86f07047a782ec1f1d7e645386574` matches last-verification, whose SHA is `55e156d30109b4f944a95e4245b68cdc360a631a93306d295fe571a88cb7ac63`. The indexed snapshot preserves the outstanding invocation even though its later JSON is outside the index. No missing success is manufactured by preserving that late failure.

The separate48-bound experiment was interrupted with saved rc130/KeyboardInterrupt and no completed result; a24-bound run has its own successful receipt. A denied ps invocation supplied no process census. These are operational/finite records, not proof/replay evidence, and no experiment was rerun for this audit.

## Final independent stability

Final byte stability covered **9203 inputs** during **2026-10-16 09:28:23.752430–09:29:44.911354UTC**, with zero changed hashes. This includes the separately observed late failed receipt without changing its historical status. At **09:29:44.937270UTC**, the exact-request current evidence/research observation found only that one known preserved extra JSON, no unaccounted extra file and no missing historical file. The preserved receipt and observation manifest still match their reported hashes. No further project reads were made after this check.

The method audit's218 exact static inputs were unchanged at09:27:47.138288UTC. The mathematical supplement agrees on all43 new source hashes and declarations, every status partition, and all21 named older comparisons. Nineteen named comparisons lie in the successfully replayed source closure; ResidualHalfM570 and NextAllM570 lie only in the broader draft graph. Their preservation does not add replay coverage.

Sealed method note SHA-256: `48c3bd4454833b383f39fda3b6e7a3abc2ef810214baeaf4d58f3c80d5cece8a`. Sealed method evidence SHA-256: `6b1d772fe199667be623a57c53adecb85a9fa6d37689e877e6c27ac911d62f21`.
