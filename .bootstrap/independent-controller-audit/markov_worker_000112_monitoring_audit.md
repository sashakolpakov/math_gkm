# Independent monitoring audit: worker 000112

Request `5110b3fac1864ad1b18b3138b0f468e8`. Archive-first read-only review of completed worker 112, under `/Users/sasha/math_gkm/.control/markov/workers/000112/artifacts/`. Only saved source, completed records and explicitly bound inherited sources were inspected. No Lean, checker, replay, finalizer, project-script import, coefficient/matrix/quotient experiment or source recurrence was executed. No project/collatz edits, proposer contact, mathematical assistance or active successor inspection occurred. All audit output is confined to `/private/tmp/math_gkm_godel_20261013`.

## Findings and limits

The final saved mathematical sources support three distinct advances:

1. The exact fourth horizontal row formula and raw adjacent log-concavity for every actual path with `a≥3,b≥9`, at every natural starting index `i`, with zeros retained.
2. An all-order source-row identity, a coefficientwise nonnegative integral residual for every actual path and row, and its factorization of the raw row when `2j+1≤b`. General residual log-concavity and interval support are not proved.
3. The exact equivalence `Conjecture63 ↔ InteriorCore63HorizontalM511`, removing known horizontal rows while retaining their exceptional sources, higher horizontal rows and the inherited vertical/diagonal residuals.

The residual proposition and full pinned `MathGKM.Markov.Conjecture63` remain unproved. No arbitrary-word obstruction is a counterexample to that root. The saved arbitrary-word calculation has a more specific object than the phrase “residual” alone suggests: it computes `[Y²]D(K_word)`, not the generic trace-recursive `hresidualM511`. Their equality is proved for actual source words only.

## Fourth row: exact source and indices

Write `P=(frame path).mid.p`, `a=(frame path).mid.a`, `b=(frame path).mid.b`. `horizontal_fourth_formulaM511` proves, over integer polynomials,

`24 * (Bivariate.swap P).coeff 4 = X^(a-3) * (1+X)^(b-9) * h4sourceSeedM511 a b`

under exactly `3≤a` and `9≤b`. The natural exponents are justified by those inequalities, including equality cases. The final `horizontal_fourth_rawM511` in `MarkovHorizontalFourthLCM511` then proves

`coeff P i 4 * coeff P (i+2) 4 ≤ (coeff P (i+1) 4)^2`

for every natural `i`. There is no remaining formula, coefficient positivity, shape, interval support, gap or log-concavity assumption. Actual `a<b` is supplied by `frame_reduced` when the seed bound is used. The positions are precisely `(i,4),(i+1,4),(i+2,4)`, with fixed second coordinate. This is not a total-degree diagonal slice. The uniform scale 24 cancels as a common positive square. No individual coefficient is divided out or normalized by its position. Since no polygon premise is required, the conclusion includes all original polygon-valid horizontal triples on row 4 without altering their guards.

The source seed has eight ascending coefficients `h4c0M511` through `h4c7M511`, explicitly defined in the accepted `MarkovHorizontalFourthSeedM511`. Their exact source parameters are natural subtractions and piecewise counts:

`q=2a-b`, `t=min(b-a,3a-b)`, `u=3a-2b`,

`v=if 2a≤b then min(b-2a,4a-b) else 0`,

`w=if 2a≤b then 0 else if 3a≤2b then 2a-b else b-a`, and `z=4a-3b`.

All subtractions here are in the naturals before casting, so they mean truncated subtraction, not unrestricted integer differences. For example the first three coefficients are `96z`, `-192q+192q²-1056u+288au+192w`, and `1248q-1392aq+432a²q-480t+288at-1056u+96au+96bu+96v`. The other five explicit polynomial coefficients and their source hashes are retained in the reviewed seed source; no fitted value is used as a premise.

## Twenty charts and interval support

`h4boundsM511` proves `H4GoodM511` for every natural `3≤a<b`, `9≤b`, without requiring coprimality. It partitions the parameters by the following exact tests. The last column gives the lower coordinate corners used to cover each natural region; actual chart coordinates above each corner are nonnegative reals.

