# Mathematical construction checkpoint, 2026-10-13

Machine-authored by the actual Codex/gpt-6-astra proposer. This checkpoint proves
a finite-horizon self-change theorem for an executable mathematical machine. It
does not complete the Agoh-then-Markov mission. Lean 4.32.2 and the pinned Mathlib
are fixed mathematical dependencies. No global self-soundness principle is used.
The theorem concerns the defined Lean programs. It does not identify their
transition relation with every action of the external research controller.

## Objects, domain, and objective

The definitions and proofs are in `MathGKM/Continuation.lean`. They extend the
current reconstruction's `Machine.lean`, rather than importing a retired model.

A state consists of a scientific state, an interaction journal, and an engine.
The scientific state is the existing program/archive/agenda/pending/history
record. Its programs can record a natural number, request an answer and possible
scientific replacement program, or rewrite themselves. An engine is a natural
number of redundant accounting instructions followed by a finite executable body.
Bodies have four constructors: halt, execute one scientific instruction, search
for an engine, and install an engine. Search and installation are **inside** the
engine language. Installed engines have the same language and can search and
install again. A body finishes its current invocation before a new body is used
in the following round. Without an installation, the current engine is repeated.

`Environment = Request → Core → Response` is the precise environmental domain.
An environment is an arbitrary total deterministic function of the request,
scientific state, and accumulated journal. Responses include scientific input,
an optional arbitrary engine, and a natural-number delay. The same function is
used on both branches. It cannot inspect the engine's accounting padding or
elapsed cost. All delays are finite. This is an explicit mathematical restriction,
not an assertion about real services or a probability model. The journal includes
every work/search invocation and its scalar answer. No success probability,
correctness of answers, or improvement of later installations is assumed.

`eval` interprets every instruction in the current finite engine body. `tick`
executes its accounting instructions and body. `Transition env s t c` says that
one round has resulting state `t` and cost `c`; `Execution` composes this relation.
`run n` executes **exactly n whole engine rounds**. There is no freezing of later
search or installation. The observation trace contains the initial state and all
round-end states, with only current accounting padding forgotten. It includes
the scientific program/data, journal, and engine body. It has n+1 observations.

Cost is an explicit abstract unit-cost semantics. Accounting instructions each
cost one, round dispatch costs one, scientific execution uses the already proved
`Machine.dispatch` cost, and response delays are added. Installing an engine
costs `1 + size(body)`; `size` traverses nested installation operands too. Search
costs one plus its delay and any installation. These are definitions of the
mathematical machine's cost, not claims about seconds, byte allocation, or Lean
proof-checking time. Natural-number operations and padding counts are unit-cost
data in this model; the model does not charge a bit-complexity cost for them.

The transformation `strip` sets current engine padding to zero. It leaves the
entire scientific state and engine body intact. Its remaining cost is
`K(s) = changeCost s = 2 + size(s.engine.code)`: one arithmetic guard operation
and installation. The theorem itself is already available at the comparison
state; its prior proof search/checking is sunk on both branches. If more work
remains, `additional_change_cost` explicitly adds **any** natural cost `extra`
and requires `extra + K(s) < s.engine.padding`. It supplies no bound on a real
proof check. Installation consumes no environmental reply and changes no core
observation. Time-sensitive environments would require another theorem.

For any **one fixed** function `R : List View → Int`, the objective is

    U(outcome) = R(outcome.observations) - outcome.cost.

`switchRun` and `afterChange` include the initial change in the outcome's cost.
Both branches are passed to this same `U`. Lower cost implies higher utility
here because the proof establishes equal observation traces and integer
subtraction is strictly decreasing in cost. This is not asserted for arbitrary
utilities. This objective values saved cost even if neither branch solves a
scientific problem. Reciprocal time to first verified root resolution is a
different objective and is not claimed as the theorem here.

## Proved results and their dependencies

The following are theorem families, not conjectures. The indicated examples are
in `MathGKM/ContinuationExamples.lean`, except where another file is named.

