# A driver for general theorem research

## Status and evidence boundary

This is an **inactive design**, not an implementation or activation. The active
study, mathematical goal, source seal and research decisions remain unchanged.
No mathematical proof strategy is supplied here.

The examined implementation has identity
`66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff`,
using [`study_common.implementation`](../machinery/study_common.py). The operator's
recorded observation on 20 October 2026 was **five admitted claims, zero checked
root-reduction edges, empty `remaining_obligations`, and an open root**. That does
not establish that the results are useless or that no mathematical connection
exists. It identifies a missing registered connection, without identifying why
the research followed that path.

The proposed driver distinguishes checked goal routes, accepted unlinked tools,
and prospective investigations of a connection. It cannot estimate the unknown
difficulty of the goal or guarantee discovery.

## Existing machinery and two frontiers

The existing harness already admits checked reductions and compositions, keeps
immutable proposition contexts, protects multi-round concepts, and returns bounded
source-review and transfer feedback. The addition is a typed, prospective goal
focus and controller-derived account of its actual effects. See the existing
[`concept design`](CONCEPT_DRIVER.md).

The **Lean frontier** starts at the pinned `MathGKM.Markov.Conjecture63` in the
[`contract`](../contracts/markov-goal.json). In
[`residual_dag`](../machinery/residual_dag.py), an admitted edge proves that all its
premises imply its target. Routes have **OR-of-AND semantics**: alternative
reductions are alternative sufficient routes; within a selected reduction, every
premise is required. Composition must retain every unresolved antecedent.

With no checked root edge, the frontier is the root itself, not an empty solved
problem. A future projection should expose bounded alternative routes, exact
open leaves and their source/receipt identities. If enumeration hits a bound,
mark the projection incomplete; never assert that no other route exists.
Representation antecedents outside checked root routes remain unlinked.

A direct exact-root proof need not pass through a registered reduction. Preserve
that completion fast path and the contract's exact-refutation path.

The **English/source frontier** is separate. Its seven contract checks are:

| Key | Correspondence required |
| --- | --- |
| `coverage` | Intended inputs |
| `source_family` | Published construction |
| `homogeneity_coefficients` | Homogeneity and coefficient conventions |
| `polygon` | Stated domain |
| `directions_zeros_endpoints` | Directions and boundary conventions |
| `assumptions` | Declared mathematical and logical assumptions |
| `proof_scope` | Claimed theorem scope |

These are not seven Lean residual nodes or the host-machine formal obligations.
A checked root does not discharge them. Existing completion requires both the
exact mathematical result and an independent audit bound to its source bundle.
Source changes cannot silently inherit an older bundle's approval.

## Prospective focus contract

A future optional protocol should require one bounded focus per round, including
continuation of a funded episode. This is a proposed schema, not currently
accepted input:

```text
focus:
  schema_version
  root_reference: contract_hash, constant, root_source_hash
  input_frontier_hash
  kind: proof | correspondence | bridge_exploration | tool_development
  target_reference
  selected_checked_route_reference: reference or null
  admitted_input_references: exact versions and receipts
  expected_connection:
    status: checked | conjectural
    existing_checked_edge_references
    proposed_connection
    unresolved_connection_obligations
  prospective_action, discriminating_outcomes, next_choices
  checkpoint, finite_allowance, protected_concept_reference
```

The controller validates immutable references and derives existing checked facts;
setting `status: checked` cannot manufacture evidence. Stale, rebound or unknown
references produce typed diagnostics. A changed frontier prompts reassessment
without rewriting an old commitment.

- **Proof** targets the root, a selected route's exact leaf, or a proposition with
  a prospective connection or discriminating purpose stated.
- **Correspondence** targets a named audit obligation; reported evidence cannot
  self-approve that obligation.
- **Bridge exploration** investigates a conjectural mechanism-to-goal connection.
  An already-proved reduction is not an entry requirement.
- **Tool development** names a prospective consumer or discriminating use. The
  output remains unlinked until a connection is actually checked.

Literature reading, computation, representation changes and proof work remain
available. Partial results and special cases can test prospective predictions or
serve a checked route. No fixed tactic menu or fabricated mathematical levels are
introduced. One goal-bound concept commitment should suffice, without a parallel
legacy hypothesis portfolio.

