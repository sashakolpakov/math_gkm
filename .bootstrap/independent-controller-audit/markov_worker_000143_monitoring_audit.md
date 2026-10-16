# Completed worker 000143: independent static monitoring audit

Request `58e5700333bc4922a9949ab13f9bac6f`. This audit reads completed worker 143 archives and exact named prior/current counterparts. Active worker 144 is excluded. No project code, Lean proof, checker, replay, experiment, generator or finalizer was executed. No coefficient, binomial, polynomial, matrix, recurrence, moment or gap value was recomputed. The audit uses source reading, static declaration parsing, hashes and finite input/index-domain counts. All writes are confined to the designated temporary audit directory; no project edit, proposer contact or research assistance occurred. Prior seals and observation windows remain unchanged.

**Finding:** the formerly proposed lower-row coefficient formula is now formalized for every actual numerator-two source, including row zero, low-column zeros and all degree-tail zeros. For a = 2, b = 2(j+d) + 1, with natural j,d,i, it gives the exact ordinary raw coefficient in row j. Actual-source classification forces j+d ≥ 1. Positive support is exactly 2 ≤ i ≤ j+2d+2, equal to the original polygon section.

The new equivalence is **only for the lower-horizontal subproblem**: its polygon-guarded actual-source formulation is equivalent to an all-natural-start arithmetic inequality. Both formulations remain unproved. A separate theorem points from Conjecture63 to this subproblem, with no converse to the full root. The exact residual `InteriorCore63M6E1` is unchanged.

For j ≥ 2, a local adjacent-summand inequality is proved for every natural d,i,h, including zero cases. The arbitrary-pair floor/ceiling midpoint condition and the separate summation bridge remain unproved. For j = 1 and every positive offset d, one of those summand certificates fails; the actual 2/5 raw triple [5,16,17] is separately proved to satisfy LC. This is not a source or root refutation.

Nine final mathematical modules contain 34 theorems and nine definitions. Their final compilation, one joint replay of all 43 explicit declarations and axiom-print coverage of all 34 theorem closures agree. The controller records completed, return code 0, elapsed 1588.1232650279999 seconds and a structured final report with null mathematical completion. Full Conjecture63 and its negation remain unproved.

## Inventory and actual-source scope

| Module, with prefix Markov and suffix M58E | Theorems | Definitions | Formal scope |
|---|---:|---:|---|
| OffsetPair | 3 | 0 | Finite binomial expansion and offset coefficient-pair convolution |
| OffsetSquare | 4 | 1 | Zero-safe extension, rearrangement and square double sum |
| OffsetFormula | 3 | 0 | Triangular reindexing, square single sum and low-column zeros |
| SourceOffset | 4 | 1 | Nonnegative row expression and all-index actual-source formula |
| OffsetSupport | 4 | 0 | High-tail zero, exact positivity and polygon/source support |
| OffsetReduction | 3 | 3 | Explicit source path, proper-subproblem iff and root implication |
| OffsetTerm | 4 | 2 | Nonnegative core, scaled identity and diagonal recurrences |
| OffsetMixed | 3 | 1 | Polynomial sign, exact transfer and supported local mixed inequality |
| OffsetObstruction | 6 | 1 | Zero-extended local inequality, certificate failures and actual raw witness |

All nine final sources were read completely. Whole theorem headers were extracted through the proof assignment, retaining internal `let` binders. Independent enumeration agrees with all 34 names in the final axiom record and its source map. No admission, custom-axiom, native-evaluation, unsafe or partial token is detected in final mathematical source after block-comment removal. This lexical review supplements retained validation; it does not replace it.

The actual family is `(frame path).mid`, with a = 2 and b = 2(j+d) + 1. The inherited `source_two_squares3556` derives a natural q ≥ 1 and the identity

    m.p = fib6(q+1)² + V·fib6(q)²,    b = 2q+1.

The source adapter identifies q = j+d. Thus d is the nonnegative offset below the central row: 0 ≤ j ≤ q. Every natural source starting column i is covered by the coefficient formula, without finite denominator/depth/column bounds or an assumed coefficient identity. The old conditional product-LC theorem is not used to supply a sign hypothesis.

