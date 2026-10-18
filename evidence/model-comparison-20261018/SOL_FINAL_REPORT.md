# Sol study: final status and observed harness limitations

The study ended on 2026-10-18. The baseline completed eight research attempts. Exploration completed four; its fifth proposal was delivered but rejected before any fifth research action. The controller and its sleep-prevention process exited. **Conjecture 6.3 remains unresolved.** No research strategy, proof code, or other-arm mathematics was supplied to the researchers by this monitoring session.

## Mathematical results and evidence levels

The baseline retained locally compiling general statements on exact rational indexing, homogeneous lifts and ordinary coefficients, Laurent representation, the cubic exchange invariant, unit-specialization positivity, and nonvanishing/equality with quadratic mutation in a generic rational-function field. These are structural correspondence results, not log-concavity inequalities. Nonvanishing in the generic field does not imply nonvanishing at every numerical substitution. Full published-source and polygon correspondence remain open.

The exploration arm retained a universal rational-label coverage proof. Separate reviewer jobs checked coverage, but neither arm recorded an automatically admitted theorem or component. The final two exploration attempts concerned a short compiler-check timeout and bounded replay recovery; they added no new mathematical theorem. The last recovery report was accepted as unverified research reporting and correctly disclosed timing deviations.

The baseline delivered three completed researcher reports and five time-budget failures. Exploration delivered three completed reports and one time-budget failure. Two exploration reports were rejected: after attempt zero for changed precommitted uncertainty wording, and after attempt two for invalid status labels. A completed role receipt, valid research report, local proof, separate reviewer verification, automatic admission and exact-root closure remain different observations.

## Exact stopping condition

The saved exploration reason is `changed hypotheses require a new identity`. The fifth proposer reused six existing IDs while changing their claim strings. The first rejected ID was `H-bounded-replay-capability`; the selected family-adapter hypothesis itself was unchanged. `study_policy.record` rejected the changed identity during `commit`, before `validated-plan.json` or a fifth researcher job existed. `study.run` caught the exception and ended the arm as `bounded_or_blocked`.

This was not resource exhaustion. The funded next episode had charged 300 of 2,880 reserved seconds and one of four calls. These are reservation-cap accounting values, not measured execution time. No invocation remained pending. The [status record](SOL_FINAL_STATUS.json) contains exact before/after claims, outcome counts and source hashes. The machine did not choose to abandon the conjecture; proposal validation stopped it.

## Differences exposed by the new harness

The fresh baseline is the incumbent-style arm inside v2. Historical v1, the Astra v2 study and the Sol v2 study are separate comparisons. V2 adds explicit hypothesis portfolios, prospective trials, delayed-use episodes, frozen transfer tasks, separate reviewer/selector roles, bounded strategy experiments and one-way complexity auditing.

Observed benefits are durable failed-attempt records, explicit residual obligations, successive reuse of general partial results, independent review and autonomous correction of invalid report-status labels. There was no demonstrated live transfer gain, policy replacement, admitted component gluing or certified self-improvement.

The live run also exposes rigidity. Both models rewrote initial uncertainty text when reporting results, causing rejection despite unchanged selected claims and predicted outcomes. Sol later corrected status labels, but a revised proposal under old IDs then stopped the entire loop. This creates an operational follow-up: preserve immutable hypothesis versions and prospective records while allowing the machine a charged opportunity to repair invalid proposals. Pre-trial uncertainty and after-trial findings should remain explicitly distinguishable. These are harness requirements, not mathematical advice to the researcher; no repair has been installed in this study.

The 120-second complete-validation allowance was another bottleneck. Sol claim checks retained successful module compilation and kernel replay but ended before successful final premise inspection. The exception text was Operation not permitted near the deadline; source/timing inspection suggests timeout cleanup, without a traceback proving the exact syscall. The baseline final structural evaluation is invalid for the same general budget reason. Invalid comparisons do not establish improvement, regression or mathematical falsity. A future deployment needs validation and checkpoint allowances sized for the complete actual Lean path, with accurate failure classification.

## Complexity observation

The unchanged standalone observer generated [raw records](sol-observer-20261018/raw.json), [paired conditional descriptions](sol-observer-20261018/conditional-paired.json), and [plots](sol-observer-20261018/conditional-descriptions.svg). All 20 scheduled points remain represented: 14 have insufficient checked goal connections; six were not reached. No checked remaining-goal description is measured, so there is no demonstrated complexity drop or sawtooth. This does not imply that local proofs are absent or useless. Minimum complexity and proof difficulty remain unknown. The observer changed neither research state and supplied no data to research decisions.

## Preserved artifacts and comparison

[Complete Sol archive](sol-complete-run.tar.gz), SHA256 `13de832b6ace049e6c02cc604684b73f266569a1992db2cf41095ed825b39c77`, contains 3,503 regular files, including sealed inputs, final baseline evaluation, every role receipt, source, failed attempt, compiled evidence and the exact stop condition. The [manifest](sol-complete-run-manifest.json) hashes every retained file and records dependency-cache exclusions. Repository pins support dependency reconstruction; raw absolute host paths are historical records rather than a portable cold-bootstrap claim.

The earlier [baseline checkpoint](SOL_BASELINE_EIGHT_ROUNDS.md) captured final evaluation while it was still running; this complete archive includes its finished result. The [first-two-exploration comparison](SOL_ASTRA_EXPLORATION_TWO_ATTEMPTS.md) records exact matched observations and both models' uncertainty-text changes. At eight baseline attempts and two exploration attempts neither model resolved the root or obtained automatic admission. Their mathematical choices differ, but changed validation infrastructure, unequal actual costs and single sequential runs prevent a causal model ranking.
