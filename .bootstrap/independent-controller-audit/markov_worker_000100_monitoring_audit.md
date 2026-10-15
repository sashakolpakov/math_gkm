# Independent mathematical audit: worker 000100

Request `1b02dddc008a41708b03d1cb474e0824`. Read-only review of completed-worker final mathematical sources, English scope, finite-experiment domains and retained validation records in `/Users/sasha/math_gkm`. No research, Lean, proof, replay, finalizer or experiment was executed. No project file was changed, no proposer was contacted or assisted, and active worker 101 was not inspected. Audit notes are confined to `/private/tmp`.

## Finding and exact gain

The accepted new source inequality adds the single starting index **`j=3n+6` for `n≥7` and actual predecessor denominator `c≥5`**. Combining it with the inherited interval proves `source_fourth_final_sixM1B` on `3n+6≤j≤4n+5` with these same conditions. Unlike worker 99's final theorem, this new assembled theorem explicitly requires `n≥7`. Its residual preserves worker 99's separately proved shorter-run coverage.

The accepted proof genuinely handles the correction term, the exceptional `c=5,r=4` case and zero coefficients. It has no remaining formula, gap, positivity, polygon or fitted-count premise. All 48 source coefficient identities at the eight onset offsets in six chambers are accepted, but the other five proposed onset inequalities are **not** proved by this worker. The generic reflected five-block identity and the actual-source two-block formula are exact identities, not log-concavity results. The full root and the residuals remain unproved.

No substantive mathematical mismatch was found in the final accepted theorem scope. The mathematics note retains earlier intended six-offset construction text, followed by an explicit revised-route/candidate boundary. Its final accepted section and final response correctly restrict the new inequality to the sixth offset. The earlier construction paragraphs must not be counted as six completed inequalities.

## Raw indices, source and endpoint conditions

For actual `rest : List Bool`, put `c=(frame rest).mid.b`, `r=(frame rest).mid.a`,

```
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r.
```

Let `A(i,j)=coeff (frame path).mid.p i j`, the original raw integer numerator coefficient in the established squared-variable convention at third variable one. The fourth lower slice has total degree `a+4`. The final theorem assumes natural `i,j`, `i+j+2=a+4`, `n≥7`, `c≥5`, and `3n+6≤j≤4n+5`, and concludes

```
A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2.
```

The ordered `(1,-1)` triple is `((i+2,j),(i+1,j+1),(i,j+2))`. It does not start at `(i,j)`. The new onset lemma uses exactly `j=3n+6`, so its coefficient offsets are 6,7,8. The equality boundary is filled by that lemma; `j≥3n+7` uses the inherited final theorem. There is no upper bound on `n,c,r` or path length, no positive-support filter and no nonzero condition. Weak inequalities retain zero endpoints and coefficients outside support whenever the natural-index/total-degree premises hold.

Only this fourth-slice direction is newly covered. The theorem does not discharge arbitrary smaller runs, every smaller predecessor cycle, other diagonals or either axial direction.

## Exact two-block backward extraction

For integer polynomials, `convSeven_shift_guardM1B` proves

```
conv(X^m Q,j) = if m≤j then conv(Q,j-m) else 0,
conv(Q,t) = sum over 0≤d≤t of Q[d] choose(7+t-d,7).
```

The zero branch is proved by vanishing shifted coefficients. It is not represented by an unconditional naturally truncated index, which would incorrectly retain the zeroth coefficient when `j<m`.

`backward_two_coeffM1B` assumes, for natural `n,j`,

```
(1-X)^8 P = L + X^(3n) H3 + X^(4n) H4,
natDegree L ≤ j+7, natDegree H3 ≤ 14, natDegree H4 ≤ 15,
j ≤ 4n+7.
```

It proves

```
P[j] = conv(reflect 15 H4,4n+7-j)
     + if j≤3n+6 then conv(reflect 14 H3,3n+6-j) else 0.
```

The proof groups `H3+X^n H4`, applies the inherited variable-degree backward extraction, and reflects at degree `n+15`. The `H3` reflection is padded by `X^(n+1)`, giving precisely the guard above. All natural subtractions are guarded or accompanied by proved bounds. The inherited extraction explicitly includes `P=0`; there is no evaluation-point restriction, invertibility assumption or hidden positive coefficient requirement.

`source_fourth_backward_twoM1B` discharges the polynomial and degree premises for the actual source, with `P=24` times its cut coefficient polynomial and corrected `H4`. Its exact scope is **every natural n**, actual `c≥5`, natural `i,j` with `i+j=a+4`, and

```
2n+6 ≤ j ≤ 4n+7.
```

