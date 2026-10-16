# Worker000139 independent monitoring audit

Request `37bf1d20e23d45ac82d81edbb57c3fd5`. Archive-first static audit of completed worker139. Controller outcome is **completed**, returncode0, elapsed1510.1034517288208seconds. The protected mathematical completion remains null. This audit executes no project code, proof, Lean, checker, replay, experiment or finalizer; recomputes no polynomial coefficient, binomial value, moment, recurrence or gap; changes no project file; and gives no proposer assistance. Own calculations are limited to static parsing, hashing and finite input/index-domain counts. Active140 is outside the review.

The saved result has two distinct parts: an **all-integer-index exact raw-gap/moment equivalence for signed real seeds**, and a **sufficient discriminant criterion requiring nonnegative weights/seeds**. Actual-source equivalences retain the forward-factor ranges but remove the former overlap restriction on natural starting positions. The general source moment-gap sign remains unproved. A separately checked actual-source family proves genuine new LC coverage at every depth6t, t≥1, outside all three older sufficient criteria. The exact root theorem is **Conjecture63 ↔ InteriorCore63M37B**; its complement and full Conjecture63 remain open.

Nine accepted mathematical modules contain30 theorem declarations and eleven definitions. Final compilation, joint replay of all41 explicit declarations, and axiom printing of all30 theorem closures are retained. No new unbuilt or compiled-only mathematical source is admitted. Old compiled-import trust boundaries, including the unrecovered212 worker121 modules, remain separate from this new validation.

## Source inventory and binding

| Module (Markov prefix, M37B suffix) | Theorems | Definitions |
|---|---:|---:|
|BinomialAll|9|1|
|MomentAll|4|5|
|SourceMoment|3|0|
|MomentSupport|3|0|
|SharpRegion|2|1|
|SourceSharp|3|3|
|SharpWitness|2|0|
|SupportObstruction|3|0|
|Residual|1|1|

All nine final archived mathematical sources match their exact named current counterparts, validation hashes and theorem inventories. Twenty-six named older source comparisons match before139 and their prior source pins, including `MathGKM.MarkovLogConcavity` for `CoeffSeq`. Twenty-five are in the accepted import closure; the preserved138 VarianceWitness is comparison-only and is not imported here. Full mathematical source files were read directly. This round's source-structure extraction stops at the actual `:= by` proof delimiter, retaining inner let assignments in theorem statements. The mathematical-source support also binds the five prose documents, three new experiment script/result pairs and two inherited experiment scripts. Hash equality does not create a fresh proof of an inherited declaration.

## All-index zero extension and binomial reconstruction

`zchooseM37B n k` has natural n and integer k. It returns zero when k<0 and otherwise casts `Nat.choose n k.toNat` into ℝ; natural choose vanishing handles k>n. The inherited `CoeffSeq P k` similarly tests k<0 **before** using k.toNat. No negative coefficient is identified with coefficient0 by truncated conversion.

The raising identity `k B(n+1,k)=(n+1)B(n,k−1)` separately handles negative k, zero, and a positive natural lift. The keeping identity `(n+1−k)B(n+1,k)=(n+1)B(n,k)` separates negative k, the natural bounded case and the beyond-degree zero case. Its real subtraction is justified by the appropriate natural bound when a cast is used. These identities yield all three second-order products for B(n+2,k), with no endpoint or overlap premise.

The monomial-shift coefficient lemma separately handles negative total k and the natural r>k case. Summing over P.support proves the full convolution

```
CoeffSeq((1+X)^n P,k) = Σ[r∈P.support] P[r] B(n,k−r)
```

for every real polynomial P, natural n and integer k, with no degree bound or sign assumption. A finite support sum omits only zero seed coefficients; it does not delete zero positions from the tested raw triple. The zero polynomial and positions beyond its degree are included.

For each seed index r define x_r=k+2−r and the **unnormalized** weight `q_r=P[r]B(n+2,k+2−r)`. Let W=Σq, U=Σqx, V=Σqx², H=n+2 and D=(n+1)(n+2). The saved reconstruction theorem proves

```
V−U = D Q[k],
HU−V = D Q[k+1],
H(H−1)W−(2H−1)U+V = D Q[k+2],
Q=(1+X)^nP,
```

