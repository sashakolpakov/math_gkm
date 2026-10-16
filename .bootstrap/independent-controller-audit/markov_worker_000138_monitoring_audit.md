# Worker000138 independent monitoring audit

Request `ac3d4ab98366433dacc719574d5ff03e`. Archive-first static audit of completed worker138. The controller records **completed**, returncode0, elapsed1497.3628458976746seconds. This audit executes no project code, Lean, proof checker, replay, experiment or finalizer; computes no polynomial coefficients, binomial values, moments or gaps; changes no project file; and supplies no proof repair or research direction. Only saved source/receipt inspection, hashing, parsing and finite input/index-domain counts are performed. Active139 is outside the review.

The saved result is a pair of sufficient criteria for raw log-concavity of arbitrary coefficientwise nonnegative binomial mixtures, together with actual-source adapters in all three directions. The weighted-variance criterion has a formally proved actual-source family beyond both the previous square-margin criterion and the new mixed-pair criterion: **for every natural s≥5, at depth2s**, with the old residual and polygon guards retained. This establishes genuine additional source coverage. The exact theorem **Conjecture63 ↔ InteriorCore63MAC3** leaves its residual unproved; **full Conjecture63 remains open**.

Seven final mathematical modules contain26 theorem declarations and nine definitions. All are compiled and selected for replay; all26 theorem closures are printed. No new unbuilt or compiled-only mathematical source is admitted. Imported compiled objects retain the existing trust boundary, including worker121's212 unreplayed modules; reconciliation is not recovery of their missing replay.

## Mathematical inventory and bindings

| Module (Markov prefix, MAC3 suffix) | Theorems | Definitions |
|---|---:|---:|
|BinomialGap|8|1|
|Variance|2|0|
|BinomialVariance|4|1|
|SourceRegion|6|3|
|SourceVariance|3|3|
|Residual|1|1|
|VarianceWitness|2|0|

The seven archived final sources match their exact named current counterparts and validation inventory hashes/theorem lists. Eighteen named inherited sources, including the five accepted136 sources and thirteen older source/support references, match before138 and the sealed136 mappings. These are source identity checks, not fresh validation of inherited proofs. The source-structure support’s `theorem_statements` fields are lexical prefixes ending at the first `:=`; a let binder can truncate such a prefix. They are not complete theorem transcriptions. The entire archived mathematical sources were read directly and hash-bound, and the scope below comes from those full-source reads. The five archived mathematical/scope/operational documents and three experiment-source/result pairs also match their named current counterparts. The hash support records all bindings.

## Asymmetric mixed-pair criterion

`mixed_factorMAC3` proves an exact real polynomial identity for the already defined mixed numerator:

```
mixedNumerator(a,b,t)
  = (a+b+t+3) [2(a+2)(b+2) − t(t−1)(a+b+t+4)].
```

The audit reads this saved ordinary ring proof and does not re-expand the polynomial. `mixed_tripleMAC3` assumes real a,b,t≥0, the displayed bracket nonnegative, M,m≥0, and four explicit multiplicative adjacent relations. It clears the strictly positive product `(a+2)(b+2)(a+t+2)(b+t+2)` and derives `L*r+l*R≤2*M*m`. It divides by no coefficient or weight sum. There is no hidden square-margin assumption a,b≥t² in this new lemma.

`cast_pairMAC3` explicitly treats t=0 before casting natural `t*(t−1)` to real `t*(t−1)`. Natural truncation is therefore retained correctly at zero; the proof does not apply an unrestricted subtraction cast. Four inherited choose-step identities then establish the natural binomial mixed inequality. For ordered shifts lo≤r≤s≤hi, the proof sets t=s−r, a=k−s and b=n−(k−r+2). The overlap guards justify those subtractions and the coefficient shifts. Monotonicity bounds t(t−1) by w(w−1), with w=hi−lo, and bounds the right factors by the support endpoints. The unordered lemma splits the order of r,s.

The exact natural predicate is

