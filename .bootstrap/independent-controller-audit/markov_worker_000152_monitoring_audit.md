# Completed worker 152: independent static audit

Request `8f77f49334284c7b8a1caedbade68c5c`; archive `/Users/sasha/math_gkm/.control/markov/workers/000152/artifacts`. This review reads completed records and explicitly named inherited/current counterparts. No project program, Lean proof, checker, replay, experiment, generator or finalizer was executed. No mathematical coefficient, binomial, polynomial, recurrence or gap was recomputed. No project edits, proposer contact, research assistance or proof strategy occurred. Auditor computations are static parsing, hashes and input-index counts. Active worker 153 is outside the review; earlier seals and observation windows remain final.

**The new result completes all three raw log-concavity directions for every actual numerator-two source, at every natural index, including zeros.** The newly completed diagonal is

`coeff p i (j+2) * coeff p (i+2) j ≤ coeff p (i+1) (j+1)^2`.

The final source theorem assumes only an actual finite path with `mid.a=2` and natural `i,j`. There is no remaining parameter-shape, denominator, ratio, run-count, path-length, support-positivity or polygon premise. Horizontal and vertical coverage is inherited from workers 146 and 151. This is stronger than a statement restricted to triples inside the polygon.

The exact root equivalence is now `Conjecture63 ↔ OtherSourcesM679`. That unchanged predicate requires all three raw directions for actual sources of numerator at least three and remains unproved. The full pinned conjecture is still open. Endpoint sources and numerator-one sources are handled in inherited exact reductions, not omitted.

Nine final mathematical modules contain **56 theorem declarations and 11 definitions**, totaling 67 explicit declarations. All final versions have matching saved successful build, joint selected replay and theorem-print records. There is no pending or compiled-only mathematical module in the request. Five rejected builds remain rejected. No admission, new axiom, `native_decide`, unsafe or partial declaration was found in the nine final mathematical sources.

The controller records completed/returncode0, with a delivered structured report, null completion and false mathematical_resolution. Start epoch is 1792172015.004422, finish 1792173404.740129 and stored elapsed 1389.7357079982758 seconds. Completion of this worker is not root completion.

## Finite prefixes and parameter inequalities

`MarkovPrefixM8F7` defines natural convolution and inclusive prefixes. Formal power series identities prove their finite coefficient algebra; no analytic convergence or infinite-limit assertion is involved. The natural negative-binomial sequence is `nbNat(s,k)=C(k+s,s)`. The exact imported statement `Nat.sum_range_add_choose(n,k)` sums `(i+k).choose(k)` over `i∈range(n+1)` and gives the required inclusive prefix with parameter increased by one.

The weight is one at zero and two at positive indices. `weightedReverse(b,r,k)` is this weight times `nbNat(b,r−k)` for `k≤r`, and zero beyond. The new real kernel `K(a,b,j,r)` is the inherited finite diagonal sum of the two negative-binomial sequences and this weight. It equals the natural convolution of weightedReverse with `nbNat(a)`. Added indices vanish by the negative-index zero extension; natural/integer subtraction casts are justified inside their ranges.

Swapping `(a,b,j,r)` with `(b,a,r,j)` is exact. Prefixing in `j` increments `a`, and the rectangular identity is

`K(a+1,b+1,j,r) = Σ x≤j, y≤r, K(a,b,x,y)`.

Every kernel value is **strictly positive for all natural a,b,j,r**, because its zero-index summand is positive and the rest are nonnegative. This auxiliary positivity is established before later divisions; it does not assert positivity of every raw coefficient outside source support.

`MarkovWeightOrderM8F7` proves the comparison needed for the parameter minor. The weighted reverse sequence is antitone on positive indices; its exceptional zero/one comparison is handled separately. The imported `Nat.choose_le_choose(c,h)` is precisely monotonicity in the upper binomial index with fixed lower index, fitting the positive-tail argument.

The exceptional comparison uses binomial recurrences. With the source's four binomial quantities `A,D,E,F`, it proves `2 D E ≤ A(E+2F)` through an exact identity whose positive scale is `(b+1)(u+b+1)` and whose remaining polynomial has nonnegative natural terms. This includes `b=0,u=0`; no zero scale is canceled. Prefix nonnegativity, monotonicity and the positive tail then establish