The inherited `fib6` coefficient formula and degree/axis bounds are recurrence-derived source facts. The new proof uses the already formalized global formula for l ≥ 1 and t < n, including total-degree zero cases. It does not assume a published or experimentally interpolated expression. Generic polynomial/row expressions also make sense at j=d=0, but this does not introduce an actual source 2/1: actual labels derive j+d ≥ 1, and the arithmetic subproblem states that restriction explicitly.

## Finite convolution, natural subtraction and the row-zero branch

OffsetPair first proves a finite Vandermonde expansion of `choose(n+d,k)` as the sum over e = 0,…,k. For l,b ≥ 1 and 0 ≤ t ≤ j, the coefficient product in `fib6(j+d+1)` can therefore be expanded over e < l and f < b. Both t and j−t are strictly below j+d+1. The bounds justify every natural-subtraction rewrite before the two choose-product identities are applied.

After summing over t = 0,…,j, the inherited shifted finite convolution gives the kernel with factors

    choose(d,e) choose(d,f)
    choose(l+b−1−f,l) choose(l+b−1−e,b)
    choose(j+l+b+1,2(l+b)−1−e−f).

The shifted-convolution hypotheses follow from e < l and f < b. This is a finite exact identity, not an infinite sum or an assumed zero extension.

OffsetSquare sets l+b=i. To extend the bounds e < l and f < i−l to e,f < i, `offset_kernel_zeroM58E` proves the added terms vanish whenever l ≤ e or i−l ≤ f, under l ≤ i and e,f < i. These conditions make the relevant choose-zero inequality valid despite truncated natural subtraction. The endpoint cases l = 0 and l = i are handled separately: the original product contains a u⁰ coefficient strictly below its sole nonzero axis degree, and the extended kernel also vanishes. No underflow-generated term is silently added at an endpoint.

For e,f < i, summing over l = 0,…,i gives a finite Vandermonde factor `choose(2i−2−e−f,i)`. The coefficient multiplication formula then yields the double sum for every i ≥ 2. The later `triangle_sumM58E` is explicitly conditional on all terms with e+f ≥ i vanishing. The actual kernel discharges that condition using the same choose-zero factor. Reindexing by h=e+f keeps the guarded equality of natural complements; a final finite Vandermonde gives `choose(2d,h)`. The remaining h=i−1 term is proved zero before the upper limit is reduced to i−2.

The resulting formal square identity is

    [u^i v^j] fib6(j+d+1)²
      = Σ(h=0,…,i−2) choose(2d,h) choose(2i−2−h,i)
          choose(j+i+1,2i−1−h),    i ≥ 2.

Columns i = 0,1 are separately zero by the exact coefficient convolution and inherited axis-zero theorem. These branches apply to every natural j,d.

`lowerValM58E j d i` is the finite sum over `Finset.range (i−1)`:

    D(j,d,i) = Σ(h=0,…,i−2) choose(2d,h) choose(2i−2−h,i)
      · [choose(j+i+1,2i−1−h) + choose(j+i,2i−1−h)].

For i = 0 or 1 the natural range is empty and D is zero. Every summand is an integer cast of nonnegative binomial products, so D is nonnegative.

The polynomial formula `lower_two_formulaM58E` handles j = 0 separately. Multiplication by V gives zero constant v-coefficient, leaving only the first square. On the formula side, the second binomial is zero for every h in the stated range. There is **no substitution of a truncated j−1 for a negative row index**. For j+1, the V term legitimately shifts to row j, and the two already proved square sums combine. `source_two_lower_formulaM58E` then rewrites the actual source square identity and obtains `A(i,j)=D(j,d,i)` for all natural i.

## Exact positive support and the proper-subproblem equivalence

`lower_highM58E` proves D=0 when i > j+2d+2. In each summand, either h>2d and the weight vanishes, or both row binomials vanish. Together with the empty low-column sums, this accounts for both zero tails.

For 2 ≤ i ≤ j+2d+2, the positivity proof chooses the natural h=i−j−2. It explicitly proves h<i−1, h≤2d, i≤2i−2−h and 2i−1−h≤j+i+1. These are the needed support bounds for a strictly positive selected summand; the other row binomial and all remaining summands are merely nonnegative. The proof does not treat natural subtraction as integer subtraction without those bounds. This establishes

    0 < D(j,d,i) ↔ 2 ≤ i ∧ i ≤ j+2d+2.

