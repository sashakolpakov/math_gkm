# Independent static monitoring audit — worker 000159

Request `4687d03ffe8948abad1b235a519bed69`. Closed archive: `/Users/sasha/math_gkm/.control/markov/workers/000159`. This audit reads completed material and explicitly named inherited/current counterparts. Active worker160 is excluded; no active successor work or reconciliation is used.

## Finding and precise limits

The final retained sources and recorded successful checks support **twelve mathematical modules, 43 theorem closures and 16 definitions**. The new formal results are the rational formal-series resolvent and its exact lower-source-row identification; an exact raw column5 formula; and the following actual numerator-three source inequalities. Write the two exhaustive source families as `n=3q+1` for `r=true` and `n=3q+2` for `r=false`, with `q≥1`.

| Direction | Literal raw triple | Proved range | Conclusion |
| --- | --- | --- | --- |
| Horizontal | `(3,j),(4,j),(5,j)` | `j≤q` | non-strict LC |
| Vertical | `(5,j),(5,j+1),(5,j+2)` | `j+2≤q` | strict LC |
| Diagonal | `(3,j+2),(4,j+1),(5,j)` | `j+2≤q` | strict LC |

Every triple in these ranges has separately proved original-polygon membership. The raw column5 formula is valid throughout `j≤q`. No finite denominator bound, empirical formula, uniform residual-shape premise, coefficient normalization or arbitrary-word substitution remains in these source results. The vertical and diagonal ranges imply `q≥2`; they do not include the correction rows. The horizontal theorem covers `q=1` as well. These are specified triple families, not complete numerator-three rows or directions at every index.

The final exact reduction is

`Conjecture63 ↔ ThreeRemainingM468 ∧ OtherFourM9E2`.

**Both residual predicates remain unproved.** The full conjecture and its negation are unresolved. `ResolventShapeM468` is proved equivalent to the still-unproved `LowerRowShapeMFFD`. The newly formalized rational resolvent does **not** establish the additional Euler-substituted alternating coefficient formula used in the larger experimental scan. The denominator-difference identity is universal, but its shape induction has two explicit unproved premises. A positive multiplier in a sum of signed residual polynomials is not a proof of summand positivity.

All twelve final selected mathematical modules have matching successful compilation, one successful joint replay, and explicit prints of all 43 theorem closures. Inherited compiled dependencies keep their historical production/replay qualifications. No fresh whole-source rebuild or independent replay of every inherited theorem body occurred. The old 212-module worker121 backlog remains unrecovered; reconciliation of earlier workers is not a new replay.

The auditor ran only static text parsing, hashing, literal/inventory comparisons and input-index/domain counts. No project script, proof, Lean/compiler process, checker, replay, experiment, generator or finalizer was executed. No coefficients, binomials, polynomial identities, gaps, signs or other mathematical values were recomputed. No project/source/machinery files were edited, no data was deleted, and no proposer was contacted or assisted. Only modest audit files were written in `/private/tmp/math_gkm_godel_20261013`; previous seals and observation windows remain final.

## Actual-source representation and zero conventions

The inherited classification identifies every generated path with numerator three as `threePathM9E2 (q−1) r`, `q≥1`, and proves its polynomial equals the corresponding `threePolyM9E2`. `source_three_rawM9E2` then identifies all natural bivariate coefficients with `threeRawM9E2 q r i j`. It includes the smallest actual sources `3/4` and `3/5`; a denominator divisible by three is not admitted as an actual reduced numerator-three source. No finite path enumeration supplies this classification.

The exact target uses integer coefficients of the raw squared-variable numerator, specialized at the third variable equal to one. The inherited homogeneous exponent and its source bridge remain unchanged; no factorial, binomial, or coefficient-dependent rescaling enters the new target inequalities. The original directions are horizontal at fixed `j`, vertical at fixed `i`, and the diagonal with endpoint indices `(i,j+2),(i+2,j)` and center `(i+1,j+1)`. The new diagonal fixes `i=3`; it has constant total degree `j+5` across its three points.

All natural coefficients and the polynomial zero tails remain defined. The formal row bridge continues to include every natural horizontal index `i`, including initial and terminal zeros. The new bounded triple families lie in the polygon; the residual equivalence still quantifies over all other natural starts and retains the zero and endpoint cases through the inherited root bridge. There is no deletion of inconvenient zeros or assumption that the middle source coefficient is nonzero.

