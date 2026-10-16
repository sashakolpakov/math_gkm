# Completed worker 151: independent static audit

Request `db972d62445f4aceac3b243e0cba0855`; archive `/Users/sasha/math_gkm/.control/markov/workers/000151/artifacts`. This audit reads completed records and explicitly named inherited/current counterparts. No project code, Lean proof, checker, replay, experiment, finalizer or mathematical-value computation was executed. No source/machinery changes, research assistance or proposer contact occurred. Active worker 152 is outside the review. Auditor computations are static parsing, hashes and input-index cardinalities only. Earlier audit seals and observation windows remain final.

**The substantive new result is universal raw vertical log-concavity for every actual numerator-two source, at every natural column and row, including zeros.** The exact original triple is

`coeff p i j * coeff p i (j+2) ≤ coeff p i (j+1)^2`.

There is no denominator, path length, ratio, support-positivity or polygon hypothesis. The proof discharges worker 150's three kernel-shape premises. It does not prove the source diagonal or the full pinned conjecture.

Nine mathematical modules contain **52 theorem declarations and 13 definitions**, hence 65 explicit selected declarations. The source/declaration inventory and exact headers are in the mathematical and structure supports. No admission, new axiom, `native_decide`, unsafe or partial mathematical declaration was found in these final sources.

The controller records completed/returncode0, with a structured report and null mathematical completion. Start is epoch1792170592.231692, finish1792171967.007148, retained elapsed1374.775456905365 seconds. The exact historical outcome is completed, independently of the failed intermediate builds. It is not a root-completion result.

## Finite convolution and determinant proof

The inherited definition `CrossLC f` is the all-integer relation

`∀ i j, i ≤ j → f i * f (j+1) ≤ f (i+1) * f j`.

It is stronger than an adjacent-only statement without a support condition. The new general proof does not silently replace it with adjacent LC or omit internal-zero obligations. Its concrete binomial sequences obtain CrossLC from the inherited finite `nbPoly_cross6d34`; that theorem explicitly proves nonnegativity, adjacent inequalities and interval support before applying the inherited bridge.

`seqPolyMDB9 f N` is a finite polynomial with coefficients `f k` for natural `k≤N`, zero above. Its integer coefficient sequence is exactly the same upper cutoff when `f` vanishes at negative indices. `crossLC_cutMDB9` preserves CrossLC under an upper cutoff using nonnegativity: if `j+1` exceeds the cutoff the extreme product is zero and the other product is nonnegative. No infinite sum, analytic convergence or limiting argument is used.

The common finite sum is

`D(j,m) = Σ 0≤k≤min(j,m), w(k) f(j−k) g(m−k)`.

`diagSum_rowMDB9` assumes CrossLC, nonnegativity and negative-index zero extension for **all three** sequences. The sequence `w(k)g(m−k)` is CrossLC by reversal and pointwise product, nonnegative, and zero at negative indices because `w` is zero there. It is realized by a polynomial truncated at `m`; `f` is truncated at `j+2`. Exact product-coefficient identities at `j,j+1,j+2` identify the three sums with these finite polynomial coefficients. The inherited finite polynomial convolution theorem then gives the row inequality. Swapping `f` and `g` gives the column inequality.

The coefficient identity covers `j≤N`. Its terms with `k>m` vanish by the negative extension of `g`; terms with `k≤m` use the justified natural-to-integer subtraction cast. `diagSum_extendMDB9` permits any finite range `N` with `min(j,m)<N`; added terms have either `j−k<0` or `m−k<0`. Thus the finite cutoff is exact even at zero tails.

The determinant theorem has weaker hypotheses: CrossLC of `f` and `g`, nonnegativity of `w`, and negative-index zero extensions of `f/g`. It does **not** additionally assume CrossLC of `w` or nonnegativity of `f/g`. All four sums extend to the same range `j+m+3`. The inherited exact determinant identity expresses their determinant as the sum over pairs `a<b` of two oriented minors. CrossLC gives both minor signs; the first is multiplied by `w(a)w(b)≥0`. The result is

`D(j+1,m) D(j,m+1) ≤ D(j,m) D(j+1,m+1)`.

