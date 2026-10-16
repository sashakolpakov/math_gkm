# Closed partial worker 000156: independent static monitoring audit

Request `e9cdd527ea604fdcb514caecc8cc9944`. The controller records **TIMEOUT, return code 0, null report**, elapsed **1,871.5095708370209 seconds**. This status remains historical and is not upgraded by source prose, successful individual checks or later reconciliation. This audit covers the completed archive `/Users/sasha/math_gkm/.control/markov/workers/000156/artifacts`, its completed controller records and explicitly named inherited/current counterparts. Active worker 157 is excluded; earlier seals and observation windows remain final.

**Finding:** all 12 final mathematical modules compiled, containing **44 theorems and 16 definitions**. An earlier successful replay covers seven matching final modules, **30 theorems and nine definitions**, including the new numerator-three source bridge, strict lower fourth-column inequality and exact residual reduction. The other five modules are compiled-only. The final combined 12-module replay and its Audit both timed out. **No theorem-print/axiom closure coverage is retained for any of the 44 theorems**, and no module meets the full compilation + replay + explicit closure acceptance standard. No finalizer invocation, validation manifest, final preservation outputs or delivered report is retained.

The main partial mathematical progress is precise: for every actual numerator-three source, write b=3q+1 or b=3q+2 with q≥1. The saved, locally compiled and early-replayed source theorem identifies the raw coefficient at `(4,j)` for every natural j≤q, including j=q. It proves **strict vertical LC at `(4,j),(4,j+1),(4,j+2)` whenever j+2≤q**. Its exact root reduction leaves both remaining predicates unproved. The later uniform kernel representation and conditional transfer have compilation only; their shape hypotheses remain unproved. This is partial checked progress, not a fully completed worker validation or a proof of the full root. The strongest earlier fully audited broad milestone remains worker 152: all three raw directions, all natural indices and zeros, for every actual numerator-two source.

This was a static audit only. No project program, compiler, proof, checker, replay, finalizer, experiment, generator, GAP operation or mathematical-value computation was executed. Own Python parsed saved text, hashed bytes, compared literal tokens and counted input indices. It did not compute source coefficients, binomial values, recurrences, products, gaps, signs or experimental outcomes. No project/source/machinery edits, proposer contact or research assistance occurred. Only audit files under `/private/tmp/math_gkm_godel_20261013` were written.

## Mathematical scope of the retained versions

All 12 final mathematical sources, six prose documents and six scripts were read. The final source inventory is:

| Module suffix ME9C | Theorems | Definitions | Retained validation |
| --- | ---: | ---: | --- |
| LowDifference | 7 | 3 | Compiled and early replay passed; unprinted |
| LowForce | 4 | 3 | Compiled and early replay passed; unprinted |
| LowSolutions | 4 | 2 | Compiled and early replay passed; unprinted |
| LowSource | 6 | 0 | Compiled and early replay passed; unprinted |
| LowLC | 4 | 0 | Compiled and early replay passed; unprinted |
| LowResidual | 3 | 1 | Compiled and early replay passed; unprinted |
| LowLimit | 2 | 0 | Compiled and early replay passed; unprinted |
| LowKernelLimit | 2 | 1 | Compiled-only; unprinted |
| LowerUniform | 5 | 3 | Compiled-only; unprinted |
| LowerShape | 3 | 1 | Compiled-only; unprinted |
| LowerReduction | 2 | 2 | Compiled-only; unprinted |
| LowerDomain | 2 | 0 | Compiled-only; unprinted |

These are **60 explicit declarations**, including 39 in the successful earlier replay and 21 in the later compiled-only group. The failed Audit source and replay driver are machinery, not further mathematical modules. No final mathematical source is unbuilt. No selected final source contains a literal new axiom, admission, `sorry`, `native_decide`, unsafe or partial declaration. That source inspection does not replace the missing theorem-closure prints or replay of the five later modules.

### Actual sources, exact low differences and natural zeros

The inherited exhaustive classification remains `false^n ++ [true,r]`, with q=n+1≥1. The true family has numerator/denominator 3/(3q+1), the false family 3/(3q+2). Every actual numerator-three path and every reduced denominator residue are included; there is no denominator ceiling, ratio/run restriction or additional shape premise. Generic q=0 statements are auxiliary algebraic extensions, not actual numerator-three paths.

