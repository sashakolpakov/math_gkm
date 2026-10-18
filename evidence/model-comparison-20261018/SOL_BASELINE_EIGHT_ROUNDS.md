# Matched eight-round baseline checkpoint

Observation cutoff: 2026-10-18 14:07:26 UTC. The Sol baseline has finished all eight research attempts and final reviewer/selector roles. The controller is still performing the final structural evaluation; the exploration arm has not started. The conjecture remains open.

| Measure | Preserved Astra baseline | Fresh Sol baseline |
|---|---:|---:|
| Closed researcher attempts | 8 | 8 |
| Completed researcher reports | 3 | 3 |
| Time-budget failures | 5 | 5 |
| Submitted mathematical claims | 3 | 4 |
| Harness-admitted knowledge/components | 0 / 0 | 0 / 0 |
| Original claim-check outcome | Immediate unchanged-root startup abort, rc=-6 | Successful module compilation and kernel replay, followed by incomplete validation near 120 seconds |

Both baselines pursued general structural results rather than a numerator-by-numerator sequence. Astra retained candidates for universal rational coverage, homogeneity, coefficient transport, rational-function interpretation and numerator recovery. Sol retained coverage and its converse (generated labels are exactly coprime pairs 0<p<q), homogeneous/coefficient bridges, the cubic exchange invariant, positive unit specialization, polynomial nonvanishing, and equality with a quadratic recurrence in the field of rational functions in three independent variables.

The last Sol result discharges current-endpoint nonzero premises in that fixed generic symbolic field. It does not assert nonvanishing at every numerical specialization. None of these candidates proves coefficient log-concavity, the exact universal polygon correspondence, or the full published-source/root correspondence.

The four Sol claim-check records retain successful compilation and kernel replay, but all finish checked=false/invalid_comparison at approximately 120 seconds, with Operation not permitted and no successful final premise-inspection record. Timing and source inspection suggest a validation timeout followed by a cleanup exception; the exact failing syscall is not established by a retained traceback. These outcomes are incomplete checks, not mathematical refutations. Reviewer-2 separately reports successful coverage compilation, kernel replay and axiom inspection; this has not entered the automatic admitted-knowledge map. Final reviewer-8 exhausted its time allowance without a report payload.

This is a descriptive comparison at equal attempt counts, not a causal model ranking. The validator deployment changed, actual costs differ, only one sequential run per model is represented, and the matched exploration comparison is pending. The historical v1 campaign with accumulated partial log-concavity results is separate from both fresh v2 baseline arms.

## Reproduction records

[Sol archive](sol-baseline-eight-rounds.tar.gz), SHA256 `4abdb4ea18b3262198d38d5f3f7e18734d0424d91e0683ada71760baf1c81879`, contains 2,621 regular files. [Manifest](sol-baseline-eight-rounds-manifest.json) records every file hash, unexpanded symlink, excluded dependency cache and exact capture time. Proof sources, compiler/client receipts, failed attempts, role requests, reports and compiled evidence are included. The final structural evaluation was still running at capture; any pending result in this archive must not be treated as a completed comparison.

The preserved [Astra archive](astra-checkpoint.tar.gz), its [manifest](astra-checkpoint-manifest.json), [frozen-input audit](SOL_FROZEN_INPUT_AUDIT.json) and [Sol launch record](SOL_LAUNCH.json) supply the other reference inputs. Recreate pinned dependencies using the repository toolchain/manifest. The absolute host paths in raw receipts remain historical execution records, not a portable cold-bootstrap guarantee.

## Harness observations

The fresh baseline is the incumbent-style arm inside v2, not the old v1 executable. V2 adds prospective trials, persistent competing hypotheses in exploration, delayed-use episodes, frozen transfer obligations, separate reviewer/selector roles, experimental policy comparisons and a one-way complexity observer. Measurements include definition/adapter costs and unknown residual proof obligations; they do not direct research.

Observed here: prospective planning, review/selection, preservation of failed attempts and reuse of retained general lemmas across calls. Not demonstrated here: successful live transfer, installation of an improved research policy, admitted live component gluing, or beneficial exploration. Concrete whole-continuation improvement, host refinement and certified executable self-installation remain open. A generic Lean model theorem does not settle those obligations.
