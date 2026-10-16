# Worker 000122 static replay-method audit

Request `9fc35bc50ae14db198b964755648474b`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000122/artifacts`. This review follows worker121, using saved sources, receipts, controller records, and exact current request counterparts. It executes no project code, Lean, proof checker, replay, experiment, or finalizer and reads no successor work. Earlier archive copy-on-write cloning does not alter the content-hash basis of the inherited source graph.

The retained final evidence supports successful selected-body replay of 109 new mathematical modules, containing 259 explicit theorems and 121 definitions, with a new guard against pre-imported explicit new declarations. Twelve successful receipts carrying the final checker hash cover all 109 modules. This strengthens the explicit-name isolation check, while retaining compiled-import and generated-constant trust boundaries.

It does **not** recover worker121's unreplayed backlog. All 212 of worker121's compiled-but-unreplayed modules, including its 195 imported dependencies, occur in worker122's successful source bases. None is selected or rebuilt by a worker122 receipt. They remain compiled inherited dependencies. The new 109-module coverage must be kept separate from that historical state.

## Exact checker change and rejected batch

`ReplayIsolatedM9FC.lean` keeps Wide's module-data collection, target exclusion from direct imports, imported environment construction, `env.replay newConstants`, region cleanup, joined task wrapper, and stack setting `-s 131072`. Removing the added guard block and renaming `replayIsolatedM9FC` back to `replayBatchMCFC` makes its comment/whitespace-normalized body identical to Wide. No replacement of the kernel replay call was found.

The added block iterates the collected constant map before `env.replay`. Initially it checked every name beginning `MathGKM.Markov.` and rejected names already present in the imported environment, as well as unsafe/partial constants. The ten-module receipt `replay-1792120431794130000.json` returns1 before the replay call with:

> selected mathematical constant already imported: MathGKM.Markov.sSep4I14b02MAE2.eq_1

The diagnostic names an equation constant associated with an inherited MAE2 definition, outside the new explicit M9FC declaration set. Static source declarations do not enumerate such generated equation entries; the retained diagnostic is the evidence for this binary-level collision. The rejected batch contains 40 explicit new theorems, whose source hashes still match their final accepted versions.

Controller events173–174 narrow the added guard to names that both begin `MathGKM.Markov.` and **end** `M9FC`. It still rejects a matching name already imported and a matching unsafe/partial constant. It does not remove other entries from `newConstants`, alter `env.replay`, or require all generated/inherited equation constants to be absent. Those other constants retain ordinary Lean.Replay handling. The final driver's introductory comment should therefore be read with this explicit-name scope, not as a proof that every serialized new-module/generated constant is absent from the base.

The revised validator extracts lines matching explicit `theorem`, `def`, or `abbrev` declarations, asserts that their names end in `M9FC`, and records them in replay receipts. In this actual selected source set, every explicit declaration is a theorem or definition in the sole namespace `MathGKM.Markov`; the recorded names match the independently parsed declarations exactly. There are no selected duplicate explicit names, source/base explicit-name collisions, or selected `sorry`, `admit`, `axiom`, `native_decide`, `unsafe`, or `partial` tokens after comment removal.

The final checker SHA-256 is `349ea3cfd3741cac4bbfad68c00a841e1f136ebe36760052cacb0d3d659fb356`. All twelve final hash-bearing receipts match it. Each reported isolation count equals the receipt's explicit declaration count. Together they have 392 declaration occurrences and 380 distinct declarations: 259 theorems and 121 definitions. The twelve extra occurrences come from repeating the final three-module source/residual group.

The validator computes `checker_sha256` **after** the subprocess returns. This is a retained post-run source hash, not a before-start execution identity measurement or a hash of the imported object bytes actually read. The guard operates on collected binary constants, while this audit binds source declarations, receipts, final checker text, and static source imports. Generated/private constants, map-key overwrites, and binary/source correspondence retain the established qualifications.

## Selected modules, printed closures, and unbuilt sources

The archive contains 306 new Lean files: 302 mathematical sources, three generated Audit sources, and the operational replay driver. The mathematical partition is 109 accepted modules and 193 unbuilt sources, with no compiled-only new module left outside successful replay. All selected final source hashes match their retained compiler/replay/validation bindings. There are no superseded successful compiler versions.

| Selected family | Modules | Theorems | Definitions |
|---|---:|---:|---:|
| New midhigh chart parts | 45 | 45 | 0 |
| `high_1_4` parts0/10/11/12 | 4 | 4 | 0 |
| Separator helpers for charts4/6/8 | 52 | 192 | 120 |
| Three midhigh chart assemblies | 3 | 3 | 0 |
| Remainder, HighCover, ThirdBounds, ThirdSource, ResidualThird | 5 | 15 | 1 |
| Total | 109 | 259 | 121 |

Four selected modules are definition-only: `MarkovThirdSep6I14M9FCDefs`, `Sep6I9M9FCDefs`, `Sep8I14M9FCDefs`, and `Sep8I9M9FCDefs`, each with 30 definitions. They are explicit replay targets and are covered by the isolation-name checks, but contribute no named theorem print. There are no import-only selected modules or newly selected inherited MAE2 modules.

Three successful Audit compilations import 1, 95, and 109 modules and print 2, 213, and 259 theorem closures, respectively. Their source requests and retained output names match exactly. The combined 474 print rows cover 259 distinct selected theorem names; 239 use `{propext, Classical.choice, Quot.sound}` and twenty use `{propext, Quot.sound}`. The final 109-module Audit covers the full accepted theorem set. Definitions are not extra printed theorem closures.

The 193 unbuilt mathematical sources contain 443 theorem declarations and 300 definitions as unaccepted text. Four have interrupted compiler attempts on unchanged final bytes; the other 189 have no retained attempt. None has an archived object or appears in a successful source base. All 306 new Lean files, including the operational driver and helper filenames, are included in the manifest.

## Replay receipt partition and dependency chronology

There are 23 replay receipts: 22 successful and one return1 rejection. There are no replay timeouts or return −2 replay receipts. The successful receipts contain 198 target occurrences for 109 distinct modules. Eleven early receipts have no checker-hash field: ten succeed and the ten-module batch above fails. Those early invocations span checker development and do not individually identify the final checker revision.

The twelve later hash-bearing receipts all succeed. They comprise the final 109-module run in ten chunks of ten and one chunk of nine, plus a separate successful three-module ThirdBounds/ThirdSource/ResidualThird replay. Thus they cover 112 target occurrences and 109 distinct modules. Every new compiled module is selected under the final recorded checker hash, including the ten formerly rejected targets. The accepted scope does not rely solely on earlier un-hashed successes or boolean restoration.

The independently parsed source bases are transitively target-free for all receipts, including the rejected one. Explicit selected declarations do not collide with explicit declarations in those bases. The rejected generated equation collision is precisely a case that these source-name checks alone cannot detect. Source import resolution has no unresolved local names or detected cycles.

Final hash-bearing union base sizes, in receipt order, are 195, 195, 195, 195, 197, 204, 204, 1,890, 235, 206, 240, and 1,884 local nodes. Their direct roots plus implicit `Init` are 2, 2, 2, 3, 3, 9, 10, 13, 23, 12, 36, and 37. Exact target/base lists and declaration counts are in the evidence JSON.

All new target and new base modules have a matching successful build before their successful replay invocation. Replay scheduling is concurrent, however: some dependent chunks start while new imported dependencies' own replay is still running. The separate three-module source replay returns at approximately 03:18:57.820889 UTC; its repeat in the final nine-module chunk returns at 03:20:21.481976. The last of all final selected-body passes returns at 03:20:25.122015. By that point all 109 new selected bodies have passed, but this remains per-selected-body replay over compiled imports, not topological replay of every dependency or a fresh source rebuild.

## Worker121 backlog remains inherited

The full parsed local graph has 2,094 nodes: 305 new mathematical/Audit source nodes and 1,789 inherited nodes. The new operational driver is reviewed separately, not counted as a mathematical import-graph node. Inherited source nodes are reused only at hashes matching worker122 `before.json`.

Successful source bases contain 214 worker121 modules: all 212 compiled-unreplayed modules plus the previously replayed `MarkovThirdLowBoundsMAE2` and `MarkovThirdHalfBoundsMAE2`. All 195 compiled-only dependencies that were already central to worker121's Half result remain inside that 212-module set. Worker122 additionally imports the other seventeen compiled-only modules—fifteen midhigh_0_4 parts and two separator definition modules. None of the 212 receives a worker122 compiler receipt or appears in any worker122 replay target list. None of worker121's 298 unbuilt sources is imported.

`source-dependency-scope.json` is consistent with the ResidualThird source closure: 1,893 local nodes, including 104 of the 109 selected new modules, all 1,789 inherited nodes, and exactly the 214 MAE2 modules above. The five selected modules outside this rooted closure are the four new `high_1_4` parts0/10/11/12 and HighCover. The saved scope's 104 is a reachable subset, not a conflicting accepted-module count.

The selected-wrapper code has an optional path for reusing old compiler inventory entries, but the retained selections exercise no MAE2 recovery. Its default `--all` selects the current new compiler inventory. Moreover, the final validator's explicit-name suffix assertion is specific to M9FC. The availability of old-object metadata in a helper is not evidence of successful old-module replay. Worker121's 212-module backlog and its earlier 195-module import boundary remain historically unchanged.

## Wrappers, finalization, failures, and cutoff

The audit wrapper remains worker121's code after tag substitution. It checks Audit return code, line count, and permitted axiom sets, then records replay booleans; exact theorem-name binding is independently checked here. The selected wrapper generates an Audit for chosen inventory modules, asserts the audit predicate, then runs chunks of at most ten with four foreground worker threads and 180-second replay limits. It preserves old replay booleans in incremental validation entries without a source-hash guard at that assignment. Actual final source/object and successful-receipt bindings agree here, so the final result does not rest on that potentially stale boolean behavior.

The validator retains compiler `-j 1` and the explicit Lean binary; the substantive changes are the new checker, declaration-suffix assertion, declaration inventory, and post-run checker hash. The inherited Lean path is worker121's evidence directory followed by its existing path, with worker122's own directory prepended. The older Batch/Known/Wide source hashes are unchanged. Reused imported objects remain a trust boundary.

The finalizer restores true replay flags from successful source-matching receipts having a `checker_sha256` field. It checks the field's presence, not equality to an expected checker hash; this audit independently confirms every final relevant hash equals the final checker source. It checks validation source/object hashes, initial preservation, worker121's manifest, root/contract pins, and the selected accepted subset, and reports pending compiled/unbuilt sources separately. It does not impose an all-candidates-built predicate. The observed final compiled-pending list is empty; 193 unbuilt candidates remain explicitly reported. The only direct finalizer execution is event213; event152 merely edits finalizer source. The finalizer writes and rehashes its 702-entry manifest and last-verification file, retaining empty failure lists. The controller binds 704 artifacts including those two excluded index/verification files.

There are 118 compiler receipts and 118 matching source snapshots: 112 successes (109 mathematical modules plus three Audits), four return −2 interruptions, and two return1 errors. There are no snapshot-only outcomes or compiler wall timeouts. The four interrupted `high_1_4` parts13/15/16/17 remain unbuilt on unchanged final bytes. The rejected Remainder snapshot is superseded by its successful final source. The ThirdBounds return1 uses unchanged final source but precedes compilation of required `MarkovThirdAllmidhigh_2_1M9FC`; the same source later builds successfully. The six unsuccessful compiler receipts and rejected replay remain separately retained; no rejected attempt is upgraded.

The initial own-tag preservation exclusions are the checkpoint and setup script, leaving 4,664 prior inputs. The worker verifies 1,353 entries in worker121's manifest; the parallel validation audit also confirms preservation of all 1,355 archived worker121 artifacts. Source preservation is not replay recovery.

Worker122 starts at 02:52:26.741355 UTC with nominal deadline 03:22:26.741355. The last project write, last-verification, has mtime 03:21:19.338253. Final report/turn-completed are events214/215, and final.json has mtime 03:21:53.560641. All of that retained work precedes the nominal deadline. Host completion is 03:22:32.981062, approximately 6.240 seconds after it, with outcome `completed` and elapsed approximately 1,806.240 seconds. Host completion latency must not be confused with a post-deadline proof receipt. The 961,200-byte event stream is fully accounted for by the activity counter, with no stderr or counter lag. Exact current replay counterparts match all 23 archived receipts; no extra receipt was observed.

The strongest supported method claim is successful replay of the 109 selected new bodies with absence/unsafe/partial checks for their explicit M9FC declarations and exact named theorem-axiom coverage, over reused compiled imports. Generated equation constants outside the guard retain ordinary Lean.Replay duplicate/import handling; source/object identity, generated/private declaration identity, and imported binary contents are not independently reconstructed here. No whole-source rebuild, official-checker admission, recovery of the old 212-module backlog, or mathematical/English completion follows.

Exact driver and wrapper comparisons, checker/name/count bindings, receipt partitions, source graph, inherited backlog membership, failures, cutoff metadata, and stable input hashes are saved in `markov_worker_000122_replay_method_evidence.json`. The supporting script `audit_worker122_method.py` performs only static parsing and hashing.
