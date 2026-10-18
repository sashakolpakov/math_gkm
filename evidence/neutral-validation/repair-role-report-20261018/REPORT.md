# Role/report interface repair — construction

Result: all selected checks passed.
The only changed production function is machinery/study_policy.py::prompt.
An honest plan describes intended work in agenda, summary and hypothesis
claims/outcomes with use_links empty. Each role now gets its own payload schema;
the proposer is no longer given an execution-only binding requirement. Both
proposer and researcher are told that artifact and consumer must already be
files, evidence needs real hashes, and accepted reported links remain unverified.
The prompt also distinguishes checked controller records from report link input
and lists the already supported fiber_gluings researcher submission field.

No validator relaxation, fake endpoint, report correction/retry, state migration,
receipt rewrite, budget change or mathematical change was made. Static AST
comparison confirms all study_policy code outside prompt is unchanged. Every
other pre-existing checkpoint source is byte-identical to this repair's input.
The added test module checks the actual existing gates and prompt/role boundary.

## Reviewed source and installation inputs

- `machinery/study_policy.py` — SHA-256 `eff09fc74ce47a7db26205cafdbca401015effbe21ceb11c0f22a3079c9c1f93`; previous: `8a2d7aaa5f05aa5682d7fb45fc7bef642d49899515697a38c6870b70c109eef2`.
- `tests/test_role_report_contract.py` — SHA-256 `f164857acdbb0b47da6fbaf739005a6e465b7768a070a78fe6ffb77396ef7d88`; previous: `new file`.

These are the complete installable source changes. Use the exact immutable
pretest/sources copies and compare destination predecessor bytes before applying.
New file means absent in the repair input; supervisor must check the installation
destination. SOURCE_CHANGES.diff is the reviewable patch; STATIC_REVIEW.json lists
unchanged inputs. Install neither generated fixtures nor dependency symlinks.
The evidence directory is a separately named repair record, not a replacement
for any earlier acceptance manifest/report. Its files and the copied input,
pretest and final source snapshots are enumerated in FINAL_MANIFEST.json.

Pinned inputs: leanprover/lean4:v4.32.2; Mathlib revision
905b95818eb32af7874a58b427f50c1711a5e96c. Exact lake-manifest.json,
lakefile.toml, lean-toolchain and base-permissions hashes appear in the source
manifests. Dependencies remained read-only; no update/download or Git operation.
Existing real Lean/checker paths are pinned by machinery/trust.py. Fixture
dependency-tree identity is mocked; this is not a deployment attestation.

## Pre-test audit and source checkpoints

AFFECTED_PATH_AUDIT.md was saved before tests. It traces request/prompt, worker
envelope, commit/record, main and paired-branch execution, checked ingestion,
review/selection, cached receipts and protected budget pools. It explains the
design choice and selected positive/negative/connected regressions. All four
required documents were read before edits. No live study, mathematical plan,
old research contents or external project was inspected. No model or curator
was invoked; no campaign authorization artifact was created.

- Input manifest: input/SOURCE_MANIFEST.json, SHA-256 `5934873b7467b9a07456b393aa155d098dbf261db3841400b5f27e3fc20cfe97`.
- Pre-test manifest: pretest/SOURCE_MANIFEST.json, SHA-256 `39648f6fffe0627f84dd54345d3fe92e7bc8213ed087f0e360e25fddf968f2f4`.
- Final source manifest: final/SOURCE_MANIFEST.json (same tested source bytes).

capture.py input, capture.py pretest and capture.py final were each run using
/opt/homebrew/bin/python3 with GIT_CONFIG_NOSYSTEM=1,
GIT_CONFIG_GLOBAL=/dev/null and PYTHONDONTWRITEBYTECODE=1. The static comparison
was run as /opt/homebrew/bin/python3
evidence/neutral-validation/repair-role-report-20261018/review_sources.py.

## Exact validation commands and results

Run from the candidate workspace root:

```sh
env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null PYTHONDONTWRITEBYTECODE=1 TMPDIR="$PWD/.scratch" /opt/homebrew/bin/python3 machinery/neutral_validate.py repair-role-report-20261018/pretest repair-role-report-20261018/focused tests.test_role_report_contract tests.test_revision_static_checkpoint.PureMechanisms
env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null PYTHONDONTWRITEBYTECODE=1 TMPDIR="$PWD/.scratch" /opt/homebrew/bin/python3 machinery/neutral_validate.py repair-role-report-20261018/pretest repair-role-report-20261018/lifecycle tests.test_study_v2
env PATH=/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null PYTHONDONTWRITEBYTECODE=1 TMPDIR="$PWD/.scratch" /opt/homebrew/bin/python3 machinery/neutral_validate.py repair-role-report-20261018/pretest repair-role-report-20261018/connected tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request
```

| Group | Completed tests | Exit | Wall seconds |
| --- | ---: | ---: | ---: |
| focused | 13 | 0 | 0.186 |
| lifecycle | 17 | 0 | 672.753 |
| connected | 1 | 0 | 542.737 |

focused includes seven new report-contract tests and six existing PureMechanisms
tests. lifecycle is the supported 14 lifecycle plus three real Lean tests.
connected is the existing full neutral cycle with actual Lean compilation,
kernel replay and premise checking, delayed reuse, matched branches,
experimental selection and consumption by the next actual fixture researcher.
The lifecycle group includes a fresh paired neutral study. Both longer groups
ran concurrently in separate directories. All selected tests use neutral
fixtures; deterministic roles do not measure opaque model compliance. The full
49-test supported suite was not rerun; validation targets the affected paths.
The unchanged runner bounds each group to 720 seconds and records pre/post source
comparisons; no source mismatch was reported. No test gate or Lean check was
replaced for this repair. Existing tests explicitly mock dependency-tree identity.

Raw focused.log, lifecycle.log, connected.log and their JSON receipts are retained.
VALIDATION_SUMMARY.json records exact test IDs, argv, exit status, elapsed times
and hashes. RETAINED_ARTIFACTS.json binds fresh fixture requests, receipts,
Lean checks and protocol invocations; dependency symlinks are listed, not followed.
DIAGNOSTICS.md preserves the blocked zsh heredoc and missing exploratory filename
errors. These commands failed before doing validation; the saved static script
subsequently completed. Expected negative protocol outcomes are passes only
because the tests assert rejection. No failed command was relabeled successful.

## Supported recovery and remaining gaps

The supervisor must review/install the exact source, then start a separately
named fresh paired study with its appropriate independently bound setup. No live
study was started here. The old plan-0000 completed receipts are immutable:
--resume reuses them and repeats semantic rejection. Installing this prompt does
not repair cached payloads or change old seals. Do not delete/rewrite receipts,
fabricate endpoints, transplant old plans or replay unaccounted calls. The new
cached-invalid-plan test confirms unchanged receipts and no duplicate calls or
charges across state reloads. No bounded correction feature is implemented.

Existing uncertain-effect recovery remains fail-closed; the lifecycle tests
cover specific stop/watchdog/reviewer transitions, not all host interruptions.
A future proposer can still violate the explicit contract and be rejected.
Protected evaluation/review budgets and original diagnostics remain intact.
Opaque live compliance is untested. Python/OS/Astra host refinement, the concrete
whole-incumbent continuation utility/cost proof, time/response coupling and
independently certified installation remain open. This experimental repair is
not a certified Goedel self-switch and establishes no new mathematics.