where Q's coefficients are zero-extended at integer indices. The proof multiplies the three raising identities by each P[r] and sums them. There is no division by x_r, H−x_r, a coefficient or W, so x_r=0,H and vanishing weights present no omitted case.

The next ordinary ring identity is

```
D² (Q[k+1]²−Q[k]Q[k+2])
  = (n+1) {U(HW−U)−H(WV−U²)}.
```

The audit reads this saved proof without expanding or evaluating it. Both D² and n+1 are strictly positive for every natural n, including n=0. `moment_lc_iffM37B` therefore proves equivalence with nonnegativity of `momentGapM37B` for every integer k and **signed** real P. It does not assert that the gap is nonnegative. The named `integer_moment_lc_iffM37B` maps ℤ[X] into ℝ[X] and transports the exact inequality for **natural** k. Negative-index coverage is furnished by the generic real-polynomial theorem, not silently added to the named integer-corollary signature.

## Exact source moment equivalences

Each source conclusion concerns `(frame path).mid.p` at every natural start in its stated factor range. No seed-nonnegativity or overlap condition is needed for these equivalences:

| Direction | Remaining factor hypotheses | Moment seed and exponent | Literal source triple |
|---|---|---|---|
|Horizontal|2j+1≤b|horizontal residual, n=b−2j−1, k=i|`(i,j),(i+1,j),(i+2,j)`|
|Vertical|2i+1≤a|vertical residual, n=a−2i−1, k=j|`(i,j),(i,j+1),(i,j+2)`|
|Diagonal|i+j+2+r=D₀=a+b−1 and2r≤D₀|quotient slice at r, n=D₀−2r, k=i|`(i,j+2),(i+1,j+1),(i+2,j)`|

The horizontal factor rewrite uses the retained coefficient swap, the vertical rewrite uses the protected coefficient abbreviation, and the diagonal rewrite proves the omitted-depth equality at each of the three raw positions. Uniform positive factors are used only to establish the equivalence; the target is never normalized. Neither r≤i,j nor the older full-overlap conditions are present in the new diagonal moment equivalence. The explicit2r≤D₀ forward range remains. These are exact adapters to an unresolved sign condition, not unconditional LC over the whole forward range, and they do not cancel smoothing in reverse-factor ranges.

## Discriminant support criterion

`support_moment_gapM37B` takes any finite set, real q,x,A,B,H, with H>1, q≥0 and `A≤x_r≤B` only where q_r≠0. It assumes

```
H(A+B−1)² ≤ 4(H−1)AB.
```

There is no hidden A≥0, B≤H, A≤B, positive-mass or no-zero-weight premise. The proof splits q_r=0 before using support bounds and sums `q_r(x_r−A)(B−x_r)≥0`. This gives `V≤(A+B)U−ABW` and bounds the moment gap below by

```
T=(H−1)U²−H(A+B−1)WU+HABW².
```

The completed-square identity multiplies T by the strictly positive4(H−1); its other terms are a square and the nonnegative discriminant remainder times HW². This includes W=0 and an empty support without division. The sign conclusion requires the weight nonnegativity; the preceding signed-seed identity does not remove that premise.

For polynomial seeds, weight nonnegativity follows from P[r]≥0 and zero-extended binomial nonnegativity. `binomial_lc_supportM37B` is valid at every integer start provided its active-weight interval and discriminant condition hold. `binomial_sharp_lcM37B` supplies that interval from natDegree(P)≤hi and P[r]=0 for r<lo, with A=k−hi+2 and B=k−lo+2. Its exact predicate is

```
SharpRegion(n,k,lo,hi):
 (n+2)(2k−hi−lo+3)² ≤ 4(n+1)(k−hi+2)(k−lo+2),
```

with natural n,lo,hi, integer k and **real arithmetic throughout the displayed subtraction**. It contains no overlap, nonnegative-start or lo≤hi clause. If lo>hi the seed premises force P=0. Internal zeros are permitted; no attained support endpoint is required. The integral corollary again has natural k and retains the unscaled raw product inequality.

## Source discriminant regions and exact root reduction

The source predicates apply SharpRegion to inherited exact forward factors and the previously proved floor-derived zero-below bounds:

