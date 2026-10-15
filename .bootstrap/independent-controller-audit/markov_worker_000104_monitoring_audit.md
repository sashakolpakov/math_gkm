# Independent mathematical audit: worker 000104

Request `5dc9c88dfee041f18445d13ddd622849`. Read-only review of this completed worker's archived mathematical sources, English descriptions, finite experiment domains and retained validation in `/Users/sasha/math_gkm`. No Lean, proof, replay, retry, finalizer or research experiment was executed. No project file was changed, no proposer contacted or assisted, and active worker 105 was not inspected. Historical recovery is credited to worker 104 alone.

## Finding and exact gain

The predecessor-`r=1` central inequality now has an accepted actual-source proof, following successful recovery of the abstract gap assembly left compiled-only by worker 103. Its own declaration has **no `n≥7` hypothesis**: it assumes actual `c≥5,r=1`, natural indices and `2n+6≤j≤3n`, so its first nonempty run case is `n=6`. The assembled upper interval and exact five-start run reduction additionally require `n≥7`.

The new three-block extraction and corrected canonical source identity are exact formulas for unrestricted actual predecessor numerator. They extend the coefficient description to lower indices using the reflected `H2` contribution, which is explicitly zero above its cutoff. Seven onset coefficient positions have an exact source adapter. These identities do not prove their five onset inequalities or a general predecessor middle inequality.

The root residual equivalence removes only the newly proved predecessor-`r=1` middle region and preserves previous regions, axial duties and original polygon guards. The residual itself and the full conjecture remain unproved. No substantive English/Lean mismatch was found in the accepted statements; the weaker `n≥7` headline for the central inequality should not obscure the slightly stronger declaration actually proved.

## Source and raw index convention

For actual `rest : List Bool`, put

```
c = (frame rest).mid.b,  r = (frame rest).mid.a,
path = List.replicate n true ++ false :: rest,
a = (frame path).mid.a = n*c+r,
b = (frame path).mid.b = (n+1)*c+r,
A(i,j) = coeff (frame path).mid.p i j.
```

The coefficients are the original raw integer numerator coefficients in the established squared-variable representation, with the third variable one. A coefficient identity on the fourth lower slice assumes `i+j=a+4`. Its direction `(1,-1)` log-concavity triple instead assumes **`i+j+2=a+4`** and is

```
((i+2,j),(i+1,j+1),(i,j+2)),
A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2.
```

It does not start at `(i,j)`. Natural zero coefficients and endpoints remain included. No source theorem introduces a positive-support filter or nonzero coefficient premise.

The condition `r=1` refers to the **predecessor numerator**. The final source numerator is `a=nc+1`; this is not the previously solved whole-source family `a=1`.

## Generic three-block extraction

`backward_three_coeffM5DC` concerns arbitrary integer polynomials `P,H0,...,H4`, natural `n,j`, and the explicit assumptions

```
(1-X)^8 P = H0 + X^n H1 + X^(2n) H2 + X^(3n) H3 + X^(4n) H4,
natDegree H0,H1 ≤ 12,  natDegree H2 ≤ 13,
natDegree H3 ≤ 14,  natDegree H4 ≤ 15,
n+5 ≤ j ≤ 4n+7.
```

Writing `conv` for the established convolution with the coefficients of `(1-X)^(-8)`, it proves

```
P[j] = conv(reflect 15 H4,4n+7-j)
     + if j≤3n+6 then conv(reflect 14 H3,3n+6-j) else 0
     + if j≤2n+5 then conv(reflect 13 H2,2n+5-j) else 0.
```

The proof uses the inherited five-block reflection identity. The lower bound proves that the two earlier shifted reflected blocks contribute zero. The remaining shifts use explicit guards before natural subtraction; an absent block is not represented by an unguarded truncated index that would keep a spurious constant coefficient. The allegedly contradictory branch where `j≤2n+5` but `j>3n+6` is discharged arithmetically. There is no restriction to nonzero `P` or nonzero evaluation points, and no division by a value of `(1-X)^8` at a chosen point.

This is a generic conditional polynomial theorem. Its actual-source instantiation is proved separately, rather than assuming the five-block identity or degree bounds for a candidate source.

## Actual source instantiation and corrected central formula

`source_fourth_backward_threeM5DC` proves the same expression equals `24*A(i,j)` for every natural `n`, actual predecessor `c≥5`, natural `i,j` with `i+j=a+4`, and **`n+5≤j≤4n+7`**. It obtains the cleared numerator identity and all degree bounds from the established source lemmas.

The substituted pattern counts remain natural counts:

