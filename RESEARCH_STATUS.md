# Research status: audited snapshot through worker 186

**Cutoff: closed worker 186, 17 October 2026. Full Markov Conjecture 6.3 remains open.**

Every actual numerator-three source has **raw horizontal log-concavity at
every natural starting column in row `j=N+2−t` whenever `t≥5` and
`6*t≤N+16`**, where `N` is its denominator. This explicit linear theorem
includes zero coefficients and has no extra sector, formula or positivity
premise. It supplements the proved lower half-plane `2*j+1≤N`, earlier lower
and correction rows, row five, and upper depths five through eight in their
stated sector. Every numerator-two source still has all three directions at
all natural indices. The exact remaining numerator-three and numerator-at-least-four
obligations are open; the Agoh exercise remains complete.

This page summarizes closed, independently audited records. It is not a live
controller report, a fresh proof run or a claim of mathematical novelty. The
[worker 186 audit](.bootstrap/independent-controller-audit/markov_worker_000186_monitoring_audit.md)
gives the current source and validation qualifications. The
[worker 185 audit](.bootstrap/independent-controller-audit/markov_worker_000185_monitoring_audit.md)
retains the depth-five-through-eight result, and the
[worker 184 audit](.bootstrap/independent-controller-audit/markov_worker_000184_monitoring_audit.md)
retains its earlier coefficient-derived threshold and later recovery of the
interrupted worker 183 modules. The
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
| Every numerator-three source, linear upper-row bound | Horizontal inequality at every natural start in row `j=N+2−t`, for `t≥5` and `6*t≤N+16`, including zeros | `source_top_path_linearMCA9` in [LinearSource](research/MarkovTopLinearSourceMCA9.lean) |
| Every numerator-three source, strict upper-row columns | Strict inequality at start `c≥3` when `5≤t≤q+2`, `c+1≤t` and `6*t≤N+3*c+4`; the three-point polygon condition additionally needs `c+2≤t` | `source_top_linear_columnMCA9` and `source_top_linear_polygonMCA9` in [LinearSource](research/MarkovTopLinearSourceMCA9.lean) |
| Every numerator-two source | All three raw-coefficient inequalities at every natural pair of indices | `source_two_globalM8F7` in [TwoComplete](research/MarkovTwoCompleteM8F7.lean) |
| Every numerator-three source, lower half-plane | Horizontal inequality for every natural `i,j` with `2*j+1≤N` | `source_lower_half_pathM5BF` in [HalfPlane](research/MarkovHalfPlaneM5BF.lean) |
| Every numerator-three source, earlier lower and correction rows | Horizontal inequality at every natural column for `j≤q+3`, in the exhaustive source parametrization below | Inherited lower-and-three-correction result used by [HalfPlane](research/MarkovHalfPlaneM5BF.lean); the original lower-row declaration is `source_lower_horizontal_pathM7A3` in [LowerClosed](research/MarkovLowerClosedM7A3.lean) |
| Every numerator-three source, row five | Horizontal inequality at `j=5`, including parameters for which it lies outside the half-plane | `source_three_horizontal_fifthMFFD` in [FifthSource](research/MarkovFifthSourceMFFD.lean) |
| Every numerator-three source, upper depths five through eight | Horizontal inequality at every natural start for `5≤t≤8` and `t≤q+2`, including zeros | `source_top_depths_through_eightMDCB` in [TailResidual](research/MarkovTopTailResidualMDCB.lean) |
| Every fixed upper depth `t≥5`, earlier coefficient bound | An explicit depth-dependent `B(t)` gives horizontal inequality at every natural start for every actual numerator-three path with `N≥B(t)` | `source_top_path_eventualMEB6` in [SourceRegion](research/MarkovTopSourceRegionMEB6.lean) |
| Previously discharged endpoints and numerator families | Preserved by the inherited exact root reductions | [TwoComplete](research/MarkovTwoCompleteM8F7.lean), [ThreeSource](research/MarkovThreeSourceM9E2.lean) and the [current root equivalence](research/MarkovTopLinearResidualMCA9.lean) |

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

## The explicit linear upper-row theorem

For **every actual Farey path** whose middle numerator is `a=3`, every natural
depth `t≥5` with `6*t≤N+16`, and every `i : ℕ`, the declaration
[`source_top_path_linearMCA9`](research/MarkovTopLinearSourceMCA9.lean) proves

$$
A(i,N+2-t)\,A(i+2,N+2-t)\le A(i+1,N+2-t)^2.
$$

