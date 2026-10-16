# Independent static monitoring audit — worker 000161

Request `ae9e841e98884e419ff8cadb546d21cc`. Closed archive: `/Users/sasha/math_gkm/.control/markov/workers/000161`. The controller records **completed**, return code zero, a delivered structured report, elapsed `1758.6361207962036` seconds, and no mathematical completion. Active162 is excluded. Earlier audit seals, failed attempts and observation windows remain final.

## Finding and exact limits

The accepted inventory is **25 mathematical modules, 66 theorem closures and 21 definitions**. The final saved compilation, joint replay and explicit axiom-print coverage match that inventory. The round proves a new positive finite transform for every lower-row coefficient of a numerator-three source, exact output interval support, rational polynomial representations, and additional unconditional raw LC strips:

| Direction | Starting index/column | Row condition |
| --- | --- | --- |
| H: `(i,j),(i+1,j),(i+2,j)` | `4≤i≤6` | `j≤q` |
| V: `(i,j),(i,j+1),(i,j+2)` | `6≤i≤8` | `j+2≤q` |
| D: `(i,j+2),(i+1,j+1),(i+2,j)` | `4≤i≤6` | `j+2≤q` |

These apply to every actual source `3/(3q+1)` and `3/(3q+2)`, `q≥1`, with all written natural-index zero and small-parameter cases retained. The source-path adapter is explicit. The exact new reduction is

`Conjecture63 ↔ ThreeRemainingMAE9 ∧ OtherFourM9E2`.

**Both residual propositions remain unproved.** No complete numerator-three direction or full conjecture is established. The universal transform's LC, the new correction-row/crossing sign candidates and the Laurent-transform route remain unproved. The auxiliary midpoint obstruction is formally distinguished from an actual polygon-valid raw source triple that passes LC.

An unused generated `MarkovColumn0MAE9` has two theorem declarations and one definition but no compiler receipt, object, selected replay or closure print; it receives no new proof credit. Worker 160's separate KernelLimit candidate retains its two historical timeouts and remains outside the current proof graph. Reconciliation does not repair old 212 or that candidate.

The auditor ran only audit-owned static parsing, hashing, literal/inventory comparisons and input-index/domain counts. No project program, Lean/compiler/proof/checker/replay/finalizer/experiment/generator or mathematical-value computation was executed. No coefficient, binomial, recurrence, polynomial identity, gap or sign was recomputed. No project/source/machinery changes, proposer contact, research advice or active-source reading occurred. All new audit files are under `/private/tmp/math_gkm_godel_20261013`.

## Closure observation and source conventions

Before closure, this auditor read only the exact named receipt. It was absent at UTC `22:16:30.304482`, `22:17:44.747044`, `22:19:08.051353` and `22:20:27.270815`, and was final at `22:21:40.793773` on October16. Checks were separated by at least sixty seconds; requested wait durations were at most sixty seconds. The first 60,000ms sleep reported 60.005 seconds elapsed, a small tool-overhead overrun; subsequent split waits were shorter. Mathematical review began only after that final receipt. Its SHA256 is `1a860b46f3df3208f82ea7fad797d5b4dcd247d1df3b7ebb46f2686d411c3010`.

The inherited exhaustive source classification supplies `q≥1`, `r : Bool`, `n=3q+1` for true and `n=3q+2` for false. `source_three_rawM9E2` identifies **every** natural coefficient of the actual generated path with `threeRawM9E2 q r i j`; it includes `3/4` and `3/5`. The new path theorem invokes this identity directly. Canonical finite examples do not replace the exhaustive classification.

The new lower-region bridge uses `j≤q`. It identifies the raw row with `lowerRow(n,j)=u³(1+u)^(n−2j−1)H_j(n)`, from the earlier accepted recurrence/source result. Its literal coefficients are integers. There is no coefficient normalization, interpolation premise or unproved source correspondence in the new strip conclusions. Generic formula statements may allow `q=0` under their written guards; actual-path coverage remains `q≥1`.

The natural slack is `d=n−2j−1`; actual lower rows satisfy `2j+1≤n` and, more strongly, `d≥j`. All natural-subtraction rewrites in source adapters are guarded. Lower-region columns `i<3` vanish, positive support is `3≤i` and `i+j≤n+2`, and larger columns vanish. These inherited/support facts retain zeros rather than deleting them from the target. The new H/V/D assertions themselves require no polygon filter or positivity premise.

