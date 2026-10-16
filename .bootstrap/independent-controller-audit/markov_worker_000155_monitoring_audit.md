# Completed worker 000155: independent static monitoring audit

Request `96ada19b024045ac97c60b3c8dfb10e6`. The controller records **completed, return code 0**, with a delivered structured report and `completion: null`. This audit covers the completed archive at `/Users/sasha/math_gkm/.control/markov/workers/000155/artifacts`, its completed controller records and explicitly named inherited/current counterparts. Active worker 156 is excluded. Earlier seals and their observation windows remain final.

**Finding:** the accepted sources prove sparse Fibonacci identities for both complete numerator-three source families, a guarded coefficient recurrence with uniqueness, a signed binomial inverse including all boundaries, and an exact finite double-sum formula for every raw coefficient, including zeros. The root is exactly equivalent to `DoubleSumThreeLCM96A ∧ OtherFourM9E2`; **both residual conjuncts remain unproved**. A separate rational lower-column expression has a proved LC inequality, but its universal identification with actual source coefficients remains unproved. Worker 155 establishes no new unconditional raw-source LC region and no full-root completion.

Negative auxiliary forcing is formally witnessed at an original polygon-valid point of the actual 3/5 source. The complete raw vertical triple there is `[1,2,1]`, with its polygon guards and LC inequality proved. This is an obstruction to an auxiliary positivity argument, not a source counterexample.

This is a static audit of saved source and completed records. No project program, compiler, checker, replay, finalizer, experiment, generator, GAP operation or mathematical-value computation was executed. Own Python performed only parsing, hashing, literal-token comparisons and counts of input indices or polygon guards. It did not evaluate polynomials, binomial coefficients, recurrence values, products, gaps or signs. No project/source/machinery changes, proposer contact or research assistance occurred. Audit files alone were written under `/private/tmp/math_gkm_godel_20261013`.

## Mathematical source scope

All nine final mathematical modules were read in full. The inventory is **37 theorems and 12 definitions, 49 explicit declarations**: FibAddition 3/0, ThreeSparse 3/1, ThreeForce 3/2, ThreeSolver 5/3, BinomialInverse 2/1, InverseBoundary 8/0, SparseConvolution 7/2, SparseSign 3/0 and LowerCandidate 3/3, where each pair is theorem/definition count. Every final module has a matching successful build, selected replay and printed theorem closure coverage. There is no final mathematical source left unbuilt or compiled-only. The Audit module and isolated replay driver are validation machinery.

No final selected mathematical source contains an admitted theorem, new axiom, `sorry`, `native_decide`, unsafe or partial declaration. Ordinary `decide` in the finite sign witness reduces the checked integer definitions. Rejected elaboration diagnostics do not change the final inventory.

### Actual numerator-three sources and sparse identities

The inherited exhaustive classification is unchanged: every actual path with numerator 3 is `false^n ++ [true,r]`, with q=n+1≥1. The true family is **3/(3q+1)** and the false family **3/(3q+2)**. Conversely, each q≥1 and Boolean constructs the required source path. There is no denominator ceiling, missing reduced residue class, ratio restriction, run bound or auxiliary shape premise. The q=0 algebraic extension is not promoted to an actual numerator-three source. All source adapters preserve the exact labels and raw coefficients.

Let `F_n = fib6 n`, `S=U+V+1` and `D=S²−4V`. The new generic commutative-ring addition and determinant identities retain their u factors; the tripling identities retain u². The determinant relation is `u*f_q²+(1−u−v)*f_q*g_q−g_q² = u*v^q` for the inherited pair sequence. These are polynomial identities with no order or positivity hypothesis.

The specialized sparse identity is `D * threePolyM9E2 q r = threeSparseM96A q r`. The two sparse expressions are exactly

- true: `S²*(F_(3q+3)−2F_(3q+2)+F_(3q+1)) + 4U*V^(q+1)*(S*F_q+F_(q+1))`;
- false: `S²*(F_(3q+4)−2F_(3q+3)+F_(3q+2)) + 4U*V^(q+1)*(V*F_q+S*F_(q+1))`.