`lower_polygonM58E` independently unfolds the pinned polygon predicate and gives exactly the same interval for a=2,b=2(j+d)+1 in row j. The actual-source support theorem follows by rewriting the full raw formula and labels. Low/high zero theorems, rather than an unsupported converse from failure of positivity, provide the outside-zero conclusions.

`LowerSourceLCM58E` concerns all actual numerator-two paths and lower rows, with the original three horizontal polygon guards. `LowerBinomialLCM58E` is the arithmetic assertion

    D(j,d,i) D(j,d,i+2) ≤ D(j,d,i+1)²
    for all natural j,d,i with j+d ≥ 1.

The explicit path `lowerPathM58E j d = false^(j+d−1) ++ [true]` has a=2 and b=2(j+d)+1 when j+d≥1. To derive the all-start arithmetic assertion from the source subproblem, the iff proof handles i≤1 by a zero left endpoint, and i+2>j+2d+2 by a zero right endpoint. Otherwise the explicit path and interval support supply all three original polygon memberships. The converse uses actual-source classification to derive j+d≥1 and rewrites every raw coefficient. It does not introduce an extra formula or sign premise.

The equivalence `lower_source_iffM58E` is validated, but neither LC proposition is proved. `root_implies_lowerM58E` extracts the horizontal clause of the fixed root for the source subfamily; its direction is **Conjecture63 → LowerBinomialLCM58E only**. There is no new root iff or new residual module. Static hashes confirm `MarkovResidualM6E1.lean` is identical to its sealed worker-142 version and before-143 pin. Its H, V, D, polygon, endpoint and reverse-factor clauses remain untouched. The new proper-subproblem equivalence cannot replace that exact root reduction.

## Scaled summands and the local inequality

`lowerCoreM58E j i h` is the unweighted summand K(j,i,h), retaining the two row binomials. `lowerAuxM58E` is the product `choose(j+i,i) choose(j,i−2−h)`. The exact scaled identity has the explicit range h+2≤i≤j+h+2:

    (2i−1−h) K(j,i,h)
      = (2j+3+h) choose(j+i,i) choose(j,i−2−h).

Its choose-product and recurrence rewrites prove the bounds before casting natural subtraction. This is an internal algebra identity, not a normalization of raw source coefficients. The auxiliary diagonal identity gives a recurrence from (i,h) to (i+1,h+1); combining two scaled identities yields the corresponding cross-multiplied core recurrence.

For the local comparison, two such recurrences establish an exact integer transfer identity. The scalar sign depends on

    G(j,i,h) = (j+i+1)(i+2)(2i−1−h)(2i+2−h)
      − (j+i+2)(i+1)(2i+1−h)(2i−h).

The sign theorem uses integer h,k,t with h,k≥0, t≥1 and k+t≥2, substituting i=k+h+2 and j=k+t. At k=0 it proves the factorization `(t−2)(h+3)(h+4)`. At k≥1 it proves a polynomial identity in h,k−1,t−1 with nonnegative coefficients. Ordinary `ring` verifies both identities and positivity proves the sign. This audit read these certificates without computing their expansions.

`lower_core_mixedM58E` requires j≥2 and h+2≤i≤j+h+1, exactly the bounds needed for both consecutive recurrences. The substitution k=i−h−2 and t=j−i+h+2 discharges the sign theorem's range. Its transfer cancels a strictly positive polynomial factor; K at the relevant positions is only required to be nonnegative, and no K or seed mass is divided out.

The zero-extended weighted term is

    T(j,d,i,h) = choose(2d,h) K(j,i,h) if h < i−1,
                 0 otherwise.

For **every natural d,i,h with j≥2**, `lower_term_localM58E` proves

    T(i,h) T(i+2,h+1) ≤ T(i+1,h) T(i+1,h+1),

