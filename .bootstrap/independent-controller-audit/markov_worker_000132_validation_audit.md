# Worker 000132 retained validation audit

Archive-first audit of request `d11e335ef8db44b282c73b02009fc529`, completed worker `/Users/sasha/math_gkm/.control/markov/workers/000132`. Only retained records, static source text and content hashes were inspected. No Lean, proof, checker, replay, experiment, finalizer or other project program was executed; no project files were edited and no active worker133 was inspected. This is a provenance audit of recorded validation, not fresh proof checking or an independent completion audit.

The retained accepted inventory is **9 mathematical modules, 24 theorem closures and 4 definitions**, all successfully compiled, selected in the successful final replay and included in the Audit. Two of these modules are adjacent-cone binomial/source bridges, not merely compiled-only sources. Five additional mathematical drafts have **12 theorem headers and 3 definitions**, but no successful compilation, object, replay or axiom audit. Their statements are not admitted evidence. The controller outcome is **completed**, return code 0, with a structured report and mathematical `completion: null`. Host elapsed is **1802.1768908500671 seconds**, 2.176891 seconds beyond its nominal 1800-second deadline; retained proof, verification and report artifacts precede that deadline. Full Conjecture63 remains unresolved. Historical worker128 timeout and worker121 replay gaps are unchanged.

## Exact accepted and excluded inventories

| Accepted mathematical module | Theorems | Definitions | Final-source build receipt |
|---|---:|---:|---|
| `MarkovStripGapMD11` | 5 | 3 | `build-1792136219421259000` |
| `MarkovStripChooseMD11` | 4 | 0 | `build-1792136516367994000` |
| `MarkovStripSourceMD11` | 3 | 0 | `build-1792136336999258000` |
| `MarkovStripLCMD11` | 2 | 0 | `build-1792136337001058000` |
| `MarkovStripCoefficientsMD11` | 1 | 0 | `build-1792136743235875000` |
| `MarkovStripAllMD11` | 3 | 0 | `build-1792136871777831000` |
| `MarkovStripMiddleChooseMD11` | 2 | 0 | `build-1792136745071821000` |
| `MarkovStripMiddleSourceMD11` | 3 | 0 | `build-1792136871951421000` |
| `MarkovResidualLowMD11` | 1 | 1 | `build-1792137246339457000` |

`MarkovStripMiddleChooseMD11` and `MarkovStripMiddleSourceMD11` contribute five accepted theorem closures. They are selected and replayed even though the authoritative low-cone residual does not import them. They supply source/coefficient bridges, not a successful adjacent-cone LC extension. There is no compiled-only mathematical module or declaration-free diagnostic probe in this round. The final source inventory contains 16 Lean files: 14 mathematical modules, one Audit and the driver.

| Excluded unbuilt module | Theorem headers | Definitions | Recorded build status |
|---|---:|---:|---|
| `MarkovResidualMD11` | 1 | 1 | No compiler attempt or object |
| `MarkovStripMiddleAllMD11` | 3 | 0 | No compiler attempt or object |
| `MarkovStripMiddleCoefficientsMD11` | 1 | 0 | No compiler attempt or object |
| `MarkovStripMiddleGapMD11` | 5 | 2 | Three timeouts; no object |
| `MarkovStripMiddleLCMD11` | 2 | 0 | No compiler attempt or object |

`excluded-drafts.json` lists exactly these five unbuilt sources and names `MarkovResidualLowMD11` as authoritative. The final-check schema itself has no pending fields; JSON nulls for pending-field comparison mean schema absence. Independent archive/source/build enumeration and the explicit exclusions establish the actual accepted/unbuilt partition. Indexing a draft preserves its bytes and does not validate its theorem headers.

All nine accepted source hashes agree among archive, exact named current source, controller changes, index, successful build snapshot/receipt, final replay map, axiom source map and validation entries. All ten retained objects (nine mathematics and one Audit) agree among archive/current/controller/index, and all nine validation object hashes agree. Exact source/object hashes, declaration names and receipt versions are in the accompanying JSON. This establishes retained associations, not independent source-to-object reconstruction.

## Compilation and rejected versions

