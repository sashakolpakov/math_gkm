# Research status: audited snapshot through worker 167

**Cutoff: closed worker 167, 17 October 2026. Full Markov Conjecture 6.3 remains open.**

The principal advance at this cutoff is a universal horizontal log-concavity
theorem for the lower rows of every actual numerator-three source. It supplements
the earlier result covering all three directions at all natural indices for
every numerator-two source. The Agoh exercise remains complete.

This page summarizes closed, independently audited records. It is not a live
controller report, a fresh proof run or a claim of mathematical novelty. The
[worker 167 audit](.bootstrap/independent-controller-audit/markov_worker_000167_monitoring_audit.md)
gives the detailed source and validation qualifications. The older
[status page through worker 158](docs/RESEARCH_STATUS.md) remains a historical
snapshot. The [mission](MISSION.md), [design](docs/DESIGN.md) and pinned
[Markov contract](contracts/markov-goal.json) are unchanged.

## What is proved

The pinned root is `MathGKM.Markov.Conjecture63` in
[Markov.lean](MathGKM/Markov.lean). It concerns the **raw integer coefficients**
of the recursive bivariate Markov numerator in squared variables. For a source
polynomial `P`, write `A(i,j) = (P.coeff i).coeff j`. The three directions are
horizontal `(1,0)`, vertical `(0,1)` and diagonal `(1,-1)`. The root retains its
polygon guards and endpoint cases; coefficient statements below retain zeros.

| Source family or region | Established scope | Principal source declaration |
| --- | --- | --- |
| Every numerator-two source | All three raw-coefficient inequalities at every natural pair of indices | `source_two_globalM8F7` in [TwoComplete](research/MarkovTwoCompleteM8F7.lean) |
| Every numerator-three source, lower rows | Horizontal inequality for every natural `i,j` with `3*j ≤ b`, where `b` is that source's denominator | `source_lower_horizontal_pathM7A3` in [LowerClosed](research/MarkovLowerClosedM7A3.lean) |
| Every numerator-three source, row five | Horizontal inequality at `j=5`, for every natural column, including parameters for which row five is outside the new lower region | `source_three_horizontal_fifthMFFD` in [FifthSource](research/MarkovFifthSourceMFFD.lean) |
| Previously discharged endpoints and numerator families | Preserved by the inherited exact root reductions | [TwoComplete](research/MarkovTwoCompleteM8F7.lean), [ThreeSource](research/MarkovThreeSourceM9E2.lean) and the [current root equivalence](research/MarkovLowerClosedM7A3.lean) |

### The numerator-three lower-horizontal theorem

For **every recursively generated path** whose middle numerator is `a=3`, and
every `i,j : ℕ` satisfying `3*j ≤ b`, the theorem proves

$$
A(i,j)\,A(i+2,j)\le A(i+1,j)^2.
$$

The declaration is `source_lower_horizontal_pathM7A3`. Its only region premise
is `3*j ≤ (frame path).mid.b`, in addition to the numerator-three source
condition. It has no denominator bound, positive-coefficient premise, residual
formula assumption or unproved sign hypothesis. Leading zeros, boundary
positions and zero tails are included. There is no polygon premise in this
theorem, so it also covers triples outside the support within the stated row
range.

The inherited exhaustive classification
[`source_three_rawM9E2`](research/MarkovThreeRawM9E2.lean) identifies every actual
numerator-three source with `q ≥ 1` and a Boolean residue parameter: `b=3q+1`
or `b=3q+2`. Both residues are covered. In those parameters the lower-row
condition is `j ≤ q`. This is a theorem about the original generated sources,
not just an auxiliary family or a finite collection of sampled denominators.

The numerator-two result is likewise uniform in its source parameter.
`source_two_globalM8F7` combines the horizontal, vertical and diagonal results;
`source_two_weakM8F7` transfers them to the root's polygon-scoped predicate, and
`unbounded_two_sourcesM8F7` supplies arbitrarily large denominators. The
[worker 152 validation record](evidence/markov-8f77f493/validation.json) records
that earlier assembly. Worker 167 uses its inherited proof dependencies; it
does not revalidate every old body from source.

## Why a finite certificate gives a universal result

Worker 167 closes a particular four-variable polynomial sign obligation using
a concrete certificate checked in Lean. A finite certificate can establish an
identity of polynomials, which then holds at every allowed substitution; it
need not enumerate parameter values.