| Direction | Range | n | lo | hi | Tested k |
|---|---|---|---|---|---|
|Horizontal row j|2j+1≤b|b−2j−1|a−⌊aj/b⌋|a+j|i|
|Vertical column i|2i+1≤a|a−2i−1|b−⌊bi/a⌋|b+i|j|
|Diagonal depth r|i+j+2+r=D₀,2r≤D₀|D₀−2r|0|r|i|

All factor/subtraction guards remain explicit. Lower support means coefficients vanish below the bound, not that the first coefficient is positive; upper bounds need not be attained. Inherited coefficientwise nonnegativity supplies the sufficient-sign theorem's premise. There is no assumed residual LC, external seed formula or arbitrary-polynomial-as-source substitution. All three source conclusions use precisely the literal raw triples above, allow zeros and require no additional polygon condition beyond their stated sufficient region.

Static text comparison shows `InteriorCore63M37B` is exactly `InteriorCore63MAC3` with one added negated Sharp predicate per direction. All three original polygon memberships in each clause remain, using `ab≤bi+aj` and `i+j≤a+b−1` on natural indices. The old square-margin and pair/variance exclusions also remain. Horizontal residual conditions are still j≥5 and i+j+4≤D₀; vertical i≥4,j≥3 and i+j+4≤D₀; diagonal i+j+8≤D₀, a+5≤i+j+2 and a+2≤b. The path clause retains a≥2, and both root endpoints0/1 and1/1 persist through the inherited equivalence.

The reverse implication of `root_iff_interiorM37B` splits whether the corresponding Sharp predicate holds; the positive case uses its proved source theorem and the negative case invokes the remaining residual. The residual itself is never asserted. In particular, a new moment equivalence is not used as a proof of a missing moment-gap sign.

## Unbounded actual-source expansion

`right_left_left_labelsM37B` proves the labels of the actual frame path `true^n ++ [false,false]` from frame transitions and the inherited right-ray/one-left label results. `unbounded_sharp_onlyM37B` then quantifies over **every natural t≥1** and chooses

```
n=6t²+2t−1, path=true^n ++ [false,false],
a=3n+1, b=3n+4,
r=6t, i=j=18t²+3t−2.
```

The proof explicitly resolves the natural subtractions through n+1=6t²+2t and i+2=18t²+3t. It proves the exact total i+j+2+r=D₀, the forward range, all three polygon guards and all prior residual guards. For these parameters H=D₀−2r+2=r² and A+B=H. The saved source proves the discriminant inequality as an equality by real-cast identities and ordinary ring normalization; this audit does not recompute it.

The witness negates `DiagonalMiddleMF1E`, `DiagonalRegionMAC3` and `DiagonalVarianceMAC3`. Each proof uses the total equation to force any existential depth witness to equal6t, so the exclusions are not limited to one arbitrary representative of those predicates. The natural-subtraction and real-cast steps in the pair exclusion have explicit bounds. The resulting raw LC is invoked from the new actual-source Sharp theorem.

Thus the family lies in the previous exact residual and is covered by the new criterion at **every positive multiple of six in depth**, across varying actual sources. It does not cover all depths or all positions, assert infinitely many depths in one fixed polynomial, or establish strict LC/strict coefficient positivity. Failure of the three auxiliary sufficient criteria is not failure of the raw inequality, which is proved here.

The prose's t=1 illustration has source22/25 and raw points(19,21),(20,20),(21,19). Its displayed large coefficient numerals are saved finite evaluations, not an independent audit computation or a separate numeral-evaluation theorem in the witness module. The universal raw inequality is the formal witness theorem.

## Symmetric obstruction and auxiliary failure

The symmetric two-point theorem uses equal unit weights at A=(H−w)/2 and B=(H+w)/2. For arbitrary real H,w it proves the moment-gap identity `H(H−w²)`; for H>0 the second theorem proves nonnegativity equivalent to w²≤H. No w≥0 premise is required for that algebraic identity; interpreting w as a support width conventionally orders or swaps the two points. This establishes the exact obstruction in this symmetric model, not optimality over all asymmetric intervals or actual Markov residual distributions.