```
q = (2r-c : ℕ),
t = min (c-r) (3r-c),
u = (3r-2c : ℕ).
```

Their subtraction is truncated natural subtraction, not an unchecked replacement by signed arithmetic. The highest block retains the inherited term `96*(1-X)^8*fourthCountCorrectionFA`; it is included in the degree check and reflection, rather than omitted for an exceptional predecessor.

`middleCorrectionM5DC(n,c,r,j)` is defined for natural arguments as

```
5040 * (if j≤2n+5
        then conv(reflect 13 H2,2n+5-j)
        else 0),
```

with the actual natural counts above in `H2`. `middleCorrection_zeroM5DC` proves it is zero for all natural `n,c,r,j` with `j≥2n+6`, independent of source membership.

The six chamber adapters and their assembled `source_fourth_middle_correctedM5DC` prove

```
120960*A(i,j) = middleRawValueM722(n,c,r,j)
                + middleCorrectionM5DC(n,c,r,j)
```

for actual `c≥5`, **every natural n**, `i+j=a+4`, and **`n+5≤j≤3n+3`**. The range is empty for `n=0`. It is an extension of the earlier exact range `2n+6≤j≤3n+3`, not evidence that the earlier theorem was wrong there: the newly necessary term vanishes on that old range.

All six strict predecessor chambers are discharged using source coprimality and `c≥5`. Each proof uses the actual three-block source identity, the existing highest-block reflection and the penultimate-block convolution. In particular `j≤3n+3` establishes the convolution index needed by the falling-factorial identity, and the guarded natural indices are reconciled with integer expressions before use. The two canonical shapes still select by `2r<c`, with equality excluded for these actual predecessors. There is no fitted coefficient premise, denominator nonvanishing hypothesis, or assumed gap inequality.

The scales `24`, `5040` and `120960=24·5040` are constants. The formulas do not replace raw coefficients with factorial-, binomial- or position-weighted coefficients. This expanded identity alone establishes no log-concavity for arbitrary predecessors below or above the old cutoff.

## Explicit `H2` corrections and seven coefficient positions

`h2_reflectM5DC` proves an exact identity for all integer `n,c,r,q,t,u`: the reflection at degree 13 equals an explicitly defined degree-at-most-10 polynomial in `X` depending only on `n,c,r,q`. Independence from `t,u` is a proved polynomial identity, not an empirical simplification.

The five `h2_conv[k]` theorems evaluate `5040` times its convolution at indices `4,3,2,1,0`. The five `middleCorrection_onset[k]` theorems then specialize the natural correction at `j=2n+k`, `k=1,...,5`, with the exact cast `((2r-c : ℕ) : ℤ)`. These identities apply to all natural `n,c,r`; they do not assume source membership or prove positivity.

`source_fourth_second_onset_valueM5DC` connects the explicit piecewise function `secondOnsetValueM5DC` to actual raw coefficients at **all seven positions `2n+k`, `1≤k≤7`**, for `n≥7,c≥5` and `i+2n+k=a+4`. It proves equality with `120960*A(i,2n+k)`. At offsets 1 through 5 it uses the explicit correction polynomials; at 6 and 7 the correction is proved zero. The defaults in the function definition are not a source-coefficient theorem outside the explicitly proved range.

These seven values supply the positions of five adjacent triples, but their identities are not those five log-concavity inequalities. The saved twenty symbolic gap candidates remain outside the accepted Lean theorem set.

## Predecessor-`r=1` inequality and exact residuals

`middleRawValue_one_lcM5DC` is first an integer-polynomial statement: for integer `n,c,j`, `c≥5` and `2n+6≤j≤3n`, the three canonical values are log-concave. It substitutes `C=c-5`, `J=j-2n-6`, `E=3n-j`, proves these are nonnegative, and invokes the recovered `middle_low_directM722` theorem. It also proves the parameter equalities and the correct low-shape branch.

`source_fourth_middle_oneM5DC` transfers that result to the actual raw triple for natural `n,i,j`, actual `c≥5,r=1`, `i+j+2=a+4` and **`2n+6≤j≤3n`**. The three coefficient identities have their required ranges and degree equalities discharged at the separate indices. The same positive scale `120960` is canceled at all three positions without assuming individual coefficients positive. No remaining gap or source-formula hypothesis appears. The range entails `n≥6`; `n≥7` is not a declaration premise.

`source_fourth_upper_oneM5DC` adds `n≥7` and combines this middle inequality with the inherited all-predecessor final interval to cover **`2n+6≤j≤4n+5`** for actual `c≥5,r=1`.