The [packed-polynomial theorem](research/MarkovPackedPolynomialM7A3.lean) uses
uniqueness of base representation: for natural-coefficient polynomials, a base
larger than both coefficient masses and greater than one makes equality of
their packed evaluations sufficient for polynomial equality. The
[multivariate encoding](research/MarkovFourEncodingM7A3.lean) adds explicit
support bounds that make the exponent encoding injective. These bounds are
essential, rather than an assumption that arbitrary encoded expressions are
automatically distinguishable.

The actual certificate is an expression built from natural constants,
variables, addition, multiplication and natural powers. Its degree and mass
bounds are proved in [ExpressionBounds](research/MarkovExpressionBoundsM7A3.lean),
and its packed equality is proved by `packed_identityM7A3` in
[ExpressionPacked](research/MarkovExpressionPackedM7A3.lean). These concrete
checks use ordinary `decide +kernel`; they do not leave those conditions as
unproved inputs to a generic soundness theorem. The selected gap expression
uses ordinary constructors; the additional compiled data elaborator is outside
the selected dependency graph and is not its proof authority.

[`pair_reduced_nonnegM7A3`](research/MarkovExpressionClosedM7A3.lean) transports
the checked identity and factor identities to

$$
\operatorname{pairReducedMAD5}(T,x,g,z)\ge 0
\quad\text{for every }T,x,g,z\in\mathbb Q_{\ge0}.
$$

The inherited kernel and source bridges then give the lower-horizontal source
theorem. Their divisions and boundary branches have their own checked
hypotheses; no extra division or positivity premise remains in
`source_lower_horizontal_pathM7A3`.

The saved Python experiments and generated data serve a different role. A
finite scan with no reported failure is still finite evidence. Generator
assertions and a stored list of coefficients do not establish a universal sign
claim by themselves. Here the accepted Lean certificate discharges the
specific identity and sign obligation. The independent audit checked retained
source, receipt, object, replay and axiom bindings; it did not recompute the
polynomial expansion, packed integer or experimental values. See the
[finite-domain audit](.bootstrap/independent-controller-audit/markov_worker_000167_finite_domain_audit.json)
for the experimental ranges and their limits.

## The exact remaining conjecture

The proved declaration `root_iff_outside_lowerM7A3` states

```text
Conjecture63 ↔ ThreeOutsideLowerMFEE ∧ OtherFourM9E2
```

It is in [LowerClosed](research/MarkovLowerClosedM7A3.lean).
**Both predicates on the right remain unproved.** The equivalence is a proved
reduction, not a proof of either remaining predicate.

[`ThreeOutsideLowerMFEE`](research/MarkovLiftRootMFEE.lean) quantifies over
`q ≥ 1`, both residues and all natural indices. Its obligations retain the
following exact regions; conditions refer to the displayed starting indices.

| Direction and triple | Remaining region |
| --- | --- |
| Horizontal: `(i,j), (i+1,j), (i+2,j)` | `q < j` and `j ≠ 5` |
| Vertical: `(i,j), (i,j+1), (i,j+2)` | Outside `((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)` |
| Diagonal: `(i,j+2), (i+1,j+1), (i+2,j)` | Outside `3≤i≤6 and j+2≤q` |

The complementary bands in this table were discharged by the new theorem or
earlier results. Thus it would be inaccurate to describe every vertical or
diagonal case as still open.
[`OtherFourM9E2`](research/MarkovThreeSourceM9E2.lean) requires all three
directions (`GlobalLC18`) for every actual generated source with numerator
`a ≥ 4`.

The original root still includes its endpoints. **Those endpoints and the
earlier discharged numerator families are already handled by inherited
results; they are not additional open conjuncts.** The current residual is
precisely the remaining numerator-three bands together with the sources of
numerator at least four.

Two related boundaries also matter. The new
[`lower_row_polynomial_crossM7A3`](research/MarkovLowerCrossM7A3.lean) concerns
the smoothed lower-row polynomial, under `2*j+1 ≤ n`; it does not cancel its
binomial factor to prove the unsmoothed `LowerRowShapeMFFD`. The exact
[first-correction-row representation](research/MarkovAugmentedSourceM7A3.lean)
requires `q ≥ 2`, and its adjacent equivalence starts at source columns at
least two. It does not prove a uniform correction-row sign or include `q=1`.
An [auxiliary coefficientwise obstruction](research/MarkovAugmentedObstructionM7A3.lean)
is not a counterexample to a raw source inequality or to Conjecture 6.3.

