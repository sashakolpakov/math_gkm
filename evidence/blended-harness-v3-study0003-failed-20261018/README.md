# Study0003: failed proposer plans

The neutral setup checks passed. The autonomous exploration arm then produced two invalid plan payloads and stopped at round0: **no mathematical action, no theorem admission, and no baseline run**. This archive provides debugging evidence, without claiming Markov progress or an exploration/baseline comparison.

It preserves the original payloads, prompts, events, validation failures, source-bound setup receipts, both arm states, operator versions/reviews/launch records, seed/pins and70 exact implementation sources. [VERIFICATION.json](VERIFICATION.json) records independent streaming hash, source and outcome checks; [MANIFEST.json](MANIFEST.json) maps all342 source members. No compiled outputs or dependency caches are included.

The two-task held-out suite and all curator originals remain private and intact locally for reuse. Only their40 file hashes, sizes and provenance are public. The archive and sidecar were checked for exact held-out task/selection fields and common credential/private-endpoint patterns, with zero findings; private contents were not printed. Public reproduction can debug the parser and original plans, while held-out evaluation requires the unreleased private originals.

The original failed archiver is retained alongside its corrected v2. Its first check confused the raw JSON file hash with the canonical suite digest; the suite itself had not changed. No archive was written by that failed v1 invocation.

The run used [public007 source commit0a19d257](https://github.com/sashakolpakov/math_gkm/commit/0a19d25710a497cf3fd171fa40225bd82e236822). Retain the earlier [007 resource evidence](../blended-harness-v3-pressure-20261018/README.md) and [installed006 validation](../blended-harness-v3-installed-20261018/VERIFICATION.json) for its source and reproducibility context. Original host paths in receipts are provenance; dependencies and compiled objects must be regenerated in a fresh workspace.

Archive SHA256: `01408a7a47aeec0d7930864589c13539c2aecb7cb82f0d00402522449f0029df`.
