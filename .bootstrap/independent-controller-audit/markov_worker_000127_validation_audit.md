# Worker 000127 retained validation audit

Request `f52ba1417d354fe7831df8391636160f`. This is a read-only audit of the completed worker127 archive, controller records, exact named current counterparts and predecessor records. Only static parsing and hashing were performed. No Lean, proof, checker, replay, experiment, finalizer or project program was executed; no active128 material was inspected. Mathematics and finite-domain interpretation are in the parent audit. The machine-readable evidence stores complete receipt/source/object/name/hash bindings.

The retained final inventory agrees: **13 new mathematical modules, 44 theorem closures and six definitions**. Every final mathematical source has a successful source-matching compiler receipt and snapshot, retained object, successful explicit isolated replay and matching axiom output. No mathematical module in the completed new-source inventory is unbuilt, compiled-only or pending validation. There is no `compiled-inventory.json` in this round: this audit enumerates sources and receipts and checks them against the changed `validation.json` schema. The terminal-A continuation remains an unformalized documented candidate, not an omitted new Lean module or a completed universal theorem.

## Inventory and exact coverage

| Final module | Theorems | Definitions | Successful build receipt suffix |
|---|---:|---:|---|
| `MarkovSecondGapDefsMF52` | 1 | 3 | `build-1792128306282449000` |
| `MarkovSecondGapOneTwoMF52` | 3 | 0 | `build-1792128358623842000` |
| `MarkovSecondGapOneLargeMF52` | 3 | 0 | `build-1792128362176022000` |
| `MarkovSecondGapTwoOneMF52` | 3 | 0 | `build-1792128366247722000` |
| `MarkovSecondGapTwoTwoMF52` | 3 | 0 | `build-1792128371279426000` |
| `MarkovSecondGapTwoLargeMF52` | 3 | 0 | `build-1792128377184754000` |
| `MarkovSecondGapLargeOneMF52` | 3 | 0 | `build-1792128382207033000` |
| `MarkovSecondGapLargeTwoMF52` | 3 | 0 | `build-1792128387383947000` |
| `MarkovSecondGapLargeLargeMF52` | 3 | 0 | `build-1792128392807068000` |
| `MarkovSecondGapMF52` | 2 | 0 | `build-1792128466400509000` |
| `MarkovSecondRowMF52` | 6 | 0 | `build-1792128618091031000` |
| `MarkovSecondWordMF52` | 4 | 0 | `build-1792128686634734000` |
| `MarkovSmoothingRescueMF52` | 7 | 3 | `build-1792128903557574000` |

The final source count is 16: 13 mathematical modules, two axiom-Audit modules and the replay driver. There are 21 compiler receipts and 21 matching immutable source snapshots: 15 successes (13 mathematical and two Audit builds) and six failures, all return code 1. There are 15 retained objects, two successful replay receipts, 42 JSON files, 37 Lean files including snapshots, 14 Python files and six Markdown files: **114 controller artifacts and exactly 114 archive files**. No snapshot-only compiler invocation, superseded successful source, replay timeout or failed replay is retained. Each final successful mathematical build predates its replay invocation. This does not turn failed earlier source versions into successful ones.

The first replay (`replay-1792128742838087000.json`) explicitly selects the 12 modules through SecondWord: 37 theorem names plus three definitions, with stdout confirming isolation of 40 constants. The second (`replay-1792128969608300000.json`) selects SmoothingRescue: seven theorem names plus three definitions, isolation count 10. Thus 13 distinct targets and 50 explicit constants are checked once each, including definitions; 44 is the theorem-closure count. No selected module is definition-only. Both receipts match final source hashes, declared-name order and final checker source SHA `9e86083b86ff2c08ea793eb3c464f6abf3e83c8b442d58b1c8117e09c923d11d`.

The two successful Audit builds print exactly 37 and seven expected closures, respectively: 44 rows, 44 distinct theorem names, no missing, duplicate or extra name. The two source-hashed `axioms-*.json` records exactly match their Audit imports, final imported-source hashes and compiler output. Forty-two closures list `propext`, `Classical.choice`, `Quot.sound`; `false_run_statsMF52` lists only `propext`, and `rescue_statsMF52` lists `propext`, `Quot.sound`. No disallowed axiom occurs. The early mathematics note's twelve modules/37 closures describes the first stage; the separate Rescue addition and final validation/report consistently give13/44.

## Six failed versions

