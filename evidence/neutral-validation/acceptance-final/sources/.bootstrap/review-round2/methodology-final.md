# Independent P/T/S/K final source review — round 2

NOT_ACCEPTED_AS_COMPLETE; three substantive acceptance issues plus continuation-budget gap; static review only, not runtime validation.

Observed 2026-10-17T22:12:41.865252+00:00. Builder manifest: `c1c945c2228cd13af34e337182fbd7755d48d82f101fb47d1c06c6e0ff085778`. Final source pin set: `ba042950c4bc2c733f0ff9724d4c23b0e9dce753954e2c929850e6b10779f278`.

Read source, static text diffs and file hashes only. No candidate import/execution, Lean/checker/proof/experiment/test/model/curation run; no candidate/live/collatz edits; no builder/researcher contact or new delegation.

The connected loop is substantially implemented. The final source is not ready to be described as satisfying every requirement: residual and task meanings are not adequately bound, and the conditional-burden instrument measures a narrower quantity than requested. No execution result is claimed.

## Outstanding findings

### B1: Residual discharge is textual, not semantic

**must_fix_before_acceptance** — M3, K1, K2.

The residual ledger stores an explicit proposition string but not its elaborated proposition and contextual meaning. A later mathematical_claims entry marks it checked solely when the statement string matches. Source-retention guards protect earlier files, but they do not establish that the same text elaborated in a different importing module has the same meaning. Added names/notation/context can differ without replacing retained files. Reuse of the same residual id also compares statement text only.

The next request and burden report can treat a residual as discharged without a checked bridge to the antecedent of the original reduction. This does not demonstrate false exact-root completion, which has a separate gate.

Acceptance condition: Bind the residual to the semantic proposition/context used by the checked reduction; admit discharge only with that same identity or an independently checked transport/composition.

- `machinery/study_knowledge.py` lines 167-183, SHA256 `ca56fbe272669b2e40de14b17af4cd75bb8c874afc5d220a4188cefd43639679`.

### B2: Matched task identity is only source text plus catalogs

**must_fix_before_acceptance** — T2, M1.

Task and binder strings are elaborated after importing each adapter-selected solution module. Pair binding fixes task JSON and frozen sources/catalogs, but no comparison binds the resulting proposition and its contextual dependencies to a prospectively frozen task meaning. Retaining old declaration bodies does not prevent newly added adapter declarations/notation from changing how task text elaborates.

Valid Lean proofs can answer different mathematical obligations while the comparison reports the same task. A bounded non-solution on the old side does not itself supply an elaborated old target to compare.

Acceptance condition: Establish a common prospective semantic target/hypothesis context, or a checked relation to it, independently of each adapter. Bind the full context rather than merely a printed proposition or declaration name.

- `machinery/study_transfer.py` lines 74-88,119-122,162-179,216-243,290-315, SHA256 `573637c989c84f3c1ed9bba6613a4d07488cb4397908e7add04cb2c3c41f6c35`.

### B3: Burden compares cumulative witnesses against initial knowledge, not remaining goal conditional on enlarged knowledge

**must_fix_full_K1_K2_claim** — K1, K2.

The conditional dictionary is always snapshots/initial. The bundle accumulates every retained root-connected reduction, dependency and discharge; pairs require equal initial-dictionary digest. This measures the cumulative encoding of root-connected witnesses and overhead relative to the initial seed. It does not compare a fixed remaining goal/residual task conditional on old versus newly enlarged accepted theories.

The measure is a legitimate narrower storage/explicit-witness audit, but cannot be presented as implementing the user's K(goal | new step + previous knowledge) proxy. Accumulating ever more witnesses naturally increases this representation; no decrease or sawtooth should be manufactured to compensate.

Acceptance condition: Represent each bound theory and a current goal/residual witness conditional on that theory; separately expose new dictionary, gluing/adapter/connecting costs and unknown proof remainder. Keep the mathematical goal/reference panel fixed, charge abbreviation overhead, and make no inference of minimal proof complexity or difficulty from an encoding change.

- `machinery/study_burden.py` lines 27-65,68-84,94-103, SHA256 `60afcf75e79f50623c6592d3e6801de60e92e01e14941e5344b918d6199fa934`.

### S1: Continuation commitments do not protect equal branch validation budgets

**substantive_methodology_gap** — P4, S1, C3.

Final code durably records the policy trial candidate, rounds and plan/action-call caps. It does not reserve or partition all knowledge validation and terminal comparison costs for each continuation. The incumbent executes first and can consume the shared allowance through variable-size knowledge submissions before the candidate branch. Ordinary episode commitment likewise names only one call cap rather than a protected continuation allowance.

The global guard remains bounded and incomplete comparisons are ineligible; this is not an observed overspend or false positive. It is a missing fairness/completion guarantee behind explicit continuation-budget and equal-opportunity claims.

