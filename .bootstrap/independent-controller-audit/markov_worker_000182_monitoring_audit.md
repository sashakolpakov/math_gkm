# Closed worker 000182: independent static monitoring audit

Request **b3eed36486ad48a08ac07be4c9b62794**. Historical host outcome: **completed**, return code **0**, structured report present; `mathematical_resolution=false`, `completion=null`. The full pinned `MathGKM.Markov.Conjecture63` remains open.

This round adds an unconditional raw source result. For every actual numerator-three source, write its denominator as **b=3q+1 (r=true) or b=3q+2 (r=false), q≥1**. For every depth **5≤t≤q+2**, the row **j=b+2−t** satisfies the strict horizontal inequality

`A(1,j) A(3,j) < A(2,j)^2`.

The natural starting-column-zero inequality also holds because A(0,j)=0. The source row equals an exact denominator-only template for **all t≤q+2**, including the smaller depths; an explicit positive high-column sum and exact whole-row support are attached in the stated **5≤t≤q+2** sector. These formula and support theorems do **not** establish horizontal log-concavity at every starting column in that sector. `TopTemplateLCMB3E` is an unproved sufficient condition. The exact new root equivalence is

`Conjecture63 ↔ ThreeRemainingMB3E ∧ OtherFourM9E2`.

Both remaining predicates are unproved. The already established numerator-three lower half-plane, lower and three correction rows, row five, and all three directions for every numerator-two source remain inherited. No new vertical or diagonal region is proved here.

## Authority, receipt and audit boundary

The receipt-only watch began before closure and accessed only the exact worker182 receipt path. Checks were at least 60 seconds apart; each requested wait was at most 59 seconds, with interrupted waits recorded at their actual durations. The last absent observation was 07:50:02.811448 UTC. The first present observation was **2026-10-17 07:51:14.398679 UTC**. The receipt is **16,722 bytes**, SHA256 **d70c5ae38d770cef3d23e9ac81808cd7eafb6c03c9d04af2e954968d008c3c32**. The watch is embedded in the source-hash support file.

Recorded start **1792221822.27326** = **07:23:42.273260 UTC**; finish **1792223472.957626** = **07:51:12.957626 UTC**; elapsed **1650.6843659877777 seconds**. The nominal 1800-second deadline was **07:53:42.273260 UTC**. Host finish was about **149.315634 seconds before** that deadline. This was a completed host result, not a timeout or a late upgrade. Individual compiler, replay, axiom, draft-report and finalizer timings are distinguished below and in the two independent validation supports.

Review is archive-first under `.control/markov/workers/000182/artifacts`, followed only by explicitly named inherited/current counterparts and exact request-owned output paths. No active successor source or event stream was examined. No project program, compiler, Lean/checker/replay, experiment, certificate generator or finalizer was executed or imported; no mathematical coefficient, binomial, polynomial, gap, root, sign or random sequence was recomputed. Audit-owned code performed static parsing, hashing, literal data comparisons and finite index-domain counts only. No project source, controller, permissions or research agenda was changed, and there was no proposer contact or research assistance. All audit writes are under `/private/tmp/math_gkm_godel_20261013`.

All nine selected mathematical source bodies and five final Python experiment/generator bodies were read in full. The final mathematics, correspondence, operational and next records were read; checkpoints were identity-bound. Nine explicitly named inherited Lean bodies were reread for source/root/row-operator attachment. The saved literature record was reviewed as a worker record only; there was no fresh literature search or independent adoption of its proposed Jacobi identification. Prior audit seals and observation windows remain final.

## Exact source attachment and recurrence

The inherited exhaustive `source_three_rawM9E2`/`source_three_cubicM9E2` classify every generated numerator-three path, with no denominator bound, into q≥1 and both residues. The actual path representation is `false^(q−1) ++ [true,r]`. Its cubic polynomial `threePolyM9E2 q r` and `threeRawM9E2 q r i j` are linked to the unchanged Farey recurrence. They are not a new arbitrary coefficient array. `rawRowMC3E P j` is `(Bivariate.swap P).coeff j`; `raw_row_coeffMC3E` identifies its coefficient i with the literal original integer coefficient `coeff P i j`.

