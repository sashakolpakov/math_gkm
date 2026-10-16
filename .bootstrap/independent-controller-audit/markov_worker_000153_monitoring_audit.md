# Worker 153: independent static audit of a timed-out partial result

Request `a24fe23da04d441088b5fe10c2c4681e`; archive `/Users/sasha/math_gkm/.control/markov/workers/000153/artifacts`. The controller outcome remains **timeout, returncode 0, report null**. The archive retains successful checks and finalization for a selected partial result, but no final.json, delivered structured report or turn.completed. None of those successful partial checks upgrades the historical worker outcome or proves the full root.

This archive-first review uses completed records and explicit named inherited/current counterparts only. No project program, Lean proof, checker, replay, experiment, generator or finalizer was executed. No coefficient, binomial, polynomial, recurrence, gap, sign or random draw was recomputed. Own computations are static parsing, byte hashes and input-domain counts, including support-index inequalities. No project edit, proposer contact or research guidance occurred. Active worker 154 is outside the review; prior seals and observation windows remain final.

**The accepted mathematics proves uniform order and midpoint comparisons for individual Pell summands, with the exact band `q≤r+2`, and formally refutes the proposed remaining midpoint premise.** It also proves that every constant natural shifted-min/max certificate fails at one fixed source parameter. The actual 5/6 raw triple used there satisfies LC. These are auxiliary results and obstructions; no new complete raw-source direction or new root equivalence is established.

Ten final mathematical modules contain **30 theorem declarations and four definitions**, all with matching successful saved builds, selected joint replay and explicit theorem closures. Three further mathematical sources contain fourteen unvalidated theorem occurrences: two final versions timed out, and one was never built. All selected final versions are checked; there is no compiled-but-unvalidated mathematical module. The full root residual remains the inherited `OtherSourcesM679`, with worker 152's numerator-two completion intact.

## Exact summands, indices and support

`pellTermMA24 a j s q` is exactly the real cast of inherited `horizontalTerm9a72 a j q s`. The prose and experimental parameter is **`k=s+1`**, so the displayed product is

`H(a,j,k,q) = C(a−q,k) C(k+q−1,q) C(2k,j−q)`, for `k≥1`.

The Lean definition has an explicit `q≤j` guard, natural binomial subtraction and zero extension. In particular `q>a` makes `a−q=0`; since the lower binomial index is `s+1>0`, the term vanishes. This constituent is not itself the complete raw coefficient.

The exact universal support theorem is

`0 < pellTerm a j s q ↔ s+q+1≤a ∧ q≤j ∧ j≤2s+2+q`.

Nonnegativity holds for all natural parameters. The universal comparisons explicitly split zero extremes before using this support to justify interior calculations. There is no positivity restriction silently imposed on the final summand comparisons, nor any deletion of raw zero positions.

`pell_term_q_stepMA24` is a denominator-cleared equality under `s+q+2≤a`, `q+1≤j` and `j≤2s+2+q`. It derives from exact natural binomial recurrences with guarded subtraction casts. The displayed ratio in the documentation is therefore an interior interpretation of this multiplied equality; the formal statement does not divide by a potentially zero term at arbitrary indices.

The actual source family is inherited, not guessed from finite matches. `source_near_one_path650` says that every actual path with `mid.b=mid.a+1` is `List.replicate n true`; its exact labels are `a=n+1,b=n+2`. `right_horizontal_sum_fixed9a72` identifies the raw coefficient when `s≤n` and `i+j=n+s+2` with the sum over `q=0..n+1` of these integer summands. The added terms beyond the smaller natural support vanish exactly. Thus the source horizontal movement `i,i+1,i+2` corresponds to `s,s+1,s+2` at fixed `j`.

The module name `PellDiagonalStep` concerns movement in the auxiliary summand parameter and `q`. It is not a theorem about the original root's diagonal direction.

## Ordering, row CrossLC and the proved midpoint band

`pell_rr2MA24` proves, for all natural parameters,

`H_s(q) H_(s+1)(q+1) ≤ H_s(q+1) H_(s+1)(q)`.

Its interior calculation uses the exact gap identity, in the source's notation,

`A B (E+3) − (A−1)(B+1)(E+1) = A(j+q−1)+(B+1)(E+1)`.