`B_b(x) prefix(B_(b+1))(y) − B_b(y) prefix(B_(b+1))(x) ≥ 0`

for every natural `x<y`. There is no assumed seed CrossLC or unproved shape premise in that step.

`MarkovParameterShapeM8F7` expresses the parameter-shifted kernel as convolution with that prefixed weighted reverse sequence. A finite determinant identity combines its ordered minors with the inherited negative-binomial Toeplitz minors. Common finite extensions are exact zero extensions. It obtains

`K(a+1,b+1,j,r) K(a,b,j+1,r) ≤ K(a,b,j,r) K(a+1,b+1,j+1,r)`.

Dividing only by the already strictly positive kernel shows that `K(a+1,b+1,j,r)/K(a,b,j,r)` is monotone in `j`; the swap identity gives monotonicity in `r`. Comparing this ratio at every point of the finite rectangle, clearing positive denominators and summing the cross-products gives

`K(a,b,j,r) K(a+2,b+2,j,r) ≤ K(a+1,b+1,j,r)^2`.

These assertions hold for every natural parameter, including zero. Thus both formerly conditional reduced parameter-shape assertions are now proved. The inherited reduced sum `H(n,j,r)` equals `K(n+2,n,j,r)`; its parameter LC and parameter/row minor transfer by injective real/integer casts. Its row LC and strict positivity were already proved. The scalar glue now gives reduced diagonal LC **for every n≥0**, with no parity premise required for the auxiliary theorem.

The inherited exact source reparameterization for columns `i≥3` retains its natural parity equation before applying this stronger result. Its outside-support branches remain zero branches. The new source theorem for those columns is universal over actual numerator-two paths; it does not retain the old `ReducedShape` hypothesis.

## Column 2 and the top endpoint

`MarkovSecondDiagonalM8F7` extends the needed source-kernel bridge to column 2. Every actual numerator-two source has `b=2q+1` for some `q≥1`. For `j≤2q`, the lower branch uses `j≤q` and `d=q−j`; the upper branch uses `N=2q−j` and `d=j−q` with positive `N,d`.

The remaining endpoint `N=0,j=2q` is **not zero**. The inherited exact top coefficient theorem gives `C(2q+2,2)`, and the new proof matches it to the kernel at that endpoint. This distinction matters because worker 150's general source-kernel identity was restricted to columns at least 3.

For the raw diagonal beginning at column 2, if `j+2≤2q`, the new column-2 identity and the inherited column-3/4 identities give the reduced diagonal with `n=0` and the justified natural remainder. If `j+2>2q`, the first extreme `coeff p 2 (j+2)` is outside the original polygon and is zero. No zero coefficient or unsupported endpoint is divided out.

## Columns 0 and 1, exact certificates and correction history

`MarkovSmallCertificateM8F7` contains three explicit rational polynomials of denominator 180, with **25, 7 and 7 positive literal terms**. They identify one upper-region gap and two central-crossing gaps. The identities use ordinary `norm_num` and `ring`; nonnegativity uses the explicit positive coefficients. The audit counted syntax and read the identities without expanding or evaluating the polynomials.

The arithmetic bridge in `MarkovSmallArithmeticM8F7` guards every natural subtraction and polynomial cast. The upper case has `N≥3,d≥1`; crossing0 has `q≥3`; crossing1 has `q≥2`. Integer-to-rational casts are injective, and the inherited polynomial/source identities have their required positive upper-region parameter. No differently scaled LC statement replaces the raw coefficients.

There is a substantive rejected generated version. The initial Lean certificate source SHA is `43603e35c21505b5b524055828aa756c0a38b551320117987872560425937841`, retained in failed build 1792172843033718000. Its final corrected source SHA is `461da03f734e96468f99cf7a3c5a8284dceb9e99257919e4b77811ff2a0ba268`, accepted by build 1792172922581369000 and the final replay/Audit.