`fib_raw_extendedME9C` assumes j<n and expresses the positive-column coefficient at `(i+1,j)` as

`C(n−j−1,i) * C(i+1+j,i+1)`.

It does **not** assume i+1+j≤n. If that degree condition fails, the binomial `choose_eq_zero` branch matches the inherited raw zero. The j<n hypothesis controls natural subtraction and later rational casts. The separate column-zero definition is not replaced by this positive-column formula.

For `fibDeltaME9C(n,i,j)=fibRaw(n+2,i,j)−2fibRaw(n+1,i,j)+fibRaw(n,i,j)`, the saved theorems give zero in columns 0,1,2 and, at column i+3,

`C(n−j−1,i) * C(i+3+j,i+3)`

under the same j<n guard. Pascal identities handle all high-column zero tails. Degree-three/four polynomial expressions are obtained through the exact inherited rational polynomial identity for ordinary natural binomial coefficients, not by rescaling the raw coefficient sequence. The relevant `choose_poly_natM0D3` and degree-three/four `MarkovBinomialTableM295` statements were read by explicit inherited filename and remain hash-bound compiled dependencies.

`sourceNME9C q r` is exactly 3q+1 or 3q+2, the actual denominator. For j≤q it is strictly greater than j. In the inherited signed discriminant equation, the correction shifted by `(1,q+1)` vanishes by its guard at every j≤q. Expanding S² gives the exact column-three/four forcing. The saved proof handles j=0, j=1 and j≥2 separately, so rational evaluations at x−1 or x−2 are not silently substituted for unguarded natural predecessor accesses.

### Source identification through j=q

The polygon argument proves `threeRawM9E2 q r i j=0` for actual q≥1, i≤2 and j≤q. It uses the original lower polygon inequality; it does not assume a positive coefficient or an empirical support pattern. These zeros reduce the discriminant equations at columns 3 and 4 to second differences in j.

The exact rational expressions are

`lowThree(j) = (j+1)(j+2)(j+3)(j²+4j+5)/30`,

`lowFour(n,j) = (j+1)(j+2)(j+3)(j+4) * [7(n−1)(2j²+10j+15)−j(18j²+100j+155)]/2520`.

The initial rows 0 and 1 come from the guarded source equations. `second_difference_uniqueME9C` uses the equality at row 0, equality at row 1 when 1≤q, and every recurrence step whose endpoint j+2≤q. Strong induction therefore identifies both expressions with the rational casts of the actual raw coefficients at **every natural j≤q**, including j=q. No interpolation assumption or unproved boundary extension is used. The formulas retain the original integer coefficients and do not divide by any raw entry.

`source_low_four_candidateME9C` identifies `lowFour(sourceN,j)` with the previously formalized `lowerCandidateM96A q j c`, where c=0 in the true branch and c=1 in the false branch. Thus worker 155's missing source identification is present in these retained compiled and early-replayed final sources, within its exact lower-row bound. That does not repair worker 155's earlier observation window or supply worker 156's missing closure audit.

### Strict raw vertical inequality and exact remaining predicate

`lower_candidate_strictME9C` strengthens the inherited expression inequality over the rationals. For x≥0, q≥x+2 and c≥0, the 34-term gap polynomial is strictly positive, and so is the factor `(x+2)(x+3)²(x+4)²(x+5)`. The proof uses those explicit hypotheses and the saved weighted-gap identity. It introduces no sign premise on an individual source coefficient or auxiliary denominator.

For natural j with **j+2≤q**, all three source-identification calls at j,j+1,j+2 lie within j≤q. Exact casts transfer the strict rational inequality back to the ordinary integer coefficients:

`A(4,j) * A(4,j+2) < A(4,j+1)²`.

There are no admissible starts at q=1; at q≥2 the starts are precisely 0≤j≤q−2. The actual-source adapter assumes only numerator 3 and returns its q≥1, residue and exact denominator with both the coefficient formula and inequality. This is a vertical statement at column 4, not a horizontal or diagonal statement, and it does not cover the crossing start j=q−1 or larger starts.

