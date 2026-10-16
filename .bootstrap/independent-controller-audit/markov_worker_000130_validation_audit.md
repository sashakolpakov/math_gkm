# Worker 000130 retained validation audit

Request `b9d0d3410a1644b6b35ab712bbfc87f7`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000130/artifacts`. This audit used static parsing and content hashes of completed retained records and exact named counterparts. It executed no Lean, proof, checker, replay, experiment, finalizer, or project program, changed no project file, inspected no active131 work, and did not contact the proposer. This is recorded-validation provenance, not a fresh proof check or independent completion audit.

The accepted inventory is **six mathematical modules, 21 named theorem closures and seven definitions**, all final-source compiled, selected together in one successful isolated replay, and covered by one exact named axiom audit. Two additional compiled probes are outside that accepted set. The controller outcome is **completed**, return code0, with matching structured final report and `completion: null`. Full Conjecture63 remains unresolved. Worker128 remains historically **timeout/null report**, and the worker121212-module replay backlog is not recovered.

## Accepted, compiled-only, and diagnostic inventories

| Accepted final module | Theorems | Definitions | Final build receipt |
|---|---:|---:|---|
| `MarkovStripGapMB9D` | 4 | 4 | `build-1792133335728842000` |
| `MarkovStripSourceMB9D` | 6 | 2 | `build-1792133896252894000` |
| `MarkovStripCoefficientsMB9D` | 4 | 0 | `build-1792134038906354000` |
| `MarkovStripLCMB9D` | 2 | 0 | `build-1792133612391708000` |
| `MarkovStripAllMB9D` | 4 | 0 | `build-1792134121537358000` |
| `MarkovResidualMB9D` | 1 | 1 | `build-1792134185705390000` |

`MarkovStripTwoProbeMB9D` is a **compiled-only mathematical probe** with one theorem and two definitions. Its successful source-bound build is `build-1792133443713443000`; source SHA-256 `a117bd073ecc46e5cd81642a64691c37ecba81ccecd020f8ac75bbaf1f84c1f2`, object SHA-256 `88ec7d9da8d74297aa04d9dc410b2405ff31ff58eb4e5d844816c5fc676cc6e3`. It is not selected, imported by accepted sources, axiom-printed, or included in validation. Its `source_strip_twoMB9D`, `stripQuadMB9D`, and `stripCubicMB9D` names duplicate names in the separate accepted StripSource module. These are disjoint module inventories; accepted output bearing a shared name does not confer replay/axiom coverage on this probe.

`MarkovProbeMB9D` is a separate **declaration-free diagnostic**: two imports and a `#check` command, with no new theorem or definition. Its source SHA-256 is `a1c696adc4b07dfc26f6404d8388f80998c1ed88096f29973cffb5ad19376a91`, object SHA-256 `ffe48468b1314adf554d1f36ff52f463fb1b15ec6c6f532a1055b12e663c5b82`. The same source first timed out and later compiled successfully in `build-1792133337109826000`. The diagnostic is outside accepted imports, replay and axiom inventory. Its successful type print is not a new theorem closure.

Accordingly there are **seven declaration-bearing mathematical sources** (six accepted plus the mathematical probe), or eight Markov-prefixed non-Audit sources if the declaration-free diagnostic is included. Across the seven,22 theorem headers and nine definition headers are textual occurrences, with only21 and seven distinct names because of the excluded probe duplicates. There is **one compiled-only mathematical module and no unbuilt final mathematical source**. The proposed slope extension remains prose/algebraic candidate work; no additional unbuilt Lean extension module is present. Ten final Lean files comprise those eight sources, one Audit, and the driver.

All accepted final source hashes match archive/current/controller/index, successful immutable build snapshot/receipt, replay map, axiom map and validation. All nine retained objects—six accepted, two probes, one Audit—match archive/current/controller/index; accepted objects additionally match validation object hashes. The mathematical probe has independent source/build/object bindings but no accepted-validation record. These retained associations do not independently reconstruct compilation or runtime loading.

There are **89 archive/controller artifacts, 87 indexed**. Manifest and last-verification are deliberately outside their own index and independently controller-bound. Breakdown:9 `.olean`,36 `.json`,31 `.lean`,8 `.py`,5 `.md`; the31 Lean files comprise ten final sources and21 build snapshots. There is no compiled-inventory file. This audit independently enumerated all final source/build receipts rather than equating the six-module validation list with the archive. Final-check has no pending fields; null pending-field comparisons in the JSON mean schema absence, with actual excluded inventory established separately.