`MarkovTopEquationMB3E` defines

`topDelta(n,j) = fibRows(n+2,j) − 2 fibRows(n+1,j) + fibRows(n,j)`.

The full source-row discriminant equation holds for every natural q,j and either residue. It follows from the inherited exact `three_raw_equationM96A` and guarded row operators. Its correction term is `4 * rowShift 1 (q+1) (gainRows q r) j`. The new `gain_rows_aboveMB3E` proves the gain row zero when `q+(if r then 1 else 2)<j`. Consequently `source_top_equationMB3E`, under **b≤j+q**, gives

`R_j + 2(X−1)R_(j+1) + (X+1)^2 R_(j+2)`

`= Delta_j + 2(X+1)Delta_(j+1) + (X+1)^2 Delta_(j+2)`.

The proof applies the full equation at j+2, explicitly checks the guarded shift, and uses the gain support. It does not discard a correction term by assumption or replace a negative exponent by natural subtraction. Separately, for q≥1, `source_rows_aboveMB3E` proves R_j=0 when **b+2<j**, using the original polygon support of the actual source path. The top Fibonacci row and rows above it are proved explicitly.

`MarkovTopTemplateMB3E` defines the diagonal delta `Delta(n,t)=topDelta(n,n+2−t)` and template T with T(n,0)=1, T(n,1)=Delta(n,1)+4 and the displayed signed recurrence. `source_top_templateMB3E` proves

`rawRow(threePoly(q,r), b+2−t) = T(b,t)`

for q≥1 and **t≤q+2**. Strong induction separates t=0, t=1 and t+2, uses the above-top zero rows, and checks each natural-subtraction index equality using b≥3q+1. There is no hidden formula, recurrence, sign or gap premise. `source_top_coeffMB3E` then gives equality at every natural column. `source_top_pathMB3E` quantifies over every actual numerator-three path, producing q,r once and then all allowed t and i. The finite-depth sector is **b−q≤j≤b+2**; the separate zero theorem covers higher rows. Small q=1,2 and depths 0,1,2 are included in the template identity, without being silently included in stronger coefficient/support claims whose hypotheses fail.

## Positive finite sum, exceptional columns and support

`MarkovTopSumMB3E` derives denominator-shift recurrences for Delta and T under **t≤n**. Four instances of the inherited `row_diagonal_operatorMDAB` give the second-difference identity along (n,t)→(n+2,t+1). Two-step induction with both base cases and the inherited double-prefix identity proves, for **every natural d,t**,

`T(2t+d,t) = Delta(2t+d,t) + 4 sum_(s<t) (t−s) Delta(2s+d,s)`.

The equivalent arbitrary-n formula requires **2t≤n** before substituting d=n−2t. It retains all low-depth contributions and is a finite polynomial identity. It invokes no analytic expansion, Lagrange inversion or unproved summation principle.

`MarkovTopCoefficientsMB3E` first proves Delta at depths 0,1,2 exactly, including their signed exceptional coefficients. For high column k+3, `top_delta_highMB3E` has the guard **t≤n+2** and retains an explicit **3≤t** branch. At depths ≥3, coefficients 0,1,2 vanish under the same range guard. The new `topPositiveMB3E(n,t,k)` is

`[3≤t] choose(t−3,k) choose(n+5−t+k,k+3)`

`+ 4 sum_(s<t) (t−s) [3≤s] choose(s−3,k) choose(n−2t+s+k+5,k+3)`.

Here the scalar t−s in the sum is integer subtraction; the binomial parameters use guarded natural subtraction. In particular **s=0,1,2 are explicitly zero in the high-column sum**, so natural subtraction cannot invent extra low-depth terms. The equality with `T(n,t).coeff(k+3)` requires **2t≤n**. The auxiliary sum itself is nonnegative for every natural n,t,k; its exact positive support is **k+3≤t**, under 2t≤n. The proof uses a positive first term inside support and vanishing binomial terms outside it, retaining the nonnegative remainder.