with j,d fixed. Inside the supported core range it multiplies the core inequality by nonnegative binomial weights. If h+2>i the left term is zero; if i>j+h+1 the right endpoint is explicitly zero by choose bounds. The remaining product is nonnegative. Thus the public local theorem retains all zero cases rather than imposing a hidden support hypothesis.

This is only the adjacent-index case k=h+1 of the proposed floor/ceiling midpoint condition. There is no theorem for arbitrary h,k, and no formal summation theorem transferring that candidate condition to LC of D. A local inequality on summands does not establish the required inequality for their sum. The prospective external summation result mentioned in worker notes has not been imported as an axiom or proved adapter. This audit neither searched that paper nor developed the missing argument.

## Certificate obstruction and the actual source witness

At j=1, i=2 and summand indices h=0,k=1, the formal identity is

    T(2,0) T(4,1) − T(3,0) T(3,1) = 2d.

It holds for every natural d and proves the reversed strict inequality for d≥1. These offsets correspond to actual numerator-two labels q=d+1, b=2d+3 through the explicit path theorem. The failure is of the proposed sufficient summand certificate; it does not reverse the raw row LC inequality. At d=0 the displayed gap is zero, and the strict-failure theorem does not apply.

A separate finite formal theorem at j=d=1 also refutes the synchronized mixed premise with h=0,k=2:

    2 T(3,0) T(3,2) < T(2,0) T(4,2) + T(2,2) T(4,0).

That is a different certificate from the adjacent local comparison, not a second raw source failure. `lower_obstruction_sourceM58E` explicitly proves that `lowerPathM58E 1 1` has a=2,b=5, that (2,1),(3,1),(4,1) satisfy all three original polygon guards, that their raw coefficients are 5,16,17, and that they satisfy raw LC. Those literal values and the inequality are retained theorem statements, not numerical values recomputed by this audit. The new work does not assert a fresh universal lower-row LC region from these obstruction results.

## Finite domains and saved experiment provenance

All three new numerical scripts were read and hash-bound without execution. The inherited raw/source helper and scan.py are separately pinned. Counts below are derived only from input/index ranges and guards; no coefficient, polynomial, binomial, sign, zero or failure value is reproduced.

The final experiment compares the raw evaluator against the direct source recurrence on **241 reduced sources with denominator at most 28**. This input domain is counted by coprime labels, without generating source polynomials. It then tests q=1,…,40, rows j=0,…,q and d=q−j: **860 source rows**. Coefficients/support are checked at i=0,…,2q+5, giving **51080 identities and 51080 support checks**. Triple starts i=0,…,2q+3 give **49360 source triples**. The saved **15780 zero-containing triples** are not independently recounted.

For the scaled/core tests, j=0,…,30, i=2,…,41 and h=0,…,i−2 are filtered by i≤j+h+2, giving **14880 scaled identities**. The local tests additionally require j≥2 and i≤j+h+1, giving **14065 comparisons**. These use the core before binomial weighting, distinct from the formal all-index weighted local theorem.

The proposed global midpoint scan uses j=2,…,25, d=0,…,10, starting i=2,…,j+2d+3 and all h,k=0,…,2d. It tests the floor/ceiling pair for **1316172 comparisons**, retaining zero terms. This is finite evidence for the unproved global condition, not a proof or a new source LC region. Event 139 returns 0 and emits exactly experiments.json. The script uses assertions for actual checks; its empty failures list is initialized and never appended. Its obstruction object is literal metadata, distinguished from the separately formalized obstruction/source theorems. Runtime is 1.7780057500349358 seconds.

The earlier exploratory probe uses j=1,…,14, d=0,…,8, i=2,…,j+2d+3, h≤min(2d,i−2) and k≤min(2d,i). There are **194565 midpoint comparisons and 194565 synchronized mixed comparisons per execution**. It records at most ten failures of each kind, so its arrays are not total failure counts and cannot establish absence outside those first samples.

That probe runs twice in the saved history. Event 32 runs it directly, with runtime 0.4062350000021979 seconds. Event 34 imports its C function; the module has top-level execution, so it reruns the entire probe and overwrites probe.json. The retained JSON matches event 34's first output line, with runtime 0.41699454095214605 seconds. All non-runtime fields match the earlier result. This distinction is retained rather than binding the final JSON to the earlier duration.