```
MixtureRegion(n,k,lo,hi):
  hi ≤ k,
  k+2 ≤ n+lo,
  (hi−lo)(hi−lo−1)(n+2) ≤ 2(k−hi+2)(n+lo−k).
```

All subtractions are natural. Unlike the variance predicate below, this predicate does **not** separately require lo≤hi. The polynomial theorem assumes natDegree(P)≤hi, coefficientwise nonnegativity and zero coefficients below lo. If lo>hi these support premises force the zero polynomial, so the missing order premise is not a hidden gap or an implicit restriction. The explanatory document's common lo≤hi condition is a convenient narrower presentation of this theorem.

For Q=(1+X)^nP the theorem concludes the literal raw inequality `Q[k]Q[k+2]≤Q[k+1]²`. The coefficient-sum lemma is used only where hi≤the tested index. Low terms vanish by the support premise; pair bounds are multiplied by nonnegative `P[r]P[s]` and summed using the inherited finite-mixture lemma. No seed log-concavity, internal positivity or real-rootedness is assumed. The integral theorem maps ℤ into ℝ and transports the exact coefficient product back, with no factorial normalization or omitted scale.

## Weighted-variance criterion

`bounded_momentsMAC3` takes an arbitrary finite index set, real weights q≥0 and positions A≤x≤B, with A≥0, B≤H, H≥0. It assumes `H(B−A)²≤4A(H−B)` and proves

```
H(WV−U²) ≤ U(HW−U),
W=Σq, U=Σqx, V=Σqx².
```

There is no division by W; W=0 and an empty index set are allowed. No separate A≤B premise is silently inserted. The saved proof sums `q(x−A)(B−x)≥0`, uses the square `(2U−(A+B)W)²≥0` to bound the variance term, and bounds `U(HW−U)` below by `A(H−B)W²`. The next theorem assumes H≥1 and transfers this bound to the three sums of `qx(x−1)`, `qx(H−x)` and `q(H−x)(H−x−1)`. Its ring rearrangement multiplies the moment gap by H−1; this audit does not recompute that identity.

The natural polynomial predicate is

```
VarianceRegion(n,k,lo,hi):
  lo ≤ hi ≤ k,
  k+2 ≤ n+lo,
  (n+2)(hi−lo)² ≤ 4(k−hi+2)(n+lo−k).
```

For shifts r∈[lo,hi], the proof sets H=n+2, x_r=k−r+2, A=k−hi+2, B=k−lo+2 and

```
q_r = P[r] choose(n,k+1−r) / [x_r(H−x_r)].
```

The overlap guards prove x_r>0 and H−x_r>0, including all endpoints of the finite support interval. The only divisions are by these strictly positive index-dependent factors. `moment_reconstructMAC3` uses the two consecutive-binomial relations to identify each weighted summand with the exact raw coefficients at k,k+1,k+2. It does not divide by P[r], a selected coefficient or a sum of weights. The interval coefficient extraction removes indices below lo by zeros, not by a positivity assumption. The same argument allows internal zeros and P=0, and the integral version retains the unscaled integer target.

This criterion bounds the aggregate weighted moment expression. It does not require every mixed pair to satisfy the mixed-pair sufficient inequality. Neither criterion proves arbitrary binomial mixtures log-concave at every boundary index. The proposed all-index adapter with zero-extended choose(n+2,⋅) appears only in finite experimental/proposed work; it is not supplied by these overlap-range theorems.

## Polygon lower support and actual-source adapters

The protected polygon predicate is exactly `ab≤bi+aj` and `i+j≤a+b−1` on natural indices. `below_polygon_floorMAC3` assumes b>0 and k<a−⌊ar/b⌋ and derives `bk+ar<ab` using quotient/remainder arithmetic. Thus the source point is outside the original lower polygon boundary. The horizontal lower-support theorem combines its raw zero, exact forward factorization, residual nonnegativity and inherited `P[k]≤[(1+X)^nP][k]` to force the residual coefficient to zero. The vertical argument exchanges a,b and handles the raw coefficient abbreviation explicitly.

