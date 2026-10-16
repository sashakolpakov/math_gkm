# Worker 000123 static replay-method audit

Request `762ebbaeac124186a32c169420cce484`; archive `/Users/sasha/math_gkm/.control/markov/workers/000123/artifacts`. This review follows worker122 and reads retained source, wrapper, receipt, and controller records plus exact current request counterparts. It executes no project code, Lean, checker, replay, experiment, or finalizer and reads no successor work. Consolidation of older archives/objects is treated by content hashes; copy-on-write inode or ctime changes do not alter historical proof status.

The retained evidence supports 263 new mathematical modules selected exactly once across 37 successful replay unions, with 401 explicit theorem closures and 314 definitions. All use the worker122 explicit-name isolation guard, retagged to M762. The round's own compiled and pending inventories are complete: no new mathematical source is left unbuilt or without successful replay.

The older trust boundary remains: **all 212 compiled-but-unreplayed worker121 modules are imported, and none is selected or rebuilt by worker123**. This includes the 195 dependencies previously identified in worker121's Half proof. The new source/object dependency inventory confirms their preserved presence; it does not replay them. The new 263-module result must not be counted as recovery of that backlog.

## Driver and explicit-name checks

`ReplayIsolatedM762.lean` is byte-for-byte worker122's final isolated driver after substituting `M762` for `M9FC`. Its SHA-256 is `4a2d39938966fec59ad8f639412db08d6d2fe3b11a92be0ab80d0e45d8895d91`. All 37 replay receipts carry exactly that hash. The driver still collects module-data constants, excludes current target modules from direct imports, constructs the imported environment, checks the explicit-name guard, calls `env.replay newConstants`, and joins the existing Lean task. Stack `-s 131072` is unchanged. Removing the guard and normalizing the entry-function name still yields Wide's original replay body after comment/whitespace normalization.

The guard rejects a collected constant already present in the imported environment, or marked unsafe/partial, when its name starts `MathGKM.Markov.` and ends `M762`. The validator records explicit theorem/definition/abbreviation names and asserts their M762 suffix. In the actual selected source set, all declarations are theorems or definitions in the sole namespace `MathGKM.Markov`. Receipt names match the independent source parse exactly. Every printed isolation count equals the corresponding explicit declaration count; across disjoint selections there are 715 distinct declarations, comprising 401 theorems and 314 definitions.

This retains worker122's scope restriction. Generated or inherited constants outside the prefix/suffix predicate are still passed to ordinary Lean.Replay, whose duplicate/import handling remains in effect. The driver does not establish that every serialized generated constant is absent from the imported environment. The selected source set has no duplicate explicit names or explicit selected/base name collisions, and no selected `sorry`, `admit`, `axiom`, `native_decide`, `unsafe`, or `partial` tokens after comment removal. These source checks do not reconstruct private/generated binary constants or map-key overwrites.

`checker_sha256` is computed after the subprocess returns. It is a retained post-run source hash, not a before-start measurement or a hash of the imported objects actually read at runtime. The source/object/receipt bindings agree in this record, while invocation-time binary identity remains outside this static review. There is no checker rejection or replay failure this round; worker122's generated-equation rejection is not reclassified or erased.

## Selection and closure partitions

The archive contains 269 new Lean files: 263 mathematical sources, five generated Audit sources, and the operational driver. Every new mathematical module has a successful final-source compiler receipt, successful replay selection, and matching final validation entry. There are no compiled-only, unbuilt, inherited-selected, or import-only targets and no superseded successful source versions.

The five Audit/selection groups are disjoint and cover all targets:

| Audit group in retained order | Modules | Theorems printed | Definitions | Replay unions | Last replay return, UTC 2026-10-16 |
|---|---:|---:|---:|---:|---|
| First | 125 | 227 | 312 | 17 | 03:42:13.535648 |
| Second | 93 | 103 | 1 | 13 | 03:45:35.713549 |
| Third | 35 | 35 | 0 | 4 | 03:46:44.661453 |
| Fourth | 8 | 32 | 0 | 1 | 03:47:42.290985 |
| Fifth | 2 | 4 | 1 | 2 | 03:48:57.020694 |
| Total | 263 | 401 | 314 | 37 | |