The separate theorem proves, for the ordinary polynomial `Q=(1+X)^12(1+X^4)`, the strict failure `Q[8]²<Q[7]Q[9]`. Its saved proof uses ordinary coefficient formulas and `norm_num`, not native evaluation or a new axiom. The prose records the triple1012,990,1012. No coefficient is recomputed by this audit. This is an auxiliary nonnegative-seed example. **No source identification, and no formal theorem excluding every possible actual-source representation, is supplied here.** The report's “non-source polynomial” wording must be read in that limited evidential sense; the Lean statement is only the auxiliary LC failure. It is not a refutation of Conjecture63 and does not weaken the proved guarded sufficient criterion.

## Finite domains, not universal sign proofs

The auditor reconstructs only input/index/guard domains. No polynomial, binomial value, seed coefficient, moment, gap or failure test is recalculated; no research module is imported. The preserved inherited mechanical-word code and original recurrence comparisons remain finite saved evidence.

The main source scan has241 reduced fractions1≤a<b≤28 and7063 forward-range horizontal/vertical rows and diagonal slices. Each row of stored length L=d−r+1 tests k=−3,…,L+2, giving230901 triple positions. Static guards count176767 outside the old overlap range,43469 satisfying SharpRegion and8383 satisfying SharpRegion but neither the pair nor variance criterion. **The8383 number does not impose all old exact-root residual guards or exclude every previously covered case.** The saved100832 zero-containing triples, empty failure list and coefficient/moment identities are not independently evaluated.

The generic scan has558 seed slots: n=0,…,30, degree bound0,…,8 and two sign choices, of which279 are designated signed. It tests k=−4,…,n+degree+3, giving15066 triples;2101 positions in the unsigned half satisfy SharpRegion. Each call checks three scalar reconstruction identities and one gap identity. Thus15066 is a count of triple positions, not a count of individual scalar identities. Saved5268 zero triples and96 negative-gap occurrences among signed samples are recorded-only; they contradict no unconditional sign theorem, because none is asserted for signed seeds.

The exact residual-gain scan through denominator32 visits323 reduced fractions. After every old residual/polygon guard and all three earlier criterion exclusions, its forward-range domain contains116192 old-residual triple positions. Exactly538 meet SharpRegion, all diagonal. The support records their indices; no raw value is evaluated by the audit. The old vertical exclusion is checked against its existential natural c through the constant lo=0 tail, agreeing with the experiment's ceil(b/a) representative on these finite domains.

Four larger fixed cases add38 newly covered horizontal/vertical residual positions:

| Source/direction | Fixed row/column | Sharp triples | New residual triples |
|---|---:|---:|---:|
|50/251 horizontal|j5|228|4|
|101/401 horizontal|j6|364|6|
|321/641 vertical|i4|246|14|
|501/751 vertical|i5|413|14|

These1251 Sharp triples have natural starts0,…,d−r−2 and the literal three polygon guards;38 also lie outside all earlier criteria and within the old residual. Their sources have denominators above32, so the combined538+38=576 positions are disjoint from the small residual scan. This total is a finite coverage count, not the proof of unbounded expansion.

The three finite samples of the formal family use t=1,2,3, with labels22/25,82/85,178/181 and depths6,12,18. The stored raw values are not recomputed, and the unbounded quantifier comes from Lean rather than these samples. The actual-source scan's sign assertions and the symmetric/auxiliary obstructions do not discharge the general sign obligation outside the sufficient regions. Proposed next steps remain unproved and are not developed or recommended in this audit.

## Retained validation and chronology

The final inventory agrees with mathematical-modules.json, independent enumeration of declaration-bearing sources, validation.json, successful build snapshots, the joint replay selection and the sole Audit's requested names. The eighteen numbered build receipts have eighteen matching immutable snapshots: ten successes (nine mathematics and one Audit), eight returncode1 failures and no timeout. No successful source was superseded and no rejected snapshot equals final bytes. All nine successful final-source builds precede joint replay and axiom auditing.