## Validation and inherited limits

The final worker 167 selection consists of **13 mathematical modules and
96 theorem closures**. Their selected final sources have retained successful
compilations; all thirteen are jointly replayed, and all 96 theorem closures
are explicitly printed in the final axiom audit. The selected inventory also
contains 74 definitions and one inductive. The separate `ExpressionData`
module is compiled only and is not in the selected dependency graph. Ten
rejected compiler snapshots retain their rejected status.

The printed axiom sets contain only `propext`, `Classical.choice` and
`Quot.sound` (nine closures omit `Classical.choice`). This records the selected
theorem scope. It is not an assertion that every generated constant received
its own explicit axiom print, or that the inherited library was freshly
compiled and replayed.

The large import branches still rely on the historical **212 worker 121
compiled-but-unreplayed modules**, including their **195-module subset**.
The separately accepted nineteen-module set is a distinct historical group.
Importing these bodies in worker 167 does not recover the old backlog. The
seven worker 166 prefixes that compiled and printed but did not replay are
**outside worker 167's selected dependency graph** and receive no retroactive
credit. The old unbuilt closure template likewise is not retrospectively
validated by the new accepted source.

WindowLC and Abel retain their historical narrow replay/print limitations.
Worker 157's recovery of the twelve final worker 156 modules remains separate
from worker 156's original timeout and null-report history. The detailed
[method review](.bootstrap/independent-controller-audit/markov_worker_000167_replay_method.md)
records these boundaries and the 2,604 inherited source/object pair bindings.
Five generic selected endpoints avoid inherited local project modules; the
eight source/certificate endpoints include the old backlog. Ordinary Lean and
Mathlib compiled-import trust remains relevant in both cases.

The retained validation is evidence of the stated selected checks. The later
independent audit was static and did not rerun the compiler or replay. It also
records one manifest-matching Python cache absent from the original controller
archive, preserved separately as opaque bytes. That retention supplement adds
no proof credit or source-version attribution.

The principal evidence links are:

- [Independent monitoring audit](.bootstrap/independent-controller-audit/markov_worker_000167_monitoring_audit.md), including exact source scope and the corrected endpoint interpretation.
- [Validation review](.bootstrap/independent-controller-audit/markov_worker_000167_validation_audit.md) and [method/import review](.bootstrap/independent-controller-audit/markov_worker_000167_replay_method.md).
- [Source and hash inventory](.bootstrap/independent-controller-audit/markov_worker_000167_mathematical_source_hashes.json) and [sealed audit integrity record](.bootstrap/independent-controller-audit/markov_worker_000167_audit_integrity.json).
- [Worker validation record](evidence/markov-7a344181/validation.json), [final joint replay](evidence/markov-7a344181/replay-1792199750943381000.json) and [final axiom audit](evidence/markov-7a344181/axioms-1792199802004138000.json).

Full resolution still requires the pinned root or its exact negation, fresh
project-source validation and an independent review of source correspondence,
coefficient interpretation, all directions, zeros, endpoints and assumptions.
The [completion procedure](docs/CONTROLLER.md#completion-and-independent-audit)
keeps that boundary separate from a worker's successful exit.

## Other results and architecture

The [Agoh account](docs/round2/AGOH.md) documents the completed exercise: the
universal n-fold divisibility result, reduced-numerator interpretation and
counterexample to the two formalized readings of its final characterization
conjecture, with their source-correspondence qualifications.

The research result above is separate from the project's architecture claims.
[GKM](docs/GKM.md) describes the certified Gödel-machine switching model and its
limits for the autonomous host researcher, and keeps Kolmogorov-style complexity
evidence **audit-only**, outside curiosity, reward and action selection.
[Gluing](docs/GLUING.md) describes the implemented pushout universal property in
types and its attachment/transport witnesses. A general cofibrant or
model-category framework is not implemented. The existing architecture pages
remain intact.

The [README](README.md#public-evidence-provenance) explains the public-history
redaction and original-local-hash provenance. Compiled caches and shared local
dependencies are not a complete public rebuild environment; this snapshot does
not promise a one-command fresh rebuild of the campaign.