Four selected modules are definition-only: `MarkovThirdSep11I14M762Defs`, `Sep11I9M762Defs`, `Sep12I14M762Defs`, and `Sep12I9M762Defs`, each with 30 definitions. Their constants are selected for replay and checked by the explicit-name guard, but they add no named theorem print. The remaining 194 definitions occur alongside theorems in other selected modules.

All five Audit compilations succeed. Their imports, requested `#print axioms` names, and retained output names agree exactly with the corresponding source declarations. The 401 rows cover 401 distinct names, without missing, duplicate, extra, or disallowed named closures. Of those closures, 381 use `{propext, Classical.choice, Quot.sound}` and twenty use `{propext, Quot.sound}`. Definition counts are separate from the printed theorem closures.

## Depth-based batches and temporal boundary

The new `validate_batches_762ebbae.py` helper inventories source-matching successful builds with objects, chooses explicit arguments or current inventory modules whose prior replay flag is false, and generates an Audit for that chosen set. It records fresh source/object information and sets the chosen replay flags false before replay, asserts the Audit predicate, computes recursive import depths, groups chosen modules by equal depth, and divides each group into at most ten targets. It submits those chunks to three foreground worker threads with 150-second replay limits. Successful returns update the corresponding flags.

The independent source graph confirms that each of the 37 actual chunks is an antichain: no selected module transitively imports another target in its chunk. Each replay's imported base is also transitively free of its own targets, and explicit target names do not collide with explicit base declarations. Local base sizes range from 128 to 2,172 nodes. Exact memberships, counts, and receipts are retained in the evidence JSON.

Sorting depth groups is not a completion barrier: all chunks are submitted to the same concurrent pool. Eight successful invocations begin while at least one imported new dependency's own replay is unfinished. This occurs among the initial small coefficient/gap modules, separator/assembly modules, HighBounds/LargeSource/ResidualLarge, and the final GeFour/ResidualGeFour pair. Every new target and new base module nevertheless has a matching successful build before its successful replay invocation. All 263 selected bodies eventually pass, with the last return at approximately 03:48:57.020694. The evidence supports complete selected-body coverage for this round over compiled imports, not topological replay of every dependency or a fresh whole-source rebuild.

The validator and original audit/selected wrappers are unchanged from worker122 after request/name substitution. The finalizer is likewise unchanged after request/name and inherited-manifest path updates. The newer batching helper is the operational change used by the five retained Audit groups. The older selected-wrapper fallback for old worker121 object metadata is present as text but supplies no retained old-module target. Default selection from the current compiler inventory cannot establish old-backlog recovery.

Compiler scheduling uses foreground dependency-aware pools over explicit plans. The ordinary and small schedulers permit six workers; the right scheduler permits two, with 150-second compiler limits and STOP/deadline checks before scheduling further work. Their build-success terminology is distinct from replay admission. The final target/base build and replay records, rather than scheduling labels, determine the coverage stated here.

## Inherited graph and the old 212-module backlog

The parsed local graph has 2,179 nodes: 268 new mathematical/Audit source nodes and 1,911 inherited nodes. The operational driver is reviewed separately. The inherited parsed nodes are admitted only at source hashes matching worker123 `before.json`: 1,894 are reused through worker122's graph and seventeen through worker121's graph. There are no unresolved local imports or detected cycles.

Successful bases contain 231 worker121 modules: all 212 compiled-unreplayed modules and nineteen previously accepted modules. The nineteen are LowBounds, HalfBounds, SmallSource, eight SmallBlocks, and eight SmallBridges. None of the 212 appears in any worker123 compiler or replay target list, and none of worker121's 298 unbuilt modules is imported. All 195 previously identified compiled-only dependencies remain among the 212. The 808 tracked historical unbuilt/excluded modules remain outside successful bases. New M762 counterparts of previously unfinished source work do not change the status of old MAE2/M9FC source files or attempts.

