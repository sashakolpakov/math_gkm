# Experimental clean-start research study v2

Machine-authored by the authorized Codex/Astra builder. Phase: **construction**.
This is executable experimental machinery, not a certified Gödel switch, an Agoh
rerun, a Markov proof attempt by the builder, or an installation into the old run.
No historical mathematical artifacts are supplied or imported. Synthetic tests
establish no mathematical progress. MISSION.md, docs/DESIGN.md, both supplied Lean
files, the legacy controller/contract and all dependency pins remain unchanged.

The runner is `machinery.study`; the old `machinery.controller` is still available
for its original contract. Its six absent inherited inputs are not fabricated.
`clean_contract()` explicitly removes those inputs, records why, and preserves
the root hash, meaning, allowed axioms, proof/refutation alternatives and every
source-correspondence obligation. The exact 61-line target SHA256 is
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

## Reproduce construction fixtures

Use the supplied Python, Lean and read-only package links. No Lake update, Git,
package download or nested model is needed. `/usr/bin/python3` is unusable on this
host because its developer-tools shim is missing; use the explicit Python below.

```sh
/opt/homebrew/bin/python3 -m unittest tests.test_study_v2 tests.test_controller_history -v
/opt/homebrew/bin/python3 -m machinery.study freeze --study .scratch/reviewed-fixture --config studies/v2-fixture.json
/opt/homebrew/bin/python3 -m machinery.study run --study .scratch/reviewed-fixture
/opt/homebrew/bin/python3 -m machinery.study status --study .scratch/reviewed-fixture
/opt/homebrew/bin/python3 -m machinery.study_audit collect --study .scratch/reviewed-fixture
/opt/homebrew/bin/python3 -m machinery.study_audit report --study .scratch/reviewed-fixture --output .scratch/reviewed-fixture/audit/report
```

Every freeze requires a new destination. Freeze seals source seed bytes, contract,
protocol, suite, dependency destinations and machinery source hashes before any
trial. Changing sealed inputs or implementation requires a new reviewed study;
there is no silent repinning. Original study results remain untouched. Do not
reuse builder smoke studies after source changes; they intentionally fail resume.

The fixture transport launches only a deterministic Python process. Each receipt
and generated plot identifies the synthetic provenance. It tests the lifecycle,
not autonomous discovery. The real Lean tests use a toy identity and negative
controls, including an unrelated theorem offered at the unchanged exact root.

## Clean canary after supervisor review

These commands are **for the supervisor after review**. The builder has not run
them. The `live` configuration really launches external Codex/gpt-6-astra workers.
No extra runtime approval question is inserted once this reviewed launcher is
authorized. Authentication stays with the installed Codex transport.

An independent machine curator can select structural obligations before either
arm exists. It sees only the clean target and pinned tools, never trial outcomes.
The supervisor reviews machinery and scope, not supplies a mathematical recipe.

```sh
/opt/homebrew/bin/python3 -m machinery.study_curate --out .scratch/canary-curation --transport live --seconds 120
/opt/homebrew/bin/python3 -m machinery.study freeze --study .scratch/canary-v2 --config studies/v2-canary.json --suite .scratch/canary-curation/suite.json
/opt/homebrew/bin/python3 -m machinery.study run --study .scratch/canary-v2 --detach
/opt/homebrew/bin/python3 -m machinery.study status --study .scratch/canary-v2
/opt/homebrew/bin/python3 -m machinery.study stop --study .scratch/canary-v2
/opt/homebrew/bin/python3 -m machinery.study recover --study .scratch/canary-v2
/opt/homebrew/bin/python3 -m machinery.study run --study .scratch/canary-v2 --resume --detach
```

An omitted suite is explicitly recorded as unavailable: no transfer-based policy
selection is eligible. Empty/unsuitable curation is an operational or evaluation
limitation, not evidence against mathematics. No independent holdout can be added
retrospectively to a frozen study. Review the curator's actual receipt and select
at most two tasks for the bounded canary **before** freezing, retaining the full
original selection and exclusion reasons externally. An empty canary tests only
transport, isolation and record flow, and must be reported that way.