The source proof cancels U² using its nonzero status as a polynomial in the integral domain `Polynomial (Polynomial ℤ)`. It does not assume U is positive at an evaluation, divide by an individual coefficient, or cancel a potentially zero raw entry. D has signed coefficients. It is neither assumed coefficientwise nonnegative nor divided through an inequality. The saved GAP identities are not premises of these Lean proofs.

### Guarded forcing and unique all-index recurrence

`threeForceM96A` is the exact coefficient array of the sparse expression. Its main term applies the inherited S-shift twice to `F_(n+2)−2F_(n+1)+F_n`, with n=3q+1 in the true branch and n=3q+2 in the false branch. Its correction is four times the guarded shift by `(1,q+1)` of `S*F_q+F_(q+1)` or `V*F_q+S*F_(q+1)`, respectively.

The inherited `fibRawM9E2` handles the i=0 axis separately and applies the positive-index binomial expression only under its degree guard. `shiftRawM9E2 a b f i j` checks a≤i and b≤j before natural subtraction. Consequently the source equality covers every natural q,i,j, including all zero columns, boundary rows and outside-support zeros. No empirical formula, sign or gap assumption is introduced.

The exact signed stencil is

`discriminantAction f = f + 2 shift(1,0)f − 2 shift(0,1)f + shift(2,0)f + 2 shift(1,1)f + shift(0,2)f`.

`solveDiscM96A` solves this for the unshifted value: forcing minus the positive shifted terms and plus twice the preceding vertical term. Every predecessor access has its own natural-bound guard. The well-founded recursion decreases i+j, and the zero-axis cases require no extra initial conditions. Strong induction proves uniqueness for **any integer forcing and array satisfying the complete action equation**. Applying that theorem identifies `sparseRawM96A` with the actual `threeRawM9E2` at all natural indices. The recurrence itself does not prove an LC sign.

### Signed binomial inverse, including all boundaries

The formal integer kernel is

`K(i,j) = (−1)^i * C(2i+2j+2, 2i+1)`.

This is the **doubled** impulse response. `choose_four_relationM96A` establishes the Pascal relation used in the interior at `(i+2,j+2)`. The boundary module separately proves the two axes, the adjacent row and column at index 1, the signed interchange identity and the four remaining small corners. These cases combine into `discriminantAction K = 2δ_(0,0)` for every natural i,j, and uniqueness identifies the corresponding recursive solution.

The formal statement does not assert that K is nonnegative, nor divide its values by 2 in the integers. The Python probe uses a different expression with integer `//2`; that finite check is kept separate and does not supply a universal divisibility theorem. Alternating signs in the u-index are retained throughout the formal convolution.

### Finite coefficient extraction and exact common scaling

The new inverse/convolution proof does not introduce a Lean infinite power-series object. `rectPolyM96A` is a finite square sum over 0..N in both indices, with an exact guarded coefficient theorem. The discriminant stencil only accesses the lower rectangle. On that rectangle, multiplication of the truncated K polynomial by D has coefficients `2δ_(0,0)`.

For an arbitrary bivariate integer polynomial P and target i,j, the proof chooses N=i+j. This covers every shifted index and every convolution argument needed at that target. `coeff_mul_impulseM96A` isolates the convolution term a=i,b=j; the other terms vanish by the exact impulse guard. Polynomial associativity then yields

`2 * coeff P i j = biConvM9E2 (coeff (D*P)) K i j`.

There is no q bound, source-degree restriction, hidden truncation error at the target, analytic convergence premise or positivity assumption. The finite double sum ranges over a=0..i and b=0..j; range membership controls i−a and j−b. Every zero term remains in the identity.