| Region | Natural coordinates; reconstruction | Lower corners |
|---|---|---|
| `4a≤b` | `x=a,y=b-4a`; `a=x,b=4x+y` | `(3,0)` |
| `3a≤b<4a` | `x=b-3a,y=4a-b`; `a=x+y,b=4x+3y` | `(0,3),(1,2),(2,1),(3,0)` |
| `2a≤b<3a` | `x=b-2a,y=3a-b`; `a=x+y,b=3x+2y` | `(0,5),(1,3),(2,2),(3,0)` |
| `b<2a`, `3a≤2b` | `x=2a-b,y=2b-3a`; `a=2x+y,b=3x+2y` | `(0,5),(1,3),(2,2),(3,0)` |
| `2b<3a`, `4a≤3b` | `x=3b-4a,y=3a-2b`; `a=2x+3y,b=3x+4y` | `(0,3),(1,2),(2,1),(3,0)` |
| `3b<4a` | `x=b-a≥1,y=4a-3b`; `a=3x+y,b=4x+y` | `(1,5),(2,1),(3,0)` |

The counts are respectively 1,4,4,4,4,3, totaling 20 charts. The non-strict tests allocate the boundaries `b=4a`, `b=3a`, `b=2a`, `2b=3a` and `3b=4a`; none is omitted. The natural bounds `a≥3,b≥9,a<b` imply the corner disjunction in each region. Each natural subtraction/cast identity is discharged before applying its real chart. The proof includes `a=3` and `b=9` wherever the source parameter domain permits them.

Each chart proves 16 facts: the first three coefficients are nonnegative, the final five are strictly positive, six adjacent gaps are nonnegative, and coefficient 0≤coefficient 1≤coefficient 2. The saved source contains 320 corresponding `ring_nf`/positivity branches across the 20 charts. This audit checked the source statements and certificate structure without recomputing the expansions.

`eight_crossM511` uses both monotonicity inequalities to prove interval support at indices 1 and 2: if a positive left endpoint lies at 0 or 1, the intervening early coefficient is positive as well. Indices 3–7 are strictly positive. Values below 0 and above 7 are explicitly zero. Thus potentially three leading zero coefficients are retained, and adjacent inequalities are not treated as sufficient for smoothing without support control. The checked adjacent-plus-interval-support bridge gives CrossLC of the zero-extended seed. Pascal smoothing by `(1+X)^(b-9)` and a shift by `X^(a-3)` preserve it. The literal swapped-row coefficient bridge and uniform factor 24 then return the all-natural-index raw inequality.

## Fourth moment and denominator clearing

`MarkovFourthGenericM511` proves a fourth-moment identity for an arbitrary matrix alphabet having the common constant projection, on the actual `sourceWord28 path`. Its length requirement is `b≥5`. The source word supplies at least three central letters, so the exact cyclic four-letter scan and long-product trace identity apply. The inherited long-product theorem's determinant correction vanishes under its explicit length≥5 premise. This is not an unguarded short-product formula.

The actual four-letter moment is supplied by inherited `source_four_rotatedBE` and `fourMomentBE`, which derive the counts from actual source words. The canonicalization enforces the vanishing conditions required by the four-letter source count theorem. The new `h4source_valM511` identifies these counts with the piecewise `v,w,z` above, including their boundary cases. There is no remaining arbitrary-word-to-source identification premise.

The matrix alphabet is the horizontal projection gauge already audited in worker 111, based on the literal raw matrices. `hproj_shapeM13D` discharges its common-projection assumption. `h4local_closedM511` checks all 16 Boolean quadruples algebraically; `h4val_closedM511` expresses their actual source average with denominator `x³(x+1)^8`. The lower moments retain their previously proved exact formulas. `fourth_newton01F` converts these moments to

`24 T₄ = D⁴+6D²K+3K²+4DL+M`.

The inherited exact source trace still has `x^a(x+1)^b T(V)=(x+1+V)P(x,V)`. Coefficients 0 through 4 are compared, lower coefficients are eliminated, and the saved denominator-clearing identity yields

