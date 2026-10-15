# Independent mathematical audit: worker 000098

Request `06b5b1f918814d79ba331dcc5c327605`. This audit inspected completed-worker source, prose, finite-experiment input domains and retained validation evidence in `/Users/sasha/math_gkm`. It did not run Lean, replay, finalizers, experiments or research code, repair any proof, change the project, contact the proposer, or inspect active worker 99. Only audit notes and evidence were written under `/private/tmp`.

## Finding

The retained final theorem proves a new, unconditional raw-coefficient log-concavity range on the fourth lower diagonal: starts `j = 4n + k`, `0 ≤ k ≤ 5`, for every actual mixed source path with run length `n ≥ 7` and predecessor denominator `c ≥ 5`. Its chamber and coefficient-formula hypotheses are discharged. There is no denominator, numerator, run-length or path-length upper cutoff, and zero coefficients are not discarded. The exact residual equivalence removes only this proved range. Neither the residual nor the full conjecture is proved.

All six full numerator chamber identities and source coefficient adapters are also completed. They are identities, not universal inequalities. The final source correspondence and mathematical prose agree with these distinctions. No substantive English/Lean mismatch was found in the inspected results.

## Exact raw theorem and index convention

Let `rest : List Bool`, `c = (frame rest).mid.b`, `r = (frame rest).mid.a`, and

```
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r.
```

Write `A(i,j) = coeff (frame path).mid.p i j`. These are the original integer numerator coefficients in the established squared-variable convention, with the third variable set to one. The only normalization used in the new coefficient proof is the uniform factor 24.

`source_fourth_tailM06` assumes precisely `n ≥ 7`, `c ≥ 5`, natural `i,k`, `k ≤ 5`, and `i + (4*n+k) + 2 = a+4`. It concludes

```
A(i,4n+k+2) * A(i+2,4n+k) ≤ A(i+1,4n+k+1)^2.
```

Thus, writing `j=4n+k`, the ordered triple along direction `(1,-1)` is

```
(i+2,j), (i+1,j+1), (i,j+2).
```

It is not a triple beginning at `(i,j)`. Each of its points has total degree `a+4`. The coefficient formulas extend through offset 7 because the adjacent-triple starts extend through offset 5. The final theorem has no polygon, positive-support, nonzero-coefficient, candidate-formula, auxiliary-gap or chamber premise. It therefore includes its polygon-valid instances and retains all naturally indexed zero cases. The smallest permitted run `n=7` and the end offsets are included. This does not prove other directions, other diagonals, runs below seven, or arbitrary source paths outside the displayed representation.

## Exhaustive chambers and natural-count boundaries

The six strict predecessor-ratio chambers are

| Chamber | Range for `r/c` |
| --- | --- |
| 0 | `(0,1/4)` |
| 1 | `(1/4,1/3)` |
| 2 | `(1/3,1/2)` |
| 3 | `(1/2,2/3)` |
| 4 | `(2/3,3/4)` |
| 5 | `(3/4,1)` |

`frame_reduced rest` supplies `0<r<c` and coprimality. The inherited `reduced_chamber_boundary897` is applied explicitly at `(4,1)`, `(3,1)`, `(2,1)`, `(3,2)`, `(4,3)`, excluding `4r=c`, `3r=c`, `2r=c`, `3r=2c`, `4r=3c` when `c≥5`. Its reason is divisibility: an equality and coprimality would force `c` to divide a positive number at most four. The final theorem then exhausts the strict chambers by ordered cases. Equality cases have not been silently removed from the actual source family; they are impossible under its proved invariants. This exhaustion should not be restated for arbitrary unreduced numerical pairs.

The natural quantities are `q=2*r-c`, `t=min (c-r) (3*r-c)`, and `u=3*r-2*c`, where subtraction is natural subtraction. The new chamber adapters prove the required cast and minimum identities before using signed polynomial expressions. In the six chambers the substitutions are respectively

| Chamber | `q` | `t` | `u` | Extra fourth-block correction |
| --- | --- | --- | --- | --- |
| 0 | `0` | `0` | `0` | `0` |
| 1 | `0` | `0` | `0` | `(4r-c) X^5` |
| 2 | `0` | `3r-c` | `0` | `(c-2r) X^5` |
| 3 | `2r-c` | `c-r` | `0` | `2(2r-c) X^6` |
| 4 | `2r-c` | `c-r` | `3r-2c` | `2(c-r) X^6` |
| 5 | `2r-c` | `c-r` | `3r-2c` | `2(c-r) X^6 + (4r-3c) X^7` |

These signed expressions are valid under the corresponding strict chamber inequalities. No global replacement of truncated subtraction by signed subtraction occurs.

Each `fourthNumerator_chamber*M06` is a generic commutative-ring identity under its strict natural-count chamber assumptions. Each associated `source_fourth_chamber*_clearedM06` binds it to an actual predecessor with `c≥5`, for every natural run length, including zero. Its coefficient corollary adds `i+j=a+4` and yields the exact finite binomial coefficient sum with uniform factor 24. The new adapters for all six chambers are accepted targets. The old worker 97 chamber 0/1 scalar identities are reused; the old failed chamber 2–5 and source-adapter drafts are not retroactively accepted.

