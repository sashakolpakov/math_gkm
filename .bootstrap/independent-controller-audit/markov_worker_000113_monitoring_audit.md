Worker 000113 independent monitoring audit — request 9e104e0c0bd245b08fe1674f6fdfedec

The completed records support a new universal raw horizontal result: for every generated source path, every natural starting index i and every natural row j≤4, c(i,j)c(i+2,j)≤c(i+1,j)². The exceptional third/fourth-row sources are now covered. They also support an integral, coefficientwise nonnegative vertical residual at every order, with the precise factorization range stated below, and the exact equivalence Conjecture63 ↔ InteriorCore63M9E1. They do not establish universal vertical residual log-concavity, the second-vertical candidate formula, the remaining interior proposition or the full conjecture.

All 20 final mathematical modules have matching successful source compilation and explicit selected replay; all 97 distinct named theorem closures are printed. Nine definitions are additional selected content, not nine more theorem closures. No accepted mathematical module is compiled-only, no new mathematical target is unbuilt or pending, and no late evidence was observed. This is a static audit of retained completed evidence over inherited compiled imports, not a new proof execution, fresh whole-source rebuild, official checker result or root-completion audit.

The archive is `/Users/sasha/math_gkm/.control/markov/workers/000113/artifacts`. Source and receipt paths below are relative to it unless identified as inherited. The main reviewer read the new mathematical source, the completed correspondence/narrative and finite scripts/receipts; a retained validation reviewer and its method reviewer independently checked source/build/object/replay/print/controller/import boundaries. New source was inspected archive-first. Twenty explicitly named inherited boundaries were compared to worker 113's before snapshot; older audit conclusions were reused without redoing their proofs or changing their cutoff classifications. No successor mathematics, proposer communication, research assistance, project modification, Lean/checker/replay/experiment/finalizer execution or fresh literature search occurred. Auditor-written files are confined to `/private/tmp/math_gkm_godel_20261013`. The only computations performed for mathematical counts were integer loop/domain and polygon-envelope enumeration plus parsing saved source/receipt metadata; no source polynomial, recurrence, matrix product, symbolic seed, quotient or LC gap was regenerated.

**Pinned meaning and indices.** The unchanged `MathGKM/Markov.lean` has SHA-256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Its bivariate polynomial is an outer polynomial in U with coefficients in ℤ[V], and c(i,j)=((P.coeff i).coeff j). A generated source is `(frame path).mid`, with actual integers 0<a<b and gcd(a,b)=1. The initial mid source has (a,b)=(1,2). `InPolygon a b i j` retains both ab≤bi+aj and i+j≤a+b−1. Horizontal triples are (i,j),(i+1,j),(i+2,j); vertical triples are (i,j),(i,j+1),(i,j+2); diagonal triples are (i,j+2),(i+1,j+1),(i+2,j). The root includes both endpoint clauses for (0,1,1) and (1,1,U+V), as well as all generated paths and all three guarded directions. The new results use these raw integer coefficients. There is no coefficientwise normalization, modified polygon or positive-support-only interpretation.

**Horizontal numerator-two extension.** `MarkovHorizontalFourthTwoM9E1.lean` contains four theorems. For every real x≥0, `h4two_goodM9E1` establishes the inherited complete `H4GoodM511` certificate at a=2,b=9+x with all six auxiliary source counts zero. The accepted proof unfolds the coefficient/gap conditions and uses `ring_nf` and order reasoning. For natural b≥9, the six actual count expressions reduce to zero and the certificate supplies the inherited eight-term `CrossLC` theorem. The first three seed coefficients are zero; the final five are strictly positive. The needed ordering of the initial nonnegative terms and adjacent gaps is retained, so the leading zeros are included in the interval-support argument. It is not a seed LC assertion under a separate unproved gap or support premise.

`horizontal_fourth_shiftedM9E1` proves the following identity in ℝ[u] for every actual path with b≥9, without a lower bound on a beyond actual source reducedness:

    24 u³ [v⁴]P(u,v) = uᵃ(1+u)^(b−9) Q₄(u).

It uses the inherited cleared fourth-row evaluation identity at every positive real u, obtains polynomial equality by infinitely many evaluations, and cancels the nonzero polynomial (1+u)⁹. The displayed identity retains u³ on the left and uᵃ on the right; it neither forms u^(a−3) for a=2 nor divides by u or a raw coefficient. Its coefficients are mapped from integers into reals. The final raw inequality is transported back to integers exactly.

