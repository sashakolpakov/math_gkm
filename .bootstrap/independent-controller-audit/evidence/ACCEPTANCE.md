# Practical acceptance criteria for autonomous goal continuation

Scope: independent review of the machine-authored controller. No live LLM calls,
active source edits, mathematical strategies, or unrelated infrastructure changes
are part of this review. Deterministic fixture observations must remain labeled
as fixtures and cannot establish mathematical discovery or resolution.

| Requirement | Observable acceptance evidence | Failure case to check |
| --- | --- | --- |
| Actual autonomous loop | One start/run command makes at least two proposer calls without human response-file handling; the live adapter invokes the working Astra transport. | CLI writes a request and stops, or requires a supervisor to launch every next worker. |
| Feedback changes continuation | Second fixture decision demonstrably consumes a first execution result, including an error when appropriate; requests retain exact goal and evidence. | Repeated independent prompts or scripted actions ignoring observations. |
| Beyond 32 actions | More than 32 recorded actions complete across at least two automatic epochs, preserving the root, agenda, provenance, and earlier evidence references. | Exhaustion at action 32, reset that discards prior context, repeated epoch IDs, or weaker replacement goal. |
| Explicit resource outcomes | User-selected limits stop work as exhausted, with measured usage and resumable records; continuing mode has no accidental one-round ceiling. | Timeout, worker budget, or action budget reported as mathematical completion. |
| Normal stop and resume | Stop prevents a new worker and terminates or reconciles the current one; resume continues the same goal and history. | Stop ignored until a long worker exits, an extra worker launched after stop, or resume creates an unrelated run. |
| Durable interruption | After termination at different action boundaries, completed effects are not repeated and uncertain effects are explicitly reconciled. | Marking a batch consumed before its actions leads to silently lost work or replayed effects. |
| Worker failure | Missing/malformed final reports, nonzero exit, timeout, and stale running records generate honest observations and a recoverable operational state. | Failure is converted to success, permanently wedges the pending request, or loses useful artifacts. |
| Single controller and shell independence | Duplicate starts fail while the original controller remains controllable; documented detached execution survives launch-shell exit. | Two workers simultaneously own one goal or the background process dies with its shell while status stays running. |
| Exact goal preservation | Pinned English meaning, formal target, permitted assumptions, and source correspondence remain the same across workers and epochs. | A partial/conditional/bounded/normalized theorem closes the universal root, or the target's meaning changes under the same name. |
| Genuine completion route | A proof or exact refutation must pass the configured Lean check and source/English correspondence obligations before resolved status. An inadequate claim is rejected and research can continue. | A prose success flag suffices, fixtures resolve mathematics, or the interface can never accept even a valid completed proof. |
| Broad research actions | The worker can execute ordinary Lean, experiments, and hosted literature work; their actual outputs enter later context. | Full Lean/source actions remain indefinitely pending or are confined to the old tiny proof vocabulary. |
| Status truthfulness | Running, stopped, exhausted, operationally blocked, and resolved describe distinguishable durable states, with last activity and failure reason. | A live worker is shown stopped, a dead worker is shown active indefinitely, or fixture/live provenance is mixed. |

The review will first inspect the implementation and machine-written tests, then
run suitable copied fixture tests or small independent probes in /private/tmp.
Reusing existing working transport settings is appropriate; new transport design
or a new mathematical strategy is not an acceptance requirement. Reboot autostart
is unnecessary if manual resume after reboot is correctly documented.