The inspected inherited `determinant_sumFe01` is a finite algebraic identity and `determinant_sum_nonnegFe01` requires the exact pairwise signs used here. There is no division or positivity cancellation in this step. The statement proves the adjacent minors needed by `KernelShapeM4F4`; the prose term “TP2” should not be read as a new formal all-row/all-column minor theorem beyond that stated adjacent result.

## Concrete sequences, kernel and actual sources

The new sequences are zero-extended negative-binomial values `nbSeq_s(k)`, and `chooseSeq_r(k)=nbSeq_r(k−r)`. Their natural values are respectively `C(k+s,s)` and `C(k,r)`, including zero when `k<r`. CrossLC of `nbSeq` follows by applying finite `nbPoly_cross6d34` at cutoff `(j+1).toNat`; all four integer indices are below that cutoff even when `j` is negative. Translation gives CrossLC of `chooseSeq`. The weight is zero for negative indices, one at zero and two at every positive index; its CrossLC is proved by explicit sign/zero cases.

`two_kernel_diagSumMDB9` identifies the inherited integer kernel with the real finite sum of `nbSeq_i`, `chooseSeq_(i−2)` and this weight, **for every natural i,j,m**. Splitting off the zero term and shifting the remaining index by one gives the exact inherited kernel. Each natural subtraction is guarded by the finite summation range. For `i=0,1`, `i−2` remains natural subtraction, as defined; no signed reinterpretation is introduced.

`kernel_shapeMDB9` then proves all three components of the previously conditional `KernelShapeM4F4 i`, for every natural `i`: row LC, column LC and adjacent minor nonnegativity. Explicit injective real/integer casts transport the inequalities back to integer kernel values. There is no binomial, factorial or denominator normalization of the original coefficient.

The inherited kernel antidiagonal lemma uses a separate, legitimate support split. If `m<i−2`, an extreme kernel coefficient is zero. Otherwise the selected central auxiliary kernel value is strictly positive, and only its positive square is canceled in the scalar inequality. No zero coefficient is divided out.

Every actual numerator-two path has `b=2q+1` with `q≥1`, by the exact inherited source classification. The identity `source_two_kernelM4F4` gives raw `coeff p i j = K_i(j,2q−j)` for `i≥3` and `j≤2q`, and its outside theorem gives zero for `j>2q` in those columns. These are source-recurrence identities, not an assumed correspondence to an arbitrary binomial family.

For `i≥3`, the new adapter splits `j+2≤2q`. In that branch all three source-kernel identities apply, and the kernel antidiagonal with `m=2q−j−2` is exactly the **source vertical** triple at fixed `i`. In the other branch the last raw coefficient is zero, making the inequality immediate from a square's nonnegativity. The inherited theorem `vertical_first_threeMEA` supplies all `i≤2`, separately covering columns 0,1,2. The final theorem therefore has only the actual-path condition `mid.a=2`, with unrestricted natural `i,j`.

This is stronger than polygon-only vertical LC and preserves every zero and boundary triple. It does not extend the `i≥3` source-kernel formula itself to the exceptional small columns. The original horizontal direction had been proved earlier for these sources; the original constant-`i+j` diagonal remains unresolved.

## Exact residuals and genuine new coverage

`root_iff_other_verticalMDB9` proves

`Conjecture63 ↔ OtherVerticalCoreM0D3`.

The right side is an existing, previously conditional core. A static clause comparison against the latest `InteriorCore63M295` confirms that its horizontal and diagonal clauses are **byte-identical**; only the vertical guard changes from exclusions of numerator-two columns 4 and 8 to `m.a≠2`. The old ResidualM295 file is unchanged. The result removes every remaining numerator-two vertical obligation, while retaining all other-numerator and diagonal obligations, the exact polygon guards, depth and boundary ranges, and the older mixture/variance/sharp exclusions. The core itself is unproved.

The inherited pinned root still includes its separate `0/1` and `1/1` endpoint clauses. The exact reductions discharge those through inherited proofs rather than deleting them. Original indices and the non-strict raw coefficient inequality remain unchanged; this audit does not claim a fresh English/source review of the entire inherited project.

