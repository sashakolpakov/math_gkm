# Worker 000077 independent mathematical monitoring audit

Completed observation: request `8bbb934ec26943b7821334f3647f77cf`, controller outcome **timeout**. Audit date: 2026-10-15.

This review inspected the retained English accounts, final accepted Lean sources, optional drafts, experiment scripts and saved outputs, controller events, and validation bindings. No project files were edited; no Lean build, replay or mathematical experiment was rerun; no research guidance was supplied; no active successor was inspected or contacted. The independent notes are outside the project.

**Finding:** the retained accepted results genuinely extend unconditional third-lower-diagonal raw log-concavity to every source with `3a≤2b`. A universal two-block correction also completes the exact third-cut polynomial identity for every mixed source and every run length. These claims have matching recorded successful compilation and alternate-driver replay. The optional uniform-interior identities/inequalities are not accepted results. The finalizer completed and its artifacts are retained despite the controller timeout and missing final response. The full conjecture remains unresolved.

## Main raw source inequality

Let `a/b` be the reduced index of `(frame path).mid`, and write `A(i,j)` for its ordinary numerator coefficient, using the pinned squared-variable convention with the third variable specialized to one. `source_third_lower_twoThirds8BBB` states, for every finite path and natural `i,j`,

```
3*a ≤ 2*b
i+j+2 = a+3
(i,j+2), (i+1,j+1), (i+2,j) each satisfy the original InPolygon predicate
⇒ A(i,j+2)*A(i+2,j) ≤ A(i+1,j+1)^2.
```

This is direction `(1,-1)` at total degree `a+3`, the third **lower** diagonal. It is not the third upper diagonal. The statement has no finite denominator restriction, positivity filter, synthetic support condition, or unproved source formula/moment/chamber premise. The three original polygon conditions remain explicit. Applicable boundary cases and zero coefficients are included.

The proof splits a path at its first false letter. In the mixed case, write it as `replicate n true ++ false::rest`, with predecessor index `r/c`. Its index is `(cn+r)/(c(n+1)+r)`, with `0<r<c`. The actual slope condition forces `n≤1`. The `n=0` case invokes the previous unconditional low-slope result; `n=1` invokes the new all-index theorem `source_third_one8BBB`. The pure repeated-right cases allowed by the slope bound have no applicable polygon triple at total degree `a+3`, as proved by their upper-degree bound. The equality boundary `a/b=2/3` is not accidentally omitted.

For `n=1,c≥4`, four exact gauged-matrix formulas and their jets identify the source coefficient sequence with `thirdOneSeq8BBB`. The resulting nine-term sequence represents **six times** the raw coefficients; this is a constant scalar, not an index-dependent normalization. The inherited source chamber theorem supplies all chamber hypotheses from the actual reduced predecessor. Each of the four chamber modules proves seven explicit polynomial gap identities by `ring`, their nonnegativity by `positivity`, and the remaining natural-index inequalities by the zero tail. Thus the sequence result is all-index and the source adapter has no remaining coefficient-identification assumption.

For the exceptional predecessor pairs `(c,r)=(2,1),(3,1),(3,2)`, the resulting run-one sources are `3/5`, `4/7`, and `5/8`. Their corrected scaled coefficient lists are proved to be

```
[24,132,300,360,240,84,12]
[120,636,1392,1614,1056,384,72,6]
[210,1200,2904,3864,3072,1488,432,72,6].
```

The small-case module proves each adjacent inequality and its infinite zero tail; reducedness exhausts the possible `c<4` cases. `source_third_one8BBB` therefore covers every `true::false::rest` without polygon guards, on the specified total degree. The final all-path theorem retains the original guards required by the conjecture.

## Strict expansion and exact residual equivalence

Worker 76 covered `2a≤b`; this round additionally covers the band `b<2a` and `3a≤2b`. The gain is not entirely an overlap with earlier upper or lower boundaries. For scope accounting, the admissible label `6/11` and points `(4,5),(5,4),(6,3)` lie in the original polygon, have total degree `a+3=9`, and have upper-boundary distance seven. They satisfy the previous residual's diagonal premises and were retained there because `b<2a`; the new theorem removes them. This is a strict reduction of the tracked remaining domain, not a claim of publication novelty.

`root_iff_interior8BBB` proves `Conjecture63 ↔ Interior638BBB`. It does **not** prove the residual proposition. Its horizontal and vertical clauses are unchanged from worker 76. Its diagonal clause retains all three polygon guards and the prior bounds

```
i+j+5 ≤ a+b-1
a+3 ≤ i+j+2,
```

and restricts the remaining obligation by

```
a+4 ≤ i+j+2  OR  2*b < 3*a.
```

If this disjunction fails, the previous lower-degree premise forces total degree `a+3`, and `3a≤2b` holds; the new unconditional source theorem supplies that case. The reverse implication therefore uses an actual proved result, not an assumed formula or the new residual itself. The exact inherited equivalence preserves all three root directions and both exceptional endpoint clauses. No new audit of rational-path surjectivity or the complete homogeneous Laurent bridge is claimed here.

## Universal two-block correction and all-cycle identity

