# Independent autonomous-controller audit

This audit only checked and monitored the separately authored Astra implementation. It supplied no implementation, source repair, mathematical strategy, or proof hint. All executable probes used isolated temporary copies and deterministic fixtures. No live LLM call was made and no active project file was edited. The final source snapshot and SHA-256 inventory are in `final-reviewed-source/` and `FINAL_SUMMARY.json`.

## Observed practical results

- The full rollover probe executed **34 automatic worker invocations with a genuine 32-action epoch limit**. It preserved all 34 events, distinct request IDs, root contract, and cross-epoch feedback/agenda. The archived first epoch has exactly 32 events; the new epoch has count 2. It ended as resource-exhausted, not mathematically resolved. Runtime: 628.46 seconds.
- The initial copied fixture suite passed detached execution, stop/resume, duplicate exclusion, stale-state reporting, multi-action crash reconciliation without repeated effects, controller death with a surviving bounded watchdog, missing/malformed reports, killed/timeout workers, automatic next-worker feedback, and false fixture-completion rejection.
- That initial suite was **7/8**, with one environmental failure: its old completion verifier attempted full kernel replay before checking an obviously wrong target, then encountered `[Errno 1] Operation not permitted` during process cleanup. This is not counted as a successful Lean rejection.
- The revised exact-root negative test passed. A separate preserved invocation confirms a genuine nonzero Lean compiler exit, no timeout, and the specific type error: `True.intro` has type `True` but the wrapper requires `MathGKM.Markov.Conjecture63`. It was run with authorized local escalation after the restricted environment issue. The root was not weakened.
- The next source snapshot passed a two-worker loop that checked actual feedback, saved content-addressed file preimages, automatic exhaustion, and the new controller-active clock. The clock includes worker runtime.
- A clearly labeled isolated toy fixture tested the positive completion API: a proof of toy True and a refutation of toy False both passed with matching correspondence audits. Each remained unresolved without an audit and rejected a missing audit obligation. These are API checks, not proofs about Markov.
- The original comment-screening false positive was reproduced and subsequently retested after the builder's fix. Source preparation now accepts the legitimate MarkovLogConcavity/MarkovExamples dependency chain. This retest checks preparation only; the selected partial theorem was never presented as a completed root proof.

## Current code and documentation assessment

The controller contains a genuine outer loop delegating research to a separate bounded Astra invocation and consuming its actual report before choosing another invocation. The exact goal and source meaning are pinned; inherited subgoals are explicitly revisable advice. The controller retains context across protocol epochs and uses durable action states and worker receipts to avoid replaying completed effects. Detached watchdogs retain workspace and goal locks. Resource and operational outcomes are distinguished from mathematical resolution.

The root completion wrapper requires precisely the pinned proposition or its negation. Compilation, replay, permitted axiom closure, and an independently supplied source-correspondence audit all participate in admission. The documentation correctly calls this experimental execution, not a certified proof about the Python controller, LLM utility, arbitrary future changes, or full Goedel-machine self-improvement.

Later changes were reviewed as source deltas: additional protected-file hashes, blocking receiptless live PIDs before resume, recovering an earlier audited completion claim, nested-comment screening, compiling before replay, `-j 1`, process reaping, and diagnostic traces. The complete earlier suite was not blindly labeled as a complete latest-revision rerun; exact tested snapshots are retained per artifact.

## Remaining observations and scope

1. `docs/CONTROLLER.md` calls `controller_active_seconds` a separate measure of controller/protocol/validation overhead. The actual field measures all active controller elapsed time, including worker runtime. This is a small wording mismatch, not a mathematical or stop/resume failure.
2. The standalone `Engine.request()` still returns a stored pending request before checking an interrupted active transaction. Its `consume()` refuses the interrupted transaction, and the new Controller explicitly recovers before calling request, so the controller path tested here does not bypass recovery. The standalone API observation remains documented rather than silently forgotten.
3. This audit did not launch the live CLI transport. Real two-worker continuation, actual provider feedback and usage remain to be observed in a separately authorized live smoke run. Constructing the correct argv and passing deterministic fixtures is not equivalent to observing a live model run.
4. The exact-root negative and toy-positive tests establish useful admission behavior, not that arbitrary mathematical source correspondence is automatically decided. The final independent mathematical audit is an explicit resolution-boundary requirement.
5. Markov Conjecture 6.3 remains unproved. No operational test is counted as mathematical progress or completion.

All current reviewed source bytes matched their recorded hashes at the final comparison. If the active builder changes them later, this report applies to its recorded snapshots until the delta is reviewed.