## Forcing coefficients, parameter identities and formal resolvent

`rowJ_coeffM468` derives the coefficient of the inherited finite forcing polynomial `rowJMFFD n j` using the binomial convolution identity and the exact choose-multiplication identity. It initially assumes `k≤j`. `rowJ_coeff_tailM468` uses the inherited degree bound for `k>j`, and `rowJ_coeff_allM468` combines them into

`[u^k] J_j(n,u) = C(j+3,k+3) C(n−j−1+k+3,k)`

for every natural `n,j,k`. Natural subtraction in `n−j−1` is part of this general statement; it is not silently extended to signed integer parameters. When `k>j`, the first binomial and the coefficient both vanish. The proof does not discard these cases or substitute a tested range.

`rowJ_parameterM468` proves

`J_(j+1)(n+2)+J_j(n)=J_(j+1)(n+1)+(1+u)J_j(n+1)`

under `j+1≤n`. It treats coefficient zero and successor coefficients separately, preserving natural-subtraction bounds. `rowH_parameterM468` proves the identical shift equation for `H` by induction from its signed recurrence, with the same `j+1≤n` premise. Its zero/one/higher-row cases retain the correct initial values; this is an identity, not a positivity theorem.

The formal series variable is `t`, distinct from the raw row variable `u`. In Lean the coefficient ring is `Polynomial ℤ`; `Polynomial.X` is `u`, and the enclosing `PowerSeries.X` is `t`. The definitions are

`JSeries_N(t)=Σ_j J_j(N+j+1,u)t^j`,

`F_N(t)=Σ_j H_j(N+j+1,u)t^j`,

`A(t)=1−(1+u)t`.

For every natural `N`, the coefficientwise parameter recurrences give `A JSeries_(N+1)=(1−t)JSeries_N` and `A F_(N+1)=(1−t)F_N`. `rowJ_initialM468` evaluates the `N=0` forcing series coefficients. `rowJ_series_baseM468` instantiates the inherited Mathlib binomial power-series identity with degree parameter three and coefficient ring `ℤ[u]`, then rescales by `1+u`. Its hypotheses fit a formal ring identity; no analytic convergence is needed. Induction in `N` yields

`A(t)^(N+4) JSeries_N(t)=(1−t)^N`.

`rowH_series_equationM468` translates the complete signed recurrence into a series equation, explicitly separating coefficients at rows zero, one, and two-plus. `rowH_clearedM468` combines the parameter identities and that equation using ring algebra. The final `rowH_resolventM468` states, for every natural `N`,

`(1−(1+u)t)^(N+4) (1−2t+(1+u)t²)^2 F_N(t)`

`= (1−t)^N (1−(1+u)t²)^2`.

The source does not cancel a potentially vanishing polynomial value at an evaluation point. `rowDenom_unitM468` proves the formal denominator's constant coefficient is one in `ℤ[u]`. `rowResolventM468` uses `invOfUnit` with unit one, and `rowResolvent_eqM468` and `rowResolvent_uniqueM468` use the corresponding multiplication identity to identify the unique formal solution. The inspected Mathlib `invOfUnit_mul` hypothesis is exactly equality of the constant coefficient with the chosen unit. No field of rational functions, convergence region, or nonzero source coefficient is assumed.

`rowResolvent_coeffM468` recovers `H_j(n,u)` as the coefficient of `t^j` in `rowResolventM468 (n−j−1)` only under `j+1≤n`, which validates the natural reindexing. `source_lower_resolventM468` then specializes to the actual denominator and uses the already proved source-row factorization:

`threeRaw q r i j = [u^i] u³(1+u)^(n−2j−1) [t^j] rowResolvent(n−j−1)`

for `j≤q` and every natural `i`. Its generic parameter statement also allows `q=0`; actual-path use obtains `q≥1` from classification. The binomial factor is exact and all zeros remain. This closes the rational-resolvent/source bridge left open by worker158.

`ResolventShapeM468` asks for CrossLC of those residual coefficients for every natural `N,j` with `j≤N`. The equivalence with `LowerRowShapeMFFD` uses `n=N+j+1` in one direction and `N=n−j−1` in the other; the bounds are precisely `2j+1≤n`. The new theorem proves equivalence of two unproved propositions. The conditional smoothing theorem reaches actual horizontal lower rows only. It is not an unconditional general LC result.

