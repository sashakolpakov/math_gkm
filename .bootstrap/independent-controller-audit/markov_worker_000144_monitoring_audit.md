# Independent monitoring audit: completed worker 000144

Request `af6200bf65064e34b8d9216a2d53d5b2`. This is an independent, archive-first, static audit of completed worker 144 under `/Users/sasha/math_gkm/.control/markov/workers/000144`. It is not a proof execution or a research contribution. The auditor and retained validation/method reviewers read saved sources and records, compared exact file hashes, parsed declarations and counted input/index domains. We executed no project program, Lean elaborator, checker, replay, experiment, generator or finalizer. We did not recompute coefficients, binomial values, polynomial expansions, recurrences, moments, gaps or Sturm roots. We did not change project files, inspect active worker 145, contact the proposer or offer mathematical assistance. Audit outputs alone are written under `/private/tmp/math_gkm_godel_20261013`.

The mathematical claim is supported at its stated scope: every actual numerator-two source `2/(2q+1)`, with `q≥1`, has raw horizontal log-concavity at every natural starting column in every lower row `0≤j≤q`. This includes zero coefficients and all row endpoints. The previously open lower-binomial subproblem is now proved. The new root equivalence removes exactly those lower-horizontal clauses from the residual; the residual and full `MathGKM.Markov.Conjecture63` remain unproved. There is an unbounded actual-source family satisfying every former residual guard and covered by this result. A separate upper-row summand-certificate obstruction is accompanied by a proof that its actual polygon-valid raw coefficient triple satisfies log-concavity.

Ten final mathematical modules contain 27 theorem closures and 10 definitions. Saved successful compilation, selected replay and explicit axiom-print records cover the final versions. Earlier partial selections, inherited compiled imports, failed builds and the old worker-121 backlog are distinguished below. The controller outcome is **completed**, return code 0, with a non-null structured report and null mathematical completion. Completion of the turn does not mean completion of the conjecture.

The governing root is unchanged: `coeff P i j = (P.coeff i).coeff j` is the ordinary integer coefficient of the recurrence-defined bivariate polynomial. `InPolygon a b i j` is `a*b ≤ b*i+a*j ∧ i+j ≤ a+b-1`. `WeakLC` requires the three original polygon-guarded inequalities in horizontal, vertical and diagonal directions. `Conjecture63` also includes endpoint polynomials at `0/1` and `1/1`, followed by all finite Boolean source paths. New internal summand scalars never renormalize these raw coefficients.

**Final source inventory and exact theorem scope.** The archive/current final source maps and final closure-name map agree. The source-structure supplement records complete theorem headers, retaining inner `let` binders, definitions and imports.

| Module | Theorems | Definitions | Principal role |
| --- | ---: | ---: | --- |
| `MarkovShiftedSumMAF6` | 2 | 1 | Finite shifted min/max summation bridge |
| `MarkovOffsetStepMAF6` | 4 | 4 | Exact horizontal/diagonal scalar recurrences |
| `MarkovOffsetScalarMAF6` | 2 | 2 | Two nonnegative polynomial certificates |
| `MarkovOffsetCoreMAF6` | 2 | 0 | Ordered and separated supported-core comparisons |
| `MarkovOffsetWeightsMAF6` | 4 | 0 | Inward binomial weights, support and common finite sum |
| `MarkovOffsetGlobalMAF6` | 1 | 0 | Global shifted summand inequality |
| `MarkovLowerLCMAF6` | 4 | 0 | All lower rows, actual source and arithmetic subproblem |
| `MarkovResidualMAF6` | 1 | 1 | Exact full-root residual equivalence |
| `MarkovLowerGainMAF6` | 2 | 0 | Infinite family outside previous residual coverage |
| `MarkovSquareObstructionMAF6` | 5 | 2 | All-index alternative formula and actual-source certificate obstruction |
| **Total** | **27** | **10** | **37 explicit declarations** |

After removing comments, the final mathematical sources contain no `sorry`, `admit`, new `axiom`, `native_decide`, `unsafe` or `partial` token. This lexical observation supplements the retained compilation/replay/closure evidence; it is not independently a proof. Operational checker code is a separate object and is not treated as a theorem.

**Actual source and lower-row indexing.** The inherited theorem `source_two_squares3556 path ha`, with the sole source restriction `(frame path).mid.a=2`, supplies a natural `q≥1`, denominator `b=2*q+1`, and exact polynomial identity

`p = fib6 (q+1)^2 + V * fib6 q^2`.

This is a recurrence-derived source identity, not an empirical formula premise. Worker 143's `source_two_lower_formulaM58E` identifies the raw coefficient with `lowerValM58E j d i` whenever `b=2*(j+d)+1`. Worker 144's `source_two_lower_lcMAF6` proves the desired inequality under precisely those source equalities, for every natural `j,d,i`. Its final convenient adapter `source_two_lower_halfMAF6` assumes only the actual source numerator equality and `2*j+1≤b`; classification gives `j≤q`, and `d=q-j` is justified by `omega`. No natural subtraction underflow is silently interpreted as a signed offset.

The raw conclusion is exactly