| Result | Precise meaning and assumptions | Proof dependencies | Positive and missing-condition examples |
|---|---|---|---|
| `accounts_state`, `accounts_cost`, `tick_state`, `tick_cost` | For every finite accounting count, the state is unchanged and exactly that count is charged; tick adds the body and dispatch costs. | Induction on the actual `accounts` interpreter; natural arithmetic. | `concrete_costs`; `padding_order_needed` shows observable equality does not mean equal cost. |
| `run_execution`, `execution_unique` | Every `run n` realizes the transition relation; every n-round execution of that relation has exactly the computed endpoint and cost. | Induction on n / the execution derivation. | `two_later_engine_changes`; an arbitrary externally chosen endpoint is not an execution unless each transition premise holds. These theorems have no omitted environmental correctness assumption. |
| `eval_simulation`, `tick_simulation`, `tick_view` | With the same core and body and candidate padding at most incumbent padding, evaluation has identical body cost and preserves that relation. The tick-cost difference is exactly the difference in current padding. Equal views suffice for equal next views even without padding order. | Structural induction on all engine constructors; equality of oracle calls; existing executable scientific dispatch. A search installation puts the same returned engine on both sides. | `two_later_engine_changes`; `body_compatibility_needed`, `padding_order_needed`, and `response_hypothesis_needed` exhibit the separate missing premises. |
| `Gluing.universal`, `descend_predicate` | For **any** span of types B←A→C, compatible maps to D have a unique extension from the quotient of B+C. A predicate of that extension holds everywhere iff it holds on both components. | Existing `square`, `descend`, `unique`; quotient induction. | `gluing_observation_example`; existing `Gluing.conflicting_binding` proves incompatible Boolean bindings cannot extend. |
| `gluedTick`, `gluedTick_unique`, `gluedEquivView` | For this machine's span, transitions extend uniquely; the glued object is equivalent to the exact observation type, so no different data or body is accidentally identified. | `tick_view` proves compatibility; `Gluing.square`/`unique`; quotient induction constructs inverse maps. | The research state's two embeddings agree after stripping. `cost_does_not_descend` proves that costs cannot be included in this padding-forgetting interpretation. |
| `continuation_observations` | For all finite n and all environments in the domain, equal initial views give identical complete observation traces. | **Both** traces factor through `gluedTrace`; the boundary square identifies their starts, and `gluedTick` supplies the preservation step. Thus gluing is an actual dependency of the main proof. | `research_improves` quantifies over all future environments; `response_hypothesis_needed` shows different padding-dependent replies break preservation. |
| `continuation_simulation`, `continuation_first_gain` | For all finite horizons, ordered padding implies ordered total cost and the relation on final states. At any positive horizon at least the initial padding difference is saved. | Induction using `tick_simulation`. No persistence of later savings is assumed. | `no_frozen_incumbent` proves that an immediate self-improvement leaves only two saved units for **every** later horizon. |
| `main` | If K(s) is less than current padding, then for every n≥1, every allowed environment, and every fixed R, stripping preserves the entire observation trace, preserves the final-state relation, and strictly increases U including change cost. | `continuation_observations` through gluing, `continuation_simulation`, `continuation_first_gain`, and integer arithmetic. | `research_improves` is universal in horizon/environment/reward. `change_cost_defeats_saving`, `zero_horizon`, and `utility_hypothesis_needed` show why cost, positive horizon, and utility choice matter. |
| `accepted_change`, `installed_main` | The executable arithmetic guard returns an actual state/cost pair only under the proved bound; continuing **that returned state**, charging **that returned cost**, has higher U than the whole incumbent continuation. | Reduction of `tryChange` and application of `main`. | `installed_example`; `guard_is_incomplete` shows rejection need not mean that a change is useless at a longer horizon. This guard is sufficient, not complete. |
| `verified_change` | Every accepted executable change has both an incumbent and candidate continuation in the transition relation, with the installation cost added, equal observation traces, and strictly greater candidate utility. | `run_execution` and `installed_main`, hence the gluing and cost proofs above. This is the combined final theorem. | `installed_example` supplies its concrete accepted state/cost pair for every positive horizon; the same rejection and missing-condition examples apply. |
| `additional_change_cost` | Any additional remaining cost can be charged at the same comparison state; a larger structural padding bound suffices for the same strict comparison. | Same trace equality and first-round gain as `main`; arithmetic. | `additional_cost_example` allows six further units and arbitrary future behavior. `change_cost_defeats_saving` shows unbounded extra costs cannot be ignored. |
| `every_positive_prefix`, `deadline_preservation` | Under the main bound, every positive round prefix costs strictly less after installation. Every predicate of an incumbent round-end view achieved by a given abstract-cost budget is achieved at the corresponding candidate round by that budget. | First-round gain, final-state simulation, transitivity of cost bounds. | `deadline_example`; `deadline_without_bound_fails`. No claim is made about intermediate instants inside a round. |
| `coalesced_cost` | If the first-round states become literally equal, their entire remaining costs are equal; the total difference is exactly the first-round difference. | Unfolding `run` and equality substitution. | `no_frozen_incumbent`, universally in the remaining horizon; this is the mathematical reason a frozen comparator is wrong. |

The original `Foundations.attachment_conservative` and `sequential_extension`
remain valid: every old model must extend, and sequential attachments need that
extension property at both stages. `inconsistent_attachment` is their explicit
missing-existence example. `transport` needs an exact predicate equivalence;
`collision_obstruction` and `lossy_bool` show why a bare map is insufficient.
These results concern relations between models; they do not establish arbitrary
dependent Lean declaration attachment and are not misrepresented as doing so.
The existing `Protocol.lean` budget, in-flight-recording, and no-replay lemmas
concern its separate command relation. They are not needed by `verified_change`,
and no identification of that relation with the richer engine semantics is assumed.