`24 x³(x+1)^9 * P(x,V).coeff 4 = x^a(x+1)^b Q₄(x)`.

This is proved for every real `x>0`, discharging `x≠0` and `x+1≠0`. Equality on that infinite set yields a polynomial identity. The nonzero polynomial `X³(1+X)^9` is canceled using `a≥3,b≥9` for the exact power splits; injectivity of the integer-to-real polynomial map returns the raw integer identity. Temporary gauge denominators impose no excluded coefficient positions or missing zeros. No finite interpolation or guessed moment remains in the final theorem.

## All-order integral residual: what is proved

Set `h=1+x` and rescale the raw inner variable by `V=h²Y`. The integral matrices are

`K_A=[[Y,Y],[xY,1+xY]]`,

`K_B=[[Y+h²Y²,(x+2)Y+h²Y²],[x(x+2)Y+xh²Y²,x+x(2x+3)Y+xh²Y²]]`.

These agree with `hKletterM511`: the latter's polynomial variable is `Y`, while `x` is its coefficient-ring parameter. Specializing `x=(X:ℤ[X])` creates an outer `Y` and inner `x`. This reverses the role of the abstract names `U,V` inside the reused bivariate nonnegativity helpers: there `U` denotes `Y` and `V` denotes `x`. Accordingly `hdiff_source_nonnegM511 path j i` is applied to outer `Y` index `j` and inner `x` index `i`. The raw-row bridge restores the original raw ordering `(i,j)`; no coefficient swap is silently lost.

For any word, define `T=tr(product K_word)` and the integral recursion `R₀=T₀`, `R_(j+1)=T_(j+1)-hR_j`. `hresidualM511` is defined over any commutative ring. It includes zero coefficients at all degrees and has no finite-row cutoff. Map compatibility and `hsub_coeffM511` prove the exact rescaling of coefficients. For actual paths the source trace gives, and induction in `j` proves,

`h^(2j) * rawrow_j = h^(b-1) * R_j`

as an integer-polynomial identity for every natural `j`, including 0. The proof again uses positive real evaluation followed by an infinite-set polynomial identity and injective coefficient map; it does not replace coefficients by a single numeric specialization.

When `2j+1≤b`, cancellation of the nonzero polynomial `h^(2j)` yields `rawrow_j=h^(b-2j-1)R_j`. Equality `2j+1=b` gives exponent zero and the raw row itself as residual. `horizontal_binomial_dvdM511` holds for all `j`, but outside this range its natural exponent is zero and the divisibility assertion is only divisibility by 1. It does **not** assert that `R_j` equals the raw row there. The cleared identity instead has the opposite extra factor, `R_j=h^(2j-b+1)rawrow_j`, as an algebraic consequence in that range. No inverse Pascal-smoothing implication is established. The factor is prescribed, not claimed maximal.

For positivity, let `D(M)=M.b+M.d-M.a-M.c`. Conjugation proves the actual-source identity `P(x,h²Y)=h^(b-1)D(K_sourceWord)`. Comparing it to the cleared recursive identity proves **for actual paths** `R_j=[Y^j]D(K_sourceWord)`. The subtraction in D is not simply assumed nonnegative. Every source word ends in B, and the exact last-letter identity is

`D(M K_B)=(M.a+M.c)hY+(M.b+M.d)x(1+hY)`.

Both K letters have coefficientwise nonnegative integral entries, hence every prefix product does. The displayed sum then proves coefficientwise nonnegativity of D for actual source words. Thus `hresidual_coeff_nonnegM511` holds for every path and every natural `j,i`, not only in the factorization range. `horizontal_positive_factorM511` combines this with the guarded factorization to produce a nonnegative integral Q when `2j+1≤b`.

There is no assumption that a residual coefficient is nonzero. Zero and beyond-degree coefficients are retained by polynomial coefficient definitions. For actual sources the D identity also makes the residual a finite polynomial in the outer row variable, even though the generic recursion is defined at every row. Positivity alone does not prove interval support, adjacent log-concavity, CrossLC or any missing raw direction.

