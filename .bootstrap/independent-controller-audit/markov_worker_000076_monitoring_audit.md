# Worker 000076 independent mathematical monitoring audit

Completed request: `adb2c7b044ee463584f90512a565fe95`. Audit date: 2026-10-15.

This is a read-only review of the retained English account, thirteen final mathematical Lean sources, inherited definitions needed to interpret them, experiment scripts and saved outputs, and matching recorded validation. No project files were changed, no proofs or experiments were rerun, no research suggestions were supplied, and no active successor was inspected or contacted. Only this independent note and its companion validation audit were written outside the project.

**Finding:** this round establishes a genuine additional unconditional raw-coefficient region: the third lower diagonal of every source with `2a ≤ b`. The general-run identities are also proved, but their general log-concavity consequence remains conditional. The full conjecture is not proved or refuted. No discrepancy between the final mathematical claims and the inspected Lean statements was found.

## Unconditional raw source result

Write `A(i,j)` for the ordinary, unnormalized numerator coefficient at `(i,j)` of the source indexed by the actual path, whose reduced index is `a/b`. The final theorem `source_third_lower_lowADB2` states, for every such path and natural `i,j`, that

```
2*a ≤ b
i+j+2 = a+3
(i,j+2), (i+1,j+1), (i+2,j) all lie in the original source polygon
⇒ A(i,j+2)*A(i+2,j) ≤ A(i+1,j+1)^2.
```

Thus the three coefficients have total degree `a+3`, the third lower diagonal. They are not factorial-normalized or otherwise rescaled. All three original polygon guards occur in the final statement. There is no denominator cutoff, no coefficient-positivity premise, and no residual formula, chamber or moment assumption. Boundary points and any zero coefficients permitted by those premises remain covered.

For a low-slope path `false::rest`, put `r = (frame rest).mid.a` and `c = (frame rest).mid.b`; the new source has `(a,b)=(r,c+r)`. For `c ≥ 4`, `source_cubic_momentADB2` proves the actual source's cubic trace moment, and `source_third_formulaADB2` proves the previously conditional `ThirdFormula75` for all natural coefficient indices. The occurrence statistics are the actual source counts, using natural-number truncation in `2r-c`, `3r-c` and `3r-2c` before conversion to the coefficient ring.

The bridge is substantive. A local identity expresses the relevant cubic expression as a combination of constant, one-symbol, `11`, `101` and `111` counts plus a telescoping potential. The source scan closes with the same boundary pair; the potential terms cancel. Previously established actual-source pattern counts and first two moments then identify the cubic trace expression. This discharges the former source-moment hypothesis; it does not merely rename it or assume a permutation/scan correspondence.

`third_chamber_of_reducedADB2` discharges the chamber condition from `c ≥ 4`, `0 < r < c` and coprimality. The exceptional equalities `2r=c` and `3r=2c` contradict these hypotheses; the legitimate boundary `3r=c` is included in the low chamber. The source theorem obtains all these hypotheses from the actual reduced frame. `source_false_third_largeADB2` consequently proves the raw inequality for all natural triples on the indicated total degree when `c ≥ 4`, without requiring polygon guards in that intermediate theorem.

Small cases are handled separately, rather than by extending the large-cycle formula:

- `c=2,r=1` gives source `1/3`. Total degree `a+3=4` exceeds its polygon's maximal degree `3`, so there is no admissible triple.
- `c=3,r=1` gives `1/4`; the required diagonal is the already proved top diagonal.
- `c=3,r=2` gives `2/5`; it is the already proved second upper diagonal.

The final all-path theorem also discharges the path-shape reduction. The pure repeated-right family can satisfy `2a≤b` only in the initial small case, where the polygon excludes the requested triple. For a path with an initial repeated-right segment followed by a left turn, positivity and the source index formulas force that segment to have length zero. No source-identification premise remains exposed.

## Exact residual reduction and actual gain

`root_iff_interiorADB2` proves an equivalence with `Interior63ADB2`, not the truth of that residual proposition. The horizontal and vertical clauses are unchanged from the preceding exact residual. The diagonal clause retains all three polygon guards and the previous conditions

```
i+j+5 ≤ a+b-1
a+3 ≤ i+j+2,
```

and now additionally restricts the remaining obligation to

```
a+4 ≤ i+j+2  OR  b < 2*a.
```

