# Adapter017 restart validation

This packet contains the current adapter-interface repair and a newly authored neutral engineering preflight. It contains no data, task, answer or proof from the removed invalid comparison. Existing production repository sources are the canonical prerequisites; only the five changed source/test files are duplicated under `source_current/` and their prerequisite hashes are listed in `CORE_PREREQUISITES.json`.

The repair specifies the adapter envelope and canonical inner `solutions` map, supports exact legacy task-ID maps, rejects malformed submissions before the checker, preserves proof strings and provenance, and permits the ordinary task ID `solutions`. Proof, context, premise, transport, comparison-utility and resource gates are unchanged.

## Reproduce

From the repository root, first verify this packet and run the seven synthetic tests:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 evidence/adapter017-restart-validation-20261019/verify.py
mkdir -p .scratch/protocol016
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s tests -p test_adapter_protocol016.py -v
```

The synthetic suite uses standard-library mocks and no model or Lean. For the recorded neutral proof and decline, rebuild against the existing pinned Lean/Mathlib installation and supported sandbox host:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 evidence/adapter017-restart-validation-20261019/REBUILD.py --out .scratch/adapter017-rebuild-fresh
```

The output path must be fresh. This helper invokes the unchanged real compilation, independent kernel replay, trusted premise inspection and FINISHED-binding checks under the existing resource limits. It uses the recorded own-model proposals and does not call a provider or rerun a research study. It was added for reproducibility; it was not executed during packet preparation. The already completed live preflight below provides the actual recorded gate evidence.

The pinned toolchain, production machinery and dependencies are prerequisites. `CORE_PREREQUISITES.json` and `neutral/IMPLEMENTATION_AT_TEST.json` identify their exact sources. No dependency caches or compiled objects are bundled.

## Actual observations

Seven current-source synthetic methods passed. One independently invoked Codex/gpt-6.1-sol/high adapter then completed in26.989seconds, returned the canonical schema and wrote a new neutral Lean module. Its elementary identity proposal passed4compilations,4independent kernel replays and trusted premise inspection. An explicit bounded decline passed3compilations,3replays and inspection as a valid non-solution; it did not prove its target. Both complete source-only FINISHED bundles and the exact worker response/proof source are included. No utility score, research theorem or Markov result is claimed.

The neutral job's outer resource guard completed in60.298seconds without a limit failure. Observed peak charged footprint was293,647,296bytes; raw RSS1,442,840,576bytes is a separate measure. All77 protected source/config/pin files stayed unchanged. The independent closed review is under `independent/`.

The narrow source constructor timed out at120seconds. Its initial test run had two fixture mistakes that classified valid sole-ID canonical input as invalid; the constructor corrected those fixtures before timeout. The timeout and initial failures remain failed records. A separate final seven-method rerun passed. `constructor017/` retains new-task authorship, failure receipts and an explicitly limited event-metadata projection. Raw construction read outputs from predecessor context are excluded.

The actual live call was initially rejected before any process started. Checks established an entirely new neutral payload, denied access to the installed repository, and the configured OpenAI endpoint; the same unchanged command was subsequently approved. The payload/authorization audit records this distinction. A future hosted call requires fresh protected authorization; the reproduction commands above make no model call.