`vertical_previous_guardsMDB9` supplies a formal unbounded gain family. For every natural `n`, the actual path is `twoPath3af (2*n+20)` and the vertical start is `(n+9,2*n+21)`. Its theorem includes all three polygon memberships, the old depth/strip guards, negations of all previous vertical middle/region/variance/sharp criteria, and both old column 4/8 exceptions. `vertical_gain_rawMDB9` proves that same triple using the new universal theorem. Both columns and source denominators are unbounded. This establishes genuine coverage beyond the prior residual; no other-numerator gain is claimed.

## Diagonal reparameterization: exact predicates and remaining premises

The arithmetic alternative uses the inherited exact raw coefficient function `rawTwoM679`. `TwoDiagonalMDB9` quantifies over **every natural q≥1 and all natural i,j**, with inequality

`rawTwo q i (j+2) * rawTwo q (i+2) j ≤ rawTwo q (i+1) (j+1)^2`.

There is no polygon or nonzero filter. Every such `q` is realized by the canonical actual path `twoPath3af (q−1)`. The new all-column vertical theorem and the exact coefficient identity prove the formerly required arithmetic vertical part. Consequently `Conjecture63 ↔ TwoDiagonalMDB9 ∧ OtherSourcesM679`; the latter retains GlobalLC in all three raw directions for every actual numerator at least three.

For columns `i≥3`, `KernelDiagonalMDB9` quantifies natural `i,j,m` and requires an **existential natural q** with `j+m+2=2q`. Its triple is

`K_i(j+2,m), K_(i+1)(j+1,m+1), K_(i+2)(j,m+2)`.

The parity equation forces `q≥1`. Forward transport uses the actual source identity when `j+2≤2q` and a zero extreme otherwise. Reverse transport from the root chooses the actual canonical path and uses the inherited equivalence of polygon WeakLC and all-natural GlobalLC for source polynomials with outside-polygon zeros. Thus parity is retained as a real source restriction, not silently discarded.

The exact root equivalence additionally retains `SmallTwoDiagonalMDB9`: every actual numerator-two path, every natural row and every starting column `i≤2`. This small-column proposition is **not proved here**. It must not be confused with the small-column vertical theorem used above. `OtherSourcesM679` also remains a separate obligation.

The reduced kernel is defined by

`H(n,j,r) = K_(n+2)(j,r+n)`.

Its exact real finite-sum identity replaces the shifted choose sequence by `nbSeq_n`. Both sums extend to `j+r+n+1`; the integer identity `(r+n)−k−n=r−k` proves termwise equality, including zero terms. No interpolation is involved. `H` is strictly positive for all natural `n,j,r`, and LC in `j` is proved from the established kernel shape.

`ReducedDiagonalMDB9` is the desired triple

`H(n,j+2,r) H(n+2,j,r) ≤ H(n+1,j+1,r)^2`,

with **n≥1** and `∃q:ℕ, n+j+r+2=2q`. The equivalence with KernelDiagonal uses `i=n+2,m=r+n`. In the reverse direction, `m<i−2` gives a zero first extreme; otherwise `n=i−2` and `r=m−(i−2)` have justified natural subtraction. The common `r` is preserved across all three terms. No parity, zero-support or small-column case is lost.

The final exact alternative is

`Conjecture63 ↔ ReducedDiagonalMDB9 ∧ SmallTwoDiagonalMDB9 ∧ OtherSourcesM679`.

By contrast, `ReducedShapeMDB9` is only a **sufficient condition**. Its two unproved clauses are LC in `n` at fixed `j,r`, and nonnegative adjacent `(n,j)` minors, both for every natural `n≥1,j,r` and without a parity restriction. Proved `j`-LC and positivity allow the inherited scalar glue to derive the reduced diagonal inequality. `root_of_reduced_shapeMDB9` still assumes both SmallTwoDiagonal and OtherSources. No theorem here proves either shape clause, equates this stronger shape condition with the exact residual, or completes the root.

## Obstructions and finite evidence

`kernel_diagonal_shift_failureMDB9` proves failure for **every natural shift s**, not merely the four tested shifts, at the fixed direct-kernel summand indices `i=3,j=0,m=2,k=1,l=0`. Its proof splits `s=0` and `s>0`, with natural subtraction in the min/max indices. This defeats that particular termwise certificate. Separate formal theorems identify the actual `2/5` source raw diagonal values `[28,17,4]`, verify all three polygon memberships and prove their LC. The actual source therefore passes; this is not a conjecture counterexample.