The inherited Euler substitution and six-term alternating coefficient expression require an additional formal coefficient/substitution bridge. They remain unproved here, despite the formal resolvent identity. In particular, the larger scan's `alt` implementation is not automatically a verified implementation of every residual coefficient merely because the resolvent is now proved.

## Raw column5 and the three gap certificates

`lowFiveM468(n,x)` is the rational polynomial

`(x+1)(x+2)(x+3)(x+4)(x+5)/30240`

times

`n²(12x²+72x+126) − n(30x³+234x²+576x+378) +19x⁴+183x³+596x²+714x+252`.

This displayed expression is copied from the saved definition; it was not recomputed by interpolation or evaluation. `low_five_equationM468` checks its second-difference equation by exact ring algebra. `fib_delta_fiveM468` identifies the raw forcing term using the inherited `fib_delta_high` theorem with explicit `j<n`, binomial identities and guarded casts. `low_force_fiveM468` proves the actual source forcing identity throughout `j≤q`, with separate row-zero, row-one and successor branches so omitted negative shifts do not become spurious natural-index terms.

`source_low_fiveM468` proves the raw column5 formula for every actual `q≥1`, both residues and every `j≤q`. It obtains the row-zero and row-one values from the actual discriminant identities and the already proved columns3/4. The higher-row recurrence uses the actual source discriminant step, the polynomial forcing equation and the inherited uniqueness theorem for a second-difference solution. The polynomial candidate is thereby identified independently of the interpolation script. There is no pending source identification premise and no extension beyond `j≤q`.

The horizontal certificate identifies

`lowFour(3x+1+d,x)^2 − lowThree(x) lowFive(3x+1+d,x)`

with `firstHorizontalGapM468 d x`. Its nonnegative rational coefficients prove nonnegativity for rational `d,x≥0`. Actual substitution takes `x=j` and `d=n−3j−1`; `j≤q` proves the needed nonnegativity. The exact raw column formulas and injective casts return the non-strict integer inequality at columns3,4,5.

The initial generated horizontal template asked for strict positivity. It was corrected to nonnegativity before the first retained compilation of `MarkovFivePolynomialM468`; that sole saved build snapshot already has `first_horizontal_nonnegM468`. The recorded source edit occurs at events136–137 after generation133. The Python generator template is updated at events145–146 during the build, but this edits Python, not the compiled Lean source, and it is not rerun. The pre-correction generated Lean bytes are not a separately retained compiler snapshot. No strict horizontal theorem was accepted, replayed or printed. The saved observation that the generic certificate vanishes at `x=d=0` is not independently evaluated here.

`verticalFive_identityM468` and `diagonalFirst_identityM468` identify the two further raw gaps at denominator `3x+7+d`. Their exact factored rational polynomial certificates have positive factors and positive constant terms in the saved expressions. The corresponding positivity theorems are strict for rational `d,x≥0`. Actual substitution uses `x=j`, `d=n−3j−7`; `j+2≤q` supplies the bound. Column formulas are used at precisely `j`, `j+1`, `j+2`, and `exact_mod_cast` returns the strict integer statements. No division by a raw coefficient or dropped support point occurs.

These three certificates were proposed by interpolation/symbolic generation, but final Lean identities and positivity proofs are separate checked statements. Literal candidate JSON formulas match the final definitions: the horizontal expression has 41 additive terms, the vertical core35 and diagonal core21, with saved explicit prefactors. The auditor compared strings and counted terms only; no rational arithmetic, expansion or sign test was rerun.

## Exact remaining target, polygon coverage and gain

`ThreeRemainingM468` quantifies over every natural `q≥1`, both residues and all natural `i,j`. Its remaining guards are the complements of:

- H: `j=5 ∨ (i=3 ∧ j≤q)`.
- V: `((i=3 ∨ i=4) ∧ j+1≤q) ∨ (i=5 ∧ j+2≤q)`.
- D: `i=3 ∧ j+2≤q`.

Thus worker158's complete horizontal row5 and worker157's columns3/4 vertical region remain discharged, while the three new regions are removed. Every other clause remains. The converse in `three_remaining_iffM468` fills the new regions with the saved source theorems, weakening strict V/D to the target's non-strict inequalities. `root_iff_remainingM468` then composes with the inherited exact reduction. `OtherFourM9E2` still contains all generated sources with numerator at least four. No auxiliary shape or series premise is inserted into this unconditional equivalence.