`ThreeRemainingME9C` retains all horizontal and constant-sum diagonal inequalities, and every vertical inequality satisfying **i≠4 or q<j+2**. The exact equivalence with `ThreeRawLCM9E2` uses the new strict result only in the complementary column-four region. Consequently

`Conjecture63 ↔ ThreeRemainingME9C ∧ OtherFourM9E2`.

Both remaining predicates are unproved. Original H indices `(i,j),(i+1,j),(i+2,j)`, V indices `(i,j),(i,j+1),(i,j+2)` and D indices `(i,j+2),(i+1,j+1),(i+2,j)` are retained. The inherited global/polygon equivalence retains outside-polygon zeros, the guards `a*b≤b*i+a*j` and `i+j≤a+b−1`, separate 0/1 and 1/1 root clauses and all larger numerators. No previously unresolved reverse-factor range is discarded.

`low_gain_unboundedME9C` chooses q=j+2 and path `threePathM9E2 (j+1) r`. For every natural j and both residues it proves exact labels, all three original polygon memberships and the strict raw comparison. This witnesses an unbounded region removed from the immediately preceding numerator-three residual. It does **not** formally assert that every witness falls outside every older sufficient criterion; some low starts were already covered by earlier strip results. No stronger historical novelty claim is inferred.

### Uniform lower representation and conditional shape transfer

The later, compiled-only `LowerUniform` defines the forcing without the shifted correction, its unique signed-discriminant solution L(n,i,j), and

`K_i(j,k) = L(i+j+k−2,i,j)`.

Restricted uniqueness compares two arrays whose discriminant actions agree at every column and every j≤q. Induction on i+j keeps each guarded predecessor in the same lower region. The resulting identity is universal in natural q,r,i,j with j≤q: `L(sourceN(q,r),i,j)=threeRaw(q,r,i,j)`. No shape or positivity assumption enters. The actual-source adapter adds the inherited q≥1 classification. The alternative K identity additionally requires the exact equation **i+j+k=sourceN+2** before eliminating natural subtraction.

`LowerShapeME9C i` has four explicit assumptions:

- strict positivity `0<K_i(j,k)` when **2j+3≤i+k**;
- LC in j when **2j+7≤i+k**;
- LC in k when **2j+3≤i+k**;
- the adjacent-minor inequality when **2j+5≤i+k**.

These premises are **all unproved**. The inherited `minor_diagonal_glueM4F4` was read by its explicit name: it uses a strictly positive pivot and nonnegative neighboring terms to cancel the pivot's square. The new theorem supplies its assumptions at the appropriate neighboring wedge points and obtains the K-antidiagonal inequality at `(j,k+2),(j+1,k+1),(j+2,k)` under 2j+7≤i+k. No unconditional kernel positivity or shape is inferred from the conditional proof.

For source V, small columns i≤2 are first handled by the exact lower-region source zeros. If i+j≤sourceN, the proof sets k=sourceN−i−j, with this guard ensuring valid natural subtraction, and maps the three source entries to those K-antidiagonal indices. The row condition j+2≤q establishes the stronger wedge bound. If i+j>sourceN, the last coefficient at `(i,j+2)` vanishes by the actual total-degree bound sourceN+2; the remaining inequality follows from a square's nonnegativity. Thus the argument does not apply a positive-kernel assumption to discarded zero tails.

Under `∀ i≥3, LowerShapeME9C i`, this proves all lower-region source V inequalities with j+2≤q. The separate exact reduction is

`Conjecture63 ↔ LowerVerticalThreeME9C ∧ OutsideLowerThreeME9C ∧ OtherFourM9E2`.

All three conjuncts remain unproved. The outside predicate retains every H/D comparison and V whenever q<j+2. The shape assumption is sufficient for the first conjunct only; it is not asserted equivalent to the whole root. This entire later assembly lacks successful retained replay and theorem prints.

### Auxiliary limitations and actual-source distinctions

The early-replayed `LowLimit` gives a concrete source-identification obstruction at actual 3/4, path `[true,true]`: raw `(4,2)` is 15, while the lower candidate at q=1,j=2 is 7. The original polygon-valid raw V triple at `(4,0),(4,1),(4,2)` is `[3,14,15]`, and its strict LC inequality is separately compiled/replayed. The example shows why the j≤q source bound matters; it is not a root counterexample.