| Receipt | Module | Rejected source SHA-256 |
|---|---|---|
| `build-1792128337826655000` | `MarkovSecondGapOneTwoMF52` | `17d088e774bf786479a17127a0a19f6b24a1fffc289ba442ef574e52de5b627b` |
| `build-1792128496064579000` | `MarkovSecondRowMF52` | `9fc39eef2ff817d2bed407624458befaafcbb3671fc7d8af4f2b3fcf91d0856b` |
| `build-1792128557458783000` | `MarkovSecondRowMF52` | `12bb3169c9b21ea01e71580a57ab6056d2c63eb3f378353d3fc03b4afbf23df2` |
| `build-1792128664938908000` | `MarkovSecondWordMF52` | `442f50d14389ae2ddd4b18a09e63f46442e31629bd98e3aad1fe47f01656fc32` |
| `build-1792128779000267000` | `MarkovSmoothingRescueMF52` | `c3b2d1c9fa935c60e002ce0640a9d1faf2ce24ddc395b84eb5b5c397ef97b035` |
| `build-1792128840863965000` | `MarkovSmoothingRescueMF52` | `5143a45b290e22406c3b36b8dc5b11622a1fafc5c034654ff0be929b7e002d5f` |

These are six distinct superseded source versions: OneTwo once, Row twice, Word once, Rescue twice. All final versions are separately compiled, replayed and printed. OneTwo's first operator-spacing/lexing error produced unknown identifiers; Row failures concern binomial arithmetic and unfinished ring goals; Word fails a cast bridge; Rescue fails conjunction/coefficients simplification. The theorem-name inventories do not change. Static header comparison finds only the initial OneTwo operator whitespace difference, not an extra assumption or removed theorem. Full failed snapshots and stdout are retained; no timeout or -9 handling is involved. The later finalizer failure is a separate noncompiler failure.

## Imported scope and method limits

The static local source graph has **121 nodes = 15 new mathematical/Audit sources + 106 inherited sources**; the driver is separate, and external Mathlib/Lean source trees are not counted. The maximal mathematical root SmoothingRescue has closure119=13new+106inherited. Exact current hashes of all106 inherited source/object pairs match before127 pins and independent retained predecessor bindings. Their mapping uses49 worker126 inherited bindings,55 worker124 bindings,one worker125 binding, and one additional SecondCoeff340 pair. The latter was outside those sealed graph inventories and is separately matched to before126 and before127 source/object pins and the method audit's matching historical archive source. Its source SHA is `3f21c2e5542650c11a65cacbed9478583c465760a02d15b5691ed738f619bca6`; its object SHA is `495ee4200711f92e96ff1e35099c2b5f27cfd65432add8b7f03c9797683da7b5`. No prior graph coverage is invented for it.

The first replay union intentionally includes dependencies among its12 targets. After target exclusion its direct source imports are SecondCoeff340, SecondSmall8934 and Mathlib; stdout reports four inherited roots including implicit Init, with101 local inherited modules in the transitive base. No target or explicit target name is in that base. The Rescue replay imports SecondWordMF52 and Mechanical3eda (plus implicit Init):118 local base modules =106old+12new. All12 new imported modules had completed matching compilation and the first successful replay before Rescue starts. No replay overlaps unfinished dependency replay. This is union isolation, not the previous depth/antichain scheduling scheme.

Neither replay base contains worker121's old212 unreplayed compiled modules, its195 Half dependencies, any other worker121 compiled module or its unbuilt candidates. No worker121 source is a new compiler or replay target. **The old212 backlog remains historically unrecovered; it is also absent from this round's actual imports.** Reconciliation and byte preservation are not replay and do not change worker121's timeout/report-null history.

The final driver and low-level validate wrapper are suffix/tag-retagged worker126 versions. The extra guard covers explicitly declared names in `MathGKM.Markov` ending in `MF52`; it checks target absence from the imported environment and unsafe/partial restrictions before ordinary Lean replay. Generated/private/inherited names retain ordinary `Lean.Replay` treatment. The driver source hash is computed by the wrapper after subprocess return, not measured at invocation; the archived evidence does not independently hash the actual executable/runtime binary or rebuild Mathlib. The compiler uses `-j 1`, and replay uses stack131072. Static source/object matching binds retained bytes and named command paths; it does not reconstruct compiled objects or prove the runtime loaded exactly these bytes. Historical compiler and kernel trust qualifications remain.

The new custom audit matches each expected fully qualified theorem name and accepts both nonempty and axiom-free output formats. It enforces an allowed axiom subset and successful Audit compilation, then writes source-hashed axiom JSON. The regex alone does not reject every conceivable duplicate/extra output; this audit independently verifies exact names, uniqueness and output equality. The custom finalizer explicitly enumerates13 modules, requires source-matching successful build and replay receipts and source-matching axiom JSON containing every theorem name, rejects forbidden source tokens, and hashes final objects. It does **not** itself enforce checker identity, re-evaluate the recorded axiom sets or bind axiom JSON back to compiler output; the independent static binding checks here cover those retained-record comparisons. There is no whole-source rebuild, fresh dependency-wide replay or independent mathematical-completion audit.

## Preservation, finalization and timing