The root remains the protected raw bivariate polynomial conjecture in the original three directions. Its original polygon inequalities are `ab≤bi+aj` and `i+j≤a+b−1`; endpoint sources, homogeneity/source conventions and all zero cases retain the earlier equivalence provenance. The new all-natural numerator-three residual is stronger in wording than a polygon-only subproblem, with equivalence supplied by inherited source/zero results. No replacement of the root or its denominator/source conditions occurs.

## Universal positive lift and exact support

For natural `d,j,t`, define

`L(j,t,m)=C(t+m+3,m)[C(t+j+3,t+m+3)+4C(t+j+4,t+m+5)]`.

`lower_row_liftMAE9` proves

`lowerRow(2j+1+d,j)[t+3]=Σ_(m=0..t) C(d,t−m)L(j,t,m)`.

The source adapter substitutes `d=n−2j−1` for every `j≤q`. The formula is uniform in all its natural parameters and includes natural binomial zeros. It is derived from the established positive lower-row formula: Vandermonde expands `C(d+s,t)`, a guarded choose-product identity transposes the product, and the inherited weighted finite-sum identity evaluates the inner sum after exchanging finite sums. There is no numerical interpolation or assumed generating-function formula in this proof.

The exact finite product identity is

`C(s,m)C(t+s+3,s)=C(t+m+3,m)C(t+s+3,t+m+3)`.

It holds at all natural `s,t,m`, so out-of-range binomials remain zero. Weighted summation uses the appropriate natural top/lower guards; it does not divide by a potentially zero coefficient. The overall factor four and integer weights from the inherited positive formula are preserved.

`liftOutput(d,j,t)` is the displayed finite sum. Define `reverseLift(j,t,r)=L(j,t,t−r)` when `r≤t`, and zero otherwise. `lift_output_reverseMAE9` rewrites the sum as `Σ_(r=0..t) C(d,r)reverseLift(j,t,r)`. It invokes Mathlib's `sum_range_reflect` at range length `t+1` and proves `r≤t` and `t−(t−r)=r` within the range. No signed-index extension is hidden in this definition.

The output is nonnegative for all natural parameters, strictly positive if `t≤d+j`, and exactly zero if `d+j<t`. The biconditional `0<liftOutput(d,j,t) ↔ t≤d+j` includes the endpoint and `j=0`. Positivity uses a strictly positive leading binomial product and nonnegative remainder; vanishing proves each binomial in the original positive formula is zero. With source slack this is precisely the support endpoint `i+j≤n+2` at `i=t+3`.

These are formula and support theorems. No adjacent LC, mixed-cross property or general LC preservation of this transform is proved. Positive sums and exact interval support alone do not establish the missing shape theorem.

## Polynomial certificates and literal raw strips

`lowColumnMAE9(n,x,t)` is the finite rational polynomial sum obtained by replacing each binomial in the lift by `choosePolyM0D3`. That inherited function evaluates a descending Pochhammer polynomial divided by `k!`; its natural-argument identity includes the `k>n` zero cases. The new source theorem proves

`(threeRaw(q,r,t+3,j):ℚ)=lowColumn(n,j,t)`

for all natural `t` and `j≤q`. The source slack and top parameters are natural and nonnegative, so the casts/subtractions are justified rather than treating arbitrary rational generalized binomials as natural ones.

The five accepted explicit modules specialize `t=1..5`, corresponding to raw columns4..8, with exact all-rational polynomial identities. Each proof unfolds the finite formula and inherited binomial table and uses `ring`. The source theorem then specializes the general bridge. The unused `t=0` generated module is unbuilt; the universal lift and older accepted column-three formula still retain their own coverage, independently of that unused candidate.

Nine gap modules each contain an exact rational identity and a separate nonnegativity theorem on `d,x≥0`. Their rational expressions have positive constant denominators and displayed factored nonnegative polynomial forms. The auditor inspected these saved expressions and proof structure but did not expand or evaluate them. Lean's retained `ring` and `positivity` compilation/replay provide the recorded proof evidence, not the Python generator's signs.

For H starting4 and5, the polynomial chart is `j=x+1`, `n=3j+1+d`; for H starting6 it is `j=x+2`, the same denominator chart. Source guards `j≤q` imply `n≥3j+1`; the nonsmall branch gives `x≥0`. The omitted rows are handled explicitly: `j=0` for starts4/5 and `j=0,1` for start6 use `three_small_horizontalMAE9`. That theorem maps the actual source to `threePathM9E2` and invokes the inherited universal raw H result for `j≤4`, including zeros and all starting columns. Thus a shifted certificate does not silently discard small rows.