The inherited Python upper-polynomial helper had been used for columns `i≥2`. At `i=1,h=1`, its signed-integer guard omitted a term present under the Lean definition's natural-subtraction convention. The final local generator saves the inherited helper and overrides `i=1` with `scale(d,4)`. The inherited helpers remain unchanged. Saved edit events 141–142 precede regeneration and the accepted build in 143–148.

All three polynomial definitions change. The six theorem blocks retain identical text and names, but unfold the changed definitions. Both initial and final generation summaries report **25/7/7 terms and no negative terms**, so neither that summary nor header equality binds the corrected semantics. The initial Lean snapshot is retained; old generator file bytes and an old generator hash are not separately archived. No old successful certificate, object or replay is inferred. Final credit attaches to the corrected source and its saved successful checks.

`MarkovSmallDiagonalM8F7` covers the remaining columns without a hidden finite denominator bound:

- At start `i=0`, split whether the first extreme `(0,j+2)` is in the original polygon. Inside, the actual source inequalities place the triple among the inherited first six top diagonals, with `r=2q−j`. Outside, that extreme is zero.
- At start `i=1`, first split the same way at `(1,j+2)`. Polygon membership yields `q≤j+1` and `j≤2q−1`. If `2q≤j+6`, the inherited top-six theorem applies with `r=2q−j−1≤5`. Otherwise `q≥3`, and the exhaustive cases are `j+1=q` (crossing1), `j=q` (crossing0), and `j>q` (upper region with `N=2q−j≥3,d=j−q≥1`). All three source coefficient identities use their exact guarded domains.
- Start `i=2` is supplied by the separate column-2 theorem above.

Small denominators fall within the top/zero branches. The inherited `first_six_raw05ef` uses the exact total-degree relation `i+j+2+r=a+b−1`, with `r≤5`, and already has raw zero retention. The proof is not a finite check over a list of exceptional sources. No polygon endpoint or zero position is silently discarded.

## All actual numerator-two sources and the exact open residual

`source_two_diagonal_allM8F7` splits `i≤2` versus `i≥3`, combining the completed cases. `source_two_globalM8F7` then combines this result with `source_two_horizontal_allMEC6` and `source_two_vertical_allMDB9`. In original coordinates, these are precisely

- H: `(i,j),(i+1,j),(i+2,j)`;
- V: `(i,j),(i,j+1),(i,j+2)`;
- D: `(i,j+2),(i+1,j+1),(i+2,j)`.

All indices are natural and all coefficients are raw. The final all-index statement has no polygon filter. `source_two_weakM8F7` uses the inherited exact outside-polygon support theorem to recover the pinned polygon-guarded `WeakLC` statement.

Actual-path classification provides `q≥1,b=2q+1`. Conversely the canonical `twoPath3af(q−1)` represents every such denominator, with its exact polynomial identity. `two_family_globalM8F7` and injective Nat/Int casts establish the full arithmetic `TwoDiagonalMDB9` predicate, not merely a collection of finite examples. The unbounded theorem gives, for every natural `B`, an actual numerator-two source of denominator greater than `B` with global LC.

`root_iff_other_sourcesM8F7` uses the inherited exact reduction and discharges `TwoDiagonalMDB9`. The unchanged `OtherSourcesM679` still quantifies all actual paths with numerator at least three and requires `GlobalLC18`. Its source definition and the root are hash-bound. The original polygon is still

`a*b ≤ b*i+a*j` and `i+j ≤ a+b−1`.

The pinned endpoint clauses for `0/1` and `1/1`, and the numerator-one cases, remain covered by inherited exact reductions. Neither the raw polynomial nor the target has been rescaled or weakened. The old finer residual predicates are unchanged; expressing the result as the broader `OtherSourcesM679` does not erase previously proved subregions among larger numerators. The new result closes all numerator-two directions but does not prove `OtherSourcesM679` or the full root.

## Auxiliary weight obstruction

`MarkovWeightLimitM8F7` varies the positive-index weight from the actual value 2 to an arbitrary real `t`, retaining weight 1 at zero and zero at negative indices. For natural `a,b`, its exact adjacent-minor gap at `j=0,r=1` is `(b+1)(b+2)−t`.

