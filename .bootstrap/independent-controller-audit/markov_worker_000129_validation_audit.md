# Worker 000129 retained validation audit

Archive-first audit of request `aa6c518b255a4137a1bdbca51a6e9434`, completed worker `/Users/sasha/math_gkm/.control/markov/workers/000129`. Only retained records, static source text, and content hashes were inspected. No Lean, proof, checker, replay, experiment, finalizer, or other project program was executed; no project files were edited and no active worker130 was inspected. This is a provenance audit of recorded validation, not a fresh mathematical check or independent completion audit.

The final inventory agrees: **8 mathematical modules, 27 named theorem closures, 4 definitions**, all final sources with successful compilation, one isolated replay union, and a successful axiom audit. No mathematical module is compiled-only or unbuilt in this worker archive. The controller outcome is **completed**, return code0, with a structured report and `completion: null`. Full Conjecture63 remains unresolved. Historical worker128 remains **timeout / null report**; reconciliation does not change that outcome.

## Inventory and bindings

| Final mathematical module | Theorems | Definitions | Successful final-source build receipt suffix |
|---|---:|---:|---|
| `MarkovVertexStatMAA6` | 5 | 0 | `build-1792131798386516000` |
| `MarkovVertexCoefficientsMAA6` | 4 | 0 | `build-1792131909169189000` |
| `MarkovVertexLCMAA6` | 2 | 0 | `build-1792131968204710000` |
| `MarkovBottomGapMAA6` | 5 | 3 | `build-1792131969737705000` |
| `MarkovBottomPositiveMAA6` | 1 | 0 | `build-1792132190099089000` |
| `MarkovBottomCoefficientsMAA6` | 5 | 0 | `build-1792132188914964000` |
| `MarkovBottomLCMAA6` | 4 | 0 | `build-1792132349776958000` |
| `MarkovResidualMAA6` | 1 | 1 | `build-1792132408397228000` |

All final source hashes agree among archive, current exact-named source, controller changes, index, successful build snapshot/receipt, replay source map, axiom source map, and validation entries. All nine retained compiled objects (eight mathematical modules and one Audit) agree among archive/current/controller/index; the eight validation object hashes also agree. Exact hashes and declaration names are retained in the accompanying JSON. An object/source association is supported by these retained records; hashing is not an independent source-to-object reconstruction.

There are **79 archived/controller artifacts**, of which **77 are indexed**. The two deliberate nonindexed files are `manifest.json` and `last-verification.json`, both independently controller/archive/current bound. The artifact breakdown is9 `.olean`,31 `.json`,26 `.lean`,8 `.py`,5 `.md`. Ten final Lean sources comprise eight mathematics, one Audit, and one replay driver; sixteen additional Lean files are immutable build snapshots. There is no compiled-inventory file; this audit independently enumerated final sources and all successful final-source build receipts and found precisely the eight accepted modules. The final-check schema has no pending fields; JSON nulls for pending-field comparison mean schema absence, not a failed pending check. Independent enumeration finds zero pending modules.

All **5,706** entries of the worker-local initial preservation snapshot still match their exact current bytes. No entry was excluded under this worker’s request/suffix filter. This includes137 `.pyc` records. The controller before snapshot has a narrower file-selection policy; absent entries are separately listed and are not treated as hash conflicts. The six inherited administrative inputs also match their retained hashes. Worker128’s218-entry manifest and all220 controller artifacts independently agree with its archive, current files, and before129 pins. The retained128 raw log has281 events and SHA-256 `33a4bebc8aad19653af64794e27896b7ef7007170bc0697995741820b7e7f91c`; reconciliation reproduces its final three events exactly. It preserves the excluded Clustered draft and two compiler timeouts without promoting them to accepted validation.

Root source SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract SHA-256 remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII-escaped canonical contract digest is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request.

## Compilation, versions, replay, and printed closures

The archive retains **16 compiler receipts with16 matching snapshots:10 successful and6 return-code1 failures**. The10 successes comprise eight final mathematical sources, one earlier successful BottomLC version, and one Audit. There are no compiler timeouts, snapshot-only invocations, failed replays, or axiom-parser rejections. All17 compiler/replay receipts bind to exact saved controller output summaries, including the intentional suppression of successful stdout in console summaries; full output remains in each receipt.

All six failed snapshots differ from their accepted final source bytes:

