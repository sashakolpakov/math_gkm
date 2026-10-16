# Independent static monitoring audit — worker 000158

Request `ffd747f5c7a147069d5bfcaffb3e60e8`. Closed archive: `/Users/sasha/math_gkm/.control/markov/workers/000158`. This audit concerns that completed worker and explicitly named inherited counterparts only. Active worker159 is outside scope.

## Finding and limits

The retained final sources and successful recorded checks support a new unconditional result: **for every actual numerator-three source and every natural starting column `i`, the raw horizontal triple `(i,5), (i+1,5), (i+2,5)` is log-concave, including all zero coefficients**. The source theorem has no polygon, positive-coefficient, finite-denominator, residual-shape or additional formula premise. The two numerator-three families cover every such generated source: `q≥1`, `r=true` gives denominator `3q+1`, and `r=false` gives denominator `3q+2`.

The worker also establishes the universal **representation** of each actual lower row `0≤j≤q` as the coefficients of

`u^3 (1+u)^(n−2j−1) H_j(n,u)`,

where `n=3q+1` or `3q+2`. The signed integer residual polynomial satisfies `natDegree H_j≤j` for every natural `n,j`. This establishes the source connection and zero-tail bound; it does not establish residual positivity or log-concavity for every row. The general `LowerRowShapeMFFD` condition, the proposed generating-function/coefficient bridge, and all unremoved root obligations remain open.

The exact final reduction is

`Conjecture63 ↔ ThreeRemainingMFFD ∧ OtherFourM9E2`.

**Both residual predicates remain unproved.** The full conjecture and its negation are unresolved. The previously audited all-three-direction result for every actual numerator-two source remains a broader completed milestone within its numerator class. This worker extends numerator-three horizontal coverage at the specific row `j=5`.

Eleven selected mathematical modules contain 43 theorem declarations and 14 definitions. Their final source versions have successful compilation receipts, one successful union-replay receipt and 43 explicit theorem axiom closures. A separate generated candidate contains 16 theorem declarations and is unused and uncompiled; it receives no proof credit. Inherited compiled dependencies are trusted at their recorded historical level. No fresh whole-source rebuild, independent replay of every inherited proof body, or completion audit occurred. The old 212-module worker121 replay backlog remains unrecovered.

All auditor operations were static text parsing, file hashing, literal/inventory comparison and counts of input indices. No project program, Lean process, checker, proof, replay, experiment, generator or finalizer was executed; no coefficient, binomial, polynomial, gap, discriminant or sign was recomputed. No project files were changed, no proposer was contacted, and no research direction or proof assistance was supplied. Earlier seals and observation windows remain final.

## Exact source correspondence and mathematical scope

The inherited `source_three_pathM9E2` classifies every generated path with `a=3` as `threePathM9E2 (q−1) r`, with `q≥1`. Its labels and polynomial theorems identify the denominator and raw bivariate polynomial. `source_three_rawM9E2` then identifies every natural coefficient with `threeRawM9E2 q r i j`. These are actual source identities, not arbitrary-word or formal-parameter surrogates. The classification includes the smallest sources `3/4` and `3/5`; denominators divisible by three are not admitted as numerator-three sources.

The new row variable `u` denotes the original horizontal coefficient variable. `rowCoeffsMFFD f i j` is `(f j).coeff i`. The operator bridge proves that multiplication by `u^a` and a shift of row by `b` agrees exactly with the inherited guarded bivariate `shiftRawM9E2 a b`. Its `b≤j` and `a≤i` guards preserve boundary zeros; natural subtraction is never silently treated as integer subtraction. `rowSMFFD` corresponds to multiplication by the original `S`, and `rowDiscMFFD` corresponds to the inherited discriminant action, including the negative row-shift term. The zero, one and successor-row equations are separate theorems.

`rowJMFFD n j` is the finite integer polynomial

`Σ s=0..j C(j+3,j−s) C(n−j−1,s) u^s (1+u)^(j−s)`.