The eight rejected builds comprise two BinomialAll, three MomentAll, one MomentSupport and two SharpWitness versions. The early BinomialAll snapshots contain six theorems and one definition, while the final source adds three coefficient-extraction helpers; the first also lacks the explicit MathGKM.MarkovLogConcavity import and fails on unknown CoeffSeq. These are inventory/import changes, not only proof-body edits. The first MomentAll draft's `0≤momentGapM37B` tokenization is rejected as `≤m` notation plus an unknown remaining identifier; spacing repairs the intended expression. Related witness proof tokens are also corrected. Whitespace-normalized text equality cannot establish parsed-statement equivalence for invalid source. Other failures concern multiplication orientation, redundant casts, coercions, nonnegativity and proof-body certificates. Elaborator-generated sorry placeholders in failed diagnostics are not admitted source proofs. Final sources and the30 permitted axiom closures determine accepted evidence.

### Joint replay and inherited trust

The replay driver SHA256 is `50a3beb6cabbf8ae5003f10bd5556075e382c3ef97ef22015780b907d621f517`. It and the build/Audit wrappers are exact138 retags, preserving the normalized original Wide Replay body, compiler `-j1`, replay stack131072, joined task/result propagation and180-second Audit timeout. No checker/parser/stack bypass is found.

One successful replay selects all nine current modules and all41 explicit declarations. The driver excludes selected modules from its direct-import union, constructs the inherited environment and invokes ordinary replay on selected module-data constants, including available private/server parts. Its guard rejects collected `MathGKM.Markov.*M37B` names already imported or marked unsafe/partial. All41 explicit declarations satisfy that predicate and match final inventories without duplication or target-in-base inclusion. Generated/private declarations outside the predicate retain ordinary replay handling. The audit does not decode every compiled part, freshly authenticate external executable/library binaries or rebuild all imported bodies. Selected source hashes are measured before subprocess invocation, checker-source hashes after return and Audit source maps after Audit compilation; those observations are not continuous runtime attestations.

The single Audit imports all nine final modules and prints all30 theorem names with exactly `{propext, Classical.choice, Quot.sound}`. Its source/snapshot, requested names, compiler output, axiom JSON source map and validation references agree. Definitions participate in replay but do not add print rows. Audit starts22.220milliseconds before replay, and finishes2.129843seconds after it. The checks overlap; an axiom print is not evidence that replay had already completed at Audit start.

The joint inherited mathematical base has2412 nodes and no139 target. Its five explicit direct imports are BinomialVarianceMAC3, SourceVarianceMAC3, ResidualMAC3, InteriorWitnessMF1E and MathGKM.MarkovLogConcavity; implicit Init makes six total direct imports. Every current dependency is successfully built before its dependent successful build. There is no earlier139 replay: current bodies are checked together over inherited imports, rather than being trusted as new imported bodies.

The accepted source closure is2421=9new+2412old; adding the single operational Audit gives2422. The driver and external library source trees are outside these local counts. No local cycle, unresolved source or selected-name collision is found. Individual roots have these narrower scopes:

| Root | Local closure | New/inherited modules | New theorems/definitions |
|---|---:|---:|---:|
|Residual|2417|6/2411|22/11|
|SharpWitness|2417|6/2411|23/10|
|SourceMoment|81|3/78|16/6|
|SupportObstruction|11|4/7|19/6|

Residual excludes the standalone SharpWitness, SourceMoment and SupportObstruction modules. SharpWitness excludes Residual, SourceMoment and SupportObstruction. All nine modules nevertheless participate in the final joint replay and Audit. No single root is claimed to import every accepted module.

All2412 inherited source/object pairs resolve from sealed138:2406 previously inherited pairs plus six accepted138 modules. The138 VarianceWitness is absent; the other six are present. Independent current hashing during12:04:26.097304–12:05:08.615816UTC found no mismatch or fallback against sealed138 and before139. The new explicit CoeffSeq import was already in that prior inherited closure: source MathGKM/MarkovLogConcavity.lean SHA256 `458b5ff6169b3f09ceaed75a31f213a202257874620bda185a3752401a7a69a6`, retained object evidence/markov-1998e47e/MathGKM/MarkovLogConcavity.olean SHA256 `c22d6f15405e0958668a5f4530110256ec016fadc79549e0153946cf5ab84cfa`. A new direct import is not a fresh rebuild or new proof provenance. The inherited Lean path has140 entries behind the current output directory.

