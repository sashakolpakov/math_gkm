# Worker 000120 static replay-method audit

Request `03d5764d3c1945eba3e1fffb38c57904`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000120/artifacts`. This audit follows the worker117 method and checks retained records, source imports, declarations, wrapper text, and hashes. It executes no project code, Lean, checker, replay, experiment, or finalizer. It reads no successor work. Workers118/119 are operational reconciliation records, not independently audited mathematical additions. Prior archive inode/ctime changes from the reported copy-on-write cloning do not change the byte-hash basis of this audit.

The retained evidence supports 43 selected new mathematical modules, 94 explicit theorem closures, and 62 explicit definitions over reused compiled imports. Four successful replay unions select the 43 modules exactly once. All selected source hashes match their replay receipts and final validation entries. There are 276 additional mathematical drafts with no build receipts or objects; none is accepted or imported into a successful replay base. This is a static audit of the recorded method, not a fresh execution or whole-source rebuild.

Two bookkeeping limitations matter. The finalizer's filename filter omits 18 accepted helper source files from its 492-entry manifest, although their source/build/replay/controller bindings are retained and independently checked. Its reported seven rejected builds include `build-plan.json`, which is a nonexecution plan: there are six actual failed compiler attempts. Neither issue changes the observed 43-module selection, but the manifest and rejection count must not be described more broadly than their contents support.

## Exact selected and unaccepted scope

The archive contains 323 new Lean sources: 319 mathematical sources and four generated Audit sources. The mathematical partition is 43 accepted and 276 unbuilt drafts. The accepted declarations comprise:

| Selected family | Modules | Theorems | Definitions |
|---|---:|---:|---:|
| `MarkovCubicCertificateM03` | 1 | 1 | 1 |
| `MarkovThirdBoundsTransportM03` | 1 | 2 | 0 |
| `MarkovThirdAlllow_0_4Part0M03` through `Part19M03` | 20 | 20 | 0 |
| `MarkovThirdAlllow_0_4M03` | 1 | 1 | 0 |
| `MarkovThirdLowSourceM03` | 1 | 5 | 0 |
| `MarkovResidualLowM03` | 1 | 1 | 1 |
| `MarkovThirdSep0I9M03{Defs,E0,E1,E2,G0,G1,G2,G3,Final}` | 9 | 32 | 30 |
| Corresponding `Sep0I14` family | 9 | 32 | 30 |
| Total | 43 | 94 | 62 |

The two `Defs` targets are definition-only modules, each with 30 definitions. They are explicitly selected in the third replay union, but contribute no named `#print axioms` line. There are no import-only targets, newly selected inherited targets, or successfully built final mathematical sources left outside replay. Explicit selected declaration names are unique. The static source scan finds no selected `sorry`, `admit`, `axiom`, `native_decide`, `unsafe`, or `partial` tokens after comment removal.

The 276 pending sources contain 296 explicit theorem declarations and one definition as unaccepted text. They comprise 13 remaining chart families with 20 parts and an assembly each, plus `MarkovThirdAllSourceBoundsM03`, `MarkovThirdAllLCM03`, and `MarkovResidualM03`. Every one has zero retained compiler attempts and no archived object. None appears in a successful base. The new low-chart result does not retroactively validate worker117's pending chart or its return −9 attempt. All 17 worker117 pending modules and all 41 tracked historical excluded modules remain absent from these bases.

## Replay and source-import checks

The parsed local source graph has 1,857 nodes: 323 new sources and 1,534 inherited nodes. Inherited parsed nodes are reused from the worker117 graph only when their source hashes equal worker120's `before.json` hashes. No additional old source resolution was needed. The graph has no unresolved local imports or detected source cycles. Mathlib imports remain an external compiled boundary. This is a source-import graph, not a reconstruction of object-file headers or generated/private declarations.