`MarkovTopEdgesMB3E` treats the exceptional columns separately. Under **2t≤n and t≥3**, it proves

- A_0=0;
- A_1=4(n+6−3t), with the subtraction in integers;
- A_2=4(t−2) choose(n−2t+6,2).

Those formulas alone do not imply A_1>0 without the further parameter guard. The proof splits the finite sum at its first three entries, invokes their exact Delta coefficients, and explicitly justifies the cast of n−2t. The universal prefix and weighted-binomial telescope identities are proved by induction and Pascal identities. Applied after splitting/reindexing s=3+u, they give

`A_3 = choose(n+5−t,3) + 4[choose(n−t+6,5) − choose(n−2t+9,5) − (t−3)choose(n−2t+8,4)]`.

Both boundary subtraction terms remain. This is a checked finite-sum identity, not merely a fitted symbolic output.

The whole-row support theorem requires **2t≤n, 5≤t and 3t≤n+5**. It proves, for every natural i, A_i≥0 and **A_i>0 iff 1≤i≤t**. The cases i=0,1,2 are proved separately from the high-column formula. For an actual source, **5≤t≤q+2** supplies every required arithmetic guard; `source_top_supportMB3E` and `source_top_zero_tailMB3E` retain column zero and all i>t as exact zeros. The new support theorem is not claimed at t<5, although the earlier template identity covers those depths.

## Strict first triple and genuine source gain

`MarkovTopEdgeGapMB3E` uses rational parameters **s=t−3≥0** and **d=n+5−3t≥0**. Its two rational expressions represent A_2 and A_3, while A_1=4(d+1). The exact identity for **15(A_2^2−A_1 A_3)** has 25 integer monomial terms and positive constant 7440. Lean `ring` checks the identity; `positivity` and `linarith` derive strict positivity under s,d≥0. The auditor compared the saved 25 monomial/coefficient strings with both occurrences in the final Lean certificate; no expansion, arithmetic evaluation or sign calculation was run. The external generator's assertion is not the proof authority.

`top_template_first_strictMB3E` applies this certificate under **2t≤n, t≥3, 3t≤n+5**. Every conversion from natural subtraction to rational arithmetic has an explicit bound. The rational inequality is transported back to integer coefficients by injective casts. There is no factorial/binomial normalization of the raw source coefficients and no cancellation requiring hidden source positivity.

`source_top_first_strictMB3E` and its actual-path wrapper attach the result for **q≥1, 5≤t≤q+2**. `source_top_edge_polygonMB3E` separately proves polygon membership for all three literal points **(1,j),(2,j),(3,j)** at j=b+2−t. These depth hypotheses are nonempty only for q≥3. Comparing the displayed source guards with worker181's residual identifies an unbounded upper-edge family beyond its lower half-plane, earlier correction rows and row five. This is a source-scope comparison, not an independently constructed theorem or recomputed witness. The starting-i=0 result is zero handling; its triple is not the polygon-valid strict first triple.

`TopEdgeRegionMB3E(q,r,i,j)` is exactly **i≤1 and ∃t, 5≤t≤q+2 and j=b+2−t**. Starting i=0 uses A_0=0 and square nonnegativity; i=1 uses the strict source theorem weakened to ≤. No full-row claim is smuggled into this region.

## Exact open residual and original root

`ThreeRemainingMB3E` quantifies over every q≥1, both residues and all natural indices. Its horizontal clause retains the predecessor's **q+3<j, b<2j+1 and j≠5** and adds **¬TopEdgeRegionMB3E**. The vertical clause is unchanged: it requires the raw inequality outside

`((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)`.