Acceptance condition: Either provide protected, symmetric continuation/validation allowances (including the concluding comparison) or narrow the documented guarantee and classify unequal budget exhaustion explicitly.

- `machinery/study_policy.py` lines 117-140, SHA256 `a9672dec84f2aba9348b5c882585dd76babea92e698339a561cb6adc9f1c8c6b`.
- `machinery/study.py` lines 533-544,554-616, SHA256 `9ffa1f606ed5edf10e6d3502aa5c83818e6c11a414e2c01d4f71ad1ee30a3781`.
- `machinery/study_knowledge.py` lines 114-127, SHA256 `ca56fbe272669b2e40de14b17af4cd75bb8c874afc5d220a4188cefd43639679`.

### S2: Catalog covers every current Lean draft rather than an accepted-module inventory

**workflow_limitation_not_false_proof** — T5.

The catalog imports all MathGKM Lean files in the snapshot. A retained failed draft can invalidate the context despite usable accepted capabilities. This is conservative, but the live-tree workflow must move/exclude unaccepted drafts or provide an accepted-module catalog; archival retention and acceptance are different concepts.

No mathematical false positive follows; comparisons can fail for irrelevant drafts and the claim of acceptance-based regression coverage is too broad without the workflow distinction.

- `machinery/study_transfer.py` lines 187-213,244-253, SHA256 `573637c989c84f3c1ed9bba6613a4d07488cb4397908e7add04cb2c3c41f6c35`.

## Integrated paths and resolved observations

- P/T/S major helpers are integrated: ordinary and branch proposer commitments precede action; reports feed checked ingestion, explicit residuals and next requests; policy/program selection reaches the next request.
- if_open_obligations now checks for status == open rather than ledger nonemptiness.
- Bounded non-solution now checks frozen source hashes before becoming a valid attempt; the prior bypass is resolved in these bytes.
- Burden traversal now starts from root reductions, follows declared checked dependencies and includes later discharge records; prior unrelated-representation and omitted-discharge findings are superseded, subject to B1 and B3.
- Live nonempty held-out suites now require retained curation receipt/suite hashes. A machine-owned curator exists separately before freeze; an empty suite honestly establishes no transfer.
- Policy comparisons distinguish finite task gain from newly acquired-component transfer; invalid/missing/interrupted checks cannot authorize improvement. Retained declaration type/body catalogs improve over module-hash novelty.
- Observer export now precedes durable round advancement; report enumerates missing scheduled checkpoints. Numeric burden records have no identified research/policy consumer. Audit input/plan integrity can still stop execution, which is operational failure control rather than a numerical reward channel.

The actual path is `research_round → policy.commit → Arm.call → policy.record → study_knowledge.ingest → snapshot/observer → review → policy_trial/evaluate_pair → reviewer/selector → selected policy/program → policy.request`. Main and branch paths both contain the prospective and checked-knowledge consumers. Separate `study_curate` must precede freeze for a nonempty live suite. Separate `study_burden.report` consumes exported checkpoints without feeding its measurements into those choices. These are source-established call sites, not executed coverage.

## Scope and validation limits

- The executable proposal path is a bounded request-control DSL. It is more than four prose strings, but not arbitrary Python self-replacement or a certified Goedel switch.
- Whole-continuation improvement and concrete Python/OS/model refinement remain explicit open obligations. Hash-bound transitions and generic Lean obligation types do not discharge them.
- Component dependency use is not causal necessity; held-out finite-budget outcomes do not prove universal usefulness, long-term superiority or mathematical unprovability.
- One-way burden outputs correctly retain unknown minimum/difficulty and no forced sawtooth. B3 concerns the conditioning target, not a request to compute uncomputable Kolmogorov complexity.
- Final neutral tests are authored but unexecuted. The source suite has commitment, program, baseline, audit-projection, neutral recovery, premise, gluing, comparison and connected-loop cases. It does not yet establish the semantic context or asymmetric-validation-budget guarantees identified above.
- No fresh Markov research, live curator, canary or study launch is authorized before explicit user OK. This source review neither runs nor authorizes them.

## Binding and authority

All 66 entries in the builder manifest matched their current file bytes. All 19 captured review files matched current bytes at this final bounded observation. Files were captured individually with stable rereads, not as an atomic filesystem transaction. Requirements and the manifest itself are separately pinned when not entries of the manifest.

User conceptual requirements and latest no-research/test-hold boundaries are taken from parent messages; P/T/S/K labels and detailed implementation acceptance conditions are the supervisor requirements interpretation, not asserted verbatim user wording.

The accompanying JSON contains full source paths, copied paths, hashes, exact line references, all manifest comparisons and dispositions of prior findings. Historical developing reviews remain unchanged.