The lower three numerator blocks have degree bounds 12,12,13, so the lower-index condition proves their combined degree is at most `j+7`. The remaining bounds 14 and 15 include the actual highest-block count correction. Thus this source theorem is unconditional as an identity; its useful coefficient range must not be confused with a proved inequality range. The `n≥7` bound belongs to the onset coefficient/inequality adapters, not to this general source identity.

The source expression retains the natural counts `2r-c`, `min(c-r,3r-c)` and `3r-2c` and the established fourth correction. They are not silently replaced by signed arithmetic or empirical fits.

## Full reflection: exact padding, conditional interface

`reflect_shift_padM1B` assumes `natDegree H≤s` and `m+s≤t`, and proves

```
reflect t (X^m H) = X^(t-m-s) reflect s H.
```

`reflect_five_blocksM1B` uses block degree bounds 12,12,13,14,15 to identify reflection at `4n+15` with

```
X^(4n+3) reflect 12 H0 + X^(3n+3) reflect 12 H1
 + X^(2n+2) reflect 13 H2 + X^(n+1) reflect 14 H3
 + reflect 15 H4.
```

In particular the first padding exponent is `4n+3`, distinct from the next one. `backward_five_blocksM1B` adds the exact cleared numerator identity and `j≤4n+7`, and identifies `P[j]` with the convolution of this reflected sum at `4n+7-j`. These are generic integer-polynomial statements with explicit identity/degree hypotheses; the accepted module is not an additional unconditional all-source inequality theorem. The actual-source two-block instantiation described above is proved separately.

## Six chambers and the 48 accepted coefficient identities

The actual reduced predecessor has `0<r<c` and coprime labels. The chambers are `(0,1/4)`, `(1/4,1/3)`, `(1/3,1/2)`, `(1/2,2/3)`, `(2/3,3/4)`, `(3/4,1)`. The final assembly explicitly excludes all five internal equality boundaries using reduced denominators and `c≥5`, then exhausts the strict chambers. No attainable source case is dropped at an equality boundary.

`pen_reflectM1B` identifies the full reflected `H3` polynomial algebraically. Its six `pen_conv` identities evaluate the short convolution at indices 5,4,3,2,1,0. Each chamber's `pen_source` proves the natural-subtraction/minimum casts under its strict inequalities before using the corresponding integer expressions. Together with the inherited exact highest-block reflection, these establish the 48 formulas

```
7560 A(i,3n+k) = onsetValue(chamber,k,n,c,r),  k=1,...,8,
```

for actual `c≥5`, `n≥7` and `i+3n+k=a+4`. The source interval and convolution-index bounds required by both blocks are discharged. The highest-block shape uses the integer argument `n-k`; at `n=7,k=8` it is `-1`, not a truncated natural zero. The correction vanishes for offsets 7 and 8 because the second convolution is explicitly absent there. The common normalization is `7560=24·315` at every position; no factorial or position-dependent weighting occurs.

These coefficient identities are useful accepted results even though the attempted broad six-offset gap assembly failed. They do not imply the unproved five earlier inequalities without a separate gap argument.

## Sixth-offset correction argument and exceptional predecessor

Write the three uniformly scaled raw coefficients at offsets 6,7,8 as `U,V,W`, and the inherited highest-block shape values as `B0,B1,B2`. The accepted source identities give

```
U = B0 + δ,  V = B1,  W = B2.
```

The inherited chamber gap proves `B0 B2 ≤ B1²` at the integer shape parameter `e=n-6≥0`, including the shifted arguments `n-7,n-8`. In chambers 0–3, `δ=0` by definition. In chambers 4 and 5 the exact factorization is

```
δ = 30240 (3r-2c) (3-r+n(6-c)).
```

For `c≥6`, the actual chamber inequalities establish `3r-2c≥0`, `r≥3` and `6-c≤0`, hence `δ≤0`. `raw_coeff_nonneg18` supplies nonnegativity of the **actual raw endpoint** `A(i,3n+8)` for every path/natural index, with no support or polygon hypothesis. Consequently `δW≤0`, and `UW = B0W+δW ≤ V²`. This is the correct inequality direction; it does not assume nonnegativity of an arbitrary unrelated shape polynomial or divide by a possibly zero endpoint. Scaling is cancelled uniformly. Zero endpoints are included.

The fourth strict chamber forces `c≥6` arithmetically, so it has no missing `c=5` subcase. In the highest chamber, failure of `c≥6` together with actual `c≥5` forces `c=5`, and `3c<4r<c·4` with `r<c` forces `r=4`. This case is treated separately by `onset_six_exceptionM1B`, not by extending the nonpositive-correction argument where it need not hold.

The exception theorem is universal for integer `n≥7`: after `x=n-7≥0`, it proves the exact scaled gap is a degree-12 polynomial in `x` with nonnegative integer coefficients (positive constant term). Its source adapter substitutes the actual `c,r` and the three proved coefficient identities, then cancels the common scale. It is an infinite-parameter proof, not a finite check of `4/5` or a numerical root estimate.