At `b=0`, the specified minor inequality is equivalent to `t≤2`; weight 3 supplies a formal failure. This is a statement about the modified auxiliary family. It is not a source counterexample, and no actual-source bridge for weight 3 is claimed. Nor does the single-minor equivalence assert a complete characterization of all LC inequalities for every variable-weight kernel. The source result uses the separately proved actual weight-2 inequalities.

## Finite records and exact domain counts

The own static count pass reads loop indices and saved stopping indices only. It does not evaluate binomials, kernels, source recurrences, coefficients, signs or gaps. The final experiments record is identical to saved successful event 153; strategy-probe matches 58, general-probe matches 66, and generation matches the first JSON object of event 148. The same generation summary occurs at event 129 despite the rejected source version.

The source experiment uses `q=1..60`, with `i,j=0..2q+4`. Coefficient identities are tested for `i≥2`, giving **325,420** comparisons; all diagonal starts give **333,340** triples, including **11,880** starts in columns 0,1,2. It separately compares twenty canonical source recurrences. The reported zero counts, **172,250 coefficients and 185,540 zero-containing triples**, are saved outcomes only and were not recomputed.

The coefficient prediction uses signed Python `m=2q−j−(i−2)` and explicitly returns zero when `m<0`. It does not pass a negative value into a natural-kernel formula. There is no polygon or nonzero filter. The failure list is conditionally appended and saved empty; process exit 0 alone would not prove that list empty.

The generic parameter box has `a,b=0..12,j,r=0..14`, two comparisons per tuple: **76,050**. The rectangular identity subbox has `a,b=0..2,j,r=0..5`: **324** identities. These finite samples do not establish the universal theorem; its proof is separately checked in the saved Lean records.

The strategy probe considers two proposed summand predicates and five shifts `−2..2`. Each search stops at its first saved failure. Static prefix counts are 1,1,49,49,49 for the first predicate and 1,1,3,3,3 for the second, totaling **160**, not an exhaustive requested box. Negative shifts can produce a negative candidate summand index, where the helper returns zero. These failures concern direct termwise comparisons, while the aggregate parameter inequalities are now proved.

The general probe completes six parameter offsets, weights 1,2,3, `n=0..4,j,r=0..9` and cuts 0,1,2,4,1000. Three comparisons per tuple give **7,500 per case and 135,000 total**. It records the first failure per comparison type but continues all loops. Cut 1000 gives the full sum in that box; smaller cuts deliberately truncate it. Distinct input specifications are counted separately even when their sums coincide. The saved weight-3/minor failures are auxiliary and do not refute source LC.

The final experiment stores three post-loop hashes for its own script, raw136 helper and scan.py; applicable archive/current/prior pins agree. Other probes and generation records have no complete runtime input binder. Inherited polynomial/generation helpers are main-guarded and unchanged; merely importing definitions does not run their standalone experiments. The auditor imported none. These source/result/event associations do not authenticate every runtime input, invocation-start interpreter or transitive external library.

## Compilation, selected replay and printed closures

The nine modules are Prefix, WeightOrder, ParameterShape, SmallCertificate, SecondDiagonal, SmallArithmetic, SmallDiagonal, TwoComplete and WeightLimit, all with suffix M8F7. Their theorem/definition counts are respectively 12/6, 7/0, 10/0, 6/3, 5/0, 3/0, 3/0, 7/0 and 3/2. The companion inventory binds each final source, object, successful snapshot and receipt. Eleven final Lean files comprise those nine, one Audit and the operational checker; fifteen additional Lean snapshots correspond to fifteen compiler receipts.

The compiler receipts comprise **ten successes and five returncode-1 failures**, with no timeout. Successes are nine final mathematical builds and one Audit. Failed snapshots are Prefix, WeightOrder, ParameterShape, SmallCertificate and WeightLimit; each differs from the final own source. No superseded successful mathematical version, same-module overlapping build, anonymous compiled diagnostic, pending object or unbuilt candidate was found.

All mathematical build bounds are 120 seconds. The failed ParameterShape's compact binder `(hi : 3≤i)` was rejected by parsing, so normalized header agreement is not evidence of successful parsing or elaboration. The generated certificate's changed definitions also demonstrate why equal theorem headers do not establish equal unfolded semantics. Neither failed version receives final validation credit.