Event 34 then checks four square-only variants, each on j=1,…,11 and d=0,…,6 with the same index-dependent h,k bounds. Each mode has **59059 comparisons**, totaling 236236, and reports no failure in that finite domain. These variants use one square's summand with optional factors i−1, i or 2i−1−h; they are not the actual two-square source sum and are not formal LC-preserving transformations.

Other saved exploratory commands are also counted without rerunning them. Event 27 has 20 (j,d) inputs, j=1,…,5 and d=0,…,3, with 60 repeated polynomial-division passes in total; its quotient arrays/divisibility assertions remain finite output. Event 36 prints 18 square-only summand entries for three i values, two j values and three h values. Event 81 has **1134000 midpoint positions**, using j=1,…,20 and d=1,…,12 with the stated index-dependent h,k bounds. It reports 156 failures at j=1 and none in its j=2,…,20 cases. Those failure counts/outcomes are saved, not recomputed or promoted to a universal theorem.

The mixed-certificate script computes two finite polynomial expansions. Event 113 matches mixed-certificate.json exactly: fourteen retained monomials in the positive-k substitution and three in the zero-k substitution. This audit counts the saved terms but does not expand or evaluate them. The final Lean identities and positivity arguments are separate ordinary proof evidence; the script's `all_nonnegative` fields are not assumptions.

No experiment-bindings.json or internal result script/input-hash map is supplied. Saved index/controller hashes, exact event/result associations and separately checked inherited inputs do not authenticate invocation-start executables or every transitive runtime import. literature.json records the worker's retrieval of the pinned source and a prospective summation principle. The latter remains a proposed route in the worker's notes, not an accepted theorem dependency or a finding independently verified by this audit.

## Retained validation, method and cutoff

### Accepted, rejected and superseded sources

Twenty numbered compiler receipts have twenty matching immutable snapshots: **eleven successes and nine return-code-1 failures**, with no wrapper timeout. Ten successes cover the nine final mathematical sources and one Audit; the extra success is an older Obstruction version. There is no new unbuilt or compiled-only module, failed replay, snapshot-only invocation or rejected snapshot equal to final bytes.

The failures comprise two OffsetPair, one OffsetSquare, one OffsetFormula, two OffsetSupport, two OffsetTerm and one OffsetReduction attempt. All nine retain the final explicit declaration inventory. OffsetSquare build `1792157365393997000` has unspaced inequality tokens and parser errors; whitespace-normalized headers are not parsed-statement equivalence for that invalid source. Other changes concern proof-body syntax, rewriting, casting, shadowed variables and elaboration. No rejected snapshot contains literal sorry/admit. Diagnostics are neither source admissions nor mathematical counterexamples.

The first successful Obstruction build, `1792158111283498000`, has four theorems and one definition, source SHA256 `18cb2305ed4bd18da2e7c18383dd6e7d041278d1d7b7f84adc44957fe9972d4c`. The final source adds `lower_term_nonnegM58E` and `lower_term_localM58E`, changes its second import from OffsetTerm to OffsetMixed, and is successfully rebuilt as `1792158181902137000`, source SHA256 `6d759b55c939f85d9401238780422a8a001dcaea7f83ccfe23e222f9e0aebc1c`. The earlier version is not the replay/Audit target and receives no credit for the two later theorems.

The early Obstruction build overlaps Mixed compilation but does not import Mixed; its snapshot imports Reduction and Term. The final Obstruction build starts after Mixed and all required final dependencies have succeeded. No same-module builds overlap. Every current dependency's final successful build precedes its dependent final build, and all nine final mathematical builds precede replay and Audit. Compiler commands target research source files; immutable snapshots remain pre-invocation observations rather than continuous mutation attestations.

The sole joint replay selects all nine final modules and all 43 explicit declarations. The Audit prints every theorem exactly once. **Thirty-three closures use `{propext, Classical.choice, Quot.sound}`; `offset_kernel_zeroM58E` uses `{propext, Quot.sound}`.** All are permitted. The nine definitions participate in replay without adding print rows. Final source/build/snapshot/object hashes, selected names, source maps, Audit requests, stdout and axiom JSON agree. No missing final check is filled by a later worker.