These theorems prove **zero below exact floor-derived bounds**. They do not assert that the lower bound is attained, that the residual's degree equals its upper bound, or that every coefficient between the bounds is positive. There is no cancellation of a raw LC inequality through smoothing.

For an actual source path with labels a,b, the two families of source predicates use these parameters:

| Direction | Explicit forward range | n | lo | hi | Literal raw triple |
|---|---|---|---|---|---|
|Horizontal row j|2j+1≤b|b−2j−1|a−⌊aj/b⌋|a+j|`(i,j),(i+1,j),(i+2,j)`|
|Vertical column i|2i+1≤a|a−2i−1|b−⌊bi/a⌋|b+i|`(i,j),(i,j+1),(i,j+2)`|
|Diagonal depth r|i+j+2+r=D=a+b−1, r≤i,j|D−2r|0|r|`(i,j+2),(i+1,j+1),(i+2,j)`|

Horizontal and vertical predicates require the corresponding generic region at k=i and k=j, respectively. Their range hypotheses already make the floor denominators positive. The degree upper bounds and nonnegativity are inherited source theorems; the new floor-support lemmas supply the lower bound. Exact factorization and coefficient extraction use the preserved swap on the horizontal side and the protected coefficient abbreviation on the vertical side. No assumed seed formula or seed-LC premise remains.

For the diagonal, r≤i,j and the total equality give2r≤D, so the inherited forward upper-slice factorization applies. The nonnegative integral quotient slice has degree≤r. The two predicates respectively require

```
r(r−1)(D−2r+2) ≤ 2(i−r+2)(j−r+2),
(D−2r+2)r² ≤ 4(i−r+2)(j−r+2).
```

The adapter proves the natural identity `D−2r−i=j−r+2` before applying the generic criterion. All three diagonal coefficient rewrites prove the same exact total i+j+2 and omitted depth r. There is no scaling of the raw target. The source theorems quantify over every finite source path and all natural indices satisfying the displayed predicates, without a denominator, path-length or fixed-depth cutoff. They retain zero coefficients and do not require extra polygon premises; the exact root reduction still retains all its polygon guards.

## Strictly new unbounded source coverage

`unbounded_variance_onlyMAC3` states for every natural s≥5 that there exist an actual path,i,j satisfying all prior diagonal residual guards and all three polygon guards, `¬DiagonalMiddleMF1E`, `¬DiagonalRegionMAC3`, `DiagonalVarianceMAC3`, and the literal raw LC inequality. Its construction is

```
n=4s²+2s+1, path=true^n ++ [false],
a=2n+1, b=2n+3,
r=2s, i=2s²+2s, j=14s²+4s+5.
```

The source labels come from the inherited actual-frame label theorem, not from assigning labels to an arbitrary polynomial. The total equality uniquely determines r, so the exclusions rule out **every existential depth witness** in each competing predicate, not only a convenient candidate. The old square margin fails at i. The pair exclusion uses a separately proved strict inequality; with t=s−5 its saved ordinary ring identity has positive right side

```
8t⁴+136t³+784t²+1614t+442.
```

The proof establishes t≥0 and positivity; the audit does not expand this identity or evaluate it numerically. Natural `2s(2s−1)` is cast via the already proved cast-pair lemma. The variance condition is proved directly in the saved source with all natural subtraction identities supplied. The resulting raw inequality is then exactly the source variance theorem.

The theorem explicitly supplies a≥2, a+2≤b, i+j+8≤D, a+5≤i+j+2 and every original polygon membership. Its middle-predicate negation therefore places the triple in the previous MF1E residual. This is a proved strict expansion at **every even depth≥10 across varying sources**. It is not a claim about odd depths, infinitely many depths of a single finite polynomial, strict LC or strictly positive raw coefficients. Failure of the auxiliary pair criterion is not failure of raw LC: raw LC is the conclusion here.

## Exact residual and unresolved scope