`weighted_binomial_coeffMFFD` is unconditional in natural `N,c,j,t`. It extracts the coefficient of a weighted sum and identifies it with `C(N,t) C(t+c,j)`. The saved proof uses the binomial convolution identity and `Nat.choose_mul` under its explicit `s≤t` premise; the complementary `s>t` branch uses coefficient and binomial zeros. No unsupported `s≤N` assumption is imposed; natural-zero binomials remain in the formula. `rowJ_factor_coeffMFFD` imposes `2j+1≤n` before rearranging the exponents. `delta_row_coeffMFFD` handles columns `0,1,2` separately, then shifts by three and identifies the inherited forcing coefficient. The natural binomial and cast identities were inspected as saved text, not executed.

The residual recurrence is defined over `Polynomial ℤ`:

- `H_0=J_0`.
- `H_1=J_1+2(1+u)J_0+2(1−u)H_0`.
- `H_(j+2)=J_(j+2)+2(1+u)J_(j+1)+(1+u)^2J_j +2(1−u)H_(j+1)−(1+u)^2H_j`.

The subtraction is real mathematical content; the definition is not a positive expansion. `lower_row_equationMFFD` verifies this polynomial family solves the required row equation when `2j+1≤n`. `lower_row_raw_equationMFFD` extends that equality throughout `j≤q` under `2q+1≤n`. The inherited triangular uniqueness theorem `disc_lower_uniqueME9C` then identifies it with `lowerRawME9C`, without a shape or positivity premise. The inherited exact lower-region bridge yields

`threeRawM9E2 q r i j = [u^i] u^3(1+u)^(sourceNME9C q r−2j−1) H_j(sourceNME9C q r,u)`

for every natural `q,i,j`, both booleans, and `j≤q`. The generic arithmetic statement even permits `q=0`; the actual-path wrapper obtains `q≥1` from source classification. The path wrapper is existential in the source parameters and universal in all natural coefficient indices. There is no upper bound on `i` or omitted zero tail.

`rowJ_degreeMFFD`, `rowH_degreeMFFD` and `rowH_tailMFFD` prove `natDegree≤j` and coefficient zero for `k>j` for all natural `n,j`, including those outside the source domain. This is a degree upper bound, not a positivity or exact-support theorem. `rowJ_mapMFFD` and `rowH_mapMFFD` identify the rational versions only under `j+1≤n`, which makes the natural-subtraction casts legitimate. The stronger factorization range implies this cast range where it is used.

## Complete fifth-row proof, smoothing and small parameters

`fifth_residual_rationalMFFD` identifies `rowHQMFFD (11+d) 5` with the displayed six-term polynomial for every rational `d`. The final saved proof uses polynomial evaluation extensionality, explicit finite binomial evaluation and ring algebra. It is a universal identity; the experimental interpolation is not its proof. Mapping to real coefficients gives `fifth_residual_mapMFFD` for every natural `n≥11`, with real parameter `d=n−11`.

The six coefficients in `fifthCoeffMFFD` are exactly those printed in the worker's mathematics note, from constant coefficient `560` through the degree-five rational polynomial. They were compared as saved source text; no values were evaluated or independently multiplied. The generic identity permits negative rational `d`; **the positivity and CrossLC theorem requires real `d≥0`**. `fifth_positiveMFFD` covers indices `0..5`, `fifth_zeroMFFD` covers every larger natural index, and `CoeffSeq` additionally extends by zero at negative integer indices. Four adjacent inequalities cover the interior triples. The proof separately handles triples at and beyond the ends and verifies positive interval support before applying `crossLC_of_adjacent_interval774`. It does not infer CrossLC from adjacent inequalities without a support condition.

The inherited definition is `CrossLC f := ∀ i j, i≤j → f i*f(j+1)≤f(i+1)*f j`, on integer indices. `lower_row_crossMFFD` uses its proved Pascal-smoothing closure for multiplication by `(1+u)^(n−2j−1)`, then its shift closure for `u^3`. No coefficient is divided out, normalized, dropped, or assumed positive. The real coefficient casts are converted back to the original integer inequality in `source_horizontal_of_row_crossMFFD`; the extracted indices are exactly `i`, `i+1`, `i+2` at the fixed row.

For actual row `j=5`, **the source bridge requires `q≥5`**. The generic residual condition `n≥11` is insufficient by itself to identify an actual source's row5 as a lower row. `three_horizontal_fifthMFFD` uses an explicit split at `5≤q`, so no such extrapolation occurs.