The diagonal clause is unchanged: it requires the inequality outside **3≤i≤6 and j+2≤q**, using the literal triple **(i,j+2),(i+1,j+1),(i+2,j)**. `OtherFourM9E2` still requires `GlobalLC18` for every actual path with numerator at least four. `root_iff_remainingMB3E` splits exactly the newly proved edge region in the old horizontal obligation and copies the vertical/diagonal tuple unchanged. Neither remaining conjunct is proved.

`TopTemplateLCMB3E` is separately defined for **all natural n,t with n≥4 and 3t≤n+5**, at every natural starting column i. It has no additional 2t≤n premise. `source_top_of_templateMB3E` proves its conditional source transport for q≥1 and t≤q+2. This unproved proposition is broader than the range of the displayed positive coefficient formula; it is not an accepted universal sign theorem or a new root equivalence. Even the conditional full upper-sector result leaves the intervening upper strip, the vertical/diagonal residuals and other numerators.

The root source remains SHA256 **8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe**. Its canonical contract pin remains **6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc**; raw contract bytes have SHA **cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068**. The original natural-zero convention, polygon `ab≤bi+aj` and `i+j≤a+b−1`, all three directions and endpoints 0/1,1/1 are inherited unchanged. The exact reductions justify the all-natural residual formulation; no polygon point or zero is removed. The root has not been proved or refuted.

## Finite evidence and experiment boundaries

The five new Python scripts were read and AST-parsed only. The certificate generator has top-level calculations and project writes; it was neither imported nor executed by the auditor. The other four scripts use main guards. Their inherited source recurrence helper is identity-bound, not executed. Saved outputs are finite evidence, not additional axioms.

- Source coefficient checks use **q=1..16,24,35,50**, both residues: 38 deterministic source labels, t=0..q+2, i=0..t+4. Static domain counts give **604 rows, 10,156 coefficient positions and 416 strict edge positions**. The saved output reports **2,906 zeros**, retained without recomputation, and no failure. Its small-depth experimental formula handles t=0,1,2 separately; this does not extend a formal theorem's hypotheses.
- The broader raw scan has 57 planned label appends before deduplication: those 38, three explicit paths, 14 seeded length-six paths and two endpoints. Its **55 saved unique labels** yield **59,388 horizontal, 59,388 vertical and 59,888 diagonal polygon-valid triples**, total **178,664**, by direct index/guard counting. No path, frame, coefficient or seed182 random sequence was regenerated. Zero and inequality values were not recalculated.
- The symbolic experiment tests t=3..22 after n=3t−5+d: **20 fixed depths and 250 gap positions**. It saves all 20 row coefficient serializations, but only **52 explicit gap polynomials** for t=3..10; t=11..22 have counters and an empty reported negative list, without individual gap serializations. No unbounded-depth certificate follows.
- The initial upper-source scan has **235 candidate row positions**, q=1..10, both residues, j=ceil(b/2)..b+2. It reports 235 nonempty rows, no Newton-inequality failures, 54 non-real-rooted rows and 39 small-q examples. Its Sturm helper counts distinct roots, potentially confusing repeated real factors with non-real roots. The follow-up retains the original output and recursively counts repeated factors. It reports **232 source checks** after the degree filter, 54 non-real rows and no repeated nonzero factors. The 54 saved labels/counts agree literally with the initial output. The three filtered-out positions depend on computed row degree; no complete filtered case list is saved, and this audit does not independently recompute that value-dependent domain.
- The follow-up also tests **120 templates**, t=3..22 and d∈{0,1,2,5,20,100}, n=3t−5+d. It reports no non-real or repeated factors there. Stripping exterior zero factors is confined to these root counts; the source coefficient/LC scans and theorems retain zeros. Neither these 120 cases nor the 54 broader failures proves or disproves the raw conjecture.

The source-experiment summary matches raw event123 with labels omitted; the initial Sturm output matches full event43, the symbolic summary matches event76 with rows omitted, and the follow-up matches full event169. Generator event115 prints the Python-dict literal `{'scale': 15, 'terms': 25}`, not JSON; the audit binds that exact projection and the retained coefficient serialization separately. No script output is treated as proof of its own universal assertions.

