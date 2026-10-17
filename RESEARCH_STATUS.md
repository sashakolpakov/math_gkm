# Research status: audited snapshot through worker 184

**Cutoff: closed worker 184, 17 October 2026. Full Markov Conjecture 6.3 remains open.**

Every actual numerator-three source now has **raw horizontal log-concavity at
all natural columns and every row satisfying `2*j+1 ≤ N`**, where `N` is its
denominator. This includes zero coefficients, with no denominator bound or
unproved auxiliary premise. The earlier lower rows, first three correction
rows and exceptional row five remain proved. The earlier result for every
numerator-two source still covers all three directions at all natural indices.
Workers 182–184 additionally establish strict upper-row edge inequalities,
complete upper depths five and six, and an explicit denominator threshold for
all columns at each fixed upper depth. The threshold depends on depth; no
uniform upper-sector or full-root conclusion follows. The Agoh exercise
remains complete.

This page summarizes closed, independently audited records. It is not a live
controller report, a fresh proof run or a claim of mathematical novelty. The
[worker 184 audit](.bootstrap/independent-controller-audit/markov_worker_000184_monitoring_audit.md)
gives the current source and validation qualifications. The
[worker 181 audit](.bootstrap/independent-controller-audit/markov_worker_000181_monitoring_audit.md)
retains the lower-half-plane result. The
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
| Every numerator-three source, upper-sector edges | Strict horizontal inequalities at starts `1`, `2`, `3` and `t−2`, in row `j=N+2−t` for `5≤t≤q+2` | [First edge](research/MarkovTopEdgeSourceMB3E.lean), [second edge](research/MarkovTopSecondSourceM55C.lean), and `source_top_third_strictMEB6` / `source_top_last_strictMEB6` in [TwoEdges](research/MarkovTopTwoEdgesMEB6.lean) |
| Every numerator-three source, upper depths five and six | Horizontal inequality at every natural start for `5≤t≤6` and `t≤q+2`, including zeros | `source_top_small_depthsMEB6` in [Frontier](research/MarkovTopFrontierMEB6.lean) |
| Every fixed upper depth `t≥5` | An explicit `B(t)` gives horizontal inequality at every natural start for every actual numerator-three path with `N≥B(t)` | `source_top_path_eventualMEB6` in [SourceRegion](research/MarkovTopSourceRegionMEB6.lean) |
| Previously discharged endpoints and numerator families | Preserved by the inherited exact root reductions | [TwoComplete](research/MarkovTwoCompleteM8F7.lean), [ThreeSource](research/MarkovThreeSourceM9E2.lean) and the [current root equivalence](research/MarkovTopFrontierMEB6.lean) |

### The numerator-three lower-half-plane theorem

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
`N=3q+1` or `N=3q+2`. Both residues are covered. The worker 181 correction-band theorem
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

## Upper rows through worker 184

Use the same exhaustive actual-source parametrization `q≥1`, `r : Bool`, with
`N=3q+1` for `r=true` and `N=3q+2` for `r=false`. For a natural depth
`5≤t≤q+2`, set `j=N+2−t`. The whole row has positive coefficients exactly at
columns `1..t`; column zero and the right tail are zero. The corresponding
polygon condition is exactly `1≤i≤t`. The source equality and support are
proved in [TopTemplate](research/MarkovTopTemplateMB3E.lean) and
[TopSupport](research/MarkovTopSupportMB3E.lean), with the polygon equivalence
in [SourceRegion](research/MarkovTopSourceRegionMEB6.lean).

Worker 184 proves the two strict raw inequalities

$$
\begin{aligned}
A(3,j)A(5,j)&<A(4,j)^2,\\
A(t-2,j)A(t,j)&<A(t-1,j)^2.
\end{aligned}
$$