`first_horizontal_polygonM468`, `five_vertical_polygonM468` and `first_diagonal_polygonM468` explicitly establish all three original-polygon memberships in their stated domains, including equality/boundary cases. The polygon is the original `3n≤ni+3j` and `i+j≤n+2` specialization. The horizontal path wrapper explicitly obtains the actual-source parameters and converts the coefficient identities. Vertical and diagonal theorems are stated in the exhaustive `threeRaw` parameterization and are used in the exact residual; their actual-path correspondence is inherited, not an arbitrary-word assumption.

The families are unbounded in the source parameter and in the permitted row index. The immediate previous residual retained H at start3 outside row5, V at column5, and all D, so the new subtraction of these clauses is a genuine enlargement relative to that residual. H at row5 overlaps the existing theorem; earlier universal small-row or sufficient-criterion coverage may also overlap. No claim is made that every displayed triple lies outside every historical criterion. No complete numerator-three direction or full root is claimed.

The exact root still uses the original raw coefficients, polygon guards, three directions, zeros, endpoint sources, and all path/rational coverage inherited from the established reduction. This static audit does not repeat the entire prior source-to-paper/homogeneity development or claim a whole-library rebuild.

## Denominator difference: universal identity, conditional shape

`rowH_difference_sumM468` proves for all natural `N,j`:

`H_(j+1)(N+j+3) − H_(j+1)(N+j+2) = u Σ_(s=0)^j H_s(N+s+2)`.

It follows from the proved parameter recurrence by induction. This identity has no shape-domain restriction, and some of its auxiliary parameters need not represent actual source lower rows. The multiplier and summation weights are nonnegative monomials; the theorem does not prove all signed residual summands nonnegative. Calling it a positive summation form must retain that distinction.

`RowDifferenceM468 n j` is the difference of two real zero-extended coefficient sequences at denominators `n+1` and `n`. `RowDifferenceShapeM468` requires, for every `n,j` with `2j+1≤n`, both CrossLC of that difference and the explicit mixed-cross inequality with the old row for **every pair of integer indices `i≤k`**. These are not adjacent-only conditions. Negative integer indices are covered by the inherited zero extension; source zero coefficients are not excluded.

`crossLC_sum_mixedM468` combines two CrossLC predicates with that mixed inequality. The actual inherited `CrossLC` definition is an all-index inequality predicate; it has no nonnegativity conjunct. The rejected RowDifference proof mistakenly projected it as a pair. The corrected proof introduces the quantified indices and combines the three inequalities directly. Its final theorem headers and premises remain unchanged; no false nonnegativity assumption or weaker adjacent predicate is substituted.

`lower_shape_of_differenceM468` inducts in the excess denominator, assuming (1) CrossLC at every minimal denominator `n=2j+1`, and (2) the entire `RowDifferenceShapeM468` predicate. Both premises are open. This is a sufficient conditional reduction, not an equivalence asserted here or a solution of uniform residual shape. The finite synchronization tests below do not establish its all-index hypotheses.

The saved binomial-normalized residual obstruction uses `H_2(7)=[34,68,36]` and its normalization `[34,34,36]`. Even though this residual occurs in the actual `3/7` lower-row setting, those normalized coefficients are not the raw bivariate source coefficients. It is an experimental obstruction to a stronger auxiliary mechanism, not a source/root counterexample; there is no new formally checked obstruction theorem here and its arithmetic was not recomputed by this audit.

## Finite domains and generated artifacts

The large scan uses `j=1..150` and the seven listed slack **occurrences** `d∈[0,1,2,j,2j,5j,10j]`, with `n=2j+1+d` and coefficient positions `0..j`. Its counters are 80,325 positivity positions and 78,225 adjacent occurrences. The slack list repeats values at `j=1,2`: there are 1,050 parameter occurrences but 1,047 distinct `(n,j)` inputs, 80,318 distinct coefficient positions and 78,224 distinct adjacent positions. These counts come from input indices only. This large scan evaluates the unproved Euler-alternating coefficient formula, not canonical source coefficients or directly proved `H` coefficients. The separate parameter-shift probe uses `n=4..44`, `j=1..floor((n−1)/2)` and `Hrows`, giving 461 polynomial-array comparisons. Recorded no-failure outcomes are retained, not recalculated.

