# Acceptance completion report

**49 distinct supported neutral harness tests have passing evidence for the final
source, using affected reruns and the unchanged-path arguments below.** There
were 50 passing test executions and one retained initial fixture failure. No
test was skipped, weakened or silently removed. This is scoped harness acceptance,
not completion of the actual-host or certified whole-continuation requirements.

All 14 lifecycle tests and three Lean tests in test_study_v2 remain active under
load_tests. The support class no longer inherits test methods into the Lean class.
The full supported selection contains 49 unique IDs, with no duplicated expensive
tests from imported TestCase classes. docs/REGRESSION.md provides the five bounded
test commands, a fresh checkpoint command, fixture replacement map, historical
exclusions and exact distinction between deterministic roles, real Lean and live
transport. Actual test IDs and argv are in ACCEPTANCE_VALIDATION_SUMMARY.json.

## Results and preserved failure

The first lifecycle run completed 17 tests: 16 passed and the watchdog fixture
failed while waiting for a nonexistent round-0000 process. Both current arms
start with plan-0000; the sleeping proposer correctly timed out before authorizing
a researcher. The retained log and actual proposer receipt establish this fixture
error. No runtime gate was changed. The corrected test kills the real controller
during that first proposer, checks the inherited lock while the watchdog runs,
waits for its bounded receipt and lock release, then recovers without duplicate
calls, receipt mutation or charge. Its rerun passed. The review-interruption test
also passed with stronger assertions for exact frozen inputs, unchanged reviewer
receipt and exactly one selector call/meta-call/charge. Real STOP/resume and
duplicate-lock checks passed in the original current-source lifecycle run.

The Toy positive uses a frozen ToyContext independently of the adapter. Actual
Lean results preserve correctness versus use credit: a newly invented helper can
prove an independently meaningful target without frozen-helper credit; a target
absent from its original context cannot acquire meaning from adaptation. A missing
task.required_constants entry denies use credit but does not invalidate an otherwise
correct proof. A missing separately supplied required= constant fails actual premise
inspection. The exact-root negative uses an unrelated True theorem because the old
natural-identity theorem would prove this neutral root by definitional equality.
acceptance-toy-disposition.json binds all nine result artifacts. No mathematical
gate or Lean foundation changed.

The fresh connected run completed four rounds, reviews at rounds 2 and 4, and
28 deterministic role receipts. It retained real checked component/family reuse,
delayed reuse, original-context residual discharge, finite strategy comparison,
experimental program selection and reverse_agenda in the subsequent actual fixture
request. The root remains open and certified_switch is false. These are mechanism
results, not live scientific progress, causal indispensability or a switch theorem.
acceptance-connected-disposition.json binds the exact state/decision/request.

## Observer qualifications

Every available endpoint is validated/measured independently even when its immediate
predecessor is missing, including a final/terminal witness. Missing comparisons and
overhead deltas remain unknown, and no plot line bridges the gap. The new negative
test also proves that a missing predecessor cannot bypass terminal receipt checking.
Raw observations and all scheduled missing points remain retained. The 11-test
observer group passed, including source/receipt mutation, exact-budget real evaluation,
unused-route invariance, and the two new reporting cases.

A direct completed root proof is receipt/source-bound mathematical resolution,
but its encoding is unmeasured unless represented through a supported checked
reduction-ledger route. The direct proof bundle is not a per-witness encoding in
this observer. An unwitnessed/unknown encoding is not unresolved mathematics and
does not establish a lower bound. Supported route descriptions, explicit unknown
residual proof holes, cumulative storage and introduced overhead remain separate.
Minimum complexity, proof difficulty and unknown reference-panel encodings remain
unknown. No universal complexity estimator or reward was introduced. Actual
audit-invariance tests passed; audit outputs cannot guide research decisions.
Synthetic terminal receipts test serialization/binding only, not root admission.

## Source review and validation binding

The fixed mission/design/requirements, round-4 reports and independent reviews were
read before changes. acceptance-input preserves the starting source. Source diffs,
static dispositions and read-only pre-validation copies were saved before each
affected run. The supervisor's subsequently supplied LIVE_ACCEPTANCE_REVIEW.md is
an audit, not implementation, a proof recipe or authorization; it is retained.

- acceptance-pre-001: migrated suite, observer corrections and neutral storage
  collector. All five supported test groups ran on these frozen bytes.
- acceptance-pre-002: only two test method bodies and three reporting documents
  changed. Both changed methods were rerun. Static AST comparison proves all
  remaining test methods, support, imports and load_tests unchanged; every runtime
  and Lean source was byte-identical. The three reporting docs are not seed inputs
  or execution imports. This justifies retaining the other 47 passing tests without
  duplicating expensive Lean checks.
- acceptance-pre-003: only the packaging-only study_manifest generator changed.
  It now emits the complete bounded reproduction commands, includes all required
  checkpoint/review inputs and refuses to overwrite existing manifests. Its CLI,
  90 source pins, 49 distinct selected IDs and no-overwrite behavior were checked
  separately. This is not counted as additional unit tests. The generator is not
  imported by the tested controller/proof/observer paths. implementation() hashes
  it as inert source metadata; new studies bind those bytes with unchanged equality
  checks. No old study was resumed after the change.

Every completed group has zero post-run source mismatches. The final package matches
pre-003 for every included file. ACCEPTANCE_PROTECTED_BASELINE.json compares actual
pre-007 pins with current protected source and checks all prior validation log
hashes. Fixed mission/design, contracts, Lean foundations, compiler pins, permission
input and mathematical admission/completion/transfer gates are unchanged. Earlier
round-4 successes remain 27 passing executions / 24 distinct tests on their own
pins; earlier failures and interruptions remain failures and interruptions. Initial
Agoh/Markov campaigns were not rerun or resumed.