The canary allows each arm two rounds, 120 seconds per research/meta call, at most
12 total calls, six meta calls and 1800 cumulative charged seconds. Adaptations
get 120 seconds each; each task gets a 120-second validation reservation per side.
Policy changes are disabled in the canary. Common curation is bounded at 120
seconds and is disclosed separately, not donated to either arm. A successful
canary is not the experimental comparison: freeze another new seed and protocol
for the study, using `studies/v2-study.json` only after resource review.

For the main study, each arm has eight research rounds, two-round review horizons,
300-second calls, 60 calls total, 24 meta calls and 14400 charged seconds. At most
one two-round-per-side policy trial is allowed. These are caps, not a promise to
spend the same amount. All alternatives consume the owning arm's allowance. The
baseline may spend less because its policy allocates fewer calls to planning.
The common round cap is also part of the resource contract. Report consumption
and caps separately; do not call token fields, dollars or CPU equal without a
validated conversion. The default execution order is baseline then exploration;
time/provider drift is a confound. A later independently frozen replication may
reverse order with `run --arm exploration` followed by `run --arm baseline` and
must predeclare that order externally. Do not choose order after seeing results.

The old stopped run remains archival evidence under its supervisor. It is not
read by this machinery and is not the control arm. Both fresh arms receive only
the same exact target definitions, principles, contract, tools and pins. No old
lemma, report, agenda or proof output enters either arm.

## What runs and what is evidence

The baseline preserves the legacy single revisable agenda: one external worker
chooses and executes research, receives the latest eight observations and can
read its full own retained history. Necessary common changes are empty initial
history, containment, frozen budgets and independent evaluation. Reviews and
transfer checks charge the same allowance and do not impose a portfolio on it.

Exploration uses a separate bounded **proposer** call before each research call.
It retains competing obstacle/capability/strategy hypotheses, reasons, evidence
and alternatives in controller-owned state. Plans specify a consequential
uncertainty, checkable outcomes and what each outcome changes. The execution
request binds the actual completed plan receipt. A new identity is required for
a changed hypothesis. Episodes predetermine their review horizon and continuation
round allowance. The bounded invention allowance can precede a formal root
reduction. `usefulness_not_demonstrated` is distinct from refutation. Source,
numerical, representation and proof-candidate records are not verified theorems.

An independent reviewer gets copied actual artifacts, process receipts and
checked evaluation summaries. A separate selector consumes that record and the
review. Both must cite existing hash-matched artifacts. Neither sees another
arm. Hash-valid praise alone never makes a policy eligible. Policy proposals may
change only search, memory, allocation and reassessment guidance, not controller
code, contract or verifier. Candidate/incumbent continuations start from an
identical current snapshot, have equal rounds/adaptation budgets, and retain old
sources. Selection requires checked component use on an independently frozen
holdout with no checked-capability/regression loss. Failed/unknown evaluation
keeps the incumbent. This is a conservative experimental selection rule, not a
universal mathematical interestingness score or a proof of future optimality.

There is no forced numerator progression, theorem-count reward, artificial level
or supervisor mathematical recipe. The open worker tool environment supports
source research, Python and available Sage/GAP, definitions, proofs/refutations,
new representations and hypotheses. Missing tools and finite timeouts are
capability/budget failures, never absolute unprovability or root refutation.