The worker's informal Jacobi comparison and weighted-sum real-rootedness proposal remain unformalized. The literature record lists publisher and DLMF HTML retrieval and two unsupported `.tex` fetches; no such claim is adopted as a Lean premise or independently searched by this audit. Python3.14.6 was recorded; Sage/SymPy unavailable, GAP located but not invoked. The failed shell heredoc and other capability failures remain recorded.

## Selected validation, rejected attempts and versions

The final selection is nine modules, **45 theorem declarations and nine definitions**. There are no additional current mathematical candidates left compiled-only, timeout-only or unbuilt.

| Module suffix MB3E | Theorems | Definitions |
| --- | ---: | ---: |
| TopEquation | 8 | 1 |
| TopTemplate | 4 | 3 |
| TopSum | 7 | 0 |
| TopCoefficients | 8 | 1 |
| TopEdges | 5 | 0 |
| TopEdgeGap | 1 | 2 |
| TopEdgeSource | 3 | 0 |
| TopRegion | 5 | 2 |
| TopSupport | 4 | 0 |

Every final selected source has a matching successful compilation, final object hash, full-set replay membership and explicit theorem-name axiom coverage. Twenty-one compiler attempts comprise **11 successes, nine return-code-1 failures and one timeout**. The successes are ten mathematical compilations across nine modules plus the Audit. The ten unsuccessful snapshots retain their rejected status. The TopSum timeout `build-1792222588926974000.json` omits `returncode`, has `timeout:true` and records 120.155120958 seconds; it is not counted as a tenth return-code-1 failure.

An earlier successful TopTemplate snapshot, `build-1792222426494985000.lean`, had four theorems and two definitions, SHA **d525b263215ac06935e03df3b8c1a3be44a4265fd0f0d07c054b9c5b866906e2**. The final source, SHA **7950948c55a74aad5f0b0b56c2c5253a1b389279bf2e55dca9c74276eb665823**, adds `topDiagonalDeltaMB3E`, changes the template definition and corresponding proof block, and has its own successful build `1792222581847603000`. Both retained replays use the final bytes. The earlier success is not silently promoted to the final definition. All other successful mathematical snapshots and the Audit snapshot match final sources. Failed snapshots keep the same imports and common theorem headers after whitespace normalization, with the added definition distinguished; header equality is not proof equivalence.

The first successful replay, **kernel-1792223147507813000.json**, checks eight modules, 41 theorems and nine definitions, before TopSupport. Its interval estimate is **07:45:47.507813–07:45:56.779974 UTC**. The final successful replay, **kernel-1792223258039818000.json**, checks all nine modules and 54 explicit mathematical constants, **07:47:38.039818–07:47:49.288180 UTC**. The final validation JSON selects only this full-set receipt. There is one 45-name axiom Audit, **axioms-1792223268724899000.json**, linked to `MarkovAudit1792223258046800000MB3E` and successful build `1792223258046903000`, estimated **07:47:38.046903–07:47:48.721875 UTC**. It overlaps the final replay. Every printed axiom set contains only **propext, Classical.choice and Quot.sound**. There is no separate first-stage axiom Audit, and no inference that the eight-module stage had nine-module coverage.

The validator hashes and copies a source snapshot, then compiles the live research source into its evidence object. This is not an atomic snapshot-as-compiler-input protocol. The retained source-edit events, final-source mtimes and same-module build intervals show no current overlap, but do not establish stronger process authentication. Build command envelopes can contain successive attempts; constituent receipts govern their classifications. Mathematical bounds are 90 or 120 seconds, the Audit bound is 100 seconds, and both replay bounds are 120 seconds. Compiler intervals inferred from filename timestamps plus monotonic durations remain estimates, distinct from stored host timestamps.

## Replay method, imports and inherited qualifications

