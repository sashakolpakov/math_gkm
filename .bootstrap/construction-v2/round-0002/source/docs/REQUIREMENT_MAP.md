# Requirement → producer → artifact → consumer → invariant → validation

All rows describe final source connections, **not passing tests**. Validation is
NOT YET RUN. `new tests` means `tests/test_revision_static_checkpoint.py`; older
tests means the updated `test_study_v2.py` / `test_controller_history.py`.
Status `implemented` means authored and statically traced, pending validation.
`partial/open` identifies an actual remaining obligation, not compliance.

| ID | Producer / code | Durable artifact | Actual consumer | Invariant and designed negative example | Disposition |
|---|---|---|---|---|---|
| O1 | `Arm.call`, `study_worker.execute` | job spec/request/prompt/argv/events/receipt | `consume`, research/review/selector | Exact role/model/request and raw usage; missing final output is operational failure. No nested role ran in construction. | implemented; live/provider attestation pending |
| O2 | `study_policy.prompt`, worker capability grants, knowledge schemas | source/experiment/capability-failure records | `record`, `ingest`, next `request` | Sources/scans/tool failures cannot certify theorems; unsupported tools remain unavailable. | implemented; live tools unvalidated |
| O3 | `freeze`, `clean_contract`, `completion.prepare` | sealed contract/root/pins | all role requests, `check_task`, root gate | Explicit root/English/premises/preferences; no theorem-count utility. Mutated root/hash rejected. | implemented |
| P1 | `record` portfolio | state and round start/commitment | `request`, branch clone | Immutable claim identity, alternatives and artifact-bound evidence; changed claim needs new ID. | implemented |
| P2 | `commit`, `validate_execution` in main AND branch | validated-plan and branch commitment | researcher, `record`, `ingest` | Full selected claim/uncertainty/outcomes/consequences/alternatives/episode/reservation; altered outcome or binding rejects. | implemented; new commitment tests |
| P3 | episode invention counter | commitment/state/decision | subsequent planning request | Bounded invention without immediate root reduction; no payoff is not refutation. | implemented; new counter tests |
| P4 | `research_round`, `policy_trial`, `finish_episode` | episode history, branch state, retained use links | horizon review and next invocation | Absolute indices, once-only invention charge, predetermined continuation caps. Interrupted branch must not restart at local round zero. | implemented; full fault matrix pending |
| M1 | `check_task`, `proof_audit.inspector/parse` | staged source, fresh objects, actual declaration closure | `ingest`, transfer | Kernel types/bodies and actual axiom declarations, allowed closure only. Hidden generated hole + spoofed empty reports rejects. | implemented; real Lean negative test written |
| M2 | `completion.verify`, `study_completion.check` | bundle, root wrapper, inspector, correspondence audit | resolution state/run stop | Closed pinned root or exact negation, current objects, independent audit; unrelated or conditional theorem cannot close. | implemented; real root and history tests |
| M3 | `task_for(reductions)`, `ingest` | exact residual conjunction→unchanged root and explicit residual records | next request, observer | Impossible/tautological antecedent remains conditional, not simplification; no inferred satisfiability. | implemented |
| G1 | `task_for(attachments/representations/fiber_gluings)` | generated checked composition, export module, maps/laws/dependencies | `ingest`, later checked consumers | Consumer literally applies the checked map/law; dependency closure must use accepted exports. Three unrelated true propositions get no attachment status. | implemented; positive/lossy tests written |
| G2 | `ResearchSemantics` retract, compose, pullback, Push beta/unique | new generic Lean sources and per-attachment checks | generated attachment/family consumers | Section supplies each old model; omitted witness/lossy map/type-incompatible family fails. No symbol union called semantic pushout. | partial: new Lean uncompiled; full category/model-category laws unimplemented |
| T1 | `study_curate`, `freeze` provenance checks | fixed suite, curator receipt/hash/cost, seal | all `evaluate_pair` calls | Pretrial selection and same suite frozen; fabricated independent JSON insufficient for live provenance. Relevance still independently reviewed. | implemented; live selection pending |
| T2 | `policy_trial`, `evaluate_pair` | common decision-state/source, matched tasks/reservations | adapters and comparison | Same propositions/hypotheses/source, equal caps; direct baseline proof allowed. After-only vocabulary invalidates setup rather than proving gain. | implemented; direct-before and connected tests |
| T3 | `catalog_snapshot`, `used_versions`, exact declaration comparison | pre-adaptation catalogs, used type/body/source hashes | transfer classification | Actual newly frozen declaration body/type must occur in consumer; comments/unrelated additions/adaptation-only modules confer no prior-use credit. | implemented; expanded mutation tests planned |
| T4 | explicit bounded non-solution schema; `check_task`, `evaluate_pair`, `ablate` | distinct valid/invalid statuses, matched ablation records | eligibility/reviewer/selector | Invalid/missing/interrupted/tool-failed attempts cannot establish gain; dependency use is not indispensability. | implemented; new negative test, full ablation validation pending |
| T5 | `ingest` immutable source versions, worker read grants, `verify`, catalog retention | accepted source maps, history objects, catalogs/regressions | subsequent roles and comparison | Accepted imports preserved; every old catalogued declaration retained plus suite. No claim to all latent capabilities. | implemented; deletion/body mutation tests planned |
| S1 | proposer, matched `policy_trial`, separate reviewer and selector | role receipts, paired continuations, decision | guarded experimental selection | Praise alone insufficient; valid task gain/retention and cited evidence required; all calls/failures reserved. | implemented; connected cycle written |
| S2 | `review` writes policy/program, `request` executes program | state, decision, next job request | actual researcher | Baseline never installs new selector policy; candidate affects next actual request. | implemented; baseline + next-request tests |
| S3 | `study_program.validate/execute/proposal` | bounded AST version/hash/trace and migration record | matched branch and later request | Executable request transformation, not merely four text fields; authority-changing instructions rejected. Arbitrary Python replacement unsupported. | implemented restricted language; host refinement open |
| D1 | `ContinuationObligations.WholeSwitch` | source obligation and durable formal-obligations list | actual requests; certified entry rejects | Full incumbent future discoveries/switches, same old utility/time/model; finite trial never this theorem. | OPEN: no concrete whole-continuation certificate |
| D2 | `study_bridge.event/observation`, protected `Protocol.step` | semantic event chain with code/state/contract/evidence | actual calls/admission/installation and next state | Real guard executes; hash-bound host effects explicitly remain unrefined. No model theorem promoted to host proof. | partial/open host refinement |
| D3 | durable `OBLIGATIONS`, rejecting certified gate | request-visible open duties, implementation bindings | every new request; switch gate | No global self-soundness/favorable-response premise; concrete bridge/cost/coupling/deadline/install duties remain active. | OPEN; exact duties in checkpoint report |
| K1 | `study_observer`, `study_burden` root-connected traversal | bound feeds and conditional witness bundles | standalone observer only | Exact residual proof tasks relative to initial knowledge; unconnected representations/source storage do not measure root proof burden. | implemented; unknown quantities explicit |
| K2 | frozen observer plan, dictionary hashes, whole witness source closure | paired encodings with definition/adapter/bridge/shared costs | standalone report | Same root/panel/dictionary/encoding; abbreviations pay full dependencies. Panel's minimal proofs remain unknown. | implemented scoped witness encoding, not minimal complexity |
| K3 | initial/every-round checkpoint producer; schedule iteration | every scheduled raw record including missing/unfavorable, SVG | standalone report | No interpolation or manufactured sawtooth; insufficient data explicitly empty. | implemented; empty report and cycle tests |
| K4 | explicit null minimum/lower bound fields | raw conditional audit | user audit report only | Failed search gives no lower bound; smaller witness does not establish easier residuals/usefulness. | implemented |
| K5 | explicit request projection and role read grants | audit outside every role workspace | no decision consumer | Raw/derived audit values cannot affect requests/eligibility/admission; plan integrity and production costs only. | implemented; invariance test written; OS isolation pending |
| C1 | clean `freeze` and `copy_seed` | identical seed and initial manifests | both arms | No old agenda/results/cached project objects/other-arm inputs. No claim about model pretraining. | implemented; neutral same-seed test |
| C2 | dependency content identity, input/implementation seals, permission profiles | SHA256 trees, tools, seed, profile | `verify`, worker and validators | Match contents not paths; no Git traversal; actual OS containment requires validation. | implemented, deployment evidence pending |
| C3 | `reserve`, raw watchdog/validation receipts, setup cost | caps/observed costs/raw usage/controller wall | budget gate and independent review | Charge roles/planning/evaluation/failures; distinguish caps from observed and overlapping wall; provider/order drift disclosed. | implemented; cleanup/abrupt-death cost uncertainty disclosed |
| C4 | parameterized contract + phase prompt, live hold | unchanged historical contracts, new neutral fixture | freeze/curator/researcher | Agoh→Markov provenance not rerun; no target silently replaced; no fresh Markov activation. | implemented workflow hold; no campaign executed |
| R1 | pre-job intent, orphan recovery, receipt hashes, branch state, resolution check | fsynced states/jobs/reservations/snapshots | recovery and run | Uncertain effect never replayed; resolved state never reset. Partial workspace creation/incomplete validation fails closed and may need explicit reconciliation. | partial: comprehensive fault-injection/atomicity proof pending |
| R2 | before/final manifests, no archive deletion, source/history preservation | code/tests/pins/docs/evidence | supervisor versioning/reproduction | No Git operations or historical mathematical input; local temporary data separate. | implemented source preservation; root owns versioning |
| R3 | static AST/JSON/source audit and final manifest | source inventory, dispositions, tests/plan | independent source review then later validation | Audit precedes all revised execution; no old pass log reused. | source audit performed; validation NOT YET RUN |
| R4 | no invocation plus protected live authorization gate | checkpoint and live hold | freeze/run/curate/worker | Fresh Markov/canary/curation requires explicit user OK after report; validation alone insufficient. | no activation performed |