For a=2,b≥9, `horizontal_fourth_twoM9E1` applies Pascal smoothing to the complete seed `CrossLC`, shifts by uᵃ, and extracts the adjacent triple of the left side at i+3,i+4,i+5 (integer center i+4 in `CoeffSeq`). `Polynomial.coeff_X_pow_mul` and `swap_coeff46` restore the literal raw indices (i,4),(i+1,4),(i+2,4). The common scale is 24 on every coefficient, hence 24² on each product; cancellation preserves the inequality. This is uniform denominator clearing, with leading/trailing zeros retained, for every natural i.

**Exhaustive small sources and final horizontal assembly.** Fourteen concrete modules cover exactly the reduced pairs 2≤a<b≤8:

| a | Denominators b |
|---|---|
| 2 | 3, 5, 7 |
| 3 | 4, 5, 7, 8 |
| 4 | 5, 7 |
| 5 | 6, 7, 8 |
| 6 | 7 |
| 7 | 8 |

Each concrete module has five theorems: an exact full swapped source polynomial from `frame`/`advance`/`initial` by ordinary polynomial arithmetic, the row-3 extraction and bounded raw LC, and the row-4 extraction and bounded raw LC. Their starts satisfy 0≤i≤a+b−1, inclusive. Across the 14 modules this is 282 bounded adjacent instances, proved by saved `interval_cases`/`norm_num` proof terms, not assumed from Python output. Every module has the same protected-recurrence expansion and coefficient-extraction structure; the saved source theorem headers contain no omitted formula or shape premise. The generator supplied literals, while the accepted Lean equality checks those literals against the recurrence.

`small_horizontalM9E1` obtains reducedness from the actual path, exhausts the possible integer a,b labels, and uses inherited `frame_path_injective_098` to identify the path with the matching concrete path. The label equalities are ordinary `by decide`, not `native_decide`. This is an exhaustive finite base branch, not a sample of paths. `small_horizontal_allM9E1` removes the bound on i: beyond a+b−1 the first coefficient is zero by `raw_outside_polygon18`, making the product zero and the required inequality immediate. Neither row is cropped to positive entries.

The final source split has no gap. For a=1, inherited `source_one_global6` proves all directions at all natural starts. For j=3 and a≥2, inherited `horizontal_third_rawM13D` covers b≥7, and the finite branch covers b<7. For j=4 and a≥2, inherited `horizontal_fourth_rawM511` covers a≥3,b≥9, the new theorem covers a=2,b≥9, and the finite branch covers b≤8. Equality b=7 and b=9 lies in the appropriate universal branch, while equality b=8 lies in the finite branch. `horizontal_third_allM9E1` and `horizontal_fourth_allM9E1` therefore have only path and natural i parameters. `horizontal_first_fiveM9E1` adds inherited j=0,1,2 results and quantifies over every j≤4. These conclusions are stronger than the original polygon-guarded horizontal obligations for these rows and imply them directly. They make no new claim about j≥5.

**Integral vertical representation and exact range.** Write h=1+v and replace the outer variable u by h²Z. The new integral matrices are

    K_A = [[v(1+hZ), 2+hZ], [vhZ, 1+hZ]],
    K_C = [[1+vZ, Z], [vZ, Z]],  K_B=K_A K_C,
    Q   = [[1, −1], [0, h]],
    E(M)=M.a+M.b−M.c−M.d.

`vsubM9E1` is precisely this outer-variable substitution and fixes the inner variable v. `vletter_intertwineM9E1` proves raw A(h²Z,v)Q=QK_A and raw B(h²Z,v)Q=hQK_B by integral polynomial identities. Word induction gives the identity for every word with a factor h to its B-count. The transition to the actual source is separate: `source_word_counts28` identifies that count as a, and `source_word_exact3eda` identifies the original upper-right matrix entry with P. Taking the first-row sum after intertwining and canceling only the nonzero polynomial h, using a>0, proves

    P(h²Z,v)=h^(a−1) E(K_W)

for the actual `sourceWord28 path`. No inverse, nonzero evaluation hypothesis or coefficient division is used. The all-word intertwining theorem does not identify arbitrary words with generated sources.

All entries of K_A,K_C and their word products are coefficientwise nonnegative. Positivity of E is not inferred from a difference of four positive entries: the proof uses the inherited exact fact that an actual source word begins with A and the identity

    E(K_A M)=v(M.a+M.b)+(M.c+M.d).

This establishes coefficientwise nonnegativity for E of every actual source word, including zero coefficients. Define R_i(v)=[Z^i]E(K_W), an integer polynomial. `vsub_coeffM9E1` proves coefficient extraction under the substitution for arbitrary bivariate p and every natural i. Thus the unrestricted actual-source statements are

    h^(2i) [u^i]P = h^(a−1) R_i,        [v^j]R_i ≥ 0 for every natural i,j.