The compiled-only naive kernel is `H_i(j,d)=threeRaw(j+d,r,i,j)`. Its minor at i=4 is proved equal to **−42 for every natural d≥1 and both residues**. The four entries involve q=d,d+1,d+1,d+2: **three distinct source polynomials**, not four distinct ones and not a single-source LC triple. The resulting negation concerns the proposed cross-source adjacent-minor property.

The compiled-only `LowerDomain` gives `K_4(3,0)=−29`, outside the proposed wedge, while the actual 3/5 raw coefficient at `(4,3)` is 35 and is original-polygon-valid. Here j=3 exceeds q=1, so the source bridge cannot identify that auxiliary entry with the actual coefficient. This is another domain obstruction, not a negative source coefficient or conjecture refutation.

That last auxiliary value is represented by 20 local equation proofs for saved literals `L(5,i,j)`, i=0..4,j=0..3. The final generator adds the numeral-binomial simplification omitted from an earlier failed table. Each final cell is checked by the saved Lean equation and earlier cells, rather than admitted as experimental output. The auditor compared the literal table and ordered dependency template with the final source text without deriving any values or running the generator. The final table has compilation only; rejected attempts and missing replay/closure coverage remain explicit.

## Finite evidence and exact input domains

The five saved experiment JSONs exactly match completed outputs at events 72, 101, 114, 126 and 167. Own counting used loop bounds and predicates only. Saved zero/sign/failure outcomes were not recomputed. All imported numerical helpers are main-guarded; the standalone boundary script and certificate generator are top-level programs but were never imported or executed by this auditor. There is no runtime-transitive input hash map or invocation-start executable authentication.

- **Lower-source probe:** q=1..100, both residues, solves columns 0..4 and rows 0..n+4. Direct comparison with the canonical frame polynomial occurs only for q≤16: **32 actual sources and 5,120 coefficient positions**. The two lower formulas at columns 3/4 and rows 0..q give **20,600 comparisons**. Lower column-four triples with j+2≤q give **9,900 comparisons**, included in the **31,200** full column-four triples with starts 0..n+2. These experiments test non-strict LC; the formal lower theorem is separately strict. Saved **1,200** zero-containing full triples and an empty failure list are retained, not regenerated. No polygon or nonzero filter is applied.
- **Outside-formula checks:** 800 candidate positions are evaluated in the same probe, but only the first 12 mismatches are stored. The list length is not a total failure count. A separate event-79 command scans all j=0..n for q=1..11, both residues, then prints only the first two mismatches per family. Its list comprehension does not stop at the first mismatch; this is overlapping exploratory evidence, not an extra universal source identity.
- **Lower-row factorization:** q=1..20, both residues and j=0..q give **460 rows**. Each raw row starts at column 3 and ends at n+2−j. The script divides by `(1+u)` exactly n−2j−1 times, totaling **12,550 division steps**, and expects a residual of length j+1. There are **3,540 residual coefficient positions** and **2,660 possible adjacent residual triples**, with 32 sample rows printed. Saved division, negative-entry and LC failure lists are empty. The row factorization and uniform residual LC remain unformalized, and these overlapping finite rows do not prove another source direction.
- **Naive shape:** i=3..24, j,d=0..20, both residues, omitting j+d=0, give **19,360 base points** and that many comparisons for each of row LC, column LC and the adjacent minor: **58,080 comparisons** total. The precomputed source range is q=1..44 for both residues. Failure lists are capped at 16 per component; retained minor failures are not a total failure count. These are cross-source shape comparisons, not root triples.
- **Alternative K shape:** i=3..24 and j,k=0..24 give **13,750 base points**. All six neighboring values are queried before filtering. Exact wedge guards yield **5,503 j-LC, 6,600 k-LC and 6,050 minor comparisons**. Separately, **6,600** wedge entries are tested for `a<0`. **This checks nonnegativity only; it does not test the strict positivity `0<K` required by `LowerShapeME9C`.** No zero tally is retained. Saved negative and inequality-failure lists are empty, without implying any uniform shape theorem. Precomputation uses n=1..76 on 25×27 arrays; this is a computation domain, not extra source coverage.
- **First tail:** q=1..200, both residues, j=q+1 and columns 2/3/4 give **1,200 proposed correction identities**. The same 400 families test the strict column-four crossing triple starting at q−1, beyond j+2≤q. Saved failures are empty, but these corrections and crossing LC are not universal theorems. The exceptional true q=1 inverse-series discussion is prose, not a completed formal bridge. The q≤100 portion overlaps earlier finite tests.
- **Generated auxiliary table:** 20 literal cells, with two generator runs at events 184 and 199 separated by the `Nat.choose` template correction at 197. Both stdout messages explicitly say the generated equations are not yet validated. Later local compilation of the final table does not backdate success to the rejected earlier version.