`parameterWeightMDB9 t` is nonnegative and CrossLC for real `t≥1`. A formal auxiliary counterexample with weight17 violates LC in the reduced `n` parameter at `j=r=1,n=1,2,3`. The ordinary weight2 specialization satisfies its displayed small inequality. The changed weight has no actual-source bridge. These results do not refute the exact source residual or justify a general sign theorem. Recorded numerical values are read as saved claims/certificates; the auditors did not recompute them.

The final source experiment covers `q=1..60`, coefficient columns `i=3..32`, and raw vertical/diagonal starting columns `i=0..32`, with `j=0..2q+4`. Twenty inputs are compared directly to canonical recurrence paths. Static index counts match **118,800 coefficient identities, 130,680 vertical triples and 130,680 diagonal triples**. Saved zero counts are 33,175 coefficients,42,850 vertical triples and 42,610 diagonal triples; these value-dependent counts were not recomputed. All zeros are retained and no polygon filter is applied.

The generic kernel scan covers `i=3..32,j,m=0..37`, giving **129,960 shape comparisons and 43,320 diagonal comparisons**. Exactly21,660 diagonal inputs have each parity. Only even `j+m+2` is source-linked; the odd half tests an auxiliary strengthening. The reduced scan covers `n,j,r=0..30`, three comparisons per input, giving **89,373 comparisons**. Its inclusion of `n=0` is broader than the two formal `n≥1` shape premises. Empty saved failure arrays support only these finite domains.

The direct summand probes each stop after five comparisons for shifts0..3, and the symmetrized probe stops after 22. Their requested outer boxes were not exhausted. Static lexicographic-prefix counting reproduces those counts without evaluating any gap. The symmetrized first failure has `j=0,m=3`, hence odd source parity, and is auxiliary. The reduced termwise and minor first failures occur at `n=0`, outside the formal shape-premise range; neither is a refutation of those premises.

Final experiment event 123 exactly matches experiments.json. Final event 88 has two JSON outputs matching diagonal-probe.json and symmetric-probe.json; event 141 matches reduced-probe.json. Earlier events 63 and 137 preserve earlier probe versions/runs, with the latter lacking the added minor probe. They are not silently substituted for the final records.

The final experiment records four post-loop code hashes covering its own script, direct probe helper, inherited raw136 routine and scan dependency. No omitted project helper is identified in those import statements. The probe results have no runtime hash binder; separate archived/current hashes are bounded observations, not invocation-start interpreter or library authentication. All routines are main-guarded; the direct probe has two separate guarded entry calls. The finalizer does not turn finite tests into proofs. No experiment was rerun by this audit.

## Validation, import and timing evidence

All nine mathematical modules have final matching-source successful builds, selected joint replay and explicit final axiom prints. There are no compiled-only or unbuilt mathematical candidates, anonymous examples, definition-only modules or snapshot-only compiler invocations. The complete archive has 13 final Lean sources (nine mathematical, three Audit modules and one driver), plus22 build snapshots, and 12 objects (nine mathematical and three Audit).

The22 compiler receipts comprise 14 successes and **eight returncode1 failures**, with no wrapper timeout. The successes are nine final mathematical sources, three Audits, one superseded DiagonalShape snapshot and one additional final-hash DiagonalShape build. Failed builds are KernelGeneral `1792170732009641000`, KernelSequences `1792170849250859000`, KernelProof `1792170978950152000`, KernelObstruction `1792171094698301000`, VerticalGain `1792171133249605000` and `1792171231917043000`, DiagonalShape `1792171501380106000`, and ReducedObstruction `1792171721757280000`. Failed snapshots differ from final source bytes. Diagnostics include parsing, determinant orientation, natural subtraction/casts, simplification and proof-goal completion; they remain failed attempts, not accepted admissions or source counterexamples.

### Overlapping DiagonalShape versions

The source was edited while an earlier successful invocation remained outstanding. This matters because the wrapper snapshots/hashes before launching a compiler that reads the live file; an overlapping receipt cannot independently establish the compiler's actual read-time bytes.

| Receipt | Source version | Start UTC | Estimated finish UTC |
|---|---|---|---|
| `1792171599944630000` | superseded `fc0f2e44…`, six theorems/two definitions | 17:26:39.944630 | 17:27:20.439356 |
| `1792171636814092000` | final `3709d9af…`, eight theorems/three definitions | 17:27:16.814092 | 17:27:32.113997 |
| `1792171681277086000` | same final bytes, sequential selected rebuild | 17:28:01.277086 | 17:28:21.238657 |

