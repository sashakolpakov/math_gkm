# Neutral harness validation report

46 tests passed in completed groups. Connected endpoint audit: **passed**.
Full four-round connected regression passed: **False**.
The long regression was bounded by this invocation deadline if interrupted; an
endpoint receipt does not convert an unfinished regression into a passing test.

Final executable/test bytes are pinned by pre-005/SOURCE_MANIFEST.json:
7e9ab7911641fd1c05b0266ef81a525bbde12ee77e6bde94830555a8227737b7.
The 26 earlier neutral regressions passed against pre-002:
50887c719b8b8f4ce3ba9103709494203996f643f9d5be20d18a0bc4e2ea7b6e.
Their broker/gate/engine/history code paths were unchanged afterward; later
root/inspector behavior received dedicated real-Lean coverage. Final documentation
and supplemental inputs are separately pinned in FINAL_SOURCE_MANIFEST.json.
Every pre-* directory retains immutable source copies, static dispositions and
a source manifest before that revision's execution. Earlier failures and
interruptions are retained, not counted as passes.

## Actual commands and results

All commands use the bounded neutral_validate runner (720-second outer bound,
per-validator shared timeout, per-child process/output bounds). Group JSON files
retain full argv, elapsed time, exit status, pre/post source checks and log SHA256.

- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_round2.BrokerTests", "tests.test_round2.EngineTests", "tests.test_round2.BoundaryTests.test_positive_and_real_false", "tests.test_round2.BoundaryTests.test_forged_receipt_and_source_binding", "tests.test_round2.BoundaryTests.test_project_dependencies_and_injection", "tests.test_round2.BoundaryTests.test_real_refutation_exact_target", "tests.test_controller_history"] → exit 0, tests 26, regressions-002.log
- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_context_revision.ContextRevision.test_continuation_foundation_compilation_replay_and_trace_theorem", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_cocartesian_family_map_and_its_universal_consumer"] → exit 0, tests 2, foundations-005.log
- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_context_revision.ContextRevision.test_canonical_root_and_foundation_cannot_be_substituted", "tests.test_context_revision.ContextRevision.test_residual_same_text_different_context_and_positive_discharge", "tests.test_context_revision.ContextRevision.test_task_absent_before_cannot_acquire_adapter_meaning", "tests.test_context_revision.ContextRevision.test_distinct_real_validations_charged_once_each_and_protected_sides", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_attachment_composes_and_missing_section_fails", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_before_can_solve_without_after_component_and_non_solution_is_explicit", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_hidden_premise_with_spoofed_empty_reports_rejected", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_lossy_representation_cannot_preserve_distinguished_predicate", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_true_proof_and_missing_premise_are_different"] → exit 0, tests 9, identity-005.log
- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_context_revision.ContextRevision.test_finished_completion_reused_without_new_allowance", "tests.test_context_revision.ContextRevision.test_only_actual_open_obligations_select_open_branch", "tests.test_revision_static_checkpoint.PureMechanisms"] → exit 0, tests 8, recovery-005.log
- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_context_revision.ContextRevision.test_audit_corruption_does_not_change_actual_fixture_requests"] → exit 0, tests 1, invariance-005.log
- ["/opt/homebrew/bin/python3", "-m", "unittest", "-v", "tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request"] → exit 130, tests None, connected-005.log

The separately pre-audited endpoint command was
/opt/homebrew/bin/python3 .scratch/neutral_endpoint_audit.py.
Its 11 assertions require actual family admission/reuse, residual discharge,
paired two-round trial eligibility, independent fixture review/selection,
experimental installation, a completed NEXT ACTUAL researcher subprocess, and
retention/exclusion of an invalid draft. See connected-endpoint.json.
These roles are deterministic fixtures, not autonomous scientific discovery.

## Established scope

Original-context target modules bind proposition meaning before adapter imports.
Reductions use captured residual constants in their antecedent; discharges require
a checked bridge to those exact constants. Canonical root/foundation substitution,
missing-before target vocabulary, changed-context discharge, hidden premises,
missing section laws and lossy maps are covered by real Lean negatives.
The original strengthened actual-premise inspector and exact-root audit gate
remain mandatory. Large inspector catalogs use complete bounded hashed artifacts;
no premises or declaration bodies were omitted to obtain passes.

ResearchSemantics and ContinuationObligations compiled and kernel-replayed.
WholeSemantics has an every-step recurrence; continuation_eq_run and
ImplementationBinding.whole_trace connect local simulation to every trace prefix.
modelBinding is inhabited. This is a verified generic MODEL, not a host bridge or
a proof that a replacement improves the complete research continuation.

Resource pools protect equal branch opportunities, validation limits and delayed
research horizons; distinct real validation operations have distinct charges and
recovery reuse does not charge twice. Required constants means all listed
constants for component-use credit, while old direct proofs remain admissible.
Accepted-module snapshots exclude preserved failed drafts. The experiment is
fixed-round/equal-upper-cap, not a matched-actual-cost efficiency comparison.
Protocol attempts have a separately reserved 30-second bound per attempt;
installation and controller wall are separately observed. Overlapping times
must not be summed or called provider-normalized costs.

The audit records SAME root/reference tasks under bound old/enlarged accepted
dictionaries, conditional partial derivation/residual descriptions, introduced
dictionary/adapters/connecting-proof overhead, and unknown proof remainder.
Cumulative witness bytes against the initial dictionary remain a separate audit.
All scheduled observations, missing points and costs remain visible. No shorter
description implies an easier proof, no forced drop is required, and no proxy
enters acquisition or selection. Actual subprocess/Lean audit-invariance passed.

## Remaining obligations and next checks

- Resource limitation found in final source review: ordinary episodes prepay their research/validation horizon, but do not prepay the concluding episode evaluation/reviewer/selector at episode start. Those operations obtain separate pools later and can fail for lack of remaining call/meta/time headroom. Policy-comparison branches do protect their paired downstream allowance. Full P4 protection therefore remains PARTIAL; do not describe ordinary episodes as completion-guaranteed.


- Finish the full four-round connected regression in a NEW neutral fixture if its
  group is incomplete; never resume the interrupted fixture or an old campaign.
  Exact command is in connected-005.json.
- Terminal-export fault injection and the full interruption/deployment containment
  matrix remain incomplete. Finished completion-receipt/no-headroom recovery,
  orphan intent recovery and ordinary audit invariance are tested.
- No concrete Python/OS/Astra refinement, timed-environment coupling, whole-incumbent
  utility comparison, or guarded certified executable switch is supplied.
- Live independent curation, provider behavior, full dependency-tree attestation
  and portable deployment are not established by fixtures. Fixture freeze mocks
  dependency-tree hashing, explicitly; actual Lean/compiler/checker and their
  binary hashes are used by mathematical validation.
- Independent supervisor whole-source review remains appropriate. The supervisor
  owns versioning. No Git, publication, external messaging, downloads, dependency
  writes, live authorization, live model roles or Markov research occurred.
  Explicit USER OK AFTER this report is still required for fresh Markov work.

RETAINED_ARTIFACT_MANIFEST.json indexes exact staged sources, receipts, requests,
snapshots, reports and logs under .scratch. Preserve those indexed files when
archiving; the source manifests also retain immutable copies.

Additional executed observer command (exit 0): /opt/homebrew/bin/python3 -m machinery.study_burden --study .scratch/revision-lean-fphi3c0q/connected --output evidence/neutral-validation/connected-audit. Result: 10 scheduled records, 3 known cumulative witness encodings; conditional-paired.json separately binds old/enlarged theories. Missing scheduled points remain explicit. See connected-audit.log.
