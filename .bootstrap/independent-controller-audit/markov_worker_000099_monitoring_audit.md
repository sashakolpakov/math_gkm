# Independent mathematical audit: worker 000099

Request `94b1de05f66043aeb7a32e517aeb2a6f`. Read-only inspection of completed-worker mathematical source, English claims, experiment input/index domains and retained validation evidence in `/Users/sasha/math_gkm`. No Lean, proof, replay, finalizer, experiment or research code was executed; no project file was changed; no proposer was contacted or assisted; active worker 100 was not inspected. Audit notes are confined to `/private/tmp`.

## Finding

`source_fourth_finalM94` proves the actual raw fourth-lower-diagonal inequality for every actual predecessor denominator `c≥5` and natural run length `n`, whenever the starting index satisfies

```
3n+7 ≤ j ≤ 4n+5.
```

There is **no independent lower-bound assumption on n**. The displayed interval is empty at `n=0,1`, and need not be empty from `n=2` onward. Adding `n≥7` would understate this final theorem. The extended tail uses `n+k≥7`; the third-block proof uses `7≤k≤n`. Neither retains a candidate-formula, gap, chamber, polygon or nonzero-coefficient premise after assembly.

The backward coefficient extraction is proved from an exact polynomial identity with degree bounds, and is connected to the actual source. The two residual equivalences preserve their stated guards and endpoints. The full conjecture and both residual obligations remain unproved. No substantive English/Lean mathematical mismatch was found in the inspected accepted source. Validation wording concerning rejected modules requires the version/draft qualification below.

## Exact coefficient convention and new coverage

For `rest : List Bool`, set `c=(frame rest).mid.b`, `r=(frame rest).mid.a`, and

```
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r.
```

Write `A(i,j)=coeff (frame path).mid.p i j`, the unchanged raw integer coefficient in the established squared-variable numerator convention with the third variable set to one. The final theorem quantifies natural `i,j` and assumes `i+j+2=a+4`. Its conclusion is

```
A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2.
```

The ordered `(1,-1)` triple is `((i+2,j),(i+1,j+1),(i,j+2))`, with all points on total degree `a+4`; it does not start at `(i,j)`. The theorem has no polygon, positivity, nonzero support, finite upper bound on parameters, or unidentified-source premise. Weak inequalities keep zeros. It does not prove other slices or directions, all smaller predecessor cycles, or the entire fourth slice.

For `j≤4n`, the assembled proof uses `k=j-3n`, proves `j=3n+k`, and applies `source_fourth_thirdM94` with `7≤k≤n`. For `j>4n`, it uses `k=j-4n`, proves `n+k≥7` and `k≤5`, and applies `source_fourth_tailM94`. Natural subtraction is justified before these substitutions. The equality `j=4n` belongs to the first case, including its endpoint `k=n`; no join is missing.

The strengthened tail theorem alone applies at `j=4n+k`, `k≤5`, `n+k≥7`, rather than requiring `n≥7`. Its coefficient adapters cover `k≤7` under the same `n+k≥7` condition. Applying them to the three offsets `k,k+1,k+2` is justified explicitly. The inherited eight coefficient entries, zero entries and weak gap inequalities are reused without changing their scale or filtering support.

## Backward extraction: assumptions, reflection and source bridge

`backward_coeffM94` is a theorem over `ℤ[X]`. Given natural `m,j`, polynomials `P,L,H`,

```
(1-X)^8 P = L + X^m H,
natDegree L ≤ j+7,
natDegree H ≤ 15,
j ≤ m+7,
```

it identifies `P.coeff j` with

```
sum over 0≤k≤m+7-j of
  (reflect 15 H).coeff k * choose(7+(m+7-j-k), 7).
```

All subtractions inside the sum are natural, with bounds established by the finite range and `j≤m+7`. The degree of the nonzero factor `(1-X)^8` is eight. The proof first shows `natDegree P≤m+7`, handling `P=0` separately. It reflects the cleared identity at degree `m+15`; the factor reflects to itself because its exponent is even, while `X^m H` becomes `reflect 15 H`. For every contributing `k`, the reflected coefficient of `L` vanishes since its original index is at least `j+8`, above the given degree bound `j+7`. The inherited binomial coefficient-extraction theorem then supplies the finite convolution.

This is a polynomial argument, not division after evaluating at a number, and has no unstated condition such as `X≠1`, an invertible coefficient, a positive coefficient, or a nonzero `P` assumption. Reflection is padded to the specified degree; the required degree bounds are proved before multiplication/reflection rewrites.