Static text comparison verifies that `InteriorCore63MAC3` is exactly `InteriorCore63MF1E` with three added antecedents, one per direction: the negation of the union of the new pair and variance regions. Every old square-margin exclusion, original polygon guard and prior residual condition remains. Horizontal obligations still require j≥5 and i+j+4≤D; vertical obligations i≥4,j≥3 and i+j+4≤D; diagonal obligations i+j+8≤D, a+5≤i+j+2 and a+2≤b. The path clause still requires a≥2. Both original endpoint obligations are retained through the inherited root equivalence.

The reverse implication in `root_iff_interiorMAC3` splits whether each new-region union holds. Its positive cases use the corresponding proved raw-source theorem; its negative case uses the remaining residual assumption. The proof does not assert the residual or delete an entire direction. Full root completion, source-specific boundary coverage outside these predicates, reverse-factor ranges and a general source moment-gap sign remain unresolved.

## Finite input domains and saved numerical outcomes

No experiment is rerun and no coefficient-dependent assertion is reevaluated. The auditor's independent loops manipulate only reduced-fraction inputs, indices and explicit region/polygon guards. The exact inherited mechanical-word implementation and saved recurrence comparison are source-bound; their polynomial values remain recorded experimental evidence.

The small experiment covers241 reduced fractions1≤a<b≤28 and performs241 dictionary-polynomial equality assertions. It checks3570 horizontal/vertical residual rows: every row in2r+1≤b or2r+1≤a. Each saved division check tests the displayed lower and upper support bounds and coefficientwise nonnegativity. The3570 count is a count of rows, not individual residual coefficients.

The eight large cases have the following exact starting-index domains. For these cases the union equals the variance domain; this finite observation is not asserted as a universal inclusion between the criteria.

| Direction/source | Row/depth | Pair starts | Variance/union starts | Union triples | Newly in MF1E residual | Variance outside pair |
|---|---:|---|---|---:|---:|---:|
|H50/251|j5|64…279|60…283|224|195|8|
|H101/401|j6|128…465|118…475|358|271|20|
|V321/641|i4|720…869|679…910|232|221|82|
|V501/751|i5|836…1152|795…1193|399|375|82|
|D79/101|r8|46…123|26…143|118|92|40|
|D123/151|r9|53…209|31…231|201|118|44|
|D149/173|r10|67…242|37…272|236|146|60|
|D87/89|r6|22…145|14…153|140|56|16|

The totals are1556 pair triples,1908 variance/union triples,1474 triples in the old residual and352 variance-but-not-pair triples. Every selected triple satisfies all three literal polygon guards. The finite comparison with the old vertical predicate is also checked against its existential natural c, rather than relying only on the script's ceil(b/a) choice; enumeration through the constant lo=0 tail agrees for the tested cases. This finite consistency check is not a newly developed theorem about all c or all source shapes. The saved results report no failures and zero zero-containing triples in these eight cases; their values/gaps were not recomputed. Axis truncation is used only for the fixed horizontal/vertical row, while diagonal models are untruncated.

The generic experiment has780 seed slots: widths0…12 and n=2,5,…,179. For each it tests starts k=w,…,n−2 satisfying either region. Static domain counting gives44536 triples, including8793 variance-only triples. The saved4487 zero-containing triples and498 non-LC seeds are coefficient-dependent records, not independent audit computations. No RNG or seed coefficient generation is needed to recount these fixed domains.

The all-index moment probe remains explicitly **unformalized**. Its179 reduced fractions through denominator24 yield4550 rows/diagonals and118366 starting triples, including starts−2,−1 and the right zero extension. Four asserted identities per triple give473464 identities. Static guards count88615 triples outside overlap and97844 outside both criteria. The saved47771 zero triples and empty failure list are not reevaluated. The script's weights use an unnormalized choose(n+2,⋅) factor and reconstruct scaled coefficients with D=(n+1)(n+2); its proposed normalized adapter is only discussed as future work. Finite reconstruction and gap identities neither supply a universal Lean bridge nor prove the missing source gap sign.

The exploratory mixed-gap output contains24 saved unshifted terms and16 half-margin terms, with10 and four negative entries respectively. These are counts of saved symbolic records, not a new expansion or substitution. Negative displayed coefficients alone supply no actual-source counterexample or failed universal theorem. The proposed further margin and moment arguments are unproved proposals and are not adopted or developed in this audit.