`three_double_sumM96A` specializes this to both complete cubic families: `2 * threeRawM9E2 q r i j = biConvM9E2 (threeForceM96A q r) inverseKernelM96A i j` at every natural q,i,j. The residual predicate names the right-hand array locally as z. The comparison reduction explicitly proves the integer equivalence `(2a)*(2c) ≤ (2b)^2 ↔ a*c ≤ b²`. The common positive factor cancels uniformly; there is no coefficient-dependent normalization, factorial change, unproved integer division or removal of zero coefficients.

### Exact root reductions and the still-open sign

`SparseThreeLCM96A` is an equivalent recurrence presentation of the numerator-three LC obligation. `DoubleSumThreeLCM96A` is the corresponding finite double-sum presentation. Each quantifies q≥1, both Boolean families and all natural i,j, with the literal comparisons

- H: `(i,j),(i+1,j),(i+2,j)`;
- V: `(i,j),(i,j+1),(i,j+2)`;
- D: `(i,j+2),(i+1,j+1),(i+2,j)`.

The accepted equivalences give `Conjecture63 ↔ SparseThreeLCM96A ∧ OtherFourM9E2` and `Conjecture63 ↔ DoubleSumThreeLCM96A ∧ OtherFourM9E2`. The source path classification works in both directions. **Neither new numerator-three sign predicate is proved, and `OtherFourM9E2` remains unproved.** The lower-column candidate below does not discharge either conjunct.

The inherited global-to-polygon equivalence retains actual outside-polygon zeros and the original guards `a*b ≤ b*i+a*j` and `i+j ≤ a+b−1`. The root's separate 0/1 polynomial 1 and 1/1 polynomial U+V, all generated source paths and all three original directions remain covered by the exact inherited reduction. Previously completed numerator-one/two cases are inherited; no new endpoint exception or discarded reverse-factor range is introduced.

