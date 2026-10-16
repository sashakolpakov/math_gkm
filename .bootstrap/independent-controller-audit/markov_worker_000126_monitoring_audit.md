# Worker 000126 independent monitoring audit

Request `10d1575180b64743bae4589161aa0716`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000126/artifacts`; research suffix `M10D`. Audit date 2026-10-16 UTC. This review reads completed archived sources and receipts, exact named counterparts, and prior sealed audits. It executes no Lean, checker, replay, proof, finalizer, experiment, project code, coefficient calculation, or polynomial recurrence. Independent computations are static parsing, hashing, and finite index/word-domain counts. No project file was changed, active127 mathematics inspected, or proposer contacted or assisted. All audit output is confined to `/private/tmp/math_gkm_godel_20261013`.

## Finding and exact mathematical scope

The retained final evidence supports **seven new mathematical modules, 40 theorem closures and ten definitions**, compiled and selected-replayed across three successful unions. The substantive positive result is an **integral raw/residual conjugacy**, valid at every natural row index, with both low- and high-index factorization ranges and an unconditional adapter for every actual source path. These are polynomial identities and divisibility statements. **No new unconditional raw log-concavity region, new root reduction, or full-root proof is established.**

The negative results have precise restricted targets. An auxiliary F-state of an actual source prefix fails row log-concavity for every source in an unbounded numerator-two family. Separately, one raw prefix polynomial fails the original polygon-guarded diagonal inequality when labelled by that prefix's own counts. The offending word is formally proved to be **no complete source word at all**. Actual complete sources at both the prefix's count ratio and its enclosing source ratio are separately distinguished. Thus neither result refutes `MathGKM.Markov.Conjecture63`.

The first selected-validation wrapper rejected its successful Audit compilation because its parser ignored one axiom-free output. That failure is retained. A corrected parser subsequently accepted all final 40 names and all three replay batches succeeded. Two theorem additions occurred between the historical 38-name Audit and the final 40-name Audit; parser recognition alone does not explain the change from 37 recognized rows to 40.

**The old worker121 backlog of 212 compiled but unreplayed modules remains unrecovered.** Those modules are absent from this round's selected targets and successful import bases. Reconciliation and preservation do not supply replay coverage. Ordinary inherited compiled-import trust remains, with no fresh whole-source rebuild, runtime binary reconstruction, or root completion.

## Raw coordinates, integral conjugacy and source adapter

The protected coefficient is still `(P.coeff i).coeff j`, and `InPolygon a b i j` still requires `a*b ≤ b*i+a*j` and `i+j ≤ a+b-1`. No coefficient normalization, positive-support restriction, or changed polygon is introduced. The root file retains SHA-256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

`MarkovRawPrefixM10D` defines the raw pair `(Q,P)` by a fold from `(1,0)` in the literal raw variables `U,V`. Its atomic A step is `(V*(Q+U*P), Q+(U+1)*P)`; its C step is `((V+1)*Q+U*V*P, Q+U*P)`. `rawPair_matrixM10D` identifies this pair with the top row of the corresponding gas matrix product for every atomic Boolean word. Original A is the atomic A step, while original B expands to A then C through inherited `expand80`. `rawPair_sourceM10D` identifies the second component after expansion of `sourceWord28 path` with `(frame path).mid.p`, using inherited `rawWord_expand80` and `source_word_exact3eda`. It is an exact source bridge, with no assumed coefficient formula.

`MarkovRawConjugacyM10D` works after exchanging raw coordinates. Write `h=X+1` for the inner one-variable polynomial. The integral substitution `rowScaleM10D` fixes the inner variable and sends the outer row variable to itself times `h^2`. For every bivariate polynomial and every natural `j`, `rowScale_coeffM10D` proves that row coefficient extraction acquires the uniform factor `h^(2*j)`.

The generic predicate `PairScaleM10D k raw res` asserts the two polynomial identities

```
phi(raw.Q) = h^(k+1) * res.F
phi(raw.P) = h^k     * res.H.
```

The initial pair after the first A has raw `(U,1)` and residual `(U*(V+1),1)`, with `k=0`. The A transport increases `k` by one; C preserves it. These are generic integral-ring identities under the explicit `PairScale` premise, not independently universal statements about unrelated pairs. The word induction then discharges this premise for every Boolean tail `w` after an initial A, using `k=w.length`, swapped raw pair of `expand80(false::w)`, and residual pair `hstateM10D(false::w)`. Original B invokes A followed by C. The all-word theorem therefore covers **every tail after initial false**, not arbitrary words beginning true.

For these words, the second-component identity and its two consequences are:

```
h^(2*j) * raw_row_j = h^w.length * H_row_j                 (all j)
raw_row_j = h^(w.length-2*j) * H_row_j                    (2*j ≤ w.length)
H_row_j = h^(2*j-w.length) * raw_row_j                    (w.length ≤ 2*j).
```

Both ranges include equality, and together cover every natural row. All zero rows and zero coefficients remain included. Cancellation uses the nonzero polynomial `X+1` in the integral polynomial ring; there is no assumption about a real evaluation point, no factorial scaling, and no cancellation of a log-concavity assertion. In an arbitrary word the H-state is the constructed residual pair component; its identification with the named actual-source residual is supplied only by the source adapter.

For **every path and natural `j`**, `source_raw_residual_clearedM10D` proves

```
(X+1)^(2*j) * (Bivariate.swap (frame path).mid.p).coeff j
  = (X+1)^((frame path).mid.b-1)
      * hresidualM511 X (sourceWord28 path) j.
