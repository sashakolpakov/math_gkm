# Worker 000131 retained validation audit

Archive-first audit of request `ce882be3be764bbea0eaabd905e3bf18`, completed worker `/Users/sasha/math_gkm/.control/markov/workers/000131`. Only retained records, static source text and content hashes were inspected. No Lean, proof, checker, replay, experiment, finalizer or other project program was executed; no project files were edited and no active worker132 was inspected. This is a provenance audit of recorded validation, not a fresh mathematical check or independent completion audit.

The final inventory agrees: **17 mathematical modules, 47 named theorem closures and 9 definitions**, all at final-source versions with successful compilation, one isolated replay union and one successful axiom audit. GeneralGap is a definition-only selected module with three definitions and zero theorem closures. There is no compiled-only module, unbuilt mathematical source or diagnostic Lean probe in this archive. The controller outcome is **completed**, return code 0, with a structured report and mathematical `completion: null`. Full Conjecture63 remains unresolved. Historical worker128 remains **timeout / null report**, and the worker121 backlog remains unrecovered.

## Inventory and bindings

| Final mathematical module | Theorems | Definitions | Successful final-source build receipt |
|---|---:|---:|---|
| `MarkovStripGapMCE8` | 4 | 2 | `build-1792134585146748000` |
| `MarkovStripSourceMCE8` | 3 | 1 | `build-1792134628678205000` |
| `MarkovStripChooseMCE8` | 2 | 0 | `build-1792134667776267000` |
| `MarkovStripLCMCE8` | 2 | 0 | `build-1792134740447577000` |
| `MarkovStripCoefficientsMCE8` | 1 | 0 | `build-1792134730452958000` |
| `MarkovStripAllMCE8` | 4 | 0 | `build-1792134918682598000` |
| `MarkovResidualMCE8` | 1 | 1 | `build-1792135022183870000` |
| `MarkovStripGeneralGapMCE8` | 0 | 3 | `build-1792135024138023000` |
| `MarkovStripHalfGapMCE8` | 4 | 0 | `build-1792135126607771000` |
| `MarkovStripHighGapMCE8` | 4 | 0 | `build-1792135228950407000` |
| `MarkovStripGeneralSourceMCE8` | 3 | 1 | `build-1792135126799005000` |
| `MarkovStripGeneralChooseMCE8` | 2 | 0 | `build-1792135126813377000` |
| `MarkovStripGeneralCoefficientsMCE8` | 2 | 0 | `build-1792135283089642000` |
| `MarkovStripGeneralLCMCE8` | 4 | 0 | `build-1792135458122228000` |
| `MarkovStripSmallMCE8` | 7 | 0 | `build-1792135458171796000` |
| `MarkovStripFullMCE8` | 3 | 0 | `build-1792135529978638000` |
| `MarkovResidualFullMCE8` | 1 | 1 | `build-1792135609398636000` |

All final mathematical source hashes agree among archive, exact named current source, controller changes, index, successful build snapshot/receipt, replay source map, axiom source map and validation entries. All 18 retained compiled objects (17 mathematics and one Audit) agree among archive/current/controller/index, and the 17 validation object hashes agree. Exact source/object hashes, declaration names and receipt versions are recorded in the accompanying JSON. Object/source association is supported by these retained records; hashing is not an independent source-to-object reconstruction.

There are **125 archived/controller artifacts, with 123 indexed**. The two deliberate nonindexed files are `manifest.json` and `last-verification.json`, both independently controller/archive/current bound. The breakdown is 18 `.olean`, 41 `.json`, 43 `.lean`, 18 `.py` and 5 `.md` files. The 43 Lean files comprise 19 final sources (17 mathematics, one Audit and the driver) plus 24 immutable build snapshots. No compiled-inventory file exists; independent final-source and successful-build enumeration finds exactly the 17 accepted mathematical modules. The final-check schema has no pending fields; JSON nulls for pending-field comparison mean schema absence. Independent enumeration establishes no pending source, rather than inferring that result from the schema. Candidate next-strip experiments are not an additional Lean module.