The path theorem has no additional `t≤q+2` premise: it derives that sector
condition from the actual-source classification and the linear bound. The
family-level theorem `source_top_linear_allMCA9` states the sector explicitly.
Its source adapter also discharges the generic template's conditions
`2*t≤N` and `3*t≤N+5`. There is no unproved moment, gap, formula or
positive-coefficient assumption. Column zero, boundary zeros and arbitrarily
far zero tails remain in the conclusion. No polygon premise is imposed on
this all-natural-index inequality.

### Strict columns and the polygon boundary

In the exhaustive parametrization `q≥1`, `r : Bool`, with `N=3q+1` for
`r=true` and `N=3q+2` for `r=false`, fix `5≤t≤q+2` and `j=N+2−t`.
Then `source_top_linear_columnMCA9` proves

$$
A(c,j)A(c+2,j)<A(c+1,j)^2
\quad\text{if }c\ge3,\ c+1\le t,\ 6t\le N+3c+4.
$$

The separate `source_top_linear_polygonMCA9` places **all three points** in
the original polygon when `1≤c` and **`c+2≤t`**. Thus the strict theorem's
allowed endpoint `c=t−1` is a zero-tail algebraic triple, outside that
three-point polygon range. It is not an extra polygon-valid root triple.
The row's positive coefficients occupy exactly columns `1..t`; the source
identity and support are in [TopTemplate](research/MarkovTopTemplateMB3E.lean)
and [TopSupport](research/MarkovTopSupportMB3E.lean).

Earlier strict edge results remain available at starts `1`, `2`, `3` and
`t−2` throughout `5≤t≤q+2`. Worker 185 adds start `t−3` for `6≤t≤q+2`
and start `t−4` for `7≤t≤q+2`. These are
`source_top_tail_3_strictMDCB` and `source_top_tail_4_strictMDCB` in
[TailResidual](research/MarkovTopTailResidualMDCB.lean). Together with the
earlier edges and exact zero handling, `source_top_depths_through_eightMDCB`
proves **every natural starting column at depths five through eight**, subject
to `t≤q+2`. This result is retained without imposing the new linear cutoff.

### Why the bound is universal

Worker 186 combines exact beta moment identities with a finite weighted
covariance comparison. Symmetric weights and inward-ordered functions give
the comparison without requiring each function to be nonnegative. The
endpoint-sensitive weights and zero cases are retained. Exact regrouping
then relates the auxiliary sums to the inherited kernel mass, using positive
clearing factors rather than division by raw coefficients. See
[BetaMean](research/MarkovTopBetaMeanMCA9.lean),
[RadialCompare](research/MarkovTopRadialCompareMCA9.lean),
[BetaComparison](research/MarkovTopBetaComparisonMCA9.lean),
[BetaGrouping](research/MarkovTopBetaGroupingMCA9.lean) and
[BetaTransport](research/MarkovTopBetaTransportMCA9.lean).

The resulting whole-mass-row criterion is `T≥2` and `4*T≤d+4`.
With `T=t−3` and `d=N−2*t`, the proved source transport yields precisely
`6*t≤N+16`; the first column is handled separately by its inherited strict
theorem. This is a universal finite-sum argument, not a conclusion drawn from
the saved source scans or auxiliary experiments.

Worker 184's earlier fixed-depth theorem remains historical context. Its
coefficient-derived bound is
`B(t)=3*(2*t+rowThreshold(t−3)+1)+2`, where `rowThreshold` is the finite
supremum of the gap-polynomial positivity thresholds. The definitions and
proof are in [PolynomialBound](research/MarkovPolynomialBoundMEB6.lean),
[FiniteStrip](research/MarkovTopFiniteStripMEB6.lean) and
[SourceRegion](research/MarkovTopSourceRegionMEB6.lean). It supplies a separate
bound for each fixed depth. The new linear theorem gives the explicit joint
condition on `N` and `t` stated above; it does not provide one fixed denominator
cutoff covering every depth. No formal strict-set-difference witness against
every earlier sufficient criterion is claimed here.

### The unresolved scalar strip and sufficient group condition

The proved `top_moment_iff_linear_stripMCA9` in
[LinearResidual](research/MarkovTopLinearResidualMCA9.lean) identifies the
inherited upper-sector moment condition with `TopLinearStripMCA9`:

```text
∀ d i r : ℕ,
  1≤i, 5≤r, i+r≤d+2, d+1<i+4*r  ⇒  0≤tailGapMDCB i d r.
```

This predicate is **unproved**. For fixed `i,r`, its allowed `d` range is
bounded, but `i` and `r` remain universally unbounded. The equivalence is not
a completed finite verification or a proof of the full root.