The support hypotheses give the needed signs, and the clearing scale is proved strictly positive before cancellation. Outside that interior, a zero extreme gives the inequality from nonnegativity. `pell_order_globalMA24` extends the comparison to arbitrary `q≤r` by induction, still comparing **adjacent parameters `s,s+1`**. Its intermediate summand is proved positive from the endpoint supports before cancellation. The prose “reverse total positivity” should not be read as a separately stated all-`s,t` minor theorem beyond these formal statements.

`pellSeqMA24` extends the summand to every integer `q` as a product of a reversed choose sequence, a negative-binomial sequence and a reversed binomial coefficient sequence. The inherited CrossLC/product/reversal theorems apply with the required nonnegativity. The natural-index equality splits `q≤j` and `q≤a`; negative or excessive indices are retained as zeros. Its CrossLC is the full all-integer inward-product property, not merely adjacent LC with a missing interval-support argument.

That row property gives the exact floor/ceiling midpoint comparison at fixed `s`, for arbitrary natural `q,r`. Parameter LC of a fixed summand is inherited from `horizontal_term_lc9a72`. Combining the adjacent-parameter order with that LC gives the ordered product for `q≤r`; row balancing then proves the first half of the proposed cross-parameter midpoint inequality.

The new parameter-step equation retains the upper support boundary: it assumes `s+q+1≤a`, `q≤j`, `j≤2s+2+q`, and cancels only the strictly positive scalar `s+2`. Two guarded recurrences, zero-extreme splits and an explicitly nonnegative scalar gap prove the reverse-one case `q=r+1`.

The auxiliary diagonal-step equality assumes `s+q+2≤a`, `q+1≤j`, `j≤2s+3+q`. It too is cleared and cancels only `s+2`. For the reverse-two comparison, positive extreme supports give `A=a−q≥s+3`, `D=j−q≥2` and `E=2s+2−D≥−2`. The scalar comparison follows from a nonnegative product and square. Every factor in the final clearing scale is proved strictly positive. No unproved sign or formula hypothesis remains, and no zero summand is canceled.

`pell_midpoint_bandMA24` combines these cases with exact natural floor/ceiling identities. Its final scope is every natural `a,j,s,q,r` satisfying **`q≤r+2`**:

`H_s(q) H_(s+2)(r) ≤ H_(s+1)(floor((q+r)/2)) H_(s+1)(ceil((q+r)/2))`.

This is uniform in all parameters and includes zeros. It does not establish the unrestricted midpoint inequality.

## Formal obstruction and the conditional source transfer

The accepted `MarkovPellBandMA24` proves a strict summand failure at

`(a,j,s,q,r)=(22,25,2,19,16)`, with middle indices 17 and 18.

Here `s=2` means the documentation's `k=3`, and `q=r+3`. `not_pell_reverse_midpointMA24` uses that failure to prove **`¬PellReverseMidpointMA24`**. The obstruction is therefore part of the accepted, replayed and printed result, despite the larger failed obstruction drafts.

`FiniteMidpointSumMA24` is an explicitly unproved proposition about three nonnegative real sequences on natural indices and a common finite range `0..N`. It assumes the full midpoint comparison for every `q,r≤N`, and concludes the product-of-sums inequality. The natural floor/ceiling targets remain in that range. No retrieved discrete summation theorem is installed as an axiom.

`PellReverseMidpointMA24` asserts the remaining `r+3≤q` summand comparisons. The accepted conditional lemmas retain **both** this premise and `FiniteMidpointSumMA24` as arguments. One is now formally false, so these implications cannot supply unconditional LC of the sum or a viable remaining proof obligation for the root. The saved literature discussion recognizes this limitation; the auditor read that note only and did not retrieve or validate an external theorem.

The conditional source adapter is precise. It assumes an actual path with `b=a+1`, the two explicit propositions above, and original polygon membership at `(i,j)` and `(i+2,j)`. It concludes the original raw horizontal inequality. It handles `j=0` with the inherited boundary theorem. For `j>0`, source classification and the endpoint polygon inequalities yield

`s=i+j−(n+2)` and `s+2≤n`.