The checker SHA is **391a3f43eea2eeee74de7d847b3f262eb28030f660085f55f9ea528c7a04f7b4**. Its body is an exact worker181 retag and, after removal of the explicit isolation guard, matches the retained worker110 replay body under the documented text normalization. The guard checks every collected `MathGKM.Markov.*MB3E` name for absence from the imported environment and rejects unsafe/partial declarations. The observed 50/54 guarded names match the explicit inventories. It imports selected modules' direct dependencies excluding the selected set, then calls ordinary `env.replay` over the collected union. The explicit inherited direct import is `MarkovHalfPlaneM5BF`; with Init the count is two.

This checker is operational unsafe code, not an independent kernel implementation. Ordinary imported compiled bodies, toolchain behavior, dynamic object lookup and optional server/private module parts remain trust boundaries. Differently named generated/private constants do not receive separate explicit-name coverage merely because the selected names did. The source-derived Audit list and raw compiler output agree on all 45 theorem names; this is distinct from guards on definitions and from fresh validation of every imported body.

The full selected source closure has **2,797 modules**, consisting of nine current modules plus **2,788 inherited source/object pairs**; adding the Audit gives 2,798 graph nodes. All nine endpoint closures use the same inherited count. The independent pair map comprises sealed181's 2,782 pairs plus six accepted181 modules: DriftClosed, FullBandRegion, HalfPlane, OutwardMoments, OutwardRates and RadialCovariance. DriftStrict and DropObstruction remain outside this graph. Expected identities come from sealed evidence, not a fallback to whatever bytes happen to be current; the first object in the saved search-path order agrees. The primary comparison inventory has 576 older mathematical source pins, of which 436 are imported and 140 comparison-only, plus 182 historical pending/other-status pins, two operational pins, 109 inherited script pins and 18 explicitly retained external source/object pairs. The full external library graph is not newly traversed.

Every endpoint still imports the **212 unrecovered worker121 modules**, including the195 subset, plus the separate19 historically accepted modules. This round does not recover them. WindowLC retains its empty-checker/two-print boundary (`runInterval_cross6d34`, `runInterval_smoothed_lc6d34`), without a new `crossLC_balanced6d34` print. Abel retains its distinct source/object/two-print boundary (`tail_weight_nonneg65c4`, `centered_weight_nonneg65c4`), without a new `crossLC_center_weights65c4` print. Worker166 completed at the host while its combined replay timed out; its seven compiled/printed prefixes remain unreplayed and outside this graph, with only CorrectionFactor contributing from that worker. Worker179's compiled-only DetTest remains outside the graph. None receives retroactive credit.

Worker156's timeout and157's separate twelve-module/44-closure recovery, worker171's `missing_or_malformed_report`/return1/null report, prior pending sources and earlier replacement/version qualifications remain historical. The current171 reconciliation retains its127 artifacts and recorded raw history; it is not a new replay, report repair or backlog recovery. Worker180's live-source build overlap and corrected natural-subtraction statement retain their original qualifications. **No fresh whole-source build or replay of the inherited campaign occurred.**

## Finalizer, report versions and preservation

The validation, Audit, replay and finalizer wrappers match worker181 after request/suffix/predecessor retagging. Setup adds the raw contract hash and capability description. The finalizer scans selected raw source text, including comments, for banned admission tokens; finds successful source-matching build entries; hashes current objects; requires a successful exact full-set replay source map; and checks permitted axiom lists. It does not itself assert exact theorem-name coverage, checker hash or printed replay marker. Those actual associations are checked independently here and in the Audit wrapper. Its source/object sampling and unsorted receipt selection remain documented limitations.

All **21,945 initial inputs** match, with no owned exemption; setup itself is in that input inventory and absent from controller-before. That inventory distinction does not establish creation time. The preservation scan's exact suffix/directories and separate root/contract checks are documented in the method note. All79 predecessor manifest entries match; the predecessor's81 controller/archive files and its separately retained opaque cache keep their earlier boundaries. The new manifest has **95 entries**, all archived. The **97 archive/controller files** additionally include manifest and last-verification, which are not indexed in their own manifest. There is no manifest-only gap.