| Replay receipt suffix | Selected modules | Theorems / definitions | Explicit base roots plus `Init` | Transitive local base nodes | Estimated return, UTC 2026-10-16 |
|---|---:|---:|---:|---:|---|
| `1792116843259572000` | 6 | 7 / 1 | 6 | 214 | 02:14:12.860146 |
| `1792116889705118000` | 14 | 14 / 0 | 2 | 195 | 02:15:56.725542 |
| `1792117045703947000` | 18 | 64 / 60 | 2 | 196 | 02:18:22.051353 |
| `1792117136198763000` | 5 | 9 / 1 | 28 | 1,572 | 02:19:03.104858 |

The first union selects the certificate, transport, and low parts 0–3. The second selects the other fourteen ordinary low parts, excluding parts 9 and 14. The third selects both nine-module separator helper families. The final union selects parts 9 and 14, the low assembly, LowSource, and ResidualLow.

Each base is transitively free of its current targets, and no explicit target declaration name collides with a declaration name in that base. The first two bases contain no new worker120 modules. The third base contains only the new CubicCertificate, already replayed in the first union. The final base contains all 38 earlier selected new modules; their replay returns precede the final invocation. No unaccepted new module enters a base. The validation audit independently confirms that each selected final-source build precedes its replay. These findings remove the observed source-level target-preimport and dependency-order concerns while preserving the binary correspondence qualification below.

Four generated Audit modules import exactly the four corresponding target sets. Their source `#print axioms` names and retained compiler output match the selected explicit theorem names exactly: 7 + 14 + 64 + 9 = 94 rows, 94 distinct names, with no missing, extra, or disallowed closure. Eighty-eight closures use `{propext, Classical.choice, Quot.sound}` and six use `{propext, Quot.sound}`. Definition counts are separate from these 94 theorem closure prints.

## Driver and wrapper review

`validate_03d5764d.py` is identical to the worker117 validator after request/tag substitution. It retains bounded foreground `subprocess.run`, source hashes, immutable attempt snapshots, timeout receipts, the explicit Lean binary, and replay stack setting `-s 131072`. The inherited Lean path has 122 entries and equals the worker117 evidence directory followed by worker117's inherited path; worker120's own evidence directory is prepended at invocation. No workers118/119 mathematical evidence directory is added through reconciliation.

The Batch, Known, and Wide driver source hashes match their prior archived copies, worker120 before/initial hashes, and unchanged controller state. Wide's kernel replay body still equals Batch's body except for the entry-function rename, with the same task wrapper around it. Its archived SHA-256 is `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`. No replay-kernel bypass or new stack/body change was found. Individual receipts have no invocation-time `driver_sha256`; preserved driver source is not a runtime measurement of the file or imported objects actually read.

The audit and finalization scripts are substantially rewritten from worker117. The audit inventory accepts source-matching successful builds with an existing object, excluding Audit modules; it records the current object hash and explicit lines matching `^theorem`. It generates a timestamped Audit for the chosen modules, checks a successful compiler return, total printed-line count, and permitted axiom sets, then invokes replay and incrementally stores per-module audit/replay booleans in `validation.json`. It invokes replay even if the audit boolean is false, and does not itself raise on false audit/replay booleans. Therefore its outer return code alone is insufficient. The retained outputs here show both checks successful for all four batches. The wrapper's count/set predicate does not check exact theorem names or uniqueness; this audit independently performs those comparisons.

The finalizer checks stored source/object hashes and both validation booleans for each observed module, preserved prior inputs, pinned root/contract hashes, and banned tokens among candidate filenames. It has no fixed 43/94 threshold and does not independently reload replay or Audit receipts. It records pending candidates without requiring that list to be empty. `all_foreground_sessions_ended` is a literal report field, not process inspection. It writes final-check/manifest files before its final `assert not fail`; consequently file existence alone is insufficient evidence of success. The controller retains the successful direct finalizer return at event179, with 43 validated modules, 94 closures, and no failures. The inline final verification at event181 checks 492 manifest hashes only; it does not rerun the finalizer, recompile, or replay.

