# Round-5 feedback audit: residual conjecture and larger test

Read-only snapshot 2026-10-13T21:27:10.557205+00:00. This extends the earlier feedback audit. No experiments were rerun; numerical correctness is being reviewed separately. No project source or prompt was changed.

**The larger experiment was requested before execution, and its result was subsequently consumed before the next recorded research decision.** The current checkpoint has 10 consumed responses (0000–0009), 21 recorded actions, 11 remaining action slots, and pending request-0010.json. All consumed responses are direct_bootstrap_proposer responses from the actual live Astra session; none is an artificial fixture or a separate supervisor_transport call.

Chronological evidence in .bootstrap/round-0005/events.jsonl:

| Trace item / line | Recorded action |
|---|---|
| item_44 / 86 | response-0005 proposes extending the observed factorization approach to residual coefficients on other upper diagonals; engine consumes the experiment request as event 12. |
| item_45 / 88, item_46 / 90 | residuals.py is created and then executed successfully. |
| item_56 / 110 | response-0006 loads the actual residual-result.json, records event 13, and proposes the still-unproved residual conjecture as event 14. |
| item_65 / 127 | response-0007 requests a larger test specifically to challenge that conjecture, before retaining it; engine records event 16. |
| item_66 / 129, item_67 / 131 | stress.py is created and then executed successfully. |
| item_88 / 172 | response-0008 loads stress-result.json and consumes it as event 19, bound to experiment event 16. It separately records local Lean validation results for earlier proof requests. |
| item_89 / 174 | response-0009 reads the returned observations and records the next partial proof target, explicitly preserving the full conjecture's open status; engine records strategy event 20. |

The original residual experiment reported 1,293 diagonals and 2,018 critical coefficient checks. The larger run reports denominator bound 28, **241 proper reduced fractions, 229,476 raw coefficient triples, 6,822 residual diagonals, and 20,781 critical points**, with no recorded failures. These are cumulative larger-range counts, not additional disjoint observations to add to the earlier range. I checked exact equality between the saved stress output and the consumed event-19 observation. This audit does not independently recalculate these new numerical counts.

The residual conjecture is explicitly described as machine-selected in this session and as concerning a diagonal direction; it is not identified with full Conjecture 6.3. Its historical novelty remains unassessed. The published factor-4 conjecture is separately attributed. Neither absence of numerical counterexamples nor local boundary/conditional theorems is promoted to a proof of either full conjecture. The new recorded decision targets the missing recurrence-to-diagonal identity and states that the conditional result can only be used under that identity hypothesis.

The mathematical mechanism here is a real progression: an observed special factorization suggests a broader residual claim; finite experiments fail to refute it; a larger range is requested prospectively; and the next decision retains the distinction between experimental support and the missing universal proof. This supports a feedback-driven research claim. It does not show that increasing the numerical range itself proves anything universal or that the residual conjecture was unknown in the literature.

All current request/context hashes, response IDs, flattened response/action history, event-chain hashes, contract bindings and external-observation request hashes pass. The engine honestly labels imported execution records unverified external observations, while referring to separate local compilation and axiom/kernel reports. The 48-theorem count is a validation summary, not the objective or a research score; this process audit does not replace the independent proof review.

K audit remains separate: designated complexity-audit fields are absent from every projected request context checked; decisions cite mathematical observations and proof gaps, not description-length scores. The overall sequence remains externally launched live sessions working through their own recorded agenda. This is not a claim that the host controller's operation has acquired a certified global self-improvement guarantee.

No additional infrastructure is required by this audit. The pending request is the ordinary continuation point for the next mathematical step.

Final documentation check: docs/round2/MARKOV.md agrees with these counts and source-of-decision distinctions, explicitly keeps full 6.3 open, and distinguishes the Lean self-change model from arbitrary Python/Codex edits. evidence/markov/english-lean-review.md labels itself the proposer's local review, not an independent supervisor report. No documentation correction is needed for the chronology and claim-level issues examined here.