The independent suite has exact Lean proposition bodies, explicit binder strings
for hypotheses, source hashes, human-readable scope, interface types, transport
laws and required component names. Each before/after adaptation gets the same
budget and only the selected obligations, not hidden answers. Fresh compilation,
axiom closure and kernel replay check the consumer, interface and transport law.
A Lean dependency audit requires the named component in the consumer proof's
dependency closure and checks its originating imported module against the frozen
solver manifest. Adaptations may add consumer code but may not overwrite frozen
source bytes. Transfer eligibility additionally requires actual use of a named
component from a new/changed frozen module, not an interface invented during the
adaptation itself or vocabulary already present in both solvers. A conditional
lemma cannot inhabit a stronger closed task.
An unrelated theorem cannot inhabit the exact root wrapper. Description length,
new names or LLM praise give no transfer credit. Dependency use is not causal
indispensability. `ablations` in the frozen protocol can name experimental files
for equal-budget with/without comparisons on the same suite; protected seed
files cannot be ablated. A missing ablation artifact is reported as unavailable.

Each completed arm automatically evaluates its frozen initial/final solver when
the suite and remaining budget permit. `evaluate --study PATH --arm MODE` can
reconcile/retrieve that same comparison without replay. New held-out tasks are
never manufactured from an observed trial. The declared selector identity and
scope still require independent review; JSON cannot authenticate independence or
prove benchmark relevance. Even independent selection from a common model is
not a statistical independence guarantee.

## Isolation, durability and accounting

`seed/`, `protocol.json`, `seal.json` and `evaluation/suite.json` are controller
records. Each arm has its own `workspace/`, `state.json`, `jobs/`, `snapshots/`,
`roles/`, `evaluations/` and `decisions/`. Lean output is per check, never shared
between arms. Read-only dependencies alone are shared. New Codex calls are
ephemeral, ignore user configuration, disable memories/plugins/skills discovery
and project-doc injection, and use the same model and tool settings.

The generated permissions deny the enclosing project and grant only the current
role's workspace plus pinned third-party/runtime paths. Protected target/config
files and history are read-only. Reviewers/selectors get separate copied inputs.
Adapters see held-out obligations in isolated workspaces, never answer files;
their solutions and compiler diagnostics do not return to research prompts.
The live Lean validator uses an additional macOS deny-default sandbox and fails
closed if unavailable. Review this profile and test actual cross-arm/old-tree
read denials in the real canary: argv/profile fixtures alone cannot certify the
installed Codex or OS implementation. Hostile daemon escape, provider-side
retention and unrestricted semantics of arbitrary Lean elaboration remain trust
boundaries. No whole-continuation implementation bridge is claimed.

Control state uses atomic fsynced envelopes; receipts have hash bindings after
accounting. The watchdog inherits the study lock, enforces wall/output limits,
and writes a durable receipt. Killing the controller does not allow a second
controller to overlap its surviving watchdog. Recovery imports an existing
receipt exactly once. Missing receipts are uncertain effects: the full reserved
time is charged and the invocation is never replayed. A still-existing PID with
uncertain identity blocks recovery; inspect it rather than blindly killing a
possibly reused PID. SIGTERM/SIGINT or `stop` requests terminate the active worker
group; validation checks stop between bounded subprocesses. Cleanup adds a small
bounded delay. Abrupt death can lose unsaved controller-active time, not silently
turn an uncertain invocation into a successful theorem.

Each receipt records provider/model, raw usage events, wall seconds, exit/outcome,
source hashes, stderr and tool event stream. Token semantics are deliberately
`unverified_raw_only`; normalized tokens and monetary cost are null. There is no
hard provider token cap or fabricated conversion of cached/billed token fields.
Call wall includes model latency and all its tools. Internal experiment/tool
details are retained in the raw stream; there is no claim of separate CPU or
per-tool invoicing. Compiler/replay wall is separately recorded. Validation
reserves the full timeout before effects and keeps that budget charge even if
it finishes early. Thus `seconds` is conservative charged allowance, not the sum
of measured runtime. `controller_active_seconds` includes waiting and must not
be added to worker wall. Curation, evaluator, selector and audit overhead are
visible separately. No free branch calls or unmetered endless replanning.