The specific factorization

    [u^i]P = h^(a−2i−1) R_i

is `vertical_all_order_factorM9E1` and requires **2i+1≤a**. At equality the exponent is zero. All subtraction in the Lean exponent is natural subtraction. `vertical_positive_factorM9E1` is an unrestricted existence theorem for a nonnegative integer quotient with exponent max(a−2i−1,0): within the range it chooses R_i; outside it chooses the already nonnegative raw column, with exponent zero. It does not identify that latter quotient with R_i. The cleared identity instead relates high-index R_i to an additional binomial factor times the raw column. Nothing in these new files reverses smoothing or proves adjacent log-concavity of R_i or of an arbitrary raw vertical column. The vertical indices remain (i,j),(i,j+1),(i,j+2); no horizontal/vertical swap is silently used in this representation.

**Exact residual, directions and endpoints.** `InteriorCore63M9E1` quantifies over every actual path and assumes a≥2 before the following conjunction. Each row below retains all three original `InPolygon` guards at its listed indices:

| Remaining clause | Triple | Additional restrictions |
|---|---|---|
| Horizontal | (i,j),(i+1,j),(i+2,j) | i+j+4≤a+b−1 and j≥5 |
| Vertical | (i,j),(i,j+1),(i,j+2) | i+j+4≤a+b−1 and i≥2 |
| Diagonal | (i,j+2),(i+1,j+1),(i+2,j) | i+j+8≤a+b−1, a+5≤i+j+2, a+2≤b |

The diagonal triple has common total degree i+j+2. Its lower cutoff is a+5; no shift to a different diagonal, omitted natural-zero guard or discarded top-strip case appears. The restrictions already discharged in earlier exact reductions remain justified through the inherited equivalence, not assumed away by this audit.

`root_iff_interiorM9E1` is a proved equivalence, not a proof of the residual. Its forward implication restricts the original root inequalities. In reverse it uses `root_iff_horizontalM511`, handles numerator one by the inherited full source theorem, inserts the newly universal horizontal rows when j≤4, and handles vertical i=0 and i=1 with `vertical_boundary_raw46` and `vertical_one_all274`. The latter inherited theorem is for all actual sources and natural vertical starts, including its small-numerator cases. All other vertical and diagonal obligations pass through the residual unchanged. Both root endpoints remain accounted for by the inherited exact equivalence. The new vertical matrix representation is not an imported premise of this reduction; the two new vertical modules lie outside the Residual module's import base. Full Conjecture63 and the displayed interior proposition remain open.

**Second-vertical candidate status.** The saved experiment builds degree-2 Z-jets of normalized Laurent-polynomial blocks v^(−q)K_A^q K_C. It derives symbolic candidate seeds Q_q(a,r,s,v), q=1,…,12, from block moments and proposes, for actual a≥5, b=aq+r, 1≤r<a and s=max(2r−a,0),

    2 R_2(v)=v^(b−2q−1) Q_q(a,r,s,v).

The inherited `source_blocks025`/`source_block_counts274` supplies a raw-matrix block representation with two adjacent run lengths and count/length equalities. It does not itself prove this candidate's cyclic adjacent-long count or moment-to-column assembly. Those missing universal bridges are explicitly acknowledged in the completed narrative and are absent from the new accepted Lean inventory. The symbolic assertion that every exponent becomes nonnegative after clearing Laurent powers is not coefficientwise nonnegativity or log-concavity of the resulting parameter polynomials. The q=1 ascending coefficient list and q=1,…,12 saved seeds are retained experimental expressions, not admitted formulas for every actual source. No all-q, all-a or small-a second-vertical result is inferred. Empty pending Lean-source lists do not turn this separate candidate into an accepted theorem.

**Finite-domain audit.** The audit read the exact saved scripts and receipts, then counted their integer domains independently without importing or running project code.

| Saved calculation | Exact domain and independently recounted size |
|---|---|
| Vertical quotient scan | Every reduced 1≤a<b≤44: 603 fractions; i=0,…,a+b gives 27,513 columns |
| Vertical adjacent tests | Raw j-vector initially has a+b+2 entries, shortened by n=max(a−2i−1,0); a+b−n starts per column gives 1,375,803 tests |
| Raw zeros | 930,859 polygon-exterior positions in those raw grids, agreeing with the receipt's count of actual zero coefficients |
| Matrix/source comparison | Reduced b≤16 only: 79 fractions and a 32,846-position rescaled polygon envelope |
| Second-column candidate | q=1,…,12; a=5,…,21; 1≤r<a; gcd(a,aq+r)=1: 134 fractions per q, 1,608 total, b from 6 through 272 |
| Candidate coefficient identities | After a−5 divisions, vector length b+7; total 177,576 positions, including padded zeros |
| Candidate adjacent tests | The saved unshifted Q_q vector has degree 2q+3 and length 2q+4, giving 2q+2 tests per input and 24,120 total |