## Exact root residual

`HorizontalUnresolvedM511 a b j` is exactly

`3≤j ∧ (j=3 → a<2 ∨ b<7) ∧ (j=4 → a<3 ∨ b<9)`.

Consequently the horizontal residual retains all `j≥5`, row 3 sources with `a<2` or `b<7`, and row 4 sources with `a<3` or `b<9`. A small numerator can still have arbitrarily large denominator; these conditions are not a finite denominator cutoff. Rows 0,1,2 are discharged by inherited unconditional raw theorems. The failed attempt to import the old unaccepted `MarkovHorizontalTwo05ef` draft is not the final route: the accepted module imports and applies `horizontal_two_raw8934` from `MarkovSecondHorizontal8934`.

The horizontal clause retains all three original polygon guards and `i+j+4≤a+b-1`, adding only the displayed unresolved-row predicate. The vertical clause is unchanged from `InteriorCore63FifthMCFC`, with its three original guards and the same `i+j+4≤a+b-1` bound. The diagonal clause is unchanged as well: all three guards at `(i,j+2),(i+1,j+1),(i+2,j)`, plus `i+j+8≤a+b-1`, `a+5≤i+j+2` and `a+2≤b`.

`root_iff_horizontalM511` uses the inherited exact Fifth equivalence in the reverse direction and exhaustively splits horizontal `j=0,1,2,3,4` from the higher cases. Both endpoint conjuncts of the pinned root remain supplied through that inherited exact equivalence. No direction, natural zero convention or endpoint is replaced by an auxiliary normalized statement. The new equivalence does not prove its residual.

## Arbitrary-word observation and admissibility

The retained `arbitrary-word-obstruction.json` and completed event 283 record word `A^16 B^2`, row 2, coefficients `[0,2,14,106,171,0,0,0]` and failure at starting index 1. Its recorded adjacent violation is `14²<2·106`.

The saved command multiplies the integral K matrices, forms `D(M)=M.b+M.d-M.a-M.c`, and extracts `[x^iY²]D`. It does **not** run the trace-residual recursion. Calling these numbers “residual coefficients” is appropriate only with that explicit D-polynomial meaning for this arbitrary word. The proved `hresidual_diffM511` identifies D with the recursive residual on actual source words, not on every Boolean word.

This word has length 18 and two B letters. Were it an actual source word, the checked source counts would force `a=2,b=18`, contradicting `frame_reduced` because those labels are not coprime. Reducing the fraction to `1/9` does not identify an eighteen-letter word with an actual nine-letter source word. Ending in B is enough for the D nonnegativity mechanism, but it is not enough for actual-source admissibility.

The observation therefore obstructs an unrestricted assertion that every positive K-product ending in B has log-concave D rows. It is a saved finite computation, not a Lean refutation theorem, an actual-source residual witness, or a failure of raw `P` coefficients. Even a failure of a quotient/residual LC statement would not by itself refute LC of the raw row obtained after binomial multiplication. This record establishes no counterexample to Conjecture63. No matrix product or coefficient experiment was rerun by this audit.

## Finite domains and count limits

The fourth-row script covers every coprime `3≤a<b`, `9≤b≤48`, and `i=0,…,a+b+4`. Independent integer-domain enumeration gives **630 fractions, 35,630 coefficient positions, 18,395 guarded triple starts**. Its guard `i+6≤a+b-1` and `bi+4a≥ab` is equivalent to all three original row-4 polygon guards. The polygon interval is `ceil(a(b-4)/b)≤i≤a+b-5`; there are 10,305 leading exterior positions and nine trailing positions per fraction, or 5,670 trailing positions. Their sum **15,975** matches the recorded zeros. This is a geometric count, not a fresh coefficient/support computation. The separate coprime seed scan `9≤b≤100,3≤a<b` has **2,884 pairs**, matching its receipt.