## Exact completed commands

Each unittest group was launched through machinery/neutral_validate.py with a
720-second bound, unique log label and its named checkpoint. The table gives the
underlying exact command; group JSON records also preserve elapsed time and hashes.
Durations overlap because independent groups ran concurrently; do not add them as
one wall-clock or research-cost measurement.

- **acceptance-connected-001**: 1 tests, exit 0, 560.063s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request`.
  Source manifest SHA-256: `223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f`. Log SHA-256: `73f74e2064ce001906f3ad7fd1aeddab3627d40a570b893a357f028bd463c805`.
- **acceptance-context-001**: 14 tests, exit 0, 320.784s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_context_revision.ContextRevision tests.test_revision_static_checkpoint.PureMechanisms`.
  Source manifest SHA-256: `223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f`. Log SHA-256: `4c9a007575f5fc94c18892f4f5d5d67573ec202d6424f19898ae0948fe6d5fa4`.
- **acceptance-lean-001**: 6 tests, exit 0, 102.262s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_revision_static_checkpoint.RealLeanMechanisms.test_true_proof_and_missing_premise_are_different tests.test_revision_static_checkpoint.RealLeanMechanisms.test_hidden_premise_with_spoofed_empty_reports_rejected tests.test_revision_static_checkpoint.RealLeanMechanisms.test_before_can_solve_without_after_component_and_non_solution_is_explicit tests.test_revision_static_checkpoint.RealLeanMechanisms.test_attachment_composes_and_missing_section_fails tests.test_revision_static_checkpoint.RealLeanMechanisms.test_lossy_representation_cannot_preserve_distinguished_predicate tests.test_revision_static_checkpoint.RealLeanMechanisms.test_cocartesian_family_map_and_its_universal_consumer`.
  Source manifest SHA-256: `223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f`. Log SHA-256: `d127d8cc5bd8af74412ac76030f3f3e1770d25d1f1f764d6c1294ac231ca11e7`.
- **acceptance-lifecycle-001**: 17 tests, exit 1, 661.315s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_study_v2`.
  Source manifest SHA-256: `223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f`. Log SHA-256: `620b3a5ca22368a8b9ec091fdad07c718432e8609f957b3e6127ae87fbf5f27e`.
- **acceptance-observer-001**: 11 tests, exit 0, 186.529s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_round4.Round4 tests.test_acceptance.ObserverAcceptance`.
  Source manifest SHA-256: `223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f`. Log SHA-256: `42f109854eceef68e036d911cf3a7c273e3f126341502e74c4b1741fcc7e262f`.
- **acceptance-recovery-002**: 2 tests, exit 0, 27.369s.
  Command: `/opt/homebrew/bin/python3 -m unittest -v tests.test_study_v2.StudyFixtures.test_killed_controller_watchdog_retains_lock_and_receipt_recovers tests.test_study_v2.StudyFixtures.test_review_interruption_reuses_committed_inputs_and_receipt`.
  Source manifest SHA-256: `f512234cf44162a38ac349d048eadd2f50654498b5335e74d4433f27e05b4416`. Log SHA-256: `689ab4d7ccbf2b76d0ec475e9b6d53d6f77f1b47a5e00339ba4c2987216e034d`.

Packaging check: `/opt/homebrew/bin/python3 .scratch/acceptance_packaging_check.py`; exact subprocess argv and results in acceptance-packaging.json.

## Reproduction and preservation

The installation manifest contains 90 current source/input pins, including required base permissions, fixed requirements and review inputs. It is a reviewable package, not an installation. Its SHA-256 is `eaf98c63b481228c4fb66f2e5f99159f9f0a48bfffa876c3e832e5414b275020`.

The new retained artifact manifest indexes 9798 files in 51 unique neutral directories. The archive `acceptance-neutral-artifacts.tar.gz` has SHA-256 `56a695a7d6adf54922bd8b4783adbf5356eec43ff159250f62596a8d4d5754b9`. Every archived file hash was checked against that manifest. Exact inputs, requests, receipts, extensionless history, source snapshots, failed attempts and compiler/inspection logs are retained; compiled caches are omitted and rebuildable. No earlier evidence was overwritten.

ACCEPTANCE_FINAL_SOURCE_MANIFEST.json and its SHA-256 sidecar bind the final
source copies, packaging scripts, report, review records and validation artifacts.
Use the installed pinned Lean/Mathlib and Python paths in this existing host
environment; no download or dependency edits are needed. Fixture dependency-tree
identity is explicitly mocked; actual compiler/checker binary hashes are in real
check receipts. This is not a portable cold bootstrap or host deployment attestation.
The system python3 shim and initial shell here-document setup failed before any
test/source mutation; their disposition is retained in acceptance-review/REVIEW.md.

## Requirements still unavailable

docs/REQUIREMENT_MAP.md gives requirement → producer → artifact → consumer → evidence
and status. O1 live independent external Astra transport and T1 live independent
curation are unvalidated; broad action/campaign results remain historical. The full
interruption/deployment matrix and hostile-code containment are not established.

Actual Python/OS/external-role refinement, whole-incumbent versus install-and-continue
utility/cost proof (including future switches, common time/deadline transport,
migration and justified environment coupling), and independently guarded certified
installation are OPEN, genuinely unavailable requirements. Generic checked model
theorems and accurate gap documentation do not fulfill them. Local evidence is
preserved; Git, installation and publication remain supervisor-owned and unperformed.

No live model, Markov researcher/curator/canary, new conjecture campaign, old campaign
resume, authorization file, dependency/package edit, Git, publication, messaging or
background service was initiated. Bounded watchdog subprocesses were exercised only
for the explicitly authorized neutral recovery tests. A later fresh Markov run
requires the user's explicit approval after this harness report.