Pinned root SHA256: `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Raw contract SHA256: `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical contract SHA256: `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. This audit does not claim a fresh full published homogeneous/Laurent correspondence audit or root-completion certificate.

### Lower fourth-column candidate: universal expression inequality only

The separate rational expression is

`lowerCandidate(q,x,c) = (x+1)(x+2)(x+3)(x+4) * lowerCore(q,x,c) / 2520`,

where `lowerCore = 7(3q+c)(2x²+10x+15) − x(18x²+100x+155)`.

Its LC theorem applies to **rational x,q,c with x≥0, q≥x+2 and c≥0**. The weighted core-gap identity substitutes d=q−x−2 and equals a 34-term polynomial having explicit positive coefficients. The LC proof clears the common denominator and multiplies this nonnegative gap by `(x+2)(x+3)²(x+4)²(x+5)`. It establishes the expression inequality from those hypotheses, with no separate positivity premise on `lowerCore`.

The proposed source interpretation uses column i=4, x=j, c=0 for the true family and c=1 for the false family, over a lower range j≤q. **No universal theorem identifies this expression with those raw coefficients.** The j=q endpoint receives finite checks only, and the retained lower-range derivation does not close it formally. There is no source support theorem, all-index zero extension, upper-region or crossing certificate for this candidate. Its general expression theorem cannot be counted as a new raw LC region. The interpolated entire fourth-column numerator is also only finite evidence.

The auditor compared the saved 34 coefficient/exponent tokens with `lowerGapM96A` and the retained generator's literal template with the final Lean bytes. This was static token matching, not generator execution, polynomial expansion or a new verification of the algebraic identity.

### Negative forcing and a passing actual raw triple

The final `MarkovSparseSignM96A` proves `threeForceM96A 1 false 0 7 = −2`. The corresponding actual source is `[true,false]`, hence 3/5. The point `(0,7)` satisfies the original polygon guards and has raw coefficient 1. The same accepted source proves the complete raw vertical triple at `(0,5),(0,6),(0,7)` is `[1,2,1]`, that all three points are polygon-valid, and that the raw LC comparison holds. Those literals were read from saved statements, not recomputed by the auditor.

Thus signed forcing and the signed inverse are features of the auxiliary exact representation. They do not imply negative raw coefficients, an LC failure of the actual source or a refutation of the root.

## Finite evidence: exact domains and limits

Only saved scripts, inputs, outputs and completed event records were read. Own calculations counted input indices; no coefficient, kernel, gap, sign, factorization or experiment was rerun. `sparse_probe_96ada19b.py` and its inherited 154 helpers have main guards. Importing those helpers does not rerun their scans. The column interpolation and certificate generator execute at top level if imported, but saved commands call them as standalone scripts. There is no runtime input-hash map or interpreter-start authentication; final archive/current/event consistency does not supply one.

- **Source recurrence scan:** q=1..24 and both residues give 48 actual source polynomials. With d=a+b−1, the coefficient square 0..d+2 in both axes gives **113,640** comparisons with directly generated source coefficients. Within that same square, H and V each contribute **109,416** triples and D contributes **105,384**, totaling **324,216**. The relevant increasing axis is at most d for H/V; both are at most d for D. There is no polygon or nonzero filter. The saved zero-containing counts are 63,492/63,492/59,172, totaling **186,156**; the failure list is empty. These output values were not recomputed.
- **Halved inverse probe:** i,j=0..59 gives **3,600** stencil checks of the Python halved kernel. Negative-index lookups return zero. A further q=1..4, both residues, i=0..9 and j=0..11 gives **960** convolution comparisons. These overlap the source domain and do not prove uniform evenness or replace the formal doubled-kernel theorem.
- **Lower-expression checks:** q=1..24, both residues and j=0..q−1 give **600** comparisons at column 4. A separate saved stdout at event 184 checks j=q for q=1..5, both residues: **10** equalities. The latter are not a separate JSON result file and do not establish the endpoint universally.
- **Boundary search:** q=1..14 and both residues request j=0..3q+2 but stop at the first mismatch per family. The 28 saved first-failure positions imply **270 executed prefix comparisons**, not the **714** positions in the unshortened requested ranges. Event 186 prints only the first ten failure records; `lower-boundary-probe.json` retains all 28. This finite boundary information neither proves a uniform source identity nor expands the candidate's proved hypotheses.
- **Entire-column interpolation:** training uses q=20..24, both residues: 10 arrays and **790 coefficient positions**. There are 104 candidate polynomial slots (two branches, four q-shift blocks and 13 offsets), with five interpolation points each: **520 interpolation constraints**. Forty nonzero forms are retained, 20 per branch. Validation uses q=1..100, both residues, j=0..3q+12, giving **32,900** positions. It compares the proposed numerator after multiplication by `(1−v)^8`; all shifted blocks are summed, including small-q overlaps. Training is included in this validation domain. This is an identity experiment, not an LC theorem or a count of new distinct source triples.
- **Lower certificate generation:** the saved JSON has 34 terms. Their literal positive coefficients and exponent tokens match the accepted source. The reported minimum coefficient is retained experimental output, not independently calculated. The generator itself was not run.

The event bindings are exact where complete output is available: event 118 matches the sparse JSON; event 195 matches the printed column summary without its unprinted family arrays; event 177 prints the certificate summary; event 184 contains the ten boundary literals; event 186 matches the first ten entries of the 28-entry boundary record. Overlapping source, kernel, lower-range and interpolation domains are not summed as a distinct union of coefficients.

The final GAP input uses a four-column basis and q=0..3 for each of two families, Gaussian elimination of a 4×4 system and 16 numerator/denominator factor-print lines. Only its final source version is retained. The first GAP command, completed at event 52, has outer exit code 0 **despite an `InverseMutable` semantic error** and an ANSI-only 19-byte redirected log. It is not a successful symbolic derivation. Event 62 is the later Gaussian version with warnings and uncancelled rational expressions; event 72 is the final factored version with warnings and saved factors. The cat at event 69 reads an in-progress prefix between launch 67 and completion 72; the later tail at event 74 is the completed output. These saved symbolic computations are exploratory and are not external proof premises.

The SymPy import at event 46 fails with `ModuleNotFoundError`; unavailable Sage and the initial shell-heredoc capability failure remain operational observations. The auditor read the six saved prose documents without following literature references or conducting new research.

## Saved compilation, replay and axiom coverage

The archive/controller contain **89 artifacts**, with **87 indexed**; the manifest and final verifier are the two nonindexed closure records. Extensions are 29 Lean sources/snapshots, ten `.olean` files, 33 JSON files, seven Python files, six Markdown files, three logs and one GAP input. Eleven final Lean files comprise nine mathematical modules, one Audit module and one replay driver; the separate 18 compiler snapshots are evidence of attempts.

There are **18 source-bound compiler attempts: 11 successes and seven return-code-1 failures; no wrapper timeout**. Successes consist of the nine final mathematical modules, one Audit module and one superseded successful BinomialInverse version. All final source/snapshot, validation, replay, axiom and object hashes agree. No final new mathematical module is pending or compiled-only.

The mathematical build bounds are 120 seconds except ThreeSparse at 180; the Audit also uses 180. Final successful receipt suffixes under `evidence/markov-96ada19b/build-` are FibAddition `1792177516134119000`, ThreeSparse `1792177587742190000`, ThreeForce `1792177945464336000`, ThreeSolver `1792178126946899000`, BinomialInverse `1792178340388253000`, InverseBoundary `1792178407935627000`, SparseConvolution `1792178481343798000`, SparseSign `1792178242215144000` and LowerCandidate `1792178524483856000`.

The seven rejected snapshots are ThreeForce `1792177875927232000`, ThreeSolver `1792178021365432000`, BinomialInverse `1792178022832470000` and `1792178128129387000`, SparseSign `1792178167790333000`, InverseBoundary `1792178341578569000`, and SparseConvolution `1792178441417568000`. Their failure diagnostics, source hashes and changed proof blocks are retained in the validation/method supports. No success is inferred from a declaration name appearing in a rejected file or from partial elaboration before an error.

### Superseded success and the rejected dependency overlap

BinomialInverse also has a successful earlier build `1792178224392496000`, source SHA `6ea98976e24f9e04bb7fde74731761ef0b5c30fdaa541fc3fe9d3707fac67565`. The final source SHA is `ca0f4a9f159f315978d6f322596e6d8c7c5ff4b7f3b1cbe188e738c9cab5d80e`. Their imports, two theorem headers and one definition agree. Only the proof of `inverse_kernel_interiorM96A` changes; `choose_four_relationM96A` and the kernel definition are unchanged. The earlier source is not the replay-selected final source, and no separate earlier produced-object hash is retained.

The operational prose says a proof was shortened while its earlier foreground build was still running. **The retained event order does not support that timing claim:** old success completes at event 151, the source edit is events 152–153, and final rebuild launches at 154. The old receipt's duration-derived finish is 19:18:37.223185 UTC, before the final rebuild begins at 19:19:00.388253. No own-source edit/build overlap is established from that prose.

There is a distinct dependency overlap: rejected InverseBoundary launches at 19:19:01.578569, 1.190316 seconds after the final inverse rebuild starts. Its duration-derived finish precedes that rebuild's finish by 0.553390 seconds. An older successful dependency object existed at launch, but the exact object read by this rejected invocation is unauthenticated. The **accepted InverseBoundary retry follows completion of the final inverse rebuild**, as do the accepted downstream builds and final joint replay/Audit. The overlap is preserved as a rejected-attempt limitation and does not promote or substitute the older proof version.

### Final selected replay and printed closures

The one successful joint replay is `replay-1792178564577327000.json`, with a 150-second bound. It selects all nine final modules and all **49 explicit declarations**. The one Audit build is `1792178570174717000`, generated module `MarkovAudit1792178570174501000M96A`, followed by axiom record `1792178654382997000`. All **37 theorem closures** are printed once and match the final theorem inventory: 28 use `{propext, Classical.choice, Quot.sound}`, four use `{propext, Quot.sound}`, four use `{propext}` and one uses no axioms. The 12 definitions are replay-guarded explicit declarations, not extra printed theorem closures.

The replay driver is `research/ReplayIsolatedM96A.lean`, SHA `65de62848efa7f061148236d72defd50fc22a22c291b28b244df9e531ce052d7`. It and the validation/audit/finalizer wrappers are exact predecessor retags after correcting the copied full request ID. The inherited Lean 4.32.2 command and stack option `-s 131072` are unchanged. Ordinary environment replay is used and the joined task result is propagated; there is no new bypass.

Every selected explicit declaration lies in `MathGKM.Markov` and ends in `M96A`. The driver rejects an imported environment already containing those explicit selected names. Generated/private/inherited constants outside this predicate retain ordinary Lean replay handling. This is isolation of the selected new declarations, not a replay of all compiled imported bodies.

The compiler wrapper snapshots the source before launching on the live named source path; the replay wrapper records the driver hash after subprocess completion; Audit source maps are recorded after building. Final snapshots, event intervals, receipt maps and objects agree for accepted versions. This provides retained source/object association, not invocation-start authentication of every read, executable provenance, decoding of every object part or a fresh whole-source rebuild.

The finalizer retains its known weaker checks: a separate module list, matching successful source build, exact whole-map successful replay and axiom JSON source map, followed by final object hashes. It does not independently authenticate the expected driver hash, reparse permitted axiom closures from compiler stdout or enforce the full theorem inventory. Its text filter still omits `axiom`, inherited from worker 149; the independent source/closure inventory here found no added axiom. Validation JSON is written before preservation assertions, and terminal mismatch/stop fields are recorded rather than all asserted. The actual mismatch lists are empty and stop-presence is false. The individual checks and bindings, not the finalizer summary alone, support this audit.

## Inherited imports and historical limits

The accepted local closure contains **2,512 modules: nine new and 2,503 inherited**; including the Audit gives 2,513 nodes. The joint replay's imported base contains no selected new module. Its direct inherited union is `MarkovThreeArithmeticM9E2`, `MarkovThreeTransferM9E2` and implicit `Init`: two explicitly named imports, three total. The 2,503 inherited source/object pairs were independently compared with sealed origins and before-155 pins, with no mismatch in the observation window **2026-10-16 19:31:49.960377–19:32:32.696281 UTC**.

The base consists of the 2,499 inherited pairs already bound in sealed 154 plus four accepted 154 modules: `MarkovThreeSourceM9E2`, `MarkovThreeRawM9E2`, `MarkovThreeArithmeticM9E2` and `MarkovThreeTransferM9E2`. FibAddition and ThreeSparse each import 2,501 older modules; all other new endpoints import 2,503. Endpoint local/current/inherited counts are retained in method evidence; the additional pair-map records each inherited source/object expectation. This is identity preservation, not new validation of the inherited proofs.

**Every new endpoint imports all 212 worker-121 compiled-but-unreplayed modules**, including the distinguished 195-module subset; the 19 historically accepted worker-121 modules remain separate. **Zero of the old 212 are replay-recovered by worker 155.** Selected new bodies can depend on those compiled imports. Reconciliation and new joint replay do not revalidate the imported bodies.

All ten accepted 153 modules and its three unvalidated Pell sources are absent from the current local import graph and replay selection. The new reconciliation verifies the latest completed 154 manifest's 93 entries and separately preserves worker 153's 253-event log hash, its last two events and the prior reconciliation statement. It does not contain a fresh receipt projection or effects replay for 153. Worker 153 remains a historical timeout with null report; successful predeadline finalization did not change that. Its pending MidpointObstruction, UniformObstruction and Sharp declarations receive no new credit.

The mathematical source support also compares **213 explicitly named older sources**, including all nine accepted 154 sources: **148 are current imports and 65 are comparison-only**. Comparison-only files are not silently treated as imports or reread/replayed proof bodies. The corrected worker-145 Scalar, final worker-146 Global and final worker-151 DiagonalShape dependencies remain the preserved versions. Old worker-134 recoveries retain their worker-135 provenance; its late failed Audit receipt and timeout remain separate. Prior observation windows are not extended retroactively.

`MarkovWindowLC6d34` remains an inherited dependency, not a member of the old 212. Source SHA is `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb`; object SHA is `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its previously named build/replay snapshots match, but the old build receipt does not separately record the produced object hash. Explicit historical prints cover `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`, not every imported declaration. No new compiler-production authentication or inherited-body replay is supplied here.