## Compiler attempts, source versions and replay

Exactly **21 compiler receipts and21 matching immutable snapshots** are retained: **nine successes, seven return-code1 errors and five timeouts**. Successes comprise six final accepted sources, two final probes and one Audit. There is no superseded successful source, snapshot-only invocation, failed replay, or axiom-parser rejection. All22 compiler/replay receipts have exact saved event-summary bindings. Successful console output is intentionally suppressed; full captured output remains in receipts.

| Unsuccessful receipt | Module | Status | Final source bytes? | Snapshot SHA-256 |
|---|---|---|---|---|
| `build-1792133000874086000` | `MarkovStripGapMB9D` | timeout | no | `48b3a4c8a264d0fdb377f0739935d4b7b4c29681700b6443382c3bb9eccc6038` |
| `build-1792133049304989000` | `MarkovStripSourceMB9D` | timeout | no | `8deac4d059c37f67dc8f4f5c4669c4dccc6f7297296e404663b47481e84a8428` |
| `build-1792133181027584000` | `MarkovStripGapMB9D` | rc1 | no | `24d6ec295f65762cf4420b20e9db23e7e9538c84bb2eaea4f8a68c01f8d10ec5` |
| `build-1792133195780292000` | `MarkovProbeMB9D` | timeout | yes | `a1c696adc4b07dfc26f6404d8388f80998c1ed88096f29973cffb5ad19376a91` |
| `build-1792133240536440000` | `MarkovStripGapMB9D` | rc1 | no | `4545ef29f04e2e32d2d96d14d9970b18351cd43404b43407774373c1ced05f0f` |
| `build-1792133241736417000` | `MarkovStripSourceMB9D` | timeout | no | `b77fcdbcf482858090572868114594770b6fdf0833c832fe58d73dcb012caa3d` |
| `build-1792133416064029000` | `MarkovStripSourceMB9D` | timeout | no | `2e2625d6da98e1d39d1432d68ec92182f4d561466c1d147a0b40bdd41a41e40c` |
| `build-1792133582939933000` | `MarkovStripSourceMB9D` | rc1 | no | `c91b1b01a1cc912f6ae5f4c1d0174c443299e1358a402d3be8e185e1a3d971e2` |
| `build-1792133728576076000` | `MarkovStripSourceMB9D` | rc1 | no | `83421b77d5a2365e16ed729da4e0f0521d46e6af247f7cadd8fc692fd68e752e` |
| `build-1792133819668830000` | `MarkovStripSourceMB9D` | rc1 | no | `6dcf1ebb8e11f822f987d1ced24b0bb96a6814300f2fa676d4fccdd677839fbc` |
| `build-1792133968317978000` | `MarkovStripCoefficientsMB9D` | rc1 | no | `b9882c6c0e257a5d42c4262627b32ea26823b7fd61f756e0ab1921431f0918aa` |
| `build-1792134076735978000` | `MarkovStripAllMB9D` | rc1 | no | `0fddd16d24af9b48afa6a63d805b34c55c4ae78ee8e844fe2715e6bc082e8e79` |

The five timeouts are one Gap attempt (120.156495seconds), three Source attempts (120.169626,120.182114,150.262416seconds), and the declaration-free Probe (30.164672seconds). Only the Probe timeout uses its final source bytes; its later successful diagnostic build takes37.482636seconds. The other11 unsuccessful versions are superseded by different final source bytes. Timeout JSON records set `timeout:true` and omit returncode; a console null from `.get()` is not an observed compiler exit code. These records must not be described as12 source errors or as12 changed-source attempts.

Gap failures include large-expression timeout, unspaced `0≤stripGapMB9D` being parsed with an erroneous Graph/`tripGapMB9D` interpretation, and a recursion-depth error. The final accepted source fixes these elaboration problems. Whitespace-normalized source headers do not establish identical parsed theorem statements or proof-only repairs. Source initially had four theorem headers; the final six-theorem source adds `strip_quad_mapMB9D` and `strip_cubic_mapMB9D` after timeout/constant-polynomial/cast failures. Later Source failures retain the eventual names but fail map/cast proof elaboration. Coefficients and All have one older failed version each. Rejected elaborations and any error-generated placeholders are not accepted evidence. Full rejected snapshot hashes, headers and diagnostics are preserved in JSON.