Neither the finite low-row factorization nor the alternative kernel experiments supply a new premise to the compiled source proofs. The literature document was read only as saved worker-authored provenance; this audit performed no external browsing, new theorem search or mathematical investigation.

## Retained compilation, partial replay and missing closure audit

The controller and archive contain **98 artifacts**: 36 Lean sources/snapshots, 12 mathematical objects, 34 JSON files, ten Python files and six Markdown files. Fourteen final Lean files comprise the 12 mathematical modules, one failed Audit source and one replay driver; the other 22 are compiler snapshots. **No manifest exists**, so 98 is an observed controller/archive inventory, not a finalized index count. All archive/current/controller hashes agree. A reconstructed audit map is explicitly separate from the absent worker-authored validation map.

There are **22 compiler attempts: 13 successes, seven return-code-1 errors and two timeouts**. The successes are the 12 final mathematical sources and one superseded successful LowDifference source. The 21 mathematical attempts include eight unsuccessful outcomes; the failed Audit is the ninth unsuccessful compiler attempt. The final replay timeout is a separate unsuccessful invocation. Every mathematical build uses a 120-second bound. Early replay uses 180 seconds; final replay and Audit use 100 each.

Successful final build suffixes, under `evidence/markov-e9cdd527/build-`, are LowDifference `1792179269040875000`, LowForce `1792179305193532000`, LowSolutions `1792179322022078000`, LowSource `1792179353807777000`, LowLC `1792179417532012000`, LowResidual `1792179591717345000`, LowLimit `1792179486424862000`, LowKernelLimit `1792179727164674000`, LowerUniform `1792180035188353000`, LowerShape `1792180092513572000`, LowerReduction `1792180210005568000` and LowerDomain `1792180465671613000`. Final source/snapshot equality and current/archive object identity are bound in the supports. Every successful final dependent build follows matching completed new dependencies.

The rejected mathematical snapshots are LowDifference `1792179059854347000`, LowForce `1792179236269751000`, LowResidual `1792179516678688000`, LowerUniform `1792179792298584000` and `1792179959049713000`, and LowerDomain `1792180093972560000`, `1792180208797685000`, `1792180355730246000`. The first LowerUniform attempt is a timeout; the others are compiler errors. The separately retained Audit snapshot `1792180597571888000` also times out. No declaration is credited merely because it appears in an unsuccessful source or a compiler reached a later statement.

The first LowerUniform snapshot has three theorems and three definitions. The final file has five theorems and three definitions, adding restricted uniqueness and the explicit lower raw equation. The definition bodies themselves are unchanged; the generic declaration-block diff also includes following local attribute commands, so a flagged lowerKernel block is not evidence that its mathematical definition changed. The final locally irreducible declarations control simplification, not the kernel checker. The successive Domain failures concern opaque recursive reduction, recursion depth and a missing numeral-binomial simplification. The final generated table is independently source-bound to its later successful build; earlier attempts remain failures.

### Successful earlier source versus final LowDifference version

The successful earlier LowDifference receipt `1792179145686128000` binds source SHA `562890b58ede9516a8d4a48e2c62f94be813ec23058414c85fe1da0f59b8e34f`. The final source SHA is `59fe100078d8cac6c32e151b2bc12015ea2aec796b7845552e34a390c2eb5060`. The entire texts agree after whitespace removal, retaining seven theorem names, three definitions and the same imports. The exact bytes differ, and only the final separately rebuilt bytes are selected by the successful replay. No separate produced-object hash for the old version is retained. This history is not conflated with the first rejected LowDifference source, which required a proof correction.