The auxiliary shape-routes probe uses `n=3..90`, `j=2..min(floor((n−1)/2),25)`: 1,512 rows, 16,600 binomial-normalized adjacent tests, 33,200 directed synchronization tests and 18,112 denominator-ratio comparisons. The record saves only the first five normalized failures, not an exhaustive failure count. The synchronization and ratio no-failure observations are finite; neither is a proof of all-index CrossLC. The parameter range includes non-source denominators and rows outside the actual lower-source range.

The difference probe uses `n=3..100`, `j=1..min(floor((n−1)/2),30)`: 2,070 residual differences, 25,520 difference-adjacent tests, 51,040 directed synchronization tests and 25,520 mixed adjacent sum-gap comparisons. The latter count is implicit in the loop even though it has no separate saved counter. Failure lists are capped at five. The auditor did not evaluate the differences, signs, array trimming or `zip` lengths; the retained successful execution is the evidence that the accessed array indices completed. These tests remain weaker than the quantified all-integer mixed premise.

The direct source scan separately constructs the canonical paths for `q=1..30` and both residues: 60 actual source polynomials. For `j=0..q`, it compares columns3,4,5 with their formulas, giving 2,970 comparisons, and checks 990 H triples. For `j+2≤q`, it checks 870 V and 870 D triples, so 2,730 triples total. Each triple makes three original-polygon assertions, giving 8,190 membership occurrences, including repeated points. V/D are additionally required strict; H is tested non-strict. There is no zero-based filter and no reported zero-containing-triple count, so none is inferred. Fifty-two tested H triples overlap the prior row5 theorem. No disjointness is claimed across formula, source and auxiliary tests.

The interpolation generators sample column5 at denominators30,31,32 and rows0..9, column3 at rows0..5, and column4 at denominators30,31 and rows0..7. Their output JSONs contain proposed formulas and term counts. Final accepted source proofs verify the identities independently. The column5 generator's final template edit follows its run; the V/D generator and source proof-template simplification are edited after their run at events184–185. Current helper hashes are not retroactive invocation-start hashes, and no generator was rerun by this auditor.

All six retained result JSONs match completed stdout field-for-field at events56,117,133,156,172,200. Saved commands disable Python bytecode writes. Experiment/generator bodies are main-guarded; the inherited probe helper still performs small constant-dictionary initialization on import. These are limited script observations, not interpreter authentication or a complete invocation-time transitive source map. No GAP or other mathematical execution is performed by this audit.

## Final source and validation bindings

The mathematical hash supplement binds every selected final source to its archived/current bytes, controller change, manifest entry, exact successful singleton build map and immutable source snapshot, validation map, replay map and axiom map. Every retained mathematical object matches its archive/current/controller/manifest hash. The source supplement records all 59 explicit declarations, theorem statements and imports. No `sorry`, `admit`, new `axiom`, `native_decide`, `unsafe` or `partial` token occurs in selected mathematical bodies after comment removal; operational replay code is separate.

The same supplement rehashes 253 explicit older source paths against sealed158 pins and the worker159 initial snapshot, seven inherited helper paths, and nine named external source/object pairs. It reads the exact Mathlib power-series statements used above. These bindings establish inherited identity and scope, not a fresh imported-source rebuild or invocation-time executable authentication.

The selected inventory is complete:

| Module suffix `M468` | Theorems | Definitions |
| --- | ---: | ---: |
| RowCoeff | 4 | 0 |
| RowParameter | 2 | 0 |
| RowSeries | 5 | 3 |
| RowResolvent | 3 | 0 |
| ResolventSource | 7 | 4 |
| FivePolynomial | 3 | 4 |
| FiveForce | 2 | 0 |
| FiveSource | 2 | 0 |
| FiveShape | 4 | 2 |
| FiveDirections | 2 | 0 |
| Residual | 6 | 1 |
| RowDifference | 3 | 2 |

