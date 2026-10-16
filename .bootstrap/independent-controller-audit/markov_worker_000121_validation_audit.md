# Worker 000121 retained validation audit

Request `ae257c53f22a4da2970651c23916380a`; interrupted archive `/Users/sasha/math_gkm/.control/markov/workers/000121/artifacts`. This archive-first review follows the worker120 audit, reads only retained records and exact named counterparts, and writes only under `/private/tmp/math_gkm_godel_20261013`. It runs no project code, Lean, proof, checker, replay, experiment or finalizer; it does not inspect active122 or its reconciliation, contact the proposer or edit the project. Source mathematics and finite-domain interpretation are handled by the parallel mathematical audit.

The cutoff supports **235 compiled mathematical modules, 167 individually axiom-audited modules, and 23 successfully selected/replayed modules containing 62 named theorem declarations and 34 definitions**. The finalizer explicitly reports **212 compiled modules pending separate validation and 298 unbuilt sources**. The final Half replay relies on **195 new compiled dependencies that have no successful body replay**. The controller outcome remains **timeout**, elapsed **1832.5235567092896 seconds**, with **null report**, no `final.json` and no `turn.completed`.

The saved manifest and partial finalizer are internally consistent with this cutoff. No stale manifest hash, source mismatch, extra exact-request evidence file or late receipt was observed. These findings establish the recorded partial result; they do not turn the finalizer's zero exit or empty failure list into complete dependency validation.

## Artifact and preservation bindings

All **1,355 controller-recorded artifacts** match archived and exact current SHA-256 bytes. All **1,353 manifest entries** match archive/current/controller hashes. Its only exclusions are `manifest.json` and `last-verification.json`, both independently controller/archive/current bound. All **537 final Lean sources**, including helper names that do not end in `MAE2`, are indexed. This fixes the worker120 helper-source manifest omission for this archive.

The artifact set comprises **791 Lean files = 537 final sources + 254 immutable build snapshots**, **239 objects**, **302 JSON files**, **17 Python files** and **six Markdown files**. There are no unrecorded archive files or missing named counterparts. Of the 254 snapshots, 251 have numeric build receipts and three have no outcome receipt, as detailed below.

All **235 compiled mathematical source/object pairs** agree with compiled inventory, successful final-source build receipt, immutable snapshot, controller/archive/current and source declaration lists. Four successful Audit sources and objects account for the remaining compiled objects. The **239 successful build receipts have distinct final source targets**; no successful superseded source version was found. All **261 numeric compiler/replay receipt summaries** bind to the retained event-log JSON output, including captured stdout tails. Every selected target has a matching successful build before its replay begins. All replay source hashes—including unsuccessful attempts—match final archived source bytes. Each accepted validation entry's source/object/build, exact theorem list, named Audit and successful replay receipt independently agrees with those records.

The initial manifest contains **4,106 named paths**. Its own-tag exclusion removes the checkpoint and `research/setup_ae257c53.py`, leaving **4,104 unchanged prior inputs**. The checkpoint/setup are newly created own files, not prior inputs. **4,102** initial paths have identical before121 hashes; the only absent before entries are those two own files, `MISSION.md` and `.control/markov/contract.json`. There is no conflicting before hash. This setup extends preservation to named Python research files as well as Lean/Markdown sources. The six inherited administrative records match expected, recorded actual and current bytes.

All **512 worker120 artifacts** match their prior controller/archive, before121 and exact current bytes, including its 43 accepted source/object records. Worker121's reconciliation embeds the same worker120 final report and the already-reconciled worker118/119 snapshot-copy failure text/hashes. Those two saved log texts hash to `7644dc037eeecf91c9bf940a489ad9b04e03856a2beafb9c6aa448a7cdb59733`, matching worker120's reconciliation. This review reuses that operational boundary without repeating the older proof audit, treating failed snapshots as mathematics or upgrading historical late records.