Put `F=firstRunPolyADB2 n c r`, `T=thirdRunPolyADB2 n c r`, and `b=c(n+1)+r` for the resulting mixed-source denominator. The new theorem `source_third_run_poly_two8BBB`, for every natural `n` and every actual predecessor of denominator two, proves

```
6 * actual third-cut polynomial = T - 12*X^b*(F+1+X).
```

The proof uses the exact determinant of each gauged run block and its constant projection. The second determinant coefficient supplies the needed jet identity; the generic two-block cubic moment then yields the correction. The product of the first upper-left coefficients is identified with the actual `X^b`, and the first trace coefficient with `F+1+X`. Actual source cut/trace and first/second-slice bridges discharge the source identification. It is not extrapolation from the finite small-cycle scan.

`correctedThirdRun8BBB` combines that correction with the inherited `+6*X^b` correction for `c=3` and zero correction for `c≥4`. Since an actual reduced predecessor has `c≥2`, `source_third_all_cycles8BBB` proves the identity for every `n` and every `rest`. Its raw extraction theorem states, for all natural `i,j` with the actual total degree `i+j=a+3`,

```
6*A(i,j) = coefficient j of correctedThirdRun8BBB n c r.
```

This includes zeros and has no polygon or denominator restriction. The represented paths are precisely of the mixed form `replicate n true ++ false::rest`; pure repeated-right paths are not asserted to have this representation. The final slope theorem handles them separately where required.

`correctedThird_coeff_below8BBB` proves for all natural parameters that the small-cycle corrections do not affect coefficient `j` when `j<c(n+1)+r`. This is an exact support identity, without an inequality premise.

For arbitrary `n`, the accepted transfer `source_third_all_cycles_of_lc8BBB` still assumes all-index coefficient log-concavity of the corrected parameter polynomial. The universal formula is consequently **not** an unconditional log-concavity proof for the remaining slopes above `2/3`. A complete exact polynomial identity and a simple closed interior-coefficient formula are different claims; only the former has been proved here for arbitrary run length.

## Unaccepted uniform-interior work

The retained `MarkovThirdInteriorShape8BBB.lean` and `MarkovThirdInteriorFast8BBB.lean` attempt an abstract inequality for an interpolated polynomial with integer parameters `1≤r<c`, `5≤j`, `j+1≤n`. Their attempted certificates substitute `j=t+5`, `n=t+s+6`, `r=u+1`, `c=u+v+2` and contain a reported 1,176 nonnegative monomials. Their final sources have no successful recorded build/replay in worker 77. One earlier shape build failed, two shape builds timed out at 120 and 180 seconds, and the fast alternative timed out at 120 seconds. They are correctly excluded from the accepted inventory.

`MarkovThirdInteriorTransfer8BBB.lean` is an uncompiled draft importing the unaccepted fast module. It defines `ThirdInteriorFormula8BBB` as the unproved assertion that the interpolant equals fifteen times the actual parameter-polynomial coefficient for `4≤j≤n`. The proposed transfer keeps that assertion as an explicit hypothesis. It is neither an axiom nor a proved source-identification theorem, and even its conditional theorem is not an accepted compiled result of this round. No later accepted worker-77 receipt upgrades these drafts.

The initial interpolation attempt included center `j=4`, whose left neighbor is the exceptional coefficient at index three. Saved nonzero high finite differences reject that interpolation. The corrected finite computations do not prove a universal degree bound or source formula. The final English accounts make these limitations explicit and do not claim the failed attempts as mathematical progress.

## Finite evidence and its domain

The primary experiment records 236 distinct reduced source indices, 6,644 literal raw positions, 6,992 backward-cut positions, and 2,595 polygon-valid triples. Its domain is the union of small predecessor cycles `c=2,3` with `n=0,…,18` and run-one source indices through denominator 60. The saved source labels, unique record count, position counts and nonnegative stored gaps agree with the prescribed loops. Some small-cycle tests have slope above `2/3`; those are finite evidence, not additional proved source coverage.

The corrected uniform interpolation uses four chambers. Each records 42 nonzero Newton-basis cells, no negative stored entries, and seven additional symbolic comparisons, giving 28 extra checks. The interpolation grid has `s=0,…,7`, `t=0,…,11`, with proposed outer differences checked for vanishing. Another saved boundary check tests `j=n`, `n=4,…,30`, at six specified predecessor pairs, giving 162 comparisons. The separate shape interpolation stores five further parameter comparisons and the 1,176-term proposed gap expression. None of this establishes the unproved source formula or the timed-out Lean inequality. These scripts and retained data were inspected; none was rerun.

## Validation, timeout boundary and archive scope

The companion [validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000077_validation_audit.md) records the full binding checks. All fourteen accepted mathematical modules and the final axiom-audit module have selected successful builds and alternate-driver replays: **30 selected successful receipts**. The **66 named accepted theorem declarations** exactly match the inventory and individual printed permitted axiom closures.