`coeff p i j * coeff p (i+2) j ≤ (coeff p (i+1) j)^2`.

There is no denominator, depth, row, column or run-length cutoff, and no unknown formula, support, positivity or gap-sign hypothesis. The three original polygon guards are unnecessary for this stronger all-natural-start source theorem, so every guarded root triple in this region follows. The term “lower” is the precise range `j≤q`, equivalently `2*j+1≤b`; it does not assert all horizontal rows or the two other directions for numerator two.

For `j≥2`, the proof uses the new global summand theorem and finite summation bridge. For `j=0`, it uses inherited `boundary_raw_logConcave path i`, whose conclusion is already the same raw row-zero inequality for every natural `i`. For `j=1`, it uses inherited `horizontal_one_raw46 path i`, likewise unconditional in natural starts and retaining zeros. Thus the known failure of a particular summand condition at row one is not suppressed or assumed away. The source theorem branches around that certificate using existing source proofs.

`lower_binomial_lcMAF6` proves the entire previously defined `LowerBinomialLCM58E` by the inherited exact source/arithmetic iff and the new source theorem. That arithmetic proposition still requires `1≤j+d`. The formal source classification excludes the artificial parameter pair `j=d=0`; no source `2/1` is introduced. The more specialized algebraic `lower_value_lc_ge_twoMAF6` needs only `j≥2`, which already places it inside the nonzero denominator range.

**Summand support and zero extension.** Let `D(j,d,i)=lowerValM58E j d i`. The inherited expression sums over `h∈range(i-1)` the product

`C(2d,h) C(2i-2-h,i) [C(j+i+1,2i-1-h)+C(j+i,2i-1-h)]`.

Its natural arithmetic is controlled by the finite range. `lowerTermM58E` is explicitly zero unless `h<i-1`; within that guard it is the binomial weight times `lowerCoreM58E`. This conditional is material: the proof does not substitute an unguarded natural-underflow formula for small columns.

`lower_term_supportMAF6` proves that a nonzero term implies all three inequalities `h+2≤i`, `i≤j+h+2`, and `h≤2d`. Failure of the first is the conditional zero; failure of the third is a zero weight; failure of the second makes both row binomial coefficients zero. No positivity conclusion is inferred merely from a missing guard. All terms are already nonnegative by the inherited theorem.

`lower_term_highMAF6` proves zero for every `h>2d`. `lower_term_sumMAF6` first identifies `D` with the conditional term sum on `range(i-1)`, then changes to the common range `range(2d+1)`. If the new range is smaller, every removed term has a zero binomial weight; if it is larger, every added term fails the explicit conditional. Both subset directions are proved. This covers `i=0,1`, `d=0`, empty old ranges and all tails. There is no numerical cutoff masquerading as support.

The inherited exact raw positive support remains `2≤i≤j+2d+2`, identical to the original polygon section for `a=2,b=2(j+d)+1`. Low and high zero theorems remain valid. The new all-start LC does not cancel a coefficient at either boundary and therefore keeps every zero-containing triple.

**Exact scalar recurrences and comparisons.** The new definitions, on integers, are

`Hnum(j,i,h)=(j+i+1)(j-i+h+2)(2i-1-h)`,

`Hden(i,h)=(i+1)(i-1-h)(2i+1-h)`,

`Dnum(j,i,h)=(j+i+1)(2i-1-h)(2j+4+h)`,

`Dden(j,i,h)=(i+1)(2i-h)(2j+3+h)`.

`lower_aux_stepMAF6` requires `h+2≤i≤j+h+2`; it multiplies two exact choose recurrences and rewrites natural differences only after proving their bounds. `lower_core_stepMAF6` has the slightly stronger upper condition `i+1≤j+h+2` needed to apply the inherited scaled core identity at both columns. It gives `Hden(i,h)K(i+1,h)=Hnum(j,i,h)K(i,h)`. `lower_core_diagonalMAF6`, under `h+2≤i≤j+h+2`, repackages the inherited exact diagonal recurrence as `Dden(j,i,h)K(i+1,h+1)=Dnum(j,i,h)K(i,h)`.

`product_transferMAF6` is a purely algebraic identity from `aM=bL` and `cR=dN`. The comparisons use it to multiply the desired gap by two positive denominator polynomials. Each factor's strict positivity is proved from the support inequalities. The proof never divides or cancels `K`, a binomial weight, a coefficient or a possibly zero total mass.

For `k≤h`, `lower_core_orderedMAF6` assumes `h+2≤i` and `i≤j+k`. The horizontal scalar gap is instantiated with nonnegative integer parameters `k`, `h-k`, `i-h-2`, `j-i+k`. The stored exact expansion has 155 listed terms; its equality is checked by Lean `ring` and sign by `positivity`. For `h+2≤k`, `lower_core_separatedMAF6` assumes `k≤i` and `i≤j+h+2`; its diagonal gap uses parameters `h`, `k-h-2`, `i-k`, `j-i+h+2`. The second stored expansion has 115 listed terms, again with a kernel-checked algebraic identity and sign proof. These term counts are static list counts. The audit did not expand or numerically evaluate either polynomial. The Python certificate/generator files are historical construction artifacts, not logical premises.