The worker-local initial snapshot has **5,757 entries**. Its request/suffix filter excludes only the worker’s own `research/setup_ce882be3.py`, leaving **5,756 prior inputs**, including 141 `.pyc` files. All initial entries, including the separately checked setup exclusion, still match their current bytes. The setup hash is `3888a3a33c301c1899c96650b429c348790815ae10cd54e88fa028edf83e6fa5`; it is absent from controller-before because it was created later. The narrower controller-before selection also omits the listed `.pyc` inputs; those absences are separately retained and are not hash conflicts. All six inherited administrative inputs match.

Worker130’s 87 indexed artifacts and all 89 controller artifacts agree with its archive, current files and before131 pins. Worker128’s 218 indexed artifacts and all 220 controller artifacts also agree. The final report’s **305 reconciled artifacts** means 87+218 indexed entries; the full separately inspected controller inventories total 309. The retained130 raw log has 214 events and SHA-256 `7263243cb130a04ffa56ec98aa152162f5055735d79dcec53c00950d11cc1b85`; retained128 has 281 events and SHA-256 `33a4bebc8aad19653af64794e27896b7ef7007170bc0697995741820b7e7f91c`. Reconciliation reproduces each final three events exactly. It preserves worker128’s excluded Clustered draft, compiler failures and timeout without promoting them to accepted validation.

Root source SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract SHA-256 remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII-escaped canonical contract digest is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request.

## Compilation, rejected versions, replay and printed closures

The archive retains **24 compiler receipts with 24 matching snapshots: 18 successes and 6 return-code-1 failures**. The successes comprise 17 final mathematical sources and one Audit. There is no compiler timeout, superseded successful source, snapshot-only invocation, failed replay or axiom-parser rejection. All 25 compiler/replay receipts bind to saved controller output summaries, including the deliberate suppression of successful stdout in console summaries; the full captured output remains in the receipt. All six failed snapshots differ from their accepted final source bytes:

| Failed build | Module | Rejected source SHA-256 |
|---|---|---|
| `build-1792134699751813000` | `MarkovStripLCMCE8` | `246689dc26fb443d2e2983a3d3dfdc299b2bc63d09730d2ddcccbfa4ee420abc` |
| `build-1792134817960946000` | `MarkovStripAllMCE8` | `9042aeafb9e0636fb0103429e5ba9420540c79df794e37cc5f469e8e7615ae24` |
| `build-1792135066612286000` | `MarkovStripGeneralSourceMCE8` | `806d98d056e4e7aae64a58b5bd67c01210373c55278779be305cf76c5e012abb` |
| `build-1792135230011526000` | `MarkovStripGeneralCoefficientsMCE8` | `a616b9954bef1853ac3e69f1732f8dc2ffba27db075be457f71d0bbe57dd4433` |
| `build-1792135353271620000` | `MarkovStripSmallMCE8` | `bd1cdef802cc0fc65b809aff0a1efbbf3642136ed51a7df20337aa6442dc737d` |
| `build-1792135402994665000` | `MarkovStripGeneralLCMCE8` | `cd410c023bc801da168cffd438716dea75d036d708f219fd9f19aa785fd53065` |

The diagnostics concern a natural/integer cast in StripLC; an arithmetic/coprime branch in StripAll; polynomial presentation in GeneralSource; a polynomial equality in GeneralCoefficients; explicit small-polynomial evaluation in Small; and a casted-zero mismatch in GeneralLC. The rejected and final versions retain the same theorem/definition header text after ordinary whitespace normalization. That text comparison does not establish equality of parsed or elaborated statements, nor make rejected proof bodies accepted evidence. Each final version has its own successful source-bound compilation. There is no same-final unsuccessful receipt or changed replay acceptance predicate used to explain this round’s repairs.

One replay, `replay-1792135684008842000.json`, selects all 17 accepted modules exactly once at their final source hashes. It reports **56 isolated explicit mathematical constants = 47 theorems + 9 definitions**. The checker source hash recorded after subprocess return is `24ff53c987b5bf19bc1b103a74d35c27d92e0244f93a5e6bd0fd08ea2a64f5cb`, matching the archive/current driver. Every declaration list matches static source parsing, with no duplicate selected explicit name. All final selected builds and required successful new dependency builds precede replay invocation. The selected modules are a dependency union, not independent targets.