For `n≥7,c≥5,r=1`, `run_fourth_iff_five_oneM5DC` is an exact equivalence between the complete polygon-guarded fourth-slice claim and **`2n<j≤2n+5`**. All three original polygon guards and `i+j+2=a+4` remain. The reverse direction uses the inherited prefix for `j≤2n`, the new upper theorem for `j≥2n+6`, and the residual at precisely the five remaining starts. The required upper bound `j≤4n+5` is derived from the actual source polygon lemma and its hypotheses, not imposed on arbitrary unguarded triples. The residual itself is not proved.

`MiddleFourthOneRegionM5DC` records the actual path decomposition, `c≥5,r=1`, `2n+6≤j≤3n` and the degree equality. It has **no `n≥7` condition**, matching the stronger source middle theorem and correctly allowing its `n=6` case. `root_iff_core_oneM5DC` rewrites the previously accepted exact root equivalence, keeps all axial and existing diagonal guards/exclusions, and adds only exclusion of this proved region. All other predecessor numerators, small runs/cycles, higher slices and residual axial obligations remain as applicable. Endpoint obligations remain accounted for by the inherited exact equivalence. Neither root nor residual is asserted as proved.

## Partial general algebra and excluded drafts

Two individual general low-chart gap coefficients compiled and replayed: their four theorem declarations give exact coefficient identities and nonnegativity for `J,E≥0`. They are the constant and linear-`R` coefficients at `C^0` of the corresponding expanded gap. They do not prove the full gap polynomial or a general actual-source inequality.

The general grouped layouts, upper-extreme grouped proof and their source assemblies failed to complete within their stated limits. They are excluded; candidate source presence is not acceptance. The final selected nine mathematical modules are all replayed, with no accepted new mathematical module left compiled-only. The many excluded generated drafts and the earlier experimental selection list are not substituted for the final source-bound validation list.

## Finite and symbolic evidence

The completed fast experiment uses `5≤c≤19`, reduced `1≤r<c`, and `n∈{6,7,13,23}`. Independent input/index enumeration, without executing research coefficient or proof code, matches every saved input and all counts:

- 456 source parameter cases;
- 4,674 central coefficient positions `2n+6≤j≤3n+3`;
- 18,126 three-block coefficient positions `n+5≤j≤4n+7`;
- 3,306 polygon-valid middle triples and 2,280 polygon-valid onset triples;
- 534 literal recurrence comparisons over 24 cases with `b≤60`.

Thus the reported totals are 22,800 coefficient comparisons and 5,586 triples, not that many distinct source polynomials. The saved zero count is zero in the tested central loop; it was not independently recomputed and does not restrict the formal theorem's zero cases.

A separate larger experiment was interrupted. Its retained checkpoint reports only a completed 100-case prefix, including 1,200 central and 4,500 three-block positions, 900 middle and 500 onset triples, and 1,716 literal comparisons. Its intended larger domain was not completed; overlapping partial counts must not be added to the completed fast experiment as independent coverage.

The twenty onset candidates comprise five starts in each of four predecessor charts, with `n=N+7`. The saved general-chart gaps each have 585 terms and the extreme-chart gaps 117, with no negative coefficients reported. Twenty exact symbolic correction comparisons are reported passed. These are generated symbolic data, not checked Lean gap/positivity proofs or proofs of the five remaining source inequalities. The recorded unsuccessful reflection search is limited to `n↦n+h`, `r↦c-r`, `j↦5n+q-j`, `h=-2,...,2`, `q=-10,...,20`; it does not exclude arbitrary representations or symmetries.

No finite or symbolic experiment was rerun for this audit.

## Retained validation and historical recovery

The final scope is nine new mathematical modules containing 31 named theorems and 24 definitions, all successfully compiled and union-replayed. The unchanged inherited `middle_low_directM722` has a successful individual replay and axiom closure in worker 104, adding the 32nd distinct closure. The recovered proof is attributed here, without rewriting worker 103's compiled-only/timeout history. The two new Audit modules were compiled; compiling them is not a replay of their imported mathematics.

All 255 controller/current/archive artifacts and all 253 indexed artifacts match. Final source snapshots and object hashes agree with their selected records. Of 152 new Lean sources, nine are accepted mathematics, two are Audit sources and 141 are excluded unbuilt mathematical drafts, distinct from any earlier worker's unfinished sources. There is no accepted new compiled-only mathematical module.

