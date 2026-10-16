# Worker 000125: retained replay method and import boundary

Request `ea4238fc86ab42dca04c21467d7fa66c`. This review used the completed worker125 archive, exact named current counterparts, and sealed predecessor evidence. It performed static parsing and hash comparisons only. No Lean, project checker, replay, proof experiment, finalizer, or project code was executed; no successor work was inspected. Source mathematics and the independent validation/hash audit are separate.

The retained records support **eight new mathematical modules, 53 explicit theorem closures and ten explicit definitions**, selected exactly once across seven successful replay unions. There is no new pending mathematical source or missing replay target. Worker121's historical 212-module replay backlog remains unrecovered. None of those modules is imported by this round's selected targets, selected for replay, or rebuilt here.

## Selected declarations and axiom inventory

| New module, suffix `MEA423` | Theorems | Definitions |
|---|---:|---:|
| `MarkovHorizontalSupport` | 7 | 3 |
| `MarkovHorizontalPair` | 6 | 2 |
| `MarkovHorizontalInterval` | 6 | 0 |
| `MarkovAtomicSupport` | 10 | 4 |
| `MarkovVerticalPair` | 6 | 1 |
| `MarkovVerticalInterval` | 6 | 0 |
| `MarkovResidualEndpoints` | 8 | 0 |
| `MarkovResidualLeading` | 4 | 0 |
| Total | 53 | 10 |

The first Audit imports five modules, requests 35 theorems, and is covered by four replay unions of sizes `[1,1,2,1]`; those modules contain all ten definitions. The second Audit imports `MarkovVerticalIntervalMEA423`, requests six theorems, and has one singleton replay. The third imports `MarkovResidualEndpointsMEA423` and `MarkovResidualLeadingMEA423`, requests twelve theorems, and has two singleton replays. The three groups are disjoint. Audit modules are respectively `MarkovAuditSelected1792125438378777000MEA423`, `MarkovAuditSelected1792125570108082000MEA423`, and `MarkovAuditSelected1792125931982765000MEA423`.

The successful replay targets equal the accepted validation set, final successful mathematical source set, and compiled inventory. The archive has twelve new Lean sources: eight mathematical modules, three Audits, and the operational driver. There are no inherited, definition-only, or import-only selected targets, no new compiled-only modules, and no new unbuilt mathematical drafts. Final source, build, and replay bindings agree, with no superseded successful version.

The 63 explicit mathematical declarations all lie in namespace `MathGKM.Markov` and end `MEA423`. Every receipt's explicit-name set matches its final selected sources. Reported isolation counts are `10,8,20,7,6,8,4`, exactly the corresponding source declaration counts. There are no duplicate selected explicit names, collisions with explicit names in imported bases, or selected forbidden-token flags. The three Audit outputs contain 53 rows and 53 distinct theorem names, exactly the selected theorem set; all report `{propext, Classical.choice, Quot.sound}`. The wrapper's count-and-allowed-set predicate alone does not check exact identity or uniqueness, which were checked independently here.

## Unchanged checker and wrappers

`research/ReplayIsolatedMEA423.lean` has SHA-256 `239de8f6041251722c4cbc99f3e697832733f526339f940a3aa56d6cd510a1b3`. It is exactly worker124's final isolated driver after `MF8` → `MEA423` substitution. All seven successful replay receipts record that hash. Removing the explicit guard and normalizing the entry name, comments, and whitespace still yields the original Wide replay body. The joined Lean task and stack setting `131072` are unchanged.

The driver reads target module-data parts, including available server/private parts; collects constants into a map; excludes directly named targets from its imported-module list; constructs the imported environment; applies the guard; and calls `env.replay newConstants`. Its guard checks collected names beginning `MathGKM.Markov.` and ending `MEA423`, rejecting ones already imported, unsafe, or partial. It does not apply that extra guard to every generated or inherited constant. Names outside the predicate retain ordinary `Lean.Replay` handling. Static source-import checks show every actual target batch is an antichain and every transitive imported base is target-free. Thus no observed selected source is admitted through its base.

The compiler/replay wrapper, axiom wrapper, and selected-module wrapper are byte-identical to worker124 after run identifiers and suffixes are retagged. Compiler invocations retain `-j1`; selected replay retains a 180-second limit and a three-thread pool. Explicit-name extraction recognizes top-level `theorem`, `def`, and `abbrev`, then asserts the suffix. The checker source hash is recorded **after subprocess return**, not measured before invocation. Static source/name/hash matches do not establish runtime imported-object identity or reconstruct private/generated binary constants.

The selected wrapper still assigns dependency levels using direct imports among the chosen modules, sorts each level, splits it into batches of at most eight, and submits all batches to the same pool without barriers between levels. Four invocations start before at least one new imported dependency's successful replay has finished. All matching new target/base compilations finish before each invocation, and all eight new modules eventually have successful replay receipts. This is selected-body coverage over compiled imports, not a sequential replay of the entire dependency graph.