The three exact raw sums have parameters `s,s+1,s+2`, common bound `N=n+1`, and are transferred by injective integer/real casts without coefficient normalization. Middle polygon membership is not an additional premise of this formal adapter. The theorem is still conditional on the false reverse-midpoint assertion.

The pinned root's literal directions remain H `(i,j),(i+1,j),(i+2,j)`, V `(i,j),(i,j+1),(i,j+2)`, and D `(i,j+2),(i+1,j+1),(i+2,j)`. Its polygon is `a*b≤b*i+a*j` and `i+j≤a+b−1`. No endpoint clause, zero, direction or larger-numerator obligation is removed. The Pell raw diagonal was already proved in inherited `source_near_one_diagonal0618`; this request does not newly close Pell horizontal/vertical or any other complete source direction. The exact worker-152 root equivalence and `OtherSourcesM679` definition are preserved unchanged.

## Shift obstruction, actual raw witness and unvalidated claims

`pell_no_shiftMA24` proves that **for every natural constant `c`**, the shifted comparison with target indices

`min(q,r+c)` and `max(q,r+c)−c`

fails at fixed `a=5,j=6,s=0`. If `c≤1`, the witness pair is `(q,r)=(4,0)`; if `c≥2`, it is `(4,2)`. Consequently choosing a different constant natural shift for each source parameter cannot make this particular parameter case work. The formal theorem concerns this orientation and natural shifts; the other orientation and negative shifts occur in finite probes, not an additional universal theorem here.

The actual path `List.replicate 4 true` has labels 5/6. Separate accepted theorems prove its raw horizontal triple **`[1,25,172]` at `(0,6),(1,6),(2,6)`**, all three original polygon memberships, and raw LC. Failure of the summand certificate is therefore distinguished explicitly from failure of the source inequality. The auditor did not recompute those values.

The claimed unbounded obstruction family `a=n+23,j=n+25` remains prose and unvalidated drafts. The four binomial term identities, positive gap identity and universal strict failure are not accepted theorems of this request. Two pending variants have different proof bodies; no algebraic repair, coefficient calculation or mathematical equivalence between them was supplied by the audit.

The 22/23 raw triple `[210,16340,641421]` is documented in prose and the timed-out MidpointObstruction draft. A static search of all completed command outputs found no explicit output containing 641421, 60648000 or 61047000. The larger saved finite scan covers these source positions and records no raw failure, but does not print the triple. Thus the exact displayed values remain a documented finite observation, not an independently recomputed result or accepted Lean witness. The accepted gap-three **summand** failure is separately validated; the accepted actual **raw** witness is 5/6.

## Accepted, rejected and unbuilt inventories

The ten accepted modules are Ratio, Order, Row, Half, Parameter, DiagonalStep, ReverseTwo, ShiftObstruction, MidpointReduction and Band, all suffix MA24. Their theorem/definition counts are respectively 4/1, 2/0, 5/1, 4/0, 3/0, 2/0, 1/0, 3/0, 3/2 and 3/0. The supports bind exact source/object hashes, successful snapshots and compiler receipts. Final mathematical source bytes contain no admission, new axiom, `native_decide`, unsafe or partial declaration.

Three further final sources are unvalidated:

- **MidpointObstruction:** seven theorem occurrences, final source SHA `e989ee83fa17ff4966af518b9b772e419f823f574c061a049092a852489809f4`. An earlier six-theorem snapshot timed out at 120 seconds; the final seven-theorem version itself timed out at 90 seconds.
- **UniformObstruction:** four theorem occurrences, source SHA `0748eb8cf729072b77352eb6e4c4a9a64243a77f5d99e9c899520328348bc8c0`, final source timed out at 45 seconds.
- **Sharp:** three theorem occurrences, source SHA `c5fbdb0ec8222997d200b70a86723686b7f0e9cc83e0a9dc9f49bd766df1ef6d`, no build attempt, and imports unaccepted UniformObstruction.

None has a retained object, successful build, selected replay or theorem-print coverage. A timeout does not establish which individual declarations may have elaborated before interruption. The generic validation-evidence field `unbuilt` means no successful final-source build; it must not be interpreted as no attempt for the first two files.