For V and D the common chart is `j=x`, `n=3j+7+d`. The hypothesis `j+2≤q` gives `n≥3j+7`. All three coefficients lie within the lower-region source formula: row `j`, `j+1` and `j+2` are separately justified. V uses a fixed column6,7 or8. D uses `(i,j+2),(i+1,j+1),(i+2,j)` at start4,5 or6, so the index map is the original diagonal direction and total degree is `i+j+2`.

Source adapters rewrite the three raw coefficients into rational polynomials, use the exact gap identity plus nonnegativity, and return to integers via `exact_mod_cast`. The positive denominators are fixed scalars; no coefficient-dependent cancellation or nonzero assumption occurs. The formal raw conclusions are **weak** inequalities. No strictness theorem is inferred merely from the appearance of positive factors.

`lower_band_polygonMAE9` proves every point with `q≥3`, `3≤i≤8`, `j≤q` lies in the actual source polygon. Hence the new strips include unbounded genuine polygon-valid subfamilies. Smaller parameters remain in the raw inequalities even when some points are outside the polygon and coefficients vanish. Relative to the previously displayed residual, the new strips remove additional clauses; the round does not separately formalize a strict noncoverage witness against every older sufficient-criterion family.

## Exact residual and what remains open

`ThreeRemainingMAE9` quantifies all `q≥1`, both residues, and all natural starting `i,j`. It retains H obligations unless `j=5` or `3≤i≤6 ∧ j≤q`; V obligations unless `(i=3 or4) ∧ j+1≤q` or `5≤i≤8 ∧ j+2≤q`; D obligations unless `3≤i≤6 ∧ j+2≤q`.

The equivalence with `ThreeRemainingM468` splits precisely the newly discharged bands. Forward restriction uses the stronger residual antecedent; backward assembly invokes the three new band theorems and retains the old obligations elsewhere. `root_iff_remainingMAE9` then composes the earlier exact root reduction. The named path theorem supplies the denominator and all three new band assertions for every actual numerator-three path.

Correction rows, higher columns/rows, remaining V/D triples, all leading/tail zeros and sources of numerator at least four remain governed by the unchanged residual conjunction. `OtherFourM9E2` is not newly proved. The earlier full numerator-two theorem keeps its original history. The current work does not establish a uniform numerator-three lower-row shape, a complete numerator-three LC direction or the full root.

## First correction row and scaled kernel identities

The new polynomial bridge on row `q+1` requires **`q≥2`** and column `t+3`, `t≥0`. It equals `lowColumn(n,q+1,t)` plus `8C(q−2,t+1)` for the true family or `4C(q−1,t+1)` for false. This uses the inherited complete first-row correction theorem and checks `2(q+1)+1≤n` before using the lower-row polynomial identity.

The exceptional true family `q=1` has the inherited alternating correction `8(−1)^(i−2)` for `i≥2`; it is not replaced by a naturally truncated `q−2` parameter. The inherited complete row theorem still covers that case and columns0..2. The new formula does not claim those columns or `q=1` are covered by its narrower polynomial statement. Twenty later crossing-gap polynomial candidates have no accepted Lean LC theorem in this round; their saved positive-coefficient observations are not new source inequalities.

The final added module `LiftRatio` has three theorem closures and two definitions. For `m≤j`, it proves

`L(j,t,m)D(t,m)=C(j,m)C(t+j+3,j)W(j,t,m)`

where `D(t,m)=(t+m+4)(t+m+5)` and `W=D+4(j−m)(t+j+4)` over the rationals. The weight is positive under rational `0≤t`, `0≤m≤j`. The adjacent-m identity requires `m+1≤j` and combines the two scaled identities with the inherited choose step. It is multiplicative and avoids division by vanishing binomials. It is not a decreasing-ratio theorem or a uniform LC conclusion.

## Auxiliary obstruction and finite-only routes

The formal auxiliary midpoint values are `L(1,0,0)=8`, `L(1,2,1)=6`, `L(1,1,1)=5`, `L(1,1,0)=9`. The proved comparison is `45<48`, contradicting that particular sufficient midpoint assertion. Separately, the accepted source bridge proves the actual `3/4` row-one raw triple at columns3,4,5 is `[8,14,6]`, all three points satisfy the original polygon guards, and its raw LC inequality holds. An auxiliary summand failure is therefore not a root counterexample.

