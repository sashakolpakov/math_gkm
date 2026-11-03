# Acquiring and testing mathematical methods

The method-learning extension measures resource-bounded improvement of the
actual proof-search workflow. If a method C has been proved from T, then T and
T+C have the same deductive consequences. The relevant question is whether a
fresh researcher can find checked proofs more reliably or cheaply using C.
A predecessor may rediscover C within its own allowance. A bounded unsuccessful
attempt never establishes unprovability.

## What is retained

A candidate identifies already admitted mathematical records and optional newly
written application notes. The mathematical records can describe a reusable
argument, a representation with proved translations, typed gluing, or a theorem
family. Supporting source closures and exported declarations identify the exact
method version. A goal connection remains a research claim unless its own
correspondence theorem has passed the ordinary Lean admission path.

The controller chooses a predecessor frozen before the method plan
was committed, so later work cannot be inserted into its starting context. It
constructs the candidate from that predecessor plus the selected, newly added
admitted source closure and application notes. Existing
predecessor files and policy remain unchanged. Unrelated episode additions are
excluded. Selected exports derive from actual admission records, rather than
researcher assertions of successful checking. Method evaluation does not
replace the existing English/source or exact-root completion gates.

Isolation follows the complete source files needed by selected admission
records. It does not extract one declaration from a shared file. Shared helper
files can therefore contain additional mathematics. Keep unrelated discoveries
in separate files when finer attribution is needed, and interpret results as
evidence about this exact source package rather than one indispensable lemma.

## Comparisons within the research loop

A pretrial independently selected challenge pool is frozen with the study.
Acquisition, interim assessment, and final holdouts form three disjoint
collections. Routine review cannot consume future method or final holdouts. A
curator can set a holdout's `evaluation_scope` to `method`, `assessment`, or
`final`. With no explicit partition, the last `holdout_tasks` holdouts are final,
the preceding batch is interim assessment, and earlier holdouts belong to the
method pool. Previously established regression tasks can be shared. A small
pool can leave a collection unavailable, which is reported as inconclusive.
The proposer commits method predictions as exact closed Lean statements before
development. Candidate predictions link those fixed statements to independently
admitted mathematical claims. Each target is first compiled in the frozen
predecessor context, and then checked against the selected candidate proof in
a fresh bounded Lean validation. A future definition cannot retroactively
change the prospective target's meaning. Implicit creation of free variables
is disabled in these target definitions. The interpretation of an English
concept as that statement remains a separate correspondence issue.
Predictions cannot name private held-out tasks.
The controller selects and commits an unused challenge subset before comparison.
Fresh predecessor and candidate adapters receive the same statements, model,
tools, and resource caps in separate workspaces. Repetitions use fresh logical
job identities and balanced execution order. They are charged to the owning
research allowance, together with validation and review overhead.

A checked gain requires a valid bounded predecessor non-solution and a checked
candidate proof. Declaration identity and dependency inspection establish
whether that proof uses the committed method exports. This establishes use and
finite-budget evidence, not causal necessity or a theorem about the model's
future performance. Application times and development costs remain separate.

Each attempted held-out batch is retired from the fresh pool. Successfully
checked applications enter a bounded, rotating private regression collection;
the proof evidence is preserved even when an application leaves the active
collection. Fresh regression attempts test proof-finding behavior. Replaying
old proof artifacts separately tests preservation of checked mathematics.
Neither check establishes retention of every possible capability.

Invalid contexts, protocol errors, timeouts, missing repetitions, and exhausted
challenge pools remain inconclusive. They cannot become zero transfer or a
mathematical refutation. Removing an imported source file until compilation
breaks is not evidence of a method's usefulness. The principal comparison uses
a valid predecessor and its additive extension.

## Feedback and future choices

At a development review, controller-produced method feedback is persisted and
supplied to subsequent proposer and researcher requests. It includes method
and snapshot bindings, planned and completed trial counts, checked gains,
actual method use, regressions, resource caps, measured costs and limitations.
Private challenge identities, statements, solutions, compiler output and
unrestricted evaluator prose remain outside research feedback.

The proposer can use these observations to choose application, further
development, generalization, another discriminating experiment, or reduced
attention. A feedback delivery receipt establishes delivery only. It does not
certify understanding or guarantee a useful next choice. Protected conceptual
horizons continue to permit development before an admitted theorem appears.