### Replay method and the much smaller import boundary

The driver SHA256 is `30bdb33b389de3533536041b40aacb445d8f4a9f28549728a88fa58266755608`. It is an exact worker-142 suffix retag. Its ordinary body matches the retained Wide replay body after the documented guard/entry normalization; validation and Audit wrappers are exact retags as well. Saved checks use Lean 4.32.2, compiler `-j 1`, replay stack 131072, a joined Lean task and propagated result. The replay invocation is bounded at 180 seconds, down from worker 142's 240-second argument; Audit remains at 180 seconds. No checker-core, parser or failure-propagation bypass follows from that resource argument.

The checker gathers selected module-data constants, removes selected modules from its direct-import union, constructs the inherited environment and invokes ordinary `env.replay`. Its guard rejects selected `MathGKM.Markov.*M58E` names already imported or marked unsafe/partial. All 43 explicit declarations match that predicate and are absent from the base, with no duplicate or selected-name collision. Generated/private constants outside the guard retain ordinary replay handling. This audit does not decode every object part, authenticate external compiler/Lean/Mathlib binaries, rebuild all inherited sources or freshly replay inherited bodies.

The wrapper measures selected-source hashes before invocation, checker hash after replay and Audit maps after compilation. Matching retained observations do not establish invocation-start executable identity or uninterrupted source immutability. All actual final source/object/snapshot and name/output associations nevertheless agree independently within the retained method's scope.

The joint base contains **53 inherited local modules and zero current targets**. Its three explicit direct imports are MarkovCentralBinomialM6E1, MarkovFibGlobalM6E1 and MarkovSquares3556; implicit Init gives four total direct imports. The accepted local mathematical closure is **62 = nine new + 53 inherited**; adding Audit gives 63. Operational driver and external library trees are excluded. No local import cycle, source-resolution failure or saved final-source mismatch is found.

The final OffsetObstruction module reaches all nine current modules and all 34/9 declarations. This is the current dependency-graph endpoint, not a claim to prove Conjecture63. The inherited Lean path has 144 entries behind the current output directory; path availability is distinct from actual resolved imports, and the count does not imply inspection of active worker 144.

All **53 exact inherited source/object pairs** match sealed worker 142, before-143 and current hashes, without fallback. They comprise 51 prior inherited pairs and two accepted worker-142 modules, CentralBinomial and FibGlobal. The remaining seven accepted worker-142 modules, including its Residual, are absent. FibLow, CentralSums and CentralSquare M3A1 are the only accepted worker-141 modules imported. No accepted worker 140, 139, 138 or 136 module enters this base. The pair-hash pass ran from 14:02:52.972396 to 14:02:52.996009 UTC; preserved source/object bytes do not constitute fresh inherited-body compilation/replay.

Of the mathematical review's 66 named older comparisons, only 14 enter this closure: CentralBinomialM6E1, FibGlobalM6E1, FibLowM3A1, CentralSumsM3A1, CentralSquareM3A1, MathGKM.Markov, MarkovPolygon18, MathGKM.MarkovLogConcavity, FibonacciLC6ade, FibonacciFormula6ade, Squares3556, FibJets3556, NumeratorTwo6ade and FibonacciBase6ade, with Markov prefixes where abbreviated. The other 52 are scope/preservation comparisons only. The unchanged full-root residual is among those comparison-only files, not a current replay dependency.

**All 212 old worker-121 compiled-but-unreplayed modules, including the 195-module subset, are absent from this batch's base.** None is rebuilt or selected here. Their historical global backlog remains unrecovered; current non-import is not recovery. The 19 historically accepted worker-121 modules and its unbuilt drafts are also absent. The 23 worker-134 recoveries retain worker-135 provenance globally, but none is imported or freshly checked here. No accepted worker-134/135 module enters; the old HighCone2GapM81F, unbuilt drafts, distinct MF25 replacements and failed SmoothProbe remain outside this batch. No historical timeout, failure, missing replay or recovery is reclassified.

### Preservation, finalizer and report distinctions