All114 archive/current/controller change hashes match. All112 manifest entries match archive, current and controller hashes. Only the manifest itself and `last-verification.json` are deliberately unindexed; both remain controller-bound. The last-verification digest equals the final manifest digest and its count112 is exact. No extra archive artifact or own evidence-directory current file was found.

The setup snapshot has5,612 entries. Excluding the newly created own setup and checkpoint leaves **5,610 unchanged prior inputs**, all byte-matching. The checkpoint legitimately changed after setup. The snapshot includes130 `.pyc` files as preserved bytes; no such file was executed during this audit. Controller-before omissions of cache/config entries reflect different snapshot coverage, not conflicting hashes. The six inherited administrative files match. Worker127's reconciliation checks the preceding worker126 manifest93 and worker121 manifest1,353; this audit additionally matches the full controller/archive/current/before sets of **95** and **1,355** artifacts respectively. Their retained event hashes/counts match the reconciliation; worker121 still has228 events, timeout and null report. The pinned root and raw/canonical contract hashes remain unchanged.

Finalizer events207–208 fail with contract hash `f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4`. Static serialization of the same parsed contract reproduces that hash with compact sorted JSON and `ensure_ascii=False`; the pinned hash `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc` is reproduced with ASCII escaping. The final source uses the latter default. Events211–212 record the finalizer/operational-note correction and213–214 the successful rerun, reporting13/44,5,610 prior inputs, six compiler failures and112 indexed artifacts. The final source writes validation before that assertion, so a failing run can publish partial validation; the retained final files come from the successful run. The exact failed script was not separately snapshotted: reconstruction corroborates the recorded serialization explanation without claiming its exact old bytes. This corrects serialization, not the mathematical contract. Per-event wall timestamps are not retained, so exact event order must not be presented as exact execution times.

All times below are UTC. Receipt filename timestamps are invocation/snapshot starts; adding saved duration estimates subprocess completion, rather than treating the filename as a success time.

| Milestone | UTC |
|---|---|
| Worker start |05:16:35.219183|
| Last of first12 math builds (SecondWord) completed, estimated |05:31:31.270217|
| First37-closure Audit completed, estimated |05:32:35.588430|
| First12-module replay completed, estimated |05:32:46.166315|
| Rescue final build completed, estimated |05:35:13.384450|
| Rescue seven-closure Audit completed, estimated |05:36:16.786287|
| Rescue replay completed, estimated |05:36:17.700100|
| Final validation file mtime |05:39:16.030123|
| Final-check mtime |05:39:21.493177|
| Final manifest mtime |05:39:21.640552|
| Last-verification mtime |05:39:21.712001|
| Complete event-log mtime |05:39:52.398914|
| Activity time / file mtime |05:39:52.803046 / .803291|
| Controller final.json mtime |05:39:53.448870|
| Controller finish |05:40:28.092170|
| Nominal1800-second deadline |05:46:35.219183|

Controller outcome is `completed`, return code0, elapsed field1432.8729877471924s (approximately1432.873s). Direct subtraction of stored floating-point epochs gives1432.872986793518s, differing by about one microsecond; this is not a substantive timing discrepancy. Finish is367.127013s before the nominal deadline. No retained artifact mtime is after finish or deadline. The final report at event218 equals controller final.json and receipt report; event219 records turn completion. No separate draft report is retained. The activity counter exactly covers the entire219-event,511,499-byte log; stderr is empty, all103 started events have completed partners, and there is no stale activity-counter tail. Artifact last-verification intentionally follows final-check/index; no unaccounted later file was observed.

This retained validation supports the stated partial result and its evidence provenance. It does not certify the full pinned Conjecture63 or its negation, recover old unexecuted checks, or turn finite/symbolic observations into formal proofs.

## Final stability and supporting files

Final rereading of **8,283 hashed inputs**, from2026-10-16 **05:56:51.919972 to05:57:05.051157 UTC**, found no changed bytes. The scoped late-file observation at **05:57:05.051188 UTC** found no extra own evidence file and no missing controller artifact; no late-evidence preservation was needed. The method audit separately checked143 inputs unchanged at **05:56:50.768970 UTC**. These checks use content hashes, not inode/ctime, and do not reinterpret prior byte-preserving archive/cache maintenance as mathematical progress.

- `markov_worker_000127_validation_evidence.json` — SHA-256 `41f6f231ad69054727ca54245f1b3f81af1c0fb7ac46b32879d4c6aea2f47649`
- `markov_worker_000127_replay_method.md` — SHA-256 `621b444e1986d27daf267ceff833f79878ead2b46d9bcbb4269f761f0143685d`
- `markov_worker_000127_replay_method_evidence.json` — SHA-256 `855cde08cb258beeb063f9fea7f561f90cfb85c5de4874078171b9fba0347f6b`