Description-length and Kolmogorov-style observations remain audit-only. They do
not rank methods, allocate research time, or change admissions.

## Testing the complete driver

Method-level comparisons and architectural comparisons answer different
questions. A candidate method can improve applications while the overall
learning process costs too much. The end-to-end comparison therefore starts
baseline and exploration arms from the same clean seed with the same proposer,
tools, model configuration and total allowances. The baseline retains ordinary
proof work and persistent notes. The exploration arm additionally uses the
method-learning loop. All extra acquisition, comparison and review costs are
charged. Equal allowance ceilings alone do not establish equal actual expenditure.
Compare success against total consumed resources, disclose fixed round horizons
and common setup costs, and make no performance-winner claim from fixtures. The
final holdouts are reserved until the fixed campaign ends; their results do not
feed research decisions. The experiment preserves the exact original problem
contract.

A finding on a small challenge pool remains scoped to that pool and allowance.
A claimed improvement needs repeated valid comparisons and structurally varied
applications; another parameter instance is not automatically a new capability.
Independent curation concerns the challenge selection, not mathematical advice
from the supervising conversation. No live research campaign is launched by
running the neutral implementation tests.

## Enabling a new study

The optional protocol field is `method_learning`. Absence or null preserves
historical behavior. Set its `enabled` field to true in a new frozen study to
activate the exploration arm. The remaining bounded controls are `repetitions`,
`max_methods_per_review`, `max_methods`, `holdout_tasks`, and `regression_limit`.
The baseline does not reserve or execute method comparisons.

The proposer supplies an optional `method_plan` containing an immutable method
`id` and predictions with `consequence_id` and exact closed Lean `statement`.
The researcher later supplies `method_candidate` with the matching `id`,
`accepted_ids`, `application_notes`, `goal_connection`, and prediction links
containing `consequence_id` and `accepted_id`. A malformed candidate can be
rejected without rolling back already admitted mathematics. Missing prediction
proofs remain explicit pending evidence.

Comparison reservations include both adapters, each validation, catalogue
checking and every repetition. Increasing the method controls therefore may
require increasing total arm or call allowances before freezing. The existing
protocol checker rejects an impossible episode rather than launching it with
unfunded evaluation work. These allowance ceilings are disclosed separately
from observed elapsed cost.

## Verification and reproduction

From `/Users/sasha/math_gkm`, run the controller-only neutral checks with:

```sh
PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 -m unittest tests.test_method_learning_integration.MethodLearningControllerIntegration -v
```

Run the genuine Lean controls separately, with no concurrent compiler:

```sh
PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 -m unittest tests.test_method_learning_integration.RealLeanMethodChecks -v
```

A new-study configuration fragment is:

```json
{
  "method_learning": {
    "enabled": true,
    "repetitions": 2,
    "max_methods_per_review": 1,
    "max_methods": 16,
    "holdout_tasks": 2,
    "regression_limit": 8
  }
}
```

Merge this into a complete funded protocol and freeze a fresh study using the
existing `machinery.study freeze --study ... --config ... --suite ... --contract
...` command. The suite needs disjoint pretrial method, interim assessment and final
holdouts; a live suite additionally requires the retained independent curation
receipt. With two holdouts per batch, at least six holdouts provide one method
batch plus both assessment batches. More candidate methods require additional
unused method batches.
Freezing and testing do not launch the research arms. An existing sealed run
cannot be edited to enable the new implementation.

Unit tests exercise isolated extension construction, source closure, aggregate
projection, task-pool retirement, costs, repetitions and recovery. Controller
integration tests follow a method through review into actual next requests;
simulated role or comparison results are explicitly labelled. Separate neutral
Lean checks exercise genuine proof checking, dependency use, missing evidence,
and predecessor rediscovery. These implementation tests do not claim discovery
of new mathematics or superiority of an LLM research policy.

The design follows the predecessor-successor capability comparisons in
[POWERPLAY](https://arxiv.org/abs/1112.5309). It is an empirical adaptation of that
idea. It does not certify arbitrary self-rewrites or the complete future utility
of the Python/Lean/LLM researcher.

The [3 November 2026 qualification record](METHOD_LEARNING_QUALIFICATION_2026-11-03.md) separates executed implementation checks from empirical research claims.
The funded opt-in profile is `studies/method-learning-sol.json`.