## The gluing used here

Both component types are `State`. The boundary is the subtype of pairs `(s,t)`
with `view s = view t`; its two maps are the projections. The quotient identifies
the left copy of s with the right copy of t for every such pair. The maps to
`View` commute with the boundary by its defining equality. `tick_view` establishes
the corresponding commutation for transitions, rather than assuming it.
The two inverse equations of `gluedEquivView` prove that this quotient has exactly
the intended information. The already proved existence and uniqueness equations
justify “pushout in types and functions.” No model category, cofibration,
opfibration, dependent-module pushout, or automatic conservativity is claimed.

Costs deliberately remain outside this quotient: two halted engines with padding
zero and one have the same glued observation but tick costs one and two.
`cost_does_not_descend` formalizes the obstruction. The main theorem combines
observation transport with a **separate proved cost comparison**, which is why
gluing alone is not being used as an improvement argument.

## Concrete checked comparison

`research` has scientific program `[request 3]` and engine body
`work (search 7 halt)` with padding 12. Its body size is three, so the change costs
five and the sufficient bound is the arithmetic fact 5<12. This proves improvement
for **all** positive horizons and permitted environments, not only the following
example.

In `changingEnvironment`, the first scientific reply supplies answer 4 and program
`[record 9]`. The engine-search reply installs a zero-padding engine whose body
installs `work halt` and then works once. Thus there are two later changes to the
engine itself, as well as the scientific rewrite. After two rounds both archives
are `[9,4]`; incumbent total cost is **33**, and install-and-candidate total cost
is **26**, including the initial five. These numerals are proved by ordinary
`decide`, whereas the universal result is proved by induction and simulation.

In the negative example, initial padding is two and the body immediately searches
and installs a zero-padding halt engine. Candidate and incumbent states coalesce
after the first round. For every positive horizon the raw saving is exactly two;
the change costs four, so changing is strictly worse for every reward R on the
common observations. Merely increasing the horizon cannot rescue the comparison.

## Verification and resumable obligations

`ConstructionAudit.lean` uses ordinary `#print axioms` and `#check`. The new main,
installation, gluing-preservation, and example results depend only on `propext`
and/or `Quot.sound`, with several using neither. No custom axioms, `sorry`,
`admit`, `native_decide`, or self-soundness postulate occurs in this construction.
Compilation and kernel-replay logs are retained under `evidence/construction/`;
compiled modules are under `.scratch/construction/`.
The final build compiled seven modules successfully; kernel replay succeeded for
the gluing, continuation, examples, audit, and aggregate modules. Exact absolute
commands and import paths are in `evidence/construction/build.json`, and replay
results are in `evidence/construction/kernel.json`.

Proved: the model's guarded engine transformation, including arbitrary subsequent
engine searches and changes over every positive finite horizon, and the gluing
and cost facts used in its proof. No conjecture is used in these results.

The following are **unproved extensions**, not hidden premises or infrastructure
prerequisites for the theorems above:

1. For a larger language with branching, jumps, or a different interpreter,
   establish an observation relation S and prove: every related pair of states
   has corresponding successor observations, with a cumulative cost bound that
   survives every allowed future interpreter replacement. The present language
   has finite straight-line bodies repeated at round boundaries. It does not
   quantify over arbitrary host-language implementations of the interpreter.
2. For environments E(s,t) that inspect elapsed time t, exhibit a relation on
   environmental states preserved by both differently timed runs and prove
   equality (or a specified stochastic coupling) of corresponding replies.
   `response_hypothesis_needed` shows this cannot hold without restrictions.
3. For a first-proof reciprocal-time objective, specify certified root evidence
   and the first occurrence time, then prove reward transport at that stopping
   time, including installation and verification costs. The deadline theorem
   covers positive round boundaries only. Arbitrary numbers in `archive` are
   observations, not a theorem that every recorded mathematical assertion is true.
4. An infinite-horizon comparison needs a defined limiting or discounted utility
   and existence/convergence hypotheses. Universal finite-prefix comparisons do
   not by themselves define such a utility.
5. To reuse the gluing construction for dependent mathematical declarations,
   supply model-extension witnesses and exact interpretation maps for that
   declaration language; the type pushout alone is insufficient.

Next mathematical work should select one of these precisely stated extensions
only if the desired scope requires it, then return to the outstanding Agoh proofs
and subsequently the Markov conjecture. There is no reason to defer the proved
model result pending process, permissions, transport, or new validation machinery.