There are 46 actual validation receipts: the 30 selected successes, three extra successful audit records, ten failed builds, and three timed-out builds. The extra successes comprise an older audit build/replay and a premature replay of the current audit. That premature replay was started before the final audit build finished and is not relied upon: the selected final audit replay starts at event 264 after the final audit build completes at event 262, and succeeds at event 267. Accepted final mathematical sources have matching passing checks; failed or timed-out drafts are not promoted by the audit module's success.

All **155 manifest entries**, plus the two self-manifests, agree across live bytes, archive bytes and controller after-hashes: **157 controller artifacts**. All **135 preservation rows** agree. The finalizer succeeds at event 271 with exit code zero, and there are no unmatched started events. Its manifests and validation reports therefore survived as complete retained artifacts, even though no final response or `turn.completed` event exists.

The controller starts at **06:06:45.812366 UTC**, has deadline **06:36:45.812366 UTC**, and records finish at **06:36:49.135398 UTC**, outcome **timeout**, elapsed approximately **1803.323 seconds**. The latest validation completes approximately 26.115 seconds before the deadline. The last activity record, at **06:36:45.599133 UTC**, reports the exact byte length of the entire retained event stream, including successful finalization; its recorded file modification time is earlier still. These records support retention of the completed validation/finalizer effects before the timeout boundary; individual events lack wall-clock timestamps, so the finalizer's precise execution time is unavailable. No post-timeout proof result is needed to support the accepted claims. Controller return code zero does not override its timeout classification; `mathematical_resolution` is false and report/completion are absent.

`ReplayKnown6d2c.lean` is unchanged at SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The accepted checks are the previously audited alternate-driver per-module kernel replay, with imported compiled environments reused. They are not official `leanchecker` CLI receipts or a fresh whole-source rebuild. Sources are bound to invocation snapshots; objects are bound by final manifest/archive/controller agreement and chronology, rather than an invocation-time object digest. This independent audit performed no replay.

## Final source versions

All entries below match the retained worker-77 source archive. Accepted entries also match their selected successful source-build and replay bindings.

| Accepted mathematical module | SHA-256 |
|---|---|
| `MarkovInterior8BBB` | `fbaac81a2cc2ebf0f294c63c259107737df77b031dc1f5bb99aab783b156cd87` |
| `MarkovThirdAllCycles8BBB` | `50863b0c2c0e6b715dcdf6b82b8a4524d7fc31042b82f2a93d37dccfda01991e` |
| `MarkovThirdCorrectionSupport8BBB` | `e6dabe1e42432910356c0d98d9c85102fa988f448a8e0c97b84346b86a8f2b28` |
| `MarkovThirdOneBridge8BBB` | `dfaa4bd89c3628f9ec2974e7be2a582c6b73866015739fefa4dcc7d1aed3f27d` |
| `MarkovThirdOneHigh8BBB` | `d12eeb7de93dd8bacb00bf66268f8883cebd6530bdd4af5de9c6e4758f68abee` |
| `MarkovThirdOneJets8BBB` | `d810a20fd7973f61bbd29556d42c9ebf5a43fed626c609d88659426a37624310` |
| `MarkovThirdOneLarge8BBB` | `ebf35ccc3135f7397f03bce1b07a1478c8f41440e204694828ee2da3dc680094` |
| `MarkovThirdOneLow8BBB` | `b91b5bb61b8d9ac11c63d496286cc1185358f7a3375804f73bc881419d2c734a` |
| `MarkovThirdOneMidHigh8BBB` | `a6d9195aabb9386fea18fcf28f289a903fa7f37ba951b1cd76844895a2ef3b98` |
| `MarkovThirdOneMidLow8BBB` | `5fee3a9c60e6f8e35adf758f3131c9cb37b162144120719b930175b5bcc9e6eb` |
| `MarkovThirdOneSeq8BBB` | `f6df7157f63818893a76ad1badf5755e1e5ad2ba9d85795df7e192bdeac77c2f` |
| `MarkovThirdOneSmall8BBB` | `7bc106276590bc9ac29d2471f34b749ab43792e41504ec7c40794a2888744cf4` |
| `MarkovThirdTwoThirds8BBB` | `41b80c30da5a1bb01817456b8f3cc1769e93c7dffc8087357e823f3559c5aebd` |
| `MarkovTwoRunCorrection8BBB` | `0d20064776ef310a1916b00c1f09775153835802a656e392fb31a632684363a7` |

The final audit source hash is `99188e34930d5e12708af685c5bf0863d9e0077f4600c6e7564ca141d9860f52`. The excluded drafts are frozen as follows; archive preservation is not proof acceptance:

- `MarkovThirdInteriorShape8BBB`: `f62e868b50ff5b5f0a79ad1c4f3553c17be91361ce2936b96257b3a507d1dcf2`.
- `MarkovThirdInteriorFast8BBB`: `ee17697ddb270153970bde9876542b7cdfefcf0016d8de10caddd91570046042`.
- `MarkovThirdInteriorTransfer8BBB`: `197cae5876d658ae90f308303b77e61612ed9903461c71b8a33925e7e623abf5`.

No English/Lean mathematical-scope discrepancy was found in the accepted results. The remaining high-slope inequalities, other residual slices and horizontal/vertical obligations remain open.