`backward_coeff_generalM94` replaces the top degree 15 by `s+8`, the reflected degree by `m+s+8`, and the output coefficient bound by `j≤m+s`, for an arbitrary natural `s`. It has exactly the corresponding polynomial-identity and degree hypotheses. This is a general extraction interface, not an additional source inequality or a proof for the remaining blocks.

The source theorem `source_fourth_backwardM94` uses the inherited exact natural-count fourth numerator with `P=24` times the actual source cut, `m=4n`, and the corrected highest block

```
H4 + 96(1-X)^8 * fourthCountCorrectionFA X c r.
```

The lower-block degree bounds are 12,12,13,14. The new `correctedH4_degreeM94` proves degree at most 15 for all natural input counts, including every branch of the correction. Consequently the actual-source bridge holds for every natural run length, `c≥5`, `i+j=a+4`, and `3n+7≤j≤4n+7`, and identifies **24 times the raw coefficient** with the reflected-block convolution. All degree and source-identity premises of the generic extraction theorem are discharged here.

The natural quantities `2r-c`, `min(c-r,3r-c)` and `3r-2c`, together with their correction, are retained exactly until the accepted strict chamber identities are used. They are not globally replaced by signed subtraction. The bridge does not assume the desired coefficient formula as a hypothesis.

## Six source chambers and gap certificates

Both the strengthened tail and third-block assembly use the same six strict chambers

```
(0,1/4), (1/4,1/3), (1/3,1/2),
(1/2,2/3), (2/3,3/4), (3/4,1)
```

for `r/c`. `frame_reduced rest` supplies `0<r<c` and coprimality. The five internal equality boundaries are explicitly ruled out by `reduced_chamber_boundary897` under `c≥5`: a reduced denominator at least five cannot equal a fraction whose denominator is at most four. Ordered cases therefore cover every actual predecessor in scope, rather than assuming it lies away from attainable boundaries.

Each `source_fourth_backward_coeff*M94` specializes the corrected source convolution to its chamber's explicit integer polynomial `backShape`, with

```
7560 A(i,j) = backShape(c,r,4n-j)
```

for `3n+7≤j≤4n+4` and `i+j=a+4`. The common scale is `7560=24·315`. The scalar convolution theorem is proved for convolution index at least three, which explains the coefficient adapter's upper bound `4n+4`. The third-block inequality only uses starts `j≤4n`; its three coefficients reach at most `4n+2`, so this restriction is discharged rather than omitted.

The adjacent shape arguments are the **integers** `e,e-1,e-2` with `e=n-k≥0`. At `k=n`, `e=0`, and the other two arguments are negative integers; they are not truncated natural values, and no `e≥2` condition is imposed. The algebraic inequalities include this endpoint.

For each chamber, the `ColumnsGap` source proves the exact shape expansions in the nonnegative Farey coordinates and `e`. The gap is assembled coefficient by coefficient through degree 14. There are fifteen gap-column identities and fifteen nonnegativity theorems per chamber; the columns of degrees 13 and 14 are explicitly proved zero. The final proof uses all columns and the nonnegativity of `e`. Thus the earlier failed staged assemblies do not leave out leading terms in the accepted proof. The source adapters construct the Farey coordinates from actual strict chamber inequalities, prove they are nonnegative, apply the universal gap, and cancel the uniform positive scale at all three positions. There is no fitted count, experimental positivity premise or position-dependent normalization.

The 260 named theorem declarations include these many polynomial identities, zero-column lemmas, nonnegativity lemmas and adapters. They are not 260 new independent source regions.

## Exact residuals and endpoints

`FinalFourthRegionM94` requires precisely the actual source decomposition, `c≥5`, `3n+7≤j≤4n+5`, and `i+j+2=a+4`. It has no independent `n≥4` or `n≥7` guard. `InteriorCore63M94` starts from the previously checked `InteriorCore63M806`; horizontal and vertical clauses are unchanged. The diagonal clause keeps all three original polygon conditions, inherited degree/numerator bounds, slope disjunction and exclusion of the proved initial region, adding only exclusion of the final region.

`root_iff_coreM94 : Conjecture63 ↔ InteriorCore63M94` supplies each excluded final-region inequality using `source_fourth_finalM94`. It does not prove its residual. Although it starts from the earlier prefix residual rather than worker 98's residual, the new final region includes the old tail range (`n≥7`, `j=4n+k`, `k≤5`), so the prior tail coverage is retained.

