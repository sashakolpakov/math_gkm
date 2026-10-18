# First two exploration attempts: Astra and Sol

Observation cutoff: **2026-10-18 14:25 UTC / 16:25 Europe/Zurich**. This memo records the completed first two researcher attempts only. The final Sol receipt and frozen round-0001 snapshot were inspected before this cutoff; operational state observations are bounded samples, not continuous observations. No later research is included.

This was a read-only status review: no proofs, tests, experiments or mathematical values were executed or recomputed; no research files were edited and no research role was contacted. This memo is for user/reference archival, not input or advice to either research arm.

## Matched observations

| Observation | Astra exploration, attempts 0–1 | Sol exploration, attempts 0–1 |
|---|---|---|
| Researcher outcomes | Attempt 0 delivered a completed report in 215.571417s; attempt 1 ended `failure_within_time_budget` after 300.078204s, with null payload. | Attempt 0 delivered a completed report in 267.932222s; attempt 1 ended `failure_within_time_budget` after 300.023203s, with null payload. |
| First report ingestion | Rejected: `claim, uncertainty or outcome consequences changed after commitment`. | Rejected for the same reason. |
| First mathematical activity | Source inspection and 33 recorded cases: endpoints plus all Boolean paths of length at most four. Saved results report 4,047 positive directional determinants (1,522 boundary-touching, 2,525 interior) and 744 passing scalar-evaluation comparisons. | Source-correspondence inspection and two recorded first-step expansion checks, at labels (1,3) and (2,3). Formula alignment was reported; universal source correspondence remained open. |
| Second retained candidate | A generic integer subtraction-defect identity, conditional log-concavity lemma and coefficient-subtraction law. A saved researcher-run Lean invocation returned 0 and printed permitted axiom dependencies. | A universal arithmetic label-coverage theorem: for every coprime natural pair `0 < a < b`, some finite Boolean path has exact pinned `frame(path).mid` labels `(a,b)`. Root and candidate compilations returned 0 twice, followed by a checking import. |
| Important limitation | In 635 sampled right-child horizontal triples, the proposed nonnegative mixed term was negative 32 times, including 29 interior triples. This rejects that proposed sufficient-condition invariant; it does not refute the conjecture. | Label coverage does not identify generated polynomials with the published family, recover homogeneous coefficients, establish geometric correspondence or prove log-concavity. |
| Independently admitted knowledge/components | Zero at the observed state. | Zero at the observed state. |

Both second attempts left useful-looking local artifacts despite failing to deliver a final structured payload within the researcher budget. In particular, Sol's checkpoint says that one typed claim is submitted, but the actual receipt has `payload: null`: the intended submission was not a delivered independent-admission request.

The saved Sol compilation outputs list `propext`, `Classical.choice`, and `Quot.sound` for its coverage statements. The file named `replay.json` records a second local compilation sequence; it is not an independent harness admission receipt. The Astra local checker likewise remains researcher-generated evidence. No reviewer assertion is promoted here to mathematical admission, and no completed reviewer outcome after these attempts is credited by this memo. The conjecture remains open in both observed states.

## Exact prospective-record rejection

For both first reports, the selected hypothesis's claim and outcome-consequence fields were unchanged. Its uncertainty text changed. The operational guard in `machinery/study_policy.py`, function `validate_execution`, compares every selected commitment field literally before checking alternatives. Therefore the selected uncertainty mismatch is sufficient for the observed rejection.

**Sol — `H-source-correspondence`**

Before, in the committed request:

> The contract requires seven correspondence obligations; the primary source has not yet been inspected in this episode. Formula agreement, rational coverage and proof scope remain distinct questions.

After, in the delivered report:

> Formula alignment was observed, but universal coverage, source-family identification, homogeneous coefficient recovery and independent correspondence checking remain open.

The other three Sol hypothesis uncertainty strings also changed; their claims and outcomes stayed unchanged. The selected-field check fails first, so the later alternative checks need not be reached to explain the recorded rejection.