## Residual equivalences preserve previous coverage

`FinalFourthRegionSixM1B` records the actual path decomposition, `n≥7`, `c≥5`, `3n+6≤j≤4n+5` and `i+j+2=a+4`. `InteriorCore63SixM1B` retains the inherited horizontal and vertical clauses and all diagonal polygon/degree/slope guards. Crucially, it keeps **both** the old `¬FinalFourthRegionM94` clause and the new exclusion, in addition to the initial-region exclusion. Thus earlier final-interval coverage for runs below seven is preserved rather than overwritten.

`root_iff_core_sixM1B` starts from the prior exact equivalence and fills only the newly excluded region with `source_fourth_final_sixM1B`. Its reverse implication is unconditional; its residual predicate is not itself proved. Endpoint handling and the other directions remain in the inherited root correspondence.

`run_fourth_iff_middle_sixM1B` assumes **`n≥7,c≥5`** and proves that all polygon-valid raw fourth-slice triples on that source are equivalent to those with exactly

```
2n < j < 3n+6.
```

It retains the three original polygon guards and the total-degree condition. The reverse implication uses the previous prefix at `j≤2n`, the new final interval at `j≥3n+6`, and the established polygon upper bound `j≤4n+5`. No boundary case or zero is dropped. The older `n≥4` middle equivalence is not strengthened for `n=4,5,6` by this theorem.

## Finite-domain recount and candidate limits

The saved experiment inputs are exactly 536 triples `(n,c,r)`: all coprime `1≤r<c`, `5≤c≤21`, at runs `7,8,12,24`. Independent input/index arithmetic, without evaluating research polynomials or importing the scripts, reproduces:

- 14,740 two-block coefficient checks, at `2n+6≤j≤4n+7`;
- 4,288 onset coefficient checks, eight offsets per input;
- 3,216 onset triples passing all three original polygon conditions, six starts per input in this finite sample;
- 560 literal-recurrence comparisons across 31 inputs satisfying `b≤70`.

The total of 19,028 coefficient checks includes both categories and can revisit the same coefficient through distinct formulas. It is not a count of distinct universal cases. The saved two-block zero count is 804, and the saved failure list is empty; coefficient values and assertions were not independently rerun. The script evaluates saved inherited candidate expressions and exact cut/literal computations, rather than invoking the Lean theorem. Its tests of all six onset inequalities do not upgrade the five excluded inequalities to universal proofs.

The accepted route excludes all broad generated OnsetGap/OnsetColumns/ChamberGaps/OnsetAdapter/OnsetAll/AfterMiddle assemblies that did not pass. Earlier construction discussion, saved polynomial candidates, perturbation probes and finite passes are kept separate from the single accepted new onset inequality.

## Retained validation and provenance

Completed validation comparisons find 254 controller artifacts and 253 indexed files matching archive/current bytes. The 27 accepted mathematical modules contain 114 named theorems and 117 definitions, including the many coefficient and reflection identities. Audit is compiled separately. All 27 mathematical modules are explicit targets of one successful union replay; the 114 directly printed closures match the accepted inventory and use only subsets of `propext`, `Classical.choice` and `Quot.sound`. These are not 114 independent new source regions.

There are 38 actual ordinary builds: 28 successes (27 mathematical modules plus Audit), seven errors and three timeouts, plus one skipped queued build. All seven errors are earlier versions of ultimately accepted sources. The excluded final set has 87 sources: 36 OnsetGap, 36 OnsetColumns, six ChamberGaps, six OnsetAdapter and three broader assemblies. None has a final object. Three excluded ChamberGaps had timed-out invocations, one OnsetColumns check was skipped and 83 excluded sources were never invoked. The skipped record is not an attempted or passed proof check.

The validation's eleven rejected records comprise ten actual unsuccessful builds plus the skipped queue record. The final response correctly separates them. Including the successful union gives 39 actual Lean invocations, not forty. There are no direct replays or extra successful build versions. All selected final source/build/snapshot/object/union bindings match, and all matching builds precede the union interval.

The successful union receipt is `kernel-union-1792085904369390000.json`, SHA-256 `2dd08df3068112edede6484b484735685f8f64899f563a6e6571ecaa65e906b5`. It records return code zero, `replay union passed`, 27 targets, 32.338486 seconds, and a matching completed event 219. Its filename timestamp is `17:38:24.369390 UTC`, not a separate exact kernel-return log. All mathematical modules are selected; Audit is compiled-only. The name `Six` in the selected endpoint modules denotes the sixth offset, not six accepted onset inequalities.