The batch wrapper can reuse an existing object when a successful build receipt matches the current source hash; it otherwise builds serially with a 100-second limit, checks STOP between modules, and stops on a failure. Such reuse is not itself replay admission. Final acceptance here is separately bound to the four retained replay unions and Audit outputs.

## Manifest and compiler accounting limitations

Candidate discovery uses `*M03.lean`, and research manifest inclusion uses the request string or a filename ending in `M03.lean`. The eighteen `Sep0I9`/`Sep0I14` helper sources end in `M03Defs`, `M03E*`, `M03G*`, or `M03Final`; they therefore fall outside the candidate/banned-token scan and the source-file manifest. They remain explicit accepted targets, and this audit scans their source imports/declarations and binds their hashes to receipts. The validation audit confirms their controller/current/archive hashes. Their objects and attempt snapshots are in the evidence directory and are manifest-covered. All 276 unbuilt sources do match the candidate suffix, so no pending draft is omitted by this filter in the observed inventory. The manifest contains 492 entries; the controller retains 512 artifacts, the difference comprising those eighteen sources, the manifest itself, and later last-verification.

There are 55 numeric timestamped compiler receipts: 49 successes and six failures. Four failures are wall timeouts (three low-part9 attempts and one low-part14 attempt); two return code1 (BoundsTransport and LowSource). All six rejected snapshots differ from their ultimately accepted final sources. Two successful compiler receipts also refer to superseded LowSource/ResidualLow sources; both final versions were rebuilt and are the versions selected for replay. Thus 47 successful final-source builds cover 43 mathematical modules and four Audit modules. No seventh interrupted compiler receipt exists. The finalizer glob `build-*.json` includes `build-plan.json`, whose only keys are `assemblies` and `parts`; missing `returncode` is counted as nonzero, producing the erroneous seven.

The initial manifest contains 2,798 entries, including the round's own checkpoint. Only that own-checkpoint path is excluded by the request-tag preservation test, leaving 2,797 preserved prior inputs. The exclusion must not be generalized to a claim that the initial checkpoint bytes were preserved.

## Cutoff and retained trust boundary

Worker120 started at 01:51:51.442034 UTC, with nominal deadline 02:21:51.442034, and completed at 02:20:47.017347, approximately 64.425 seconds early. The last selected replay returned at approximately 02:19:03.104858. The last project write, last-verification, has mtime 02:19:57.617766; final report/turn-completed are events182/183, and final.json was retained at 02:20:26.693196. These are completed-round records, not later recovery evidence. Exact current request-scoped replay receipts equal the four archived receipts, with no extra receipt observed.

The activity counter is stale by the final two events: 396,925 bytes equals the event-log prefix through event181. The final report adds 2,342 bytes and turn completion adds 172, making 399,439 event bytes; stderr is empty. This is counter lag with the trailing events retained, not full accounting by the counter alone. Detailed artifact/timing bindings remain in the parallel worker120 validation audit.

The strongest supported claim is retained successful replay of the selected union contents over reused inherited compiled imports, together with exact explicit-theorem axiom-output coverage and static source/base separation. It does not establish a fresh full-source build, official-checker admission, invocation-time imported-object identity, or mathematical/English completeness. Existing `Lean.Replay` qualifications about map collisions, already-imported matching theorem constants, unsafe/partial constants, axioms, and generated/private declarations remain conditional on source/binary correspondence. No historical timeout, return −9, failed snapshot, or pending source is upgraded by this audit.

Machine-readable inputs, hashes, exact target/base membership, wrapper comparisons, rejected snapshot versions, pending names, and source graph are recorded in `markov_worker_000120_replay_method_evidence.json`. The read-only static audit script is `audit_worker120_method.py`; its final input stability check reports zero changed inputs.