Nine explicitly named external source/object pairs carried from sealed 154 retain their identities, with qualified paths avoiding basename ambiguity. These bindings do not reconstruct or rebuild the complete Mathlib environment. No new external theorem lookup or research was performed.

The supervisor separately reported content-preserving COW maintenance of 1,837 small retained object copies from closed workers ≤153, about 0.819 GiB, at approximately 19:18 UTC. SHA256, mode, owner and mtime were verified unchanged; independent inodes were used, with no hardlinks, empty-cache repair or live replacement. Workers 154/155 were untouched. Plan/execution/summary hashes are `fb9c88d3fbce4160d4c5d8026487408114c2d393ad69b0e95380d06063adcc22`, `3a5aa415229600cd41d12753b84f424aa6009c0f1f70f12e9d91a80374a3d6fc` and `2ac44d3a205c4bfd2797a1f38ee5cb264c5776f5c4f72dea7c701a3e969ef673`, preserved in local Git `5f7ccddd`. This attributed storage history and the earlier separately sealed COW operations change no proof status or observation window. The auditor performed no storage maintenance.

## Preservation, deadline and report chronology

The initial snapshot contains **6,503 entries**, including 184 prior `.pyc` files. The inherited preservation count is **6,502** after separately accounting for the already-created own `research/setup_96ada19b.py`, also observed unchanged. The initial pins, controller changes, archive bytes, final 87-entry index, source/build/replay maps, produced objects and named prior identities agree. The 95-artifact predecessor 154 archive is checked for preservation without repeating its research.