The remaining eight source families, `q=1,2,3,4` and both booleans, use `fifth_small_boundedMFFD`: all natural starts `i≤11` are discharged by `interval_cases`, boolean cases and ordinary `decide`. There are 96 bounded source/start instances. This is recorded Lean kernel reduction, not `native_decide` or an imported experimental truth table. For `i>11`, `fifth_small_allMFFD` uses the inherited actual-source total-degree zero theorem on the first endpoint; the product becomes zero and the right-hand side is a square. No assumption about a positive middle coefficient or support interior is required. The smallest `q=1` sources and rows beyond the lower region are covered by this branch.

`source_three_horizontal_fifthMFFD` combines the exhaustive actual-source classification with these two branches. Its complete result is

`∀ path, (frame path).mid.a=3 → ∀ i:ℕ, coeff P i 5 * coeff P (i+2) 5 ≤ coeff P (i+1) 5 ^ 2`.

The only source premise is the actual numerator equality. It is stronger than a polygon-only claim at this row. The worker does not prove strict LC at every start: zero tails remain and the conclusion is non-strict.

The alternative `unused-small-rows-candidate.lean` was generated while the successful small-case compilation was pending. It proposes eight full source-polynomial identities and eight corresponding row identities. It was moved from `research/MarkovFifthSmallRowsMFFD.lean` into the evidence directory, is absent from the selected module list, and has no build/replay/axiom-print acceptance. Its 106 reported generator list elements expand to 202 physical lines because elements contain embedded newlines. Its sixteen theorem declarations are not additional checked results.

## Exact residual and genuine but limited gain

`ThreeRemainingMFFD` quantifies over every natural `q≥1`, both source residues and all natural starts. It retains:

- Horizontal LC at every row `j≠5`.
- Vertical LC unless `(i=3 ∨ i=4) ∧ j+1≤q`, the region already discharged by worker157.
- Every diagonal inequality `P(i,j+2)P(i+2,j)≤P(i+1,j+1)^2`.

`OtherFourM9E2` retains the global three-direction obligations for every generated path whose numerator is at least four. `three_remaining_iffMFFD` removes exactly the row5 horizontal clause from `ThreeRemainingM1BB`; its converse fills that clause with the new unconditional theorem. `root_iff_remainingMFFD` composes this with the inherited exact root reduction. It introduces no residual-shape, generating-function, or finite experimental premise.

The inherited bridge connects these all-natural-index predicates to the original `Conjecture63` with the raw bivariate integer coefficients, original polygon conditions `ab≤bi+aj` and `i+j≤a+b−1`, original zero coefficients, all three literal directions and endpoint cases. The new source result uses the same coefficients and introduces no scalar renormalization. Numerators one and two and the endpoint cases remain covered through the inherited reduction. The new audit does not reconstruct the complete prior source-to-paper or homogeneity development; their exact named artifacts and established scope remain inherited.

`fifth_gain_polygonMFFD` proves all three points `(3,5),(4,5),(5,5)` lie in the original polygon for both residue families at every `q≥5`. Together with the existing actual-path construction, this is unbounded genuine coverage of obligations that remained in the immediately preceding horizontal residual. It does not claim that each such triple fails every older sufficient criterion. The worker's note correctly says rows `0..4` were already covered and are not new fifth-row progress.

`LowerRowShapeMFFD` is the proposition that `CoeffSeq H_j(n)` has CrossLC for all natural `n,j` with `2j+1≤n`. It is **defined, not proved**. The conditional source theorem would cover actual lower horizontal rows `j≤q` if this premise were proved. Even then it would not resolve rows `j>q`, the remaining vertical or diagonal clauses, or larger numerators. General residual nonnegativity/interval support is not established by the signed recurrence or the degree bound.

The rational-resolvent note and its Euler-substituted six-monomial alternating coefficient formula are proposed mathematical derivations only. They are not new formal power-series theorems, not hidden premises of the proved factorization or row5 result, and not replacements for the residual. The saved negative examples belong to parameters outside the intended `2j+1≤n` shape range. They do not refute the actual lower-source row identity, the raw row5 theorem, or the full conjecture.

## Finite experiment domains — counts only