All **89 controller artifacts** agree with archive/current bytes, and all **87 index entries** agree. Manifest.json and last-verification.json are the two unindexed controller artifacts. Composition is ten objects, 34 JSON files, 31 Lean files (eleven final sources and twenty snapshots), one text file, seven Python files and six Markdown files.

All **6132 initial entries**, including the unchanged own setup source and 156 Python cache files, are preserved without exclusions. This is a snapshotted-input count, not a claim that every file predates the request. Initial source/configuration preservation is separate from inherited-object checks. The latest predecessor manifest has 91 entries. Separate reconciliation covers all recorded worker-136/137/142 changes, **88 + 0 + 93 = 181 artifacts**, along with six administrative bindings and receipt/event evidence. Receipt projections drop only `changes`, compare effects separately and retain the last two events. Worker 136 remains timeout/null report, worker 137 stopped with zero changes, and worker 142 completed; no old command or stop-cause inference is introduced.

The new inherited-decoded.txt has SHA256 `1e9fde32371a82cc66e7e8464729347abc433b5ced5eb8a68aadd9a792232285`. Its six fixed administrative path headers delimit contents whose hashes independently match the six verified pins. There is no before-143 identity for the current inherited.json index. Its contents were not parsed, and a separately recorded one-off current byte hash is not used to infer invocation-time identity or included in the final repeated-input observation. This preserves the completed archived evidence boundary without inspecting active-successor mathematical content.