There are 23 retained compiler attempts: twelve successful mathematical builds, one successful operational Audit, ten return-code-1 failures, and no timeout. No new selected module remains unbuilt or compilation-only. All successful mathematical snapshots are the final bytes; there is no superseded successful mathematical version. The first rejected RowCoeff has two theorems, whereas its final version adds the all-index coefficient and parameter identities before successful compilation. Its two common statement headers remain unchanged. The other nine rejected snapshots have the final inventories and normalized headers, with changed proof bodies. They cover RowParameter, RowSeries twice, RowResolvent twice, ResolventSource, FiveShape, Residual and RowDifference. Failed versions receive no proof credit.

Every new dependency has a completed final-source successful build before its dependent final build starts. There is no same-module build overlap or observed completed same-source file-change event inside a retained build interval. This is saved chronology, not authentication of every compiler read instant or all shell writes. The successful snapshots and final/current hashes provide the final version binding. Most mathematical build bounds are 100 seconds; recorded exceptions use 120, 150 or 180 seconds. The final replay and direct Audit compilation each have a 180-second bound. No inherited 150-second outer Audit wrapper applies to this invocation.

`replay-1792185405407010000.json` records one successful joint replay of the twelve modules, 59 explicit mathematical declarations and six inherited direct imports including implicit Init. It exits zero after 15.819460332976 seconds and prints `replay union passed`. `MarkovAudit1792185405407045000M468`, built in `build-1792185405407167000.json`, supplies `axioms-1792185419723959000.json`. It explicitly prints exactly the 43 theorem names; every closure has exactly `propext, Classical.choice, Quot.sound`. The sixteen definitions are replayed but are not counted as theorem closures. The Audit source, snapshot, successful compiler stdout, current/archive object and axiom record agree.

The replay driver SHA is `a9b539490e5fedd91938d15a413b56b0e03057784e25ed460004aca09df61732`. Its body is the prior driver's retagged form; the duplicate `M468` suffix alternatives do not enlarge the selected-name predicate. It collects selected object constants, removes selected modules from the direct-import union, constructs the inherited environment, rejects any selected explicit name already present or unsafe/partial, and joins `env.replay` on the selected union. There is no selected-name/base collision or local import cycle. Compiler-generated declarations retain ordinary replay handling; the explicit-name audit is not an independent enumeration of every generated declaration. The driver's host-side unsafe API is not an imported mathematical axiom.

The wrappers name Lean 4.32.2 and prepend the current evidence directory to the saved inherited LEAN_PATH. Source snapshots/maps are taken at the recorded wrapper stages: before compiler/replay execution, and after Audit for its source map; the driver hash is taken after replay. Ordinary compiler receipts and validation do not contain object hashes. The audit's object associations are independently observed later, rather than falsely attributed to the compiler receipts. No executable-byte authentication, fresh Mathlib rebuild, optional server/private-part audit, or fresh inherited source-to-object production is claimed.

## Inherited import and historical recovery boundaries

The inherited direct mathematical imports are `MarkovLowSolutionsME9C`, `MarkovLowSourceME9C`, `MarkovResidualMFFD`, `MarkovRowDegreeMFFD` and `MarkovRowTransferMFFD`. The local mathematical graph has 2,545 nodes: twelve new modules and 2,533 inherited modules. Adding the operational Audit gives 2,546. External Mathlib/Lean imports end this local walk; this is not the full external dependency graph.

The inherited pair map contains all 2,522 prior158 inherited pairs plus its eleven accepted new modules. Every expected source/object pair agrees with the controller-before159 pins and independent current hash pass, with no fallback. The worker's separate initial snapshot excludes objects. The first project-local object candidate in saved LEAN_PATH order agrees with the mapped object; this inventory ordering is not runtime resolver or external executable authentication. Of the 253 additionally compared older source pins, 178 are in the graph and 75 are comparison-only. Nine named external source/object pairs are pinned without extending the review to every external library body.

**Every current endpoint imports all 212 worker121 modules that remain historically unreplayed**, including the 195 subset, and the separately accepted nineteen-module set. None is a current compiler or replay target. The new FiveShape has the broad inherited base, unlike worker158's small-base FifthShape. Consequently the current replay recovers zero old backlog modules. Printing the new theorem's axiom dependencies is distinct from replaying each imported theorem body.

`WindowLC6d34` remains imported throughout, with source SHA `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object SHA `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its old build printed only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; its old checker stdout was empty, its old build receipt did not hash the object, and that object was outside its older initial snapshot. Later pins preserve identity without repairing those original production limits. It is separate from the worker121 backlog and receives no new body replay.

