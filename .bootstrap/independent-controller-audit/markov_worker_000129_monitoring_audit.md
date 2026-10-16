# Worker 000129 independent monitoring audit

Request `aa6c518b255a4137a1bdbca51a6e9434`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000129/artifacts`; research suffix `MAA6`. Audit date2026-10-16 UTC. This audit reads completed archived sources and records, exact named counterparts and sealed predecessor evidence. No Lean, checker, replay, experiment, finalizer, project code, coefficient, polynomial/matrix recurrence or inequality-gap computation was run. Independent computations are static parsing, hashing and integer word/index/polygon-domain counts. No project file was changed, active130 mathematics inspected, or proposer contacted or assisted. All outputs are under `/private/tmp/math_gkm_godel_20261013`.

## Outcome and exact new region

The retained evidence supports **eight new mathematical modules,27 theorem closures and four definitions**, with successful compilation of the final sources, selected kernel replay of all eight, and exact named axiom-print coverage of all27 theorems. There is no new compiled-only or pending mathematical module. Controller outcome is **completed**, elapsed1562.7104938030243seconds, returncode0, with a structured final report and `completion:null`.

The new unconditional statement is `source_bottom_allMAA6`:

```
∀ path : List Bool, ∀ i : ℕ,
  coeff (frame path).mid.p i 0 * coeff (frame path).mid.p i 2
    ≤ coeff (frame path).mid.p i 1 ^ 2.
```

This is **vertical** LC starting at j=0, at the literal raw positions **(i,0),(i,1),(i,2)**. It is not horizontal row-zero LC. It quantifies every generated source path and every natural i, retains all zero positions, and has no denominator, ratio, run-length, polygon, coefficient-positivity, formula or scalar-gap premise. Actual source labels satisfy1≤a<b, hence b≥2. The theorem is stronger than its polygon-restricted strip, but asserts no other newly unconditional strip.

`root_iff_interiorMAA6` proves the exact machine-root equivalence **Conjecture63 ↔ InteriorCore63MAA6**. Static comparison with the previous MF8 residual confirms that its only additional condition is **1≤j in the vertical clause**. The full residual remains unproved; neither the root nor its negation is certified.

Worker128's reconciliation preserves its218 indexed artifacts and full220 archive/controller artifacts, including its unvalidated Clustered draft. **Worker128 remains timeout/nullreport**. Worker129 does not build, select, print or import that draft. The old worker121 **212-module compiled-but-unreplayed backlog remains unrecovered**. It is now inside the accepted inherited replay base through the old ThirdAll/Residual chain; replay of the eight new modules does not replay those old imported bodies.

## Protected coefficients and source-statistic bridge

The protected root remains `coeff P i j=(P.coeff i).coeff j`, with raw integer coefficients in squared variables, no factorial normalization, and `InPolygon a b i j` defined by `a*b≤b*i+a*j` and `i+j≤a+b−1`. Root SHA-256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

For a nonempty canonical central word `central28 path=e::w`, the inherited statistic is

```
s = bit(e) + bit(last(e::w)) + 2*adjacent_BB(e::w).
```

`last_eqMAA6`, `adj_scanMAA6` and `adj_appendMAA6` connect the inherited last-bit and adjacency definitions. `central_palindrome28` and `palindrome_last7d80` give equality of the two endpoint bits. The exact source form is `false::((e::w)++[true])`: the initial A contributes no BB pair and the final B contributes the last-core B indicator. Thus the core statistic is twice the **full canonical source word's** BB count. Inherited `source_bb_count446` states that count is `2*a-b` with **natural truncated subtraction**. `central_statMAA6` therefore concludes

```
s = 2*(2*a-b) in ℕ = 2*max(2a-b,0).
```

This is derived for actual source words, not assumed for arbitrary palindromic or A–core–B words. Its explicit nonempty-core premise is used only where a nonempty core has been established. In `source_second_exactMAA6`, b≥5 and source word counts force a core length n=b−2≥3 and B count m=a−1. It obtains the exact integral identity

```
2*(Bivariate.swap P).coeff 2
  = X^m*(X+1)^(n-3)*secondExpr8934 X n m s,
```

where

```
secondExpr X n m s = 4s + (9m²+13m+6)X
  + (6m²+6mn+8m+6n+6)X² + (m+n+2)(m+n+1)X³.