The uniform quotient script covers coprime `1≤a<b≤60` and `0≤j≤floor((b-1)/2)`: **1,101 fractions, 22,479 rows**. It initially retains `a+b+2` raw coefficient positions in each row and divides by `1+u` exactly `b-2j-1` times. Conditional on the saved empty division-failure list, the quotient vector length is `a+2j+3`; its adjacent tests count `a+2j+1` per row, totaling **1,020,928**. These tests concern residual vector triples, not just polygon-valid raw triples. The original raw vectors have **1,565,133 positions**; polygon-exterior counting gives **685,303**, matching `raw_zero_positions`. That number is not the count of quotient zeros. The receipt reports empty division, negativity, support-gap and LC failure lists; this audit did not rerun those value tests.

The matrix/source script covers coprime `1≤a<b≤24`: **179 fractions**, with residual comparison rows `j=0,…,a+b+1`, totaling **4,729 rows**. Its **168,290 source coefficients** is the saved `len(psub)` count, hence a value-dependent sparse-support count. The expanded polygon envelope under `V=(1+u)^2Y` has the same 168,290 positions: at row j its interval runs from `max(0,ceil(a(b-j)/b))` to `a+b-1+j`. Agreement accounts for the reported number geometrically but does not independently recompute matrix/source coefficients or prove polygon saturation. The completed record reports equality of the full sparse polynomials and the zero-extended residual recursions. All these are finite observations, distinct from universal theorem validation.

## Validation, rejected versions and named closures

The independent validation supplement finds all **21 mathematical modules, 68 named theorems and 27 definitions** have matching final source/build snapshots, object bindings and explicit successful selected replay. All final mathematical sources are accepted; there is no remaining unbuilt new mathematical draft or compiled-only new mathematical module. There are 48 ordinary build attempts: **24 successes** (21 mathematical modules and three Audit modules) and **24 compiler errors**, with no timeout. The 24 rejected attempts exactly match the retained rejection list.

Twenty-three failed snapshots differ from their corresponding final source bytes. The remaining failed `MarkovHorizontalFourthMomentSeedM511` snapshot is byte-identical to its final source: that attempt failed because its Scaled dependency object did not yet exist, and the same source later compiled successfully. This is a saved missing-dependency failure, not a proof pass or a source edit concealed by the final hash. The rejected root-reduction snapshot importing `MarkovHorizontalTwo05ef` remains excluded; the accepted final import is the checked second-row boundary module identified above.

Four successful union replay invocations select each of the 21 new modules exactly once, in sets of **15+4+1+1**. No worker 112 replay fails, times out or is interrupted. No inherited mathematical module is newly selected in this round. The first set contains the fourth-row family and EightLC; the next contains Rescale, Residual, AllOrder and ResidualHorizontal; the last two select HorizontalPositive and HorizontalResidualPositive. `MarkovHorizontalFourthSeedM511` has 13 definitions and no theorem; `MarkovHorizontalFourthGoodM511` has one definition and no theorem. Both are explicitly selected. Their named-axiom flags are vacuous and do not denote 14 printed theorem closures.

The Fourth, Uniform and Final Audit sources request 41,55,68 names respectively, producing **164 printed rows and 68 distinct theorem closures**. The final Audit alone covers all 68, with source hashes and names matching its complete 21-module inventory. Of these 68 closures, 65 use `propext,Classical.choice,Quot.sound`, two use `propext,Quot.sound` and one uses `propext`. All sets are permitted. Compiling a definition, selecting its module for replay and printing named theorem axioms remain distinct checks.

## Replay method and source import boundaries

The validator is byte-identical to worker 111's validator after request-tag substitution. Every replay invokes the inherited `ReplayWideMCFC` with the unchanged `-s 131072` stack argument and explicit target list. Wide remains at SHA256 `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`, matching its old archive, before112 and preservation manifest. The previously audited kernel replay body and joined-task result propagation are unchanged. No new driver, acceptance branch or bypass is introduced. As in worker 111, individual receipts omit `driver_sha256`; driver binding is through retained source/archive/before/preservation records, not a per-invocation measurement.