The historical late worker-134 Audit receipt `build-1792141544717794000.json`, SHA256 `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, remains before-143-pinned but outside the current initial inventory/index. It matches the separately preserved old late failure bundle. No successful old print/replay or backdated completion follows.

The finalizer is the worker-142 source retag with its literal module list changed, SHA256 `aeb013f853ee0d8f944bbf74ce9f689fa31fadb06573ef0119d7aa24f7142e8e`. It requires matching final-source successful build receipts, records final object hashes, and requires equality of the whole nine-source map in successful replay and axiom records. It does not independently enumerate per-theorem membership, parse permitted axioms from stdout or enforce expected checker/executable/import identity. Actual source/name/output/axiom associations are checked independently. Its lexical list omits unsafe/partial, separately handled by the selected replay guard and final-source inspection here.

The raw schema has top-level replay, axioms and theorem_closures, with source/object hashes and build_receipts per module. It has no completion field or per-module theorem lists. The audit's labeled compatibility projection does not rewrite that raw record. validation.json is written before preservation assertions; later successful finalizer returns and independent hashes are needed beyond its existence.

Initial preservation and fixed root/canonical contract checks are asserted. Terminal mismatch lists are recorded without asserting they are empty; the saved lists are empty and independent hashes agree. The research selector can include absent-initial or request-tagged files, but only its actual retained completed-request output is reviewed. STOP=false is a historical observation, not an asserted absence or a statement about later controller state. last-verification records counts, manifest hash, mismatch lists and null completion without echoing root/contract hashes; final-check has no finished_utc field.

There are two successful finalizer invocations: events 174–175 report 85 indexed artifacts; file-change events 176–177 add literature.json and final-checkpoint.md; events 178–179 report 87. The saved final-check fields agree across the summaries. Only the final 87-entry manifest is retained; the earlier 85 count is event evidence, not a reconstructed earlier hash map. Neither finalizer reruns compilation, replay, experiments or axiom checks.

No report.json draft is generated or retained in this request, so there is no fabricated draft/final comparison. Structured event 180 parses exactly to final.json and the controller report; event 181 is turn.completed. final.json SHA256 is `b48c60dab2428303fe662209fd83ea3af503e185285b98cdb24b7bde7e9eba7e`. Completion remains null. Finalizer/report summaries do not prove the residual or admit the full root.

### Exact chronology

All times are UTC on 2026-10-16. Controller start is 13:21:34.318096 and nominal deadline is 13:51:34.318096. The recorded elapsed 1588.1232650279999 seconds differs from subtraction of the stored finish/start timestamps, 1588.123263835907 seconds, by **0.0000011920928955078125 seconds**. They are reported separately rather than asserted exactly equal.

| Retained milestone | Time |
|---|---|
| Controller start | 13:21:34.318096 |
| Last final mathematical build finish estimate, Obstruction | 13:43:05.878062 |
| Joint replay start | 13:43:37.616154 |
| Audit start | 13:43:38.769465 |
| Joint replay finish estimate | 13:43:43.541220 |
| Audit finish estimate | 13:43:43.651419 |
| Final-checkpoint project mtime | 13:47:11.752056 |
| literature.json project mtime | 13:47:11.813137 |
| Mathematical module list project mtime | 13:47:11.870571 |
| validation.json project mtime | 13:47:11.875089 |
| final-check.json project mtime | 13:47:11.992676 |
| manifest.json project mtime | 13:47:12.038938 |
| last-verification.json project mtime | 13:47:12.119658 |
| events.jsonl mtime | 13:47:37.386226 |
| Activity heartbeat content | 13:47:37.789423 |
| final.json mtime | 13:47:38.454075 |
| Archived verifier copy mtime | 13:48:02.429854 |
| Controller host finish | 13:48:02.441360 |
| Nominal deadline | 13:51:34.318096 |

Audit starts 1.153311 seconds after replay and finishes 0.110199 seconds after it. The checks overlap; Audit start does not imply completed replay. Replay and Audit finish estimates precede deadline by 470.776876 and 470.666677 seconds. The verifier write precedes it by 262.198438 seconds, final.json by 235.864021 seconds, and host finish by 211.876736 seconds. No indexed project artifact is observed after deadline or host finish.

Receipt finish estimates add monotonic durations to pre-invocation filename timestamps, not independent wall-clock process-exit measurements. File mtimes are retained write observations; event-log mtime is not an individually timestamped final event. Archived verifier copy time is distinct from its earlier project write, and heartbeat content is distinct from activity.json mtime. All 181 events and 84 started items have matched completions. The 439307-byte event log plus empty stderr agrees with activity accounting; heartbeat content follows log mtime by 0.403197 seconds. This is retained-record accounting, not a fresh process census.

Fixed root SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII canonical contract is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Manifest SHA256 is `ddb9d2d97eee8a8e66cc982728524d85445fbfbbeeb736a5d7cfe0307792a9cd`; verifier is `864eefa7f0664f53272985d28d725fca67da857439b17a47f4e9168e7882bf4d`. These bind targets and retained records, not proof of the full root.

## Final observation and supporting audit files

The method pass found all **110 inputs unchanged from 14:08:48.186497 to 14:08:48.239959 UTC**. Final validation rehashed **6763 inputs from 14:10:45.189824 to 14:10:45.669249 UTC**, with no changed or missing input. The exact-request archive/current late observation at **14:10:45.678465 UTC** found no extra or missing worker-143 file. No new late bundle or missing preservation file is required. Project reads end at that observation; later crossreview and sealing read audit files only. No earlier observation window is extended.

The main audit and these seven supports are bound by `markov_worker_000143_integrity.json`. All files below are in `/private/tmp/math_gkm_godel_20261013`.

| Support | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000143_mathematical_source_hashes.json | 38757 | `c8840ebd900c06fd87eecccd27623d770cce2e09f143410b1f2066644fa0fd40` |
| markov_worker_000143_source_structure_audit.json | 19180 | `d9e551b8d7464f8ce7a2e90dd7b4b88c1e913888bee38b7b79d0cf461492207e` |
| markov_worker_000143_finite_domain_audit.json | 329532 | `f1a0f74f0ec3aa2ad0d6f8b9766409499c078ae27d55bf991e2be371cef0b060` |
| markov_worker_000143_validation_audit.md | 24113 | `b7099d0a625030908343fd2ee7ca99137d156fe487381439248b22dea7e525f3` |
| markov_worker_000143_validation_evidence.json | 3615183 | `d1a80d4c823d6288a58123475a4f3cda956c4b2a337697055b9046c037f56d7c` |
| markov_worker_000143_replay_method.md | 18458 | `f1593b46d7504f33df885b63d1b2ae6dc3552a05acb5a10aabe425eb542a7429` |
| markov_worker_000143_replay_method_evidence.json | 404373 | `f707adbc7f9c9e0f915ea6f8afb9ebe5798b23ab357fc25bd25299fec980592a` |