The Laurent extension permits negative auxiliary indices down to `t−j`, while the formal `reverseLift` uses natural indices and a guard. The saved generating representation, Q-polynomial gap signs, sequence-sign behavior and any preservation under truncation remain prose/finite observations. They are not imported universal lemmas. The general lower-row LC route remains open. Saved future-work suggestions were read only as completed provenance and are not developed or transmitted as advice.

## Finite domains and overlap

Only input-index ranges, list lengths and already-proved support/polygon domains were counted. Saved numerical outcomes were not recomputed.

The lift probe uses `j=0..20`, five labeled slacks `[0,1,j,2j,3j]`, and `t=0..d+j+2`: **2,646** comparisons from105 parameter occurrences but101 distinct parameter pairs because small-j labels overlap. Its midpoint probe uses `t=1..2j+3`, `r=0..t−1`, `s=0..t+1`: **177,856** comparisons, with only the first ten failures retained.

The truncated transform probe uses `j=0..20`, `t=1..2j+7`, `r₀=0..t`. Three arrays have length `t+2`, and their products have length `2t+3`, including zero padding:10,045 arrays and **509,551** coefficient comparisons. The separate symmetric-pair loop has 139,944 pairs and stores at most five failures. Empty finite coefficient-failure output does not prove the transform preserves LC for every parameter.

The shape probe uses `j=2..19`, three slacks `0,j,2j`, and `0≤s,k<j`:7,407 positions for each of the mixed-summand and raw-summand tests. These share the same parameter domain. Each saves at most five failures. **`shifted_pair_failures` is initialized but never tested or populated**; its empty list is not evidence that a third family passes.

The direct-source scan uses sixty actual sources, `q=1..30` and both residues, every `j=0..q`, and raw columns `t+3` for `t=0..n+1`: **62,985** lift comparisons, including11,900 positions outside the proved positive support. The six explicit columns `t=0..5` give **5,940** comparisons; finite testing of column0 does not compile that unused module. H uses starts4..6 on every row, V columns6..8 and D starts4..6 only when `j+2≤q`. Counts are2,970 H,2,610 V and2,610 D, totaling **8,190**. Of these,8,180 have all three polygon memberships and ten touch a zero tail; the scan does not filter them away. These domain counts agree with the saved zero/polygon counters without evaluating coefficients. Saved failure lists are empty.

The Laurent probe uses `j=0..30`, `t=1..2j+4`, with extension indices `r=t−j−1..t+1`. It has 1,054 parameter pairs,23,932 extension comparisons and42,594 Q-gap positions. The `v=2(t−j−1)..2t+2` domain gives 46,810 Laurent-gap positions and46,810 sign sequences; these use the same v-domain and are not independent source triples. Their saved sequence arrays have894,598 total input entries. Empty saved failure output remains finite.

The column generator computes seven symbolic columns internally, emits six (`t=0..5`), and records nine unshifted gaps. Literal emitted column expressions match the saved record; no polynomial was recomputed. The three unshifted H candidates contain saved negative core coefficients and are not the accepted shifted certificate expressions. The shift search records seven trials, selecting shifts1,1,2; exact small-row proof branches supply their omitted domains. Twenty correction/crossing candidates cover both residues times H starts4..6, V columns5..8 and D starts4..6 at `q=x+2`; their recorded zero negative counts do not establish crossing LC.

Five main probe stdout JSONs match full saved records at events 37,50,54,133,210. Event 83's leading JSON matches the shift record and is followed by text-search output. Events74 and154 print projections of the full column/correction records; only those projections are asserted equal. Nine gap arrays are hash-bound saved candidates. No separate one-off mathematical Python calculation was found in the reviewed closed completed-command inventory.

All nine new mathematical scripts are main-guarded. The actual polynomial helper is the inherited `column_five_4687d03f.py`, whose arithmetic functions are imported; its interpolation-based main is not called by this generator. The inherited lower-row/source helper chain is pinned. The two other inspected predecessor polynomial scripts are comparison-only. Main guards do not make every module import side-effect-free; constant dictionaries and imports still execute in the machine's recorded runs. The audit executes none of them. Named current/archive hashes do not authenticate a complete invocation-time interpreter or transitive input snapshot.

## Final source and validation inventory

Every accepted source agrees across archive/current/controller-after, final manifest, successful singleton build receipt and immutable source snapshot, final validation source map, final replay map and final axiom map. Every ordinary object agrees across archive/current/controller/manifest. Compiler receipts name output paths but do not themselves carry an authenticated output digest; later hash associations are described as such.