## Retained validation, imports and chronology

The thirteen numbered compiler receipts have thirteen matching immutable snapshots: ten successes (seven final mathematical sources and three Audit sources), three returncode1 errors and no timeout. All three rejected snapshots differ from their final successful versions. One SourceRegion rejection concerns the polygon-membership proof; two BinomialVariance rejections concern reconstruction/cast steps and a named type argument. Normalized declaration headers agree with the final statements; none is an accepted proof, mathematical counterexample or superseded successful build.

Four successful replay invocations select twelve module occurrences but seven distinct modules. The first selects BinomialGap, SourceRegion and Variance together (20 explicit declarations); the next two select BinomialVariance (five) and SourceVariance (six); the final joint replay selects all seven modules and all35 explicit declarations. Every final source hash and object matches the successful build and selected replay references. Three Audit compilations print disjoint16+7+3 theorem names, exactly26 unique closures, all with `{propext, Classical.choice, Quot.sound}`. Definitions are replayed but do not add theorem-print rows. The second and third Audit executions overlap corresponding replay executions; they are independently successful checks, not evidence that replay always precedes axiom printing.

### Replay method, isolation and inherited dependencies

The final `ReplayIsolatedMAC3.lean` source SHA256 is `d44eb6a3eecc5efe8fad059f5a8840c694198186488d9ac7fd34e1e13ca89906`. It is the136 driver with suffix/function-name retagging, preserving the original ordinary Replay body after normalization. The build and axiom wrappers are likewise exact retags. Compiler `-j1`, replay stack131072, joined task/result propagation and the180-second axiom timeout remain unchanged; no bypass is found.

The driver constructs the inherited environment after excluding selected module imports, loads available selected module-data constants and invokes ordinary replay. Its explicit guard rejects `MathGKM.Markov.*MAC3` declarations already present in the imported base or marked unsafe/partial. All35 explicit declarations satisfy this predicate, are unique and match the selected final source inventories. Generated/private declarations outside that predicate have ordinary replay handling; the explicit-new-name guard is not falsely described as covering every generated name. The review does not decode every compiled part, authenticate every external compiler/library binary or perform a fresh whole-source build. Source hashes are sampled before subprocess invocation, driver hashes after return and Audit source maps after Audit compilation, rather than continuously at runtime.

| Selected replay | Mathematical base | Current138 modules in base | Total direct imports including implicit Init |
|---|---:|---:|---:|
|Gap, SourceRegion, Variance|73|0|3|
|BinomialVariance|4|2|2|
|SourceVariance|77|4|3|
|All seven|2406|0|5|

The final joint replay's explicit direct imports are BinomialInteriorMF1E, SourceInteriorMF1E, ResidualMF1E and InteriorWitnessMF1E, plus implicit Init. Thus it imports none of its seven selected modules as a base dependency. The earlier singleton bases include current modules, all with previously completed matching build/replay receipts. Every successful dependent build begins after its required current dependencies are built; every selected replay follows its own final-source build. No imported current dependency lacks earlier replay or overlaps the dependent replay. The joint check supplies an additional union replay over inherited imports only.

The accepted source closure is2413=7new+2406inherited. Including the three Audit modules gives2416; the driver and external library trees are outside these local mathematical counts. ResidualMAC3 alone reaches2411=6new+2405old, containing24 new theorems/nine definitions and excluding VarianceWitnessMAC3. The witness reaches2412=6new+2406old, containing25 new theorems/eight definitions and excluding ResidualMAC3. The union of all replay bases contains2410 nodes, including four current modules used by the earlier singleton checks. No local resolution failure, import cycle, target-in-base inclusion or explicit-name collision is found.

The2406 inherited source/object pairs resolve from sealed136:2401 previously inherited pairs plus all five accepted136 pairs. Independent hashing during11:35:27.610244–11:35:57.409171UTC found no mismatch or fallback against before138/sealed136. The failed136 SmoothProbe is excluded. There are139 inherited Lean path entries behind the current output directory. Preserved hashes identify reused objects; they do not recheck their bodies.