The unproved `CentralBetaMCA9` in
[CentralGroups](research/MarkovTopCentralGroupsMCA9.lean) asks for
nonnegative `betaGroupMCA9 d i r m` under those same guards, with
`r≤m` and `m+2≤2*r`. It is equivalent to the auxiliary group condition
`UpperHalfBetaMCA9`, and is **sufficient** for the scalar condition and all
upper-sector source rows. It is not asserted equivalent to raw log-concavity
or the root: signed groups can cancel in their sum. The antidiagonals used to
group this auxiliary beta double sum do **not** give new raw diagonal-direction
coverage. The new results add no unconditional raw vertical or diagonal region.

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

The proved declaration `root_iff_frontierMCA9` states

```text
Conjecture63 ↔ ThreeFrontierMCA9 ∧ OtherFourM9E2
```

It is in [LinearResidual](research/MarkovTopLinearResidualMCA9.lean).
**Both predicates on the right remain unproved.** The equivalence is a proved
reduction, not a proof of either remaining predicate.

`ThreeFrontierMCA9` quantifies over `q≥1`, both denominator residues and all
natural indices. Its exact obligations are below; `N=sourceN(q,r)` and the
conditions refer to the displayed starting indices.

| Direction and triple | Remaining region |
| --- | --- |
| Horizontal: `(i,j), (i+1,j), (i+2,j)` | `q+3<j`, `N<2*j+1`, `j≠5`, and outside `TopClosedRegionMCA9` |
| Vertical: `(i,j), (i,j+1), (i,j+2)` | Outside the union of `((i=3 or i=4) and j+1≤q)` and `(5≤i≤8 and j+2≤q)` |
| Diagonal: `(i,j+2), (i+1,j+1), (i+2,j)` | Outside `3≤i≤6 and j+2≤q` |

`TopClosedRegionMCA9` is exactly the inherited `TopClosedRegionMDCB` union
the following cases, with some `t` satisfying `5≤t≤q+2` and `j=N+2−t`:

- Every natural start when `6*t≤N+16`.
- Starts with `3≤i`, `i+1≤t` and `6*t≤N+3*i+4`.

The inherited region retains the earlier finished columns, coefficient-derived
row thresholds and strict edge/tail results, and proves the depth-five-through-eight
rows described above. The already proved horizontal region also includes the
lower half-plane, earlier lower and three correction rows, and row five.
The vertical and diagonal regions are unchanged: their complementary bands
were already discharged, so not every vertical or diagonal case is still open.
[`OtherFourM9E2`](research/MarkovThreeSourceM9E2.lean) still requires all three
directions (`GlobalLC18`) for every actual generated source with numerator
`a≥4`.

The original root still includes its endpoints. **Those endpoints and the
earlier discharged numerator families are already handled by inherited
results; they are not additional open conjuncts.** The residual is precisely
the stated numerator-three regions together with the sources of numerator at
least four. The auxiliary scalar-strip equivalence and sufficient central-group
condition do not replace these two root obligations.

The earlier packed certificate and smoothed lower-row result retain their
own domains. In particular,
[`lower_row_polynomial_crossM7A3`](research/MarkovLowerCrossM7A3.lean) concerns
a smoothed polynomial under `2*j+1≤n`; it does not license arbitrary
cancellation of its binomial factor. The worker 181 raw-source result uses the
audited source transport with its auxiliary premise proved. The earlier
correction-row representation alone was not such a proof.

## Validation and inherited limits

Worker 186's final selection has **twelve mathematical modules, 73 theorem
closures and 20 definitions**. The first recorded joint stage covers seven
modules, 45 theorems and 14 definitions; the final stage covers all twelve.
Every selected final source matches its retained successful compilation and
final replay source map. The two stages produce 118 axiom-print rows covering
73 distinct theorem names. In the final stage, 71 print `propext`,
`Classical.choice` and `Quot.sound`; `beta_scalar_radialMCA9` and
`beta_scalar_symmetricMCA9` omit `Classical.choice`.

The final replay reports 93 guarded mathematical constants, matching the
theorem/definition count. Its extra absence and unsafe/partial guard applies
to every collected `MathGKM.Markov` name ending `MCA9`. Ordinary replay still
handles the collected selected constants; the suffix guard does not establish
separate guard or axiom-print coverage for every generated/private name.
The 22 compiler attempts comprise twelve successful mathematical builds,
two successful Audit builds and eight return-code-1 failures, with no timeout.
All successful snapshots match final sources. One rejected BetaMean version
required a definition-level correction from implicit `m−k` to explicit
`((m−k:ℕ):ℤ)`; no equivalence to that rejected definition is asserted.
WeightedBetaMean's rejected-to-final change adds `maxRecDepth 8000`.
The other six rejected versions have proof edits. Rejected attempts receive
no accepted proof credit.