The single Audit `MarkovAudit1792135685303789000MCE8` imports all 17 final modules, requests exactly 47 theorem names, and prints **47 rows / 47 unique closures**, with exact source/version/name correspondence to the axiom JSON and validation references. Every printed closure lists the permitted triple `{propext, Classical.choice, Quot.sound}`. No extra or missing name or disallowed axiom was found. The GeneralGap source appears in the Audit imports and source-hash map with an empty theorem-name list; its three definitions count for replay, not named theorem closures.

## Imported boundary and method limitations

The separate replay-method audit records exact driver/wrapper comparisons, explicit-name isolation, static import closure, target-free replay base and inherited source/object bindings. Driver, compilation/replay wrapper and axiom wrapper are unchanged after retagging from worker130; replay retains stack 131072 and the same joined-task propagation. The orchestration helper writes the final explicit 17-module list and invokes the unchanged wrapper with a 240-second limit. It introduces no alternate checking path.

The explicit guard requires collected `MathGKM.Markov.*MCE8` constants to be absent from the imported base and rejects unsafe/partial mathematical declarations. All 56 explicit selected names satisfy its scope. Generated/private/inherited constants outside that predicate retain ordinary Lean.Replay handling. Neither the wrapper nor this read-only audit freshly rebuilds inherited imports or measures the Lean executable, replay-library binary or every external loaded object. Checker hashing occurs after subprocess return rather than at invocation start.

The accepted mathematical union contains **2,315 local nodes = 17 new + 2,298 inherited**; adding the Audit gives **2,316**. Driver and external Lean/Mathlib source trees are separate. The final `MarkovResidualFullMCE8` closure contains **2,314 nodes = 16 new + 2,298 inherited**, with 46 new theorems and 8 definitions. It omits the separately accepted intermediate `MarkovResidualMCE8`; that module remains compiled, selected and printed. Its own overlapping closure has 2,305 nodes = 7 new + 2,298 inherited, with 17 new theorems and 4 definitions. These scopes are not disjoint groups to add together.

The replay base contains all **2,298 inherited nodes and none of the 17 selected modules**. Sixteen explicit inherited import roots plus implicit Init account for the reported 17 direct imports; this direct count is not the transitive base count. The inherited Lean path has 133 entries, with the worker130 evidence directory prefixed behind the current evidence directory. All 2,298 exact current source/object pairs independently match before131 and either sealed124/130 validation evidence (2,297 pairs) or exact before128 pins (one pair). The observation ran **07:39:22.052802–07:40:08.818591 UTC**. These pairs comprise all 2,292 inherited bindings sealed in worker130, five accepted worker130 modules and the additional `MarkovBinomialRatios6a40` pair. The five imported130 sources exclude its residual; neither of its two excluded probes is imported, rebuilt or selected. BinomialRatios uses `research/MarkovBinomialRatios6a40.lean` and `evidence/markov-6a40862b/MarkovBinomialRatios6a40.olean`. Preserved source/object association is not a fresh build.

All **212 historical compiled-but-unreplayed worker121 modules**, including the **195-module Half-certificate subset**, plus 19 previously accepted121 modules are in this base. None of the 212 appears as a current compiler or replay target: **zero backlog modules are recovered**. Historical unbuilt121 candidates are absent. None of worker128’s 26 accepted modules or pending Clustered draft is imported. Reconciliation, preservation and current selected-body replay do not backdate worker121 coverage, worker128’s timeout, or acceptance of old130 probes.

## Finalization and timing