| Module suffix `MAE9` | Theorems | Definitions | Successful build ID |
| --- | ---: | ---: | --- |
| BinomialLift | 4 | 1 | `1792187951219109000` |
| Column1 | 2 | 1 | `1792188065826415000` |
| Column2 | 2 | 1 | `1792188067031698000` |
| Column3 | 2 | 1 | `1792188068256550000` |
| Column4 | 2 | 1 | `1792188148832147000` |
| Column5 | 2 | 1 | `1792188148832402000` |
| ColumnPolynomial | 1 | 1 | `1792188050375784000` |
| DiagonalGap1 | 2 | 1 | `1792188234319904000` |
| DiagonalGap2 | 2 | 1 | `1792188354770203000` |
| DiagonalGap3 | 2 | 1 | `1792188460373046000` |
| FirstCorrectionPolynomial | 3 | 0 | `1792188445307759000` |
| HorizontalGap1 | 2 | 1 | `1792188234319443000` |
| HorizontalGap2 | 2 | 1 | `1792188354769596000` |
| HorizontalGap3 | 2 | 1 | `1792188460379727000` |
| LiftObstruction | 4 | 0 | `1792188421775970000` |
| LiftRatio | 3 | 2 | `1792188934252642000` |
| LiftSupport | 6 | 2 | `1792188662580146000` |
| Residual | 7 | 1 | `1792188704407583000` |
| SmallHorizontal | 1 | 0 | `1792188148834298000` |
| SourceStrips1 | 3 | 0 | `1792188533016785000` |
| SourceStrips2 | 3 | 0 | `1792188533019787000` |
| SourceStrips3 | 3 | 0 | `1792188577327364000` |
| VerticalGap1 | 2 | 1 | `1792188234319845000` |
| VerticalGap2 | 2 | 1 | `1792188354770544000` |
| VerticalGap3 | 2 | 1 | `1792188460378825000` |

All25 successful mathematical snapshots are final bytes; no superseded successful mathematical version is counted. The 31 compiler attempts comprise25 mathematical successes, two operational Audit successes and four return-code-one failures. There is no current compiler or replay timeout. The rejected snapshots are BinomialLift `1792187902779936000`, ColumnPolynomial `1792188011983095000`, SourceStrips1 `1792188461609082000`, and Residual `1792188630590167000`. Their declaration inventories/imports and normalized statement headers agree with final versions; changed proof blocks concern multiplication association, a no-progress simp and interval-case bounds concealed in a conjunction. Their diagnostics and snapshots remain failure evidence.

New dependency builds precede dependent final builds. No same-module compiler interval overlap or completed same-source edit event within a retained build interval is observed. This is saved chronology, not an assertion that source reads were locked or every shell write authenticated. Compiler bounds are90/120/180/240 seconds by module; the method note lists them. Initial replay has300 seconds and final replay180 seconds; both succeed within bounds.

The first validation stage selects24 modules,63 theorems and19 definitions. Replay `1792188744268658000` succeeds after45.890026749985 seconds with82 explicit declarations, seven direct imports including Init and2,546 inherited local modules. Audit build `1792188744276170000`, closure record `1792188761311607000`, prints all 63 theorems. Initial validation/final-check/manifest/verifier bytes are copied to distinct `*-initial.json` files after LiftRatio is added.

The final stage adds exactly LiftRatio, bringing25 modules/66 theorems/21 definitions. Replay `1792189014330562000` succeeds after71.833678500028 seconds with87 explicit declarations, eight direct imports including Init and2,548 inherited local modules. Audit build `1792189014335746000`, closure record `1792189057314077000`, prints exactly 66 theorems. Both replay stdout records end `replay union passed`. Every printed theorem has exactly `propext, Classical.choice, Quot.sound`. There are129 printed rows across both stages but66 distinct theorem names. Definitions are replayed but not counted as theorem closures. The first 24 sources are unchanged between stages.

The replay driver, build wrapper and Audit wrapper are exact160 retags. Driver SHA is `838425ac206fb905a453f20ba8032a73f400509a290801a3bef579b91e07bd9f`; build wrapper SHA `0e4849fadcd9fa221d8a1f054e46b6f32389b2d0fcc98acc565867fe16a62d44`; Audit wrapper SHA `1ff4934f6a948f73248ee978324391c1f8805b18535026e973a7c22307d0a365`.

The driver collects selected module constants, removes selected modules from its inherited direct-import union, rejects guarded selected-name preimports and unsafe/partial selected declarations, then joins ordinary `env.replay` on that selected union. There is no selected-name collision or local import cycle. Compiler-generated names retain ordinary replay handling; host unsafe module APIs are operational and not extra mathematical axioms. It does not replay all inherited proof bodies.