The copied finalizer initially retained malformed full request literal `96ada19b685d4a9cbba612509f4cc95e`. Events 187–188 correct it to the exact request **before both saved finalizer invocations**. The final wrapper is an exact full retag of 154. Its earlier malformed bytes are not separately snapshotted, so no old source hash or malformed-ID finalization is invented.

Two finalizer calls succeed: events 203–204 record 86 indexed artifacts; events 213–214 record 87. The checkpoint was created earlier at events 70–71, not between these passes. Mathematics prose is edited at 209–210 and the authored draft report is added at 211–212. The first manifest's complete bytes are not separately retained; its count is bound by the first saved output. Final artifacts and both finalizer outputs retain nine modules, 37 closures, seven unsuccessful builds and null completion.

The separately indexed draft differs from the delivered report in actions, agenda, observations and summary. The delivered report in event 217, controller `final.json` and receipt agree with one another. Event 218 is `turn.completed`. Both reports distinguish exact representations, the unproved source identification and the open full root.

Controller times in UTC are:

- start: **2026-10-16 18:59:12.074012**;
- nominal 1,800-second deadline: **19:29:12.074012**;
- host finish: **19:27:45.510086**, retained elapsed **1,713.4360752105713 seconds**, **86.563926 seconds before deadline**.

The retained elapsed differs from finish minus start by approximately 1.192 microseconds; this bookkeeping precision does not affect the cutoff. The final replay's duration-derived finish is **308.725439 seconds before deadline**. The Audit starts 5.597390 seconds after replay launch and finishes 11.026155 seconds after replay finish, still **297.699283 seconds before deadline**. These estimates use saved start/duration fields, not an independent process trace.