## Why the final tail proof is unconditional

Four polynomial degree lemmas bound the lower blocks `H0,H1,H2,H3` by 12,12,13,14, respectively, for all natural input counts. Each of the six fourth-block identities supplies an explicit polynomial `R` and remainder `L` such that

```
H4 = (1-X)^8 R + L,   natDegree L ≤ 7.
```

The actual `H4` includes the proved natural-count correction. The source-cleared identity uses `P` equal to 24 times the actual source cut and has the form

```
(1-X)^8 P = H0 + X^n H1 + X^(2n) H2 + X^(3n) H3 + X^(4n) H4.
```

`tail_coeff_of_clearedM06` is an integer-polynomial lemma: if `(1-X)^8 (P-X^m R)=L` and `natDegree L≤m+7`, then `P.coeff(m+k)=R.coeff k` for every natural `k`. The zero difference polynomial is handled separately; otherwise degree addition with the nonzero degree-eight factor forces degree below `m`. This is not pointwise division and does not require an evaluation condition such as `X≠1`.

`tail_coeff_four_blocksM06` applies this at `m=4n` using `n≥7`. The conditional helper `source_fourth_tail_of_splitM06` still displays its fourth-block splitting and remainder-degree premises. The six final source-chamber theorems supply those premises with proved polynomial identities and degree bounds. No such premise remains in `source_fourth_tailM06`.

The explicit tail polynomial has eight coefficient entries. Each accepted source formula identifies `24*A(i,4n+k)` with its chamber sequence for `k≤7` and `i+4n+k=a+4`. Each sequence theorem proves all six weak adjacent inequalities for `k≤5`. The nonnegative polynomial-gap certificates use the two Farey coordinates of the corresponding strict chamber. For adjacent endpoints `p/q<s/t`, these coordinates satisfy

```
c=q(C+1)+t(R+1), r=p(C+1)+s(R+1),
C=s*c-t*r-1 ≥ 0, R=q*r-p*c-1 ≥ 0.
```

Strict chamber inequalities and the adjacent determinant identity discharge these coordinate requirements. The common factor `24²` cancels in the raw inequality. Some explicit coefficient and gap polynomials are zero; neither the proof nor the theorem imposes strict positivity. No position-dependent rescaling or factorial weighting is used.

The separate `source_fourth_full_lc_iffM06` is correctly conditional in its conclusion: for actual predecessors `c≥5`, arbitrary natural run length, and the raw triple total-degree equation, it equates raw log-concavity with log-concavity of the full binomial-sum values. It proves both directions of this equivalence, not the right-hand inequality for every parameter.

## Exact residual and remaining obligations

`TailFourthRegionM06 path i j` requires exactly the actual path decomposition, `n≥7`, `c≥5`, `j=4n+k`, `k≤5`, and `i+j+2=a+4`. `InteriorCore63M06` retains the preceding horizontal and vertical obligations unchanged. Its diagonal clause retains all three original polygon guards, the inherited total-degree/numerator bounds, the inherited slope disjunction and `¬InitialFourthRegionM806`; it adds only `¬TailFourthRegionM06`.

`root_iff_coreM06 : Conjecture63 ↔ InteriorCore63M06` starts from the previous exact equivalence. The reverse direction fills an omitted tail instance using `source_fourth_tailM06`, otherwise invokes the new residual. There is no shifted boundary, hidden source-identification premise or weakening of the root in this step. Existing endpoint and other-direction handling is inherited rather than newly established. The new residual itself remains unproved, as do the complete root and its negation. The remaining middle shifted blocks, low runs outside the existing prefix, smaller predecessor cases not already covered, other diagonals and axial interiors are not closed by worker 98.

## Finite evidence, separately from proof

The saved experiment has 782 exact input pairs of predecessor and run: all coprime `1≤r<c`, `5≤c≤25`, at runs 7,8,17,37, plus run 111 at `(c,r)=(5,1),(5,2),(5,3),(5,4),(11,2),(11,9)`. Independent input/index-domain counting reproduces:

- 6,256 coefficient comparisons: eight offsets, 0–7, per input;
- 3,519 triples satisfying all three original polygon conditions;
- 544 literal-recurrence coefficient comparisons across 68 inputs, after the saved `b≤100` and natural-index conditions.

The saved 1,173 zero values are an experimental coefficient-value count, not independently recomputed by this audit. The experiment reuses worker 96 tail chart values divided by 315 to change its old scale 7,560 to 24; it does not execute the new Lean polynomial definitions. The saved failure list is empty. The mathematical values and assertions were not rerun. These finite checks are distinct from the universal source identities and inequalities above.

## Retained validation and provenance