These are starts `3` and `t−2`; the latter is the last three nonzero positions.
They have no empirical formula or unproved sign premise. Both residues and
every actual source in the stated sector are covered, and all six displayed
points satisfy the original polygon guards. The sector is empty for `q=1,2`.
At `t=5` the two triples coincide. Together with the earlier strict starts
`1` and `2` and explicit zero handling, they give **every natural starting
column at depths five and six**, subject to `t≤q+2`.

The first edge was checked in
[worker 182](.bootstrap/independent-controller-audit/markov_worker_000182_monitoring_audit.md).
The second edge was ordinarily compiled in the interrupted
[worker 183](.bootstrap/independent-controller-audit/markov_worker_000183_monitoring_audit.md)
and receives later joint replay and axiom-print coverage in worker 184. The
historical status distinction is retained below.

### An explicit bound at each fixed depth

The declaration `source_top_path_eventualMEB6` proves

```text
∀ t≥5, ∃ B(t), ∀ actual paths with numerator a=3 and denominator N≥B(t),
  ∀ i : ℕ, A(i,N+2−t) A(i+2,N+2−t) ≤ A(i+1,N+2−t)^2.
```

The bound is explicit and derived from polynomial coefficients. For a rational
polynomial `P`, define

```text
negativeMass(P) = Σ(k < natDegree(P)) max(0, −coeff(P,k))
positiveThreshold(P) = Nat.ceil(negativeMass(P) / leadingCoeff(P)) + 1.
```

For positive leading coefficient, every natural argument at least this threshold
has positive evaluation. This general theorem is
`polynomial_positive_afterMEB6` in
[PolynomialBound](research/MarkovPolynomialBoundMEB6.lean).

Let `Mass(d,T,i)` be the inherited finite kernel mass, identified with the
template coefficient at column `i+3`, depth `T+3` and denominator parameter
`2*(T+3)+d`. Its rational gap polynomial is

```text
G(T,i)(d) = Mass(d,T,i+1)^2 − Mass(d,T,i) Mass(d,T,i+2)
gapThreshold(T,i) = positiveThreshold(G(T,i))
rowThreshold(T) = sup { gapThreshold(T,i) | i < T }
sourceThreshold(t) = 2*t + rowThreshold(t−3) + 1
B(t) = 3*sourceThreshold(t) + 2.
```

The finite supremum is the natural-number `Finset.sup`, with empty value zero.
The gap's leading coefficient is proved positive when `i+1≤T`; the remaining
indices use exact zero tails. See
[GapPolynomial](research/MarkovTopGapPolynomialMEB6.lean),
[FiniteStrip](research/MarkovTopFiniteStripMEB6.lean) and
[SourceRegion](research/MarkovTopSourceRegionMEB6.lean) for the definitions and
source transport. The argument uses the recovered leading-coefficient theorem
as a premise of a new polynomial bound; leading-coefficient positivity alone
was not an eventual-source theorem in worker 183.

All natural starts and zero coefficients remain in the conclusion. This is
**a separate bound for each fixed depth**, not one denominator cutoff covering
all depths. No numerical threshold was evaluated by the audit, and no uniform
depth bound or full upper-sector log-concavity is claimed.

### The remaining finite-by-depth condition is still open

The two edge proofs use exact symbolic identities: one certificate has 99
positive integer terms and the other 70. Their identities and positivity
arguments are covered by the recorded Lean compilation/replay/axiom chain.
Finite polynomial and source scans remain separate evidence and do not prove
the unresolved universal sign condition.

The proved `top_moment_iff_inner_stripMEB6` in
[TwoEdges](research/MarkovTopTwoEdgesMEB6.lean) identifies the older upper-sector
moment condition with `TopInnerFiniteStripMEB6`. It requires, for all natural
`T,i,d`,

```text
1≤i, i+3≤T, T≤d+2, d<gapThreshold(T,i)  ⇒  0≤G(T,i)(d).
```

For each fixed `T`, this leaves a finite index set. **Depth `T` is still
universally unbounded, and this predicate is unproved.** It is an exact
reduction of the upper-sector auxiliary condition, not a completed finite
verification or a replacement for the full root residual.

