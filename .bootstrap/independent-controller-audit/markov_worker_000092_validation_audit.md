# Worker 000092 retained validation and method audit

Read-only audit of request `f2da221d241a479bb83492e861a09fd7`, project `/Users/sasha/math_gkm`, evidence `evidence/markov-f2da221d`, controller `.control/markov/workers/000092`. No project code, Lean, replay, experiment or finalizer was executed by this audit; no project files were written. Mathematical scope is reviewed separately.

The retained records support **26 final mathematical modules plus Audit, 72 named theorem declarations, matching successful compilation and alternate union-kernel replay**, with complete direct printed axiom closures. No final-source, object/archive/manifest, receipt-event, or preservation mismatch was found. This is a local validation result, not root-theorem completion or independent controller admission.

## Hash and receipt bindings

- All **174** controller-indexed changed artifacts have equal controller after-hashes, current bytes and worker-92 archive bytes. All **172** manifest entries additionally agree with those values. The manifest and its verification record are the two indexed files omitted from the manifest's own entries. There are no extra current worker-92 files outside this controller index.
- All **42** ordinary receipts are compilation attempts: **27 successes**, **14 return-code-1 failures**, and **one timeout**. The 27 successes are exactly the final 26 mathematical modules and final Audit; no superseded successful source is selected. Every retained attempt snapshot hashes to its receipt's source digest.
- Each final source has its matching successful build receipt, final `.olean`, and successful union membership. Source, receipt, snapshot, object and archive bytes are independently hashed in the companion evidence. Retained objects are hash-bound final artifacts; the wrappers do not record an invocation-time digest proving the exact object bytes loaded by each replay.
- All 42 receipts have completed outer command events. Successful stdout/stderr in those events are **length summaries**, not copies of the output; the summaries match the retained full receipt lengths. Failed output agrees exactly or with the wrapper's 8,000-character prefix. The complete retained receipts, including Audit output, are independently hash-bound. Both union event payloads match their receipts exactly.

The 14 failed attempts concern earlier source versions of FirstShiftCoeff, FirstShiftSource, FourthBoundary, ResidualNext, ShiftProduct and ShiftGapPart0–8. Each differs from its final accepted source hash. The sole timeout is `MarkovFirstShiftGap0F2` (120.203645291 seconds), whose unchanged final draft hash is `23fb7bdea5f86b7468e4765a2c2ac757462c2fdc365c5bea97ffb6a1dd783d60`. It has no retained object or successful build/replay and is explicitly excluded by the inventory and validation manifest. It is not counted among the 26 modules or 72 theorem closures.

## Replay and axiom scope

| Successful union receipt | Selection | Named theorems / definitions | Receipt-name UTC |
|---|---:|---:|---|
| `kernel-union-1792070939334272000.json` | 4 math | 30 / 14 | 13:28:59.334272 |
| `kernel-union-1792072122656195000.json` | 26 math + Audit | 72 / 46 | 13:48:42.656195 |

These are **31 selections / 27 distinct modules including Audit**, not 31 distinct modules. There are no direct replay receipts. The four overlapping modules have the same final source hashes in both groups. Matching successful builds precede each group's estimated execution interval. Receipt filenames are assigned after the subprocess and hashing; the interval estimates derived from the recorded duration are not separately logged exact kernel-return timestamps.

The first union SHA-256 is `f988c79693c984e0bafdeb4aa69b51fcd99eba2a94ff725ec2486bd60948388e`; the final union is `774bb6d0094c5bb77a0e1f0dd759ed9301e3b73a6751ef8d5b70d5d11eace353`. Their completed event lines are 121 and 257.

The 72 source `(module, theorem-name)` pairs exactly equal the inventory. Their names exactly equal the 72 Audit requests, retained printed closures and validation axiom map; none is missing or extra. Every closure uses only a subset of `propext`, `Classical.choice`, `Quot.sound`. Audit has 26 imports, 72 `#print axioms` requests and no explicit declaration. Its successful build retains 6,421 characters of stdout. The successful event contains the corresponding length summary. Helper definitions are covered by the replay method's constant selection, not counted as additional named theorem closures.

The drivers are unchanged against the worker-92 before snapshot:

- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.
- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.