`choose_inwardMAF6` proves `C(n,h)C(n,k)≤C(n,h+1)C(n,k-1)` for all natural `n,h,k` with `h<k`. If `k>n`, the left product is zero and the right is nonnegative. Otherwise natural differences are guarded, a scaled exact gap identity is derived from choose recurrences, and only the strictly positive scalar `(h+1)k` is cancelled. This includes zero tails and avoids requiring strictly positive binomial weights.

**Global shifted comparison.** `lower_term_shiftedMAF6` holds for every natural `j,d,i,h,k` with the single hypothesis `2≤j`:

`T(i,h) T(i+2,k) ≤ T(i+1,min(h+1,k)) T(i+1,max(h+1,k)-1)`.

The proof first handles either left factor equal to zero by nonnegativity. With both nonzero, support supplies all bounds needed in three exhaustive cases. For `k≤h`, min/max give columns `k,h` and the ordered core inequality is multiplied by unchanged nonnegative weights. For `k=h+1`, the inherited adjacent local comparison applies; this is the branch retaining `j≥2`. For `k≥h+2`, the separated core comparison is followed by the inward binomial-weight inequality. The max-minus-one index is justified by the shifted `h+1`; no negative index is reinterpreted as a natural zero.

This theorem is genuinely stronger than the previous adjacent `h,h+1` statement, but it is a **shifted min/max** comparison. It is not a proof of the former arbitrary `h,k` floor/ceiling midpoint candidate. The proof's summation implication is established separately and exactly for this new condition.

**Finite four-functions bridge and imported theorem.** `shifted_sumMAF6` is a generic theorem for `a,b,c:ℕ→ℤ`, nonnegative at every natural index, and natural `n`. It assumes `b(n+1)=c(n+1)=0` and the all-index shifted pair inequality. It concludes `(Σ₀ⁿ a)(Σ₀ⁿ c)≤(Σ₀ⁿ b)^2`.

The exact imported theorem `four_functions_theorem_univ` in the pinned local Mathlib file has finite distributive-lattice domain and ordered-semiring codomain, requires four nonnegative functions and `f₁(x)f₂(y)≤f₃(x⊓y)f₄(x⊔y)`, and bounds the product of their finite sums. The new instantiation is the finite chain `Fin(n+2)` and codomain `ℤ`; those typeclass conditions fit. It defines `f₁=padShift(a)`, `f₂=c`, `f₃=b`, `f₄=padShift(b)`, where padding is zero at index zero and otherwise shifts down by one.

For `x=0`, the left product is zero and the right is nonnegative. For `x>0`, the proof establishes `max(x,y)≠0` and `(x-1)+1=x`; the supplied shifted inequality is exactly the required meet/join comparison. `Fin.sum_univ_eq_sum_range` and `sum_padShiftMAF6` then identify the padded sums. The terminal zeros remove the extra `b(n+1)` and `c(n+1)` entries. No assumption on `a(n+1)` is needed because the padded `a` sum already ends at `a(n)`. There are no infinite sums, no monotonicity or positive-mass assumption, and no unproved external midpoint theorem.

For the application, `n=2d`, nonnegativity is inherited, both terminal zeros follow from `lower_term_highMAF6`, and the global shifted theorem supplies every pair comparison. The common term-sum identity gives the desired `D` inequality. `d=0` is included by the same finite argument. The exact named Mathlib source and object are hash-bound in the supplements; the imported theorem body is an ordinary compiled dependency, not a newly replayed Mathlib proof or a fresh whole-library rebuild. No external literature search was performed by this audit.

**Root equivalence and strict added coverage.** `root_iff_interiorMAF6` proves `Conjecture63 ↔ InteriorCore63MAF6` via the inherited worker-142 root iff. Static comparison of the full residual definitions is exact after replacing only the definition name and the horizontal exclusion

`¬(a=2 ∧ b=2*j+1)` by `¬(a=2 ∧ 2*j+1≤b)`.

The horizontal clause still requires all three original polygon guards, `i+j+4≤a+b-1`, `j≥5`, and failure of the earlier middle, pair/variance and sharp sufficient regions. The vertical clause is textually unchanged: original three polygon guards, total bound `i+j+4≤a+b-1`, `i≥4`, `j≥3`, and its older-region exclusions. The diagonal clause is textually unchanged at literal indices `(i,j+2),(i+1,j+1),(i+2,j)`, with `i+j+8≤a+b-1`, `a+5≤i+j+2`, `a+2≤b` and the old diagonal exclusions. The `a≥2` restriction and endpoint handling are inherited through the exact earlier equivalence. Reverse-factor conditions have not been dropped. In the reverse implication the proof splits the enlarged lower-half case and invokes the new unconditional source theorem; otherwise it uses the new residual clause. Neither residual proposition is proved.