The source experiment uses the inherited canonical `frame` helper on the two paths for each `q=1..20`. Its input loops give 40 actual sources, 460 lower rows `j=0..q`, and 21,930 coefficient comparisons at `i=0..n+5`. It separately checks 1,560 raw row5 adjacent triples over those starting indices. There is no polygon or nonzero filter. The retained record reports 5,840 zero coefficients, 507 zero-containing triples and no failures; those outcomes were read, not recalculated. Its eight small-source arrays contain 96 literal entries. The row5 coefficient domain overlaps the lower-row domain for 32 source families, amounting to 1,440 positions; these counts are not independent evidence to add together.

The residual-shape experiment uses `n=1..100` and `j=0..min(floor((n−1)/2),25)`, totaling 1,950 rows. The signed `Hrows` helper has structural array length at most `j+1` before trimming, giving 19,600 potential adjacent positions; that upper bound equals the saved runtime counter. The auditor did not recompute trimming, coefficient signs or adjacency outcomes. Only 1,090 of those rows are in the actual numerator-three lower-source range; the experiment also includes non-source denominators and rows beyond `j≤q`. The six coefficient interpolation arrays and four gap arrays supplied candidates. The final Lean identity and positivity proofs, rather than the finite interpolation, establish the universal fifth-residual theorem.

The proposed resolvent experiment uses `n=1..90`, `j=0..min(n−1,25)` and `k=0..j+3`: 2,015 rows and 31,785 coefficient positions. There are three positions beyond the formal degree bound per row, totaling 6,045. Of the positions, 24,960 belong to the intended shape range and 12,082 to actual numerator-three lower rows. These are overlapping domains, not distinct proof cases. The saved first five negative examples all violate `2j+1≤n`; this audit checked those index guards only. The displayed example `n=15,j=14,k=1` with value `−22304` remains a saved experimental value, not an independently recomputed or formally certified value here.

The retained result JSONs match the completed command outputs at events91,137,188 field for field, including their status and duration fields. The candidate generation is event195 and its move to the evidence directory is event209. All three experiments used Python `-B`. Their named imported numerical helpers have main-guarded experiment bodies; the inherited `probe154` helper still constructs small constant dictionaries on import, so this is not a claim that imports have no effects. The additionally compared `low_probe156` helper is not a transitive import of these three scripts. The standalone small-row generator has top-level operations but was not imported by them. Final source and result hashes do not establish invocation-start transitive helper hashes or interpreter authenticity. None was executed by this audit.

Four earlier exploratory command outputs are also retained, separately from the three reported counters: event41 prints residual rows at `n=3j+1`, `j=1..8`; event48 prints a signed basis transform on those rows; event66 prints rows at `n=2j+1`, `j=1..7`; event80 prints finite-difference arrays for `j=5`, `k=0..5`, with input `N=0..k`. These command bodies and saved outputs were read only. Their transformed negative entries are auxiliary data, not negative source coefficients, and none supplies a new universal theorem or an additional disjoint comparison total.

## Source and receipt bindings

The mathematical hash supplement binds each of the eleven final source files to its current named counterpart, controller change hash, manifest entry, successful immutable build snapshot, validation source map, replay source map and axiom source map. It also binds each retained compiled object to its archived/current bytes, controller hash and manifest entry. The source-structure supplement records all 57 explicit names and every theorem statement. No `sorry`, `admit`, new `axiom`, `native_decide`, `unsafe` or `partial` token occurs in the selected mathematical source bodies after comment removal. Operational replay machinery is treated separately.

The same supplement rehashes 242 explicit older mathematical source paths against worker158's initial snapshot and sealed157 pins, seven inherited numerical helper paths, and nine named external source/object pairs. These checks establish current identity and inherited provenance, not a fresh source-to-object build or an independent replay of imported theorem bodies. The old WindowLC receipt/print limitations, corrected historical dependency versions and the worker121 backlog remain separate from current success.

The accepted mathematical inventory is:

| Module | Theorems | Definitions | Final build receipt suffix |
| --- | ---: | ---: | --- |
| MarkovRowBinomialMFFD | 3 | 1 | 1792182767572323000 |
| MarkovRowOperatorsMFFD | 11 | 4 | 1792182830794145000 |
| MarkovRowRecurrenceMFFD | 5 | 3 | 1792182920844031000 |
| MarkovRowRationalMFFD | 2 | 2 | 1792183206336315000 |
| MarkovFifthShapeMFFD | 6 | 2 | 1792183166881983000 |
| MarkovFifthIdentityMFFD | 2 | 0 | 1792183402157729000 |
| MarkovRowTransferMFFD | 3 | 1 | 1792183428028193000 |
| MarkovFifthSmallMFFD | 2 | 0 | 1792183485100034000 |
| MarkovFifthSourceMFFD | 3 | 0 | 1792183612919655000 |
| MarkovResidualMFFD | 3 | 1 | 1792183644491775000 |
| MarkovRowDegreeMFFD | 3 | 0 | 1792183690752471000 |

The archive retains 22 compiler attempts: twelve successes (the eleven mathematical modules and one Audit), eight return-code-one failures, and two 100-second timeouts. The ten unsuccessful snapshots have the same explicit declaration names and normalized theorem headers as their respective final sources. Failed proof developments include the weighted-binomial linear-combination sign and bound conversion, the lower-row definitional equality, rational-map casts, fifth-shape index/coefficient simplification, fifth-identity simplification recursion and degree bounds. Those failed snapshots are retained separately and are not credited as checked versions. There is no superseded successful mathematical version. The two timeout snapshots are byte-identical to their eventual successful sources; they remain failed attempts, followed by separate success receipts. The bounded small-row source took about 128 seconds in its successful build. No source-edit completion was observed within a retained build interval.

## Reconciliation and preservation

The new manifest has 100 entries and the controller archive retains 102 artifacts. The two archive-only files are the manifest itself and `last-verification.json`; there are no manifest-only entries and no new opaque-cache retention gap. The unused candidate is explicitly manifested and archived. The worker's initial preservation snapshot contains 6,599 entries. Its finalizer excludes its own newly created setup script and evolving checkpoint note, leaving 6,597 inherited inputs; these two are not old files silently omitted after mutation. The excluded setup bytes remain unchanged, while the checkpoint is correctly treated as this worker's own evolving document and its final bytes are retained.

The worker rechecked all 96 entries of the preceding manifest. Independent validation also checks the 96 preceding controller/archive artifacts. These two path sets are not identical: worker157 had three manifest-only opaque caches, already retained in the separately sealed157 bundle and preserved by the parent. Those cache paths are now represented in worker158's initial snapshot. Their presence does not retroactively change worker157's original archive, and worker158 need not recreate that bundle.

`interrupted-reconciliation.json` binds the raw final 219 events of worker156 and quotes its failed final replay/Audit attempts. It correctly recognizes worker157's subsequent twelve-module replay and 42+2 axiom-print recovery. Worker158 rechecks that retained evidence; it does not perform a fresh recovery of those twelve inherited modules. Worker156 remains a historical timeout with a null report, and its five formerly compilation-only modules and missing prints were recovered only in worker157. This reconciliation supplies no recovery of the separate old worker121 backlog.