The first two intervals overlap by approximately 3.625264 seconds; edits are saved at events 162–163. The final selected rebuild starts after both overlapping invocations finish, and precedes dependent builds, final replay and final Audit. It binds the final source SHA `3709d9af41f7dfd86b169f5a20b8fdfe18de413676436c3da948eedbf126a14c` and final object SHA `26b13b4a0e69374ab69f1737ec81e3bc57b7b7d6c1c06f3abd2fc845417d945f`.

The superseded snapshot lacks `ReducedDiagonalMDB9` and the two exact kernel/reduced and root/reduced equivalence theorems. It has no separately retained authenticated old object, replay or axiom print. No extra proof credit is assigned to it. Receipt `1792171721757280000` and snapshot `e0122593…` belong to **ReducedObstruction**, not another DiagonalShape version.

### Selected replay and axiom coverage

There are two successful joint replay stages: seven modules/49 explicit declarations in `1792171361723881000`, then all nine modules/65 explicit declarations in `1792171827069855000`. Both use180-second bounds. The final selected source maps and object hashes match the archive/current/inventory bindings. The three successful Audits print6-module/38-theorem,7-module/40-theorem and 9-module/52-theorem inventories, totaling 130 rows and 52 distinct final names. Every final theorem is printed once in the last Audit, with only `propext`, `Classical.choice` and `Quot.sound`; the 13 definitions are selected for replay but are not falsely counted as theorem prints.

The first two Audit invocations explicitly name modules; the final one reads the saved module list. Final Audit build is `1792171827073663000`, generated print module `MarkovAudit1792171827073504000MDB9`, axiom JSON `1792171845737941000`. Mathematical builds use120-second bounds and Audits180. No failed replay, unreturned item or pending validation is hidden by the final inventory.

Checker source SHA is `085da1c8039619fe78af8612c4b3d5c6590c5a71ec844e7e5e07ebf1a7f3fe99`. The checker, validation/Audit wrappers and finalizer are exact worker 150 retags. The isolated checker collects selected module-data constants, imports the inherited base after excluding selected modules, rejects collected explicit `MathGKM.Markov.*MDB9` constants already in that base or flagged unsafe/partial, and calls ordinary `env.replay newConstants`. All 65 explicit selected names satisfy the guard and are absent from the base. Generated/private/equational constants retain ordinary replay behavior. The operational driver uses unsafe IO separately from mathematical declarations.

Replay uses the inherited larger stack and joined task result, with no method bypass. Source maps precede subprocess invocation; the checker hash is recorded after replay, and Audit source maps after compilation. Executables and every optional object part are not independently authenticated. These are bounded version associations, not continuous immutability, invocation-start source authentication or a new checker run by the auditors.

## Inherited imports and unrecovered bodies

The selected base is **2,497 inherited local modules**, with no selected current module. The accepted mathematical closure is **2,506 = nine current + 2,497 inherited**; the final Audit adds one, while the graph including all three saved Audits has 2,509. Five explicit direct imports remain after target exclusion (KernelShapeM4F4, ResidualM295, TwoReductionM679, VerticalTwoAllMEA and WindowLC6d34); implicit Init gives six total. The independent exact source/object pass ran **17:49:31.441978–17:50:13.640082 UTC**, with no mismatch. Origins are 2,491 sealed150 inherited pairs, four accepted150 modules, the separately sealed149 ResidualM295, and the named historical WindowLC6d34. Source/object pairing is preservation evidence, not a fresh build.

The four imported150 modules are LowerDifference, UpperDifference, TwoKernel and KernelShape. NewtonFinite, RegionDegree and GapDegree are absent. The completed but unused old Newton strategy is not mistaken for an outstanding missing condition of the new vertical theorem.