For each natural `n`, `lower_previous_guardsMAF6` uses `lowerPathM58E (n+5) 1`, whose labels are `a=2,b=2n+13`. At row `j=n+5` and columns `3,4,5`, it proves all three polygon guards, the prior total/row bounds, failure of all old middle, pair, variance and sharp criteria, and failure of the former central equality `b=2j+1`. `lower_gain_rawMAF6` proves the corresponding raw horizontal inequality. The source row is one below its central row, at unbounded depth; no finite experiment supplies these guard or inequality proofs. This is strict new coverage beyond worker 142's full central row and all earlier residual exclusions, not merely a restatement of an already removed region.

**Alternative upper-row decomposition and obstruction.** `fib_coeff_allMAF6` packages an all-natural-index coefficient formula. At `i=0` it uses the exact zero-jet monomial coefficient. For `i>0,j<n` it uses inherited `fib_globalM6E1`; for `j≥n` the total-degree zero theorem applies. The definition retains its conditional branches instead of extending a below-degree choose expression through natural underflow.

`squareSummandMAF6 q j i h` allocates column degree `h` to the first Fibonacci factor. It is explicitly zero for `h>i`, and its second square contribution is explicitly zero for `j=0`. `fib_square_sumMAF6` follows from the finite bivariate product coefficient formula and sum interchange. `square_summand_formulaMAF6` proves the exact sum-of-squares coefficient identity for all natural `q,i,j`, with row zero and successor row treated separately. Its existence does not imply the shifted summand condition.

`square_summand_failsMAF6` proves the strict reverse shifted inequality at `q=7,j=8,i=1,h=0,k=1`: the middle product is smaller than the outer product. The saved experiment reports outer 3306 and middle 3263; the theorem states and proves the strict inequality without assuming those reported values. `square_obstruction_sourceMAF6` separately identifies the actual path `lowerPathM58E 7 0`, proves its labels `2/15`, proves polygon membership at `(1,8),(2,8),(3,8)`, proves raw values `4,277,3378`, and proves the raw log-concavity inequality there. These are literal raw indices, not the summand indices. The auditor did not recompute any value. Row eight is outside the lower-half theorem for this source. This refutes one sufficient summand strategy, not the source inequality or the root conjecture.

**Finite domains and limits.** The finite-domain supplement records full loop-derived index domains and hashes. All counts below are static enumeration of input ranges and guards; coefficient values, signs, zeros, failures and root counts are retained observations, not rerun experiments.

The final experiment compares 241 coprime source fractions with `2≤b≤28`. Its numerator-two loop uses `q=1..50`, all `j=0..q` (1,325 rows), coefficients at `i=0..2q+5` and triples starting `i=0..2q+3`: 96,350 identities and 93,700 triples. The saved count of 28,725 zero-containing triples is not independently recomputed. Global shifted tests use `j=2..25,d=0..10`, starts `i=0..j+2d+4` and each `h,k=0..2d+1`: 1,637,856 comparisons. The saved 1,239,452 zero-sided comparisons are not recomputed. Core tests use `j=0..24,i=2..29,h=0..i-2,k=0..i`; filtering by the displayed ordered/separated guards gives respectively 39,100 and 46,800 comparisons. The experiment uses assertions; its `failures` list is initialized empty and never appended. The saved row-one obstruction remains a sufficient-condition failure, with source row one already proved by the inherited theorem.

The early midpoint/mixed probe has 208,131 positions per predicate, from `j=2..15,d=0..8,i=2..j+2d+3,h≤min(2d,i-2),k≤min(2d,i)`. Its two failure lists are each capped at ten. Saved lack of midpoint failures is finite evidence only; the formally proved new comparison is the distinct shifted condition. The one-off shifted probe at event 40 has 592,135 positions (`j=2..24,d=0..9,i=2..j+2d+2`, same h/k support bounds), with a failure-list cap of twelve.

The alternate square-summand script uses `q=1..15,j=0..2q+2,i=0..2q+2,h=0..i,k=0..i+2`, split into lower `j≤q` and upper `j>q`. The counts are 851,062 lower and 916,772 upper comparisons, with ten saved failures per side at most. Lower failures here do not contradict lower raw LC or the different `lowerTerm` theorem. The formal upper obstruction is one separately certified sample.

Both Sturm scripts examine 525 numerator-two upper rows (`q=1..30,j=q+1..2q+2`) and 179 coprime sources with denominators through 24. Their general-source row range gives 2,856 candidate rows, equal to the saved count after the script's nonzero-row filter; that equality is a domain/record comparison, not a recomputation of nonzeroness. V1 appends all numerator-two distinct-root deficits, already 46 entries, then allows general additions only while the shared list has fewer than twenty entries, so the final list is not an enumeration of general failures. V2 caps its sample list at twenty and separately records squarefree-deficit totals 46 and 1,298. Distinct-root deficits alone do not establish non-real-rootedness when repeated roots occur. The reported squarefree degree-seven/five-negative-root example at `2/15` remains an unformalized exact-rational experiment; no root count was recomputed, and real-rootedness failure is not a raw LC counterexample.

Other saved one-offs print 25 upper rows and 80 coefficient positions for `q=1..5`, one cubic-discriminant evaluation, and six weighted coefficient comparisons on one row. These are neither universal assertions nor separately formalized results. The scalar-certificate record contains 155 and 115 listed terms whose generated Lean right-hand-side strings literally match the final source; no polynomial expansion was rerun.