Current retained mtimes place validation at 19:26:28.562230, final-check at 19:26:28.876998, manifest at 19:26:28.994400 and final verifier at **19:26:29.204778**, **162.869234 seconds before deadline**. The final event-log write, heartbeat and `final.json` are respectively 136.079425, 135.878299 and 135.198629 seconds before deadline. Host finish is 76.305308 seconds after the verifier write. The archived verifier copy's mtime at 19:27:45.502320 is archival bookkeeping, not a new check. No retained build/replay completion or required finalization falls after deadline or host finish.

The complete event stream contains **218 events**, with all **102 started items** matched by completions. Its 451,608 bytes plus 119 bytes of stderr exactly account for the recorded 451,727-byte activity size. This is saved stream/accounting evidence, not an independent process census. It supports the completed administrative outcome while leaving the mathematical residuals and inherited validation qualifications intact.


## Final audit observation

The final validation pass found all **9,440 explicitly enumerated inputs unchanged** during **2026-10-16 19:43:27.772969–19:44:28.150984 UTC**. The independent method pass found all **152 named inputs unchanged** during **19:43:02.443297–19:43:02.734997 UTC**. The exact completed-request late-file observation at **19:44:28.183038 UTC** found no extra or missing current/archive files and **no additional late preservation bundle**. These observation windows are closed. Subsequent footer, crossreview and seal work reads audit files only and does not extend project observations or earlier seals.