The method review resolves **1,443 local source nodes** and finds all four imported bases transitively target-free, with no explicit selected/base declaration collision, duplicate selected declaration, unresolved local source or cycle. The four local imported-base sizes are 134,1,434,49,51; the direct imports including Init are 7,6,2,3. These are import counts, not fresh replay counts. Five second-row dependency sources were resolved from the completed worker 12 archive at matching before112 hashes, including `MarkovSecondHorizontal8934` at SHA256 `ded0fd45d6b56a3b1f2a147cc16f57b2aee33a16869c9d01b1ac4a18feff5579`. This establishes inherited source provenance, not a new build/replay of those modules.

Every imported worker 112 mathematical dependency had its selected replay complete before the dependent replay invocation. The first union has no other new-module dependency, the second imports the already replayed first 15, and the final two use already replayed representations. No failed worker 112 snapshot, old unaccepted second-row draft, worker 111 pending draft or worker 110 unbuilt draft enters a successful base. The independent mathematical hash supplement also binds 23 explicitly inspected inherited semantic/source boundaries to before112 and all 21 new sources to archive/current/validation.

The established limits persist. Static source import analysis does not reconstruct binary import headers, generated/private constants or invocation-time loaded objects. The wrapper does not enforce successful build/axiom validation before invoking replay; the independent saved-record audit supplies those bindings for these targets. Existing Lean.Replay behavior concerning constant-map overwrite, matching imported theorems and unsafe/partial/axiom treatment is unchanged. Source/name checks find no selected/base collision here, conditional on imported binaries matching those sources. Inherited compiled imports remain trusted. No official checker result, fresh whole-source rebuild or invocation-time binary identity is established.

Worker 111's recovery of the 58 worker 110 modules remains inherited evidence. Worker 112 does not replay them again. Their original cutoff, later recovery and separately preserved late closing records retain their historical classifications. The new public root equivalence is checked over inherited imports; this does not prove its residual or the pinned root.

## Finalization, preservation and deadline

All **185 controller artifacts** match archived/current bytes, and all **183 indexed entries** match. The two deliberate index exclusions are the index itself and `last-verification.json`. No extra current worker-specific artifact or replay receipt is observed. Reconciliation binds all 138 worker 111 artifacts and its retained accepted-module/source/object records without rerunning that worker's work.

The startup inventory contains 2,620 entries including this worker's own checkpoint, created before setup captured the inventory. Excluding that identified own-request file leaves **2,619 unchanged prior inputs**. The validation supplement computes its initial and final checkpoint hashes from the retained initial manifest and final bytes; worker 112 has no separate own-checkpoint-updates receipt. Before112 has 2,617 matching initial paths; the three absent paths are MISSION.md, the contract and this new checkpoint, with no conflicting before hash. This own-checkpoint treatment does not exempt an inherited source change.