```

The bridge uses the inherited exact source word `false :: (central28 path ++ [true])`, its length `b`, and `hresidual_diffM511`. Thus the tail length is exactly `b-1`. There is no source gap, formula premise, ratio bound, or run-length restriction. Under `b ≤ 2*j+1`, `source_raw_high_quotientM10D` proves residual row equals `(X+1)^(2*j+1-b)` times the raw horizontal row. The complementary low range is furnished by the all-word low theorem and the source bridge, consistently with inherited low-range source factorization; there is no new separately named source-low wrapper here. **“Both ranges” refers to low/high horizontal row indices, not to a new theorem for both coordinate axes.** A horizontal raw row means coefficients `(i,j)` for all natural inner `i`, after the displayed swap.

No theorem here supplies residual adjacent log-concavity or CrossLC. In particular, the high-range identity cannot be read as proving raw log-concavity merely by cancelling a binomial factor. Prior support and conditional-transfer results retain their stated premises.

## The two obstruction statements and their source scope

`hstateM10D` is the positive horizontal pair derived from the inherited horizontal matrix word. Its first component F is auxiliary; its second component H is the one used in the raw/residual bridge. `hstate_run_lowM10D` gives exact low-row data after A^(n+2), and `hstate_run_BA_rowM10D` proves, for every natural `n`, that the F row of outer index 2 after the original word A^(n+2)BA is

```
2*X + 5*X^2 + (n+4)*X^3.
```

The next theorem extracts the literal inner coefficients 1,2,3 as `[2,5,n+4]`. `hstate_run_BA_failureM10D` proves the strict reversed adjacent inequality for every `n ≥ 9`. No independently recomputed coefficient or gap is used in this audit.

`source_two_wordM10D` identifies `sourceWord28(false^n ++ [true])` with `runBlock025(n+1) ++ runBlock025 n`. The following exact concatenation and take theorems show that the path `false^(n+1) ++ [true]` has prefix A^(n+2)BA of length `n+4`. `actual_source_prefix_F_failureM10D` combines that bridge with actual indices **a=2, b=2*n+5** and the strict F-row failure for every `n ≥ 9`. The remaining suffix is A^n B. This is an infinite family of **actual source prefixes**, but its tested polynomial is F at the prefix, not H or the final raw Markov polynomial. At the first permitted n=9 the source ratio is 2/23 and the F triple is `[2,5,13]`.

The raw obstruction uses

```
W = [A,B,B,B,B,B,A,B,B],     length W=9,     count_B W=7.
```

`badPrefix_sourceM10D` proves W is the first nine original letters of the actual path `[true,true,true,true,true,false]`, whose source labels are 11/13. `badPrefix_tripleM10D` extracts from the second component of the raw pair for expanded W the literal raw coefficients **(4,4),(5,3),(6,2) = [10,14,20]**. `badPrefix_valid_failureM10D` both proves all three `InPolygon 7 9` guards and proves the strict reversed diagonal inequality. This is exactly the root's diagonal convention at `i=4,j=2`: `(i,j+2),(i+1,j+1),(i+2,j)`, common total degree 8. The polynomial is `rawWord80 W`.b, and the labels 7/9 are W's counts.

Crucially, `badPrefix_not_sourceM10D` proves **for every path**, `sourceWord28 path ≠ W`. The proof assumes equality, uses source word counts to force a=7,b=9, and applies the inherited mechanical-prefix count formula at length six. W has five B letters there, incompatible with the required floor of `6*7/9`. This is an accepted final theorem, added after an earlier successful seven-theorem version of RawPrefix. The mere facts that W occurs within a source and has coprime count labels do not identify it with the complete source at those labels.

`MarkovPrefixScopeM10D` makes the comparison exact:

- Actual source 7/9, path `[true,true,true,false]`, has raw coefficients **[4,12,20]** at the same three literal points. Its indices, all three original polygon guards, and the non-strict log-concavity inequality are formally proved.
- The enclosing complete actual source 11/13 has **[0,0,0]** at those points, by the original outside-polygon zero theorem. No positive-support restriction discards these zeros.
- `prefix_weakLC_failureM10D` proves `¬WeakLC 7 9 (rawWord80 W).b`.
- `universal_source_prefix_failureM10D` negates the enlarged assertion that for every source path and every natural prefix length, the prefix raw polynomial satisfies `WeakLC (count true) length`. Its witness is the 11/13 path and prefix length nine. It does **not** negate `Conjecture63`.

These saved formal statements support the restricted obstruction claims without supplying a conjecture counterexample or a new log-concavity region.

## Existing root reduction and original guards

The inherited root correspondence remains `Conjecture63 ↔ InteriorCore63MF8` from worker124. It is not re-established or selected for replay here. With `d=a+b-1`, that residual core retains actual source paths with a≥2, the original three polygon guards in each direction, and:

- Horizontal: j≥5 and i+j+4≤d, at `(i,j),(i+1,j),(i+2,j)`.
- Vertical: i≥4 and i+j+4≤d, at `(i,j),(i,j+1),(i,j+2)`.
- Diagonal: i+j+8≤d, a+5≤i+j+2 and a+2≤b, at `(i,j+2),(i+1,j+1),(i+2,j)`.

Natural zeros and both root endpoint obligations remain in the original conjecture. Earlier universal rows j≤4, columns i≤3, and proved diagonal bands retain their prior coverage and validation limits. The present identities and prefix obstructions remove none of the remaining core inequalities. The full raw bivariate three-direction conjecture stays open.

## Finite records and independent domain counting

The six retained probe scripts and six JSON records were read but not executed. The finite supplement hashes each and records independent integer/word-domain counts. Coefficient values, recurrence outputs, gaps and pass/fail classifications below are **saved observations**, not recomputed by this audit. None is a universal proof. Repeated scans of the same domain are not added as independent coverage.

The raw-prefix scans use all **541 reduced fractions** with 2≤b≤42 and 1≤a<b. Mechanical original words are generated by adjacent floor differences. Deduplication by full original prefix gives **4096 distinct prefixes**. The first scan checks supported polynomial centers only, in H,V,D directions, for **8,519,796 saved comparisons**. The next two scans include natural zero centers through one outer triangular boundary layer and each records **11,447,217 comparisons**. Independent counting by prefix length, B count and retained degree endpoints reproduces the latter domain count without evaluating any polynomial. All 541 complete source words first occur as complete words in the increasing-denominator enumeration, so prefix deduplication cannot silently skip a complete-source test.

All three records report **257 diagonal failures and no horizontal or vertical failures**; the scope-labelled final scan reports **zero complete-source failures**. Their first witness is the formal W above, as the ninth prefix of 11/13, centered at (5,3), with `[10,14,20]`. None of these scan predicates filters by `InPolygon`. The formal theorem proves original polygon guards for the displayed first witness; the scan total alone supplies no such assertion for the other 256. The initial supported-center scan also does not by itself cover natural zero centers.

The grouped probe uses **277 reduced fractions** through b=30 and **2397 distinct keys** `(prefix-before-letter, atomic-stage, next-bit)`. Because next-bit belongs to the key, these are not necessarily distinct mathematical states. It evaluates same-row, weighted same-row, and C-group mixed expressions plus F/H row inequalities. Its saved comparison counts are respectively **1,926,093; 1,995,066; 2,064,039; 1,903,995; 1,837,419**, with saved failure counts **7089;42;6;4;0**. Independent endpoint/index counting reproduces all five comparison counts using the retained pair-support degree bounds and the script's empty-row default. The saved first F failure is the source 2/23 prefix of length13, row2, `[2,5,13]`; the mixed self-expression is twice the ordinary adjacent gap, so those displayed quantities must not be interchanged. These tests concern auxiliary mixed predicates or pair components, not the root raw-source assertion.

The truncated probe retains rows 0 through8. Its saved input list has **1567 entries,1566 distinct**: all1493 reduced fractions through b=70, plus74 accepted entries from120 fixed-seed candidate draws, with one duplicate. The accepted sample denominators span75 through397. Static reading shows updates shift outer row degree only nonnegatively, but this audit asserts no newly verified formal truncation theorem. The **31,611 distinct prefixes** are independently recounted. Prefix H alone is checked after each original letter; F and H are checked at completed sources. Saved comparisons are **2,418,145 prefix-H,115,593 source-F,120,188 source-H**, totaling2,653,926, with no reported failure. Saved zero counts **1,706,394;75,096;84,438** count coefficient occurrences in triples, not distinct positions. Their total is1,865,928. Actual truncated arrays and row support endpoints are not retained, so these comparison/zero totals are summed from records, not independently regenerated. This probe never checks prefix F and therefore does not conflict with the formal F-prefix obstruction.

The enlarged raw-cone probe uses all510 words A followed by tails of lengths1 through8, plus120 fixed-seed random tails of lengths9 through30, for **630 word inputs**. Only word metadata is regenerated for independent domain counting. Retained raw-support degree endpoints and the script's row defaults reproduce the six saved comparison counts: P horizontal97,421; Q horizontal97,421; same-row106,181; next-Q106,811; next-P106,811; B-P-group116,831; total631,476. Saved failure counts are respectively0,0,777,27,737,0. These arbitrary initial-A words form an enlarged family and are not all actual source words. Their finite successes do not prove universal raw P/Q horizontal log-concavity, and their mixed failures are not source-root counterexamples.

## Final source, compilation, print and replay bindings

All **95 controller artifacts** match archive and exact current bytes. All **93 indexed artifact hashes** match; manifest and last-verification are the two separately controller-bound exclusions. The archive contains seven final mathematics sources, two Audits, one driver, nineteen immutable compiler snapshots, nine final objects, and the retained operational/experiment/documentation files. There is no new pending, unbuilt or compiled-only mathematical source. The **5415 prior inputs** are preserved from5416 initial entries, excluding only this request's setup script. All99 predecessor125 artifacts and1355 worker121 artifacts are also preserved against their exact archive/controller/before/current bindings. Preservation is not proof recovery.

| New module, suffix M10D | Theorems | Definitions |
|---|---:|---:|
|MarkovPrefixObstruction|6|1|
|MarkovSourcePrefix|4|0|
|MarkovRawPrefix|8|4|
|MarkovRawConjugacy|9|4|
|MarkovWordConjugacy|6|1|
|MarkovSourceConjugacy|2|0|
|MarkovPrefixScope|5|0|
|Total|40|10|

Nineteen compiler receipts comprise eleven successes and eight errors, all eight with returncode1 and obsolete source hashes. There are no compiler timeouts, interrupted outcomes or missing snapshot receipts. Five failed attempts concern PrefixObstruction and one each RawConjugacy,SourcePrefix,WordConjugacy. Static comparison of declaration headers after whitespace normalization finds no changed binders or premises between rejected and final versions. Failed proofs are not promoted to successful coverage.

The eleven successful builds are seven final mathematical versions, two successful Audit versions, and two earlier successful mathematical versions. RawPrefix's earlier hash `71735a893ebf6106f836454ac3c66ec846fb842c8521947b8bf6c9a75d84efa7` has seven theorems; final hash `9e2d0040be6e5f23539cc3ba0265d4f1413a7f2b09eeffedb929cc350e62626b` adds source exclusion before both Audits. PrefixScope's earlier hash `45dc09151111d70a535befaff139d945549d8781aa7d433a0d3ec48b34444d86` has three theorems; final hash `5681c4c9d8920c9310f59725f58a7771697b6424e116dbd9f8f75f14ab616052` adds the two WeakLC failure statements between Audits. Earlier immutable sources and receipts survive; their same-name older objects are not separately preserved in the completed archive. Final object coverage binds only to final successful source versions.

The first Audit requests and prints38 historical theorem names:34 with `{propext,Classical.choice,Quot.sound}`, three with `{propext,Quot.sound}`, and `badPrefix_countsM10D` with **no axioms**. The copied parser recognizes only `depends on axioms:` and misses `does not depend on any axioms`, hence reports37 and rejects at events164–167. No replay begins. Events168–169 amend both wrappers to accept the empty-axiom form and map it to the empty set; compiler success, exact expected count, and the original allowed-axiom set are retained.

The final Audit requests and prints all40 final names, uniquely and without extras:36 full triples, three pairs, one empty set. The pair-only names are `source_two_wordM10D`, `source_two_prefixM10D`, `source_two_prefix_takeM10D`. Across both outputs there are78 rows but only40 distinct theorem names. The change37→40 comprises **one corrected recognition plus two genuinely new theorem declarations**. The wrapper still checks substrings/counts/sets rather than theorem-name uniqueness; independent audit comparison establishes exact final name coverage.

The final wrapper then executes three successful replay unions selecting3,3,1 modules. Their explicit declaration counts are32,16,2, totaling **50=40 theorems+10 definitions**. Every new mathematical module is selected exactly once, with final source/object/build pointers and checker hash matching. There is no inherited target, duplicate explicit selection, or stale-source-only acceptance. A replay receipt is distinct from an Audit printout and from compiled-import use.

## Method and inherited trust boundary

The final driver SHA-256 is `94d6a3742375fe41f21f27bff33cfb318b9cf5c9a740ebaed447c93a1635b049`. Apart from suffix retagging it retains worker125's driver, the ordinary `env.replay` body, joined-task error propagation, compiler `-j1`, and replay stack131072. The parser fix does not change replay semantics. All three successful receipts record this driver hash.

The driver collects target constants, constructs the imported base, and guards explicit collected names beginning `MathGKM.Markov.` and ending `M10D`: each must be absent from imports and neither unsafe nor partial. All50 actual explicit declarations meet this predicate. Actual batches are antichains with target-free transitive bases and no explicit selected/imported collision. Generated/private and inherited names outside that predicate retain ordinary Lean.Replay duplicate/import behavior; map assembly and axiom-admission limits are unchanged. This audit does not reconstruct every binary constant or private declaration.

The wrapper chunks direct-import levels in batches of at most eight and submits all levels to a three-thread pool without barriers, using180-second limits. Two higher-layer replay invocations overlap dependencies' replay completion. All matching compiled bases already exist and all seven new modules eventually pass. The replay-plan is scheduling metadata; actual receipts establish execution. Checker source is hashed after subprocess return, not separately at invocation start, and imported object identity is not measured inside the running process.

There is no worker-saved dependency-scope inventory. Static reconstruction finds **106 local nodes=9 new mathematics/Audits+97 inherited**, or **104=7+97** from the three mathematical terminal roots. There are no unresolved local source imports or cycles. SourceConjugacy alone reaches102 nodes, SourcePrefix99, PrefixScope28. The97 inherited source/object bindings comprise60 from worker125's inherited bindings,34 additional worker124 inherited bindings, and three accepted125 modules: AtomicSupport,HorizontalPair,HorizontalSupport. All match exact prior audit and before126 pins, independently rehashed at05:22:16.809947–05:22:16.858366 UTC. External Mathlib and implicit Lean imports remain outside this local source graph.

No worker121 MAE2 module or newly accepted worker124 MF8 module occurs in these successful bases. Intersections with old121's212 backlog,195-module subset,previously accepted set and298 unbuilt modules are all empty. None is rebuilt or replayed. The old212 remain historical unrecovered evidence, while the inherited full-root reduction carries its separate earlier validation boundary.

The selected wrapper may preserve old replay flags without a prior source-hash test at assignment; the finalizer restores flags from source-matching successful receipts having a checker-hash field without itself comparing the field to an expected driver or proving name coverage. Its general preservation assertions do not inherently prove all modules accepted. Independent final source/name/checker/receipt comparisons establish the reported complete **new** coverage here. This is retained local replay evidence with trusted inherited compiled imports, not a fresh whole-source rebuild, official-checker admission, or independently verified loaded-binary environment.

## Finalization, deadline and late evidence

All times below are UTC on2026-10-16. Numeric receipt names denote starts; reported return estimates add saved durations and are not independently timestamped process exits. Final replay coverage completes at the last estimated return **05:10:52.172593**.

Three direct finalizers, events185–186,198–199,208–209, all return0 with seven compiled/seven validated/40 closures,5415 prior inputs,eight compiler errors,zero replay failures and empty pending/preservation-failure lists. Their index sizes87,91,93 grow as later experiment/report/documentation files are added; mathematical validation is already complete at the first finalizer. The replay-only receipt filter excludes scheduling metadata. There is no partial finalizer result this round.

The indexed draft report at05:15:06.155368 has SHA `b1d9dd6ab303ee9a87bc67fdd7de166dd661697dc8d4d4b0d90d960de7e97a3e`. It differs from the final report in actions,agenda,observations; request,summary and null completion agree. Neither report substitutes for the other. Both preserve the open-root scope and restricted prefix-obstruction interpretation.

Final validation is retained at05:15:06.225478; compiled inventory05:15:06.699195; final-check05:15:06.699256; manifest05:15:06.711224; last-verification05:15:06.713534. Last-verification follows the manifest intentionally, binds93 hashes without failures, and is the latest controller-bound project artifact. No stale final index or unaccounted post-finalization project input is observed.

Final report event210 equals parsed `final.json` and controller report; event211 is `turn.completed`. Final JSON SHA is `ebe62c2f416e0a852f94c045a959d66e879d25fcf27a64f3327bd28f8cb4e1ca`, retained at05:15:30.923746. Controller start04:48:57.628970, deadline05:18:57.628970 and completed finish05:15:59.295990 give **1621.6670200824738 seconds**, **178.332980 seconds before deadline**, returncode0. Mathematical completion remains null. All observed mathematical receipts, project artifacts and final report precede deadline and finish.

The211-event log has99 item starts,109 completions and three thread/turn events, with no unmatched start. Its515577 bytes exactly match activity accounting; stderr is empty. Event-log,activity,final JSON and receipt timestamps are distinguished in validation evidence rather than treated as late proof. No independent system-wide process census is claimed.

Expanded final stability found **8048 unchanged inputs** at05:26:07.341551–05:26:17.916966. Exact completed-request observation at05:26:17.917010 found no extra or missing file; method stability found133 inputs unchanged at05:25:17.657099. No late receipt or separate late preservation was needed. Audit-time hashes do not alter historical cutoff. Earlier storage consolidation is attributed only as byte-preserving operational history; hashes, not inode/ctime, govern this audit.

## Audit artifacts and limits

Seven supports accompany this note: mathematical source hashes, source structure, finite domains, validation note/evidence, and replay-method note/evidence. The integrity JSON binds this main note and all seven supports after cross-review. Mathematical and validation inventories independently agree on all seven final source hashes,40 theorem names and ten definitions. The raw contract SHA is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical sorted compact ASCII JSON SHA is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Their parsed contents agree with the request; serialization differences are not contract changes.

This audit records the retained source mathematics and its validation boundary. It performs no proof reconstruction, missing check, fresh experiment, source repair, or independent root completion, and supplies no research direction to the proposer.