In the first scan, only 4,687 columns/208,846 adjacent tests fall in 2i+1≤a. The other 22,826 columns/1,166,957 tests use the raw column as quotient because n=0. Hence the broad phrase “vertical residual inequalities” in the final report refers to prescribed quotients, not the matrix-defined R_i at every high index. No negatives, internal support gaps, division remainders or LC failures are recorded, but these remain finite observations. The zero recount uses the polygon exterior; it does not recompute values or independently prove absence of internal zero coefficients.

For the matrix subset the experiment constructs a mechanical-word matrix, compares full integer dictionaries for P(h²Z,v)=h^(a−1)E, and counts `len(left)`. The independent 32,846 count is the lattice envelope with fixed outer i and inner range max(0,ceil((ab−bi)/a)) through a+b−1+i. Agreement with that count does not reproduce coefficient equality or sparse-support occupancy. The matrix identity was tested on 79 of the 603 fractions, not all 603. The formal actual-word bridge is separately proved in the new Lean source.

For the second-column candidate, the literal source recurrence is computed with outer degree truncated at two in the saved script; the comparison divides the raw i=2 column by (1+v)^(a−5), and compares twice each quotient coefficient with the shifted candidate. The offset b−2q−1 is at least three on this tested domain. The 24,120 adjacent tests are on the evaluated, unshifted Q_q coefficient vector, not all raw column triples or the whole padded shifted residual vector. The candidate receipt records no failures. None of the saved coefficient comparisons or inequalities was rerun by this audit.

**Validation and immutable version bindings.** The separate validation notes and evidence bind all 123 controller-recorded changed artifacts to archived/current hashes, all 121 indexed paths, and all 2,648 entries of the initial preservation manifest. The two controller artifacts excluded from the 121-entry index are the index itself and `last-verification.json`; both have independent controller/archive/current bindings. The initial manifest does not contain worker 113's own checkpoint, so the inherited finalizer exclusion removes no entry this round. No subtraction from 2,648 is appropriate. All 185 worker 112 changed artifacts and six inherited administrative inputs reconcile without modification. This preserves prior evidence; it does not replay worker 112 or backdate worker 111's later recovery of worker 110 coverage.

There are 26 compiler receipts: 22 successes (20 mathematics and two Audits), four errors and zero timeouts. Two successful union replays select disjoint target sets of 19 and one modules. All final source bytes equal their successful build snapshot/receipt, validation hash and selected replay hash; retained objects equal their recorded hashes. The four rejected snapshots—two HorizontalFourthTwo versions, one SmallHorizontal2_3 version and one Residual version—differ from accepted final bytes and remain rejected. No failure is reclassified as accepted. The first Audit prints 96 theorem names, the final Audit all 97; 193 printed rows therefore mean 97 distinct closures. Of those, 94 use `[propext, Classical.choice, Quot.sound]` and three `[propext]`. No extra named axiom, missing closure or final-source placeholder was found. Source compilation, selected replay and axiom printing are separate checks, all covered here.

The unchanged validator invokes inherited `ReplayWideMCFC` with stack `-s 131072`. ReplayWideMCFC’s source SHA-256 is `d24ff5d804b29522d6267a6770fecaed8e22ff4ab08833597e7c2981fba824a2`, with no new wrapper, stack adjustment or alternate acceptance path in this round. The existing joined-task wrapper propagates its result and retains the prior batch body. The validator/finalizer/Audit generator equal their worker 112 counterparts after request-tag/module-suffix substitution. Individual replay receipts do not hash the driver; driver provenance is archive/before/preservation evidence, not an invocation-time binary measurement.

The method audit resolves 1,462 local source nodes. The two selected replay bases contain 162 and 1,452 local nodes, with nine and four direct imports including Init, respectively. Both are transitively target-free, with no unresolved local import, source cycle or explicit selected/base declaration-name collision. Residual imports 17 new modules, all selected in the first successful union; the two vertical modules were also selected there but are outside its base. The first union returned at approximately 23:43:20.845092Z, before Residual replay started at 23:46:32.363733Z. Therefore there is no new compiled-but-unreplayed dependency boundary. No inherited module is newly selected this round.