The finalizer was invoked once: completed event208. Its complete output matches last-verification and reports95 verified artifacts,21,945 unchanged inputs, nine modules,45 closures and ten rejected builds. The finalizer writes validation before preservation checks, so mere validation-file existence would not suffice; the successful finalizer output is retained separately. Event210 is a later count/stop check. The delivered report is event211 and turn completion is event212.

An archived **evidence/markov-b3eed364/report.json** is a longer draft written before finalization, at event206. It agrees with the delivered report on request, summary and null completion but differs in actions, observations and agenda. The delivered event211, controller final.json and receipt report agree with one another. Both versions remain preserved; the draft is not substituted for the delivered report or for proof receipts. The event stream has212 events,100 started items and65 command starts; stderr is empty and all509,599 activity bytes are accounted for.

Final selected mathematical compilation finishes around **07:47:26.623809 UTC**. Final validation's original mtime is **07:50:12.431032**, manifest **07:50:14.563962**, last-verification **07:50:14.568588**, final.json **07:50:43.437356**, and host finish **07:51:12.957626**. Archive mtimes reflect later copying; they are not proof timestamps. No causal inference is made about these clock gaps.

The raw contract byte hash, pinned whitespace-stripped serialization and separately printed compact UTF-8 JSON serialization are distinct. Event49 calls the compact sorted `ensure_ascii=False` JSON digest **f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4** “canonical”; it is not the request/finalizer pin6dda… above. Parsed contract equality holds. A different serialization digest is not evidence that the mathematical contract changed.

## Opaque supplement and bounded observation

The initial exact-request inventory observed **100 current paths versus97 archive/controller files**, consisting of the archive-bound set plus three unindexed, unarchived Python caches. They were retained as opaque bytes only, with bytes/mode/uid/gid/mtime matched, in this separate bundle:

`/private/tmp/math_gkm_godel_20261013/markov_worker_000182_unindexed_cache_bundle/`

| Relative path below bundle | Bytes | SHA256 |
| --- | ---: | --- |
| research/__pycache__/probe_upper_b3eed364.cpython-314.pyc | 5,560 | c8e7e3b125504a53c25c24746f3d4b4a7439c840004fb5c0f49360ff7f3a3728 |
| research/__pycache__/top_symbolic_b3eed364.cpython-314.pyc | 8,724 | 50faabb2ba42300b6faf287886af2ece7eb5fb79bd1a7a566b0fafe3d917cd14 |
| research/__pycache__/validate_b3eed364.cpython-314.pyc | 5,808 | 52f873f49c57871fc59d51c675e42abf0e124a7fa8101b59598b8010cda6fc60 |

Total **20,092 bytes**. The exact original project paths are the same relative paths under `/Users/sasha/math_gkm/`; no original archive/index entry was added or rewritten. Discovery was at **07:52:15.822704 UTC**, metadata observation **07:57:23.118657–07:57:23.124043**, copy **07:57:23.124178–07:57:23.124965**. Later discovery does not imply later creation. No decoding, execution, source-version, producing-process or successor attribution is claimed, and no validation status is upgraded. The companion observation and bundle records are included in the final integrity bindings.

Audit-owned preseal refinements are explicit: primary literal binding for generator event115's Python repr; method parser handling of an equation-style definition; message-only timeout/module-label corrections; draft-versus-delivered report comparison; validator projection handling for saved symbolic rows; a companion inventory-count typo300→100; and the fresh parent sealer's planned fixed-pin cardinality13→11 before execution. The cache inventory-count correction was made before sealing, with old/new companion hashes recorded, without changing any copied bytes or original metadata. No project mathematics, source, receipt or older seal changed.

After the project observation windows closed, a method-note/embedded-summary rendering count was corrected from106 to109 inherited scripts, matching the already checked primary inventory. Only the temporary method note and evidence changed; their previous and current hashes are retained. The original helper, standalone companion record, input maps and project observations were left unchanged. The final seal distinguishes the observed old temporary identities from this explicitly bound post-observation correction. No project read, research change or validation upgrade followed.