When this disjunction fails, the old lower bound forces total degree exactly `a+3` and the slope condition gives `2a≤b`, so the new unconditional theorem supplies precisely the removed case. There is no circular residual premise in that theorem. The imported exact equivalence chain preserves the pinned root's two exceptional endpoint polynomials; they are not silently omitted because `Interior63ADB2` quantifies only over paths.

This is a strict reduction of the tracked unsolved domain, rather than merely a new presentation of an already covered upper boundary. For example, the admissible source label `2/11` and triple `(2,3),(3,2),(4,1)` satisfy the old diagonal residual's guards, have total degree `a+3=5`, and are excluded from the new residual by the new theorem. Their upper-boundary distance is seven, so they are outside the previously established first six upper diagonals. Some small or numerator-one cases overlap earlier proofs; that overlap does not exhaust this newly covered region. This is scope accounting, not a claim of publication novelty.

## Universal identities beyond the low-slope inequality

`MarkovBooleanCyclicADB2` proves a universal coboundary formula for an arbitrary function of three Boolean symbols over a commutative ring. Its actual-source scan identity expresses the cyclic sum in terms of length, one-symbol and `11/101/111` counts. It is not a log-concavity theorem and does not assume one.

The run modules use the actual blocks with lengths `n + bit`, where `n` is any natural number. The gauge, closure, first-order block condition and source trace/cut bridges are proved. For predecessor length `c ≥ 4`, `source_run_trace3ADB2`, `source_run_cut3ADB2` and `source_third_run_polyADB2` yield an exact parameter-only polynomial for six times the third cut slice. The polynomial uses `n,c,r`, the established first and second compressed expressions, and the universal Boolean local moment expression; it does not retain an arbitrary source word or an unproved trace identity as an input.

`source_third_run_rawADB2` extracts the coefficient identity for every natural `i,j` with `i+j=a+3`. It is an exact raw-coefficient identity, including zero coefficients, with no support filter. However, `source_third_run_of_lcADB2` explicitly assumes the relevant all-index log-concavity of that parameter polynomial. The general run parameter `n≥1` is therefore not covered by an unconditional new third-lower-diagonal inequality. The universal identities must not be reported as a universal high-slope log-concavity proof.

## Small-cycle correction and formula obstruction

The generic three-block and two-block matrix moment identities are proved separately. For actual predecessor length `c=3`, `source_third_run_poly_threeADB2` proves, for every natural run parameter, that

```
6 * actual third-cut polynomial
  = thirdRunPolyADB2(n,3,r) + 6*X^b,
```

where `b` is the resulting source denominator. This is an unconditional exact correction identity for both actual `r=1,2` possibilities. It does not establish general-run log-concavity. A parameter-only actual-source formula for the two-cycle case remains unfinished even though the generic two-matrix identity is proved.

The source `[false,false]` is `1/4`. The checked small-source identities give its third-cut polynomial as `(1+X)^4` and its actual raw coefficient `A(0,4)=1`. `third_small_formula_failureADB2` formally refutes the unadjusted extension of `ThirdFormula75` to this source: that formula would give zero at the corresponding index instead of six times the actual coefficient. The point `(0,4)` lies in the actual polygon. This is a genuine counterexample to the unadjusted formula extension, **not** a counterexample to source log-concavity. The final low-slope theorem handles this source correctly using the existing top-diagonal result.

## Finite evidence, counted separately

The saved scripts and outputs were inspected, not executed. Counts below were checked against the loop domains and stored records without recomputing source polynomials or symbolic identities.

- The main scan uses reduced indices with `2≤b≤48`. The formula-applicable domain has 611 sources, 30,818 cut-polynomial coefficient positions, and 11,593 corresponding literal raw positions whose coordinates are natural. There are 957 low-slope polygon-valid triples, including seven applicable small-cycle triples. These are finite checks; the universal Lean proof is separate.
- The chamber experiment has 36 records: four symbolic chambers for each run parameter `n=0,…,8`. It records 540 gap expansions with no negative stored monomial coefficients. These are unchecked symbolic computations over that finite set of run parameters, not Lean certificates or a proof for all run parameters. No symbolic computation was independently rerun.
- The corrected three-cycle experiment has 26 cases, `n=0,…,12` and `r=1,2`, with 1,144 cut-polynomial positions. Literal raw comparisons apply where the corresponding coordinates are natural. This finite evidence is separate from the universal three-cycle correction theorem.