Inherited compiled imports and Mathlib remain trusted. The source graph is conditional on binaries corresponding to resolved source; it does not reconstruct binary import headers, generated/private constants or invocation-time loaded bytes. Existing `Lean.Replay` qualifications—duplicate constant-map overwrites, already-imported theorem matching, unsafe/partial skips and admitted axiom declarations—are not removed by the wrapper. Static selected/base checks found no such contamination in these observed targets. The wrapper does not itself require a successful source-matching build or enforce an axiom policy before replay; the retained bindings and printed inventories independently establish those facts for this final inventory. No fresh whole-source or official-checker result follows.

**Timing and finalization.** Controller start was 2026-10-15 23:30:16.278956Z; the nominal deadline was 2026-10-16 00:00:16.278956Z. It completed at 2026-10-15 23:51:23.335580Z, elapsed 1,267.056624 seconds, with return code zero—532.943376 seconds before deadline. Receipt filename stamps are invocation starts; estimated returns add the retained durations. Residual selected replay returned at approximately 23:47:07.130159Z, followed by the concurrent final Audit's return at 23:47:10.204822Z. Finalization waited for the completed inventory.

One direct finalizer, event 180, reports the complete 20/20/97 inventory. Final verification, event 186, invokes a second nested finalizer with `check=True` and suppressed stdout, regenerates/verifies all 121 index hashes, and writes the last-verification record. The earlier command creating the finalizer is not another execution. No failed or incomplete finalizer is retained. Validation, final-check, index and last-verification mtimes are respectively 23:50:29.333288Z, 23:50:29.692333Z, 23:50:29.722543Z and 23:50:29.746427Z. All precede finish and deadline. Final report event 187 agrees with the controller/final JSON; `turn.completed` is retained at event 188; final JSON SHA-256 is `0728ba443a8eb8bc90d09c4020039d070657f3a0c135c9475b6e8685be76e6b5`. There is no unmatched foreground start, pending invocation, extra receipt or observed late file. Final stability checks found no changes across 3,257 validation inputs and 115 method inputs. No late-evidence supplement was needed.

The raw contract hash remains `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; sorted compact ASCII JSON serialization gives the request's canonical hash `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. These are different serialization measurements, not differing contract contents. Capability failures and the four rejected compiler attempts remain documented separately from accepted mathematical evidence. The report correctly leaves `completion` null.

**Hash-bound support files.** All files below are under `/private/tmp/math_gkm_godel_20261013`; the prefix is `markov_worker_000113_`.

| Suffix | SHA-256 |
|---|---|
| mathematical_source_hashes.json | e9adbc5b55105af8d34de2ba6ab9c2dc0bb1994392598720c55e3fe2af352bb3 |
| source_structure_audit.json | e15474401aba175395985a4faebca343e24233c9913d3095ec24130e9f4be6fe |
| finite_domain_audit.json | 9a05a3056947c86acb395957b1a18d92ad249df565cd1fb8ea265d0a905f6258 |
| validation_audit.md | ffa96c94689a180efb67f996dcf730c2f2ab962d5041e0c1d0ab4b2032496846 |
| validation_evidence.json | 4953d4e8035e8641baff8fd0002b3e18163c618e568d25b653744be017f64419 |
| replay_method.md | 0add157c13c849469b023283f2673d6a70bfa15567b34c5f3cdd1cec2bfcf5ce |
| replay_method_evidence.json | 58c6042a269c59317109762d7339323d2d013b0dd6eaa6a36fb301a5e53acdd1 |

The source-hash support binds every one of the 20 final mathematical sources and 20 named inherited boundaries. Key final source hashes are HorizontalFourthTwo `e57d53c708ec60431d746ace0fbf3d6861d78ced3e5f4f5b8f6e6ff1b2f3f67f`, HorizontalFourAll `307adc386a3a2ebdd50fc5d27472acc0d74e3b703ef4910ac3fc27d6b487185b`, VerticalRescale `a6f6efbc58e589b690457c5131257d00e66f9e2c4f224c05a311a3cd6788b180`, VerticalAllOrder `3ba9b90e81c3118d6a09e7216cb141c0191edaf089e589ce76a573e33ae4ffe5`, and Residual `22ffb91b4b6fc77eb2b524bffeda32886aaa9040356d26e7ae967716f0760c92`. The supplementary notes retain the complete accepted/rejected versions, object and receipt hashes, explicit selection/import boundaries, finite domains and timing. This audit changes no prior historical cutoff or completion status.