| Failed build suffix | Module | Snapshot SHA-256 |
|---|---|---|
| `build-1792131673523770000` | `MarkovVertexStatMAA6` | `1e303d3e308313cef56feba388d00c4f11a9d7e69fa53b45f69d014a977ee4a0` |
| `build-1792131735996654000` | `MarkovVertexStatMAA6` | `548920a5884ebeb8629099352c4a6801a8ef236c9511629cd764c150d5e88e0f` |
| `build-1792131866312703000` | `MarkovVertexCoefficientsMAA6` | `89ab68e9d97e03bf9ae8c32d25bf957a8e5d00d84a816cb3f61351efd863a47f` |
| `build-1792132094683658000` | `MarkovBottomCoefficientsMAA6` | `83ef7114c3e5d407a784969aa494ea08e576446997ced8089d4f5fd8a54ea9dc` |
| `build-1792132096020673000` | `MarkovBottomPositiveMAA6` | `77b0598e7297006be120c7cdf9edeb031d6f22058c98c39f5baf482314591380` |
| `build-1792132232588372000` | `MarkovBottomLCMAA6` | `1751b4e6bab5adc955220e300a70ab2729b2db85d707f4bedb03fb71fc3fb475` |

The first VertexStat failure has four theorem headers; the accepted version adds `last_eqMAA6` and repairs the last-bit/count bridge. The second VertexStat and the VertexCoefficients, BottomCoefficients, and BottomPositive rejected versions retain their eventual theorem names but have failed proof bodies. The BottomLC rejected snapshot has three theorem headers and errors in scalar cancellation/inequality parsing. These failed elaborations, including any diagnostic error placeholders, are not accepted evidence.

The successful superseded `build-1792132281279598000` has source SHA-256 `666e16a797afa99ec4066a0308002380692505815e8a3867eade1b747f2aa091`, three theorems, and ends at an estimated06:31:32.485270UTC. Its theorem `source_bottom_verticalMAA6` assumes denominator at least5. The final source adds `source_bottom_allMAA6`, handling smaller denominators through inherited theorems, and successfully compiles in `build-1792132349776958000`, ending06:33:13.686979. Both final replay and final Audit use this later four-theorem source SHA-256 `42530c2b7b1da006b00b35601f686cb301717fc18c23aebdd7fc1a7a846c5d2c`. The earlier successful same-name object is not separately retained in the completed archive; no claim is made about global cache absence.

One replay receipt, `replay-1792132424798359000.json`, selects all eight accepted modules exactly once, at their final hashes. It reports31 isolated explicit mathematical constants:27 theorems plus4 definitions. The driver hash recorded after subprocess return is `01f9d6250f83ce5c3f4abc60b71b51e3a1500ccb8fb39d43e353009ef907373b`, matching the archived/current driver. Every final declaration list matches static source parsing; all corresponding final builds precede the replay invocation. The selected modules are a dependency union, not mutually independent targets.

The single successful Audit imports all eight final modules, requests27 names, prints27 distinct closures, and has exact source/version/name correspondence to the axiom JSON. Twenty-four closures list `{propext, Classical.choice, Quot.sound}`; `adj_scanMAA6` and `adj_appendMAA6` list only `propext`; `last_eqMAA6` explicitly lists no axioms. The retained parser handles that empty-axiom line. No unexpected or missing theorem names or disallowed axioms were found. Definitions belong to replay coverage; they are not counted as named theorem closures.

## Imported boundary and method limitations

The separate replay-method audit records exact driver/wrapper diffs, static import closure, target-free replay base, and inherited source/object bindings. The driver and validation/axiom wrappers are retagged versions of worker128. The explicit-name isolation check requires this round’s `MathGKM.Markov` names ending `MAA6` to be absent from the imported environment and rejects unsafe/partial mathematical declarations. Compiler-generated/private declarations retain ordinary Lean replay handling; the explicit check does not assert absence for every generated name. Neither the wrapper nor this read-only audit freshly rebuilds inherited imports or measures the Lean executable, replay-library binary, or every dynamically loaded external library object. Checker hashing happens after subprocess return, not as an invocation-start measurement.

No worker121 module appears as a build or replay target in worker129. The212 historical compiled-but-unreplayed modules, including195 Half certificate dependencies, therefore remain unrecovered in worker129. Unlike worker128’s accepted graph, the new root/BottomLC chain reaches these inherited modules through the old ThirdAll/Residual boundary. Reconciliation and source/object preservation are not replay recovery; neither worker121 nor worker128 history is backdated. The exact root closure is2,292 local modules =8 new +2,284 inherited; adding the Audit gives2,293. The single replay base has2,284 inherited nodes and no selected new target. Nine explicit import roots plus implicit Init account for the reported10 direct imports, not the full transitive base. All212 old121 modules, their195-module subset, and19 previously accepted121 modules are in this base; historical unbuilt121 candidates are absent. None of worker128’s26 accepted mathematical modules or its pending Clustered draft occurs in the current base. The inherited Lean path has131 entries and prefixes the worker128 evidence directory. All2,284 exact current source/object pairs independently match before129 pins and either sealed124/128 bindings (2,266 pairs) or before128 pins (18 pairs); the observation ran06:54:32.838089–06:55:35.285340UTC. There is no mismatch and no new proof validation of those inherited pairs.