## Validation and retained evidence

The companion [validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000076_validation_audit.md) and [binding evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000076_validation_audit_evidence.json) give the full checks. All thirteen final mathematical modules and the axiom-audit module have matching recorded successful compilation and alternate-driver replay: fourteen builds plus fourteen replays. The 53 named mathematical theorems exactly match the inventory and 53 individual printed axiom closures. One theorem is axiom-free; all other closures use only the permitted standard axioms. No proof placeholder, extra axiom or unsafe/native bypass was found in the accepted mathematical sources.

All 121 indexed artifacts and both self-manifests agree with retained archive bytes and controller after-hashes: 123 controller artifacts in total. The 129 preservation rows also agree. Of 36 actual validation receipts, 28 are successful final checks and eight are earlier failed builds; every rejected snapshot differs from the accepted final source and precedes its successful checks. The extra matching `run-*.json` file is a symbolic-experiment list, not a validation receipt. No validation receipt timed out in this round.

The initial finalizer invocation failed on that list-valued experiment file during input collection, before output writes. The recorded repair filters validation-shaped records; the second invocation succeeds and all final metadata matches the archived/controller-bound bytes. All 107 started events have completion events. The controller finished at **06:06:37.857149 UTC**, **1792.396273 seconds** after its start, **7.603727 seconds before** the 1800-second deadline. No post-deadline result or unresolved late validation action is needed to support this audit.

The replay driver is unchanged at SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. These records use the previously audited alternate driver for Lean's pinned per-module replay procedure. They are not official `leanchecker` CLI receipts or a fresh rebuild/replay of inherited dependencies. Imported compiled environments are reused. Invocation receipts bind source snapshots, while final object binding rests on manifest/controller/archive agreement and recorded chronology; there is no separate invocation-time object digest. This audit performed no independent kernel execution.

## Final mathematical source hashes

Each hash below agrees with the retained archived source and the successful final build/replay source bindings.

| Module | SHA-256 |
|---|---|
| `MarkovBooleanCyclicADB2` | `bf8d8d7664340b7eaf03182c957b7cb2052ba3a890503cb933eaee948f5b8292` |
| `MarkovCyclicLocalBridgeADB2` | `7ef081baebd8c35b4c63d6e99a08e0a2bc83fd34719ce5bc2484b883963e6940` |
| `MarkovFirstTwoCyclicADB2` | `7a565d345ad71ee8543e4de68b4a3964ad0f3b12d49dda9ccf40c269fc204064` |
| `MarkovInteriorADB2` | `2babf871076332113e0cc353c29a67d1d54b8ef89ee2b017f4ebe02c7e1835d4` |
| `MarkovLocalTelescopingADB2` | `94d26cfb741834d9012c21f261735e665a48809607be285770cf84552b92306a` |
| `MarkovRunCubicADB2` | `e377f6eaeb1be56c6b47ce2292b071dbf3b6748785b18c6bc7101205b8c0957f` |
| `MarkovSmallCycleADB2` | `3dffeaad207a6f09e0ba53324253d61ff1c6bf5e2c1a4abeae748217881994f5` |
| `MarkovSmallMomentsADB2` | `148f33a5b4552063690b633a121a51d559325936b398f739ce582c2480b73f87` |
| `MarkovSourceCubicADB2` | `f6d05c85dae56d169542ac2673583f779c96c5f83e19e155289f31f1eb4f1b01` |
| `MarkovThirdChambersADB2` | `f60422b54348a94c263342d3c41e4f5f9b3ae18abf3f782f896b8ec0b4fd18f2` |
| `MarkovThirdLowSourceADB2` | `8d028687312ea5d536dcd06147b80fcbe84d588cf188957192b0041ee2754d8d` |
| `MarkovThirdRunPolynomialADB2` | `32e36184ebb37d089658bb95e16b8a193e672ce6b9295cefa6e2ead4d41f8d1b` |
| `MarkovThreeRunCorrectionADB2` | `f58a081664a618c53ec99459cf5f5b0cdb28d96933a43a9403b79e0a0635056c` |

The axiom-audit source hash is `5a9604e6f4b2472f33a1eacc54186601b1f0d44ea1666023bc45a9cf015dcefc`. English accounts, scripts and experiment outputs also match their archived copies. The controller records `mathematical_resolution: false`, consistently with the remaining root obligations described above.
