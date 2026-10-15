# Worker 000070 validation binding audit

Completed worker `000070`, request `b485717c0c2e4ae9b5526ee78a83dc99`. Read-only supporting audit for `/root/gkm_reassessment`; mathematical statement and finite-experiment review is separate.

**Result: nine final mathematical modules / 29 named theorems have matching successful compilation and alternate-driver kernel replay records.** The dedicated axiom-inspection module covers every named theorem exactly once. All 98 indexed artifacts agree with current bytes, archived worker copies and controller receipt hashes. No source/object or accepted-record mismatch was found.

No project code was executed/imported, no proof or experiment was rerun, and no project files were edited. The proposer and active successor were not contacted.

## Module records

| Module | Named theorems | Build seconds | Alternate replay seconds |
| --- | ---: | ---: | ---: |
| MarkovCutActivityB485 | 4 | 21.619 | 15.615 |
| MarkovActivityFormulaB485 | 6 | 10.043 | 14.287 |
| MarkovActivityFailureB485 | 5 | 14.013 | 17.825 |
| MarkovGeometricWordB485 | 2 | 10.683 | 15.506 |
| MarkovGeometricSlice3B485 | 2 | 70.564 | 14.691 |
| MarkovGeometricSlice4B485 | 2 | 102.523 | 13.065 |
| MarkovGeometricSlice5B485 | 2 | 102.653 | 15.675 |
| MarkovGeometricFailureB485 | 4 | 18.153 | 12.854 |
| MarkovGeometricSourceB485 | 2 | 13.741 | 21.200 |

For every row, the manifest source SHA256 equals the current source, successful build's source hash, successful replay's source hash, and both saved `.lean` snapshots. Both subprocess return codes are zero. Each replay's stdout is exactly its expected `replay begin` and `replay passed` pair; stderr is empty. Final `.olean` hashes match `artifacts.json`, the controller's archived object and its receipt. Full exact hashes, paths, commands and outputs are in the adjacent `summary.json`.

The initial failed CutActivity and ActivityFormula builds are not accepted. Their `sorryAx` diagnostics belong to unsuccessful elaborations with different source hashes. The first GeometricSlice5 build timed out at about 120.206 seconds, but its unchanged source subsequently compiled successfully in 102.653 seconds and separately replayed successfully. No timeout is counted as a pass.

The final replay command is `lean --run research/ReplayKnown6d2c.lean <module>` using the pinned Lean 4.32.2 path. The driver source hash is unchanged:

`18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.

These are **alternate-driver kernel replays**, using the already audited pinned default per-module replay body; they are not successful official `leanchecker` CLI receipts. Imports are reused, not freshly rebuilt or transitively replayed. Individual records bind source snapshots; their final object and driver identification is supported by the manifest/archive comparisons, not separate per-invocation immutable environment hashes. The method's exact limitations are documented in `markov_worker_000065_replay_method_audit.md`.

## Axiom closure coverage

`research/MarkovAuditB485.lean` imports all nine modules and has exactly 29 `#print axioms` commands. This list exactly matches the 29 distinct named theorems in the nine final sources: no omitted theorem, duplicate print or extra theorem was found.

The inspection module's source SHA256 is `688a026f04fc993ffc1abb85a02035b32a9163ddf4a718ab4d2aecb7bc60739a`, matching its saved source snapshot and successful build receipt:

`evidence/markov-b485717c/run-MarkovAuditB485-build-1792028912464150000.json`.

That build returned zero in 21.610 seconds and printed exactly 29 closure results. Three theorems use no axioms; the others use subsets of `propext`, `Classical.choice`, and `Quot.sound`. No custom axiom or proof placeholder appears in the accepted closure output. The nine final mathematical sources also contain no `axiom`, `sorry`, `admit`, `native_decide`, unsafe/partial declaration or kernel-skip setting. The audit module contains no new mathematical theorem; its purpose is inspection, so it is not a tenth substantive result module.

This is a review of recorded closure output, independently matched to the inspected source list and archived evidence. No new closure invocation was performed.

## Finalizer failure and repair

The saved worker events at lines 190–197 show the first `finalize_b485.py` invocation failed with exit code 1 because it compared a contract file-byte SHA256 to the controller's canonical-JSON SHA256. These are distinct correct digests:

- file bytes: `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`;
- canonical JSON: `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

The worker recorded this in `evidence/markov-b485717c/finalizer-failure.json` and repaired its own finalizer. Current `research/finalize_b485.py` lines 36–40 check the file hash against the initial reconciliation record and the canonical JSON digest against the pinned canonical digest, separately. The second invocation completed with exit code zero, 98 artifacts and preservation “all matched”.

The failed invocation had written validation and operational-observation files before the assertion; preservation and final manifest writes occur after that point. The final successful invocation and final hash comparisons supersede those partial metadata writes. No mathematical source repair is attributed to this metadata fix.

`artifact-verification.json` has exactly 98 comparison rows with the same key set as `artifacts.json`. Every recorded expected hash and actual hash equals the corresponding manifest hash. Independent current and archive hashing confirms every entry. Both `artifacts.json` and `artifact-verification.json` themselves also byte-match their completed-worker archive copies. No unfinished comparison, absent artifact, or stale final manifest was found.

## Timing and preservation

The last module replay finished approximately at timestamp `1792028932.487528`; the axiom-inspection build finished at `1792028934.073932`. Both precede the final manifest modification at `1792029004.492587` and the completed-worker receipt at `1792029028.103483`. There is no observed late-replay or after-manifest ambiguity in the accepted records.

The protected root source hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; the worker receipt has `mathematical_resolution: false`. These validation results do not constitute a fresh whole-source rebuild or root-completion audit.

Evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000070_validation_evidence/` contains `summary.json`, `inputs.sha256.json`, reviewed text snapshots, and the saved finalizer-event excerpt. The outside-project analysis script is `audit_worker70_validation.py`. Objects were hashed, not rebuilt or copied as a new proof environment.

All **103 inspected inputs remained unchanged** at `2026-10-15T01:55:52.178148+00:00`. There were zero hash mismatches.
