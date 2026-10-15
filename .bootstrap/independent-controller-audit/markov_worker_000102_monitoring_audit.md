# Independent mathematical and interruption audit: worker 000102

Request `ae37847f6ced4508895c1c325bd07606`. Read-only review of this worker's own archived files, receipts and event history. No Lean, proof, replay, finalizer or experiment was run; no project was changed or proposer contacted; no active worker 103 mathematics was inspected. This note does not backfill worker 102 with later checks.

## Outcome

The run ended with the explicit model error **“Selected model is at capacity. Please try a different model.”** followed by `turn.failed`. The controller records `missing_or_malformed_report`, return code 1, elapsed 221.458347 seconds and a null report. This is an operational interruption, not a mathematical refutation or proof timeout.

The retained mathematical progress is one successful compilation, `MarkovOnsetAdapter5MAE.lean`, with six theorem declarations. A different adapter build failed. There are no retained completed replay receipts, final aggregate validation files, all-name axiom audit, final report or completed recovery batch. The successful adapter is therefore **compiled-only**, relative to its inherited imports. The all-chamber theorem and root residual are unbuilt dependent drafts. The conjecture remains unresolved.

## Exact meaning of the compiled adapter

For actual `rest : List Bool`, let `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, `path=List.replicate n true ++ false :: rest`, `a=(frame path).mid.a`, and `A(i,j)=coeff (frame path).mid.p i j` in the original raw numerator convention.

The compiled assembly `source_fourth_onset_chamber5MAE` has the explicit hypotheses

```
n,k,i : ℕ,  rest : List Bool,
7≤n,  5≤c,
3*c < 4*r,
1*r < 1*c,
1≤k,  k≤6,
i+(3*n+k)+2 = a+4.
```

Both chamber inequalities are declaration hypotheses: the upper inequality `r<c` is not merely inferred in this theorem's statement. They describe the strict last predecessor chamber `3/4<r/c<1`. The conclusion is

```
A(i,3n+k+2) * A(i+2,3n+k)
  ≤ A(i+1,3n+k+1)^2.
```

Thus the coefficient offsets are `k,k+1,k+2`, and all three positions have total degree `a+4`. The six declarations comprise separate source inequalities for `k=1,...,5` and their assembly with inherited offset 6. No candidate formula, fitted statistic, gap inequality, polygon predicate, positivity or nonzero coefficient hypothesis remains. The natural indices retain zero endpoints whenever the stated degree identity holds.

The proof text uses five higher-chamber staged certificates from worker 101, the inherited exact source coefficient identities and the previously proved sixth offset. It constructs nonnegative integer chamber coordinates and transports a uniformly scaled gap to the raw coefficients. Those five worker 101 certificates had compiled but lacked separate replay in that historical run. The worker 102 adapter's compilation is genuine partial progress, but it does not by itself supply the missing independent replay or closure audit.

## Other authored sources are not accepted results

`MarkovOnsetAdapter4MAE.lean` has a failed build: five `simp made no progress` diagnostics, return code 1, and no retained object. Its failed source snapshot must not be treated as a proof.

`MarkovOnsetAllMAE.lean`, `MarkovFourthAfterMiddleMAE.lean` and `MarkovResidualMAE.lean` were authored but have no successful retained builds or replay receipts. Their imports/assembly depend on the failed adapter as well as the incomplete recovery work. They do not establish unrestricted predecessor coverage, an expanded final interval, or a new exact root equivalence.

The checkpoint is an initial plan to recover the interrupted predecessor and continue assembly. It is not a final mathematical report. No new experiment result was completed in this history.

## Retained attempts and separate historical boundary

The 18 controller-listed files are the two source snapshots and two build receipts, one successful adapter object, setup/capability/reconciliation metadata, five mathematical sources, a checkpoint and three authored operational scripts. The successful Adapter5 build took 44.5946625 seconds; the failed Adapter4 build took 43.205242583 seconds.

Two five-module recovery commands were started, one for each higher chamber's five worker 101 certificates. Their start events are present; neither has a completed event or retained replay receipt. An authored replay loop and a process start are not proof evidence. There are no extra live evidence files attributable to either worker 101 or worker 102 beyond their archived/controller-bound histories at the supporting audit's observation time. No later worker's receipts are credited to worker 102.

The successful build source hash is `2ad0d7419e8dc85a2d9ff3a8524013f85b5a15303673401c1c1a7869b03d7197`; the failed adapter's source hash is `204c20ba8669dddbfb45384b9fa66950429769d244cb4c53660c3904624cb704`. The supporting validation audit records the source/object/archive bindings and exact event chronology. Compilation, completed replay and finalization remain separate statuses throughout this note.

All 18 controller-listed files agree with current and archived bytes, and all 285 worker 101 artifacts remain unchanged. Worker 102 started at `18:11:39.637535Z`; its last retained artifact is the successful Adapter5 build receipt, written at `18:14:39.786112Z`. The two unmatched replay queue starts precede the capacity error and `turn.failed`; the controller finishes at `18:15:21.095882Z`. No late or unarchived replay receipt supplies a missing completion. The setup's 298 initial and 289 reconciliation comparisons are not end-of-run preservation/finalization; no such final records were completed.

There is no invocation of the new replay script with a successful retained child receipt to audit as completed kernel evidence. The underlying inherited driver may be unchanged, but that fact cannot turn an uncompleted queue into a replay pass. Later recovery, if any, belongs to its own worker and date. The companion retained-validation and replay-method notes document this boundary without running a missing check.

## Completed supporting audits

- [Retained validation audit](markov_worker_000102_validation_audit.md), SHA-256 `85fc15b0f4d0070ce50d3feb768a9b912603ac11698565ee8a4f789d15d68a07`.
- Validation evidence JSON: `737171a0c18a49de5ea12cc5a27a5c2bfb7b2272f52542b208606d353d248e1f`.
- [Historical replay method](markov_worker_000102_replay_method.md), SHA-256 `c21a76b90978e99d001f47796245b72de68436b7942c4c08e1711c85c372e573`.
- Method evidence JSON: `669fd91dec8dbc7080af6ac7ef3bab8ae71d6747eaca68fca5b78dba4fe47b4c`.

The supporting audit rehashed its 639 directly recorded inputs unchanged at `2026-10-15T18:38:04.463985Z`; historical dependency graphs remain separately hash-bound. No successor check, missing replay, finalizer or repair was supplied by this audit.
