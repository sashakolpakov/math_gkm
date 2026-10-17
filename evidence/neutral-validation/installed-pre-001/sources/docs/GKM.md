# Gödel machines, Kolmogorov complexity and this research loop

This guide describes the implementation and checked model in this repository.
The [design](DESIGN.md) remains the original specification; this guide does not
amend it. For mathematical results, use the dated [research status](RESEARCH_STATUS.md).
For the categorical construction, use [Gluing](GLUING.md).

## Schmidhuber's Gödel machine

Schmidhuber's machine contains both a problem-solving program and a proof
searcher. Its formal assumptions describe the machine, initial code,
environment and a problem-dependent utility. A proposed self-rewrite needs a
proof that switching is better than continuing the incumbent, including the
incumbent's future search for other rewrites. This explains the global-comparison
claim: the alternative is the whole continuing program, not a frozen version
forbidden to improve. The claim is relative to the formal assumptions, utility,
resources and provable statements. It does not guarantee that a useful change
will be provable or found in time. The switch protocol must account for the
state and time at which installation takes effect. See Schmidhuber's
[original paper, §§2–5](https://arxiv.org/html/cs/0309048v5).

In this project, that lineage is a demand for explicit semantics and evidence.
An LLM's recommendation, a faster benchmark, or a shorter proof script is not a
Gödel-machine switch certificate. Conversely, exploratory research already
allowed by the incumbent policy need not prove its own optimality before every
web query or experiment.

## Three different implemented layers

| Layer | Actual role | What its success establishes |
| --- | --- | --- |
| Mathematical research | Live bounded LLM workers use literature, Python, available GAP/Sage, Lean and revisable agendas. | Particular outputs and recorded outcomes; theorem claims still need checking and scope review. |
| Formal continuation model | `MathGKM.Continuation` defines executable engine bodies, observations, transitions and costs, with a guarded transformation. | Its precise preservation and utility comparison for the declared semantics. |
| Host orchestration | Python controller, worker/watchdog, receipts, completion checks and supervisor review. | Operational evidence and enforced checks within that implementation's trust boundary; no proved refinement of every host action to the continuation model. |

The live proposer is not restricted to a small menu of prewritten mathematical
recipes. [controller.py](../machinery/controller.py) requests ordinary research
using actual shell tools and hosted source search. [worker.py](../machinery/worker.py)
sets the granted tool/permission boundary. Availability matters: an unavailable
Sage installation is a capability failure, not a mathematical negative result.
The small bootstrap [broker](../machinery/broker.py) and structured
[proof gate](../machinery/gate.py) remain useful protocol examples; their limited
AST vocabularies do not describe the whole live researcher's action space.

The proposer chooses conjectures, representations, tests and proof attempts.
The independent reviewer checks retained results and their correspondence to the
stated problem. Keeping those roles separate prevents a successful self-report
from acting as its own acceptance decision. This separation does not assert that
reviewers or tool implementations are infallible.

## One complete research iteration

1. **Bind the problem.** The controller uses a versioned contract with an exact
   root, assumptions, source correspondence requirements and resource limits.
   The [Markov contract](../contracts/markov-goal.json) fixes raw coefficients,
   all directions, zeros, endpoints and universal scope.
2. **Provide context.** The next worker receives recent observations, agenda and
   validator feedback, plus paths to retained history. The agenda is advice;
   it can change without changing the root.
3. **Explore.** The LLM reads sources, invents representations, writes programs,
   runs available tools and attempts proofs. Actual commands, outputs, failures
   and timing are retained. Literature and finite computations have their own
   evidence status.
4. **Check particular claims.** Compilation, kernel replay, explicit axiom
   closure and source/object/version bindings answer different questions.
   A conditional theorem proves its implication, not its antecedent. A partial
   theorem can be useful without resolving the root.
5. **Continue or resolve.** Reports and failures inform later workers. A claimed
   resolution must pass the exact-root completion path and independent
   source/English correspondence review. Timeout or transport success alone
   does not resolve mathematics.

The controller can continue across worker and accounting-epoch boundaries.
Those epochs are resource bookkeeping, not mathematical levels. The inherited
ARC work supplies historical ideas about retained reusable solver structure;
its game levels, scores and allocation heuristics are not imported as a utility
or schedule for mathematical research. See the upstream
[ARC artifact-study account](https://github.com/sashakolpakov/gkm/blob/main/arc/README.md)
for that separate application.

## The certified change that is actually proved

[Continuation.lean](../MathGKM/Continuation.lean) extends the smaller
[Machine.lean](../MathGKM/Machine.lean) interpreter. An engine has a natural
padding count and a finite body built from `halt`, `work`, `search` and
`install`. Bodies can install engines that search and install again. Both
compared continuations include those future changes.

The environment is exactly

```text
Environment = Request → Core → Response
```

It can depend on scientific state and the accumulated journal, but cannot inspect
accounting padding or elapsed cost. Replies may supply arbitrary answers,
replacement engines and finite delays. No correctness or success probability of
those replies is assumed. This environmental domain is a mathematical
restriction, not a claim about real LLM APIs or time-dependent web services.

`view` retains the core and engine body while forgetting padding. `strip` removes
current padding, preserving that view. With the declared abstract costs,

```text
changeCost(s) = 2 + size(s.engine.code)
tryChange(s) accepts exactly when changeCost(s) < s.engine.padding
U_R(outcome) = R(outcome.observations) − outcome.cost
```

For every accepted change, every positive finite number of rounds, every allowed
environment and each fixed function `R : List View → Int`, `verified_change`
provides actual executions of both branches, equality of their complete
round-boundary observation traces and strictly larger candidate utility,
including installation cost. The proof uses the [glued transition](GLUING.md)
and a separate cumulative cost argument. The incumbent is allowed to improve
later; the examples explicitly show later installations making the two states
coalesce.

This is a theorem for the family of objectives **reward of the common trace minus
cost**, not for arbitrary mathematical preferences. It does not identify the
reward with theorem count, novelty, compression, or time to first proof.
`additional_change_cost` permits an explicit extra remaining cost under a stronger
bound; it supplies no measured bound on real verification. In older explanatory
notation `K(s)` denotes this change cost, **not Kolmogorov complexity**.

The model has finite straight-line bodies repeated at round boundaries, abstract
unit costs and the stated response interface. It does not model every Python
operation, Lean elaborator effect, asynchronous LLM call or arbitrary interpreter
rewrite. Universal finite-horizon results do not by themselves define an
infinite-horizon utility. The complete theorem/negative-example inventory is in
[Construction mathematics](CONSTRUCTION_MATHEMATICS.md).

There is also an older host [SwitchGate](../machinery/switch.py). It checks a
certificate for the simpler `Machine.concrete_switch` model and can install an
**experimental profile**. Its `certified=True` path explicitly rejects because
host refinement, actual cost and timed-response coupling remain unproved. It
does not automatically install the richer `Continuation` theorem as a certified
Python/LLM rewrite. The live controller likewise protects its implementation
identity and requires review of changes. No arbitrary self-edit is promoted by
calling it a Gödel-machine action.

## What “Kolmogorov” means, and what is measured

Fix a universal prefix machine `U`. For finite encoded objects, conditional
prefix complexity is

```text
K_U(x | y) = min { |p| : U(p, y) halts with output x }.
```

The reference machine and encoding matter; changing universal machines changes
complexity by an additive constant. `K_U` is uncomputable in general. A retained
program that reconstructs `x` supplies a description, hence an upper bound after
its encoding/interpreter overhead is included; it does not prove minimality.
A short description conditional on a library makes that library an explicit
condition. Compression by a fixed executable codec is a computable measurement,
not an oracle for `K_U`. See Grünwald and Vitányi,
[Algorithmic Information Theory, §§2 and 4](https://arxiv.org/html/0809.2754).

In `math_gkm`, the useful question is how a result was represented and what it
reused. Keep that descriptive question separate from whether the proposition is
true and whether it resolves the problem.

| Quantity | Status here | Interpretation |
| --- | --- | --- |
| SHA-256 identities and dependency/source manifests | Retained by provenance and validation code | Bind exact bytes and declared/resolved dependencies; a hash is not a complexity score. |
| Source bytes, declaration inventories, import counts | Available from artifacts and static audits | Explicit representation statistics, not shortest-description lengths or measures of mathematical value. |
| Process time, captured bytes, worker runtime and provider usage when reported | Operational records | Resource observations with different units and scopes; not interchangeable with abstract Lean costs. |
| Compressed size, conditional description length or an MDL ledger | Possible audit conventions, not an implemented universal estimator in this core | Meaning requires the codec, encoding, library and reconstruction rule. No value is inferred when no such audit was run. |
| True `K_U` | Mathematical reference concept | Not computed, optimized or used to certify novelty. |

**Complexity is audit-only.** It is excluded from admission, curiosity/reward,
action selection, agenda ranking and switch approval. The contract says so;
[engine.py](../machinery/engine.py) repeats the instruction, and
`Broker.context()` recursively removes the named `complexity_audit`,
`kolmogorov_audit`, `description_length_audit` and `compression_audit` fields.
[Boundary tests](../tests/test_boundaries.py) and
[context tests](../tests/test_round2.py) exercise invariance under changing those
fields, including nested metadata.

Those checks cover specific interfaces. They are not a theorem of information
flow over an LLM that can read research files, nor a proof that arbitrary prose
cannot encode a number. The live policy must continue to honor the separation.
Ordinary resource limits still apply, and the work of collecting audit data has
real cost. There is no universal task utility: scientific preferences belong to
the explicit problem contract, and heuristic judgments must be labelled as such.

## Reading evidence without enlarging the claim

A source file, a compiled object, a successful replay and an explicit axiom print
are distinct evidence. Later successful recovery does not erase an earlier
failed or timed-out attempt. Imported compiled bodies do not become freshly
replayed simply because a new theorem cites them. Exact pins preserve identity;
they do not prove that every historical object was built from its accompanying
source or that the host implements the formal semantics.

The [completion validator](../machinery/completion.py) uses a separate exact-root
path, including fresh project-dependency rebuilding and replay, then requires a
hash-bound independent correspondence audit. The ordinary partial-result archive
is not itself such a completion certificate. See [Controller](CONTROLLER.md) for
these boundaries and [Research status](RESEARCH_STATUS.md) for the current scope.