Source snapshots persist, including failures. The arm's `history/objects/` keeps
old source bytes read-only and `history/manifests/` maps original names to hashes.
Old capabilities are available even if a later source is deleted. Fixed regression
tasks and all earlier passed tasks are checked in comparisons; the suite does
not exhaustively characterize every capability of an LLM or all retained proofs.

## Exact root completion

Research completion claims go through the unchanged `machinery.completion`
verifier bound to that arm, with bounded isolated Lean execution. A fresh closed
root proof or exact negation, replay and ordinary axiom closure are necessary.
The independent hash-bound English/source audit is still mandatory for all seven
published-correspondence obligations. A worker cannot write that audit. An exact
formal root with missing source-family/coverage bridges remains unresolved.

After stopping a live arm, an independent reviewer can submit a detailed audit
in the legacy documented format and rerun exactly that claim:

```sh
/opt/homebrew/bin/python3 -m machinery.study_completion --study .scratch/canary-v2 --arm exploration --claim REVIEWED_CLAIM.json --audit INDEPENDENT_AUDIT.json
```

An audit is not authorized by its JSON alone; its authority rests on this
supervisor-owned command channel and the actual independent review. Fixtures can
never close mathematics. The construction has no certified persistent switch.

## Sawtooth audit, only after recording research

`machinery.study_audit` is a standalone one-way observer. No allocator, proposer
or selector imports it. It saves actual artifact SHA256, raw byte count, zlib-9
byte count, dataset hash, fixed reference-set identity, representation/strategy
markers, measured cumulative research wall and measurement overhead. It does
not estimate true Kolmogorov complexity or assign a reward.

```sh
/opt/homebrew/bin/python3 -m machinery.study_audit measure --study .scratch/reviewed-fixture --arm exploration --artifact .scratch/reviewed-fixture/arms/exploration/workspace/research/toy-0.txt --dataset .scratch/reviewed-fixture/seed/MathGKM/Markov.lean --reference-set target-bytes --representation fixture-text --marker representation-recorded
/opt/homebrew/bin/python3 -m machinery.study_audit report --study .scratch/reviewed-fixture --output .scratch/reviewed-fixture/audit/report
```

`collect` reconstructs a trace from immutable snapshots and actual completed
worker receipts. Its burden is canonical JSON of active MathGKM Lean source
bytes, with the exact target as a fixed reference. This is source storage, not
an asserted equivalent encoding of mathematical data; archived/non-Lean material
is excluded. Its x axis is worker wall before the snapshot, excluding separate
validation. Manual `measure` records worker plus validation wall. The plot keeps
different accounting bases in separate trajectories and saves both definitions.

A pair comparison requires two records with the same data hash/reference set
and `--pair-id`. Changed workloads get separate curves. The report preserves
unfavorable observations, shows insufficient/live-empty data honestly, and never
manufactures a sawtooth. Encoding choice is a limitation; fewer bytes do not
prove better mathematics or better prediction/transfer. Do not copy audit fields
or derived proxies back into research. Fixture tests mutate audit values while
checking request/decision invariance. This enforces the observer channel; it is
not a proof that an opaque model cannot independently invent a length heuristic.

## Remaining review boundaries

Actual live CLI compatibility, provider usage semantics and containment await
the bounded canary. A direct nested `sandbox-exec` probe in this managed builder
environment returned `sandbox_apply: Operation not permitted`; no live validator
is claimed operational here. The supervisor must test the reviewed launch context;
the validator fails closed if its sandbox cannot start. General Lean elaboration
is executable trusted code, not a hardened hostile-source admission service.
The existing isolated completion-history regression suite is
run; legacy full-controller tests that assume absent historical files are not
repaired with fabricated history. General imported Lean elaboration and the
Python/OS bridge require implementation review. Finite benchmark success cannot
prove utility improvement over the incumbent's entire future continuation.
Independent task relevance and published-source correspondence remain separate
judgments. No live installation, original-goal migration or publication was done.