## Connected loop and priorities

The controller projects the two frontiers, admitted tools, concepts and previous
feedback. The study's **own proposer** commits a focus and predictions before
research; reference validation and finite resource reservation follow. The
separate researcher receives that exact commitment.

Existing mathematical gates then decide admission independently of narrative
metadata. Preserve [`study_reports.accept_report`](../machinery/study_reports.py):
invalid optional metadata must not roll back a correct admitted proof.

Next the controller derives actual changes from receipts and registries:
`checked_route_extended`, `exact_leaf_discharged`, `tool_admitted_unlinked`,
`correspondence_evidence_pending_review`, or `inconclusive`. Predictions and
actual outcomes remain separate. A fresh own-source-only reviewer explains
unresolved connections; safe findings and controller effects reach the next
proposer. Neither researcher prose nor reviewer judgment creates checked edges,
correspondence approval or completion.

Operational priorities are checking genuine completion candidates, honoring
funded commitments and making subsequent goal connections explicit. Preserve
exploration alongside exploitation. A protected concept survives a no-theorem
round and can investigate why no bridge is known. At its checkpoint, continued
case work requires a bounded reassessment: extract a mechanism, investigate failed
extraction, or explain which alternatives another case would distinguish. This
is accountable planning, not automatic mathematical relevance certification.

## No scalar distance or complexity reward

A valid implication does not make its premise easier. For arbitrary `G`,
`False → G` is valid. A fresh alias `G'` defined as `G` also gives `G' → G` without
solving anything. Node-ID cycle checks cannot settle semantic equivalence.
Likewise one hard leaf need not be better than several manageable leaves.

Lemma counts, leaf counts, universal quantifiers and description length therefore
cannot be rewards. The current composer's smaller-leaf preference is a syntactic
planning tie-break, not a progress measure. Expose bounded alternatives and permit
explicit route choice. Kolmogorov proxies remain audit-only: no funding, ranking
or concept transition consumes them.

Inspected proof closure with exact source/receipt identities establishes a
checked consumer dependency, unlike supplied `dependencies` or `use_links`.
Relevance to the exact root additionally requires that consumer to lie on a
checked root route. Use establishes neither necessity nor causal research
benefit. Matched comparisons and removal controls provide only their recorded
finite-budget evidence.

## Gluing obligations

The [`existing pushout and attachment machinery`](GLUING.md) proves typed
mathematics; it is neither automatic generalization nor an implemented
model-category cofibration framework.

A proposed gluing route must specify interfaces, maps and predicates. Missing
coverage, compatibility and transport requirements become exact proof leaves.
A universal property does not prove that local pieces cover the original family.
The current `Representation.consume` does not require the forward map to be
surjective. Its per-input representation law does not prove the universal
represented-predicate antecedent. That sufficient-condition theorem retains its
antecedent until proved and connected by a checked reduction. Vocabulary changes,
orphan antecedents and compatible local attachments cannot silently acquire
universal scope.

## Concrete integration map

| Source | Future change; existing guarantees retained |
| --- | --- |
| [`protocol.py`](../machinery/protocol.py), [`study_common.py`](../machinery/study_common.py) | Version the optional driver, strictly bound limits and immutable roots; retain historical protocol loading. |
| [`residual_dag.py`](../machinery/residual_dag.py) | Derive bounded alternative routes and incompleteness; preserve immutable nodes, checked implications and all open antecedents. |
| [`study_knowledge.py`](../machinery/study_knowledge.py) | Project admission-derived edges, discharges, compositions and inspected dependency evidence; preserve FINISHED-bound validation. |
| [`study_policy.py`](../machinery/study_policy.py) | Wire focus into request, commit, execution validation and reports; keep predictions separate from controller outcomes. |
| [`study_program.py`](../machinery/study_program.py) | Validate focus references and distinguish root-open, residual-open and correspondence-pending conditions. |
| [`study_concepts.py`](../machinery/study_concepts.py) | Bind protected episodes to root/frontier identities; preserve horizons, competing explanations and missing-evidence states. |
| [`study.py`](../machinery/study.py), [`study_reports.py`](../machinery/study_reports.py) | Connect reservation, research, independent admission, derived effects, review and next-request feedback; persist exact bindings across recovery. |
| [`study_research_feedback.py`](../machinery/study_research_feedback.py), [`study_transfer.py`](../machinery/study_transfer.py) | Add safe goal effects without private task details; retain aggregate comparisons and measured costs. |
| [`completion.py`](../machinery/completion.py), [`study_completion.py`](../machinery/study_completion.py) | Preserve exact mathematical and independent correspondence gates; driver labels cannot resolve the goal. |