The sixteen earlier accepted worker134 modules and 23 modules recovered by worker135 retain their separate chronology. Failed HighCone2GapM81F and its unbuilt assembly companions remain excluded; the accepted MF25 replacement is distinct. The historical late failed Audit remains a failed receipt. Corrected final UpperScalarM2B3, UpperGlobalMEC6 and DiagonalShapeMDB9 remain imported; no superseded wrong-comparison certificate is credited.

Worker153's ten accepted and three unvalidated modules remain outside the current graph, with its historical timeout unchanged. Seven worker156 modules are imported: LowDifference, LowForce, LowLC, LowSolutions, LowSource, LowerShape and LowerUniform ME9C. Their recovery belongs to worker157, which replayed all twelve final worker156 modules and printed 44 closures. Worker156's own outcome remains twelve compiled / seven replayed / zero printed / timeout with null report. Its other five modules remain outside. Six worker157 modules are imported; FirstRow and TailBinomial M1BB remain outside. All eleven accepted worker158 modules are imported, but its unused sixteen-theorem candidate remains uncompiled and outside. Worker159 performs no inherited-body recovery. The detailed support records the other inherited endpoint and exclusion sets without extending their historical observations.

## Aggregation, reconciliation and preservation

The first setup command fails because its script does not yet exist; setup is then written and successfully invoked. Saved prior158 validation/reconciliation/interrupted-reconciliation records are read. Their identities match the sealed prior records; this carries the historical worker156 timeout and worker157 recovery rather than repeating either check. Setup records six administrative checks and all 100 prior158 manifest entries. The audit does not read a later current administrative index or claim its invocation-time identity.

The final validation schema records the request, twelve module names, source-hash map, successful build paths, replay/axiom paths, 43 closures, permitted flag, limits and null completion. It has no receipt hash or object-hash table. The supplemental normalized association table is explicitly an audit product.

`finish_4687d03f.py` has become an aggregator. It writes a fixed selected-module list; `prepare` can stop there. The first preparation listed eleven modules before RowDifference was added, and the final preparation listed twelve. Only the latter list has successful retained replay/Audit. The aggregator selects source-matching successful singleton builds, a source-map-matching successful replay and source-map-matching axiom record. It assigns the permitted flag true and copies the closure count; it does not independently check the axiom sets/names, Audit build return code, replay success text, driver hash or output objects. The actual records separately pass those checks in this audit. Aggregator success alone would establish less.

The finalizer checks null completion, the permitted flag, current selected-source hashes, four literal proof tokens (`sorry|admit|native_decide|axiom`), inherited inputs, prior manifest and root/contract identities. The replay's actual isolation guard separately rejects unsafe/partial selected constants. Unlike prior158, the finalizer records STOP presence without asserting absence, and records the rejected-build count without its previous exact-count assertion. STOP is recorded false here. It neither reruns proof checks nor independently revalidates every closure or object.

The initial inventory has 6,629 entries, including 192 Python caches. It includes the unchanged current setup script; the owned-file predicate excludes only that script, leaving 6,628 checked inherited entries. The checkpoint was added later. Initial and controller-before scopes differ; omitted optional inventory fields are not invented mismatches. All 100 prior158 manifest files are rechecked. The separately preserved worker157 three-cache bundle remains historical evidence, with no retroactive original-archive insertion or cache execution.

The finalizer writes final-check and an authored draft report, scans current evidence recursively except manifest/last-verification, and scans top-level tagged research files. It does not recursively select Python caches. All 105 indexed files are among the 107 controller/archive artifacts; only manifest and last-verification are unindexed. The saved verifier reports 24,402,279 indexed bytes and no mismatch. There is no current manifest/archive retention gap and no new supplemental cache bundle is required.