The finalizer is unchanged after retagging except that its predecessor-manifest list becomes128+130. It binds selected current source hashes to successful build/replay receipts and source-matching axiom-name records, hashes retained objects, checks preservation and root/canonical-contract pins, writes an index, verifies its current hashes, and writes last-verification. Its explicit list happens to cover all archived mathematics; it does not independently require a precommitted module/theorem count or prove exhaustive coverage. It also does not enforce an expected checker hash, re-evaluate the permitted axiom sets or bind the axiom JSON to successful compiler output. Those actual retained comparisons pass independently in this audit. It writes validation before subsequent assertions, so a partial publication alone would not establish completed finalization. Stop-file status is observed rather than asserted absent, and the last verifier echoes earlier root/contract measurements rather than measuring proof completeness.

There is one direct finalizer invocation: event236 starts it and event239 records successful completion with 17 modules, 47 closures, 123 indexed artifacts, 5,756 prior inputs and 6 unsuccessful builds. There is no failed or incomplete finalizer receipt. The final checkpoint/operational writes are at event235. Events237–238 only reread the already-completed replay receipt while finalization is running. Event240 is the structured report and241 is `turn.completed`. All **114 started items** have completion records; no saved foreground invocation remains outstanding. The activity counter **446,437 bytes** equals the complete 241-event log plus zero-byte stderr, with no lag.

| Boundary (UTC, 2026-10-16) | Retained time |
|---|---|
| Controller start | 07:07:36.167402 |
| Last selected ResidualFull build finish estimate | 07:27:10.285514 |
| 47-closure Audit finish estimate | 07:28:25.627532 |
| Union replay finish estimate | 07:29:10.570963 |
| Final validation file mtime | 07:30:01.468593 |
| Final-check file mtime | 07:30:02.905624 |
| Manifest file mtime | 07:30:03.315036 |
| Last-verification file mtime | 07:30:03.600677 |
| Event-log file mtime | 07:30:28.939677 |
| Activity heartbeat time | 07:30:29.949999 |
| Structured final.json file mtime | 07:30:30.299409 |
| Controller finish | 07:31:40.043805 |
| Deadline | 07:37:36.167402 |

Build/replay filenames identify start times; finish estimates add retained durations rather than treating filenames as completion. Current file mtimes locate saved artifacts, not exact controller events; later archive-copy mtimes do not replace those times. Retained controller elapsed and subtraction of saved epoch fields both give **1443.8764028549194 seconds**. Controller finish precedes deadline by **356.123597 seconds**. Last verification precedes deadline by 452.566725 seconds and final.json by 425.867993 seconds. Host finish follows final.json by 69.744396 seconds; this bookkeeping interval is not extra proof work.

`final.json` SHA-256 is `2436d58f40a41011354a6d5cc1c5fb62b8cfc4abeacd1ee1e34cb86c929bc1d9`; its parsed value equals both event240 and the controller receipt report. Final manifest SHA-256 is `0662182cddc34088aea7170712dff8223f05fc5b76c194efb2363431f7b5317d`, matching last-verification. All project artifact mtimes precede deadline and controller finish. No unaccounted post-finalization or late exact-request file was found; last-verification is intentionally created after final-check/index. No separate late-evidence preservation or historical cutoff upgrade was needed.

All source/object/receipt/index/preservation comparisons performed by this audit agree. They support the recorded new-source validation over an inherited compiled boundary. They do not convert historical replay gaps, experiments or an exact residual equivalence into a proof of the full conjecture.

## Final independent stability

The final hash pass checked **8,869 retained inputs** from **2026-10-16 07:43:54.535909 to 07:45:04.623558 UTC** with zero changed bytes. The exact-request late-file observation at **07:45:04.650433 UTC** found no extra or missing current file and required no late-evidence preservation. These observation times do not backdate proof coverage. The separate method audit sealed its 108-input stability pass at **07:40:44.583098 UTC**, also without change. The mathematical supplement independently agrees on all 17 final source hashes, 47 theorem names and 9 definitions; its 24 named inherited comparison sources match our retained hashes. One comparison source, old `MarkovResidualMB9D`, lies outside the actual current imported base.

Sealed method note SHA-256: `224d6dc4dcbe5bcdfa30efe71bff05a4289cbb659456a51f7f611d0f3ae4861c`. Sealed method evidence SHA-256: `efddef35cd0b64021ab633117dbb0bdb092b69cdccf64084a743f06b7f4577a7`.