| Endpoint | Local modules | Current / inherited | Old212 imports |
|---|---:|---:|---:|
| KernelGeneral | 14 | 1 /13 | 0 |
| KernelSequences | 15 | 2 /13 | 0 |
| KernelProof | 2,488 | 3 /2,485 | 212 |
| TwoVertical | 2,489 | 4 /2,485 | 212 |
| KernelObstruction | 2,489 | 4 /2,485 | 212 |
| Residual | 2,490 | 5 /2,485 | 212 |
| DiagonalShape | 2,491 | 6 /2,485 | 212 |
| ReducedObstruction | 2,492 | 7 /2,485 | 212 |
| VerticalGain | 2,502 | 5 /2,497 | 212 |

Thus the abstract finite-convolution and sequence modules have small import boundaries without old 121 bodies. The universal raw source theorem and all larger branches import all **212 historically compiled-but-unreplayed worker 121 bodies**, including the 195-module subset. The19 historically accepted worker 121 modules retain their separate provenance. **No old 121 module is newly compiled, selected or recovered here; all 212 remain globally unrecovered.** A joint replay of nine new modules does not replay imported bodies.

WindowLC6d34 is newly present relative to the sealed121–150 import maps. The audit therefore binds its exact historical successful build and leanchecker receipts, their matching source snapshots, before 150/before 151 pins and preserved current object identity. Historical source SHA is `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb`; build receipt `run-MarkovWindowLC6d34-build-1792019206848298000.json` and replay receipt `run-MarkovWindowLC6d34-replay-1792019274510055000.json` both return0. Those old receipts lack an independent compiler-output object hash. This gives bounded historical evidence and present byte preservation, not fresh old-body validation or stronger old binary provenance.