```

The chain is `source_word_exact3eda` to the protected frame numerator, `hword_raw46` to its swapped raw-word polynomial, and `word_second8934` to the integral row identity. The inherited word theorem cancels only the nonzero polynomial `(X+1)^3`, with n≥3 justifying exponent subtraction. No LC conclusion is cancelled through smoothing, and no individual coefficient is divided out. The old second-row source theorem has weaker statistic bounds, but the new bridge explicitly derives the exact value; those old bounds are not hidden new hypotheses.

## Vertex formulas and small vertex cases

At i=a, `source_vertex_zeroMAA6` uses the inherited boundary-binomial formula to give c0=1 for every path. `source_vertex_oneMAA6` gives c1=3a−1 for b≥3 from the exact first-row source formula. For b≥5, `source_vertex_twoMAA6` extracts the swapped second row at **m+1=a**, using its constant and linear coefficients, to prove

```
2c2 = 8*max(2a-b,0)*(b-5) + 9a²-5a+2.
```

All conversions of natural subtractions are guarded. The b−5 factor here is an integer subtraction, and b≥5 is explicit. `swap_coeff46` restores protected raw coefficient indices rather than interchanging the intended direction.

`vertex_gap_positiveMAA6` proves the integer scalar

```
9a²-7a-8*max(2a-b,0)*(b-5) > 0
```

for natural1≤a<b and b≥5. It splits2a≤b, where the truncated term is zero, from b≤2a, where a≥3 follows and the proof uses nonnegativity of `(2b−2a−5)^2` with ordinary ordered-ring arithmetic. This scalar certificate plus the exact three coefficients proves the raw vertex inequality. For b<5, a<b implies a≤3 and inherited `vertical_first_fourMF8` supplies the literal vertex triple. No unproved small-source formula is substituted.

## General coefficient adapters and positive scalar clearing

For an interior bottom triple put **i=a+k**, **N=b−1=k+l**, with k≥1 and l≥2. The vertex k=0 is handled separately. The l≥2 condition keeps the top member at or below total degree d=a+b−1. Let C=choose(N,k), and cr=coeff P (a+k) r. Define

```
T = (l-1)(3a-1) + k(a+N),
D = 9(a-1)²+13(a-1)+6,
E = 6(a-1)²+6(a-1)(N-1)+8(a-1)+6(N-1)+6,
F = (a+N)(a+N-1),
J = 4s(l-2)(l-3)(l-4)
  + (k+1)[D(l-2)(l-3)+Ek(l-2)+Fk(k-1)].
