# Round 3 current-source P/T/S/K review

bounded current-source handoff; builder validation ongoing; not final release acceptance.

Static source/hash inspection only. No tests, Lean, checker, mathematical execution, candidate imports, model calls, source edits or researcher/builder contact.

Two K issues remain in this bounded checkpoint:

## K-R3-1 — Conditional reference inputs are not checked against the frozen plan/seal

concrete_binding_defect (K2, K3).

The integrated report takes its schedule from seal.observer_plan and prevalidates scheduled feeds through measure_checkpoint. However, conditional_pair independently rereads the current seed contract, seed manifest/source bytes and evaluation suite to construct reference_tasks without comparing them to the sealed root, panel or seed bindings. A changed reference input can therefore silently redefine the purported fixed comparison while the originally sealed plan remains unchanged.

The earlier missing feed-binding check is not an ordinary report-path bypass: measure_checkpoint validates those bindings first. Direct use of conditional_pair still relies on that unstated precondition. This finding concerns the unverified reference inputs, not a demonstrated research decision leak.

Acceptance condition: Bind conditional reference construction to the original seal/plan/source snapshots and reject or explicitly invalidate changed fixed inputs; do not relabel a changed panel as the original comparison.

- `/Users/sasha/math_gkm/.scratch/strategy-v2-20261017/machinery/study_burden.py` lines 87-103,118-122,160-166,176-184; SHA256 `e0530b64947bcfbd8176a762df3836f9711777c815be9cf97db324cdaf3b8378`.

## K-R3-2 — Conditional byte count still encodes a portfolio of alternative derivations

metric_scope_gap (K1, K2).

The new theory dictionaries and introduced-overhead split are real improvements. But conditional_description_bytes serializes every retained root reduction and its residuals together. These are alternative partial derivations of one goal, not necessarily the one current remaining-goal witness. Adding an unused historical route increases this number even when the chosen/current obligation has not changed.

This can be an honest conditional portfolio-description metric. It is no longer merely the previous cumulative source bundle, and no minimal/uncomputable representation or forced decrease is requested. The current metric should not silently stand in for a bound current remaining-goal witness.

Acceptance condition: Identify the encoded object explicitly. If claiming a current residual/proof-description comparison, bind that witness per fixed goal separately from the retained portfolio, with new dictionary/gluing overhead and unknown proof remainder separate. Do not manufacture a sawtooth.

- `/Users/sasha/math_gkm/.scratch/strategy-v2-20261017/machinery/study_burden.py` lines 185-206,209-220; SHA256 `e0530b64947bcfbd8176a762df3836f9711777c815be9cf97db324cdaf3b8378`.

## Changes that should not be reported as still missing

- K: Old and enlarged accepted theories now have separate dictionary bindings; introduced definitions/adapters/connecting sources are separated; unknown remainder and minimum remain unknown. Cumulative initial-theory storage is separately labelled.
- P/S resources: Protected budget pools, ordinary delayed-horizon funding, and symmetric branch plus downstream evaluation/review funding are now active source paths. Runtime reviewer owns crash/accounting disposition; old round2 missing-pool finding is not repeated as current.
- T catalog: Catalog now imports admitted_modules rather than every retained draft; accepted source inputs feed snapshot admission lists.
- T semantic context/use: Named target-context compilation, bound paired tasks and required-component subset checks are present. Formal reviewer owns exact semantic negatives and final validity; no runtime pass inferred.

## Scope qualifications

- All non-root reference-panel task proofs are presently left unknown in conditional_pair (lines201-202); this path does not consume their evaluation proof records as measured conditional witnesses. The panel currently provides fixed reference identity, with transfer evaluation remaining separate.
- Numeric audit outputs have no identified policy/selection consumer in reviewed paths. Producer outbox and sealed schedule separate audit-export discrepancies from research control.
- Whole-continuation/actual host refinement remain open; bounded executable experiments are not certified switches.
- No fresh Markov activation is authorized by this review. The user hold remains.

K1/K2 labels and detailed witness/accounting conditions are supervisor operational interpretations of the user's conditional remaining-proof audit request, not a claim of verbatim user wording.

Exact source copies and pins are in `review_checkpoint_2238`; the name is a label, while pins.json records the actual observation time. The candidate may change after this checkpoint. No test outcome is inferred from authored source.