There are **19 numeric compiler receipts with 19 matching immutable snapshots: 11 successes, 5 return-code-1 errors and 3 wall timeouts**. The 11 successes are nine final mathematical sources, one superseded successful Choose source and one Audit. The eight unsuccessful build receipts are exactly the final-check count. A separate replay timeout is not included in that build count. There is no snapshot-only invocation or axiom-parser rejection. All 21 build/replay receipts bind to saved controller output summaries; successful console summaries suppress stdout while immutable receipts retain the captured output.

| Unsuccessful build | Module | Status | Source SHA-256 |
|---|---|---|---|
| `build-1792136161913706000` | `MarkovStripGapMD11` | rc=1 | `4102f54a8738fe7401d65d13d0f06945551f5be1236ee31cbc1b87beaa604c33` |
| `build-1792136204971148000` | `MarkovStripChooseMD11` | rc=1 | `1841115d6f14515a701514303135a64502adae2ee37807ba7e92057e680924ad` |
| `build-1792136374048555000` | `MarkovStripChooseMD11` | rc=1 | `216ca7211e140bfb9e03af671db42dc793bc57ebd5aa5d0d4c5b3b2f8f545527` |
| `build-1792136460161452000` | `MarkovStripCoefficientsMD11` | rc=1 | `5d9205a895d6e5b7c6e456de132e05db4feeb6610acb86776ae0518a99b9f808` |
| `build-1792136570433549000` | `MarkovStripCoefficientsMD11` | rc=1 | `5d9205a895d6e5b7c6e456de132e05db4feeb6610acb86776ae0518a99b9f808` |
| `build-1792136699036698000` | `MarkovStripMiddleGapMD11` | timeout | `d78f1cf1663e53b91098b29269a6e2a8397429449d3af4928a9d0c6fdf22b479` |
| `build-1792136927687213000` | `MarkovStripMiddleGapMD11` | timeout | `b49484d3322be1d23a5681280ebcbf406408c6eec8bdc897fa44d07dea22fa51` |
| `build-1792137238729016000` | `MarkovStripMiddleGapMD11` | timeout | `7ec5d85bcb5762885e71977557c5fd36d3ef51cb1a37fb3d12954bd6cd7de217` |

The eight failed compiler invocations cover seven distinct source hashes. All five return-code-1 snapshots differ from their accepted final bytes. The two Coefficients errors use the same obsolete source hash: the first lacked the newly added `quartic_allMD11` dependency, while the later attempt encountered a `change`-pattern mismatch after the final Choose source had compiled. The eventual Coefficients source is different and has its own successful receipt.

The first Gap error is lexical: unspaced `0≤stripGapMD11` produced Graph/auto-implicit `tripGapMD11` diagnostics. Whitespace-normalized header equality does not imply identical parsed statements or merely proof-body repairs. Choose first failed on a token error; after an initial success, its extension failed on a polynomial rewrite before the final successful version. Rejected elaborations and their diagnostic placeholders are not admitted evidence.

The initial successful Choose build `build-1792136240603114000` has source SHA-256 `01c8156a1ca9d70d22cac0c1e22fffb6504f9145d0f37665cf09bba30376a4a2` and three theorems, ending at an estimated **07:37:39.832499 UTC**. The final Choose source adds `quartic_allMD11`, has four theorems and SHA-256 `873047a49498f4ccb5fb7acc18d94453dc6dbc31fbfa2fb38d4a5070eb7d38ea`, and succeeds in `build-1792136516367994000`, ending **07:42:16.640719**. Both replay attempts and the final Audit use this final version. The earlier same-name object is not separately retained in the completed archive; no claim is made about global cache absence.

The three MiddleGap timeouts have budgets 180, 240 and 180 seconds and three different source hashes. Their finish estimates are **07:47:59.423033**, **07:52:47.891162** and **07:56:58.925854 UTC**. The last snapshot, SHA-256 `7ec5d85bcb5762885e71977557c5fd36d3ef51cb1a37fb3d12954bd6cd7de217`, is exactly the final retained pending source. It has not been replaced by an accepted build. The earlier two timeouts are obsolete versions, not successful certificates. Timeout JSON records contain `timeout: true` and no `returncode` field; console null is not an independently observed compiler exit code. Their literal captured `None` strings provide no proof-success output.

