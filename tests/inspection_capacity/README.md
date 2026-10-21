# Inspection capacity validation record — 21 October 2026

The reviewed inspection-capacity repair passed 56 pure Python controls, 72 pure
operational controls, and five actual neutral Lean producer controls. The actual
controls passed on attempt 4 in 29.954 seconds: one neutral-module compilation,
one independent kernel replay and eight inspector invocations, with four
successful completions and four expected negative inspections. The earlier
failed attempts remain retained locally; their process logs are not part of
this public source-and-proof artifact.

The successful actual controls used the explicit three-file overlay for
implementation `bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa`
over the unchanged `7772dfef…` implementation. The operator subsequently confirmed
that the reviewed source transition was applied. This record reports engineering
controls; it supplies no new Markov theorem, proof admission or whole-campaign
rebuild. The producer boundary control uses 16 versus 2,000,000 raw edges; no
actual producer stress test above 200,000 edges is claimed.

The final actual runner SHA256 is
`7d284b69577f58d01e5be78889ccfbd92a6ac9ec620407627ab8860afbb84c27`;
the neutral fixture SHA256 is
`37fdd5d98868cd532cca6e57a01245c04df42c4e1888a36794ffe357d6947da8`.
The isolated forbidden axiom remains intentional negative-control input and
never belongs in a research seed. The selected public summaries retain counts,
source identities and outcome scope; private paths and live authority are
excluded. The original actual-result hash is
`1f487ee50c2cac18e5fb50f9f2af3b4830b250a6fa449b86b9436d98ab76058f`.

The original pre-execution notes follow verbatim as historical instructions.
Their “not yet executed” wording describes their preparation date, before the
results above. Their original SHA256 is
`aa83a73d92aa677e55d07c93e7f770efab33f21f9f721d603fd9c69742581dab`;
the canonical accepted checkpoint also retains those original bytes separately.

## Historical pre-execution notes

# Inspection capacity controls

The three checker replacements in `CAPACITY_SOURCE_BINDING.json` remain frozen:
implementation `bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa`
from baseline `7772dfefd0e76d355edbdcd1a1414a4fcaccb7ec1aa0d298de99b8d7e1f84aa3`.
Only raw per-root edges/duplicates increase to 2,000,000. Distinct dependency
nodes and declarations/catalog remain 200,000; Expr nodes 1,000,000; depth 4096;
artifact 32 MiB and line 1 MiB. Schema, semantic identity, complete traversal,
duplicate counting and all production resource/time/STOP limits are unchanged.
Historical recorded diagnostics retain their original bounds.

## Final relative install layout

Install the following reviewed test sources without changing their bytes:

```text
tests/inspection_capacity/run_pure_capacity_tests.py
tests/inspection_capacity/neutral_producer_controls.py
tests/inspection_capacity/test_inspection_capacity.py
tests/inspection_capacity/controls/MathGKM/InspectionCapacityNeutral.lean
tests/inspection_capacity/README.md                         (this document)
```

The pure runner reuses existing `tests/test_inspection011.py`,
`test_inspection012.py`, `test_deployment_receipt_reuse.py` and
`test_snapshot_catalog_cache.py`. It selects only their pure classes.
The three pinned historical baseline files come from
`evidence/concept-driver-source-20261020/source/machinery/` when a local stage
baseline is absent. All three hashes are checked, including `own_feedback.py`.
No disposable-stage files are needed by the installed layout.

Both runners resolve the repository from `MATH_GKM_CAPACITY_REPO`, or cwd when
unset, requiring `machinery/study_common.py` and `lean-toolchain`. Their default
source is that installed repository. `MATH_GKM_CAPACITY_STAGE` explicitly enables
the reviewed three-file source overlay for staging only. The neutral Lean fixture
is always located relative to its runner, rather than a user home or stage name.

## Pure controls

From the repository root after installation:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 tests/inspection_capacity/run_pure_capacity_tests.py
```

For the existing temporary stage, set `MATH_GKM_CAPACITY_STAGE` to its directory
and run that directory's `run_pure_capacity_tests.py` from the validated repo root.
The 56 pure tests block subprocess creation and cover parser boundaries/counts,
exact producer-source delta, feedback history, nonce/hash/source/FINISHED
bindings, catalog/deployment identity and portable baseline/layout resolution.
They are synthetic engineering controls, not mathematical admissions.

Results/logs go into one fresh `math-gkm-capacity-pure-*` tempfile/TMPDIR child;
fixture scratch is removed. The printed `RESULT_DIRECTORY` identifies the bounded
result files for review. No tracked test directory is used for generated output.
The original pre-portability bootstrap failure occurred before any test because
namespace paths have no `insert`; only the runner overlay was corrected.

## Actual producer controls — not yet executed

Only after the operator confirms parent/keeper/heavy-lease quiescence and approves
execution, run from the repo root:

```sh
GKM_CAPACITY_QUIESCENT=reviewed PYTHONDONTWRITEBYTECODE=1 python3 tests/inspection_capacity/neutral_producer_controls.py --run
```

For staging, add the explicit `MATH_GKM_CAPACITY_STAGE` overlay and invoke the
stage's same runner path. Repository resolution can instead be explicit through
`MATH_GKM_CAPACITY_REPO`. All output goes into one fresh
`math-gkm-capacity-neutral-*` tempfile/TMPDIR child, printed at startup. `STOP` in
that output directory (or the explicit stage) is checked between commands;
already-running commands retain their process guard and timeout.

The runner refuses actual execution without the quiescent flag. It uses official
process admission/resource guards and sandboxing: one neutral-module compile,
one independent replay, eight sequential inspectors, at most one external process
at a time; 120 s/1 MiB per command, at most 1,200 s aggregate command caps. It changes
no resource limits. The negative fixture's axiom is isolated test input and must
never enter a research seed.

Five actual controls compare complete reported old/new closures/catalog identities,
test shared raw-edge/duplicate counts, find a forbidden axiom after a scaled low
cap, reject a required constant absent from root closure, and test nonce,
same-size stream corruption, source and FINISHED bindings. The producer low cap
is 16 versus production 2,000,000: no actual >200,000-edge stress run is claimed.
Real numeric boundaries are tested by the offline parser controls. No actual
producer result, fresh proof replay or mathematical acceptance is claimed yet.