The retained actual Lean invocations comprise 20 builds (eleven successes, six timeouts and three SIGINT return-code `-2` outcomes), one successful inherited direct replay, and five successful unions, for 26 invocations. Two prototypes passed unchanged-source retries after timeouts; the other rejected module names remain excluded. The interrupted batch's outer exit code 130 does not reclassify its three already recorded initial timeouts as interruptions. These are operational failures, not counterexamples.

All accepted checks and the two successful axiom audits precede the successful finalizer at event 224. Event 226 checks the 253 indexed hashes and replay/axiom flags; final report 227 matches `final.json` and the controller report, followed by turn completion 228. The final-check mtime is `19:25:51.430593Z`; the controller finishes successfully at `19:26:32.157230Z`, before its `19:27:50.670732Z` deadline, after 1721.486498117447 seconds. No pending command, unarchived extra or post-deadline artifact was found. All 406 worker 103 artifacts remain unchanged; 398 reconciliation entries and 411 preservation entries match. Those overlapping counts are not additive. `completion` remains null and `mathematical_resolution` false.

The two Audit builds print 52 rows representing 32 distinct directly checked axiom closures, all limited to the permitted standard axioms. The nine new mathematical modules are explicit targets in five disjoint replay groups of sizes 2, 2, 3, 1 and 1. Their static imported bases contain 222, 588, 883, 575 and 576 local modules; LowDirect's base contains 15. No selected target, excluded new draft or unreplayed old Gap3 module appears in these successful source-level bases. Each new module imported by a later replay group already has its own earlier successful replay.

The replay drivers are unchanged, but the new union wrapper removes the prior matching-successful-build precondition, uses a 240-second limit and takes its environment from the validator. Independent retained-record inspection still verifies a matching successful final-source build before every accepted replay. Import lookup ordering also changes: the optimized configuration puts package/toolchain paths before older evidence, keeping current evidence first. The early LowDirect call cannot be assigned that final configuration from the retained file-creation timing. These qualifications do not show a failed check; they limit reconstruction of the exact loaded binary environment.

The replay evidence remains alternate selected-module kernel checking relative to inherited compiled imports. It is not an official CLI claim, fresh whole-source rebuild or proof of the full conjecture. Static source import graphs and final object hashes do not establish exact invocation-time loaded binary bytes or generated/private import inventories.

## Selected source anchors

- `MarkovBackwardThreeM5DC.lean`: `adfad50e152f78e91d3ccdd11ee0b83501dab993d9e285c9e0644c9a957bd65c`.
- `MarkovBackwardThreeSourceM5DC.lean`: `ab146d3a4bbb639840fc80aa54609ab2b618574fab7d695a24b0458f85b7cae9`.
- `MarkovMiddleCorrectedM5DC.lean`: `f56d2fd349f4b9463cd8087af2878201e3f0dfce3bef9d0fff7115f53199210e`.
- `MarkovH2CorrectionM5DC.lean`: `fd3e42d4ced1c46a93c249cc800178d4e811148509650ed2f53123c48fce4d16`.
- `MarkovSecondOnsetSourceM5DC.lean`: `27f540ff5ee09e54b8e04da1b168a7c2de0e0b726e9d882ab79c413deb398d9a`.
- `MarkovMiddleOneM5DC.lean`: `f20d7871fa427648bc7c3580b4b55828092ae8b24c7f3bcef573af832922dd99`.
- `MarkovResidualAssemblyM5DC.lean`: `1a24491feee0faededa60f8b62c1d921b6b79f38b8fbdab8f38d89740e8c5451`.
- Completed `fast-experiments.json`: `e328fe31ac358505b3e183b69e03a58fd0de3fe8198ea65e85d1b9f583d53ca4`.

These identify the audited versions, not extra proof executions. Full root closure and a source-family completion audit remain separate obligations.

## Supporting records

The completed independent validation and replay-method reports are saved beside this note:

- `markov_worker_000104_validation_audit.md`, SHA-256 `238cd9c8212b4bbda1cce3aa910aab1d2973aa734f4fb04244e82eb8f73d6312`.
- `markov_worker_000104_validation_evidence.json`, SHA-256 `470d8c7a06a375d7fc66e619d6985b59514eba008a5997cd5dc201fb01715aab`.
- `markov_worker_000104_replay_method.md`, SHA-256 `98e34abdf8656761c28fb8f94ee06683d2be4260df8f431ca03c22df64474d50`.
- `markov_worker_000104_replay_method_evidence.json`, SHA-256 `4bf45416f51ea3a886154bb16f556299ad2a45e4b59a6931fbbe4ac91d780114`.

All 1,357 directly recorded supporting inputs were stable at `2026-10-15T19:33:55.378561Z`. No missing validation, mathematical proof or finalization was completed by this audit.
