# Gluing, pushouts and the meaning of “cofibrant”

Gluing is concrete mathematics in this repository: a quotient with a proved
universal property is used inside the continuation proof. “Cofibrant” describes
a broader construction ambition, for which no model-category structure is
implemented. The distinction matters when reusable mathematical or executable
components are attached.

## The intended interface picture

A component has an interface: the objects it consumes, their hypotheses, names,
interpretations and required laws. Attaching it means providing bindings for that
interface and proving the obligations those bindings create. Reusing a theorem
therefore requires the theorem's hypotheses and exact types; a familiar name or
a similar test output is insufficient.

A span is a pair of maps from a common boundary:

```text
         f
    A -------> B
    |          |
  g |          | left
    v          v
    C -------> P
        right
```

Here `A` describes the common interface, and `B` and `C` the two components. The
square says their shared boundary has one interpretation in `P`. This picture
motivates attaching reusable pieces, but the category and preservation laws must
be specified before it becomes a theorem about programs or proof contexts.

## What the Lean pushout actually proves

[Gluing.lean](../MathGKM/Gluing.lean) works with ordinary types and functions.
For arbitrary `f : A → B` and `g : A → C`, it defines

```text
P = Quot (Boundary f g)
Boundary identifies inl(f(a)) with inr(g(a)), for every a : A.
```

The underlying disjoint union is `B ⊕ C`; the quotient identifies the specified
boundary pairs. Neither injectivity nor a model-category structure is assumed.
For any `u : B → D` and `v : C → D`, the required compatibility witness is

```text
∀ a, u (f a) = v (g a).
```

`Gluing.universal` proves that precisely such compatible maps extend uniquely to
`w : P → D` with `w ∘ left = u` and `w ∘ right = v`.
The code gives the extension as `descend`, proves its equations and uniqueness,
and proves compatibility necessary in `necessary`. Thus this is a genuine
pushout universal property in types and functions, expressed directly in Lean
rather than through a general category-theory interface.

The theorem `descend_predicate` additionally states, for a predicate `Q : D → Prop`,

```text
(∀ p : P, Q (descend u v p)) ↔
  (∀ b : B, Q (u b)) ∧ (∀ c : C, Q (v c)).
```

The displayed notation suppresses the already supplied span and compatibility
arguments. It transfers a predicate of the common interpretation; it does not
say arbitrary properties of the original components survive identification.
`conflicting_binding` supplies a negative example: maps assigning false and true
to the same identified boundary point cannot extend to a Boolean-valued map.

## Why the continuation proof uses this gluing

In [Continuation.lean](../MathGKM/Continuation.lean), both components are `State`.
A state contains scientific data/history and an engine; the observation map is

```text
view(s) = (s.core, s.engine.code).
```

It forgets only current accounting padding. The boundary is the subtype

```text
{ (s,t) : State × State // view(s) = view(t) },
```

with projections to the two copies of `State`. The gluing therefore identifies
states with the same core and executable body across those copies.

This is more than choosing an appealing quotient. The implementation supplies:

| Declaration | Witness or law |
| --- | --- |
| `tick_view` | Equal initial views give equal next views under the same allowed environment. |
| `gluedTick` | The transition descends through the quotient using that proved compatibility. |
| `gluedTick_unique` | Any transition satisfying both component equations is this transition. |
| `gluedEquivView` | `Glued ≃ View`, with both inverse laws; the quotient forgets precisely padding/component choice, not different core data or engine bodies. |
| `run_glued_left`, `run_glued_right` | Both complete finite observation traces factor through one `gluedTrace`. |
| `continuation_observations` | The factorization and boundary equality prove equality of the two observation traces. |

The resulting trace equality is an actual dependency of `Continuation.main` and
`verified_change`. Future engine searches and installations remain in the
transition semantics. This is not an analogy pasted onto an unrelated cost proof.

**Cost does not descend through this quotient.** `cost_does_not_descend` proves
that no function `Glued → Nat` reproduces tick cost on both embeddings: halted
engines with identical views but different padding have different costs. The
optimization theorem combines glued observation preservation with a separately
proved cost inequality and explicit installation cost. It does not infer
improvement from a universal property alone.