Separately, `run_fourth_iff_middleM94` assumes **`n≥4` and actual `c≥5`**. `RunFourthLCM94` quantifies all natural raw triples on this source fourth slice with the original three polygon conditions. `RunFourthMiddleM94` adds exactly `2n<j<3n+7`. The reverse proof fills `j≤2n` from the inherited prefix, `j≥3n+7` from the new final interval, and leaves the middle to the residual hypothesis. The inherited `source_fourth_polygon_boundM96`, applied to the first endpoint `(i,j+2)`, supplies `j≤4n+5`. Both interval boundaries are handled by proved regions. This is an equivalence of polygon-guarded obligations, not a claim that the middle inequality holds. Other directions and source cases remain in the full root.

## Finite input-domain recount, without research execution

Both saved experiment input lists and index filters were independently recounted using only standard-library integer/index arithmetic. No polynomial values, proof code, experiment imports or assertions were rerun.

| Saved experiment | Exact inputs | Coefficient checks | Three-guard polygon triples | Literal recurrence checks |
| --- | --- | ---: | ---: | ---: |
| Strengthened tail | All reduced `5≤c≤25`, runs `0,1,2,3,4,5,6,7,8,17,37`, plus six specified run-111 cases; 2,140 inputs | 11,688 | 5,169 | 3,480 across 975 inputs |
| Backward block | All reduced `5≤c≤17`, runs `7,8,12,24`; 360 inputs | 3,150 | 2,430 | 38 across 11 inputs |
| Sum of checks | Input ranges can overlap | 14,838 | 7,599 | 3,518 |

The tail coefficient offsets are 0–7 with `n+k≥7`; adjacent starts are 0–5 with the same filter. Literal comparisons impose `b≤100` and a nonnegative first coordinate. The six run-111 inputs use `(c,r)=(5,1),(5,2),(5,3),(5,4),(11,2),(11,9)`.

The backward coefficient indices run from `3n+7` through `4n+2`; triple starts run through `4n`; literal comparisons impose `b≤55`. Its polynomial arguments include `4n-j=-1,-2` for the two final coefficient positions, consistent with the integer convention above. These index counts exactly match the saved records and both saved failure lists are empty.

The saved coefficient-value zero counts are 3,015 in the tail experiment and zero in the backward experiment. Those values were not independently recomputed. The tail experiment reuses earlier chart data with its scale conversion, and the backward experiment evaluates its saved candidate shapes against exact cut/literal computations; neither is execution of the Lean statements. The combined totals count checks, not distinct inputs or a universal proof.

## Retained validation and historical boundaries

The supporting retained-validation and method audits provide source, object, snapshot, event, archive and controller comparisons. Completed checks find 205 controller artifacts and 204 indexed files matching current/archive bytes. There are 35 accepted mathematical modules with 260 named theorem declarations, 298 definitions and 260 directly printed permitted theorem closures; Audit is compiled separately. All 35 mathematical modules are explicit targets of one successful union replay. The permitted closures use only subsets of `propext`, `Classical.choice` and `Quot.sound`.

The 45 ordinary builds comprise 36 successes (35 mathematical modules plus Audit), seven errors and two timeouts. Twelve excluded drafts are `BackwardGap0–5` and `BackwardStagedGap0–5`, with no final object files. Five were attempted: two Gap timeouts and three StagedGap errors. Four other errors are older versions of ultimately accepted modules. Accordingly the prose “no rejected module is imported” is accurate only as “no rejected draft or source version is imported”; an accepted module name can have an earlier failed version. This is a provenance wording qualification, not a missing proof.

The single union receipt is `kernel-union-1792084138071324000.json`, SHA-256 `9f221081d1aeed9c5edacb8d785226acddb8b46b9998ac1570e4195b0583f250`. It records return code zero, `replay union passed`, duration 94.926157 seconds and a matching completed event 255. Its receipt filename timestamp is `17:08:58.071324 UTC`; this is not a separately logged exact kernel-return time. Every selected matching build precedes the estimated union interval. There are zero direct replays or skipped checks; the ordinary builds plus union total 46 actual Lean invocations. All 35 mathematical targets are replayed; Audit is compiled-only, not an additional replay target.

The unchanged drivers have hashes `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470` (`ReplayKnown6d2c`) and `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` (`ReplayBatch07F1`). Request-specific wrappers match the preceding worker after request-ID substitution. The inspected static base contains 755 local modules, with no selected target, selected-name collision, duplicate explicit selected name, cycle or excluded draft. Exactly 18 accepted worker-98 modules are imported-only; the other thirteen are absent. These imports are not additional worker-99 replay targets.

