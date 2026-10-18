# Prepared exact posthoc Astra verification — not executed

Purpose: root may retrospectively verify exactly the three mathematical claims delivered by Astra in baseline rounds 0001 and 0004 after the corrected checker has been independently reviewed and installed. This is a separate POSTHOC verification record, never original acceptance, a new research round, or a clean Astra/Sol comparison. No original or new study state is admitted or updated.

The runner is `/private/tmp/math_gkm_astra_posthoc_three_claims_20261018.py`. Its only writable production tree is the initially absent `/Users/sasha/math_gkm/.control/posthoc-astra-three-claims-20261018`. Old snapshots are copied there; no mathematical source is patched, no old compiled candidate object is reused, and no researcher role is invoked. Production checker code is imported only at eventual execution, with Python bytecode writes disabled.

Exact command, ONLY after root confirms installation and substitutes the independently reviewed installed implementation digest:

```sh
/opt/homebrew/bin/python3 -B /private/tmp/math_gkm_astra_posthoc_three_claims_20261018.py --execute-after-reviewed-install --expected-implementation-sha256 REVIEWED_INSTALLED_IMPLEMENTATION_SHA256
```

`REVIEWED_INSTALLED_IMPLEMENTATION_SHA256` must be the 64-hex canonical digest of production `study_common.implementation()` after review/installation. It is intentionally unavailable in this preparation. The script rejects the original broken `study_transfer.py`, a missing/wrong reviewed digest, an existing output path, or any original-task mismatch. A changed checker hash by itself is not proof of correctness; root's independent installation review is the external precondition.

## Read-only assumption audit

- The original receipt payloads contain exactly one claim in round 0001 and two in round 0004. Their `discharges`, extra dependencies and required-constant lists are empty. Thus reconstructing via `study_knowledge.task_for('mathematical_claims', item, original_contract)` and `study_transfer.bind_task(workspace, task, [item['module']])` follows the actual old ingestion path without needing any admitted state.
- Audit-owned JSON/text hashing (no import or execution of project modules) independently reconstructed all three original task hashes and keys. The companion static-bindings JSON records exact values. The eventual runner repeats these checks through the installed APIs and also compares original generated target/wrapper text and imported project source text.
- Same-round snapshots are verified with the existing `verify_snapshot`; their complete source maps must equal the corresponding closed receipt's `after` map. Original receipt, result, reservation, seed, seal and snapshot-manifest digests are fixed in the script. Each copied workspace must exactly match the same-round source inventory. Later-round source cannot be substituted.
- Original seed and toolchain/dependency content identities must match the old seal, including Lean and leanchecker. This can involve reading shared read-only package locations; there is no package installation, cache repair, package build or source write. Dependency hashing is separate setup overhead, not additional proof time.
- Each of the three calls is precisely `check_task(..., 120, live=True, required=(), contract=original_contract)`. The reviewed checker must retain actual source compilation, kernel replay and premise inspection. There is no fallback with `live=False`, budget extension, retry, fake result or call to `ingest`. Failure/timeout remains failure, not falsity or unprovability.
- All three tasks are reconstructed and authenticated before any proof check starts. The original failed result records remain untouched. Old state/STOP, source, reservation and check-source pins are sampled before/between/after checks; this establishes bounded observed identity, not continuous filesystem immutability. New Sol state/workspaces are never inspected.
- The entire script has a 900-second operational wall-clock alarm, encompassing setup and final rehashes as well as three 120-second checker budgets. The custom alarm exception is not swallowed by the checker's OSError handler. The existing process wrapper's `finally` kills/reaps its active process group on an exception. Any failure retains a tagged aborted summary and stops; it does not repeat the run or overwrite its directory.
- Running this after a new installation changes the verification mechanism and execution time. Even a successful result supports only the exact original proposition checked post hoc. It cannot retroactively make the old run's comparisons valid, prove scientific usefulness, resolve source/English correspondence, or establish the root conjecture.

Static preparation consisted of reading the operational APIs and original retained records, reproducing their task/key digests with audit-owned hashing, and parsing the runner's Python AST. The runner, installed APIs, Lean, checker and tests were not executed. This is not a functional pass claim. The repaired checker was still pending independent installation confirmation when this file was prepared.