Both unions record the matching batch-driver hash. The wrapper captures target source hashes before replay, requires matching successful build receipts, runs the unchanged driver, and hashes the driver afterward. Both source-level imported base closures contain **501 local modules**, no worker-92 target, and 23 worker-91 mathematical dependencies. No explicit-name collision, target contamination, source import cycle or baseline mismatch was found. The selected Audit imports are all among the final union targets. Neither worker-91 `MarkovResidualK0B` nor `MarkovAuditK0B` occurs in either base. The new residual modules use `MarkovResidualN6604`.

The method feeds collected constants through the established kernel replay procedure. Its handling of unsafe/partial constants, axioms, duplicate names and already-imported matching theorems remains material: it can skip unsafe/partial declarations or already-imported theorem bodies, accepts axioms as axioms, and overwrites duplicate map names. Static target/name checks found no selected-source route to those skips; pending recursion does not add declarations as assumptions. Source-level checks do not expose actual binary import tables or generated/private constant inventories. Imported dependencies remain trusted. Neither official CLI replay, per-declaration binary witnesses, file freezing nor a fresh whole-source rebuild is established. See the separate method note for precise limits.

## Finalization and historical boundary

One finalizer invocation completed with exit code 0 (events 260–261), reporting 26 mathematical modules, 72 theorem closures, 172 artifact hashes, 208 preservation checks, 15 rejected builds and the excluded draft. The independently recomputed manifest agrees with `artifact-verification.json` (`verified: 172`, no failures). All **208 preservation comparisons** and **199 initial reconciliation comparisons** match current bytes; these overlap and must not be summed as distinct protected files.

The pinned root digest remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The canonical contract digest is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, while its file-byte digest is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; these represent different hash inputs.

All times below are UTC on 2026-10-15:

| Record | Time |
|---|---|
| Controller start | 13:21:40.877222 |
| Final full union receipt filename | 13:48:42.656195 |
| Validation file mtime | 13:49:19.186307 |
| Preservation file mtime | 13:49:19.314241 |
| Manifest file mtime | 13:49:19.497603 |
| Final artifact verification mtime | 13:49:19.663622 |
| Controller finish | 13:49:57.688853 |
| Controller deadline | 13:51:40.877222 |

The controller records `completed`, elapsed **1696.811632156 seconds**, finishing **103.188368797 seconds before deadline**. Final artifact verification predates the deadline by **141.213600159 seconds**. No indexed artifact has a current mtime after the deadline or controller finish; no unarchived worker-92 artifact or pending command item was found. Final agent JSON (event 262), controller `final.json` and controller report agree, and event 263 is `turn.completed`. There is no separate local `evidence/.../report.json`, which was not required or claimed as an indexed artifact. Completion remains null and `mathematical_resolution` false.

Worker 92's reconciliation references 26 final worker-91 source/build/replay bindings (25 math plus final Audit). Every reference has the expected digest and retained successful status. Independently, all **193 worker-91 controller-indexed artifacts** match the old controller after-hash, old archive, worker-92 before snapshot and current bytes; none is a worker-92 changed file. Worker 91's seven absent aggregate/report files remain absent. No worker-91 validation/finalizer invocation or new replay of its modules was found.

This reconciliation preserves, rather than upgrades, worker 91's status. Its second union receipt was created about **0.322 seconds after its deadline**, was already archived, and has no completed outer command event. The receipt filename/mtime does not independently locate the subprocess return relative to that deadline. Worker 91's first union also retains its old-Audit/new-Audit object-overlap qualification: the recorded base-import count of two distinguishes the known old header from the three-import final header, but there is no immutable invocation-time object hash. New worker-92 replays do not repair or erase either boundary; 23 worker-91 mathematical modules are trusted imported dependencies, not newly replayed targets.

## Supporting evidence

The companion JSON lists every selected source, object and receipt digest, snapshots, archive/controller comparisons, event bindings, axiom names, exclusions, preservation comparisons and historical references. The method note and its evidence separately preserve full source-level base closures.

All **1245 combined audit inputs** were rehashed without changes at `2026-10-15T14:01:45.841720+00:00`.

- Validation evidence: `markov_worker_000092_validation_evidence.json`, SHA-256 `048710a90c4f9d10a1d308cf2021a796cc3259b7e3b2992b73bcb706399560d4`.
- `markov_worker_000092_replay_method.md`, SHA-256 `ae0e3285a9fed76829473a10799274b4312c5c2bfe4cdcb21f97997df3def665`.
- `markov_worker_000092_replay_method_evidence.json`, SHA-256 `ac843c24032af94435adc302da5947fdbc268a8ac7f21f1123dd213429cdedfe`.