One replay receipt, `replay-1792134213161847000.json`, selects the six accepted final modules exactly once. It reports **28 isolated explicit declarations =21 theorems +7 definitions**. Every explicit name matches the final source declaration inventory and ends `MB9D`; all selected final builds finish before replay begins. The final checker SHA-256 `d9c6c97830cf639c343b2b7225b1143cc507fb1dd7fd36dd3d64fabaa4ec8414` matches the receipt, archive and current source. This hash is recorded after subprocess return, not at invocation start or as a runtime binary measurement.

The single successful Audit imports those six final modules, requests21 names and prints exactly21 distinct theorem closures, all with `{propext, Classical.choice, Quot.sound}`. Audit source, final imported versions, output names/axiom sets, source-hashed axiom JSON and validation references agree. Neither probe is an Audit import. There is no duplicate selected name, missing closure, disallowed axiom, final-source prohibited token, or inferred probe coverage from the duplicated names. Definitions contribute to replay coverage but are not theorem closures.

## Import boundary and retained method

The separate method review finds the driver and validation/axiom wrappers unchanged from129 after retagging. The driver excludes all six targets together from the imported base; dependency-related selected modules need not form an antichain. The inherited explicit guard checks `MathGKM.Markov.*MB9D` names for pre-imported presence and unsafe/partial status; generated/private names outside that predicate retain ordinary Lean.Replay handling. Compilation uses-j1; replay uses stack131072 with the inherited joined-task behavior. No retry bypass or new driver method is introduced.

The accepted Residual closure is **2,298 local modules =6 new +2,292 inherited**. Adding the compiled-only mathematical probe gives2,299; adding the diagnostic and Audit gives the full2,301-node local graph. The driver and external Lean/Mathlib trees are separate. The successful replay base contains2,292 inherited modules and no selected target or probe. Its five explicit roots are `MarkovBottomCoefficientsMAA6`, `MarkovFibonacciLC6ade`, `MarkovHorizontalThirdSourceM13D`, `MarkovResidualMAA6`, and `MathGKM.Markov`; implicit Init gives the reported six direct imports. The inherited path has132 entries, with129’s evidence directory prefixed to its prior path behind the current output directory.

All **212 worker121 compiled-but-unreplayed modules**, including195 Half dependencies, and19 previously accepted121 modules remain in the inherited base. No old121 module is selected or rebuilt in130, so none of the212 is recovered. Old unbuilt121 candidates are absent. No accepted128 new module or pending Clustered128 draft is imported, selected or rebuilt. Worker128 timeout/null-report and its draft failures remain historical facts.

All2,292 inherited exact source/object pairs independently match the sealed129 bindings and before130 pins:2,284 previously inherited pairs plus all eight accepted129 modules. The current-byte observation ran07:21:21.153931–07:22:10.163139UTC with no mismatch. No new graph expansion or fallback old proof audit was needed. Byte preservation is not a new proof receipt, source rebuild, missing-replay repair, or runtime-load measurement. Neither wrapper nor this audit freshly rebuilds inherited objects or independently measures the Lean executable, replay-library binary, or every external imported object.

## Preservation, finalizer and deadline

The initial preservation snapshot has5,732 entries; its one own-request setup file is explicitly excluded by the request/suffix filter, leaving **5,731 preserved prior inputs**, including139 bytecode files. Even the excluded setup bytes still match. All retained initial/current hashes, six administrative inherited hashes, root and contract pins agree. Controller-before has a different selection policy; absence there is not treated as a conflicting hash.

Worker129’s77 indexed artifacts and full79 controller artifacts, and worker128’s218 indexed artifacts and full220 controller artifacts, match archive/current/before130. The combined295 in the report is77+218 indexed records, not the combined299 full artifacts. Their saved raw logs match reconciliation:129 has204 events, SHA-256 `0ad332587a7133ad557d1bc008bf1b8b32e0d42941486ecf264c3ab320ce5917`;128 has281 events, SHA-256 `33a4bebc8aad19653af64794e27896b7ef7007170bc0697995741820b7e7f91c`. Final-three-event sequences match. Preserving128’s completed pre-timeout finalizer does not change its controller outcome. The unchanged121 raw history remains separately retained with no current build/replay recovery.

