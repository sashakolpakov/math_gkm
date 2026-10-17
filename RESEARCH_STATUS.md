# Research status: audited snapshot through worker 181

**Cutoff: closed worker 181, 17 October 2026. Full Markov Conjecture 6.3 remains open.**

Every actual numerator-three source now has **raw horizontal log-concavity at
all natural columns and every row satisfying `2*j+1 ≤ N`**, where `N` is its
denominator. This includes zero coefficients, with no denominator bound or
unproved auxiliary premise. The earlier lower rows, first three correction
rows and exceptional row five remain proved. The earlier result for every
numerator-two source still covers all three directions at all natural indices.
The Agoh exercise remains complete.

This page summarizes closed, independently audited records. It is not a live
controller report, a fresh proof run or a claim of mathematical novelty. The
[worker 181 audit](.bootstrap/independent-controller-audit/markov_worker_000181_monitoring_audit.md)
gives the exact source and validation qualifications. The
[worker 167 audit](.bootstrap/independent-controller-audit/markov_worker_000167_monitoring_audit.md)
retains the earlier lower-row certificate review, and the
[status page through worker 158](docs/RESEARCH_STATUS.md) remains a historical
snapshot. The [mission](MISSION.md), [design](docs/DESIGN.md) and pinned
[Markov contract](contracts/markov-goal.json) are unchanged.

## What is proved

The pinned root is `MathGKM.Markov.Conjecture63` in
[Markov.lean](MathGKM/Markov.lean). It concerns the **raw integer coefficients**
of the recursive bivariate Markov numerator in squared variables. For a source
polynomial `P`, write `A(i,j) = (P.coeff i).coeff j`. The three directions are
horizontal `(1,0)`, vertical `(0,1)` and diagonal `(1,-1)`. Here
`N = (frame path).mid.b` denotes the source denominator, also written `b` in
the sources. The root retains its polygon guards and endpoint cases;
coefficient statements below retain zeros.

| Source family or region | Established scope | Principal source declaration |
| --- | --- | --- |
| Every numerator-two source | All three raw-coefficient inequalities at every natural pair of indices | `source_two_globalM8F7` in [TwoComplete](research/MarkovTwoCompleteM8F7.lean) |
| Every numerator-three source, lower half-plane | Horizontal inequality for every natural `i,j` with `2*j+1 ≤ N` | `source_lower_half_pathM5BF` in [HalfPlane](research/MarkovHalfPlaneM5BF.lean) |
| Every numerator-three source, earlier lower and correction rows | Horizontal inequality at every natural column for `j ≤ q+3`, in the exhaustive source parametrization below | Inherited lower-and-three-correction result used by [HalfPlane](research/MarkovHalfPlaneM5BF.lean); the original lower-row declaration is `source_lower_horizontal_pathM7A3` in [LowerClosed](research/MarkovLowerClosedM7A3.lean) |
| Every numerator-three source, row five | Horizontal inequality at `j=5`, including parameters for which it lies outside the half-plane | `source_three_horizontal_fifthMFFD` in [FifthSource](research/MarkovFifthSourceMFFD.lean) |
| Previously discharged endpoints and numerator families | Preserved by the inherited exact root reductions | [TwoComplete](research/MarkovTwoCompleteM8F7.lean), [ThreeSource](research/MarkovThreeSourceM9E2.lean) and the [current root equivalence](research/MarkovHalfPlaneM5BF.lean) |

### The numerator-three horizontal theorem

For **every actual Farey path** whose middle numerator is `a=3`, and every
`i,j : ℕ` satisfying `2*j+1 ≤ N`, the theorem proves

$$
A(i,j)\,A(i+2,j)\le A(i+1,j)^2.
$$

The declaration is `source_lower_half_pathM5BF`. Apart from the numerator-three
source condition, its only region premise is `2*j+1 ≤ (frame path).mid.b`.
There is no denominator bound, positive-coefficient requirement, residual
formula assumption or unproved sign hypothesis. Leading zeros, boundary
positions and zero tails are included. The theorem has no polygon premise,
so it includes every polygon-valid horizontal triple in these rows and also
the outside-support triples covered by its natural-index statement.

The inherited exhaustive classification
[`source_three_rawM9E2`](research/MarkovThreeRawM9E2.lean) identifies every actual
numerator-three source with `q ≥ 1` and a Boolean residue parameter:
`N=3q+1` or `N=3q+2`. Both residues are covered. The new correction-band theorem
first applies for `q ≥ 2`, `q < j` and `2*j+1 ≤ N`, at **every** natural column;
it removes the previous prefix/tail restriction on columns. Inherited lower
and first-three-correction rows handle `j ≤ q+3`, including the small `q=1`
cases needed by the final path theorem. Row `j=5` remains independently proved.

