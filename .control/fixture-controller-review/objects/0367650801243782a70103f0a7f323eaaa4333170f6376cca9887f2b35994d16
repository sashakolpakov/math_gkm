# Foreground supervisor transport interface

No daemon or nested Codex/API process is used. The supervisor runs one writer
per run and provides OS isolation/resource caps for its worker and model transport.

Resume the existing pending request:

    /opt/homebrew/bin/python3 -m machinery.engine request --run evidence/round2/research-run

Send that JSON context to the actual gpt-6-astra transport. Return an object with
request_id, context_hash, origin="supervisor_transport", decision, actions, and
provider metadata (actual model/request id, usage, elapsed time). Actions contain
kind and payload. This message is exploratory input and never proof authority.
Write it to a workspace file, then run:

    /opt/homebrew/bin/python3 -m machinery.engine consume --run evidence/round2/research-run --file requests/response.json

The command executes the supported batch, records failures, and returns the next
request. Existing response files must not be overwritten; stale/replayed replies
are rejected. An in-flight interrupted batch is quarantined for audit, never
silently retried. Do not modify the fixed mission or design to unblock a batch.

Start another bounded run:

    /opt/homebrew/bin/python3 -m machinery.engine init --run evidence/new-run --file contracts/round2.json

Capabilities: experiment(tool="python_pure", program, data), proof/refutation
(target/proof AST, dependencies, optional close_root), literature(query/url),
strategy, representation, conjecture, attachment(cells), rewrite, lean_source.
Full Python/GAP/Sage and arbitrary Lean requests are pending execution records.
The supervisor must preserve request/source/input hashes, contain the worker,
and return its own independently captured outputs; writable caller citation
fields cannot become authenticated retrieval evidence. A protected observation
service and independently attested provider channel still need activation.

Reproduce local checks without package resolution or downloads:

    /opt/homebrew/bin/python3 -m machinery.check

Evidence is written below evidence/round2; first-round records are retained.
requests/freeze-boundary.json specifies the separate admission-freeze request.
Do not infer protected admission from this document or from passing tests.

External worker/retrieval responses can be fed through an external_observation
action: payload has event_index, action_hash (canonical SHA256 of the pending
action), and observation (captured source/output/provider metadata). The broker
checks pending-request identity and rejects duplicate responses. It deliberately
labels these external_observation_claim, verified=false; only a protected
supervisor service can authenticate their origin. This action counts against
the contract action budget and its result appears in the next proposal context.