Sharp repeats two accepted Band theorem names; UniformObstruction repeats four pending MidpointObstruction names. The thirteen mathematical sources have **44 theorem occurrences but 38 distinct names**, comprising thirty accepted names and eight additional distinct pending names. Equal names do not validate another file's bytes, and Band's successful print does not validate Sharp's unbounded theorem.

There are **24 compiler receipts and matching source snapshots: twelve successes, nine returncode-1 failures and three wrapper timeouts**. Successes are ten mathematical builds and two Audit builds. The ordinary failures concern Ratio three times, Order once, Half once, DiagonalStep once, ReverseTwo twice and MidpointReduction once; all differ from their final accepted source versions. No superseded successful own-source version or compiled-but-unvalidated mathematical module is retained.

Mathematical build bounds are generally 120 seconds, except successful MidpointReduction at 90, final MidpointObstruction at 90, UniformObstruction at 45, and successful Band at 35. Both Audits have 180-second bounds. Failed diagnostics and snapshots remain evidence of rejection, not proof, disproof or final acceptance.

## Two replay/print stages and method limits

The first selected list is created at events 230–231 and contains nine modules. Replay **1792175147519913000**, bounded at 60 seconds, checks 31 explicit constants. Audit **1792175146327777000MA24**, build **1792175146327974000**, prints 27 theorem closures. Band compiles while this stage runs but is outside that selection.

Events 242–243 add Band. Final replay **1792175217089511000**, bounded at 45 seconds, checks ten modules and **34 explicit constants**. Final Audit **1792175215907119000MA24**, build **1792175215907280000**, prints **30** theorem names; its axiom JSON is **1792175246793708000**. The earlier axiom JSON is **1792175182834771000**. Final validation points to the ten-module checks.

Across the stages there are nineteen module-selection occurrences, ten distinct selected modules, and **57 printed rows covering thirty distinct accepted theorem names**. Every printed axiom set is exactly `{propext, Classical.choice, Quot.sound}`. The four definitions participate in replay without theorem-print rows. Final sources, snapshots, source maps, isolation counts, Audit requests/stdout and axiom JSON agree. The second stage retains the first nine exact versions and adds Band; neither stage selects or imports any pending new source.

Checker SHA is `c5497e0f46af59a5c2364f2c35df491c8c4b4d833ecd200555e6ace68b60b990`. The checker, validation/Audit wrappers and finalizer are exact worker-152 retags. The checker constructs the inherited environment from the direct-import union excluding selected modules and invokes ordinary `env.replay` on their collected constants. The explicit-name guard rejects collected names beginning `MathGKM.Markov.` and ending `MA24` if they are already imported or unsafe/partial. All 31/34 explicit selected names satisfy the guard and are absent from the base. Generated/private/equational names outside that predicate retain ordinary replay handling.

Commands name Lean 4.32.2, build with `-j 1`, and use replay stack 131072 in a joined task whose result propagates. Source maps and copied snapshots precede subprocess calls; checker source hash is recorded after replay, and Audit maps after compiling its print module. The compiler reads the live path rather than the snapshot copy. These are bounded saved associations, not continuous compiler-read monitoring, invocation-start executable authentication or complete object-part decoding.

No fresh inherited-source build, whole-library replay or independent root-completion check occurred. Operational unsafe IO remains separate from mathematical admission.

## Small import boundary, WindowLC and the old backlog

The successful replay base contains **81 inherited local modules and zero selected current modules**. Its explicit direct imports are `MarkovKernelSequencesMDB9` and `MarkovPellHorizontalSum9a72`; implicit Init makes three total. The accepted source union has **91 = ten current + 81 inherited** local nodes.

Across all thirteen mathematical files there are **99 inherited mappings and 112 local nodes**. The extra eighteen inherited modules occur only through the pending NextBinomial7955 branch. Including both Audit modules gives 114 local nodes. External library trees and the operational checker are excluded from these counts.

All 99 inherited source/object pairs, including the pending-only mappings, independently match sealed-152, before153 and current pins. The pair pass ran **18:32:32.784025–18:32:32.843756 UTC**. Every origin is a sealed-152 inherited binding. Preserving an old dependency neither validates a new pending dependent nor freshly replays the dependency.