No same-module build intervals overlap, and the retained event predicate finds no completed same-source file-change item inside a build interval. That bounded observation does not authenticate every possible filesystem write or compiler read. The wrapper snapshots before invocation but compiles the live named source, not the snapshot. The receipts name output paths without independently hashing production at that instant; current/archive/controller object hashes establish preserved association, not continuous compiler-production authentication.

### Seven-module replay passes; full replay and prints fail

`replay-1792179675728967000.json` successfully selects exactly LowDifference, LowForce, LowSolutions, LowSource, LowLC, LowResidual and LowLimit. All seven source hashes equal the final saved versions. Its stdout explicitly records collection, a union over four direct inherited imports including Init, isolation of **39 mathematical constants**, and a passed replay. This supplies replay credit for the source bridge, strict lower-column theorem, first residual reduction and 3/4 range-limit example. It supplies **no explicit theorem-closure prints**.

`replay-1792180597567945000.json` requests all 12 final sources and **60 explicit declarations**, but times out. It has no successful return code or partial passed/collection output. Captured stdout/stderr are serialized as the string `None`, meaning absent captured timeout output, not a successful empty Lean response. The outer wrapper command exits 1. No partial body-validation set is inferred from this failed union request.

The generated `MarkovAudit1792180597571612000ME9C` imports all 12 modules and requests each of the 44 theorem names once. Its source matches the saved Audit snapshot, but compilation `1792180597571888000` times out with the same absent-output representation. The wrapper then fails the first missing-line assertion, `fib_raw_extendedME9C`, at event 218. **No Audit object or axiom JSON is retained; the wrapper does not reach its axiom-JSON write. Zero closure rows are observed.** Requested prints are not completed prints, and no allowed-axiom distribution is invented.

These final failures are completed outcomes in events 218–219, not still-running jobs. Missing full validation remains pending as an evidentiary obligation. No missing compiler, replay, axiom check or finalizer was executed by the auditor to repair it.

### Checker semantics and wrapper change

`ReplayIsolatedME9C.lean` has SHA `53ec7449cc77c30930383f42f2ac47b64e77f122950992681ca59261e1859ace` and is an exact predecessor suffix retag. The validator is also an exact full retag. The Audit wrapper differs from its retagged predecessor only by reducing its compilation bound from **180 to 100 seconds**, at events 205–206. The unchanged named Lean 4.32.2 executable, `-j 1` compilation, replay stack 131072 and joined replay result are retained. No new bypass is found.

The driver uses ordinary environment replay. It excludes selected modules from the direct-import base and rejects explicit collected names in `MathGKM.Markov` ending in `ME9C` if already imported or marked unsafe/partial. All final explicit names satisfy that guard. Generated/private/equational constants outside the predicate retain ordinary replay handling. Static requested-name absence is not substituted for successful full replay, and selected new-body replay does not replay the imported environment.

The checker hash is recorded after subprocess completion. Audit source maps would be recorded after a successful build, but that output is never reached here. These saved records do not authenticate invocation-start executable bytes, every object part or the source-to-object production of all imports. No fresh whole-source or library rebuild occurred.

## Inherited identities and unchanged older backlog

The successful seven-module replay uses **2,508 inherited local modules**. The final requested base contains **2,509**: the 2,503 sealed-155 inherited pairs, five accepted worker-155 modules (FibAddition, ThreeSparse, ThreeForce, LowerCandidate and ThreeSolver), plus `MarkovBinomialTableM295` from the sealed worker-151 inherited map. ThreeSolverM96A is the sole added inherited module for the later compiled-only branch. The complete final mathematical source graph has **2,521 nodes**, or **2,522** including the failed Audit. These counts do not assert a successful final replay.

The early direct inherited union is BinomialTableM295, LowerCandidateM96A, ThreeForceM96A and implicit Init: three named imports, four total. The final request additionally names KernelShapeM4F4 and ThreeSolverM96A: five named imports, six total. Direct-import counts are distinct from the transitive base. The selected current modules do not occur in those inherited bases.