**All212 worker121 compiled-but-unreplayed modules, including its195 subset, remain inherited only.** They occur in the final joint base, not the earlier three bases; none is newly built or selected for replay. Nineteen historically accepted121 modules are also inherited, and no old unbuilt121 draft is admitted. The23 worker134 recoveries completed in135 retain that provenance and are not replayed again. The old Cone2GapM81F and three unbuilt134 drafts stay excluded; the separate MF25 replacement stays present. The four135 strip/residual modules are inherited, while its FallingGap and SourceFalling are outside the graph. No new compiled-unreplayed backlog is introduced.

The separately preserved old134 failed late Audit receipt remains controller-before138-pinned at `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, absent from the new initial preservation set and manifest. Its earlier late-failure bundle remains the record. Reconciliation preserves136's TIMEOUT and137's stopped/empty-event status, without reexecuting their commands or inferring who requested the stop. No later success backdates those histories.

### Finalizer and reports

The explicit seven-module finalizer list matches the independent source inventory. It requires matching-source successful build/replay/axiom-JSON references for each module and also a successful replay selecting exactly the seven-module set. The helper's general joint-set existence test does not itself require that joint receipt's entire source map to equal the final map; the audit independently verifies that the actual retained joint receipt does match all seven final hashes. The helper does not independently enforce an expected checker hash, derive axiom lists from compiler output, authenticate imported/runtime binaries or establish source correspondence. Those operational limits are not proof assumptions being silently discharged.

The finalizer removes the136 diagnostic list and uses135/136 predecessor manifests. `validation.json` is written before preservation assertions, so that file alone would not show full completion. Here the sole direct finalizer, events146–147, returns0 after later checks and writes. It records seven modules,26 theorem closures, empty exclusions, three unsuccessful build receipts,6007 unchanged prior inputs and78 indexed artifacts. The initial snapshot has6009 entries, excluding its own setup/checkpoint from the preservation count. Prior manifest counts101+86=187 correspond to135 and136; the broader predecessor archive count is191=103+88 including their manifest and last-verification files. Worker137 has zero changed artifacts. Reconciliation embeds136/137 receipts with the changes field deliberately removed; the remaining receipt fields and last four event records match their completed records.

The controller and archive contain80 changed artifacts:78 indexed paths plus `manifest.json` and `last-verification.json`. All indexed/controller/archive/current bindings agree. The finalizer checks the fixed root/contract and writes a posthoc binder for all three experiment script/result pairs. It then writes a report draft and manifest, verifies index hashes and writes last-verification. That record echoes already computed root/contract hashes; it is not a separate proof rerun. Its STOP=false observation describes the historical execution only.

The experiment binder authenticates retained script/result bytes, not the interpreter or all imported code at execution time. The inherited136 experiment script matches its archive/current/before138 hash; the scan input matches its controller-before138 pin but is absent from evidence-before. Event42 repeats the complete saved24/16 symbolic term records; event80 omits each case's examples, and event139 omits top-level moment examples. Omitted example values remain result-file evidence, not independent event duplication.

The local generated `report.json` has SHA256 `3122eaacfc527665d00e9e08e3db1cab504af38a1a0acf4409b637785be79ea1` and is a longer draft. It is neither byte- nor object-identical to the actual controller final report. The structured message at event151 parses exactly to the controller receipt report and `final.json`; event152 is `turn.completed`. The final.json SHA256 is `1b2eca43567b92ed072af2b1c12e867060cf648df39a857d2f05631d00a3e4c3`. Both draft and actual final report retain mathematical completion null. Completed worker status is not root completion.

### Deadline and retained observation times

All times are UTC on2026-10-16. Controller start is10:59:11.780162 and the1800-second deadline is11:29:11.780162. Host finish at11:24:09.143008 gives elapsed1497.3628458976746seconds,302.637154seconds before the deadline.

| Milestone | Time |
|---|---|
|First three-module replay finish estimate|11:10:41.527058|
|First successful Audit finish estimate|11:13:27.993365|
|BinomialVariance replay finish estimate|11:15:26.562457|
|SourceVariance replay finish estimate|11:16:34.726262|
|Second successful Audit finish estimate|11:16:43.006604|
|Final joint replay start/finish estimate|11:17:09.196429 /11:17:43.461815|
|Final successful Audit finish estimate|11:17:44.386598|
|validation.json current mtime|11:22:46.527467|
|final-check.json current mtime|11:22:47.511912|
|manifest.json current mtime|11:22:47.558363|
|last-verification.json current mtime|11:22:47.563154|
|events.jsonl mtime|11:23:27.291047|
|final.json mtime|11:23:28.375068|
|Controller host finish|11:24:09.143008|

Receipt finish estimates add recorded monotonic durations to pre-invocation filename timestamps; they are not independent process-exit wall-clock attestations. File mtimes are observations of writes, and events.jsonl mtime is not a separately timestamped last event. The archived last-verification copy mtime11:24:09.126122 is snapshot metadata, distinct from its original project write. All reported successful checking and finalization occurs within the nominal deadline. No worker139 observation enters this audit.

## Final integrity and observation boundary

The80-artifact composition is ten objects,34JSON files,24Lean files (eleven final sources plus thirteen snapshots), seven Python files and five Markdown files. The6007 prior inputs include148 Python cache files; six inherited administrative pins agree. All152 events and69 started items have matched completions. The343231-byte event log plus empty stderr agrees with the activity byte counter; the11:23:28.095345 heartbeat follows the event-log mtime by0.804298seconds. This is record accounting, not an independent process census.

The fixed root source SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract bytes are `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, and canonical compact sorted ASCII serialization is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. The manifest SHA256 is `91434e669638171e7c46e72b63e1b4b3801d2875c98377e8e088365185e5f7ba`; last-verification.json is `5a302089ec1e85f015b52e184989ee236ee58358f2c1424dd4c53f7de2191d00`. These preserved contract/index identities confer no new mathematical completion.