Ratio has 78 local nodes (one current plus 77 inherited); Row has 83 (two plus 81); MidpointReduction 89 (eight plus 81); Band 90 (nine plus 81), excluding accepted ShiftObstruction. Pending MidpointObstruction and UniformObstruction each have 97 nodes, and pending Sharp 109. These are source dependency facts, not accepted proof counts for pending files.

**No old-212 body, member of its 195-module subset, or historically accepted worker-121 module is imported by this request's accepted base or any of its thirteen mathematical endpoints.** All **212** old compiled-but-unreplayed bodies nevertheless remain globally unrecovered. None is newly compiled or selected here. A smaller import boundary is exclusion, not recovery, and their historical timeout/null-report status remains unchanged.

WindowLC6d34 is imported through KernelSequencesMDB9/KernelGeneralMDB9. Its source SHA `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object SHA `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237` retain sealed-152/before153/current identity. The historical build and old leanchecker receipt have matching snapshots, but the old build lacks an independent output-object hash and prints only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`. That history does not establish every imported declaration's axiom-print coverage or independently authenticate historical object production. No Window body is freshly replayed here.

The 23 old-134 recoveries retain their worker-135 provenance. All historical rejected, superseded and unvalidated versions retain their statuses. The mathematical support carries 186 named older source comparisons and eight named external source/object pairs; comparison or preservation does not imply import membership. Ordinary compiled Mathlib bodies remain trusted. No full-source rebuild or new library-body validation is inferred from these hashes.

## Finite domains, failed probes and import-time reruns

Saved experiment JSON matches event 181. Initial probe matches event 68; random, shift, reverse-shift and adaptive records match the second JSON objects at events 72,82,86,91. Their first JSON objects all equal the initial probe record.

The source experiment covers actual `a/(a+1)` for `a=1..40`, every `i,j=0..2a+3`, and retains zeros. Static loop counting gives **102,320 coefficient identities, 306,960 raw triples and forty canonical recurrence comparisons**. The triple directions are exactly H, V and D; for D the script starts at row `j+2` and decreases the row while increasing the column. Saved zero counts **67,840 coefficients and 211,838 zero-containing triples** were not recomputed.

Its coefficient prediction uses signed Python `k=i+j−a`, returns zero outside `0≤k≤a`, and handles `k=0` separately. That finite extension is not confused with the new formal summand definition, whose parameter is `k=s+1≥1`; the conditional formal source theorem treats the lower boundary separately.

For `a≤28`, the experiment also uses `j=0..2a+2`, `k=1..a−1`, `q=0..a+1`. It counts **367,668** adjacent reverse-order comparisons, and **3,659,481** reverse-midpoint comparisons with `r=0..q−3`. These loops include zero products. The saved failure array has **24 midpoint-only entries**, beginning with `(22,25,3,19,16)` in experimental `k` indexing. It has no saved coefficient, raw or reverse-order failures. Exit 0 alone would not establish that failure inventory.

The initial scan uses `a=3..20,j=0..2a,k=1..a−2,q=0..a−k,r=0..a−k−2` and skips zero extreme products. Its **446,424 candidate index tuples** contain **104,226** tuples satisfying the explicit support-index bounds of both extremes. This count was independently obtained from those bounds alone, without evaluating coefficients or products. The saved scan has no failures in that limited domain; it does not prove the universal midpoint assertion, which the later scan and accepted theorem refute.

The random probe requests 60,000 seeded draws with replacement, seed 24023, `a=3..500` and corresponding finite index ranges. It skips zero products and would stop after five failures; the saved failure list is empty, with **26,017** reported nonzero comparisons. The random sequence and this random filtered count were not regenerated. There is no exhaustive or distinct-sample claim.

Each fixed-shift probe tests `c=−5..5` and stops at its first failure. The requested larger domain is not exhausted. Static prefix counts use the same support-index bounds and saved failure indices; the first orientation has 41 nonzero comparisons across its eleven prefixes, and the reverse orientation 169. The formal all-natural-shift theorem is a separate result, not inferred from this finite range.

The adaptive probe tests only shifts 0..4 and stops at `(a,j,k)=(5,6,1)`, after **44 candidate parameter tuples and 37 with nonempty support pairs**. The saved good-shift summaries cover the preceding 36 cases. The audit counted existence of support-index pairs, without recomputing any good-shift comparisons or numerical failure.