This is alternate kernel replay over inherited compiled imports, not official CLI replay, a fresh whole-source rebuild, or root completion. Selected sources are hashed before launch and require matching successful builds; driver hashing is after return. Exact loaded object bytes/times are not frozen or recorded at invocation. Final object bindings and static source imports do not independently establish binary import tables or private/generated declaration inventories. Imports remain trusted; the replay's treatment of axioms, unsafe/partial declarations, duplicate names and matching imported theorems retains the qualifications in the method audit. The inspected source/import/name checks expose no selected-target shortcut. No missing validation was executed by this audit.

The single finalizer succeeds at event 258, writing a 203-entry map. The recorded `final-check.json` count of 203 existing artifacts excludes that file itself; completed event 260 adds its hash and rechecks the full 204-entry map and 205 protected inputs. This is not a missing entry or inconsistent count. All 205 preservation and 196 initial reconciliation comparisons match; these sets overlap. All 191 original worker-98 artifacts match before/current/controller/archive bytes and retain their history.

On `2026-10-15`, the final artifact index mtime is `17:10:15.648286 UTC`, 125.973197 seconds before the deadline. The controller finishes at `17:10:54.941927 UTC`, elapsed 1713.320444 seconds, 86.679556 seconds before its deadline. The final JSON message at event 261, controller `final.json` and controller report agree; event 262 records turn completion. No late, pending or unarchived worker-99 artifact was found. Operational completion is `completed`; mathematical completion remains null.

Supporting notes and digests:

- `markov_worker_000099_validation_audit.md`: `2758c4f13a60881546b53bd13ba878a7e5959668440f3c9dc6819a4546bbacfa`.
- `markov_worker_000099_validation_evidence.json`: `99141942d3be613d93a35b6151ab58f373437362f87d9825fb65a9e20e03d6a9`.
- `markov_worker_000099_replay_method.md`: `16975a86261ba8f5c1c4f9fb0e327af043a99bc12066084ce732266017d31fd3`.
- `markov_worker_000099_replay_method_evidence.json`: `5a69457df157b7252198734b797c3ec2b39593e8b9b36e38d410316dac31fda1`.

The delegated audit rehashed all 1,562 combined inputs unchanged at `2026-10-15T17:28:57.219338+00:00`. Binary/imported-environment qualifications remain explicit rather than being promoted to a fresh proof-tree audit.

## Mathematical source anchors

| Final source | SHA-256 |
| --- | --- |
| `research/MarkovFourthFinalM94.lean` | `7bfb45e62e66285f0a99f4ed2e444d215bc0020fa18a90d4504397807d95a235` |
| `research/MarkovFourthMiddleM94.lean` | `ad8ac02e34b23a7c8b9a71421fbd8c17c0f59b393c2380b96e241cf2d13aefe4` |
| `research/MarkovResidualM94.lean` | `2a25c2ecba3d4ae717998f8ced24e257a985a8fa6a0a9343e93aa7722582a10b` |
| `research/MarkovBackwardExtractM94.lean` | `e03dbedb2c05d8d98de3744b777373365ecd71d8dc7a3704970e9f687b9f159f` |
| `research/MarkovBackwardGeneralM94.lean` | `e2df02e32ccee9b18a735c22632c055b03a0fe5792c8c24e057d9e7b3dbfccff` |
| `research/MarkovBackwardSourceM94.lean` | `dfb71dbeeb549a14d65e2c71c2f02a086cdcf39f2a3679f01be273418cece7cb` |
| `research/MarkovTailAllM94.lean` | `59d95d39f8b25848d244ac3dae738fc892ec3e1883a02f6804b7b0730df51701` |
| `research/MarkovTailExtractM94.lean` | `32e39161c6e3f807a9827a68ed97998053c21447da4ebc7b875cc53ff4cdf696` |
| `research/MarkovFullDegree4M94.lean` | `baad1ec66cd1da2813a248075918b2e5d680e85d71de9d13c153c3b1b1d44298` |
| `research/MarkovBackwardColumnsGap0M94.lean` | `88864c211667b396892721f086d72ed9b119f9de1d17dd06bbbcfaf2fe3d231c` |
| `research/MarkovBackwardColumnsGap5M94.lean` | `d5c4b18b28755e04452076aa5c604efebdb8091e64397913d840c6e59a03d5dc` |

No literature novelty claim or fresh full paper/Lean correspondence certification is made. This is a scoped audit of the completed worker's mathematical progress relative to the retained proof state.