The saved dependency-scope roots are `MarkovResidualLargeM762` and `MarkovResidualGeFourM762`. Their combined source closure contains exactly 2,174 modules: all 263 selected new modules and all 1,911 inherited nodes. The five Audit modules account for the difference from the full parsed graph. The saved scope's module membership and source hashes match this closure exactly; no selected module lies outside it.

`dependency_scope_762ebbae.py` searches the recorded Lean path for each source module's object, records source/object hashes, labels whether the object is new, and preserves earlier recorded scope entries when extending the roots. It reports 1,911 reused objects, no missing objects, and pins for the toolchain and Lake files. Its own scope text correctly describes a hash inventory, not rebuilding or replay. The parallel validation audit independently hashes all 2,174 exact source/object pairs and pins, including reused before123 bindings. That corroboration establishes retained object presence and preservation, not recovery of the 212 unreplayed bodies or runtime object identity.

The inherited Lean path equals worker122's evidence directory followed by worker122's inherited path, with worker123's own directory prepended at invocation. The stored inherited list has 125 entries. Mathlib and other external compiled imports retain the established boundary.

## Finalizer, rejected builds, and cutoff

The finalizer restores true flags from successful source-matching receipts having a `checker_sha256` field, but does not compare the value to an expected driver hash. This audit independently confirms every replay hash equals the final checker. It verifies validation source/object hashes, prior input preservation, the inherited manifest, root/contract pins, and manifest contents; it reports accepted, compiled-pending, and unbuilt sets separately. No fixed all-candidates predicate is added, but the observed compiled-pending and unbuilt lists are both empty. The original audit predicates compare line counts and allowed axiom sets; exact name coverage is independently verified here.

There are 272 compiler receipts and 272 matching source snapshots: 268 successes (263 mathematics and five Audits), three return −2 interruptions, and one return1 error. There are no compiler timeouts, missing outcome receipts, or superseded successful versions. The interrupted SmallGap41 parts4/5/6 snapshots match their final source bytes; each later builds and replays successfully. The rejected HighBounds snapshot differs from its accepted final version. These earlier outcomes remain retained as interruptions/error rather than being retroactively relabeled successful.

All 269 new Lean files are indexed. The finalizer at event255 produces the 1,160-entry manifest and last-verification with empty failure lists; controller artifacts also retain the manifest and verification file excluded from that index. The initial snapshot has 4,984 entries and excludes only this round's setup script from preservation, leaving 4,983 prior inputs. The finalizer checks worker122's 702-entry manifest; the separate validation review binds the broader preserved archive records. Reconciliation and preservation are not additional replay receipts.

Worker123 starts at 03:23:23.742517 UTC, with nominal deadline 03:53:23.742517. The last selected replay returns around 03:48:57.020694; last-verification has project mtime 03:50:10.505278. Final report/turn-completed are events256/257, with final.json mtime 03:50:40.275143. Controller completion is 03:51:15.154330, approximately 128.588 seconds before the deadline, with elapsed approximately 1,671.412 seconds. The event stream has 675,582 bytes, exactly accounted for by the activity counter, and stderr is empty. All 37 exact current replay counterparts match their archived receipts; no extra or late receipt is observed. The parallel validation audit gives the full artifact/cutoff binding.

The strongest supported claim is successful replay of all 263 selected new bodies with explicit M762-name isolation and exact named closure coverage, over preserved compiled imports. It does not establish replay of the old 212-module backlog, a fresh whole-source rebuild, official-checker admission, binary/private/generated declaration reconstruction, or mathematical/English completion. Ordinary Lean.Replay handling outside the explicit-name guard remains unchanged.

Exact selections and bases, antichain checks, driver/wrapper comparisons, closure/name/count bindings, source graph and saved scope comparison, rejected snapshot versions, temporal metadata, and stable input hashes are recorded in `markov_worker_000123_replay_method_evidence.json`. The supporting script `audit_worker123_method.py` performs only independent static parsing and hashing.