`probe_a24fe23d.py` has top-level scan/write/print code. Each of the other four exploratory scripts imports it, causing a deterministic rerun of the initial scan. There are therefore **five retained initial-scan executions**: standalone event 68 plus imports at 72,82,86,91. The outputs are identical and overwrite the same record. They are not five disjoint domains or expanded mathematical coverage. Only the final experiments script has a main guard; the auditor imported none.

The final experiment records three post-loop source hashes—its own script, raw136 and scan.py—which match applicable archive/current/prior pins. The other probes have no complete runtime binder. Saved command/result/source associations do not authenticate every invocation-start interpreter or transitive library input. All finite values, including obstruction values, remain saved observations rather than auditor recomputation.

## Preservation, finalization and null delivery

All **110 controller/archive artifacts** match current bytes; all **108 index entries** agree. Manifest and last-verification are the two unindexed controller artifacts. Composition is twelve objects, 42 JSON files, forty Lean files, ten Python files and six Markdown files. No pending-source object is retained.

Initial snapshot has **6,438 entries**, with **6,437 unchanged inherited inputs**, including 179 Python cache paths. Only own setup is excluded and separately unchanged; checkpoint is absent initially. Before and initial inventories have different coverage, so preservation counts do not imply every initial entry predates the request.

Setup succeeds at events 48–49 and correctly prefixes predecessor-152 evidence to the inherited path. Reconciliation selects the predecessor's 79-entry index and independently binds 88+0+81=169 controller artifacts from workers 136/137/152. Their timeout/null, stopped/zero-effects and completed histories are retained. Reconciliation is not replay or completion.

The finalizer is an exact worker-152 retag, including setup-only initial exclusion. It requires matching-source successful builds, final object hashes, successful replay with the exact selected source map, and an axiom JSON with that map. It does not itself enforce a separate axiom-JSON returncode, per-theorem permitted-set/stdout, expected-checker identity or executable predicate. Actual selected checks were independently bound. Its selected list intentionally excludes the three pending mathematical sources; finalizer success does not mean every retained file is validated.

The textual filter remains `sorry|admit|native_decide`, with the inherited omission of `axiom`; actual mathematical sources and all selected print sets were independently checked. Validation is written before preservation assertions. Root/contract and inherited preservation are asserted; terminal mismatch lists and STOP=false are recorded without a final emptiness/stop assertion. Actual mismatch lists are empty. No experiment or proof rerun is performed by this finalizer or auditor.

The sole finalizer succeeds at events **252–253**, reporting ten modules, thirty closures, twelve unsuccessful builds, 6,438/6,437 snapshot/inherited entries and 108 indexed artifacts. This is a command result, **not a delivered structured final report**. There is no final.json, research draft report, evidence/report.json or turn.completed. The last saved event is finalizer item.completed. Completion remains null and mathematical_resolution false; controller outcome remains timeout/return0/null report.