The final `replay-plan.json` describes only the last two singleton batches: Endpoints at level zero and Leading at level one. It is overwritten per selected-wrapper invocation and is not an execution receipt. The finalizer retains worker124's `mode == 'replay'` filter, so this plan is not counted as a failed invocation. The finalizer itself is unchanged after retagging and updating the predecessor-manifest path.

The optional selected-wrapper fallback to worker121's compiled inventory is unused. The wrapper still preserves prior replay booleans during audit-result assignment without checking a previous source hash at that assignment. The finalizer restores replay flags for source-matching successful receipts that contain a checker-hash field, but does not compare that field with an expected checker hash itself. Independent comparisons establish the actual final source/name/hash coverage here; those booleans and field-presence predicates alone would be insufficient.

## Imported sources and preserved objects

The reconstructed local source graph has **74 nodes: eleven new mathematical/Audit modules and 63 inherited modules**. The two residual roots reach **71 nodes: all eight new mathematical modules plus all 63 inherited modules**, excluding the three Audits. `MarkovResidualLeadingMEA423` imports Endpoints, so the roots overlap. There are no unresolved local source imports or cycles. Mathlib and implicit Lean imports remain external library boundaries.

There is no worker125 `source-dependency-scope.json`; this is an independent static reconstruction. Every inherited node is one of worker124's sealed 2,172 inherited source/object bindings. For all 63 nodes, the source hash equals the prior sealed graph and the `before125` source pin, and the prior object hash equals the `before125` object pin. There are no missing or mismatched bindings. The evidence JSON contains every exact source/object path and hash under `inherited_object_bindings_from_prior124.entries`. Independent validation additionally hashed all 63 exact current source/object pairs at 04:51:36.016237–04:51:36.055994 UTC and confirmed those bindings. No newly accepted worker124 `MF8` module is imported; 2,109 other prior inherited entries are outside this round's graph. These are preserved source/object bindings, not a fresh source rebuild or runtime object measurement.

The intersections with worker121's 212 compiled-but-unreplayed modules, its 195-module subset, its previously accepted modules, and its 298 unbuilt modules are all empty in the successful replay bases. No old212 module appears in any compiler receipt or replay target. The broader tracked historical excluded/unbuilt set is also absent. The 212 remain a historical unrecovered backlog; describing them as this round's imported dependencies would be incorrect. Reconciliation and preservation do not change that status.

## Rejected versions, finalization, and cutoff

There are **19 numeric compiler receipts and 19 source snapshots: eleven successes (eight mathematical modules and three Audits) and eight return-code-1 errors**. There are no wall timeouts, interrupted compiler receipts, missing-outcome snapshots, failed replay receipts, or superseded successful builds. All eight rejected snapshots differ from their module's accepted final bytes. They represent seven distinct source hashes: `MarkovResidualLeadingMEA423` fails twice at the same obsolete hash `5b56e71f69f31025b02aad5077f9f60cd8dd7f51a9ab308f131912caddf8475f`, first because Endpoints has no available object and later on an `omega` goal. Its final accepted source hash is `0ee717ab31ca20b2e7d431eec491c38c1c0c9d92a1dd21d4bf14bea278823f6e`.

Static textual declaration-header comparisons between rejected and final sources find no changed binders or premises: the sole header-text difference is spacing around `<` in HorizontalPair's bound theorem. The later fixes are in proof text. This comparison is not elaboration or a proof reconstruction; the rejected outcomes remain attached to their exact snapshots. The other errors concern HorizontalPair once, HorizontalInterval twice, AtomicSupport once, VerticalInterval once, and ResidualEndpoints once.

All three direct finalizers—events187–188, 192–193, and 196–197—return code zero with complete **8 compiled / 8 validated / 53 closures**, no pending candidates, and zero replay failures. Their manifest sizes are 96, 96, and 97. The report draft is added at events194–195 before the last finalizer. There is no partial or failed finalizer status in this round. The final preservation predicate counts 5,388 prior inputs, excluding the run's setup script and own checkpoint from the 5,390-entry initial inventory, and preserves the predecessor's 483 indexed artifacts.

The three groups' last replay finishes are estimated at **04:38:01.862485**, **04:39:58.143589**, and **04:45:51.970558 UTC** on 2026-10-16. The last Audit finishes at 04:45:42.454744. Final-check is retained at 04:47:47.004372, manifest at 04:47:47.016448, and last-verification at 04:47:47.018647. `final.json` is retained at 04:47:59.988382 with SHA-256 `a73dd420c1a3ee9bdc04658e42e5d0dfa44867a8bfaeaba77430b5e50c74729b`. The controller completes at 04:48:24.589336, approximately 192.275 seconds before the nominal 04:51:36.864064 deadline, after about 1607.725 seconds.

The 199-event log contains `turn.completed`; its 769,170 bytes exactly match activity accounting, with zero stderr bytes. All seven exact current numeric replay receipts and checked finalization counterparts match the archive; no additional replay receipt is observed. The companion evidence records 134 exact static input hashes and a final byte-stability check. No late evidence is backdated, and no predecessor cutoff is upgraded. This review establishes the described retained local coverage, not independent binary verification, official-checker admission, a whole-source rebuild, or mathematical completion.