The numerator-two result is likewise uniform in its source parameter.
`source_two_globalM8F7` combines horizontal, vertical and diagonal results;
`source_two_weakM8F7` transfers them to the root's polygon-scoped predicate, and
`unbounded_two_sourcesM8F7` supplies arbitrarily large denominators. The
[worker 152 validation record](evidence/markov-8f77f493/validation.json) records
that earlier assembly. Later workers reuse its inherited dependencies; the
new selected checks do not revalidate every old body from source.

## Why the auxiliary result closes the band

Worker 181 proves a universal positive variance-drift inequality for the
inherited reversed kernel. Writing its normalized centered variance as `v_h`,
and `z = s+j+4-h/2`, the quantity

$$
D(j,s,h)=(z+1)v_h-zv_{h-1}+z/4
$$

is **strictly positive for every natural `j,s,h` with `1 ≤ h ≤ j`**.
The declaration `variance_drift_positiveM5BF` is in
[DriftStrict](research/MarkovDriftStrictM5BF.lean). The `h=1` boundary is included;
this is not an assertion about drift at `h=0`.

The proof uses a finite weighted-covariance theorem: nonnegative weights and
a rate ordered by squared distance from the center give a nonnegative
covariance. An exact outward reindexing then relates the neighboring masses
and centered moments. It retains **both exterior endpoint contributions**;
they are positive in the required range, and strengthen the conclusion to
strict positivity. The relevant identities are in
[RadialCovariance](research/MarkovRadialCovarianceM5BF.lean) and
[OutwardMoments](research/MarkovOutwardMomentsM5BF.lean). They are universal
finite-sum proofs, rather than an inference from numerical sampling.

The nonnegative consequence closes `PositiveParameterTailM1C6`,
`UpperAdjacentMA45`, `UnshiftedAdjacentM09F`, `UnshiftedRatioM09F` and
`SharpCompleteMarginMBE3` in [DriftClosed](research/MarkovDriftClosedM5BF.lean).
The inherited source transport can therefore be applied without an unresolved
auxiliary premise. Its condition `2*j+1 ≤ N` remains: it supplies the
nonnegative exponent needed by the source factorization. The global auxiliary
inequality does not remove that source-side condition or prove all upper rows.
Strict auxiliary comparisons also do not make raw source inequalities strict
where coefficients vanish.

The stronger quarter-drop shortcut is formally refuted by an auxiliary
variance witness in [DropObstruction](research/MarkovDropObstructionM5BF.lean),
while the required drift is positive at that same witness. This is not a
counterexample to a raw source inequality or to Conjecture 6.3.

The saved experiments remain separate finite evidence. An initial outward
script misinterpreted a helper's return tuple; its script and complete output
were copied before correction and retained alongside the corrected run.
The audit binds those versions and output records without rerunning the
experiments or regenerating random samples. The accepted Lean finite-sum
arguments establish the universal result; the experiment counters do not.

## Earlier lower-row certificate: worker 167

Worker 167 previously closed a particular four-variable polynomial sign obligation using
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

The proved declaration `root_iff_upper_residualM5BF` states

```text
Conjecture63 ↔ ThreeUpperResidualM5BF ∧ OtherFourM9E2
```

It is in [HalfPlane](research/MarkovHalfPlaneM5BF.lean).
**Both predicates on the right remain unproved.** The equivalence is a proved
reduction, not a proof of either remaining predicate.

`ThreeUpperResidualM5BF` quantifies over `q ≥ 1`, both denominator residues
and all natural indices. Its exact obligations are below; `N=sourceN(q,r)`
and conditions refer to the displayed starting indices.

| Direction and triple | Remaining region |
| --- | --- |
| Horizontal: `(i,j), (i+1,j), (i+2,j)` | `q+3 < j`, `N < 2*j+1` and `j ≠ 5` |
| Vertical: `(i,j), (i,j+1), (i,j+2)` | Outside the union of `((i=3 or i=4) and j+1≤q)` and `(5≤i≤8 and j+2≤q)` |
| Diagonal: `(i,j+2), (i+1,j+1), (i+2,j)` | Outside `3≤i≤6 and j+2≤q` |