## Earlier half-plane mechanism: worker 181

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

The proved declaration `root_iff_frontierMEB6` states

```text
Conjecture63 ↔ ThreeFrontierMEB6 ∧ OtherFourM9E2
```

It is in [Frontier](research/MarkovTopFrontierMEB6.lean).
**Both predicates on the right remain unproved.** The equivalence is a proved
reduction, not a proof of either remaining predicate.

`ThreeFrontierMEB6` quantifies over `q≥1`, both denominator residues and all
natural indices. Its exact obligations are below; `N=sourceN(q,r)` and the
conditions refer to the displayed starting indices.

| Direction and triple | Remaining region |
| --- | --- |
| Horizontal: `(i,j), (i+1,j), (i+2,j)` | `q+3<j`, `N<2*j+1`, `j≠5`, and outside `TopClosedRegionMEB6` |
| Vertical: `(i,j), (i,j+1), (i,j+2)` | Outside the union of `((i=3 or i=4) and j+1≤q)` and `(5≤i≤8 and j+2≤q)` |
| Diagonal: `(i,j+2), (i+1,j+1), (i+2,j)` | Outside `3≤i≤6 and j+2≤q` |

`TopClosedRegionMEB6` is the exact union of these proved upper-row cases,
always with some `t` satisfying `5≤t≤q+2` and `j=N+2−t`:

- The inherited finished region: `i≤2` or `t<i+2`, including zero right endpoints.
- Every natural start when `rowThreshold(t−3)≤N−2*t`.
- The two new starts `i=3` or `i+2=t`.

The denominator-threshold theorem above supplies a sufficient explicit bound
for the second case; the residual uses the stated less coarse row threshold.
The already proved horizontal region also includes the lower half-plane, earlier lower
and three correction rows, and row five. The vertical and diagonal regions
are unchanged: their complementary bands were already discharged, so it would
be inaccurate to describe every vertical or diagonal case as still open.
[`OtherFourM9E2`](research/MarkovThreeSourceM9E2.lean) still requires all three
directions (`GlobalLC18`) for every actual generated source with numerator
`a≥4`.

The original root still includes its endpoints. **Those endpoints and the
earlier discharged numerator families are already handled by inherited
results; they are not additional open conjuncts.** The residual is precisely
the stated numerator-three regions together with the sources of numerator at
least four. Workers 182–184 add no unconditional vertical or diagonal region.

The earlier packed certificate and smoothed lower-row result retain their
own domains. In particular,
[`lower_row_polynomial_crossM7A3`](research/MarkovLowerCrossM7A3.lean) concerns
a smoothed polynomial under `2*j+1≤n`; it does not license arbitrary
cancellation of its binomial factor. The worker 181 raw-source result uses the
audited source transport with its auxiliary premise proved. The earlier
correction-row representation alone was not such a proof.

## Validation and inherited limits

The final worker 184 selection consists of **21 mathematical modules and
94 theorem closures**, with 46 definitions: **eleven new modules contribute
40 theorems; ten unchanged worker 183 modules contribute 54**. Every selected
final source matches a retained successful compilation and the final joint
replay source map. All 94 theorem names are explicitly printed in the axiom
audit. The printed sets contain only `propext`, `Classical.choice` and
`Quot.sound` (two omit `Classical.choice`).

The replay reports 140 guarded mathematical constants, matching 94 theorems
and 46 definitions. Its actual guard covers collected mathematical names with
either suffix `M55C` or `MEB6`; the receipt's stale prose mentions only `M55C`.
This is not a claim that every differently named generated or private constant
received a separate guard or axiom print. Twenty-nine compiler attempts comprise
22 successes, including the Audit, and seven return-code-1 failures; none timed
out. All successful snapshots match final sources. The first TailClosed attempt
failed on a dependency still compiling; its unchanged retry succeeded later.
Rejected attempts do not receive proof credit.