The environment restrictions and utility family are described in
[GKM](GKM.md#the-certified-change-that-is-actually-proved). In particular,
responses cannot inspect the padding or elapsed cost forgotten by this model.
There is no theorem here that arbitrary time-sensitive external services factor
through `View`.

## Conservative attachment is a separate obligation

[Foundations.lean](../MathGKM/Foundations.lean) gives a model-level formulation.
Let `C : X → Prop` describe the old models, and let `R : X → Y → Prop` describe
a new component's interpretation. Define

```text
Attachment C R = { (x,y) : X × Y // C x ∧ R x y }.
```

The forgetful map returns `x`. The decisive witness is extension existence:

```text
∀ x, C x → ∃ y, R x y.
```

Under that hypothesis, `attachment_conservative` proves, for every predicate
`P : X → Prop`,

```text
(∀ a : Attachment C R, P (forget a)) ↔ (∀ x, C x → P x).
```

Every old model still extends, so the attachment cannot manufacture a new
old-language consequence by discarding a troublesome old model. This is a
semantic statement about predicates on types; no completeness theorem relating
it to an arbitrary syntactic proof system is silently assumed.

`sequential_extension` composes this existence property: the second component
must extend **every compatible intermediate model**, not just a selected example.
`inconsistent_attachment` shows why that hypothesis is essential. If the added
relation is false, the attachment has no models and every predicate over it holds
vacuously, although the old context need not satisfy the predicate.

Representation transport is another explicit law. `transport` consumes
`∀ x, P x ↔ Q (f x)`. A map `f` alone is insufficient. If `f(a)=f(b)` while
`P(a)` and `¬P(b)`, `collision_obstruction` proves that no predicate `Q` on the
representation can have that exact equivalence. `lossy_bool` instantiates this
failure for a Boolean collapsed to a single point.

These are checked interfaces and negative examples. They do not yet implement a
conservative attachment operation for arbitrary dependent Lean declarations,
source edits, module imports or executable plugins.

## What the runtime component interface checks

[gate.check_graph](../machinery/gate.py) validates caller-supplied cell metadata:
unique identifiers, no conflict with accepted names, no dependency cycle or
missing dependency, equality of the reported `used` and `dependencies` sets,
and no declared outstanding assumptions. It does not derive those sets from
arbitrary Lean proof terms or prove the semantic extension witness above.

Accordingly, the [broker](../machinery/broker.py) labels a successful attachment
request `structural_check_only`, keeps `attached: false`, and adds an agenda item
to discharge attachment semantics. A topological dependency check is useful;
it is not a pushout or conservativity certificate. The implementation even
returns a sorted identifier set rather than an asserted dependency-ordered
execution plan.

For a mathematical component, the intended additional evidence is an exact
interface interpretation, discharged hypotheses, dependency/proof bindings and
the preservation law needed by its consumer. For executable components, a
simulation and cost interpretation are additionally needed. These are interface
requirements from the [design](DESIGN.md#gluing-and-representation-transport),
not a claim that a general attachment compiler already supplies them.

## “Cofibrant” has a stronger technical meaning

In a model category, one specifies weak equivalences, cofibrations and fibrations
with factorization and lifting axioms. An object is cofibrant when its map from
the initial object is a cofibration. Pushouts of cofibrations remain cofibrations;
cell constructions use such attachments. A pushout by itself does not supply a
model structure or certify a homotopy pushout. See Riehl's
[account of model structures and cell complexes, §3](https://arxiv.org/html/1904.00886).

No classes of weak equivalences/cofibrations/fibrations, lifting operations,
factorization systems or homotopy-pushout theorem for research components are
defined here. The word **cofibrant** can therefore describe the intended discipline
of building from explicit interfaces with checked extensions; it must not be
reported as an implemented categorical property. Nor does “cofibered” establish
a Grothendieck opfibration: a base functor and its cocartesian lifting laws would
be separate data and obligations, absent here.

The precise available claims are the type pushout, its concrete state-transition
application, semantic attachment under supplied extension witnesses and exact
predicate transport. The categorical ambition is visible without enlarging
those proved claims.