The successful joint replay is **1792173183951193000**, invoked with all nine modules and a 180-second bound. It selects **67 explicit mathematical constants**. Final Audit module `MarkovAudit1792173185124232000M8F7` is compiled by build **1792173185124459000**, also with a 180-second bound; the axiom JSON is **1792173217368081000**. Independently parsed final sources, isolation output, Audit source, stdout and axiom JSON agree on all 67 replayed explicit names and **56 printed theorem names**. The eleven definitions are replayed without theorem-print rows. Every printed set is exactly `{propext, Classical.choice, Quot.sound}`.

The checker, validation wrapper and Audit wrapper are exact worker-151 retags. Checker SHA is `64d053e50e7289c58ec0d24297e408110a6c8bd333470900b3fedeea9c91de1d`. It collects selected module-data constants, constructs the direct-import union excluding selected modules, and calls ordinary `env.replay` in the inherited environment. Its explicit-name guard covers names beginning `MathGKM.Markov.` and ending `M8F7`, rejects any already imported, and rejects unsafe/partial flags. All 67 explicit final names meet that guard and are absent from the base. Generated/private/equational constants outside the guard retain ordinary replay handling.

Commands name Lean 4.32.2, compile with `-j 1` and use replay stack 131072 with a joined task whose result propagates. Operational unsafe IO is separate from mathematical admission. Source snapshots/maps precede subprocess calls; checker source hash is recorded after replay, and the Audit source map after compiling the print module. The wrapper copies a snapshot but the compiler reads the live path. Saved event bounds show no own-source edit during its recorded build interval; this does not continuously authenticate the compiler's reads.

This is ordinary selected replay against inherited compiled imports, not a fresh whole-source build or independent root-completion check. No invocation-start executable authentication, complete object-part decoding, inherited-body replay or external-library rebuild is established.

## Import boundaries and unrecovered history

The inherited local base has **2,491 modules and zero selected current modules**. The explicit direct imports after excluding targets are `MarkovDiagonalShapeMDB9` and `MarkovVerticalPolyM0D3`; implicit Init makes three total. The accepted union is **2,500 = nine current + 2,491 inherited**; Audit adds one. External libraries and the operational driver are excluded from local counts.

All 2,491 inherited source/object pairs match sealed-151, before152 and current pins without fallback. The independent pass ran 18:04:17.573341–18:04:56.064646 UTC. The origins are 2,485 sealed-151 inherited mappings plus six accepted-151 modules: KernelGeneral, KernelSequences, KernelProof, TwoVertical, Residual and DiagonalShape. The accepted-151 KernelObstruction, ReducedObstruction and VerticalGain are absent. The inherited DiagonalShape is its final eight-theorem/three-definition version bound to worker 151's sequential rebuild; its earlier overlapping six-theorem/two-definition attempt is not upgraded.

**All 212 worker-121 compiled-but-unreplayed bodies remain globally unrecovered.** The 195-module subset and nineteen historically accepted worker-121 modules remain distinct historical sets. The large inherited branches contain all of them, but no old body is newly compiled or selected by worker 152. SmallCertificate has 103 local nodes (one current plus 102 inherited), and SmallArithmetic has 104 (two plus 102); neither imports an old-212 body. Every other selected endpoint inherits all 2,491 modules and the 212/195/19 sets. TwoComplete has 2,499 local nodes, and WeightLimit 2,493. Joint replay of the new modules does not replay imported bodies.