**Worker121's212 compiled-but-unreplayed modules, including the195 subset, remain inherited and unrecovered.** None is a139 build/replay target. Nineteen historically accepted121 modules are also inherited, with no old unbuilt121 draft admitted. All23 worker134 recoveries completed in135 retain that provenance; their receipts are preserved, not rerun. Old Cone2GapM81F and three unbuilt134 drafts remain excluded, while its separate MF25 replacement remains distinct. Four135 strip/residual modules and all five accepted136 modules are inherited;135 FallingGap/SourceFalling and136 SmoothProbe remain absent. No historical timeout or failed check is upgraded.

The old134 late failed Audit receipt remains controller-before139-pinned at `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, absent from this round's initial preservation set/index and retained in its original separate late bundle. No new139 success backdates that failure. Reconciliation preserves136 TIMEOUT,137 stopped/empty-event and138 completed status, deliberately projecting receipts by removing only changes and separately checking effects. It embeds the last three events, not the last four used in138. It neither reruns those commands nor infers who stopped137.

### Finalization, preservation and report binding

The nine-module list is loaded from mathematical-modules.json rather than hard-coded in the finalizer. Independent enumeration verifies completeness. Per-module predicates require matching-source successful build/replay and named theorem membership in matching-source axiom JSON, with no listed exclusions. A further predicate requires a successful replay selecting exactly that module set. Set equality alone does not require every source hash in that receipt to match the final map; the audit separately verifies that the actual joint receipt matches all nine final sources. The helper does not independently enforce an expected checker hash, parse axiom truth from compiler output, authenticate executable/imported binaries or establish mathematical source correspondence. Those saved associations are checked independently here.

The controller/archive inventory has87 changed artifacts:85 indexed files plus manifest.json and last-verification.json. All exact current/archive/controller/index bytes match. The initial preservation set has6034 entries and excludes **only the worker's setup source**, leaving6033 unchanged prior inputs including151 Python cache files; its checkpoint was not an initial entry. Selected predecessor indexes contain164=86(worker136)+78(worker138) paths. Independent checks also cover their168 full controller artifacts, including manifest/verifier files;137 contributes zero changes. All23 old135 recovery receipts are separately preserved. Reconciliation receipt projections, last-three-event records and source pins match.

validation.json is written before preservation assertions. Here the sole finalizer events176–177 return0 after later checks and writes, so completion does not rest on that early summary alone. It checks the fixed root/canonical contract, writes posthoc bindings for three experiment script/result pairs, a draft report and manifest, verifies the index, and writes last-verification.json. The latter echoes already computed root/contract hashes; it does not rerun the proof checks. The new final-check `finished_utc` is the summary-generation timestamp, not the finalizer process exit or mathematical completion. STOP=false is a historical observation only.

The experiment result's input map binds the new script, inherited138 and136 experiment scripts and scan.py near the end of execution. The finalizer binder matches all three script/result pairs. Neither establishes invocation-start interpreter identity or every transitive import. Event107 omits examples and witness_family, event156 omits examples, and event171 omits each case's examples; the remaining records agree with the corresponding result JSON. Omitted numerical values remain result-file evidence, not independently duplicated event data.

The indexed report.json is a longer generated draft, SHA256 `8aa35ada76b71ba27148726a9719c5d851de3a17c87c9a7690ee003aa903def3`. It is distinct from the delivered report. The final structured message at event178 parses exactly to final.json and the controller receipt report; event179 is turn.completed. final.json SHA256 is `10a405d2278a08ea7b1b66881db03739e6a3783177d868cb63c7ea7786759688`. Mathematical completion remains null in both reports; completed worker status does not close the root.

### Exact deadline chronology

All times are UTC on2026-10-16. Controller receipt start is11:25:11.924353, giving a nominal deadline of11:55:11.924353. The operational prose instead labels11:25:25 as start; deadline arithmetic uses the precise controller record, without inferring why the prose differs. Host finish11:50:22.027805 gives1510.1034517288208seconds elapsed and289.896548seconds remaining before the deadline.

| Retained milestone | Time |
|---|---|
|Last mathematical build finish estimate|11:43:36.884704|
|Audit start|11:44:05.077516|
|Joint replay start|11:44:05.099736|
|Joint replay finish estimate|11:44:42.472053|
|Audit finish estimate|11:44:44.601896|
|validation.json mtime|11:49:15.013377|
|final-check summary-generation timestamp|11:49:15.741239|
|final-check.json mtime|11:49:15.741544|
|manifest.json mtime|11:49:15.784919|
|last-verification.json mtime|11:49:15.788608|
|events.jsonl mtime|11:49:45.515619|
|final.json mtime|11:49:46.575711|
|Controller host finish|11:50:22.027805|

Receipt finish estimates add monotonic durations to pre-invocation filename timestamps; they are not independently observed process-exit times. File mtimes identify retained write observations; events.jsonl mtime is not an independently timestamped last event. The archived last-verification copy mtime11:50:22.017488 is a later snapshot time, distinct from its11:49:15.788608 project write. Successful current checks and finalization finish within the nominal deadline. No active140 record is part of this review.

## Final independent bindings and observation boundary

The87 artifacts comprise ten objects,35JSON files,29Lean files (eleven final sources plus eighteen snapshots), eight Python files and five Markdown files. Six inherited administrative pins agree. All179 events and83 started items have matched completions. The503449-byte event log plus empty stderr matches the activity byte counter; heartbeat11:49:45.919774 follows event-log mtime by0.404155seconds. This is retained-record accounting, not an independent process census.

The fixed root source SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract bytes are `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical compact sorted ASCII serialization is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. The manifest SHA256 is `8dca19a90a3df6c95ab25e73ff8d25824023ca4dcb4ee91c5ef4693eabad0241`; last-verification.json is `f32f8439f273069ef701827edb90cc158c8583ca34991d707a9c529f44836aea`. These identities preserve the target and evidence; they do not close the root.