The [worker 183 audit](.bootstrap/independent-controller-audit/markov_worker_000183_monitoring_audit.md)
remains a closed interrupted attempt with `uncertain_effects`, a null report,
no receipt and no recorded replay or axiom prints. Its ten final modules had
ordinary successful compilations only. Separate retention preserved missing
text and nine ordinary binary copies, while the original partial archive,
including its zero-byte object, remained unchanged. **Worker 184 later rebuilt
those ten unchanged sources and jointly replayed and printed their 54 closures.**
That recovery formed part of its 21-module/94-theorem selection: eleven new
modules contributed 40 theorems. It does not rewrite worker 183's outcome,
archive or audit windows. Worker 186 imports nine of those recovered modules,
with `MarkovTopObstructionsM55C` outside the current graph; it does not perform
a new recovery of them.

The current graph has 2,837 modules: twelve selected and **2,825 inherited
source/object pairs**, including eight of worker 185's nine selected modules.
`MarkovTopTailPolynomialMDCB` is absent. Every current selected endpoint imports
the historical **212 worker 121 compiled-but-unreplayed modules**, including
their **195-module subset**, and the separate **nineteen-module accepted set**.
These are distinct historical groups, not newly replayed bodies. The seven
worker 166 prefixes that compiled and printed but did not replay remain
**outside the current selected dependency graph** and receive no retroactive
credit. Worker 166's host completed successfully; its large combined replay
was the operation that timed out.

WindowLC retains its historical empty-checker and two-print boundary; Abel
retains its distinct source/object and two-print boundary. Worker 157's recovery
of twelve final worker 156 modules remains separate from worker 156's original
timeout and null-report history. Worker 171 retains its failed-report host
outcome despite later preservation and reconciliation. The inherited worker
180 source-edit overlap and corrected natural-subtraction statement keep their
recorded qualifications. The [current method review](.bootstrap/independent-controller-audit/markov_worker_000186_replay_method.md)
records these boundaries.

These are **recorded checks of the selected worker 186 modules**, not a fresh
build and replay of the entire campaign. Compiler snapshots precede compilation
of live paths, and receipts do not attest an object-output digest at completion.
Later archive/current hashes are bounded observations. Ordinary compiled-import
trust remains relevant; no fresh whole-source rebuild of inherited project or
library bodies is claimed. The independent audit was static and did not rerun
Lean, replay, experiments or generators. The initial finish wrapper and
overwritten first-stage validation record are not separately archived; retained
replay/Audit records and completed outputs bind that stage.

The weighted-mean generator explicitly calls the symbolic routine after import;
the import alone does not rerun it. The generator was edited after its recorded
invocation, so its final hash does not authenticate invocation-time script
bytes. Rejected and final generated Lean snapshots are retained separately.
The accepted 176-term positive-literal identity and its sign proof are covered
by the recorded Lean checks. Saved experiments, unsuccessful auxiliary sign
tests and earlier certificate shifts remain separate evidence; they do not
establish or refute the universal raw-source result by themselves.

The worker 186 manifest has 115 entries, all in the 117-file archive; the two
additional archived files are administrative. The initial exact current
inventory has 121 paths, including four unindexed opaque caches retained
separately. The closing inventory finds 122 paths with the original 121
unchanged. Its one additional cache, `stein_symbolic_ca9709f2.cpython-314.pyc`,
is retained in a separately authorized one-path observation after the original
hash window. The late cache's name, discovery and metadata establish neither
its producing process nor creation time, source version or mathematical
acceptance. This retention does not extend or replace either original audit
window and adds no validation credit.

The principal current evidence links are:

- [Independent monitoring audit](.bootstrap/independent-controller-audit/markov_worker_000186_monitoring_audit.md), including exact source scope and finite-experiment limits.
- [Validation review](.bootstrap/independent-controller-audit/markov_worker_000186_validation_audit.md) and [method/import review](.bootstrap/independent-controller-audit/markov_worker_000186_replay_method.md).
- [Source and hash inventory](.bootstrap/independent-controller-audit/markov_worker_000186_mathematical_source_hashes.json) and [sealed audit integrity record](.bootstrap/independent-controller-audit/markov_worker_000186_audit_integrity.json).
- [Worker validation record](evidence/markov-ca9709f2/validation.json), [final joint replay](evidence/markov-ca9709f2/replay-1792230612754560000.json) and [final axiom audit](evidence/markov-ca9709f2/axioms-1792230636010725000.json).

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
