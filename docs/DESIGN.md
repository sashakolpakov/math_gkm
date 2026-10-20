# Clean bootstrap of a Gödel machine for mathematical research

This document is a design specification for a fresh construction. It supplies
no previous implementation, mathematical results, proof scripts, or successful
research strategies. It distinguishes an adaptive mathematical researcher, a
formally certified continuation model, and an executable Gödel machine. A
checked theorem about an abstract model does not by itself establish that an
implementation realizes that model or that the model describes future Astra
calls.

The intended system uses a flexible LLM proposer, reusable mathematical
components, and explicit gluing interfaces. It can search literature, conduct
computational experiments, change representations, formulate conjectures, and
attempt proofs and refutations. Its scientific objective is problem-specific.
Kolmogorov-style measurements are audit data, not a universal objective or an
automatic curiosity reward.

## What the original construction requires

Schmidhuber's target compares a proposed switch with continuing the entire
incumbent program, including future proof search and later self-modifications.
The machine and environment are axiomatized. Checking and installation take
time; the switch protocol binds a target time and can reject a late proof.
The resulting optimality claim is relative to the utility, assumptions, and
incumbent search, rather than an oracle maximum over all programs. The paper
also permits a nondegradation target, different initial searchers, and changes
to utility code justified by the previous utility. Its mathematical example
rewards the first verified proof or disproof by the reciprocal of elapsed time.
Useful changes may be unprovable in the chosen system or undiscoverable within
available resources. These requirements come from §§2.4, 3.2, 4, 5, and 6 of
[the original paper](https://arxiv.org/pdf/cs/0309048).

The architecture and acceptance criteria below are our engineering proposal.
They are not claims that the original paper supplies a working implementation
for Lean, an opaque external LLM, or this mathematical research problem.

## The problem contract, rather than manufactured levels

ARC supplies an external environment with explicit levels and validated
completion conditions. The mathematics application has no corresponding
natural sequence of levels. Numbering accepted lemmas does not create one.

A run therefore starts with an explicit, versioned problem contract:

- An exact root proposition, its intended English meaning, and permitted
  assumptions. Resolution may mean a checked proof or checked negation.
- A declared utility or preference over research outcomes and their costs.
  This is supplied for the problem, not inferred from a theorem counter.
- Resource limits and a cost interpretation: abstract computation steps,
  elapsed time, provider usage, or separately recorded quantities.
- The environment assumptions under which prospective comparisons are made.
- Admission and completion rules that a proposal cannot redefine.

A root-resolution/time objective is one reasonable instance, not a default
definition of all mathematical value. Intermediate results can have value
when the contract says how that value is assessed. If such an assessment is
human or heuristic, its status must remain visible.

Truth, relevance, novelty, and expected usefulness are separate properties.
A kernel-checked lemma establishes its proposition. A separately checked
reduction can establish its logical connection to the root. Neither fact
alone establishes historical novelty or how likely the lemma is to help.
Even an implication into the root can have an impossible antecedent.
Experimental evidence may change the agenda without closing a formal task.

No part of admission, root closure, scheduling, or persistent rewrite approval
may quietly depend on source length, compression ratio, or a claimed estimate
of Kolmogorov complexity. Audit measurements can still describe reuse and
representation costs. Their production must have ordinary resource accounting.

## Open research actions and explicit evidence

The proposer needs an extensible action interface rather than a fixed menu of
prewritten mathematical recipes. Concrete capabilities can include:

| Action | Output | What the output establishes |
| --- | --- | --- |
| Literature search and source reading | Queries, primary URLs, passages, retrieval times | What a source reports; not a Lean theorem |
| Python, Sage, or GAP experiment | Program, inputs, versions, outputs, costs | A reproducible computation under recorded semantics |
| Representation proposal | Definitions, maps, examples, desired transport laws | A proposed viewpoint until its laws are checked |
| Proof or refutation | Exact target, proof term, dependencies, kernel receipt | The proposition admitted by the proof gate |
| Component attachment | Boundary, bindings, adapters, checked obligations | The specific preservation properties proved |
| Search strategy proposal | Diagnosis, next actions, resource allocation | Provisional guidance consumed by the controller |
| Persistent code rewrite | Exact replacement, state migration, switch certificate | Only the certified comparison and preservation claims |

An adapter may expose a new experimental language or mathematical interface
without giving the proposer unrestricted host authority. The broker enforces
capabilities and records failures. An unavailable Sage or GAP installation is
a capability failure, not evidence against a conjecture. Network failures,
timeouts, and malformed responses similarly remain transport or execution
outcomes rather than mathematical refutations.

Finite scans do not prove universal claims. Exact counterexamples can become
formal refutations after the relevant witness and hypotheses are independently
checked. External theorems may be recorded as explicit assumptions when a
contract permits that treatment; retrieved text must not add hidden axioms.

## Exploration must not require a switch proof at every step

The incumbent research policy may already authorize broad exploratory actions,
task invention, hypothesis changes recorded as new tasks, and provisional
strategy updates. Choosing such an action is ordinary execution of that policy.
It need not first prove that its next web query or experiment is globally best.

A persistent replacement of the controller or its search procedure is a
different event. It requires either the full switch gate described below or an
explicitly labeled experimental branch that makes no certified-improvement
claim. Successful tests alone must not promote that branch to a proved switch.

This separation prevents two failures: an inert system unable to explore until
it has solved its own research problem, and an unrestricted self-editor whose
ordinary strategy changes are advertised as Gödel-certified improvements.
Exploration remains flexible within the current contract and capability limits.

## Operational semantics and the whole continuation

The formal machine state should contain executable controller and proof-search
code, persistent research data, the archive and agenda, resource state, pending
requests, and enough environment history to interpret future actions. Program
code must be inspectable data. A semantics must explain how each instruction,
external response, and accepted rewrite changes that state.

Crucially, the incumbent continuation includes its own future proposals,
verification attempts, discoveries, and switches. A comparison against a
frozen policy that is forbidden to improve does not compare against the actual
incumbent. The replacement continuation must likewise include its subsequent
behavior, not just its first apparently beneficial action.

One conceptual interface is:

```text
step       : Program × State × Input -> Transition
run        : Program × State × Environment -> Trace
evaluate   : ProblemContract × Trace -> Utility
install    : Candidate × State -> InstallationTrace × State
```

This interface is a specification sketch, not an executable API or a proof.
In a stochastic instance, `run` induces a distribution and `evaluate` supplies
an expected value when the required measurability and integrability hold.
In a robust instance, comparisons quantify over declared environment behaviors.
The implementation must connect these objects to the bytes it actually runs.

## The switch obligation and a common time baseline

For contract `C`, model `mu`, incumbent `p`, candidate `q`, and decision state
`s`, the intended strict obligation is:

```text
V(C, mu, install-and-continue(q, s))
  > V(C, mu, continue-whole-machine(p, s)).
```

Both sides use the same contract, environmental assumptions, and decision
baseline. The comparison may instead be nonstrict when that is the declared
rule. This is a semantic statement about complete continuations; it is not a
claim that both values must be computed exactly before a proof can be found.

Search already performed before this baseline is sunk on both branches. Do not
charge it twice or selectively subtract it from the incumbent. Validation and
installation still to be performed must be included. If final validation has
already occurred, its elapsed time instead appears in the new state and the
remaining lifetime. A certificate proved from an earlier snapshot must justify
transport to the installation state or be checked against an appropriate future
deadline and invariant. Simply adding a measured cost to an old inequality is
insufficient when the remaining opportunity to solve the problem has changed.

A switch receipt must bind the contract and model, incumbent and replacement
code, exact state or proved state invariant, migration, cost interpretation,
deadline, certificate target, and independent verification artifacts. Reject
changed bindings and stale deadlines. Hashes bind recorded bytes; they are not
proofs that Python or operating-system execution realizes the Lean semantics.

Changing runtime reward code cannot redefine the standard used to approve the
change. Representation changes to the objective require a transport proof.
A new scientific objective requires a new explicit contract; silently weakening
the root or environmental assumptions is not an improvement.

## Opaque models and self-reference

Astra is an external proposer with unknown internals and no assumed success
probability. Treat its responses and delays as environmental inputs. A measured
acceptance rate, benchmark gain, or confidence estimate does not establish its
future response law. A Bayesian comparison is conditional on its declared
model; a robust comparison must actually quantify over the stated model class.
Neither should be reported as an unconditional real-world guarantee.

One promising certificate pattern proves preservation for every corresponding
response stream while reducing internal work. However, corresponding streams
require justification: an API or web service can depend on request time and
history. Faster execution need not receive the same responses. The environment
contract or a coupling argument must support that correspondence.

Encoding one's own code is not the same as proving unrestricted soundness of
one's own proof system. A sufficiently strong consistent theory cannot simply
adopt its own unrestricted reflection principle. This is the relevant obstacle
discussed in [Yudkowsky and Herreshoff's primary analysis](https://intelligence.org/files/TilingAgentsDraft.pdf).
Our design uses particular checked proofs and concrete simulations; it must
not introduce an unchecked `SelfSound` axiom to discharge future correctness.
The reference kernel, admission semantics, and runtime bridge are explicit
trust boundaries. Faster implementations need preservation certificates against
that reference; replacing the reference by a candidate's assertion of trust
does not prove preservation.

## Gluing and representation transport

A finite-name attachment can have a unique-extension property for compatible
maps. Proving such a restricted pushout would not establish semantic
conservativity of arbitrary source edits or dependent Lean declarations.

The design requires typed interfaces: declarations, hypotheses, dependencies,
interpretations, and any renaming or substitution. A new cell must discharge
its assumptions from the accepted context. Context attachment should preserve
the original models and hence their consequences. Sequential attachment must
preserve this fact, including when later cells reuse earlier checked cells.

A representation adapter must preserve the observations or predicates needed
by its consumer. When a representation identifies two objects that a target
property distinguishes, no exact adapter can recover that property from the
representation alone. Such collisions should become explicit failed obligations
or counterexamples, not be hidden by successful tests on a small sample.

For code components, coherent signatures are only the beginning: a simulation
must connect glued implementations to their specification and cost model.
Gluing correctness then supports a switch proof; it does not imply usefulness.
The terms “cofibered” and “cofibrant” require a specified category, structure,
and associated laws. Fiber-respecting maps and injective context embeddings
alone do not establish a model-category cofibration or a Grothendieck opfibration.

## Milestones and acceptance criteria

1. **Problem-directed exploration.** Run the configurable contract and action
   broker with Astra proposals, real feedback, explicit evidence classes, and
   cost accounting. Demonstrate a nonproof action affecting a later research
   decision. Synthetic fixtures test the protocol; they do not demonstrate
   autonomous mathematical discovery.
2. **Semantic foundations.** Prove conservative context attachment, representation
   transport conditions, and continuation comparisons with explicit costs.
   A bounded trace/Bellman model is a useful verified instance. State exactly
   which horizon, response relation, and policy class it quantifies over.
3. **Reflective executable bridge.** Provide executable code semantics with code
   in state and future switching included. Prove or explicitly audit the bridge
   from concrete controller transitions, time accounting, and state migration
   to that semantics. Merely supplying an arbitrary value function fails this
   milestone. A finite table or a single prescribed trajectory also fails it.
4. **A concrete certified self-change.** Produce a candidate, an independently
   checked whole-continuation certificate, and an actual guarded installation.
   A semantics-preserving optimization with a net cost improvement is a useful
   first case. Its proof must cover future switches and installation overhead,
   not merely reproduce the outcomes in the selection benchmark.
5. **General search and reuse.** Let the proposer invent components, adapters,
   and candidate rewrites. A fair proof enumerator can supply completeness
   relative to a calculus if required; an LLM alone supplies no such guarantee.
   Neither option requires a Kolmogorov reward or manufactured task levels.

Completing a finite, specified instance does not establish a switch guarantee
for arbitrary unbounded research or an unmodeled LLM. A generic theorem whose
hypotheses assume the very utility comparison at issue is a framework, not an
independent proof that a concrete rewrite improves the researcher.

## Adversarial examples and regression requirements

The audit must include passing examples and failures with one condition removed:

- A valid reduction versus an unrelated true lemma falsely credited as root
  completion; a refutation of the exact goal versus a changed-hypothesis target.
- A numerical pattern versus a kernel-checked universal statement; a missing
  experimental tool versus a negative mathematical result.
- A compatible attachment versus a conflicting binding, new unproved assumption,
  omitted dependency, circular cell dependency, or lossy representation adapter.
- A cheaper equivalent continuation versus one whose installation overhead
  removes the gain, or whose earlier deadline defeats the promised outcome.
- A full incumbent that later finds a better rewrite versus a comparator that
  artificially disables that future search; the latter certificate must fail.
- Identical objective semantics versus a replacement that edits the reward,
  root, model assumptions, or verifier to manufacture apparent improvement.
- A correctly bound certificate versus changed candidate bytes, changed state,
  stale time, mismatched model, forged receipt, or replayed old approval.
- An exploratory strategy revision versus a persistent executable rewrite;
  exploratory authorization must not silently authorize the latter.
- Different complexity-audit values with identical research inputs: admission,
  scheduling, and switch decisions remain identical. Logging costs may differ
  only when the measurement operation itself genuinely differs.

Formal negative examples should exhibit the missing mathematical hypothesis,
not just malformed JSON. Runtime tests should exercise actual gate boundaries.
Successful tests are evidence about implementation behavior, not a substitute
for the semantic connection required by milestone 3.

## Machine-authored bootstrap and experimental status

The initial input is this design, the user-selected research problem descriptions
and primary-source references, pinned Lean/Mathlib metadata, and a minimal launch
and containment interface. The machine must create the new implementation,
formal statements, proofs, experiments, tests, and documentation. The supervisor
provides execution, resource limits, evidence retention, and independent audit;
it must not insert mathematical solution steps or implement the research engine
on the machine's behalf while describing the result as machine-authored.

A bootstrap cannot claim that its first controller edits are already authorized
by a Gödel switch theorem whose verifier and executable semantics it has yet to
construct. Those edits run in an explicitly experimental workspace under the
user's authorization to rebuild. Compilation, tests, and subsequent independent
checks can validate aspects of the resulting code. They do not retroactively
prove that the bootstrap's sequence of edits was utility-optimal.

The machine must report separate transitions between these statuses:

- **Experimental bootstrap:** code generation and exploration without an
  installed whole-continuation switch certificate.
- **Checked research:** concrete proof objects pass an independently validated
  admission boundary; individual accepted propositions may be reported exactly.
- **Verified model:** formal theorems describe an explicitly stated machine and
  environment model, with the implementation bridge still separately identified.
- **Certified persistent switch:** an actual installation passes the bound,
  independently checked certificate and execution-bridge obligations above.

These labels are evidence classes, not mathematical levels, utility scores,
or a requirement that all components progress in a fixed order. A machine can
produce a valid mathematical theorem during an experimental bootstrap. That
alone certifies neither its surrounding engine nor its future self-modifications.
Machine-generated reports of success remain claims until their evidence is
independently checked; a self-authored test harness cannot certify itself by
printing a successful receipt.

## Clean-input and provenance acceptance checklist

Before the rebuilding proposer runs, independently verify the following:

- Historical source, draft implementations, proof scripts, discoveries, tests,
  experiments, transcripts, and run receipts are archived for the user outside
  the proposer's readable filesystem boundary. They are not bootstrap inputs.
- A Git archive preserves the historical work without exposing its object store
  or archive branch to the proposer. Deleting the working tree while leaving
  `git show` access to earlier solutions does not establish a clean boundary.
- No historical project `.olean`, generated module, cached proof expression,
  database, notebook output, or task-specific package supplies previous results.
  A pinned standard Lean/Mathlib installation is a declared dependency, not
  evidence of a newly created theorem.
- The proposer begins with a fresh conversation. Old assistant summaries,
  hidden solution files, previous success reports, and strategy suggestions
  are not inherited through its prompt, tools, environment, or resume state.
- Task inputs identify the selected publication or conjecture and the required
  outcome. They do not include previously found witnesses, lemmas, reductions,
  or successful representations. Public primary sources remain legitimate
  research inputs and their actual use is recorded.
- The run records an input manifest, hashes, toolchain pins, capabilities,
  workspace boundary, initial prompt, model identity, and resource limits.
  Archived historical objects and fresh generated objects remain distinguishable.
- All new code and mathematical artifacts are traceable to machine actions.
  Any later human correction, imported result, or boundary exception is recorded
  explicitly and narrows the corresponding autonomy or clean-input claim.
- Generated artifacts cannot overwrite supervisor-owned launch rules, hidden
  archives, independent validation tools, evidence manifests, or contract inputs.
  Proposed changes to those components remain candidates for separate review.

A prompt requesting that the proposer ignore readable historical answers is a
behavioral instruction, not enforced clean isolation. If filesystem isolation
is unavailable, report that limitation rather than claiming an enforced clean
run. The archive must remain recoverable by the user; cleaning the proposer
workspace does not authorize loss of the preserved historical work.

## What this specification does not yet establish

No implementation, kernel-checked result, certified controller rewrite, or
resolution of either selected research task is established by this document.
The machine must construct and test the machinery and supply the corresponding
evidence. A general continuation theorem, a useful research result, and a full
executable Gödel switch are separate achievements with separate obligations.

The absence of inherited answers does not establish historical originality:
claims of novelty still require a literature audit. Failed searches, timeouts,
and unfinished formalizations remain incomplete work, not evidence that the
mathematical target is false or unprovable.

## Concept-driver revision, 20 October 2026

The connected implementation and experiment are specified in
[CONCEPT_DRIVER.md](CONCEPT_DRIVER.md). This revision returns source-only review
diagnoses to the proposer, protects bounded conceptual episodes while preserving
ordinary proof work, and assesses library-package transfer against exact
prospectively selected obligations. It is an operator-engineered harness change;
its future research utility is empirical, and its research mathematics remains
autonomous. The clean mathematical seed contains no prior campaign proofs.