Its object is outside the initial snapshot and is separately pinned by before 150/before 151/current observations. The old build prints permitted closures for only `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; that is not all-declaration print coverage for the imported module. The present object SHA is `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`.

The23 worker 134 recoveries remain worker 135 history. Failed HighCone2GapM81F remains distinct from its accepted MF25 replacement. The corrected worker 145 scalar and final worker 146 Global versions remain pinned; no superseded proof credit or historical timeout upgrade occurs. Reconciliation, preservation and importing do not repair the old 212 backlog.

The mathematical comparison set comprises 160 older sources:129 imported and 31 comparison-only. Exact named external source/object pairs are separately pinned, with the usual limits: external libraries are not included in the local module counts, and matching bytes do not establish source-to-object production or whole-library replay. No fresh whole-source rebuild or root-completion audit is established.

## Finalization and timing

The finalizer is an exact150 retag. Its forbidden-token scan remains `sorry|admit|native_decide`; removal of the `axiom` text token dates to149. Actual final selected sources have no new axiom declaration, and actual final print outputs pass the permitted closure set. The finalizer's success alone does not independently enforce per-theorem/allowed-stdout/checker/executable identity or an explicit axiom-JSON returncode predicate; the audit checks the actual records separately.

The finalizer requires matching successful source-build associations, records final object hashes, and binds an exact successful replay source map and axiom source map. It writes validation before preservation assertions; terminal mismatch lists are recorded without an emptiness assertion, but the observed lists are empty and independently checked. STOP=false is historical metadata, not a statement about a later controller state. There is no proof or experiment rerun by the finalizer or the auditors.

There are **6,383 initial entries**, comprising **6,381 unchanged inherited inputs** (including 175 Python cache files) plus own setup and checkpoint. Setup is unchanged; checkpoint changed and is separately recorded. Both own paths are absent from before 151. The initial count is not a claim that all entries predate the request or remained unchanged.

The index binds **97 artifacts**; controller/archive coverage has **99**, adding manifest and verifier. Composition is 39 JSON,35 Lean,12 objects, seven Python and six Markdown files. All bound final source/object/index/archive/current identities agree. Reconciliation binds the predecessor150 index of 73 and the saved controller changes of 136/137/150, preserving the earlier timeout/stopped/completed outcomes. Six fixed administrative paths are bound; no new inherited-decoded file exists, and this audit does not read the live inherited index.

The sole finalizer succeeds at events 201–202. Event 205's structured report, final.json and controller report agree; event 206 is turn.completed. There is no archived draft report or earlier finalizer manifest. Completion stays null. No independent process census, cause-of-stop inference or fresh completion check is made.

All following times are UTC on 16 October 2026:

| Observation | Time |
|---|---|
| Controller start | 17:09:52.231692 |
| Nominal1800-second deadline | 17:39:52.231692 |
| Final replay start / estimated finish | 17:30:27.069855 /17:30:45.203916 |
| Final Audit start / estimated finish | 17:30:27.073663 /17:30:45.730565 |
| Validation mtime | 17:31:25.232310 |
| Final verifier project mtime | 17:31:26.471358 |
| Event-log mtime | 17:32:07.026096 |
| final.json mtime | 17:32:09.030319 |
| Host finish | 17:32:47.007148 |

Final replay and Audit overlap: Audit starts 0.003808 seconds later and its estimated finish is 0.526649 seconds later. Both precede finalization. Verifier write precedes the deadline by 505.760334 seconds, final.json by 463.201373 seconds and host finish by 425.224544 seconds. Stored elapsed differs from finish-minus-start by approximately 0.953674 microseconds; exact floating-point equality is not claimed.

Events 194–195 complete final replay/Audit before commentary196 says they are still running. That sentence is stale commentary, not evidence of outstanding checks at finalization. The outer Audit command starts first in event order; its inner compiler-call timestamp is later than replay's. Those are different observed stages, not contradictory timestamps.

All 96 started items have completed counterparts within 206 events. The retained event log has 391,777 bytes, stderr is empty, and activity accounting matches391,777. Event-file mtime is not an individual event timestamp; receipt finish estimates combine filename epochs with recorded durations rather than independently timestamped exits. Archived verifier-copy mtime17:32:46.996211 differs from its project write. No indexed artifact is observed after the deadline or host finish.

Root SHA256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

Final manifest SHA256 is `50d7b88b5e74c0021ec0b145ca32b5502692ccccc7a3d86e05c6bfd89f86b666`; verifier `910c29ad6dea00aeadb133042de4bdceefa26a1ff308a5df6e2e47e485355a14`; delivered final.json `d5026321efa0053a5b60ea755084112ba23bdbadedc1a998edc84c32013c84f8`.

## Final audit observation and sealed supports

Validation rehashed **9,455 bounded inputs**, all unchanged, during **17:57:09.679067–17:57:53.606551 UTC**. The exact-request late-file observation at **17:57:53.626436 UTC** found no additional or missing archive/current files. The method review rehashed **162 bounded inputs**, all unchanged, during **17:56:50.992289–17:56:51.169520 UTC**. Project reads closed at these stated boundaries. Final crossreview and the integrity seal read audit files only and do not extend them. No separate late project bundle is required.

Companion crosschecks agree on **55 fields, 2,497 inherited pairs and 129 shared input hashes**. Audit-only rechecks cover **12 validation-bound and 33 method-bound temporary inputs**, unchanged. Both companion main-text reviews found no remaining necessary correction. Earlier audit seals and observation windows remain final.

The seven supports, all in this audit directory, are:

| File | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000151_mathematical_source_hashes.json | 87054 | `2113af5886d43aa2746087a178b02efeb7b66be962ddd169a9e06afd2919bc12` |
| markov_worker_000151_source_structure_audit.json | 27634 | `f6c24113fc084a5137d29fc3489179ec53577af2b96b6a4f3d5ff1b21131c1e7` |
| markov_worker_000151_finite_domain_audit.json | 35521 | `69cfb7beb6e997327f82f35a5e76905d68c342b3e0d6a91015c01e55c08a1508` |
| markov_worker_000151_validation_audit.md | 29572 | `c01bc0e776f57de200307b0d2c2e17b2cdfe2c3f743ffdf258f8c5901a4a0849` |
| markov_worker_000151_validation_evidence.json | 7073539 | `94d5ba21366eba7eb42c27b7bbd97d4bd7ca6babb7348420741e4f0f9684507c` |
| markov_worker_000151_replay_method.md | 29671 | `d06ca14d35762a85db52668e93b3e2277744d9c3387d16f7ede2dd3e4947294f` |
| markov_worker_000151_replay_method_evidence.json | 10503552 | `9b47a57c23790f51fe378c7bf925c1e9ecffa5e7887c28ae6a2a0aba95bb1073` |

The separately bound inherited-pair map is `markov_worker_000151_inherited_pair_expectations.json`, 2,198,991 bytes, SHA256 `1cf51167478220c6117f16f656576a44c7be3389b82eb3923d2211c8fd59ca0d`. It records the same inherited pair observation, not a fresh source rebuild.