The protected root remains SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The canonical contract remains `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, using the retained sorted compact ASCII JSON convention. No root or contract rewrite is implicated by the new residual equivalence.

All four direct finalizer returns (events 300,318,332,334) have code 0. The first two nevertheless expose incomplete validation inventories: first 19 accepted/replayed modules with 41 named closures, four unaudited and two pending modules; then 20 accepted/replayed with 55 closures, one unaudited and one pending. The last two expose the complete 21-module/68-closure inventory with empty pending/unaudited/unreplayed lists. A successful finalizer process return is therefore not itself evidence of a complete proof inventory; the actual fields and matching receipts determine scope.

The final `last_verify_5110b3fa.py` updates its own checkpoint, invokes the finalizer with `check=True` and suppressed stdout, then verifies all 183 index entries. Its successful completed event 338 binds the final verification. The nested finalizer has no separate controller event. The checkpoint reports failed shell-heredoc attempts, but the retained event stream shows no failed finalizer or last-verifier invocation. A documentation patch context mismatch is separately recorded in stderr; it is not one of the 24 compiler errors and not a finalizer failure. No unobserved failure is inferred from the narrative.

All following times are UTC on 2026-10-15. Replay filenames stamp invocation start, so replay return estimates add the saved duration.

| Boundary | Time |
|---|---|
| Worker start | 22:59:50.741173 |
| Fourth-row 15-module replay return estimate | 23:14:02.784971 |
| Representation/root four-module replay return estimate | 23:25:14.553908 |
| HorizontalPositive replay return estimate | 23:26:56.374007 |
| HorizontalResidualPositive replay return estimate | 23:28:41.059108 |
| Final Audit return estimate | 23:28:44.247587 |
| Final validation / index mtimes | 23:29:17.246535 / 23:29:17.386736 |
| Last verification mtime | 23:29:17.471951 |
| Final report file mtime | 23:29:29.655364 |
| Controller finish | 23:29:49.583573 |
| Nominal 1,800-second deadline | 23:29:50.741173 |

The outcome is completed, elapsed **1798.842400 seconds**, about **1.157600 seconds before deadline**. Final JSON and `turn.completed` are present. No late worker 112 proof receipt, post-deadline project artifact or pending foreground invocation is observed. An empty candidate pending list and successful worker completion do not mean mathematical completion: the final report retains `completion:null`, and the root residual is explicitly unproved.

Final read-only validation stability at 23:35:50.717955 UTC found zero changes across 3,269 inputs, with no extra or missing scoped worker file. The separate method pass found zero changes across 141 inputs. The 340-event log has no unmatched started execution; its 690,894 bytes plus 252 stderr bytes exactly account for the 691,146-byte activity total. No late-evidence snapshot was needed. These are retained-record observations, not an OS-process audit or a new proof execution.

## Audit evidence bindings

The mathematical review is a static source/correspondence audit. The finite supplement counts integer domains and geometric envelopes only. Compilation, alternate replay and axiom-print outcomes are reported from saved records. The prior worker 111 main audit remains at SHA256 `4471ec8ab871904fac715d1e12592cbe33589bd9b50fa32f3893d5dc49ba3246`; its inherited source and worker 110 recovery limits are not rewritten.

All supplements are under `/private/tmp/math_gkm_godel_20261013/`:

| Supplement | SHA256 |
|---|---|
| `markov_worker_000112_mathematical_source_hashes.json` | `862fac8c93db1b01df52c9f1f633b2a3cae38ec438d1b3a6786d23606cdd183e` |
| `markov_worker_000112_source_structure_audit.json` | `a8c050c1276b142892fbbc2ef61b6d4683ea0e5e50b710c1d56fddbb144bbeba` |
| `markov_worker_000112_finite_domain_audit.json` | `ea0da3f88cd527d4a82da1270597a5513fc90fd1f7a72b3c98eb91786a6446ce` |
| `markov_worker_000112_arbitrary_word_audit.json` | `0aeb8f32e3b5d6297feaddaf15c6eb2102223cc83a8c6ab056a359503903b150` |
| `markov_worker_000112_validation_audit.md` | `eb7f63b9bf4192e5e435df8033b707a49c7bbbe8ffd6071341d74aa515a4b1cb` |
| `markov_worker_000112_validation_evidence.json` | `593a42cd794e5f784b69b2786043b52f3a4937f2e5c3160f1a21ac23aa06ad1d` |
| `markov_worker_000112_replay_method.md` | `c7cf9825e08b194c694064b6193cf1af8c4994feb3286b88afc2b26aeb260140` |
| `markov_worker_000112_replay_method_evidence.json` | `51ae1436315651db7c127c7f7e0b157afbc798b999d228362326f705f3019958` |

The final fourth-row source identity module has SHA256 `18b49f2520fc1fe436052d2044b52d1ee56a1e46db8ac861a52db2548ae6d1b7`; its raw LC module has `b044a95a8e3a4b18a58ba3fc98395e89f2fe7e15c61fea4a7a8390e9657442d8`. The all-order identity module has `459e663cc8c4c7e809610730d18df63b3e6600c8604cb579631a4946cc58caf1`, and the exact root reduction has `568ab511c1eee70cd88868c6c6fad37fd267bbc19ca6bd218eaf03666f456e1c`. These bindings identify the reviewed artifacts; they are not a fresh whole-source rebuild or full-root completion claim.