The validation and method crosschecks agree on **75 shared fields, 2,503 inherited source/object pairs and 112 shared input hashes**. The mathematical/finite supports agree on nine final modules, 37 theorem closures, 12 definitions, 213 named older comparisons (148 imports and 65 comparison-only), nine qualified external pairs and the finite input domains. Eleven validation and 40 method audit-directory inputs remained unchanged. Both reviewers found no remaining substantive correction after the main's exact convolution expression, direct-import count and weighted-gap wording were refined. These were audit-prose corrections before sealing; no project source, accepted inventory or historical seal changed.

The seven supports and additional inherited-pair map are bound below. The integrity file independently binds the final main and these files, without embedding a self-referential integrity hash here.

| Audit file | Bytes | SHA256 |
| --- | ---: | --- |
| `markov_worker_000155_mathematical_source_hashes.json` | 119,983 | `a8e969665ad169b790276610184c6ca3163c732b6d15131e9484c2445ba203f1` |
| `markov_worker_000155_source_structure_audit.json` | 24,769 | `5a8e36da2415ad4b5aa5e5fd3c1e549b47fbeeed9651064efc12fa8ac48dce1d` |
| `markov_worker_000155_finite_domain_audit.json` | 35,692 | `5853af1ba747cf51ef93c7c27d7a2229a712c836eec2421862854c1efb1bfaee` |
| `markov_worker_000155_validation_audit.md` | 29,337 | `934f7807005200fed8ac1b10fb97c6904a53af8a170b94f4bab7362ecc86c077` |
| `markov_worker_000155_validation_evidence.json` | 7,423,575 | `3bf8db9fcfc056a44e44ff9a8e71cf581a26eab6e04c8a36c7fd5fcc6f0e33b1` |
| `markov_worker_000155_replay_method.md` | 27,729 | `ef93a04079514331dd183b727147a8faf242e220fd06ba23897c29bed1e9e003` |
| `markov_worker_000155_replay_method_evidence.json` | 11,619,324 | `0846eb5379b030019f58a0416a15fed0462491c0cc2cf47f7a554ff7e714f738` |
| `markov_worker_000155_inherited_pair_expectations.json` | 2,204,035 | `99e4410370a9d1ccfee456b3599401e47e9b156ab2d57680a7778cc121762140` |

The audit-owned helpers `static_audit_worker155.py` and `seal_worker155_audit.py` are retained and separately bound by the integrity seal. Neither executes project code or mathematical values. No missing proof/check/replay was run to improve the historical record. Exact signed representation theorems are accepted within the stated inherited-import limits; the numerator-three and numerator-at-least-four LC residuals, candidate source identification and full Conjecture63 remain open.