## Replay and printed closures

The first replay, `replay-1792137233071057000.json`, selects eight final-source modules with **26 explicit declarations = 23 theorems + 3 definitions**. It times out under a 120-second budget after 120.291108 seconds, at an estimated **07:55:53.362165 UTC**. Its source hashes and checker hash match the eventual final versions, but there is no isolation-count or success output. It does not supply replay coverage.

The successful replay `replay-1792137393046787000.json` adds `MarkovResidualLowMD11`, selects **nine modules / 28 explicit declarations = 24 theorems + 4 definitions**, and succeeds under a 240-second budget after 120.513053 seconds, at **07:58:33.559840 UTC**. This is a larger target union, not an identical-selection rerun. The stack remains 131072 and the checker source is unchanged between attempts: `970a63944f0a737559bfae41319e2d80d8937218d3d98bb50cfc1a2335bc3b43`. The successful union selects every accepted module once. The 17 target occurrences across both attempts must not be mistaken for 17 successful targets. All final selected and required new dependency builds precede the appropriate invocations.

The single successful Audit `MarkovAudit1792137394035547000MD11` imports all nine final modules and requests exactly 24 theorem names. It prints **24 rows / 24 unique closures**, all using the permitted triple `{propext, Classical.choice, Quot.sound}`. Audit output, successful compiler receipt, source-bound axiom JSON, selected declarations and validation references agree with no extra/missing name or disallowed axiom. Definitions count for explicit replay coverage, not theorem-print totals.

## Imported boundary and method limitations

Driver and compilation/replay/axiom wrappers are worker131 versions after request/suffix retagging. The ordinary Wide replay body, joined task/result propagation and explicit-name guard remain unchanged; there is no stack retry, predicate weakening or alternative proof-acceptance path. All explicit selected `MathGKM.Markov.*MD11` constants are checked absent from the imported base and for unsafe/partial flags. Generated/private/inherited constants outside that predicate retain ordinary Lean.Replay handling. Checker source hashing is performed after subprocess return, not at invocation start or during runtime object loading. No Lean executable, replay-library binary or all external loaded objects are independently measured or rebuilt here.

The **failed eight-target replay** has a statically reconstructed base of **212 local modules**, but **zero members of worker121’s historical 212-module backlog or its 195-module subset**. The number 212 is a numerical coincidence. Its seven explicit inherited roots plus implicit Init predict eight direct imports; no retained successful output confirms that direct count.

The **successful nine-target replay** adds the low residual’s inherited `MarkovResidualFullMCE8` boundary, expanding the base to **2,314 inherited local modules**, with none of its selected new targets present. Eight explicit inherited roots plus implicit Init match the reported nine direct imports. All historical **212 compiled-but-unreplayed121 modules**, including the **195 Half-certificate subset**, and 19 previously accepted121 modules occur in this successful base. None is rebuilt or selected as a replay target in132: **zero backlog recovery**. The inherited Lean path has134 entries behind the current evidence directory.

The accepted union has **2,323 local nodes = 9 new + 2,314 inherited**. The authoritative `MarkovResidualLowMD11` root alone has **2,321 nodes = 7 new + 2,314 inherited**, with 19 new theorems and four definitions; the two accepted Middle bridges account for the other five theorem closures outside that root. The pending `MarkovResidualMD11` closure has **2,327 nodes = 13 new + 2,314 inherited**, with 35 theorem headers and six definitions; it excludes the accepted Low residual and includes the five unbuilt drafts. All archived mathematics together have2,328 nodes, or2,329 including the Audit. These overlapping scopes are not disjoint counts to add together. Driver and external Lean/Mathlib source trees are separate.

All **2,314 exact current inherited source/object pairs** independently match before132 and sealed131 validation evidence. They comprise2,298 inherited131 pairs plus16 accepted131 modules; the intermediate `MarkovResidualMCE8` is excluded. The observation ran **08:10:02.644712–08:10:42.201483 UTC** with no mismatch. Preserved source/object association is not a fresh build or inherited-body replay. Historical unbuilt121 candidates, worker128’s accepted modules and pending Clustered draft, and worker130’s excluded probes are absent from the current imported boundary. Reconciliation and preservation do not backdate or upgrade those histories.