```

The saved accepted adapters prove

```
c0 = C,
N(N-1)c1 = C*l*T,
2N(N-1)(N-2)(N-3)(k+1)c2 = C*l*(l-1)*J.
```

The first row uses the inherited raw `source_first_linear_row77`, not its separate normalized-LC result. `bottom_linear_scaledMAA6` combines two existing exact binomial coefficient identities. `bottom_choose_shiftMAA6` relates `choose(N−1,k+1)` to `choose(N,k)` through a multiplicative identity. `bottom_cubic_scaledMAA6` applies inherited `cubic_falling_coeff340` at indices **k+1,l−2**, with N≥4 and l≥2; these guards justify every natural index subtraction.

For the source second row, the polynomial equality is mapped from integers to reals and its coefficient taken at **(k+1)+m=a+k**. Thus the extra k+1 in the falling-factorial/binomial identity is accounted for; it is not an off-by-one change to the raw triple. The parameters n=N−1,m=a−1 and exact s=2*max(2a−N−1,0) are substituted by derived equalities.

Define the real polynomial gap

```
G = 2(k+1)(N-2)(N-3)l*T² - N(N-1)(l-1)*J.
```

`bottom_gap_transferMAA6` proves the exact common-scalar equality

```
2(k+1)(N-2)(N-3)[N(N-1)]² * (c1²-C*c2) = C²*l*G.
```

The left scalar is strictly positive under k≥1,l≥2,N≥4. G≥0 gives a nonnegative right side and the raw inequality. C≥0 is supplied, but **C is never divided out**. Neither coefficient nonvanishing nor a binomial-normalized target is needed. The final conclusion is cast back to the integer raw inequality.

## Five certificate regions, support and all natural starts

The final `MarkovBottomGapMAA6` source contains five literal polynomial expansions. Static parsing counts96,21,21,21,and103 positive-integer monomials, respectively: **262 terms** in total. Every equality is proved by ordinary Lean `ring` after unfolding T,J,G, and every nonnegativity conclusion by `positivity`. This audit reads those bodies and counts literal terms; it does not regenerate their expansions. Python-generated expressions are checked proof input, not accepted external axioms.

| Certificate | Substitution into G | Factor |
|---|---|---:|
| zeroLarge | a=A+1,k=K+1,l=L+3,s=0 |1|
| smallTwo | a=A+1,k=K+2,l=2,s=0 |1|
| smallThree | a=A+1,k=K+1,l=3,s=0 |1|
| smallFour | a=A+1,k=K+1,l=4,s=0 |1|
| highLarge | a=(K+L+7+t)/2,k=K+1,l=L+5,s=2t |4|

Their parameters are nonnegative reals, with zero boundary values included. Some declared parameters are unused in particular charts; they impose no additional source restriction. The factor4 in the high chart clears the rational a-substitution.

`bottom_gap_nonnegMAA6` assembles these charts for **all natural a≥1,k≥1,l≥2,N=k+l≥4**, with s fixed to twice the natural subtraction2a−(N+1). The scalar theorem itself needs no extra a<b condition. For l=2,3,4, the s-term vanishes; N≥4 forces k≥2 in the l=2 case. For l≥5 and2a≤N+1, s=0 and zeroLarge applies. Otherwise t=2a−(N+1)≥0 and a=(k+l+1+t)/2; the high chart applies with K=k−1 and L=l−5. The equality face2a=N+1 is included in the zero branch. There is no remaining coefficient/gap/shape assumption in the source theorem.

`source_bottom_verticalMAA6` for b≥5 covers every natural i through four exhaustive cases. If i<a, polygon containment forces c0=0. If i+2>d, it forces c2=0. In each case the product is zero and a square is nonnegative; no support saturation or coefficient deletion is used. If i=a, the vertex result applies. Otherwise k=i−a≥1 and l=b−1−k≥2 are derived and the interior transfer applies. The total-degree equality i+2=d remains included.

`source_bottom_allMAA6` removes b≥5. For b≤4, i≤3 uses inherited all-source first-four-column LC. If the top point is above total degree, c2=0. The remaining case meets the exact inherited `source_top_vertical_largeB5` hypotheses `2≤i+j` and `i+j+2=d`, here j=0. This completes the natural-index range without an experiment bound or unproved small-family candidate. Inherited first-four-column coverage also explains why the old compiled dependency boundary is substantial.

## Exact residual and original guards

Every residual clause still quantifies generated paths with a≥2, and retains **all three original InPolygon guards**. With d=a+b−1, the conditions are:

| Direction | Literal points | Additional residual conditions |
|---|---|---|
| Horizontal |(i,j),(i+1,j),(i+2,j)|i+j+4≤d; j≥5|
| Vertical |(i,j),(i,j+1),(i,j+2)|i+j+4≤d; i≥4; **j≥1**|
| Diagonal |(i,j+2),(i+1,j+1),(i+2,j)|i+j+8≤d; a+5≤i+j+2; a+2≤b|

The forward implication drops the already-proved bottom strip from the older residual. The reverse implication splits j=0, supplied by `source_bottom_allMAA6`, from j≥1, supplied by the new residual assumption. Horizontal and diagonal clauses are passed through unchanged. Both pinned special endpoints, `WeakLC 0 1 1` and `WeakLC 1 1 (U+V)`, remain part of Conjecture63 and are retained through inherited `root_iff_interiorMF8`. The new source-strip theorem by itself quantifies generated middle frames, not those two special endpoint labels.

This is an exact reduction, not a theorem establishing its remaining premise. The published-family/Laurent/homogeneous correspondence and universal Newton-polygon identification retain their inherited end-to-end audit limits. No fresh literature or source-correspondence proof was attempted by this audit.

## Finite domains and rejected enlargements

All numerical results below are retained observations, not independent numerical verification. Only word metadata, index domains and polygon guards were recounted. No coefficient, polynomial recurrence, gap, symbolic expansion or inequality was recomputed.

The bottom experiment enumerates the383 reduced interior fractions0<a<b≤35. Its archived script calls the inherited subtractive source generator and independently compares the resulting polynomials with the positive word recurrence. It reports383 whole-polynomial matches and378 vertex identities for b≥5. Independent integer domain counts reproduce **14778 bottom starting indices**, from `range(a+b+3)`, and **24942 scaled coefficient identities**, three identities at each of8314 eligible positions with b≥5,a≤i,i+2≤d. These include k=0 even though the formal interior LC transfer treats the vertex separately. The record reports no failures.

Polygon containment forces6458 of those sampled triples to contain a zero, and the metadata count agrees with the saved **6458 zero-containing triples**. This agreement does not freshly compute coefficients or prove absence of additional interior zeros. The inherited `scan.py` was read as a named completed dependency to interpret enumeration; it is outside this worker's before/index hash set, so its current source hash is recorded without claiming a runtime import binding. The archived caller, output and recorded execution remain bound. Other inherited named experiment helpers match before129 pins.

The preliminary horizontal scan uses1023 exhaustive initial-A words with tail length0 through9 and200 fixed-seed tails of lengths10 through54: **1223 distinct words**. Integer degree/count metadata gives **341255** candidate adjacent positions, matching both ordinary raw and degree-normalized comparison totals. The **268665 support-normalized comparisons** depend on coefficient-derived support endpoints; their total is retained, not independently regenerated. Saved outcomes are no ordinary raw failures,622 support-normalized failures and107 degree-normalized failures. These are stronger unrestricted-word ultra-log-concavity predicates. Their first displayed triples `[9,18,10]` and `[2,9,18]` concern different normalizations and enlarged words, not a root refutation or a new universal raw theorem.

The block enlargement plans1020 exhaustive inputs with n=0..3 and binary block labels z of lengths2..9 beginning1 and ending0, plus160 fixed-seed samples: **1180 planned inputs**. It forms each original word by concatenating `A^(n+r)B` for r in z, and tests only coprime count labels. Independent metadata reproduces **745 tested words** and all three full polygon-filtered totals: **846839 horizontal,846839 vertical,861467 diagonal comparisons**. The scan completed all planned inputs in46.622728542seconds, below its65-second stop threshold.

Its saved `last_input` is the final **planned but skipped** input, with gcd10, not the final tested word. The domain supplement preserves both. Saved outcomes are zero zero-containing triples, no horizontal or vertical failures, and six diagonal failures. The first is the already audited worker126 non-source prefix ABBBBBABB with counts7/9 and literal polygon-valid points(4,4),(5,3),(6,2), raw triple `[10,14,20]`. Its previously accepted word exclusion is not replaced by a new129 certificate. These finite passes do not establish coordinate LC for the enlarged block family, and the failures do not refute the source root.

The exploratory bottom-gap record contains36 symbolic chart labels. Six entries have negative expansion coefficients in the saved algebra output; that is failure of a particular coefficient-positivity certificate, not by itself a negative polynomial value or a root counterexample. The five final formal charts above replace this exploratory table as accepted evidence. No negative-coefficient observation is a premise of the final proof.

## Final versions, compilation and printed closures

| Final mathematical module | Theorems | Definitions |
|---|---:|---:|
| MarkovVertexStatMAA6 |5|0|
| MarkovVertexCoefficientsMAA6 |4|0|
| MarkovVertexLCMAA6 |2|0|
| MarkovBottomGapMAA6 |5|3|
| MarkovBottomPositiveMAA6 |1|0|
| MarkovBottomCoefficientsMAA6 |5|0|
| MarkovBottomLCMAA6 |4|0|
| MarkovResidualMAA6 |1|1|

All final source hashes match archive, current exact-named source, controller changes, index, successful build snapshots/receipts, replay maps, axiom maps and validation entries. The nine retained compiled objects, eight mathematics plus one Audit, match archive/current/controller/index; the mathematical objects also match validation hashes. These are retained source/object associations, not independently reconstructed compilation.

There are16 compiler receipts and matching snapshots: **10 successes and six return-code1 rejections**. Successes are eight final mathematical sources, one earlier successful BottomLC version and one Audit. There is no compiler timeout, failed replay, parser rejection or snapshot-only invocation. All six rejected source versions differ from their accepted final bytes and are excluded as proof evidence. The first VertexStat version had four theorem headers; the final version adds `last_eqMAA6`. Its rejected successor and the rejected VertexCoefficients, BottomCoefficients and BottomPositive snapshots have eventual theorem names but failed proof bodies. The rejected BottomLC snapshot has three theorem headers.

The earlier successful BottomLC source, SHA-256 `666e16a797afa99ec4066a0308002380692505815e8a3867eade1b747f2aa091`, proves the b≥5 result with three theorems. The final source adds `source_bottom_allMAA6`, has four theorems, and has SHA-256 `42530c2b7b1da006b00b35601f686cb301717fc18c23aebdd7fc1a7a846c5d2c`. Its final build precedes both replay and Audit. The earlier successful same-name object is not separately retained in the completed archive; no assertion is made about absence from global caches. Final validation is attached to the later universal source, not the earlier restricted theorem inventory.

One replay union selects all eight final mathematical modules exactly once and reports **31 isolated explicit declarations**,27 theorems plus four definitions. One successful Audit imports all eight, requests and prints27 distinct theorem closures, and exactly matches the source-bound axiom JSON. Twenty-four closures use `{propext,Classical.choice,Quot.sound}`; `adj_scanMAA6` and `adj_appendMAA6` use only propext; `last_eqMAA6` explicitly uses no axioms. Empty-set parsing is supported and succeeds. Definitions are replay targets but are not miscounted as theorem closures. No admission, new axiom, native evaluation, unsafe or partial mathematical declaration was found in the selected new sources.

## Replay method, imports and historical backlog

The driver source SHA-256 is `01f9d6250f83ce5c3f4abc60b71b51e3a1500ccb8fb39d43e353009ef907373b`. It is the unchanged worker128 driver after suffix substitution. The ordinary replay body is unchanged from the previously audited Wide method except for the inherited explicit-name guard. It excludes selected modules from the imported base, requires explicitly named `MathGKM.Markov` declarations ending MAA6 to be absent from that base, rejects unsafe/partial mathematical declarations, and performs ordinary Lean environment replay. Private/compiler-generated names outside this predicate retain ordinary replay handling; the guard is not a whole-import declaration-isolation proof.

The selected modules form a dependency union, with all eight excluded together, rather than eight mutually independent targets. The final Residual root closure contains **2292 local modules: eight new and2284 inherited**; adding the Audit gives2293. The replay base contains2284 inherited local modules from nine explicit inherited roots plus implicit Init. External Mathlib/Lean imports and runtime binaries remain a separate trust boundary.

All212 historical worker121 backlog modules, including195 Half dependencies, and19 previously accepted121 modules occur in this inherited base. **None is rebuilt or selected for replay here; none of the212 is recovered.** No previously unbuilt121 candidate is imported. No accepted128 mathematical module or pending Clustered128 module appears in the replay base. Worker128 reconciliation is preservation, not dependency replay.

The method supplement binds2284 inherited source/object pairs to prior sealed records and before128/before129 pins:2264 from the sealed128 inherited boundary, one sealed124 inherited binding, one accepted124 module and18 exact named pairs outside those prior sealed graphs. Byte identity does not supply missing old replay. The known storage-only COW consolidation of older archives/cache copies changes metadata without changing these bytes; it is not a new proof event.

The independent current-byte check of all2284 exact inherited source/object pairs ran06:54:32.838089–06:55:35.285340UTC and matched every recorded pin. This later audit observation is preservation evidence, not a newly executed proof receipt or a measurement of what the replay process loaded at runtime.

The validation and axiom wrappers are worker128 copies after retagging. Compiler thread/stack and joined replay behavior remain unchanged; no larger-stack retry or bypass was introduced in129. Checker hashing is after subprocess return, not invocation-start/runtime binary measurement. The inherited131-entry Lean path is preserved behind the current evidence prefix. No fresh whole-source rebuild, executable/library hash reconstruction or external-import body replay is claimed.

## Finalizer, preservation, deadline and late evidence

The archive/controller contain **79 artifacts**,77 indexed. Manifest and last-verification are the two deliberately nonindexed files and are independently bound. There are nine objects,31 JSON files,26 Lean files,eight Python files and five Markdown files; the26 Lean files comprise ten final sources and16 build snapshots. All **5706 worker-local prior inputs**, including137 bytecode records, remain unchanged; no current-request exclusion was needed. The six inherited administrative inputs match. The controller before snapshot has a different file-selection policy; absence there is not a conflicting digest.

The raw contract remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; the sorted compact ASCII-escaped canonical contract hash remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. No serialization correction or rejected finalizer occurs in this worker.

The finalizer is retagged from128, changing only the explicit predecessor manifest list to128 alone. It checks successful source/build/replay/name records for the explicit mathematical list, hashes objects, checks preserved inputs and root/canonical pins, writes and verifies an index and last-verification record. It does not independently enforce checker identity, recompute permitted axiom sets from compiler output, bind that output to axiom JSON, precommit mathematical inventory counts, or rebuild object provenance. Those actual saved associations were audited separately. Validation is written before later preservation assertions; a validation file alone would not prove full finalization. The last verifier echoes the earlier root/contract measurements and is not a root-completeness check. Stop-file absence is recorded, not an asserted precondition.

Events188–189 create the finalizer; successful executions complete at194 and198, both reporting8 modules,27 closures,77 indexed artifacts,5706 prior inputs and six unsuccessful builds. Event196 appends the checkpoint between them, so the second execution refreshes its hash. Events200/202 only read saved verification results. Event203 is the structured final response, matching final.json and receipt report; event204 is turn.completed. All96 started items have completion records. The552768-byte activity counter exactly covers the full204-event log and zero stderr; this is saved foreground accounting, not an independent system process census.

| Boundary, UTC2026-10-16 | Time |
|---|---|
| Controller start |06:12:32.500791|
| Final BottomLC build finish estimate |06:33:13.686979|
| Final Residual build finish estimate |06:33:43.404403|
|27-closure Audit finish estimate |06:33:58.760815|
| Final replay finish estimate |06:34:01.346199|
| Final validation mtime |06:37:35.639952|
| Final-check mtime |06:37:36.557163|
| Manifest mtime |06:37:36.704283|
| Last-verification mtime |06:37:36.715890|
| Final.json mtime |06:37:58.163135|
| Controller finish |06:38:35.211283|
| Deadline |06:42:32.500791|

Receipt timestamps name invocation starts; finish estimates add retained durations. File mtimes are not exact event timestamps. Controller finish is237.289508seconds before deadline, last verification295.784901seconds before, and final.json274.337656seconds before. The37.048148seconds between final.json and controller finish are host bookkeeping, not evidence of added proof work. Receipt elapsed and subtraction of displayed epoch fields differ by about1.9microseconds only.

Final.json SHA-256 is `d991f9f1234b4dea57404c7612fee94d38afbecaf0b7e4ed85cda38e1b11f593`; final manifest SHA-256 is `bf92996c2c6f456473c486076d52261ce849392874ccbf92f79265fece87cbb0`. All recorded artifacts precede deadline and finish. No late exact-request evidence or unaccounted pending file was found requiring separate preservation. Historical128 timeout and121 incomplete replay remain unchanged.

Final validation byte-stability review checked8561 inputs during06:56:18.666878–06:57:06.118207UTC with no change. The exact-request late-file scan at06:57:06.137042 found no extra or missing file. The method audit's96 static inputs were unchanged at06:56:53.131993. These are audit observation times, not historical worker proof timestamps.

## Supporting records and audit boundary

The seven supplements are `markov_worker_000129_mathematical_source_hashes.json`, `markov_worker_000129_source_structure_audit.json`, `markov_worker_000129_finite_domain_audit.json`, `markov_worker_000129_validation_audit.md`, `markov_worker_000129_validation_evidence.json`, `markov_worker_000129_replay_method.md`, and `markov_worker_000129_replay_method_evidence.json`. The integrity manifest seals their exact hashes with this main report after audit-file-only cross-review.

| Supplement suffix | SHA-256 |
|---|---|
| mathematical_source_hashes.json |`6fadd26819b6782636aded366bef929671ae21d24ec3938af73c0b2a98e66540`|
| source_structure_audit.json |`10216657543cb57f72030152996bbd6860224814a6d21e078dd8e51d4a9c716d`|
| finite_domain_audit.json |`e35ad0ae2e88365e54c6379de8f48867e4a70430cd213cda5f2dbb71818dc7b9`|
| validation_audit.md |`ed0fcccbaf597053ca536c8bfa4ffb7f1978283317ca1bc96f2f434367d4886a`|
| validation_evidence.json |`7bc638e66d730e26b10ea731a613f3b0fb510c39188f5044369377454fd24848`|
| replay_method.md |`04b532fe0725b3ecd3a1138195afe52e39a141fc38f898b6f30dcb8c85e0129d`|
| replay_method_evidence.json |`c417c9f24c3b9a4d89ff3a7cec1f203049dc63d2bf26be6a1e198b696a961eeb`|

The mathematical reading supports a new universal raw bottom vertical strip and the stated exact residual reduction, within the recorded compiled-import boundary. It does not supply the remaining residual proof, repair historical missing checks, execute any proposed proof, or upgrade experiments to universal evidence.