Two concrete interface repairs belong in that future implementation:

1. `study_knowledge.SCHEMAS` and ingestion support `compositions`, but the main
   researcher payload example in `study_policy` omits `compositions:[]`. Update
   prompts, schemas and submission tests together; composition itself exists.
2. `study_program.execute` checks only `remaining_obligations` for
   `if_open_obligations`. Empty residuals select its closed-side branch while the
   root can remain open. The current program is empty (`REFERENCE`), so this is a
   **latent bug, not an established cause** of observed research behavior.

## Evidence limits and meaningful tests

Invalid comparisons, caps, unfinished receipts and verifier failures mean
unknown/inconclusive evidence, not refutation or zero gain. Valid zero gain is a
different result. Interval transfer concerns the acquired library package, not a
causal attribution to one concept. Preserve development/application costs
separately from caps, and keep failed attempts for diagnosis.

No tests are run by this document. Required future controls include:

- Empty residuals/open root select the correct branch; checked root/pending
  correspondence stays unresolved; only the exact approved bundle completes.
- Unknown, rebound and stale references fail; recovery preserves commitments;
  changed or closed targets trigger explicit reassessment.
- Orphan representations stay unlinked; OR alternatives remain distinct; checked
  composition retains every AND premise; bounded projections admit incompleteness.
  Direct-root candidates do not require invented reductions.
- Composition submissions and focus fields traverse prompt-to-admission paths.
  Incorrect optional metadata preserves valid proofs. Self-reports, dependency
  lists and reviewer prose cannot create checked relevance or audit approval.
- Neutral false-premise and root-alias controls create no difficulty credit;
  different leaf counts or complexity observations do not affect reward/funding.
- Funded concepts survive no-theorem rounds; informative special cases remain
  possible; reassessment cannot erase precommitted predictions.
- Missing gluing coverage/compatibility/transport remains explicit; incompatible
  bindings fail; representation laws alone cannot close universal antecedents.
- Safe feedback reaches the next proposer without private tasks/IDs. Operational
  failures remain unknown; valid zero-gain comparisons remain distinguishable.
- Canonical serialization, partial writes and restarts preserve exact provenance,
  reject unfinished reuse and avoid replaying failed research calls. Resource
  reservations remain finite and unchanged in strength.

Pure fixtures test state/schema behavior; independent neutral Lean controls test
proof interfaces. Neither establishes superior mathematical discovery. Any later
research comparison needs comparable resources, prospective observations and
honest treatment of invalid evidence.

## Inactive cross-version rollout

The current continuation requires exact implementation identity. Editing sources
and calling ordinary parent verification is not a migration mechanism.

A future, independently reviewed handoff must occur at a completed episode
boundary. Archive the exact old implementation source while it remains
available. Quiesce its controller and supervisor, verify their locks are released
and no active work or pending launch intent remains, and only then bind and
archive the final handoff state, own admitted sources, obligations, commitments
and receipts. This ordering avoids an archive-before-stop race. No replacement
scheduler starts before quiescence; history retains its original provenance.

Review and test an isolated new implementation and migration protocol, then seal
its identity. Preserve the universal contract. Rebuild/replay inherited admitted
sources through the new gates; retain old receipts as historical evidence rather
than relabel them as fresh validation. Unchecked or failed imports remain
unavailable or unresolved. Initialize new driver assessments as unassessed unless
newly derived or checked; old prose cannot become evidence automatically.

Activation needs separate approval after that review. Preserve reproducible
static source, pins and accepted proof artifacts, excluding live authority,
routing metadata and private research/evaluation payloads from publication.
Nothing here authorizes switching the current run. The design's acceptance
criterion is a connected, honest decision loop; a general theorem remains a
separate mathematical achievement.