## Artifacts, preservation and two-stage finalization

There are **102 controller/archive artifacts, 100 finally indexed**. The deliberately nonindexed current `manifest.json` and `last-verification.json` are independently controller/archive/current bound. File types are10 `.olean`,39 `.json`,35 `.lean`,13 `.py` and5 `.md`. The35 Lean files are16 final sources plus19 build snapshots. All controller/archive/current/index hashes agree.

The initial preservation snapshot contains **5,800 entries**, excluding only the own `research/setup_d11e335e.py` under the request filter, leaving **5,799 prior inputs**, including142 `.pyc` records. All entries, including the separately checked setup, remain byte-identical. Setup SHA-256 is `5a4153b146e70a71194f384fdf82fa275b5493636cd7fa9f46bf368a471ca653`; it and the listed bytecode inputs are absent from the narrower controller-before selection without a hash conflict. All six inherited administrative pins match.

Reconciliation’s **341 artifacts** are123 indexed131 +218 indexed128. Full independently checked controller/archive inventories total125+220=345. Each predecessor’s saved raw-log hash, event count and final three events agree with reconciliation. Worker131’s241-event log SHA-256 is `8b347360aa854b41b1f6de0dd95ab84cfff5e6650dee95dc154e1a4b746398a9`; worker128’s281-event log SHA-256 remains `33a4bebc8aad19653af64794e27896b7ef7007170bc0697995741820b7e7f91c`. Preservation does not convert worker128’s timeout/null report or failed Clustered draft into completion.

Root source SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII-escaped canonical contract remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request.

The full finalizer is retagged from131 with predecessor list128/131. It requires source-matching successful build/replay records and axiom-name/source membership, then hashes objects, checks preservation and root/contract pins, publishes the index and writes verification. Its explicit list intentionally excludes the five drafts. It does not itself enforce a precommitted module/theorem count or checker hash, reconstruct objects, re-evaluate axiom sets or bind axiom JSON to successful Audit output. Actual retained associations pass independent checks here. Validation is written before subsequent assertions, so its existence alone is insufficient evidence of completed finalization.

The sole full finalizer starts at event166 and succeeds at167, reporting **96 indexed artifacts**,9 modules/24 closures,5,799 prior inputs and8 unsuccessful builds. After that success, events170–171 update checkpoint, mathematics and operational documents. Events173–174 add `report.json` and `refresh_manifest_d11e335e.py`. Refresh175–176 preserves the first manifest and verification using `write_bytes`, builds the final **100-entry index**, verifies its current hashes and rechecks every prior input. Unlike the first last-verification receipt’s echoed root/contract fields, this refresh freshly hashes and asserts the actual root and canonical contract. It does not rerun compilation, replay, Audit or the full finalizer and does not validate additional mathematics. Stop-file presence remains an observation rather than an assertion of absence; no precommitted proof-completeness/count predicate is added.

The initial manifest’s96 entries and saved initial-verification agree on SHA-256 `e3326f2106aeb70d4333f4cb8a04c62b3ed62887e42a7ac198f43be47f177466`. The final index adds exactly four files: the preserved initial manifest, preserved initial verification, report draft and refresh script. It removes nothing and changes hashes only for the three documents; all93 other common entries, including mathematical sources, objects and proof receipts, are unchanged. Initial document hashes are retained, but complete separate preimages of those three earlier documents are not preserved in the final archive. The initial manifest/verification copy mtimes at08:01:30.484547/.484855 are not original verification times.

`report.json` is an indexed draft with wording different from the final controller report. It retains the same9/24 validation scope, low-cone conclusion, unproved residual and excluded adjacent-cone LC work. The controller report is instead exactly the parsed `final.json` / event177 value. Neither a draft’s existence nor documentation refresh supplies proof coverage.