Both Audit commands read the existing stage-specific module list, emit imports/print directives, compile with 180 second bounds, require successful returncode and permitted axiom sets, then record source maps. The audit independently matches exact printed names, raw stdout, source/snapshot/object and closure JSON. The wrapper names Lean4.32.2 and prepends current evidence to saved inherited LEAN_PATH. Source maps/snapshots precede subprocess execution; checker hash follows replay and axiom maps follow Audit. These facts do not authenticate invocation-start executable bytes, every live read, optional server/private module parts or fresh compilation of inherited libraries.

## Imported proof boundary and historical qualifications

The final named inherited direct imports are `MarkovBinomialTableM295`, `MarkovFirstRowM1BB`, `MarkovHorizontalFourAllM9E1`, `MarkovLowSourceME9C`, `MarkovPositiveSourceMDAB`, `MarkovResidualM468` and `MarkovMinimalShapeMDAB`; Init gives eight total. The initial stage lacks MinimalShape. Adjacent67c3 is transitive through the added branch, not the new direct import.

The accepted local closure has 2,573 modules:25 current and2,548 inherited. Adding unbuilt Column0 and two operational Audits gives 2,576nodes. The final branch adds inherited MinimalShapeMDAB and MinimalRatioMDAB to the initial 2,546base. The exact2,548pair expectations come from2,521 sealed 160 inherited pairs, five accepted 160 pairs, fourteen sealed 159 inherited pairs, six accepted 159 pairs and two accepted 157 pairs. There is no fallback from missing expectations to current object hashes. Current/source/controller-before pairs pass a separate hash observation at UTC22:24:23.932363–22:25:05.768964.

Every one of the25 accepted endpoints, and the descriptive unbuilt Column0 branch, imports all **212 worker 121 compiled-but-unreplayed modules**, their195 subset, the separate accepted19, and WindowLC6d34. None is a selected new compilation/replay target. **Zero old 212 modules are recovered.** Axiom dependency prints do not supply missing inherited-body replay. This differs from 160's standalone MinimalRatio endpoint, which avoided that backlog; LiftRatio here also imports the broad lift branch.

Window retains source SHA `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object SHA `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its old build printed only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; old checker stdout was empty. The old build lacked an object digest, and its object was outside the old initial snapshot. Later hash identities preserve the association without repairing original production authentication. Window is separate from old 212 and worker 156 recovery.

Seven worker 156 modules are inherited: LowDifference, LowForce, LowLC, LowSolutions, LowSource, LowerShape and LowerUniform ME9C. Their full twelve-module/44-closure recovery belongs to157. Worker 156's historical timeout/nullreport, twelve compiled/seven replayed/zero printed status is unchanged. All eight accepted 157 modules and all eleven accepted 158 modules now occur in this graph. This import membership is not new replay recovery.

Eight accepted 159 modules are imported: FiveDirections, FiveForce, FivePolynomial, FiveShape, FiveSource, Residual, RowCoeff and RowParameter M468. The four other159 modules are outside. Five160 modules are imported: DiagonalRows, MinimalRatio, MinimalShape, PositiveRows and PositiveSource MDAB; DifferencePositive and GapRoute are outside. The160 KernelLimit candidate remains outside, with both failed snapshots preserved and neither retroactively validated by the distinct new lift obstruction.

The old 134/135 recovery split remains explicit: failed HighCone2GapM81F is distinct from accepted MF25 replacement; unbuilt/failed old assemblies and excluded FallingGap/SourceFalling are not admitted. Corrected 145 scalar and 146/151 final accepted versions retain their sealed history. No 153 newaccepted/pending module is imported; pending 149EightNewton remains outside. Other historical import distinctions are listed in the method evidence. Reconciliation alone grants no validation upgrade.

The mathematical support compares274 named older sources,195 imported and79 comparison-only. Ten named external source/object pairs include the newly inspected finite-range reflection declaration; ten inherited script pins include seven actual helper-chain scripts and three comparison-only scripts. These identities do not establish a fresh whole-library rebuild, complete external transitive graph or independently authenticated imported source-to-object production. No source/body execution was performed by the audit.

## Finishing script and repaired stdout capture