Exact saved event bindings are: probe event 33, shifted one-off event 40, scalar summary on the first output line of event 52, final experiment event 118, Sturm V1 event 136, square-summand event 144, and the printed V2 projection at event 155. The V2 print deliberately omits examples and deficit sample arrays; the archive retains those arrays, so equality is correctly asserted only for the printed projection. These scripts and results do not contain an internal complete input-hash map or experiment-bindings record. Static source/result hashes and output equality do not establish invocation-time runtime identity or authenticate transitive external imports. The inherited raw/source helper and scan source are separately hash-bound.

**Compilation, selection and axiom coverage.** The saved compiler history contains seventeen numbered receipts and seventeen matching pre-invocation source snapshots: twelve successful builds and five return-code-1 failures, no timeout. The successes are the ten final mathematical modules plus two generated Audit modules. There is no superseded successful mathematical source, newly unbuilt or compiled-only module, definition-only accepted remainder, snapshot-only invocation or unsuccessful replay. The final inventory comprises thirteen Lean sources (ten mathematics, two Audits, one driver) and twelve objects (mathematics and Audits).

The first successful replay `replay-1792159454389922000.json` selects nine modules, 22 theorem declarations and eight definitions: 30 explicit guarded declarations. It omits the subsequently added `SquareObstruction`. Its paired Audit prints those 22 closures. The final successful replay `replay-1792159943259941000.json` selects all ten modules, 27 theorem declarations and ten definitions: 37 explicit guarded declarations. The final Audit prints all 27. The nine earlier source maps equal their corresponding final source bytes; the later result expands the selected inventory rather than replacing those proofs. Both batches are retained, and final validation points to the second replay and second axiom record.

There are 49 printed rows across the two Audits, but only 27 distinct theorem closures. Of the final closures, 24 use `{propext, Classical.choice, Quot.sound}`; `lower_aux_stepMAF6` and `lower_term_supportMAF6` use `{propext, Quot.sound}`; `lower_term_highMAF6` uses only `{propext}`. All are permitted. The ten definitions participate in replay without theorem-print rows. Audit source/snapshot, requested theorem names, imported source maps, stdout and axiom JSON agree independently. The final exact module-list SHA is `b92b76ef6da3a573a49d93e63353d174a6b84ec5d599a11c9d5455b142aba036`.

All final source hashes agree across archive/current bytes, successful build receipt/snapshot and relevant replay/Audit maps. Final objects agree across validation, controller changes, manifest, archive and current counterparts. Every final current dependency build precedes its dependent final build and relevant replay/Audit. The immutable snapshot is a pre-invocation observation, while the compiler command targets a mutable research source path; matching receipts do not continuously attest the file during execution. No same-module build overlap or final dependency-order defect is found.

**Rejected versions.** The five failed build identifiers and modules are:

| Build identifier | Module | Recorded failure |
| --- | --- | --- |
| `1792158773899786000` | ShiftedSum | Conditional/finite-index simplification and sum rewriting |
| `1792158991167937000` | OffsetScalar | Maximum recursion depth |
| `1792159084428303000` | OffsetWeights | Tactic layout and unsolved goal |
| `1792159228573112000` | OffsetGlobal | Parser error in proof body |
| `1792159863399128000` | SquareObstruction | Unclosed numerical normalization goals |

All retain the final explicit declaration inventory and normalized theorem headers. None equals final source bytes. The Global unspaced inequality repair is inside the proof body; it is not a changed theorem hypothesis, and whitespace normalization is not asserted to establish equality of invalid whole parsed sources. The scalar correction adds `maxRecDepth 10000` and disables unused-simp-argument lint output, leaving `maxHeartbeats 4000000` and other source bytes unchanged. Its failure was Lean recursion-depth exhaustion with return code 1, not a wrapper timeout. The final SquareObstruction adds `Nat.choose_two_right` to ordinary `norm_num` simplification lists. These elaboration and proof-body repairs do not change the replay core or axiom policy. Failed diagnostics are not counterexamples or proof admissions.

**Checker semantics and ordinary compiled-import limits.** The driver SHA is `586a6f0769d2a9a56abd125f17d593a61eebcfa807d0500a2273ad7801776f4e`. The driver and validation/Audit wrappers are exact worker-143 request/suffix retags. Normalization preserves the original Wide replay body. Retained commands identify Lean 4.32.2, one compiler job, replay stack 131072, a joined task and propagated result. Both replays and both Audits have 180-second bounds. No checker-core or failure-propagation bypass is present.

The checker gathers selected module-data constants, removes selected modules from its direct-import union, creates the inherited environment and invokes ordinary `env.replay`. Its isolation predicate covers collected `MathGKM.Markov.*MAF6` names, rejecting pre-imported, unsafe or partial selected names. All 30 first-stage and 37 final explicit declarations satisfy the predicate and are absent from the corresponding base, with no duplicates or collisions. Generated/private/equational and inherited constants outside that predicate retain ordinary replay handling; the additional guard is not blanket isolation for every generated name.