The reconciliation records a here-document/temporary-storage denial as a capability-failure claim; the saved log repeats that claim but does not identify the original failing invocation. Separately,513-byte stderr records two exact-request documentation `apply_patch` verification errors at07:59:33.185070 and08:00:11.438980. These are not Lean failures. The later successful document update and refreshed index bind final bytes. There is no failed full-finalizer or refresh receipt.

## Deadline, report and late-evidence boundary

| Boundary (UTC, 2026-10-16) | Time |
|---|---|
| Controller start |07:32:44.338085|
| Last selected ResidualLow build finish estimate |07:55:26.544240|
| Initial eight-target replay timeout estimate |07:55:53.362165|
| Final pending MiddleGap timeout estimate |07:56:58.925854|
| 24-closure Audit finish estimate |07:58:15.483566|
| Successful nine-target replay finish estimate |07:58:33.559840|
| Validation mtime |07:59:32.346468|
| Final-check mtime |07:59:33.188860|
| Final checkpoint / mathematics / operational mtimes |08:00:39.982196 /08:00:40.196220 /08:00:40.482810|
| Indexed report draft mtime |08:01:30.061883|
| Preserved initial manifest / verification copy mtimes |08:01:30.484547 /08:01:30.484855|
| Final manifest mtime |08:01:30.815129|
| Refreshed last-verification mtime |08:01:31.950719|
| Event-log mtime |08:01:57.982710|
| Activity heartbeat time |08:01:58.790968|
| Structured final.json mtime |08:01:58.927324|
| Nominal deadline |08:02:44.338085|
| Controller finish |08:02:46.514976|

Build/replay filenames identify invocation starts; completion estimates add retained durations. Mtimes locate saved files, not exact process exits or event timestamps. Retained elapsed and saved epoch subtraction both equal1802.1768908500671seconds. The saved controller outcome is completed despite host finish **2.176891 seconds after the nominal deadline**. Successful replay finishes about250.778245seconds before deadline, final verification72.387366seconds before it and final.json45.410761seconds before it. Host finish follows final.json by47.587652seconds. This host bookkeeping interval is not evidence of further proof work, and elapsed time alone does not rewrite the saved outcome as timeout.

Event177 is the structured report and178 is `turn.completed`. All **81 started items** have completion records; no saved foreground invocation remains outstanding. The activity byte counter **387,996 = 387,483 event-log bytes + 513 stderr bytes** accounts for all178 events with no lag. This is retained accounting, not an independent running-process census.

Final.json SHA-256 is `283863babb62b2a1c67fe030afe6cd71453088846307bb39e64f6a00614ec307`, exactly binding the controller report and final event. Final manifest SHA-256 is `2300e258ebe1d798775e012181a6e64ce000ca4bda70be03475b499841bd00e5`, matching refreshed verification. All project artifact mtimes precede deadline and controller finish. Later archive-copy and controller-receipt bookkeeping are not substituted for project write times. No unaccounted post-finalization or late exact-request file was found; the later documentation refresh and preserved initial receipts are explicitly accounted for. No late proof receipt or historical cutoff upgrade was used.

The recorded new-source validation is consistent over an inherited compiled boundary. It does not recover old replay gaps, validate pending adjacent-cone gap drafts, or prove the full residual/root.

## Final independent stability

The final hash pass checked **8,923 retained inputs** from **2026-10-16 08:15:44.070346 to 08:16:44.015040 UTC**, with zero changed bytes. The exact-request late-file observation at **08:16:44.044422 UTC** found no extra or missing current file and required no separate late-evidence preservation. These observation times do not backdate validation. The method audit’s **100 inputs** were unchanged at **08:13:07.787439 UTC**. The mathematical supplement agrees on all14 source hashes and declaration inventories:9 accepted/24 theorems/4 definitions,5 excluded/12 theorem headers/3 definitions. All19 named inherited source hashes agree and lie within the actual imported base.

Sealed method note SHA-256: `c71f04c9365875a412c636b84345608bca36b8a786193c64c33a84485d2a99d1`. Sealed method evidence SHA-256: `dbb6fc3dd608c6b4d151af6e392b40ea71e45a100a03c37123542e76391ef6a7`.