The [worker 183 audit](.bootstrap/independent-controller-audit/markov_worker_000183_monitoring_audit.md)
remains a closed interrupted attempt with `uncertain_effects`, a null report,
no receipt and no recorded replay or axiom prints. Its ten final modules had
ordinary successful compilations only. Separate retention preserved missing
text and nine ordinary binary copies, while the original partial archive,
including its zero-byte object, remained unchanged. **Worker 184 later rebuilt
those ten unchanged sources and jointly replayed and printed their closures.**
This later recovery does not rewrite worker 183's outcome, archive or audit
windows. An Audit-named file that was only opaque late evidence for worker 183
is attributed through worker 184's own closed records, not through its suffix.

The 2,797 inherited project source/object pairs exclude the ten recovered
modules, which are selected targets in worker 184. They include the historical
**212 worker 121 compiled-but-unreplayed modules**, including their
**195-module subset**. The separate **nineteen-module accepted set** is a
distinct historical group. Twenty project-dependent selected endpoints import
these groups; the general PolynomialBound endpoint has no inherited project
module. Importing old bodies does not recover that backlog. The seven worker
166 prefixes that compiled and printed but did not replay remain **outside the
current selected dependency graph** and receive no retroactive credit.
Worker 166's host completed successfully; its large combined replay was the
operation that timed out.

WindowLC retains its historical empty-checker and two-print boundary; Abel
retains its distinct source/object and two-print boundary. Worker 157's recovery
of twelve final worker 156 modules remains separate from worker 156's original
timeout and null-report history. Worker 171 retains its failed-report host
outcome despite later preservation and reconciliation. The inherited worker
180 source-edit overlap and corrected natural-subtraction statement keep their
recorded qualifications. The [current method review](.bootstrap/independent-controller-audit/markov_worker_000184_replay_method.md)
records these boundaries.

These are **recorded checks of the selected new and recovered modules**, not a
fresh build and replay of the entire campaign. Compiler snapshots precede
compilation of live paths, and receipts do not attest an object-output digest
at completion. Later archive/current hashes are bounded observations. Ordinary
compiled-import trust remains relevant; no fresh whole-source rebuild of
inherited project or library bodies is claimed. The independent audit itself
was static and did not rerun Lean, replay, experiments or generators. The final
third-gap generator was edited after its recorded invocation, so its final hash
does not authenticate that earlier script version; final generated source and
certificate bindings are checked separately.

The worker 184 manifest has 139 entries: 129 archived entries plus ten unchanged
recovered source paths already preserved by worker 183. Two further archived
administrative files are outside the manifest. Three unindexed Python caches
are separately retained as opaque bytes. This preservation adds no proof credit,
source-version or producing-process attribution and does not extend older
observation windows.

The principal current evidence links are:

- [Independent monitoring audit](.bootstrap/independent-controller-audit/markov_worker_000184_monitoring_audit.md), including exact source scope and finite-experiment limits.
- [Validation review](.bootstrap/independent-controller-audit/markov_worker_000184_validation_audit.md) and [method/import review](.bootstrap/independent-controller-audit/markov_worker_000184_replay_method.md).
- [Source and hash inventory](.bootstrap/independent-controller-audit/markov_worker_000184_mathematical_source_hashes.json) and [sealed audit integrity record](.bootstrap/independent-controller-audit/markov_worker_000184_audit_integrity.json).
- [Worker validation record](evidence/markov-eb6a9001/validation.json), [joint replay](evidence/markov-eb6a9001/replay-1792226814467883000.json) and [axiom audit](evidence/markov-eb6a9001/axioms-1792226830853968000.json).

The [worker 181 audit](.bootstrap/independent-controller-audit/markov_worker_000181_monitoring_audit.md)
retains its eight-module/39-closure half-plane checks. The earlier
[worker 167 audit](.bootstrap/independent-controller-audit/markov_worker_000167_monitoring_audit.md)
retains its separate 13-module/96-closure certificate checks and additional
compiled-only data-module qualification. These are not counts for the current
selection or newly performed checks of every inherited body.

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