The drivers are unchanged: `ReplayKnown6d2c` hash `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`, `ReplayBatch07F1` hash `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`. The union wrapper matches its predecessor after request-ID substitution; the validator additionally changes only its temporary-directory suffix. The inspected static base contains 790 unchanged local modules, no selected target, explicit-name collision or cycle. All 35 accepted worker-99 modules are imported-only. All 87 new excluded drafts and the predecessor's twelve excluded drafts are absent from the inspected imports and target set.

This is alternate kernel replay relative to inherited compiled objects, not official CLI replay or a fresh whole-source rebuild. Selected sources are hashed before launch and require matching successful build receipts; the driver is hashed after return. Actual loaded object bytes/times are not frozen or recorded at invocation. Static source graphs do not independently establish binary import tables or private/generated constant inventories. Imports remain trusted, with the replay's usual axiom, unsafe/partial, duplicate-name and matching-imported-theorem limitations as recorded in the method report. The inspected explicit target/import/name checks expose no selected-source shortcut. No missing validation or excluded proof was completed by this audit.

Finalization succeeds at events 223 and 230, producing maps of 251 then 252 entries after a source-token check and documentation/operational updates. Event 232 rehashes those 252 entries and the 219 protected inputs, adds `final-check.json`, then rehashes the final 253-entry map. Its recorded pre-addition count of 252 is not a missing artifact. All 219 preservation and 210 reconciliation comparisons match; the sets overlap. All 205 worker-99 archive/controller artifacts are unchanged, preserving historical outcomes and exclusions.

On `2026-10-15`, the final artifact index mtime is `17:39:56.142319 UTC`, 82.531784 seconds before the deadline. The controller finishes at `17:40:36.036414 UTC`, elapsed 1757.362312 seconds, 42.637689 seconds before the deadline. Final message 233 matches controller `final.json` and its report; event 234 records turn completion. No pending, late or unarchived worker-100 artifact was found. Operational completion is successful; mathematical completion remains null.

Supporting notes and hashes:

- `markov_worker_000100_validation_audit.md`: `196f8111c0b8a039177e8f3d725b88f7e77ba0d6c858e963b67f702f3e5cd572`.
- `markov_worker_000100_validation_evidence.json`: `ed50b0ac7f937001eb322d0e227257e2b8abd4fbca399fd3dda217f05c26a313`.
- `markov_worker_000100_replay_method.md`: `786eff256e84429ce8bed3abc0016d9de7870a1e135d6d1bd068e69d877fb100`.
- `markov_worker_000100_replay_method_evidence.json`: `acb18308a8cafc18a293d285b2b6a9020833e4976bd0073ab1498bb33f74ecec`.

All 1,706 combined delegated-audit inputs were rehashed unchanged at `2026-10-15T17:59:28.580603+00:00`. Imported-object/binary inventory and fresh-tree qualifications remain explicit.

## Source anchors

| Final mathematical source | SHA-256 |
| --- | --- |
| `research/MarkovFourthFinalSixM1B.lean` | `37d749f0f5110a51b7e2f2ec9606efa49427abf930e25ae3b68eae99e6ab0603` |
| `research/MarkovFourthMiddleSixM1B.lean` | `c4b0a4ae68ba18c91dfcda8ee653f9317eff71e6f370f5418ea3dce9e4bbc293` |
| `research/MarkovResidualSixM1B.lean` | `4ce4981a60a9e3cba0eb23beb37898e6198e1b60a6348ea3a94f9300dd2860fa` |
| `research/MarkovOnsetSixAllM1B.lean` | `7b765413bab037fa8b0d790477c9c22e414c5d3cd17924794a62ce3572bb39ab` |
| `research/MarkovOnsetSixSource4M1B.lean` | `a8170a12a8c72f82c80f005d04858dd76dda577a01ef60306512fed689cc9e3f` |
| `research/MarkovOnsetSixSource5M1B.lean` | `ecb527c5b02f5693612c295a81e11ce4e5837ca8adc3802c925e82dc48169368` |
| `research/MarkovOnsetSixExceptionM1B.lean` | `c2b0a8c4e1701842d79b4a5c9b41b3305479b9bfb5ceaf948990b66a23240b7f` |
| `research/MarkovBackwardTwoM1B.lean` | `6b3745924fef1adbb57122aa6519515159bab1738bd8c970af203012b6ba2027` |
| `research/MarkovBackwardTwoSourceM1B.lean` | `9050d4f2cda8e5c0e8de412fb4deaacf6c533cbccf4e9afab5b3ba2acf817299` |
| `research/MarkovReflectBlocksM1B.lean` | `6c7b59a9745b3336673b53f8c7980a495999714335630ecf9271bd2f086ae19d` |
| `research/MarkovPenultimateM1B.lean` | `fa996014abd778faa328565078fa2dbbc6c09215d3ed5836425911988fe3527a` |

No literature novelty or fresh complete paper/Lean correspondence claim is made. This records the exact additional checked range and the still-open obligations.
