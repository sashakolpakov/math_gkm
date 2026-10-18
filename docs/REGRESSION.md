# Current repair-004 source checkpoint

Current changed-source validation is incomplete: tests_run=false. Historical
results below retain their own source/date scope. The actual checkpoint003
six-pass/one-error pure run and two failed direct diagnostics are preserved.
Use docs/STUDY_V3.md, CONSTRUCTION_V3_AUDIT.json and source-audit-004's sequential
VALIDATION_PLAN.json; independent source review precedes all execution.
No old 49-test evidence is current V3 acceptance. D1/D2/D3 remain OPEN.

# V3 validation hold

Repair-003 sources and exact sequential commands are in `CONSTRUCTION_V3_AUDIT.json`
and `docs/STUDY_V3.md`. Current acceptance is **NOT RUN**. Use only the new frozen
manifest with a matching protected source review. Earlier counts and parallel
instructions below are historical; all V3 heavy validation is sequential.

The V3 source manifest and `CONSTRUCTION_V3_AUDIT.json` supersede the execution
instructions below. No tests have run on V3. First independently review the
frozen sources. Use `machinery.v3_validate` with the supervisor-owned review
binding; run each planned group sequentially. Never run the broad historical
49-test suite in parallel. Old results are historical, not V3 evidence.

# Historical harness regression plan

Run from the workspace root with the existing pinned dependencies. Use
`/opt/homebrew/bin/python3`; the system `python3` shim is unavailable on this host.
No download, dependency modification, authorization file or live transport is
needed. Temporary inputs and logs remain under `.scratch`. The fixture tree
identity is mocked explicitly; Lean compilation, kernel replay and premise
inspection use the real pinned binaries. This does not attest a deployed host.

The supported complete **neutral study-harness suite** is the union below:
49 distinct tests, each selected once. It is not repository-wide discovery.
`test_study_v2.load_tests` selects 14 lifecycle and 3 Lean tests; its support
class has no tests, and its Lean class no longer inherits lifecycle methods.
Other modules import modules rather than exposing imported TestCase classes.

After reviewing current changes, create a new immutable checkpoint (choose an
unused name in place of `reproduce-current`), then run these bounded groups:

```sh
/opt/homebrew/bin/python3 machinery/neutral_checkpoint.py reproduce-current 'Reviewed current source before neutral validation'
/opt/homebrew/bin/python3 machinery/neutral_validate.py reproduce-current reproduce-lifecycle tests.test_study_v2
/opt/homebrew/bin/python3 machinery/neutral_validate.py reproduce-current reproduce-context tests.test_context_revision.ContextRevision tests.test_revision_static_checkpoint.PureMechanisms
/opt/homebrew/bin/python3 machinery/neutral_validate.py reproduce-current reproduce-observer tests.test_round4.Round4 tests.test_acceptance.ObserverAcceptance
/opt/homebrew/bin/python3 machinery/neutral_validate.py reproduce-current reproduce-lean tests.test_revision_static_checkpoint.RealLeanMechanisms.test_true_proof_and_missing_premise_are_different tests.test_revision_static_checkpoint.RealLeanMechanisms.test_hidden_premise_with_spoofed_empty_reports_rejected tests.test_revision_static_checkpoint.RealLeanMechanisms.test_before_can_solve_without_after_component_and_non_solution_is_explicit tests.test_revision_static_checkpoint.RealLeanMechanisms.test_attachment_composes_and_missing_section_fails tests.test_revision_static_checkpoint.RealLeanMechanisms.test_lossy_representation_cannot_preserve_distinguished_predicate tests.test_revision_static_checkpoint.RealLeanMechanisms.test_cocartesian_family_map_and_its_universal_consumer
/opt/homebrew/bin/python3 machinery/neutral_validate.py reproduce-current reproduce-connected tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request
```

Each runner bounds its unittest process to 720 seconds and records exact argv,
manifest hash, elapsed time, exit status, log hash and post-run byte comparisons.
The five groups select 17, 14, 11, 6 and 1 tests respectively. Independent groups
may run concurrently in their unique directories; allow CPU headroom for Lean.
A timeout is incomplete validation, never a pass. Use new checkpoint and log
labels for every changed source or rerun; old evidence must remain intact.

Lifecycle roles are deterministic subprocess fixtures. The killed-controller
test uses an actual controller and watchdog, with only dependency-tree identity
mocked consistently in the child. Some lifecycle tests also invoke real Lean
for the neutral holdout or strategy trial. The six Lean tests and connected
cycle use real compilation/replay/premise checks. Observer terminal fixtures
inject synthetic receipts to test serialization/binding only. The live argv
test constructs arguments and permissions without executing model transport.
No test in this suite starts a live LLM or exercises a Markov target.

`test_boundaries`, `test_round2`, `test_controller`, and
`test_controller_history` belong to earlier implementation/campaign evidence.
They are outside this supported study-harness command; their historical results
do not establish current-source validation. Do not use unqualified repository
discovery as a substitute or launch old campaigns to reproduce this suite.

## Legacy fixture replacement map

All 14 lifecycle scenarios remain in `StudyFixtures`, using the neutral root.
The clean-seed test is renamed from `legacy_contract_unchanged` to
`neutral_contract_unchanged`: it checks equal seeds and the exact neutral contract;
historical campaign-contract claims remain only in their old records.
Stop/removal/resume and duplicate lock exclusion, killed controller/inherited
watchdog lock/receipt recovery, and reviewer-before-selector interruption all
retain their named tests and actual process/state paths. Orphan-intent tests
are additional coverage, not replacements for these cases.

The three `LeanTransferFixtures` tests remain active. The Toy positive now
imports a separately frozen `ToyContext` for target meaning. Its adaptation
case has two explicit dispositions in the same test: an independently captured
target can be correct without credit for a newly invented helper; an absent
target cannot get meaning from the adapter and is invalid. Missing
`task.required_constants` means no component-use credit, while missing
`required=` fails mandatory inspector closure. Both are exercised separately.
The unrelated-root negative now uses `True`, since Toy's natural identity
would itself prove the neutral identity root by definitional equality.

New runs retain unique inputs and full check directories instead of overwriting
`evidence/revision-validation` or deleting temporary fixture workspaces. The
legacy source-storage collector now obtains the root path from the contract;
it remains storage-only, separate from the conditional witness observer.

See `ACCEPTANCE_REPORT.md` in `evidence/neutral-validation` for the actual final
counts and source bindings. These commands specify supported coverage; they do
not by themselves claim that a run passed.