The root remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Raw contract bytes hash to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted compact ASCII JSON gives `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, matching the request. Parsed contract contents match. The serialization distinction is unchanged.

Parent-reported copy-on-write consolidation of older objects/archives through116 is byte-preserving and does not touch121 or live sources. This audit uses content hashes, not inode/ctime identity, and does not inspect storage operations or successor work as proof evidence.

## Exact accepted, printed and pending inventories

| Final mathematical status | Modules | Theorem declarations | Definitions |
|---|---:|---:|---:|
| Successful selected replay plus individual axiom audit | 23 | 62 | 34 |
| Compiled and individually audited, without successful replay | 144 | 278 | 300 |
| Compiled, without individual named Audit inventory or successful replay | 68 | 162 | 60 |
| Unbuilt final source | 298 | 688 | 421 |

Thus 533 mathematical sources plus four Audits give 537. Compiled totals are **235 / 502 / 394**; individually audited totals are **167 / 340 / 334**. Textual declarations in unbuilt files are not credited as proved. Twelve compiled-pending modules are definition-only: ten are in the audited inventory and two outside it. Their empty theorem lists produce no named closure print. None of the 23 accepted targets is definition-only.

The exact accepted family is:

- `MarkovThirdSmallSourceMAE2`: two theorems.
- `MarkovThirdSmallBlocks{41,43,51,52,53,54,61,65}MAE2`: four theorems and four definitions each.
- `MarkovThirdSmallBridge{41,43,51,52,53,54,61,65}MAE2`: one theorem each.
- `MarkovThirdLowBoundsMAE2`, `MarkovThirdLowSourceMAE2`, `MarkovResidualLowMAE2`: 5/4/1 theorems and one residual definition.
- `MarkovThirdHalfBoundsMAE2`, `MarkovThirdHalfSourceMAE2`, `MarkovResidualHalfMAE2`: 5/4/1 theorems and one residual definition.

Three successful replay unions select **9 + 20 + 3 = 32 occurrences**, with the first nine repeated in the later twenty: **23 distinct targets**. The first success covers SmallSource and eight SmallBlocks modules; the twenty adds eight bridges and the Low triple; the last covers the Half triple. No inherited module is newly selected.

Four successful generated Audits import **9 / 155 / 20 / 3** targets and print **34 / 318 / 52 / 10 = 414 rows**, covering **340 distinct theorem names**. Requests, source theorem names, printed names and validation's per-module Audit links match exactly. Only **62** printed names belong to accepted targets. Their axiom sets are: **30** `{propext, Classical.choice, Quot.sound}`, **24** `{propext, Quot.sound}`, and **eight** `{propext}`. Across all 340 distinct names the corresponding counts are 290, 42 and eight. No disallowed printed axiom appears.

`validation.json` contains 167 module records, scope and null completion; it is not a complete compiled-module inventory. Its final accepted flags exactly match source-bound successful replay selections. The final-check's **212 compiled-pending** and **298 unbuilt** lists exactly equal the independently reconstructed sets. Of the 298, three have interrupted receipts but no successful build; the other 295 have no retained build snapshot or receipt. None has an archived object or enters a successful replay base. There is no pending-list omission analogous to an unacknowledged accepted file.

The final scheduler status is scoped to charts5/7: 78 compiler-accepted modules and empty active/failed/pending lists. Those empty queue lists do not describe all 533 mathematical candidates. Scheduler acceptance means successful source-matching compilation, not replay acceptance.

## Failed and incomplete invocation history

There are **251 numeric build outcome receipts: 239 successes, nine return−2 interruptions and three return1 errors**. There are **no compiler wall-timeout receipts**. All three return1 failures are earlier `MarkovThirdSmallBridge41MAE2` versions, with stamps `1792118127942964000`, `1792118168375666000` and `1792118199946646000`; the last reaches maximum recursion depth. Their snapshots differ from final source. The final version has its own successful build and selected replay.

All nine return−2 snapshots are identical to final source bytes. They affect `MarkovThirdAllmidhigh_0_4Part{16,18,19}MAE2`, which remain unbuilt, and `MarkovThirdAllmidlow_1_2Part{0,1,2,8,10,11}MAE2`, which later compile but remain unreplayed. The interrupted broad batch at event100 exits130; the scheduler at event149 returns0 while retaining individual interrupted receipts. Neither outer status overwrites the individual outcomes. The reported **12 nonzero compiler receipts** are exact; there is no build-plan counting inflation this round.

Three more immutable snapshots have no corresponding JSON outcome in archive or exact current evidence:

| Snapshot stamp | Final matching module | Later successful receipt stamp |
|---|---|---|
| `1792117942525440000` | `MarkovThirdAllmidlow_1_2Part4MAE2` | `1792118197672878000` |
| `1792117942529100000` | `MarkovThirdAllmidlow_1_2Part5MAE2` | `1792118211141343000` |
| `1792117955487571000` | `MarkovThirdAllmidlow_1_2Part6MAE2` | `1792118229995917000` |

These snapshot-only invocations occur around the interrupted broad batch. Their retained outcomes are **unknown**; snapshot creation does not itself prove that Lean started or completed. All three final sources later compile successfully but remain unreplayed. Thus **254 snapshot-observed build invocations** and **251 recorded outcomes** must be distinguished. The twelve nonzero receipts are not a complete count of interrupted or unfinished invocation history.

There are **ten replay receipts: three successes, three wall timeouts and four return−2 interruptions**. The broad155-target replay times out after approximately120.232 seconds. Its preceding318-closure Audit succeeded; its outer audit wrapper returns0 despite replay failure. The subsequent chunk wrapper records six20-target chunks: two timeouts followed by four interrupted returns. They select120 of the155 bulk targets; the other35 have no recorded chunk attempt. The chunk command exits130 at event190. No failed chunk contributes successful replay coverage.

The first nine successful targets are included in the failed155 union. The incremental audit wrapper temporarily overwrites their true replay flags with false bulk results. The later20-target success replays all nine again, and the finalizer additionally restores prior successes only when receipt, validation and current-source hashes match. Final acceptance is independently verified against successful receipts; it does not credit partial output, timeout or an imported body. Failed replay source versions are the same final versions, so they must not be described collectively as superseded sources.

## Replay method and imported trust

The separate static method audit finds the audit wrapper unchanged after retagging. The low-level validator adds compiler `-j 1` only:123 retained build commands omit it and128 include it. Replay remains `ReplayWideMCFC` with stack `-s 131072`; driver hash `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`, original replay body and joined-task propagation are unchanged. No bypass was found.

The source graph has **2,112 local nodes = 537 new + 1,575 inherited**. Successful replay bases contain **192 / 1,653 / 1,771** local nodes with **3 / 13 / 12** direct roots including Init. They are transitively target-free, with no unresolved local imports, source cycles or explicit target/base name collision. All new target and imported-base modules have matching successful builds before the relevant replay; already-replayed LowBounds precedes the Half replay.

The first nine-target base has no new imported modules. The twenty-target base includes **78 new compiled-only modules** in `low_1_1` and `low_2_0`. The Half base includes already-replayed LowBounds plus **195 new compiled-only modules**: five chart families `low_1_1`, `low_2_0`, `midlow_0_4`, `midlow_1_2`, `midlow_2_1`, each containing20 parts,18 separated helpers and one assembly. Their bodies contain425 theorem declarations and300 definitions. Of these195, **127** belong to the individually audited inventory (including eight definition-only modules) and **68** do not (including two definition-only modules). None has successful body replay. The other17 compiled-pending modules are outside successful bases. No unbuilt source or tracked historical exclusion enters a successful base.

Individual prints of selected closures still account for axioms of used imports, but do not substitute for selecting those imported bodies in replay. The source graph does not reconstruct binary import headers, generated/private constants or invocation-time loaded objects. Inherited and Mathlib objects remain trusted at the established boundary. Replay qualifications concerning duplicate keys, already-imported matching theorems, unsafe/partial constants and axiom admission remain conditional on source/binary correspondence. Receipt hashes do not measure invocation-time driver/object bytes.

The saved `audit_only_ae257c53.py` helper is not observed executing; no AuditAll source or235-module print receipt exists. Its static replay-flag reuse lacks a source-hash guard, but this is not a used step here. The actual final23 records pass independent source/version checks. The new chunk wrapper reuses compiled imports and has no successful chunk return this round.

## Partial finalizer, deadline and late boundary

All times below are UTC on **2026-10-16**. Receipt stamps identify invocation start; estimated return is start plus retained duration, not an independently timestamped process exit.

| Audit/replay selection | Audit estimated return | Replay start | Replay estimated return |
|---|---|---|---|
| 9 targets /34 names | 02:37:32.446642 | 02:37:32.447687 | 02:37:44.188830 |
| 155 targets /318 names | 02:39:15.574523 | 02:39:15.576769 | 02:41:15.808845, timeout |
| 20 targets /52 names | 02:46:09.232705 | 02:46:09.234178 | 02:46:34.498553 |
| 3 targets /10 names | 02:49:56.777245 | 02:49:56.778249 | 02:50:04.293194 |

Successful replay wrappers finish at events147,196,221; bulk failure is event172. Chunk timeouts return around02:44:20, then interrupted chunks around02:45:21–02:45:27. All recorded mathematical validation precedes the nominal deadline.

The finalizer is revised at events223–224; checkpoint/operational notes are updated at225–226. Its sole execution is227–228. It restores matching successful replay flags, checks stored validation source/object hashes, prior preservation and pins, computes the23 accepted intersection, and reports the separate pending sets. It no longer requires every compiled module to be accepted. The scan covers `*MAE2*.lean`, and the manifest covers all537 final sources. It writes summary/index/last-verification before its final assertions and returns0 with **235 compiled,23 validated,62 selected closures,167 audited,4104 preserved, empty failures and completionnull**. The retained output matches the saved partial summary. This is a successful partial finalizer, not a complete worker result.

Validation mtime is **02:50:40.413606Z**, final-check **02:50:43.666213Z**, compiled inventory **02:50:43.666584Z**, manifest **02:50:47.627272Z**, and last-verification **02:50:51.421310Z**. Last-verification intentionally follows the index and is the latest controller-bound project artifact. It verifies1353 listed hashes with no failures; it does not assert full compilation, full named Audit coverage or dependency replay. No unaccounted post-finalization file was observed. No separate last-verifier or nested finalizer command appears.

Controller start is **02:21:14.734681Z**, nominal1800-second deadline **02:51:14.734681Z**, and finish **02:51:47.258238Z**. Retained elapsed and endpoint subtraction both give **1832.5235567092896 seconds**. Finish is **32.523557 seconds beyond deadline**. Last-verification is **23.313371 seconds before deadline**; final replay estimated return is about70.441487 seconds before deadline. All controller-bound project artifact mtimes precede both deadline and finish. The timeout does not invalidate the earlier retained partial receipts, and the earlier finalizer does not erase the timeout.

There are **228 events**, including106 starts and120 completed items, with no unmatched item start. The last event is the partial finalizer's successful command result. There is **no final.json, receipt report or turn.completed**. The last agent message at event222 says the Half theorem/residual compiled and the final audit/hash check is in progress; it is not a final report. The controller records timeout despite returncode0. No missing final response is reconstructed.

The final event log is **609,473 bytes**, with empty stderr. Activity reports exactly609,473 bytes, matching the full prefix through228: **no activity-counter lag**. Its recorded time is **02:51:14.906799Z**, about0.172118 seconds after nominal deadline; activity-file mtime is02:51:14.906936Z. Event-log mtime is **02:50:51.452610Z**, and receipt mtime **02:51:47.259302Z**. The late activity/receipt bookkeeping does not represent a late proof invocation.

No extra completed-request current evidence file, changed archived counterpart or current missing-outcome receipt was observed. No late-evidence copy was needed. Existing partial replay, missing outcomes, historical late records and controller timeout remain classified at their original boundaries; this audit supplies no missing check.

## Supporting evidence

The JSON records every controller/archive/current/index and source/object/receipt comparison, exact accepted/compiled/unbuilt lists, all251 build and10 replay receipts, three snapshot-only unknown outcomes, printed names/axioms, preserved inputs and timing. The separate method evidence preserves import closures and wrapper comparisons.

Full input byte-hash stability at **2026-10-16T03:06:50.846640Z** found zero changes across **7,520 inputs**. A subsequent exact-request path check at **03:09:36.563049Z** found no extra evidence file or missing named counterpart. Method audit stability at **03:09:38.293489Z** found zero changes across901 inputs.

Supporting files and SHA-256:

- `markov_worker_000121_validation_evidence.json`: `2d4d5a0ad4a03633833374d3bdc61a0ab8425351753ff6090ead8688fcdcf716`
- `markov_worker_000121_replay_method.md`: `0d14d8b834e325977361357253bf5ce7aa79a20ef17de87f48d663f45a143ecf`
- `markov_worker_000121_replay_method_evidence.json`: `ee31340f8122cb4345b6644cee7023494ed4e191d609a7dd6a149be7a5a9a0a5`