All **2,509 source/object pairs** independently match before-156 and sealed-151/155 expectations during **2026-10-16 20:12:38.349082–20:13:26.667309 UTC**, without fallback or mismatch. Exact endpoint memberships and ordered candidate paths are preserved in method evidence; the additional pair-map holds the per-module identities. This is preservation of inherited identities, not a new body replay or invocation-time resolver authentication.

**Every final endpoint and the earlier successful replay base import all 212 worker-121 compiled-but-unreplayed modules**, their distinguished 195 subset and the separate 19 historically accepted modules. No old worker-121 module is a current build/replay target, and **zero of the 212 are recovered**. The five worker-156 compiled-only modules form a separate new incomplete-validation category; all 12 lack explicit closure coverage. These categories are not collapsed into the old backlog or described as completed validation.

The old 23 worker-134 recoveries retain worker-135 provenance. Failed HighCone2GapM81F stays distinct from accepted HighCone2GapMF25; historical late failed receipts and timeout statuses remain unchanged. The old worker-153 accepted and unvalidated Pell modules remain outside the current graph, as does pending worker-149 EightNewton. Reconciliation does not upgrade their statuses. Corrected worker-145 Scalar and final worker-146 Global/worker-151 DiagonalShape remain their preserved versions. Worker-155 BinomialInverse and its later convolution branch are outside the current inherited graph; their history is not silently substituted into this source bridge.

`MarkovWindowLC6d34` remains imported and is separate from the old 212. Source SHA `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object SHA `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237` match the sealed binding. Its old successful compiler/replay snapshots remain historical evidence; the old compiler receipt does not separately hash its produced object. Explicit prints cover only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`, with empty old checker stdout. No fresh inherited-body replay, production authentication or all-declaration audit is inferred.

The mathematical support compares **222 named older sources**, with **154 in the final requested inherited graph and 68 comparison-only**. These counts do not mean 222 proofs were reread or replayed. Nine qualified external source/object pairs retain their earlier identities, without a complete external import-tree reconstruction or new Mathlib validation. Parent-reported earlier COW maintenance through worker 153 remains attributed storage provenance only; it preserved content/mode/owner/mtime and changed no worker-156 proof status or earlier observation window.

## Preservation, absent finalization and historical cutoff

The initial snapshot has **6,531 entries**, including 186 `.pyc` files and the already-created own setup. Saved foreground event 216 reports all 6,531 unchanged, and the audit independently matches those named inputs. The unused finalizer would exclude setup and report **6,530 inherited inputs**; that is a planned schema split, not an observed final-check count. The 89 predecessor-155 controller/archive artifacts match their current and before-156 pins.

Reconciliation checks the prior 87-entry worker-155 manifest and preserves worker 153's 253-event log hash, last two finalizer events and prior reconciliation prose. It contains no new receipt/change-count projection or replay of predecessor effects. Six fixed administrative records match their saved bindings. The auditor does not read current `inherited.json` or claim an invocation-time identity for that index.

The copied finalizer initially carries malformed request literal `e9cdd527024045ac97c60b3c8dfb10e6`; events 174–175 correct it to the actual request. Final bytes are an exact full retag of worker 155. The complete 12-module list is written at events 201–202. **There is no finalizer invocation.** Its exact successful replay and axiom-map prerequisites are missing, and it is not run merely to demonstrate failure.

The unused script retains known limits: it would not independently authenticate the expected checker, every allowed theorem closure or executable identity; its literal filter omits `axiom`; validation would precede preservation assertions; terminal mismatch lists would be reported rather than all asserted. These are static source observations only. No stop-presence result, canonical-contract assertion, successful validation map or final manifest is attributed to that unexecuted script.

The exact retained scope has **no validation.json, axioms JSON, Audit object, final-check.json, manifest.json, last-verification.json, authored report JSON or controller final.json**. Operational prose claiming final-check/verifier records exist is unsupported. The checkpoint instead leaves final checks pending, but its referenced authoritative validation.json never appears. Event 208 still describes the last auxiliary as building after event 207 already records its success; event 217 describes combined checks running, followed by both timeout outcomes. No structured report or `turn.completed` follows. Return code 0 does not override the controller's timeout/null-report outcome.