The vertical and diagonal regions are unchanged. Their complementary bands
were already discharged, so it would be inaccurate to describe every vertical
or diagonal case as still open. The horizontal complement includes the new
half-plane, earlier lower and three correction rows, and row five.
[`OtherFourM9E2`](research/MarkovThreeSourceM9E2.lean) still requires all three
directions (`GlobalLC18`) for every actual generated source with numerator
`a ≥ 4`.

The original root still includes its endpoints. **Those endpoints and the
earlier discharged numerator families are already handled by inherited
results; they are not additional open conjuncts.** The residual is precisely
the stated numerator-three regions together with the sources of numerator at
least four. No new vertical or diagonal region is claimed in worker 181.

The earlier packed certificate and smoothed lower-row result retain their
own domains. In particular,
[`lower_row_polynomial_crossM7A3`](research/MarkovLowerCrossM7A3.lean) concerns
a smoothed polynomial under `2*j+1 ≤ n`; it does not license arbitrary
cancellation of its binomial factor. Worker 181 obtains the new raw-source
result through the audited source transport with its auxiliary premise now
proved. The earlier correction-row representation alone was not such a proof.

## Validation and inherited limits

The final worker 181 selection consists of **eight mathematical modules,
39 theorem closures and eight definitions**. Every selected final source has
a retained successful compilation. All eight modules are jointly replayed,
and all 39 theorem names are explicitly printed in the axiom audit. All
printed sets contain only `propext`, `Classical.choice` and `Quot.sound`.
The replay reports 47 guarded mathematical constants, matching the explicit
theorem/definition inventory; this is not a claim that every differently named
generated or private constant received a separate guard or axiom print.

Sixteen compiler attempts comprise nine successes, including the Audit module,
and seven rejected attempts. All successful snapshots match final sources;
failed versions retain their rejected status. There is no extra current
compiled-only or unbuilt mathematical module. These are **recorded checks of
the selected new modules**, not a fresh build and replay of the entire campaign.
The independent review itself was static and did not rerun Lean or replay.

The 2,782 inherited source/object pairs include the historical **212 worker 121
compiled-but-unreplayed modules**, including their **195-module subset**.
The separate **nineteen-module accepted set** is a distinct historical group.
Every selected endpoint still imports these groups. Importing their bodies in
worker 181 does not recover the old backlog. The seven worker 166 prefixes
that compiled and printed but did not replay are **outside worker 181's
selected dependency graph** and receive no retroactive credit. Worker 166's
host completed successfully; its large combined replay was the operation that
timed out.

WindowLC and Abel retain their distinct historical narrow replay/print
limitations. Worker 157's recovery of twelve final worker 156 modules remains
separate from worker 156's original timeout and null-report history. Worker
171 retains its failed-report host outcome despite later preservation and
reconciliation. The inherited worker 180 source-edit overlap and corrected
natural-subtraction statement keep their recorded provenance qualifications.
The detailed [method review](.bootstrap/independent-controller-audit/markov_worker_000181_replay_method.md)
records these boundaries. Ordinary compiled-import trust remains relevant;
no fresh whole-source rebuild of inherited project or library bodies is claimed.

The audit also preserves one unindexed Python cache absent from the original
controller archive, separately as opaque bytes. All 79 worker-manifest entries
were archived. The cache supplement adds no proof credit, source-version or
producing-process attribution, and does not extend older audit windows.

The principal current evidence links are:

- [Independent monitoring audit](.bootstrap/independent-controller-audit/markov_worker_000181_monitoring_audit.md), including exact source scope and the experimental correction.
- [Validation review](.bootstrap/independent-controller-audit/markov_worker_000181_validation_audit.md) and [method/import review](.bootstrap/independent-controller-audit/markov_worker_000181_replay_method.md).
- [Source and hash inventory](.bootstrap/independent-controller-audit/markov_worker_000181_mathematical_source_hashes.json) and [sealed audit integrity record](.bootstrap/independent-controller-audit/markov_worker_000181_audit_integrity.json).
- [Worker validation record](evidence/markov-5bf6837d/validation.json), [joint replay](evidence/markov-5bf6837d/kernel-1792221517779394000.json) and [axiom audit](evidence/markov-5bf6837d/axioms-1792221530359100000.json).

The earlier [worker 167 audit](.bootstrap/independent-controller-audit/markov_worker_000167_monitoring_audit.md)
retains its separate 13-module/96-closure certificate checks and additional
compiled-only data-module qualification. They are not counts for the current
selection or newly performed checks of its inherited bodies.

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
