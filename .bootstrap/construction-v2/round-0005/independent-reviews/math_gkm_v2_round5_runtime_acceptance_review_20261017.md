# Round 5 independent runtime acceptance review

No necessary correction remains in the reviewed runtime, migrated supported-test and packaging scope at the exact source pins below. This is a read-only source/evidence disposition, not live-deployment or research authorization.

The supported suite has 49 distinct neutral tests with passing retained evidence: 51 executions, 50 passes and one preserved initial failure. The initial five groups used acceptance-pre-001; the two affected recovery tests used pre-002. This is not a single all-green full-suite rerun. All unaffected test AST, executed runtime and Lean source paths stayed unchanged; pre-003 changes only the packaging metadata collector.

| Group | Tests | Return code | Seconds |
|---|---:|---:|---:|
| acceptance-connected-001 | 1 | 0 | 560.063 |
| acceptance-context-001 | 14 | 0 | 320.784 |
| acceptance-lean-001 | 6 | 0 | 102.262 |
| acceptance-lifecycle-001 | 17 | 1 | 661.315 |
| acceptance-observer-001 | 11 | 0 | 186.529 |
| acceptance-recovery-002 | 2 | 0 | 27.369 |

The initial lifecycle failure was a stale test setup: it waited for researcher round-0000 even though the first proposer plan-0000 timed out and correctly prevented that researcher. The retained diagnostic remains unchanged. The corrected test kills the actual live controller while plan-0000 runs, observes duplicate lock rejection until the watchdog commits a receipt, then recovers once and prohibits subprocess replay. Its actual retained state has one call, one meta-call, one counted job and no active request. The passing assertions preserve receipt bytes and the pre-existing budget charge (tests/test_study_v2.py:205–248).

The affected reviewer interruption rerun also passed: exact frozen review-input and reviewer-receipt bytes remain unchanged, and recovery adds precisely one selector call/meta-call and one bounded selector charge. Final state records six jobs and reviewed_rounds=[2] (tests/test_study_v2.py:306–334). The STOP/removal/resume and duplicate-lock test passed in the initial lifecycle group (lines192–203).

The earlier round 3/4 runtime findings now have passing supported coverage: prepaid full episodes, protected paired/review budgets and call counts, finished-completion receipt recovery, actual distinct validation charges, impossible startup configurations, disclosed knowledge limits, terminal receipt/source/export binding, observer gaps, and connected next-request consumption. No mathematical-admission weakening was found. Mandatory required= closure and task.required_constants use credit remain distinct (lines345–378).

Packaging pre-003 only changes machinery/study_manifest.py: records the actual supported bounded commands, includes supervisor/review inputs, refuses overwriting existing output and chooses a unique default path. Its retained CLI check passed with no source mismatches; all 90 install source pins and six reproduction command lines match current files. This check is not an extra unittest.

| Snapshot | SHA-256 |
|---|---|
| acceptance-pre-001 | 223ed73633b9d6ef4c4c7f3ae11fdac638e3d9483dd95bab3ec56050669fc99f |
| acceptance-pre-002 | f512234cf44162a38ac349d048eadd2f50654498b5335e74d4433f27e05b4416 |
| acceptance-pre-003 | 20c4fb671bfd75ca432391f3c3b464bcafbf19d6f03a1bd5dfd60d6a7f8bf708 |

Current test module: `106dc95d0b616c4c24fdb348fc96db3e490b401af835431502c06225f90dc243`.
Current packaging module: `4f0f34c1523e40e40a9456ba27530b6f916ad93a20860ddd0f76d4851b262872`.
Validation summary: `db9f6254084f8b5b80282f2e47467be6670d456f8346d033422aeac62f728076`.

The JSON companion records all 85 current source pins, snapshot deltas, six result/log pairs, actual recovery state/receipt pins, documentation pins and the failed-run diagnostics. Builder final report and final artifact-index presentation may still be assembling; any later package review must name its own exact pins.

Limitations remain explicit:

- No candidate code, tests, Lean, models or fixtures were executed by this reviewer; retained builder evidence and static source were inspected.
- 49 distinct supported neutral tests have passing evidence across two test snapshots; this is not a single all-green full-suite rerun or repository-wide discovery.
- Deterministic fixture roles are not live external Astra behavior. Dependency-tree identity is explicitly mocked in fixtures; actual Lean compiler/kernel replay/premise tools are used where named.
- Host-local pinned-dependency reproduction is documented. Cold portable bootstrap and deployment containment/provider behavior are not established by these runs.
- Equal rounds and upper resource caps do not establish equal actual costs or broad strategic superiority. Protocol guard overhead is separately bounded and measured.
- Restricted request-program interpretation/selection is not arbitrary executable self-rewrite, actual host refinement, or a certified whole-incumbent continuation improvement.
- Observer measurements remain audit-only. Unknown encoding, minimum complexity and proof difficulty are not inferred from success/failure; direct root resolution is separate from measured proof encoding.
- These checks cover stated finite recovery paths, not all process races or host crashes. The watchdog test observes inherited lock exclusion and exact receipt recovery on this host.
- No Markov research, curation, canary, campaign or activation is authorized by this review. Explicit subsequent user approval remains required.