## Full-loop edge ledger

1. Contract/seed → seal → `verify` and every role. Invariant: same immutable
   scientific target and declared allowance; negative: changed root/pins.
2. Retained state → proposer receipt → `commit`. Invariant: known artifact evidence,
   alternatives and absolute episode; negative: missing uncertainty/consequences.
3. Commitment → researcher request/receipt → `validate_execution`. Invariant: no
   retrospective trial rewrite; negative: changed claim/outcomes/plan hash.
4. Actual artifact proposals → rebuilt objects and inspector → `ingest`. Invariant:
   exact proposition/allowed premises; negative: hidden hole/conditional False.
5. Checked maps/laws → generated exports and source bindings → later proof consumers.
   Invariant: actual composition and dependency use; negative: omitted section/lossy map.
6. Checked reduction/residual proof → explicit remaining obligations → next request.
   Invariant: unchanged root and exact residual statements; negative: changed ID/claim.
7. Frozen suite/context → equal adaptations/catalogs/checks → pair eligibility.
   Invariant: valid same-task comparison; negative: missing before output/after-only task.
8. Episode/pair records → separate review/selection → experimental policy/program.
   Invariant: evidence plus valid gain/retention; negative: praise alone/invalid comparison.
9. Installed program/state → interpreted projection/trace → next real job request.
   Invariant: protected authority fields; negative: edit-root instruction.
10. Every actual role/host transition → semantic binding records → later state/audit.
    Invariant: scope labels stay distinct; negative: forged bridge flag cannot certify.
11. Bound snapshots → observer feed → standalone conditional audit. Invariant:
    one-way values and full dictionary/bridge costs; negative: changed audit proxies
    cannot affect decisions, unconnected representation gives no root witness.
12. Interrupt/stop → retained intent/receipt/reservation → recovery. Invariant:
    no uncertain action repeats, no resolution loss; negative: orphan pre-job intent.

Runtime evidence for these edges is deliberately absent from this source-only
invocation. Tests are designed examples, not evidence that they passed.