The independently checked root SHA is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract SHA `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical contract SHA `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. These are retained target pins, not invented missing finalizer assertions or a full English/source completion certificate.

Controller times in UTC are:

- start: **2026-10-16 19:28:48.287097**;
- nominal 1,800-second deadline: **19:58:48.287097**;
- host finish: **19:59:59.796667**, **71.509570 seconds after deadline**.

Stored elapsed differs from timestamp subtraction by approximately 0.954 microseconds. No cause for the outer delay or shutdown actor is inferred. The checkpoint's rounded 19:29/19:59 prose is not the exact deadline authority.

The early successful replay runs from 19:41:15.728967 to its duration-derived finish at **19:41:40.439489**. The final replay starts **19:56:37.567945**, and Audit starts **19:56:37.571888**, just 0.003943 seconds later. Their timeout finish estimates are respectively **19:58:18.049852** and **19:58:17.942610**, **30.237245** and **30.344487 seconds before deadline**. They are completed failures before the cutoff, not pending checks rescued by host time after deadline. These finish estimates combine receipt filename epochs with stored durations; they are not an independent process trace.

The latest retained request-artifact mtime is the final replay receipt at **19:58:18.057541**. Event-log mtime is **19:58:18.068668**, 30.218429 seconds before deadline. Heartbeat content is **19:58:48.085772**, 0.201325 seconds before deadline; activity-file mtime is separately 19:58:48.086088. Host finish is 101.727999 seconds after the event-log write. No retained request artifact is observed after deadline or host finish; archive-copy metadata is not another validation run.

The stream has **219 events**, all **102 started items matched by completed items**, and no `turn.completed`. Its 396,714 bytes plus zero stderr bytes match activity accounting. This is stream evidence, not an independent process census or proof of successful task completion. The audit preserves the historical timeout, partial replay, missing closure audit and open root together.


## Final audit observation

The independent validation reviewer found all **9,433 named inputs unchanged** during **2026-10-16 20:23:29.781212–20:24:13.873264 UTC**. The method reviewer found all **159 named inputs unchanged** during **20:23:13.872922–20:23:14.039061 UTC**. Independent inherited-pair hashing covered all **2,509 source/object pairs** during **20:12:38.349082–20:13:26.667309 UTC**. These are bounded byte-preservation observations, not fresh source builds or continuous process authentication.

The final exact missing-output recheck at **20:24:13.874296 UTC** found all **13 named paths absent**, with no axiom JSON in either exact-request evidence directory. The exact-request late-file observation at **20:24:13.891817 UTC** found no extra or missing current/archive file. **No additional late-evidence bundle is required.** Project reads end at these observations. Subsequent crossreviews and the integrity seal read audit files only; they do not extend any project observation or earlier seal.

Validation and method records agree on **71 shared fields, 2,509 inherited pairs and 130 shared input hashes**. Audit-only input rechecks cover **eight validation inputs and 29 method inputs**. Both independent reviewers concur with the complete main body after two narrow provenance clarifications: the missing finalizer is its invocation, while its script is retained; Audit object/JSON absence is a retained observation and does not assert every transient process state. No substantive correction remains.

The seven supports are `markov_worker_000156_mathematical_source_hashes.json`, `markov_worker_000156_source_structure_audit.json`, `markov_worker_000156_finite_domain_audit.json`, `markov_worker_000156_validation_audit.md`, `markov_worker_000156_validation_evidence.json`, `markov_worker_000156_replay_method.md`, and `markov_worker_000156_replay_method_evidence.json`. The separate inherited map is `markov_worker_000156_inherited_pair_expectations.json`, SHA256 `f47804c985676f3cb42da38196e1352507e1df6199390059719218114085178f`. The integrity record binds all eight audit files, that pair map and the auditor's static helpers by exact bytes/hash.

Historical outcome remains **TIMEOUT / return code 0 / null report**. Successful replay of seven final-source modules and twelve local compilations are preserved; zero explicit theorem-closure prints and five modules without successful replay remain explicit limitations. The full conjecture and all stated remaining shape/residual obligations remain open. No missing check was executed, no earlier timeout upgraded, and no active successor mathematics examined.