The supporting validation and method audits are separate files alongside this note. Completed binding checks establish matching current/archive/controller bytes for 191 artifacts and matching values for the 190-file index. The accepted inventory has 31 mathematical modules, 155 named theorem declarations and 121 definitions; the theorem count includes helpers and identities, not 155 independent conjecture results. All 31 are explicit targets of the successful union replay. The axiom-audit module is compiled separately and prints the 155 matching permitted closures; it is not another mathematical replay target.

The single successful union receipt is `kernel-union-1792082364080084000.json`, with elapsed time about 84.929 seconds. There are 32 successful builds, comprising the mathematical modules and Audit, and 17 rejected builds. The inspected method is unchanged: `ReplayBatch07F1` hash `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, `ReplayKnown6d2c` hash `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The inspected static source base has 735 modules and contains no selected target or selected explicit name. All 49 accepted worker 97 modules are imported-only here; worker 98 does not freshly replay them or alter their historical timeout/finalization record.

This is alternate kernel replay over inherited imports, not official CLI replay, a fresh whole-source rebuild, or a full English/paper completion certificate. Selected sources are hashed before launch and require matching successful builds; exact loaded object bytes and times are not frozen at invocation. Static source graphs do not independently establish binary import tables or generated/private declaration inventories. Imported proofs are trusted; the standard replay's axioms, unsafe/partial and matching-imported-theorem behavior remains qualified in the method report. No selected source token or inspected import/name graph shows an admission or target-contamination route. The retained successful axiom closures use only the permitted standard axioms.

All 49 ordinary builds have matching completed events: 32 final successes and 17 failed earlier source versions. There are no skipped checks, timeouts, excluded new sources, direct replays or superseded successful builds. Together with the union there are 50 actual Lean invocations; this is not 31 individual replay runs. The union completes at retained event 270. Successful event summaries use output lengths, while the complete output is retained in the hash-bound receipt.

Finalization succeeds at events 272 and 278, expanding the artifact index from 189 to 190 after documentation and operational updates; event 280 separately rehashes all 190 entries. All 411 preservation and 402 initial reconciliation comparisons match, with overlap between those sets. All 397 worker-97 archive/controller artifacts are unchanged, so that worker's timeout/null-report outcome and excluded drafts retain their historical status.

The final index mtime is `2026-10-15 16:41:13.104361 UTC`, 276.522466 seconds before the controller deadline. Worker 98 completes at `16:41:55.563916 UTC`, after 1565.937091 seconds, 234.062911 seconds before its deadline. The final JSON message at event 281 matches controller `final.json` and the controller report; event 282 records turn completion. No late, unarchived or pending artifact was found. The completed operational outcome does not claim mathematical root completion, which remains null.

Supporting reports and hashes:

- `markov_worker_000098_validation_audit.md`: `635c5f2baf408693792d6ad469356fc7738e244886833e18582cad09f0c4df5c`.
- `markov_worker_000098_validation_evidence.json`: `d0a35ddbbbe20211ed4c9174f118dee73cc4e5cb8a700ded9569ae51d4afbae5`.
- `markov_worker_000098_replay_method.md`: `034f66649d22a750d8e4c2c65a30b8014286ca2513ca3c97cd3d26f1c60eb5b3`.
- `markov_worker_000098_replay_method_evidence.json`: `a8a50382f40ba90c400202c5e9bd83760e039cbe0599c5c8768cf6daaf051da2`.

The delegated audit rehashed all 1,895 combined inputs unchanged at `2026-10-15T17:00:11.790558+00:00`. Its binary/imported-object qualifications remain as stated above; no missing check was supplied by this audit.

## Source anchors

The following inspected final sources anchor the mathematical conclusions:

| Source | SHA-256 |
| --- | --- |
| `research/MarkovTailAllM06.lean` | `3d1c84d16572f352d1456f1f17bfe7ea88700fa14001cae15f250768c0105f57` |
| `research/MarkovResidualM06.lean` | `212676511083d4737169a0ce91dd28f32540ea7be0fb2fa48e9eb06b6bf5dfff` |
| `research/MarkovTailExtractM06.lean` | `a1dd0d57ed8bb2c5705b34152d1fd0694be8e06ab66cb692892f900ce1420dca` |
| `research/MarkovFullTailSourceM06.lean` | `77327fe141d2350e0c3567c22d8be09275243664d63c4cfa4fb257d81097f956` |
| `research/MarkovFullCoefficientLCM06.lean` | `28342d971c241918f94c0c0040df0c6b9ffdcd70b95b6fec94d5a18b5e95c325` |
| `research/MarkovFullSourceChamber0M06.lean` | `220007c2a57d16e8edfd9b8d7fa6083c94c9032d44e7047d35cecc154d271997` |
| `research/MarkovFullSourceChamber2M06.lean` | `e2cf0e318286b154c67f6e31b6de1251f4828c7cdaf9b1e98932f6fd8e9b6ce9` |
| `research/MarkovFullSourceChamber5M06.lean` | `d7551d6c6625927d71d3a5441a4c57dee7ce3629d2bd383dd4894230127dbcc1` |

No literature novelty claim is made. The finding is a precisely scoped improvement relative to the retained earlier proof state.