WindowLC6d34 remains transitively imported through KernelGeneralMDB9. Its source `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237` retain sealed-151/before152/current pins. Historical build `run-MarkovWindowLC6d34-build-1792019206848298000.json` and old leanchecker receipt `run-MarkovWindowLC6d34-replay-1792019274510055000.json` have matching saved snapshots. The old build lacks an independent output-object hash and prints only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34` with permitted closures. It does not establish all-imported-declaration print coverage or independently authenticate the old object's production. No new Window body check was performed.

The 23 worker-134 recoveries retain worker-135 provenance. Failed HighCone2GapM81F remains distinct from accepted HighCone2GapMF25; FallingGapMF25 and SourceFallingMF25 stay absent. Corrected worker-145 Scalar and final worker-146 Global keep their separate final-version histories. Unvalidated worker-149 EightNewton remains unvalidated. No old timeout, rejected certificate, superseded wrong comparison or unbuilt candidate is promoted by preservation or reconciliation.

The mathematical companion pins 171 named older source comparisons, the two inherited generator helpers, and exact named external library sources/objects. Newly read Choose/Sum and Choose/Basic statements have the exact fit described above. These pins identify observed bytes; they do not establish fresh library compilation, imported-body replay or source-to-object production. Earlier storage copy-on-write maintenance preserves byte hashes and does not improve proof validation.

## Preservation, finalizer and delivered report

All **81 controller/archive artifacts** match current bytes; all **79 index entries** agree. Manifest.json and last-verification.json are the two unindexed controller artifacts. Composition is ten objects, 31 JSON files, 26 Lean files, eight Python files and six Markdown files.

The initial snapshot has **6,410 entries**, of which **6,409 inherited inputs** are unchanged, including 177 Python cache files. Only own setup is excluded and is independently unchanged. Checkpoint was created after setup and was absent from the initial snapshot; it is not an initially excluded file. This differs from worker 151's setup-plus-checkpoint split. Initial and before inventories have different coverage; common pins agree, without assuming every initial entry predates the request.

Setup succeeds at events 32–33. Its inherited evidence path correctly prefixes worker 151's directory. Reconciliation selects worker 151's 97-entry index and independently binds 88+0+99=187 controller artifacts from workers 136/137/151. Their timeout/null, stopped/zero-effects and completed histories remain unchanged. Reconciliation and preservation are not replay.

The finalizer is exactly the worker-151 retag except that own_initial excludes setup alone. Its forbidden-token scan still omits the `axiom` token, as changed in worker 149; actual final sources and all printed closures are independently checked here. It requires matching-source successful builds, final object hashes and a successful full-map replay. It selects a matching-map axiom JSON without a separate axiom-JSON returncode, per-theorem permitted-set, expected-checker or executable predicate. The actual successful Audit, coverage and permitted sets were independently established; they are not inferred merely from that weaker finalizer test.

Validation is written before preservation assertions. Root/canonical-contract and inherited preservation are asserted. Terminal mismatch lists are recorded without an emptiness assertion; actual lists are empty and separately checked. STOP=false is historical metadata. No experiment or proof check is rerun by the finalizer or auditor.

Two finalizers succeed. Events 194–195 report **78** indexed artifacts. Events 197–198 add `research/markov-8f77f493-report.json`; events 199–200 then report the final **79**. Both summaries retain nine modules, 56 closures, five rejected builds and 6,410/6,409 initial/inherited counts. Earlier manifest bytes are not separately retained, so the first count is bound to saved event output, not an invented old hash.

The indexed draft differs from delivery in summary, actions, observations and agenda; request and null completion agree. It is retained separately, SHA `cb9d1e25e2d40cc6fab1eff85f74408bcfd5409de6ccc34d92482d9b50f8a184`. Delivered event 201, final.json and the controller report agree exactly; event 202 is turn.completed. Delivered final.json SHA is `94b8d47ba8ff5f8473ba57f62cf4466e2ca33f272633d43ccb09e4278afaa026`. The research draft is not substituted for the delivered report.

The old-134 late failed Audit remains separately preserved with SHA `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, before-pinned but outside this initial/index. It receives no success or historical upgrade. No current inherited-decoded state or live successor index is read; fixed administrative pins retain their saved bounded associations.

## Timing and historical cutoff

Times below are UTC on 2026-10-16. The worker finishes **410.264293 seconds before** the nominal 1800-second deadline. Retained elapsed and finish-minus-start differ by approximately 0.953674 microseconds; exact floating-point equality is not claimed.

| Milestone | Time UTC |
|---|---|
| Controller start | 17:33:35.004422 |
| Replay start / estimated finish | 17:53:03.951193 / 17:53:36.637572 |
| Audit start / estimated finish | 17:53:05.124459 / 17:53:37.360502 |
| Indexed research draft mtime | 17:55:46.472496 |
| Final validation mtime | 17:55:46.613937 |
| Final manifest mtime | 17:55:47.020491 |
| Final verifier project mtime | 17:55:47.209793 |
| Event-log mtime | 17:55:59.300405 |
| final.json mtime | 17:56:00.308975 |
| Host finish | 17:56:44.740129 |
| Nominal deadline | 18:03:35.004422 |