The wrapper records selected-source hashes before invocation, checker source hash after replay returns, and Audit source maps after compilation. These are matching retained observations, not invocation-start executable authentication or a proof of continuous source immutability. We did not decode every compiled module-data part, rebuild inherited sources, freshly replay inherited bodies, or authenticate external Lean/Mathlib executables. In particular, selected-body replay does not turn every imported compiled proof into a fresh replay result.

**Import boundary depends on the endpoint.** Both joint replay bases contain 2,438 inherited local modules and no selected current module. The eight explicit imports are `MarkovHorizontalLCB46`, `MarkovOffsetMixedM58E`, `MarkovOffsetObstructionM58E`, `MarkovOffsetTermM58E`, `MarkovResidualM6E1`, `MathGKM.MarkovBoundary`, `Mathlib`, and `Mathlib.Combinatorics.SetFamily.FourFunctions`. Implicit `Init` makes nine direct imports, matching receipts. The final local mathematics closure is 2,448 nodes, ten new plus 2,438 inherited; including the two distinct Audit nodes gives 2,450. External library trees and the operational checker are excluded from these local counts. The 145 inherited path entries behind the current directory are a path-list length, not inspection of active worker 145.

| New endpoint | Local nodes | Current / inherited | Current theorems / definitions | Old 212 imported |
| --- | ---: | ---: | ---: | ---: |
| LowerLC | 69 | 7 / 62 | 19 / 7 | 0 |
| SquareObstruction | 70 | 8 / 62 | 24 / 9 | 0 |
| Residual | 2,446 | 8 / 2,438 | 20 / 8 | 212 |
| LowerGain | 2,447 | 9 / 2,438 | 22 / 8 | 212 |

The standalone lower-row source theorem and separate square-summand/source witness therefore depend on the smaller 62-module local compiled base, containing none of the old worker-121 pending or historically accepted modules. The full-root equivalence imports the inherited `ResidualM6E1` chain and brings in the large historical branch; Gain imports that new residual. The joint replays include that branch because Residual is selected. No current endpoint reaches all ten modules by itself. These dependency facts distinguish standalone mathematical scope from the full-root reduction's inherited trust boundary without promoting either to a fresh whole-source verification.

All 2,438 inherited local source/object pairs have exact archived/sealed expectations: 53 worker-143 inherited bindings, nine accepted worker-143 modules, 2,371 additional worker-142 inherited bindings, and five additional accepted worker-142 modules. Every pair matches before-144 and current hashes with no fallback; the independent current-pair observation ran 14:22:12.041923–14:22:40.033627 UTC. All nine worker-143 accepted modules are imported, including its final six-theorem Obstruction version. Seven accepted worker-142 modules are imported in total because two already occur in the worker-143 base; CentralSupport and CentralGain are omitted. Relative to the worker-142 inherited base, CentralWitnessM3A1 is omitted. Five accepted worker-141 modules are inherited; CentralLinear and CentralWitness are absent. No accepted worker-140 module is imported. The supplements record precise membership for earlier rounds; identities do not confer new proof credit.

All **212 old worker-121 compiled-but-unreplayed modules**, including the 195-module subset, are imported again through the residual chain in both joint bases, together with 19 historically accepted modules. **Zero old-121 modules are newly built, selected or recovered.** The global 212-body backlog persists. Worker 143's zero-import observation was correct for that round's smaller base and remains unchanged. The 23 old worker-134 bodies recovered in worker 135 are inherited with that provenance, without new recovery. HighCone2GapM81F, old unbuilt drafts, FallingGapMF25, SourceFallingMF25 and failed SmoothProbe remain excluded; accepted HighCone2GapMF25 is a distinct imported worker-135 replacement and does not upgrade the old excluded source. No prior timeout, compiled-only version, late failed receipt or missing replay is upgraded.

**External FourFunctions provenance.** The named local Mathlib source has 21,570 bytes and SHA `5c04314cd29a91ef8f7535695c66a2291ffcf35f597efc2f1918997b4b32bfb4`. Its exact path is `/Users/sasha/collatz/Novikov_Collatz_Path_Complexes/formal/.lake/packages/mathlib/Mathlib/Combinatorics/SetFamily/FourFunctions.lean`. The first and only existing exact object candidate along the recorded current/inherited search path is at index 46, counting the current directory as index zero: the corresponding `.lake/build/lib/lean/Mathlib/Combinatorics/SetFamily/FourFunctions.olean`, 110,088 bytes, SHA `30551731d54c7cc20010805f41eadb8d77abd6257cb0c77f18088486b97d8434`.

These external files are absent from before-144 and the initial local preservation inventory and outside the 2,438 pair count. Their exact current bytes/path are observed and included in final method stability. This is not a retained invocation-time library association, proof of that object's production from that source, independent library binary authentication or fresh Mathlib theorem replay. The precise source statement's fit, assessed above, is separate from compiled-object provenance. Nothing in the audit edits this external workspace.