Root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII-escaped canonical contract remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

Events38–39 copy/retag the wrappers. Initial prefix replacement leaves the old request-ID tail in the finalizer; events181–182 correct the full request ID and expand the rechecked-manifest list from128 alone to128+129 **before any finalizer invocation**. This is not a failed finalization, contract-serialization failure, or completed wrong-request receipt. Event208 writes the final checkpoint. The sole direct finalizer finishes at210, reporting6/21,87 indexed,5731 preserved and12 unsuccessful builds. Event212 reads saved last-verification/replay output;213 is the structured report and214 is turn.completed. All100 started items have completion records. The466,463-byte activity counter exactly covers the214-event log plus zero stderr; it is saved foreground accounting, not an independent system-process census.

The finalizer checks only its explicit six-module list. It binds final source hashes to successful build/replay and axiom-name records, hashes current objects, checks prior preservation/root/contract, writes an index and verifies its contents. The two probes are deliberately excluded from accepted validation but included as artifacts. It does not enforce expected checker identity, recompute permitted axioms from Audit output, independently bind that output to axiom JSON, precommit expected module/theorem counts, or reconstruct object provenance. This audit checked the actual associations separately. Validation is written before later preservation assertions; a validation file alone would not prove completed finalization. Last-verification echoes prior root/contract measurements; stop absence is recorded rather than asserted.

| Boundary, UTC2026-10-16 | Time |
|---|---|
| Controller start |06:39:20.427680|
| Final StripSource build finish estimate |06:58:41.501817|
| Final Coefficients build finish estimate |07:01:05.324156|
| Final StripAll build finish estimate |07:02:19.338622|
| Final Residual build finish estimate |07:03:24.457408|
|21-closure Audit finish estimate |07:04:07.554230|
| Final replay finish estimate |07:04:08.634516|
| Validation current-file mtime |07:04:51.454123|
| Final-check current-file mtime |07:04:53.271093|
| Manifest current-file mtime |07:04:53.449742|
| Last-verification current-file mtime |07:04:53.475907|
| Event-log mtime |07:05:40.683178|
| Activity heartbeat |07:05:41.289052|
| Structured final.json mtime |07:05:41.852602|
| Controller finish |07:06:25.974962|
| Deadline |07:09:20.427680|

Receipt filenames identify invocation starts; finish estimates add retained durations. File mtimes are not exact event timestamps. Retained elapsed and subtraction of controller epoch fields both give1625.5472819805145seconds. Finish is174.452718seconds before deadline; last-verification266.951773seconds before; final.json218.575078seconds before. The44.122360seconds after final.json before controller finish are host bookkeeping, not evidence of added proof work.

Final.json SHA-256 is `c168b45c011abee054778819e86c883970063e76c9b52fdfe7fed1ef66239cf4`; its parsed report exactly matches event213 and the receipt. Manifest SHA-256 is `cc619f77503517813fd3c93894de2348f2eae4cd6a48366ef5d05eee8d8ff203`, matching last-verification. All project artifact mtimes precede deadline and finish. Last-verification is intentionally later than index/final-check; no unaccounted post-finalization file or late exact-request evidence was found. No late-evidence preservation or historical upgrade is needed.

The retained validation supports the six selected modules over their compiled imported boundary. The probe exclusion, historical212 replay gap, finite candidate experiments and unproved exact residual remain explicit limitations. No new proof check, whole-source rebuild or protected-root completion is supplied by this audit.

## Final stability and companion method supports

All **8,743** hashed project/controller/archive inputs remained unchanged during the final pass **2026-10-16 07:24:24.050028–07:25:08.111846 UTC**. The exact-request late-file observation at **07:25:08.126745** found no extra or missing file. All **90** method static inputs remained unchanged at **07:24:36.007838 UTC**. Accepted and excluded new-source hashes/declaration inventories, plus the named inherited source hashes, also agree with the separate mathematical-source supplement. Future main-note review can use audit files alone.

- `markov_worker_000130_replay_method.md`: `31e519e72d657a5a39bc6c273f9de8dc00cb10145eb3eeb7d48d7d7cf3d122ca`.
- `markov_worker_000130_replay_method_evidence.json`: `f5ac1c78ee8d5cd5bd631fe2cbde5f186443ab3acd55c8704606d8c5ba0cc014`.