The final validation pass rehashed9006 inputs without change or absence during12:13:23.057582–12:14:03.697280UTC. Exact-request current/archive observation at12:14:03.722246 found no extra or missing139 file, so **no new late139 evidence bundle is required**. The method's99-input pass was unchanged during12:07:08.118438–12:07:08.224194. The2412-pair inherited pass had no mismatch or fallback. These are the final project observations; subsequent crossreview and sealing use only audit files and do not extend that observation window. Content hashes remain the binding after older storage-only preservation operations; inode/ctime differences supply no validation upgrade.

Before sealing, the audit helper's older-source comparison list was accidentally overwritten by a Boolean finite-domain variable during JSON serialization. All26 equality assertions had already passed before that overwrite. The list was restored from the previously verified audit mappings and CoeffSeq pins, without rereading project files or recomputing mathematics; the independent reviewer then matched every restored pin against saved evidence. The final mathematical hash support records the correction explicitly. No source, receipt, mathematical scope, finite count or historical outcome changed. The helper variable was renamed; it was not rerun for this correction.

The separate integrity record binds this main and the following seven final supports. The complete theorem-header extraction used here retains let binders and is distinct from the prefix limitation documented for138.

| Support | SHA256 |
|---|---|
|[mathematical_source_hashes.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_mathematical_source_hashes.json)|`de9f1c6f08e5caa5a361f4d8641ec463bec9fa483d43f245a50270f31546d632`|
|[source_structure_audit.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_source_structure_audit.json)|`c0e81cd40cb541a264195cf285b2c3cabdaa96f0b0b6eaed058f89b6b414f529`|
|[finite_domain_audit.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_finite_domain_audit.json)|`88d2b165e40fdcc6003bc41b2263e1002bce7510c4347c230678108da36275e3`|
|[validation_audit.md](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_validation_audit.md)|`f42cee1a46ff089d806d73ef7116389d46214ba28eecd92d817f50d2b5e320b6`|
|[validation_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_validation_evidence.json)|`76146c48d7e349eef941781172ed338a2251e411d03a356484207bb799df5767`|
|[replay_method.md](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_replay_method.md)|`cfb58b3c4051537d0f174154532a6a7f9eb4caf20983d1c9ff2419250ff25d6f`|
|[replay_method_evidence.json](/private/tmp/math_gkm_godel_20261013/markov_worker_000139_replay_method_evidence.json)|`603046856f274671d9bc555176c9c7b98e014b6c5b541496f473c6b454aae575`|