**Archive/index/preservation and schema.** All 96 controller artifacts agree with archived/current bytes. All 94 manifest entries agree; manifest.json and last-verification.json are the two unindexed controller artifacts. Artifact composition is twelve `.olean`, 36 JSON, 30 Lean, one text, eleven Python and six Markdown files. The 30 Lean files are thirteen final sources and seventeen snapshots. All 6,158 initial entries are preserved without exclusions, including the unchanged own setup file and 158 Python caches. This is a snapshot count, not a claim that every entry predates the request. Source/configuration preservation and inherited-object binding are separate checks.

Reconciliation uses worker 143's 87-entry index. Separate retained-effect checking covers all 177 artifacts from workers 136/137/143, respectively 88, zero and 89. Archive/current/controller/before pins agree. Receipt projections omit only `changes`, checked separately, and preserve the last two events. Worker 136 remains timeout/null report, 137 remains stopped with zero changes, and 143 remains completed. No actor or cause of the historical stop is inferred and no possibly completed mutation is rerun.

The six fixed administrative contents in `inherited-decoded.txt` match their prior verified pins; the text hash remains `1e9fde32371a82cc66e7e8464729347abc433b5ced5eb8a68aadd9a792232285`. There is no before-144 identity for inherited.json. This audit does not read the current inherited index or infer its invocation-time identity from the decoded text. The old worker-134 late failed Audit receipt `build-1792141544717794000.json`, hash `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, remains before-144-pinned and equal to the separately preserved failure, outside the initial/index inventories. It does not establish a successful old replay or axiom print.

Raw validation retains top-level `replay`, `axioms`, `theorem_closures`, `status` and `limits`; each module has source/object hashes and `build_receipts`. It contains no per-module theorem-name list or completion field. The audit's compatibility projection is labeled: it independently derives names/paths and distributes the top-level records for comparison without rewriting raw evidence. Null mathematical completion is taken from the actual final-check/report records.

The finalizer, SHA `90e04977ebd9dea1249b774b1e6aa99e4143902fe25067e7b81fad721d7a7791`, is the prior retag with only the literal ten-module list replaced. It selects successful matching-source build receipts, records final object hashes and requires exact equality of the whole ten-source map for replay and axiom records. The earlier nine-module records cannot satisfy that final predicate. It does not separately verify every theorem's membership, reparse permitted axiom sets, bind axiom JSON to stdout, enforce an expected checker identity or authenticate executables/imported binaries. Independent retained-record comparisons supply the actual membership/maps/stdout/axiom bindings here.

Its lexical admission check lists `sorry`, `admit`, `axiom`, `native_decide`; unsafe/partial are separately addressed by the replay guard and source inspection. A fixed-list finalizer success alone would not establish exhaustive archived mathematical coverage; separate source enumeration does. Validation is written before initial preservation assertions. Root/canonical contract and initial preservation are asserted, but terminal manifest/prior mismatch lists are recorded without asserting emptiness; the saved lists are empty and independent hashes agree. The broad absent-initial-or-request-tag research selector is audited only on its actual completed output. Historical STOP=false is recorded, not asserted or described as current state.

There is one finalizer invocation, events 177–178, with return code zero, 94 indexed artifacts, ten modules, 27 closures and 6,158 preserved inputs. It does not rerun compilation, replay, experiments or axiom printing. The verifier records counts, manifest hash, empty mismatch lists and null completion without echoing root/contract hashes; final-check binds those targets and has no `finished_utc`. No report.json draft exists. Delivered structured event 179 equals final.json and the controller report; event 180 is turn.completed. No missing final project check was executed by an auditor.

**Chronology and deadline.** All times are UTC on 2026-10-16.

| Retained milestone | Time |
| --- | --- |
| Controller start | 13:48:32.671173 |
| First replay start | 14:04:14.389922 |
| First Audit start | 14:04:15.545259 |
| First replay finish estimate | 14:04:30.636135 |
| First Audit finish estimate | 14:04:30.714893 |
| Last final mathematical build finish estimate | 14:12:05.845817 |
| Final replay start | 14:12:23.259941 |
| Final Audit start | 14:12:23.262234 |
| Final Audit finish estimate | 14:12:37.125827 |
| Final replay finish estimate | 14:12:37.511567 |
| Final checkpoint project mtime | 14:15:26.157704 |
| Mathematical module-list project mtime | 14:15:26.226745 |
| Validation project mtime | 14:15:26.241668 |
| Final-check project mtime | 14:15:27.071696 |
| Manifest project mtime | 14:15:27.146729 |
| Verifier project mtime | 14:15:27.272516 |
| Event-log mtime | 14:16:03.391514 |
| Activity heartbeat content | 14:16:04.604366 |
| final.json mtime | 14:16:05.052823 |
| Archived verifier copy mtime | 14:16:38.407113 |
| Controller host finish | 14:16:38.437276 |
| Nominal deadline | 14:18:32.671173 |

Recorded elapsed is 1,685.7661037445068 seconds; stored finish minus start is 1,685.7661027908325 seconds, differing by 0.00000095367431640625 seconds. They are preserved rather than described as exactly equal. The host finish is 114.233897 seconds before deadline. The final replay/Audit estimates precede deadline by 355.159606/355.545346 seconds, verifier write by 185.398658 seconds, and final.json by 147.618350 seconds. No indexed project artifact is observed after deadline or host finish. This is an ordinary completed turn, with no timeout promotion or late-report completion claim.

The first Audit starts 1.155337 seconds after replay and finishes 0.078758 seconds after it. The final Audit starts 0.002293 seconds after replay but finishes 0.385739 seconds before it. Both pairs overlap. Thus axiom-print completion does not establish replay completion at the same moment; the finalizer follows both successes. Receipt finish estimates add monotonic durations to filename epochs and are not independent wall-clock exit observations. Event-log mtime is not an individually timestamped final event; archive-copy time is not the verifier's original write. Heartbeat content is distinct from activity-file mtime.

All 84 started items match completed items in the 180-event log. Its 433,053 bytes plus empty stderr agree with activity accounting; heartbeat content follows event-log mtime by 1.212852 seconds. This is saved-record accounting, not a fresh process census or independent verification that all foreground processes ended.

Fixed root SHA is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract SHA is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII canonical contract SHA is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. The parsed request agrees with the canonical target; raw serialization and canonical hashing are kept distinct. Manifest SHA is `70a38282178a25d1a2f3fcdbda0016a600074ee1475cc31281a85353c42c3b68`, verifier SHA `ebb8f6f9cf5c7d964b3fadbaff947d3d3f3bd8463cf056ddbb17dbfce2603f25`, and final.json SHA `aabc058fe3b1c0fdbc2c5ecc698691b57250fd62b4516c46960ff1da1d993476`.


**Final static observation boundary.** The retained-method reviewer rehashed all 111 exact recorded method inputs, including the named external FourFunctions source/object, from **14:30:30.012185 to 14:30:30.097126 UTC**. All were unchanged. The retained-validation reviewer rehashed all 9,172 recorded archive/controller/current and exact named prior/source-object inputs from **14:32:12.863743 to 14:32:49.341808 UTC**. All were unchanged. The completed-request archive/current exact-tag late-file observation at **14:32:49.355787 UTC** found no extra or missing file. **No separate late-evidence bundle or missing preservation file is required.** These are bounded observations; they do not assert an indefinitely unchanged project.

All subsequent review and sealing uses audit files only, without extending those project observation windows. The independently observed 2,438 inherited-pair identities, 35 shared method fields, all ten new source inventories and 77 named prior-source comparisons agree. Of the 77 older comparisons, 59 occur in the accepted closure and 18 are comparison-only; none is credited as newly replayed. All eight result-record hashes and the exact FourFunctions source/object hashes agree. Twelve validation and 26 method audit-directory input hashes remained unchanged through the final observations.

One pre-seal validation metadata correction renamed mistakenly retagged prior144 keys to prior143; the compared paths were worker000143 throughout. Draft wording was also clarified to distinguish excluded HighCone2GapM81F from imported accepted HighCone2GapMF25, and table spacing was corrected. These changes preceded final stability, altered no project record or historical outcome, and require no rewriting of earlier seals. There are no post-observation support corrections. Historical storage clone operations on older retained copies remain content-preserving operational provenance, not proof execution or validation upgrades; this audit binds content hashes rather than relying on inode/ctime.

The retained evidence establishes universal raw lower-horizontal numerator-two LC and its exact residual reduction, within the stated inherited compiled-body/library trust boundaries. Upper-row certificate failure is not a source or root counterexample. The full conjecture remains open; the old 212 replay backlog remains unrecovered. Earlier worker outcomes and seals remain final.

**Supporting audit artifacts.** All seven files below are under `/private/tmp/math_gkm_godel_20261013/`; the separate integrity file binds this complete main report and these supports. Static helper `static_audit_worker144.py` is 17,613 bytes, SHA `c99c9cba39d75d95231e3f3abb1cc7be00d74fed4adc90993be2b4cff59ee09f`, and was executed once successfully for static parsing/hashing/input-domain counting only.

| File | Bytes | SHA256 |
| --- | ---: | --- |
| `markov_worker_000144_mathematical_source_hashes.json` | 45,186 | `346558c4cfe02cbcaa04ceb57f32372088b1a852c85e4264405d9ede1d66ece1` |
| `markov_worker_000144_source_structure_audit.json` | 20,329 | `6ae45255a8fed424cab909b0092585fb7145b6b888afb19d0914c3f9d48b9aa4` |
| `markov_worker_000144_finite_domain_audit.json` | 592,771 | `99e865287006f3e1119f81063859195ae9f1fa8cf87cfbb579e61592366f9b57` |
| `markov_worker_000144_validation_audit.md` | 26,027 | `9f6194da1c9b5df6a0332d72106f6631b31def43fa01e05031fe58bd4411bb33` |
| `markov_worker_000144_validation_evidence.json` | 6,651,051 | `098ca27605865345efb8a8dbe69e83e241baacbc0a99bfa23acc381ebb8ef700` |
| `markov_worker_000144_replay_method.md` | 21,115 | `bbaebe5ceedcfe893158abbd1a8c468db715c54ed3871715a2cf919f5a82a772` |
| `markov_worker_000144_replay_method_evidence.json` | 8,866,714 | `213869811288e4f48337cfbb4f57fbd5244af6cc6ef7bfc894818d394dfb33ef` |
