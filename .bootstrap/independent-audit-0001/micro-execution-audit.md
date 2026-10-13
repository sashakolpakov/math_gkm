# Follow-up semantic audit: explicit micro-execution

Inspected `MathGKM/Machine.lean` SHA256
`eff72e2f2d558a96b27eb1d90cf91fff6a658a8f628bcf87f965138bdc01f3de`
(5,487 bytes). This is a read-only source-level audit of the intended semantics.
Independent compilation and axiom auditing are separate; the active machine
may still be fixing compilation issues. No implementation or proof edits were
made by the reviewer.

## Material improvement since the first snapshot

The earlier criticism that reference/candidate costs were merely assigned to
Engine labels is no longer an adequate description of this version.

`MicroInstruction` now defines `account` and `execute`. `engineCode` maps the
reference engine to `[account, execute]` and the candidate to `[execute]`.
`executeMicro` interprets those lists: each opcode incurs one abstract unit;
`execute` performs `step` and incurs the declared operation cost as well.
`dispatch` executes this code rather than merely selecting a cost number.
`run` uses the resulting state and cost at every tick.

The proposed `dispatch_state` and `dispatch_cost` theorems link this executable
micro-semantics to the high-level transition and cost formula. The continuation
theorems then cover every natural-number horizon, starting state, and input
tape, including later instruction-list rewrites. This is a concrete abstract
optimization: remove a redundant administrative opcode while preserving the
modeled observations. It is more substantial than a frozen outcome table or
an unsupported assertion that one label has lower cost.

The literal `dispatchCost` definition remains, but its role has changed: the
model is intended to derive that cost from interpreted engine code. It would
be stale feedback to ignore this connection.

## Exact scope and remaining obligations

- Each opcode costs one *abstract* unit. The source expressly disclaims a
  wall-clock interpretation. A verified claim about this unit-cost interpreter
  can be accepted without asserting that Python or the LLM is faster.
- `operationCost` still models external delay and rewrite overhead with supplied
  values. Their adequacy for an actual research implementation is a separate
  environmental/execution assumption.
- The quantified continuation has a finite but arbitrary number of ticks. It
  includes subsequent object-program replacements. The Engine argument remains
  fixed throughout `run`; no state transition installs or replaces that engine.
- The additional overhead k is still a free parameter. `k < n` is the exact
  threshold for strict improvement in this cost model, not yet an independently
  established actual validation-and-installation bound.
- Numbers recorded from inputs are not modeled as kernel-checked propositions.
  Abstract authorized responses do not establish real proof-admission soundness.
- The transition from actual controller requests, proofs, model responses,
  resources, state migration, and future self-modifications to this interpreter
  remains to be identified and validated. A correct finite interpreter example
  should not be advertised as that whole-researcher connection.
- The utility consequence still depends on the problem contract: equal final
  modeled state and lower modeled cost is not a theorem for every utility or
  every environment with different deadline-dependent responses.

## New response-timing negative example

`time_dependent_response_counterexample` gives the two engines different input
answers based on their different dispatch costs and proves distinct archives.
This appropriately demonstrates that preservation does not hold when the
corresponding-input assumption is dropped. Its comment motivates a service
that returns request time; the formal theorem supplies different tapes rather
than defining an actual clock-aware service. Report it at that precise scope.

## Review disposition

Credit the explicit executable micro-semantics and its intended refinement
lemmas as useful foundational progress, subject to successful independent Lean
checking. Withdraw the earlier cost-label-only criticism for this version.
Keep the actual installation, full-controller correspondence, environment,
admission, and utility obligations distinct. No source-level full-Gödel claim
is present in this inspected version.