Final method observation: **164 named inputs unchanged, 08:04:44.337939–08:04:44.391558 UTC**, with27 temporary input pins; absence is N/A at08:04:44.391567, empty path map. Final validation observation: **25,103 named inputs unchanged, 08:05:28.345982–08:05:52.770050 UTC**, with22 temporary input pins; absence N/A at08:05:52.780145. The closing exact-request inventory at **08:05:52.780329 UTC** retains97 archive files,95 manifest entries and100 current paths, the same three cache extras, no missing paths and all six source/copy metadata matches. The independent dependency observation covered all2,788 source/object pairs at **07:52:54.039852–07:53:21.007719 UTC**. Reviewers agree on92 shared fields,2,788 pair expectations and145 shared input hashes.

All project reads are closed. The method correction at08:06:53.417129 and validator's08:07:50 temporary-file refresh are explicitly later **audit-files-only** observations: the original input maps/windows and old method hashes remain retained, and the sealer permits only the two documented method-note/evidence hash substitutions. No unnamed tree, active successor, later research change or old absence window is covered by this statement.

## Final preservation bindings

Preserve **17 files including integrity**: the main audit, seven supports, inherited-pair map, primary static helper, audit-only sealer, integrity record, three opaque cache copies and two companion metadata records. The seal lists the16 non-integrity paths; its own SHA is supplied separately. The supplemental records use `preservation.supplemental_unindexed_cache_bundle`. No other missing project file or validation execution is required for this closed audit.

| Retained temporary file | Bytes | SHA256 |
| --- | ---: | --- |
| markov_worker_000182_mathematical_source_hashes.json | 475,388 | 78dd5b13081c2ba1b85620354744a9a00d1752711f6d22ecbb8c87dc1d90dbcc |
| markov_worker_000182_source_structure_audit.json | 56,693 | b312192bf10b36d2d14cda359b43963d50739b651c728439ef97db50ad551a76 |
| markov_worker_000182_finite_domain_audit.json | 45,702 | b54a41c1c1f9efbb7e151ed185ac398b4ee4c0144881e64155adcb9908369877 |
| markov_worker_000182_validation_audit.md | 32,039 | 1d10511edee68a9812323a32203a5aed027da8a1365cb01c80b40997be99dec5 |
| markov_worker_000182_validation_evidence.json | 18,274,822 | 53a1de8f35aae6917425fa50a96dc64b9e27e7c2f43ebc84d004079a6b36ea60 |
| markov_worker_000182_replay_method.md | 25,593 | 808218193f662eeda971c5b928fb225d37f90c5a8f87599696c627335cc95bb6 |
| markov_worker_000182_replay_method_evidence.json | 20,537,846 | 475b9151d90389053189e15cbcf0dc6a1297a1245d122d7d425d6f0e2012a42e |
| markov_worker_000182_inherited_pair_expectations.json | 2,576,909 | 338a24d1dcfce6483391a828870f4e909ca8b0e643066620b4440bae115fe0e2 |
| markov_worker_000182_unindexed_cache_bundle.json | 3,968 | eef84f26bc07f7a948e72225db40bfd8e05fb1139f4b66f25e9f7ea471fb0b34 |
| markov_worker_000182_unindexed_cache_observation.json | 2,792 | 10129d2e1dc5d320b74c4a91d364165f126d0cb3d897f4cdfba6a41b0692a4ea |
| static_audit_worker182.py | 26,370 | 0147c147f061a9f831effe0f90c5bfc524744f7654d60585a2fc7d4e5030e3e1 |
| seal_worker182_audit.py | 21,233 | 683cee709f98ff10f80fb5f7886b246fd9a43961a2d2f61999a546c24e235a7c |

The three opaque relative paths and hashes are listed above; their exact full preservation paths are in the bundle companion. The final independent cross-review checks this completed main and sealer using only temporary audit files. Full root resolution is not claimed.