Replay and Audit overlap: Audit starts 1.173266 seconds later and its estimated finish is 0.722930 seconds later. Both finish before finalization and deadline. The final verifier precedes deadline by 467.794629 seconds and final.json by 454.695447 seconds. No indexed project artifact is observed after deadline or host finish.

All 95 started items have completed counterparts within 202 events. Event bytes 599,217 plus stderr 305 match activity accounting 599,522. Heartbeat content is 17:56:00.310953, distinct from file mtime. Receipt finish estimates combine filename epochs and recorded durations; they are not independently timestamped wall-clock exits. Event-file mtime is not an individual event timestamp. The archived verifier-copy mtime, 17:56:44.730487, differs from its project write. No independent process census or stop-actor inference is made.

Fixed root SHA256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII canonical contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Final manifest SHA is `fd3f533c40c53e4b85ff10bcef3c88a9cda09c0d426891ad2fe414a568685ecf`; verifier `eac5fef98c96723994cca15355e45d47a74d24784998a5281d4eaf6733210f70`.

## Final audit observation

Validation rehashed **9,484 bounded inputs**, all unchanged, during **18:14:34.282304–18:15:08.398230 UTC**. The exact-request late-file observation at **18:15:08.409836 UTC** found no additional or missing archive/current files. The method review rehashed **140 bounded inputs**, all unchanged, during **18:11:12.000811–18:11:12.121584 UTC**. Project reads closed at these stated boundaries. Final crossreview and the integrity seal read audit files only and do not extend them. No separate late project bundle is required.

Companion crosschecks agree on **56 fields, 2,491 inherited pairs and 103 shared input hashes**. Audit-only rechecks cover **11 validation-bound and 37 method-bound temporary inputs**, unchanged. Both companion main-body reviews found no necessary correction. The 171 named older mathematical comparisons split into 125 imported and 46 comparison-only sources. All eight named external source/object pairs agree; their identity observation is separate from fresh imported-body validation.

The validator corrected its audit-only library-map keys from basenames to qualified paths, distinguishing PowerSeries.Basic from Choose.Basic. This happened before its final observation using already hashed inputs; no project bytes, source/object hashes or mathematical counts changed. The correction is retained explicitly in the evidence. Earlier audit seals and observation windows remain final.

The seven supports, all in this audit directory, are:

| File | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000152_mathematical_source_hashes.json | 94984 | `331247307a8141a7a94867b4f4d3d41902d393f886772b0e5cd91f8d584dc175` |
| markov_worker_000152_source_structure_audit.json | 30299 | `7c73d8b66350ba0d6b4bf85f29626deb20a1b564a7674a0ec528a19313a77773` |
| markov_worker_000152_finite_domain_audit.json | 42842 | `647b97ee7bd8e0017d63627ab29aa9df5288b8dc260b48eb0213e09d42f9bce9` |
| markov_worker_000152_validation_audit.md | 27072 | `b7052872956737f028ed6773757f0d733b3ab23220c0aaf3bc0a77f5ce87aed4` |
| markov_worker_000152_validation_evidence.json | 6890693 | `dbbd0d8de3a3e5e04a0d7410b4a46319654a8766dbb79743bd71dad5b33e2ba8` |
| markov_worker_000152_replay_method.md | 26336 | `c8152b87007311497351f8a37b093b5a25d3f324b6f7f677148d6de56ec79b53` |
| markov_worker_000152_replay_method_evidence.json | 10548319 | `73f040dc93f11f3bc08320439848086b0ad4d888a68f393835a86af020155435` |

The separately bound inherited-pair map is `markov_worker_000152_inherited_pair_expectations.json`, 2,193,516 bytes, SHA256 `6496b377fc74f6c24d29dda4cb63a4566f726dabfb4a14f72593830b7304c7cb`. It records the same inherited pair observation, not a fresh source rebuild.