**Astra — `H-boundary`**

Before, in the committed request:

> No determinant inventory has been computed, and the finite sample may fail to distinguish the strategies.

After, in the delivered report:

> The fixed sample selects the recurrence-analysis branch. Its usefulness for a universal proof remains undemonstrated.

Astra's four alternative uncertainty strings also changed. This is observed friction between a frozen prospective record and after-trial reporting in both runs. This memo neither labels it a parser bug nor assumes the changes were harmless.

## Observed portfolio and episode behavior

Both runs retained alternatives and planned a bounded two-round episode. Sol selected source correspondence, then arithmetic coverage, while retaining recurrence-defect and homogeneous-representation alternatives; both trials had `invention: false`. Astra selected boundary diagnostics, then recurrence analysis with `invention: true` for the second trial.

Both second planning records explicitly treated the retained first-round artifacts as unverified after report rejection. Sol's documentary use link remained `reported_use_pending_checked_interface`; no checked reusable component was admitted. The observed Sol program remained empty and no policy replacement was installed.

Both pursued general auxiliary questions rather than only incrementing a fixed numerator. Astra combined general algebra with finite diagnostic examples; Sol attempted a universal statement about all interior reduced rational labels. These are different trajectories within the v2 exploration mechanism, not an old-v1 versus new-v2 experiment. A single two-attempt comparison, with changed model and validation infrastructure, does not establish causal model superiority or long-run research quality.

## Evidence locations

Production repository prefix: `/Users/sasha/math_gkm`.

Sol arm prefix:
`.control/markov-v2-sol-20261018/study/arms/exploration/`

- `jobs/plan-0000/receipt.json` and `jobs/round-0000/request.json`: prospective first trial and exact selected uncertainty.
- `jobs/round-0000/receipt.json`: delivered first report and revised uncertainty; SHA-256 `fa1225976beb09ca95a26f4e637e0de82748aff65fee0a470fe77680480f8823`.
- `jobs/plan-0001/receipt.json` and `jobs/round-0001/request.json`: second trial, retained alternatives and episode allocation.
- `jobs/round-0001/receipt.json`: budget failure and null payload; SHA-256 `6b414562ea8556e4e08f93ea9dd3f6eed1c1f8972e11805010fb683f493f7b65`.
- `snapshots/round-0001/source/MathGKM/Plan0001Coverage20261018T141715Z.lean`: `weighted_coverage` and `rational_label_coverage`; SHA-256 `4225b2d16c51b8e5c59bb58ca52cc277be51ef98eaffeea47f0e60fcec6d64f4`.
- Under that same snapshot's `research/`: `plan0000_source_audit_20261018T141025Z_branch_result.json`; `plan0001_coverage_20261018T141715Z_first.json`, `_replay.json`, `_scope.json`, `_analysis.md`, and `_checkpoint.json`.
- `state.json`: sampled before cutoff, containing the rejection observation and empty knowledge/components; this remains a mutable operational file, not a frozen cutoff artifact.

Astra arm prefix:
`.control/markov-v2-20261018-restart/study/arms/exploration/`

- `jobs/plan-0000/receipt.json`, `jobs/round-0000/request.json`, and `jobs/round-0000/receipt.json`: first commitment, completed report and exact uncertainty change.
- `jobs/plan-0001/receipt.json` and `jobs/round-0001/receipt.json`: second planned invention trial and budget failure.
- Under `snapshots/round-0001/source/research/`: `plan-0000-r1-20261018T110921-inventory.json`; `plan-0001-r1-20261018T111515-Determinant.lean`, `-checker.json`, `-mixed.json`, and `-checkpoint.md`.
- `state.json`: stopped-run rejection history and empty admitted knowledge/components.

Earlier standalone Astra review: `/private/tmp/math_gkm_astra_mathematical_progress_review_20261018.md`, SHA-256 `eb92264306ebdd841699027da6d82077f94792870332a0c89115f40a727f48f8`. Its scope is broader; this memo credits only the first two exploration attempts.