The final independent validation stability pass rehashed8959 inputs without change or absence during11:39:54.600589–11:40:32.882951UTC. The exact-request current/archive observation at11:40:32.900815 found no extra or missing138 file: **no new late138 evidence bundle is required**. The method94-input pass was unchanged during11:37:15.939486–11:37:15.987113. The2406-pair inherited check described above had no mismatch or fallback. These are the final project observations; subsequent review and sealing use audit files only, without extending the late-file observation window. Existing storage-only preservation operations are interpreted through content hashes, not inherited inode/ctime metadata.

The main audit and the following seven supports are sealed by the separate integrity file. The source-structure lexical-prefix limitation stated above remains explicit; all full-source hashes and declaration inventories are preserved.

| Support | SHA256 |
|---|---|
|[mathematical_source_hashes.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_mathematical_source_hashes.json)|`34828a50a95cada49fb96c0764a2f84ef28b9dcbb777733f3da9ec426dab380a`|
|[source_structure_audit.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_source_structure_audit.json)|`70bb6941b9055a58e11c3347e09c2d7b077792ae9c11d4d3a19f1f47365745a8`|
|[finite_domain_audit.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_finite_domain_audit.json)|`5fc62bcf2e681e15b5a74b742a57e9d3374cf62d29047bd839cf73b603d671fa`|
|[validation_audit.md](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_validation_audit.md)|`9054c5e5eab668eae18d3dce64cc6457b276c90f885e21031abab542b5df61a3`|
|[validation_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_validation_evidence.json)|`d4925954c22e4c671e52596a73e07308a67a6e37bf0b2f6d8e7689cc05660e0e`|
|[replay_method.md](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_replay_method.md)|`f06c376d2e889a6148552985f2b079b40e4ad6811eb88ba4d92d3fc4db58f4f7`|
|[replay_method_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000138_replay_method_evidence.json)|`0dd6b98d9cdb7335342cb62ace1afcae67e38682dd40b7951a8875c57a6ac02f`|