## Finalization and timing

The finalizer is copied/retagged from128 with the explicit rechecked-manifest list changed to128 alone. It binds selected source hashes to successful build/replay receipts and axiom-name records, hashes retained objects, checks initial preservation and root/canonical-contract pins, writes an index, verifies its current hashes, and writes the last-verification receipt. Its scope is the explicit mathematical module list. It does not enforce a precommitted module/theorem count, independently rebuild objects, revalidate the permitted axiom sets from Audit output, or require the replay checker hash. This audit independently checked those actual retained bindings. It writes validation before later preservation assertions, so a partial publication would not alone establish completed finalization. There is no rejected finalizer in this round. Stop-file status is observed rather than asserted absent. The last verifier echoes earlier root/contract measurements and has no independent expected-count or proof-completeness assertion.

Events188–189 create the finalizer. Direct executions finish successfully at events194 and198, both reporting8 modules,27 closures,77 indexed artifacts,5706 prior inputs, and6 unsuccessful builds. Event196 appends the checkpoint between executions; the second execution refreshes its hash. Events200 and202 only read/check retained output. Event203 is the structured final report and204 is `turn.completed`. All96 started items have completion records; there is no outstanding saved foreground invocation. The activity counter552,768 exactly equals the full204-event log plus zero-byte stderr, with no lag.

| Boundary (UTC, 2026-10-16) | Retained time |
|---|---|
| Controller start |06:12:32.500791|
| Final BottomLC build finish estimate |06:33:13.686979|
| Final Residual build finish estimate |06:33:43.404403|
|27-closure Audit finish estimate |06:33:58.760815|
| Final replay finish estimate |06:34:01.346199|
| Final validation file mtime |06:37:35.639952|
| Final-check file mtime |06:37:36.557163|
| Manifest file mtime |06:37:36.704283|
| Last-verification file mtime |06:37:36.715890|
| Event-log file mtime |06:37:57.246123|
| Activity heartbeat time |06:37:58.054376|
| Structured final.json file mtime |06:37:58.163135|
| Controller finish |06:38:35.211283|
| Deadline |06:42:32.500791|

Build/replay filenames identify start times; finish estimates add the retained duration, rather than treating filename timestamps as completion. File mtimes locate saved artifacts, not exact controller-event times. Retained controller elapsed is1562.7104938030243seconds; subtracting displayed epoch fields gives1562.7104918956757seconds (about1.9microseconds different). Controller finish is237.289508seconds before deadline. Last verification precedes deadline by295.784901seconds, and final.json precedes it by274.337656seconds. Host finish follows the final.json mtime by37.048148seconds; that bookkeeping interval is not extra proof work.

`final.json` SHA-256 is `d991f9f1234b4dea57404c7612fee94d38afbecaf0b7e4ed85cda38e1b11f593`; its parsed value exactly matches event203 and the controller receipt report. Final manifest SHA-256 is `bf92996c2c6f456473c486076d52261ce849392874ccbf92f79265fece87cbb0`, agreeing with last-verification. All recorded project artifact mtimes precede deadline and controller finish. No unaccounted post-finalization or late exact-request file was found; last-verification is intentionally written after final-check/index. No separate late-evidence preservation or historical cutoff upgrade was needed.

All validation/source/object/receipt/index/preservation comparisons performed by this audit agree. These results support the recorded new-source validation over an inherited compiled boundary. They do not turn imported historical replay gaps, finite experiments, or an exact residual equivalence into a proof of the full conjecture.

## Final stability and companion method supports

All **8,561** hashed project/controller/archive inputs remained unchanged during the final pass **2026-10-16 06:56:18.666878–06:57:06.118207 UTC**. The scoped exact-request late-file observation at **06:57:06.137042** found no extra or missing file. The method review independently found all **96** static inputs unchanged at **06:56:53.131993 UTC**. New-source hashes, declaration inventories and named inherited source hashes also agree with the separately prepared mathematical-source supplement. No further project reads are required for the main-note cross-review.

- `markov_worker_000129_replay_method.md`: `04b532fe0725b3ecd3a1138195afe52e39a141fc38f898b6f30dcb8c85e0129d`.
- `markov_worker_000129_replay_method_evidence.json`: `c417c9f24c3b9a4d89ff3a7cec1f203049dc63d2bf26be6a1e198b696a961eeb`.