The root source remains pinned to SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; the raw contract retains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`, and its canonical serialization retains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Historical content-preserving COW maintenance on older retained objects changes storage metadata only; no mathematical validation is inferred from it. Content hashes, not inode/ctime identity, determine the bindings here.

## Replay method, printed closures and inherited boundary

The successful joint replay is `replay-1792183723395969000.json`. It reports the eleven selected modules, seven direct inherited imports including implicit `Init`, isolation of 57 mathematical constants, and `replay union passed`, with return code zero. Its driver SHA256 is `54c76b2e019480f23d4dc9dd2d6cbeef9acd9a5b31a9fea142ebd29d50a55e45`.

The driver loads module data for the selected targets, collects their constants, omits selected module names from the inherited-import list, constructs that inherited environment, and rejects an explicitly selected mathematical constant if it is already imported, unsafe or partial. Every explicit declaration is in namespace `MathGKM.Markov` and ends in `MFFD`, so all 57 are covered. The prior157 dual suffix condition was mechanically retagged to two identical `MFFD` alternatives; the duplication changes no effective coverage. Compiler-generated equation names retain Lean's ordinary replay treatment rather than the explicit suffix guard. The selected constant union is then passed to `env.replay`. The body runs on a joined Lean task with the recorded stack option; there is no observed bypass or fallback that silently imports the selected results before replay.

The checker is operational `unsafe` host code using Lean's import/replay API; it is not a mathematical axiom or imported theorem. That separation does not make the checker or compiler executable independently authenticated. The wrapper captures source hashes and a source snapshot before invoking Lean on the live named source path, records the replay checker hash after the subprocess, and the Audit helper records selected source hashes after compilation. The current `.olean` hashes are bound independently through controller/archive/current/manifest observations; the worker's validation schema and compiler/replay receipts do not contain an object-hash table. Optional server/private module parts are handled by the checker but have not all been independently authenticated. No invocation-time compiler-read or full executable-production claim is inferred from these records.

The separate successful `MarkovAudit1792183780032625000MFFD` compilation prints all 43 selected theorem names. `axioms-1792183806088311000.json` agrees with the actual retained Audit output and source map. Forty-two closures list only `propext`, `Classical.choice`, `Quot.sound`; `raw_S_localMFFD` lists `propext`, `Quot.sound`. The 14 definitions are part of the selected replay union but are not counted as theorem-print closures. Imported theorems may occur transitively in these axiom closures; this is not a new body replay of every imported theorem.

The six explicit inherited direct imports are `MarkovBinomialTableM295`, `MarkovCross774`, `MarkovHorizontalLCB46`, `MarkovLowerShapeME9C`, `MarkovLowerUniformME9C`, and `MarkovResidualM1BB`, plus implicit `Init`. Static resolution yields 2,522 inherited local source/object pairs, 2,533 local nodes in the selected mathematical closure, and 2,534 with the Audit. The unused candidate introduces no additional inherited dependency. The independent pair map agrees with sealed157 identities and the applicable worker158/current hashes. Of the 242 separately named older mathematical comparisons, 167 are in the joint inherited base and 75 are comparison-only.

Endpoint scope differs: `MarkovFifthShapeMFFD` has only four local nodes, one selected plus three inherited, and imports none of the old worker121 groups. Every other selected endpoint reaches all 212 old compiled-but-unreplayed worker121 modules, the 195-module historical subset, and the separate 19 accepted historical modules. The joint base therefore contains all 212; **zero of them are newly selected or recovered in worker158**. Current source/object identity and current theorem axiom prints do not repair their historical replay gap.

Seven worker156 modules are reused in this joint base with worker157's already sealed recovery provenance. None is recompiled or replayed as a selected target in worker158. The other five recovered156 modules remain outside this base. All twelve retain their historical recovery in157 only; this audit does not alter either worker's cutoff. Worker153's ten accepted and three unvalidated candidate modules are outside the current graph and receive no new coverage.

`MarkovWindowLC6d34` is imported with its unchanged source SHA256 `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object SHA256 `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its old source snapshot/build and empty-output checker receipt remain the same limited historical evidence, with only the two then-printed theorem closures; the old build did not record an object hash. It is distinct from the worker121 backlog and receives no new body replay. Corrected historical dependency versions, worker134's separately preserved late failed receipt, and the earlier recovery boundaries remain as recorded in the method supplement, not retroactively upgraded.

## Finalization, report and deadline

`finish_validation_ffd747f5.py` chooses successful build receipts matching the current selected source hashes, runs the joint replay with a 220-second bound, then runs the Audit helper sequentially with an outer 150-second and inner compiler 100-second bound. It asserts both successes and stores the receipt paths, current source map and closure count. The method review independently binds those actual records; simply reading the aggregate `permitted_axioms_only` flag would not establish them.

The changed finalizer checks completion-null and the permitted flag, selected source hashes, four literal proof tokens, the 6,597 non-owned initial hashes, 96 preceding manifest hashes, pinned root/canonical contract, and STOP absence. It does not independently re-run or validate the build/replay/closure records or authenticate object production. It writes `final-check.json` before its assertion that the unsuccessful-build count is ten; in this execution the assertion and remaining steps succeeded. It writes an authored draft report and creates a manifest by recursively scanning the completed evidence directory and scanning only top-level tagged research files. The nonrecursive research scan is a real scope limit, but no new manifest-only or unrecorded completed artifact was found here.

Events210–217 record successful validation aggregation; events225–226 record successful finalization. Event226's printed final-check and verifier objects match the saved JSONs. The authored draft differs from the delivered report in `summary`, `actions`, `observations` and `agenda`; it must not be substituted for the delivered structured report. Delivered event227, controller `final.json`, and the receipt's `report` agree. Event228 is `turn.completed`; all 107 started items have retained completions. The report and both finalization summaries keep `completion=null`.

Controller start was **2026-10-16 20:26:39.650895 UTC**, the nominal 1,800-second deadline was **20:56:39.650895**, and host finish was **20:53:22.057288**. The receipt is `completed`, return code zero, with a delivered report and elapsed **1,602.4063937664032 seconds**. Host finish is **197.593607 seconds before deadline**. The stored elapsed differs from the subtraction of the two wall-clock timestamps by less than one microsecond; this does not change the outcome or deadline conclusion.

The last mathematical build finishes at approximately **20:48:24.834298**. Replay starts **20:48:43.395969** and finishes approximately **20:49:39.954054**. Audit starts **20:49:40.032815** and finishes approximately **20:50:06.082344**. These finish estimates add stored monotonic durations to receipt-name wall-clock start epochs; they are not independent compiler-read timestamps. Validation's observed original mtime is **20:50:06.103284**; final-check is **20:51:44.407501**, manifest **20:51:44.474841**, and verifier **20:51:44.481893**.

The completed event log's mtime is **20:52:43.107344**; the heartbeat content at **20:52:43.713728** accounts for all 470,003 event-plus-stderr bytes. Controller `final.json` has mtime **20:52:44.357350**. Archive copying has its own later metadata, such as the verifier's **20:53:22.035372** archive-copy mtime. Those copy times do not replace the original artifact chronology. No retained artifact is placed after host finish or deadline by the observed records. This worker is completed on its own record; no timeout is upgraded through a finalizer or later successor.

## Final audit observation

Independent validation and method reviews agree on 71 retained comparison fields, all 2,522 inherited source/object pairs and 152 shared input hashes. They also agree with the eleven selected mathematical inventories, the 242 older named pins, nine named external source/object pairs and the unused candidate. Both reviewers found no necessary correction in the substantive main/source/finite audit.

The independent inherited-pair hash observation ran **21:07:05.627511–21:07:45.908601 UTC**. The final method pass found all **161 previously pinned inputs**, including 16 audit-only inputs, unchanged during **21:14:07.885730–21:14:07.933058 UTC**; four exact candidate source/object absences were observed at **21:14:07.933297**. The final validation pass found all **9,535 named inputs** unchanged during **21:14:39.880185–21:15:16.519339 UTC**, with no missing input. Its four exact candidate source/object absences were observed at **21:15:16.538978**.

The exact-request late-file observation at **21:15:16.538988 UTC** found the expected **102 archive and current request files**, with no extra or missing paths. Its enumeration was limited to the closed158 evidence directory and exact research/cache request-name patterns. Active159 mathematics was not inspected. No late evidence bundle or new manifest-only preservation bundle is required. Worker157's already preserved three-cache bundle remains separately bound history.

Project reads ended after those bounded observations. Subsequent footer review and integrity sealing use audit files only. The seal timestamp does not extend the project observation window or promise future immutability. Eleven validation-bound and sixteen method-bound audit-only inputs are rechecked by the final seal against their saved hashes. An audit-predicate refinement is retained in validation evidence: absent optional initial/controller coverage was initially misclassified as a hash discrepancy, then corrected from saved observations without project rereads. No source bytes or historical acceptance changed.

The seven standard supplements are `markov_worker_000158_mathematical_source_hashes.json`, `markov_worker_000158_source_structure_audit.json`, `markov_worker_000158_finite_domain_audit.json`, `markov_worker_000158_validation_audit.md`, `markov_worker_000158_validation_evidence.json`, `markov_worker_000158_replay_method.md`, and `markov_worker_000158_replay_method_evidence.json`, all under `/private/tmp/math_gkm_godel_20261013`. The exact inherited-pair map is `markov_worker_000158_inherited_pair_expectations.json`. The integrity file binds this main note, all seven supplements, the pair map and the two main-auditor static/seal helpers by full SHA256 and byte count, and records the precise observation windows and concurrence. Preserve these audit files with the closed worker158 archive; no separate current-project path needs supplemental preservation.