The combined `finish_ae9e841e.py`, SHA `88a2293d78bdf333f3c17874c723df1145472e920568de5fc5f0a92ee0aacc11`, has no separate finalizer or prepare mode. It reads the existing selected list and selects successful source-matching singleton builds, exact-union replay and axiom source maps, and asserts permitted axiom sets. It does not itself require exact theorem-name inventory/count, raw Audit receipt/object linkage, replay success text or checker hash. Independent retained-record checks supply those associations here. It writes null mathematical completion and records STOP/failure count without requiring fixed values.

After full request/predecessor retagging, its only substantive change from 160 is stripping comments before the forbidden-token scan. Eighteen selected comments contain the word `axiom`; the simple nonnested regex removes those inspected comments. This regex is not a complete Lean lexer. The inspected mathematical sources contain no admission/unsafe/partial flags, and replay separately rejects unsafe/partial selected constants. No mathematical validation bypass follows from this operational comment-scan repair.

The first finish at events 211–212 records24 modules/63 closures,153 indexed artifacts,329,675,952 bytes and manifest SHA `2e549c8466fd9ac79bf942082476a7d68c49de5af1409108a2d09950306fadae`. Four initial aggregate files are copied at221–222. The original manifest bytes are retained. Five indexed paths later change: validation and final-check have exact initial copies; the earlier module-list/checkpoint/mathematics bytes have their earlier hashes but no separately retained byte copies. No selected mathematical source changes between accepted stages.

After final 25-module validation, the finish at234–235 redirects stdout to `finalization-output.json`. The shell creates/truncates that file before the manifest scan, then the finisher writes captured stdout after its own self-check. Its captured zero-mismatch summary therefore does not bind the capture's eventual bytes. It reports171 entries,330,137,967 bytes and intermediate manifest SHA `269c1aaa64ffa71adb75a6ea91a2d0f18ea9d6983b38a47b2388ae7c6249e5cf`; that intermediate manifest version is not separately archived.

Events236–237 detect exactly the capture mismatch and save `finalization-reconciliation.json`. A nonredirected final finish at238–239 scans the complete capture and reconciliation, producing **172 entries,330,144,149 bytes**, manifest SHA `ba0b8459afc9834c3173ef98b4d130cbd77b2ade85dd8c5eaa88f58691726220`, no mismatch. Its validation/final-check/verifier stdout matches retained final files. Postflight241–242 independently confirms172 entries and the verifier-to-manifest binding. Both capture and reconciliation are final-indexed. The repaired final result does not erase the earlier capture failure or prove that a finisher's scan remains valid after arbitrary later output writes.

The final archive/controller has174 artifacts. Exactly172are final-indexed; the final manifest and final verifier themselves are archive-only. There is no final manifest-only retention gap. The authored report draft differs from the delivered report in summary/actions/agenda/observations. Delivered event 243, controller report and final.json agree; event 244 is turn.completed. Null completion is explicit. Neither report upgrades unbuilt Column0 or160 KernelLimit.

## Preservation, timing and observation boundaries

The initial map has 6,691 entries, including192Python caches, and excludes evidence/ordinary objects. Two owned exclusions—setup and checkpoint—leave **6,689 unchanged inherited inputs**. The prior 160 manifest has83 entries, all retained and matching; its archive contains85 artifacts. Six fixed administrative bindings match. The controller-before inventory and worker source snapshot have different scopes; pycache/object coverage is not attributed to the wrong map.

The separately authored `docs/GKM.md`, `docs/GLUING.md` and `docs/RESEARCH_STATUS.md` now appear in 161's historical map. The validation reviewer performs only exact named byte hashes, which match before/current expectations; their contents are not interpreted and no docs-directory enumeration or edit occurs. README is absent from that map. Documentation publication is not mathematical validation or proposer guidance. Earlier content-preserving COW operations on retained older copies retain their already-recorded metadata qualification; no current proof/history upgrade is inferred from inode changes.

Controller start is `2026-10-16T21:51:23.851086Z`, nominal deadline `22:21:23.851086Z`, host finish `22:20:42.487206Z`. The finish precedes deadline by 41.3638801574707 seconds. Stored elapsed exceeds subtraction of the saved floating start/finish values by 0.95367431640625 microseconds; this rounding-scale difference does not change status.

Initial replay spans22:12:24.268658–22:13:10.158685, initial Audit22:12:24.276170–22:12:41.303351. Final replay spans22:16:54.330562–22:18:06.164241, final Audit22:16:54.335746–22:17:37.304461. Within each stage, Audit and replay overlap and both succeed; the stages are separated by the first finish and LiftRatio build. The second event-start order differs from the wrapper's receipt-start order. Filename epochs plus monotonic durations are estimates, not nanosecond authentication or exact source-read times.