Fixed administrative contents match saved pins; no active successor index or current inherited.json was read. The separately preserved old-134 late failed Audit keeps SHA `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, outside this initial/index and without any upgrade. Earlier seals, correction histories and observation windows remain final.

## Deadline and historical partial cutoff

Times are UTC on 2026-10-16. Controller start is epoch 1792173465.845715, finish 1792175313.136317, retained elapsed 1847.2906019687653 seconds. The represented finish-minus-start agrees. Host finish is **47.290602 seconds after** the nominal deadline.

| Milestone | Time UTC |
|---|---|
| Controller start | 17:57:45.845715 |
| First replay start / estimated finish | 18:25:47.519913 / 18:26:21.171350 |
| First Audit start / estimated finish | 18:25:46.327974 / 18:26:22.830309 |
| Final replay start / estimated finish | 18:26:57.089511 / 18:27:26.502289 |
| Final Audit start / estimated finish | 18:26:55.907280 / 18:27:26.787848 |
| Validation project mtime | 18:27:33.467468 |
| Final manifest project mtime | 18:27:34.932169 |
| Final verifier project mtime | 18:27:35.164905 |
| Event-log mtime | 18:27:35.171169 |
| Heartbeat content | 18:27:45.062657 |
| Nominal deadline | 18:27:45.845715 |
| Host finish | 18:28:33.136317 |

The final Audit starts 1.182231 seconds before the final replay and finishes 0.285558 seconds after its estimate. Both precede deadline by about nineteen seconds. The verifier project write precedes deadline by **10.680810 seconds**, event-log mtime by 10.674546, and heartbeat content by 0.783058. No indexed project artifact is observed after deadline or host finish.

All 121 started items have completed counterparts within 253 events; there is still no turn.completed. Event bytes 532,744 plus zero stderr match activity accounting. Heartbeat content differs from the activity-file mtime and follows event-log mtime by 9.891488 seconds. The archived verifier-copy mtime, 18:28:33.119150, is a later controller copy observation, not original finalization time.

Receipt finish estimates add filename epochs to monotonic durations and are not independently timestamped wall-clock exits. Event-log mtime is not an individual event timestamp. Successful saved partial finalization before deadline and the later controller timeout are both retained. No shutdown actor, timeout cause or independent process census is inferred.

The pinned root SHA remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII canonical contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Final manifest SHA is `6f278ada83aceae3094d58e8d9922d674b3c6f57ab08679c980fe020f8b2d3bc`; verifier `a828019e7e34da2004b90d747a8b649a52bc4e66cee030e22d9aaf4d9cc3c905`.

## Final audit observation

Validation rehashed **7,148 bounded inputs**, all unchanged, during **18:43:51.657882–18:43:52.216458 UTC**. The exact-request late-file observation at **18:43:52.228306 UTC** found no additional or missing archive/current files. The method review rehashed **172 bounded inputs**, all unchanged, during **18:43:39.247787–18:43:39.371771 UTC**. Its four exact named absence checks confirm no final.json or object for any of the three pending drafts at that boundary.

Project reads closed at those stated boundaries. Final crossreview and the integrity seal read audit files only and do not extend them. No separate late project bundle is required. Successful retained partial validation remains distinct from the historical controller timeout/null report.

Companion crosschecks agree on **65 fields, 99 inherited pairs and 134 shared input hashes**. The pair set is explicitly **81 accepted-base plus eighteen pending-only** mappings. Audit-only rechecks cover **eleven validation-bound and 38 method-bound temporary inputs**, unchanged. Both companion main-body reviews found no necessary correction. The 186 older named mathematical comparisons split into 35 accepted imports and 151 comparison-only sources, with none pending-only. All eight named external source/object pairs agree without implying fresh library validation. Earlier audit seals and observation windows remain final.

The seven supports, all in this audit directory, are:

| File | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000153_mathematical_source_hashes.json | 101778 | `9fd828d4458da107ea3550bb09dd278633050a890485690cb8caa4ea6ff9d988` |
| markov_worker_000153_source_structure_audit.json | 29142 | `2513ec95744806f7fdb049e90269dd8e43335e6596cba640c20a220423a85e8e` |
| markov_worker_000153_finite_domain_audit.json | 36639 | `c61493a230d8c0b4ca6ca69f9ecf02e20d07d3b5c1ac5c36c3e9ac2b5f1d1c67` |
| markov_worker_000153_validation_audit.md | 25258 | `05684e3a8948ad78668894b72dda2c7ae758dce47c987295efcd34a007ca0048` |
| markov_worker_000153_validation_evidence.json | 4034847 | `01d7f102cd23fe5ce0fd1611a7ceda3b2324b181ed1003e578be5fa153c598a9` |
| markov_worker_000153_replay_method.md | 29130 | `a8f0b5362ac4bb35c64fd20eab861b30d388455034e081dd2d835bc9bf8394f2` |
| markov_worker_000153_replay_method_evidence.json | 782900 | `179233fbfefc9af7f9f2ea47c724259119e5e9cfb382d6ca19f2937aa8b13c80` |

The separately bound inherited-pair map is `markov_worker_000153_inherited_pair_expectations.json`, 85,958 bytes, SHA256 `bf00e7574063c193bb2ac649d5b6ff50fbbc2bbe3a872b978d158d11a1afcdfc`. It records byte identities and accepted/pending dependency membership, not a fresh source rebuild.