The unchanged root, raw contract and canonical contract have SHA256 values `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`, `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068` and `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, respectively. Earlier content-preserving COW maintenance changes storage metadata, not source/object bytes or validation history; no new worker159 preservation repair is inferred.

## Deadline, completed report and finalization chronology

The controller starts at **2026-10-16 20:54:09.632685 UTC**, with nominal deadline **21:24:09.632685 UTC**. It finishes at **21:19:24.723838 UTC**, elapsed **1515.0911529064178 seconds**, exactly the difference of its saved timestamps and **284.908847 seconds before deadline**. Its historical outcome is completed, return code zero, with a delivered structured report and null mathematical completion. No timeout is upgraded.

The last mathematical build finishes at an estimated 21:16:24.804502 UTC. Replay runs approximately 21:16:45.407010–21:17:01.226470; Audit 21:16:45.407167–21:16:59.717601. They overlap. The receipt IDs differ by 157,000 nanoseconds at start, while floating epoch subtraction gives about 156.879425 microseconds; these are stored timestamp representations, not independently precise read-time measurements. Audit completes about 1.508869 seconds before replay. The two saved checks both finish successfully before aggregation at events234–235 and the sole finalizer invocation at236–237. Its stdout exactly matches saved final-check and last-verification.

The original current validation mtime is 21:18:17.661048; final-check 21:18:18.771173; authored draft report 21:18:18.771294; manifest 21:18:18.864354; and last-verification 21:18:18.883600. The 405,737-byte event log has 240 events, 112 started items and no unmatched start; its mtime is 21:18:43.727131. The controller final.json mtime is 21:18:44.637441. Archive-copy mtimes near host finish are separate bookkeeping metadata. Receipt-epoch plus elapsed durations provide estimated finish times, not authenticated compiler-read instants. Event-log mtime is not heartbeat content time.

Delivered event239, the controller report and final.json agree; event240 is `turn.completed`. The authored draft differs in actions, agenda, observations and summary and is not substituted for the delivered report. Completion remains null. All these observations precede host finish and deadline; the historical completed outcome is supported independently of the finalizer's narrower predicate.

## Final audit observation

The independent inherited-pair pass checked all 2,533 named source/object pairs during **2026-10-16 21:32:45.485547–21:33:34.501750 UTC**, with no fallback or mismatch. The final method pass rehashed all **158** pinned inputs, including twelve audit-only files, during **21:42:29.967871–21:42:30.094925 UTC**; all were unchanged. The final validation pass rehashed all **9,591** named inputs during **21:42:57.712374–21:44:43.988758 UTC**, with no changed or missing input.

At **21:44:44.233382 UTC**, the final exact-request observation found **107 current files and 107 archived files**, with no extra or missing path and no late bundle requirement. It was limited to closed159's evidence directory and exact research/cache request-name patterns; active160 was not inspected. There was no pending/uncompiled candidate requiring a separate absence check. Project reads then closed. These are bounded observations, not claims of future stability or reconstructed invocation-time identities.

Audit-files-only comparisons agreed on **75 shared evidence fields, 2,533 inherited pairs and 149 shared input hashes**. Seven validation-bound temporary inputs and twelve method-bound temporary inputs were rechecked unchanged. Both delegated reviewers concurred on the complete mathematical/method body. The validation reviewer additionally reviews this final observation footer and audit-only integrity helper. The method reviewer was released after its stable note and full-body concurrence for the supervisor's separate documentation task; no documentation activity is evidence for this mathematical audit.

Before sealing, the validation serializer's carried key `initial158` was corrected to `initial159`. Its values already came from the worker159 snapshot; no hash, count, project read or observation history changed. The main's object-pair wording was likewise made explicit: those objects bind controller-before159, whereas the worker initial snapshot excludes objects. Neither refinement changes a mathematical claim or a historical check.

The seven standard supports are `mathematical_source_hashes.json`, `source_structure_audit.json`, `finite_domain_audit.json`, `validation_audit.md`, `validation_evidence.json`, `replay_method.md` and `replay_method_evidence.json`, all under the `markov_worker_000159_` prefix in the designated audit directory. The final integrity file binds this main note, all seven supports, the exact inherited-pair map and the two audit-only helpers. The validation note/evidence SHAs are `0b80c5db870879cf44621bdd37ff1a7d114a57866c82173fd37ac0c780410c40` and `1a87861224858f4a080e206bf2f615b37e5ff9f12445c01f05257db8c8963132`; the method note/evidence SHAs are `52936845b55f2029c5f3af424f0b64320039c4c21ac7e95efb0d04852f1b355c` and `61d42c80c75d69cbb783d3888b02f737063c71ebb8413cdc607ce18182f45e71`.

No additional current-project artifact requires separate preservation, and no mathematical execution remains part of this audit. All earlier seals, historical timeouts, recoveries and observation windows remain unchanged. The full root remains open.