The last mathematical build (LiftRatio) finishes at estimated22:16:22.813634. Current validation/final-check/manifest/verifier mtimes are22:19:08.745603,22:19:09.095648,22:19:09.445127 and22:19:09.724021. Archive copy mtimes are later near host finish. The 244-event log has 494,198 bytes and115 started items, all completed; log mtime22:19:47.024971 and final.json mtime22:19:48.065210 precede host finish/deadline. Saved activity byte accounting and stderr are separately checked. No current exact-request artifact after host finish/deadline has been observed in the bounded review.


## Final audit observation

Both independent companion reviewers completed their audit-files-only review of the main body, the three mathematical supports and the sealing helper. The only substantive wording refinement was to specify that Audit and replay overlap **within** each stage, while the two stages are separated by the first finish and LiftRatio build. No mathematical-scope correction remained. Final footer concurrence and the final integrity file bind the resulting bytes; no old audit or archive is rewritten.

The method review observed 263 named inputs unchanged from `2026-10-16T22:37:16.535209Z` through `22:37:17.230029Z`, with two exact Column0 object absences at `22:37:17.230091Z`. Its 15 bound audit-only inputs also match. The validation review observed 9,782 named inputs unchanged from `22:37:52.253006Z` through `22:38:36.482627Z`, then confirmed the two exact Column0 object absences at `22:38:36.510638Z`. Its nine bound audit-only inputs match. Crossreview agrees on 79 shared fields, 2,548 inherited pairs and 251 shared input hashes.

The final exact-request late-file observation at `22:38:36.510649Z` finds 174 current and 174 archived artifacts, with no extra or missing files. This enumeration is limited to the completed 161 request namespace and its closed archive; active 162 is unexamined. No additional late receipt or supplemental retention bundle is required. It is a bounded observation, not a claim about later filesystem state.

Project reads are now closed. The final sealing helper reads only files under the designated temporary audit directory, checks inventories and already-saved hash relations, and writes the integrity JSON. It does not rerun any project check or extend the project observation windows. The protected identities remain root `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`, raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068` and canonical contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

The exact preservation set is this main, the seven supports below, the inherited pair map, `static_audit_worker161.py`, `seal_worker161_audit.py` and the separately emitted `markov_worker_000161_audit_integrity.json`, all in `/private/tmp/math_gkm_godel_20261013`. The integrity file binds the main and all supports/helpers; its own final SHA is reported separately to the supervisor. No opaque-cache bundle is needed for 161.

| Support / helper basename | Bytes | SHA256 |
| --- | ---: | --- |
| `markov_worker_000161_mathematical_source_hashes.json` | 193690 | `3b878521b7c353f426ff749134e63b531a221b804f602bcecea09034bb91046f` |
| `markov_worker_000161_source_structure_audit.json` | 64597 | `e2af4bf412f3df2574794677f999b769e1647d2aa1310cb85877d63170579ce1` |
| `markov_worker_000161_finite_domain_audit.json` | 69131 | `942b0a29dd8efc42c42ec99cfa9e60a3cf734c4a147efaa559521f9dfd41b1c2` |
| `markov_worker_000161_validation_audit.md` | 28056 | `c2efcf8f851ae8a9d8825fd9e2faf26562af5c4a754ae9b9cae9c8d0754e4e28` |
| `markov_worker_000161_validation_evidence.json` | 9040523 | `7aa3df5397c71d7ee3785a26d65a0f85899a4053b12730416b6b3cb1c300c743` |
| `markov_worker_000161_replay_method.md` | 25386 | `c56f43ccafb06e3fb01673fdeaa530e9311f5563ef594a0ce2df5c38c441ea0e` |
| `markov_worker_000161_replay_method_evidence.json` | 14201705 | `ac61863821fcb5a4d808b9c51fae1aba098f31450192ba276c7b609047b4469f` |
| `markov_worker_000161_inherited_pair_expectations.json` | 2225870 | `9190375c2973e55bd7824b17ac22c8c1453dee2809b8f0ecb0f45f1dbd0c9edb` |
| `static_audit_worker161.py` | 22326 | `6f2a58fc26cf0d4b57b1ad8c0dc8d2cbb80ad7d6d77ddb0ba0ab14ea0c210105` |
| `seal_worker161_audit.py` | 12167 | `bd80d066f23b8669d37fd0cde94e14624f0e00aa337f4b6fa0b68b908ed338ab` |
