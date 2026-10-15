# Worker 000101 historical replay method audit

Request `00a02b28b63542b5b3888c4b2b6f03ff` ended as a controller timeout. This read-only audit uses worker101 archived source/receipt bytes. Inherited source graphs come from the previously hash-bound worker100 audit only where each source hash equals before101; archived100 bytes were the only permitted fallback. All source dependencies resolved without mismatch. No current research/evidence or worker103 files were read, and no project execution or writes occurred. Controller timing, object/archive bindings and finalizer status are covered by the parent audit.

The final archived successful-build scope is 42 mathematical modules: 1,053 explicit theorems and 1,177 definitions. Successful replay covers 32 distinct modules, containing 713 theorems and 787 definitions:

| Retained successful check | Targets | Theorems | Definitions |
|---|---:|---:|---:|
| Individual OnsetColumns0–3, positions 1–5 | 20 | 680 | 780 |
| Union `1792087295638537000`: PenFalling and MiddleValue0–5 | 7 | 7 | 7 |
| Union `1792087426610749000`: OnsetAdapter0–3 | 4 | 24 | 0 |
| Union `1792087737175366000`: OnsetLow | 1 | 2 | 0 |

All selected archived source hashes match their receipts. One earlier eight-module union timed out, as did an early direct Columns0_1 attempt; those outcomes remain distinct from its later direct success. Parallel-replay summary files wrap the same ordinary direct receipts and are not additional kernel checks.

The ten compiled but unreplayed modules are `MarkovOnsetColumns4_1M00` through `MarkovOnsetColumns4_5M00` and `MarkovOnsetColumns5_1M00` through `MarkovOnsetColumns5_5M00`: 340 theorems and 390 definitions. They occur in none of the successful replay bases. Their compilation does not add replay evidence. The restricted source module `MarkovOnsetLowM00` is explicitly replayed; neither `MarkovResidualM00` nor `MarkovResidualLowM00` is a successful replay target.

The three successful union source bases have 555, 578 and 610 local modules respectively. The four-adapter union imports the twenty lower columns; OnsetLow imports those twenty plus the four adapters. They are assumptions within those invocations, with separate successful checks as listed above. No selected module or explicit target name is reimported in any inspected direct/union attempt, no target names are duplicated, and no source import cycle was found. Inherited source hashes match before101. No explicit-name duplication exists across all 42 finally compiled mathematical modules. External Mathlib source boundaries and private/generated compiled names remain outside this static inspection.

The archived audit inventory is an earlier 37-module snapshot with 883 named theorem entries. Five columns later built successfully are absent from that snapshot: 4_2, 4_3, 4_4, 4_5 and 5_5. Final validation lists 42 modules. `MarkovAuditM00` prints 13 selected public axiom closures, matching its public theorem list; it does not print all 1,053 theorem names separately. Audit declares no mathematical constants and is not a replay target. Neither stale inventory entries nor public-print counts expand successful replay scope.

Before101 driver hashes equal the established baseline, with no driver modification in the controller change set: ReplayBatch07F1 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, ReplayKnown6d2c `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. Union receipts cite the same batch hash. Archived union/validator wrappers equal worker100's after request-ID substitution. New queue wrappers run up to three 180-second direct calls or two 240-second direct calls; they do not alter the replay driver. The union wrapper uses its 120-second limit.

Direct validation snapshots source bytes before invocation; union source hashes precede invocation and driver hashes follow it. Neither records loaded object digests. Selected safe nonpartial declarations reach kernel replay; imports are assumed, axioms remain axioms, and unsafe/partial declarations are skipped. Duplicate imported-theorem metadata can bypass proof-body comparison, but no explicit-source target contamination was found. Pending dependency state is not a proof assumption. Static graphs and retained receipts do not establish compiled import tables, generated/private constant names, exact load bytes/times, a fresh inherited rebuild or an allowed-axiom policy. No later recovery results are credited to worker101.

Evidence: `markov_worker_000101_replay_method_evidence.json`, SHA256 `3209ac007ecb27f10c8821e15375eebca7ed44d6f43295d87b92d9a253ec3d9c`, includes exact checks, declarations, archived source versions and 132 directly read input hashes. Its inherited graph is transitively bound through the prior100 evidence file.
