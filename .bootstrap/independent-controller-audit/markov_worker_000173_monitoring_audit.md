# Independent monitoring audit — closed worker 000173

Request: 139fed75c29240ba95427717b28c29a7. Project: /Users/sasha/math_gkm. Archive: .control/markov/workers/000173/artifacts. Evidence suffix: markov-139fed75; Lean namespace suffix: M139.

The retained host outcome is **completed / return code 0 / structured report present**, elapsed **1658.4703290462494 seconds**. The root remains open. This audit finds an exact correction-band representation for actual numerator-three sources, exact factor coefficient/degree/endpoint results, a conditional positivity reduction to a boundary, and a formally attached actual-source obstruction to one proposed coefficient budget. It finds **no new unconditional universal raw log-concavity region**. In particular, the budget obstruction is not a counterexample to the root: the same actual source triple is formally shown to have a positive raw log-concavity gap.

Sixteen final mathematical modules, containing 56 named theorem closures and 11 definitions, have matching retained successful compiler snapshots, selected joint replay and axiom-print records. This is source/receipt-bound evidence over inherited compiled imports. It is not a fresh whole-source rebuild or an independently executed kernel check. No old validation backlog is repaired merely by importing it.

## Authority, method and observation limits

The supervisor authorized this closed-worker audit after a receipt-only watch. Eleven exact receipt observations, ten absent and one present, were spaced at least 60 seconds apart. Each requested wait was at most 59 seconds. Final receipt discovery was 2026-10-17 03:59:55.756148 UTC; the complete 23,173 receipt bytes were hashed as **b220e790beee945d904e2e8f2fa20b01874599b66fb21ecce788273ffb245d9a**. The displayed receipt projection omitted the changes map to avoid output truncation, while hashing the complete bytes. The watch is embedded in the mathematical-source support.

Review was archive-first. All 16 final mathematical files and proof bodies were read. Explicit named inherited sources included archived worker172 FactoredRow/ThirdClosed, archived worker171 FibSecondRow/SecondRowEquation, and current ThreeSourceM9E2/ThreeRawM9E2, with their historical hashes checked. Current reads were bounded to exact closed-request or explicitly named inherited counterparts. No active worker174 or later mathematics was examined. No proposer contact, research suggestion or private user speculation was included.

Audit-owned Python performed file hashing, JSON/Lean/Python syntax parsing, literal-string comparisons and index-domain counting only. No project code was imported or executed. No Lean, compiler, checker, replay, finalizer, experiment, generator or CAS was run. No mathematical coefficient, binomial, polynomial product, gap, sign or certificate value was recomputed. All writes were under /private/tmp/math_gkm_godel_20261013; neither the project nor collatz was modified. Earlier audit seals and observation windows remain final.

## Exact mathematical source scope

For q natural and residue r, the inherited family has denominator b=3q+1 when r=true and b=3q+2 when r=false. Actual numerator-three paths have q≥1 and are exhaustively represented by this family through source_three_rawM9E2. The new source identity requires **q≥2**, k≥0, j=q+k+1 and the literal guard **2j+1≤b**. Set d=b−2j−1. Although Lean's exponent is a natural subtraction, this explicit guard prevents negative exponents being silently replaced by zero.

With A=X+1, the theorem source_band_factorM139 proves

    rawRow(threePoly(q,r),j) = lowerRow(b,j) + X² A^d Q(q,r,k).

source_band_coeffM139 proves the corresponding ordinary integer coefficient identity for **every natural column i**, including zero columns and tails. source_band_pathM139 quantifies over every actual path with numerator three, obtains its q,r and denominator, and carries that identity under the same q≥2 and exponent guards. It does not extend the new identity to q=1 or d<0, does not change the other numerators or directions, and does not prove a new global rational-coverage theorem.

rawRow is the coefficient of the swapped bivariate polynomial; its inherited raw_row_coeff theorem identifies its coefficient i with the original coeff P i j. Thus there is no horizontal/vertical swap in the conclusion. The numerator convention remains ordinary integer coefficients in u=x²,v=y²,w=1. There is no factorial/binomial normalization or arbitrary positive rescaling of raw coefficients.

The source derivation is symbolic, not fitted to finite division. fibBand is a finite binomial sum; under 2j+1≤n, fib_band_coeff and fib_band_factor establish the exact Fibonacci row factor X A^(n−2j−1) fibBand. The i=0 branch, the guarded Fibonacci support condition and binomial-zero tail are explicit. The forcing factor bandGain is derived from these rows. Q is defined by the signed recurrence

    Q₀ = 4G₀,
    Q₁ = 4G₁ + 2(1−X)Q₀,
    Q_(k+2) = 4G_(k+2) + 2(1−X)Q_(k+1) − A²Q_k.

Here subscripts on Q denote recurrence index; Q.coeff m below denotes a coefficient within that polynomial. Signed terms in this recurrence do not establish coefficientwise positivity.

The source proof uses the inherited exact discriminant-row equation, the first-row correction identity, the second-row equation and strong induction. It cancels the nonzero polynomial A², established nonzero through its constant coefficient; it does not divide by a possibly zero source coefficient or binomial weight. The inherited row equation is connected to the protected source recurrence by coefficient identities. No new Laurent-family completeness or homogeneity theorem is being inferred.

### Coefficients, degree and zero support

The final source proves degree(Q)≤k for all q,k,r, an exact constant coefficient for all q,k,r, and vanishing of coefficients beyond k. The constant is 2(k+1)²(k+2) for false and 2(k+1)(k+2)² for true.

Under q≥2 and the band guard, the first coefficient is given by a denominator-cleared integer identity 30 Q.coeff 1=bandLinear(q,k,r); it is separately proved nonnegative. In the band parameterization q=d+2k+1 (false) or q=d+2k+2 (true), the cleared expression is

    k(k+1)(k+2) [5(3k+e)d + 3(3k+f)(k+3)],

where (e,f)=(1,2) or (5,7). The second coefficient is given by 1260 Q.coeff 2=bandQuadratic(q,k,r). The quadratic identity is proved by the recurrence with checked polynomial algebra; finite rational interpolation only proposed its expression. The theorem does not assert all coefficients are nonnegative or all gaps have a sign.

The highest coefficient is 4 choose(q,k) for false and 8 choose(q−1,k) for true. The same source-domain guards ensure its strict positivity, yielding exact degree k. The correction polynomial X² A^d Q has its final coefficient at d+k+2 equal to Q.coeff k, and all later coefficients vanish. Its endpoint is strictly positive in the source band. The endpoint and tail equalities themselves are auxiliary identities available without the source guards; attaching them to the source and asserting endpoint positivity retains those guards.

These statements retain the final nonzero correction slot. They do **not** prove absence of internal holes or full coefficientwise positivity of Q. They are support statements about the correction term, not an assertion that the complete source row vanishes at the same endpoint.

### Conditional log-concavity transport

source_band_valueM139 maps the integer Q into a real polynomial and identifies source column s+3 with inherited factoredValue(d,j,s,Q). source_band_lcM139 concludes

    raw(s+3,j) · raw(s+5,j) ≤ raw(s+4,j)²

only with all of the following premises: q≥2 and the band guard; s≤j; c≥0; every coefficient of Q nonnegative; every coefficient Q_(m+1)≤c choose(j,m); and the explicit scalar robustness margin with B=choose(s+j+3,j), U=Q₀ d/(s+1)+c, kernelScale and topGap.

All casts and the final integer inequality are exact. The source identity is unconditional within its stated band; positivity, budget and margin are separate hypotheses of the LC criterion. Its starts begin at column 3 and have s≤j. No conclusion covering every natural start follows from this conditional theorem alone. No universally valid choice of c or universal margin is proved here.

## Actual-source auxiliary obstruction

The final theorem proposed_band_budget_falseM139 disproves the universal proposed specialization c=Q.coeff 1. It instantiates q=73, r=false, k=36, j=110, d=0 and coefficient index m=1. The saved checked statements are

    Q.coeff 1 = 21714264,
    Q.coeff 2 = 2390762400,
    110 · Q.coeff 1 < Q.coeff 2.

The wider saved diagnostic records the bound 2388569040 and excess 2193360. These values were read and cross-matched as literals; the auditor did not multiply or recompute them.

budget_witness_source_factorM139 attaches this factor to threePoly 73 false. budget_witness_actual_pathM139 identifies the actual path threePathM9E2 72 false, with label 3/221, and proves the raw triple at (2,110),(3,110),(4,110):

    [104044, 609161488, 879400499960].

budget_witness_valid_tripleM139 separately proves all three InPolygon guards and the exact positive gap **279581372844535904**. The lower-row coefficient calculations use the inherited lift representation and ordinary rational binomial identities; casts back to integers are exact. The failed early calculation used an incorrect small binomial index and is excluded from proof credit.

This is a genuine refutation of the proposed universal auxiliary coefficient budget, attached to an actual source rather than an arbitrary unrelated polynomial. It is not a refutation of raw LC, the root, or the transport with arbitrary c. The specific source triple satisfies LC. It supplies no new universal raw-LC region.

## Boundary reduction, with open premise

band_Q_shiftM139 derives an exact parameter shift under 2(k+1)≤q. Defining P(d,k)=Q(d+2k+1,false,k) or Q(d+2k+2,true,k), the final band_difference identity is

    P(d+1,k+1)−P(d,k+1)
      = P(d+2,k)−P(d+1,k)+X P(d+2,k).

This identity is proved for every natural d,k and both residues. band_nonneg_monoM139 proves nonnegativity and monotonicity in d **assuming** every boundary coefficient P(0,k).coeff i is nonnegative. It inducts in k, derives monotonicity using the preceding row's nonnegativity/monotonicity, and then propagates nonnegativity from d=0. band_nonnegative_iff_boundaryM139 is the exact equivalence between all-band coefficient nonnegativity and that boundary assertion.

BandBoundaryFormulaM139 is a **Prop definition**, not a theorem or axiom. For m≤k it states the displayed denominator-cleared boundary formula using (2m+3), two binomials and factor 3k+3−m (false) or 3k+m+6 (true). Its implication to boundary and then band nonnegativity is proved; the formula itself and the boundary positivity remain unproved. For m>k the conditional proof uses the separately established zero tail. The auxiliary parameterization includes d=0,k=0,false giving q=1; its constant base is handled directly, while the new actual-source formula continues to require q≥2.

Finite tests of this formula and a failed guessed derivative relation are not being promoted to universal proof.

## Unchanged root and residual

The pinned machine root remains MathGKM.Markov.Conjecture63, raw bivariate log-concavity in the three original directions with all original zeros and polygon guards. Root SHA256 is **8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe**; canonical contract SHA256 is **6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc**; raw contract SHA256 is **cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068**.

No new root equivalence is introduced. The inherited exact equivalence remains

    Conjecture63 ↔ ThreeBeyondThirdM964 ∧ OtherFourM9E2.

Both predicates remain open. In particular, the inherited numerator-three unconditional horizontal coverage is every natural start and every row satisfying **3j≤b+9**. This audit does not enlarge that universal region.

ThreeBeyondThird retains horizontal rows q<j excluding the already discharged rows 5,q+1,q+2,q+3; vertical obligations outside the union of ((i=3 or 4) and j+1≤q) and (5≤i≤8 and j+2≤q); and diagonal obligations outside 3≤i≤6 and j+2≤q. Diagonal indices are (i,j+2),(i+1,j+1),(i+2,j). OtherFour retains every actual path with numerator at least four. All natural starts, source zeros and both root endpoints are retained through the inherited equivalence. The original InPolygon guards ab≤bi+aj and i+j≤a+b−1 remain unchanged, including all three point-membership requirements. Neither a full-root proof nor its exact negation is present.

## Finite records: domain counts, not research reruns

Six final experiment scripts were statically parsed and read; none was imported or executed. Fifty-seven inherited script hashes were compared to sealed172 and the worker173 initial snapshot. The recorded experiments lack a separate atomic source-body-at-execution attestation; final script hashes, commands and result records agree, subject to the ordinary saved-record boundary.

- Direct source scan: q=2..16,20,24,32, both residues, 36 source cases. k ranges from 0 through floor((q−offset)/2), giving 211 rows. The independently counted index domains contain 11,860 raw coefficient positions i=0..b+4, 11,438 adjacent starts i=0..b+2, and 6,118 polygon-valid triples. The 5,320 zero values and absence of failures are recorded-only. The 770 budget and 595 residual-adjacent counts match full residual length k+1; the implementation trims zero tails, so those domain counts are explicitly conditional on that length. Twenty saved samples expose their lengths. The formal endpoint theorem is separate from the experiment, and no Python coefficient values were recomputed.
- Newton diagnostic: k=0..12 and both residues give 26 rows, 182 coefficient sequences, 1,092 input-index lookups and 910 saved Newton slots. No finite differences or coefficient signs were recomputed.
- Boundary diagnostic: k=0..50 and both residues give 102 rows and 2,652 positions if full residual length is retained. The guessed derivative test has 165 index cases, k=1..10, three q choices each, m=1..k. Only the first ten failures are saved by the code; ten is not its total failure count.
- Wider budget diagnostic: k=1..100, both residues at d=0, m=1..k−1, gives 200 rows and 9,900 index positions. The saved count 4,825 failures and first/first-ten records agree between the foreground diagnostic and retained reproduction. Their values were not recomputed. The first saved failure is q=63,false,k=31,m=3; the simpler m=1 formal witness is distinct.
- Scalar diagnostic: q=2..200 uses all k; q=256,512,1000,2000,10000 uses a sparse set of k values. s=7..min(12,j) yields 20,179 row choices and 120,931 scalar cases. The 120,686 passes and 245 failures are saved classifications. The ten uncapped failures with s≥8 all have s=8 and s≥d+k, putting source start s+3 beyond correction degree d+k+2. This is an index/support check, not a sign calculation or source-LC refutation. The proposed universal threshold remains unproved.
- Quadratic interpolation: two residues, k=2..7, three q values each give 36 input coefficient lookups. The subsequent witness search stops on a value-dependent condition; saved first witnesses have k=36. No interpolation or search was rerun. Its proposed formula is distinguished from the separately compiled symbolic theorem.
- The actual-source witness record and source theorem numeral strings, indices and literal path list agree; no raw coefficient, multiplication, gap, sign or binomial was recalculated.

Saved event outputs bind source scan72 (without sample arrays), Newton93 (counts/negative list and three sample rows), boundary160, margin184, initial budget200, interpolation213 and source witness236. The reproduced budget JSON equals the initial budget JSON; event236 prints the source witness rather than the budget JSON. Event282 writes the saved margin-support diagnosis. All stated failures and superseded guesses remain retained.

## Compilation, rejected versions and printed/replayed coverage

The final selected inventory has 16 modules:

FibBand, BandGain, BandRecurrence, BandShape, BandTransport, BandLinear, BandBudgetCoeffs, BandTop, BandLeading, FibShift, BandShift, BandBoundaryReduction, BandQuadratic, BandBudgetObstruction, BandSourceWitness and BandSupport, all with suffix M139.

There are 33 compiler receipts: 17 successes (16 final mathematical files and one Audit module), 16 return-code-1 failures, no compiler timeouts. Each mathematical module has one successful final source hash, matching its retained build snapshot, archived/current source, index, validation source hash and selected replay/axiom maps. There is no superseded successful source, selected-only unbuilt module, extra compiled-only candidate or pending new mathematical module.

The first rejected BandLinear version changed the false-residue statement of band_gain_linearM139: its rejected RHS was k(3kq−3k²+7k+4), while the accepted RHS is k((3k−1)q−3k²+8k−1). This is a corrected mathematical statement, not merely a proof repair. It received no successful proof credit in the rejected version. The first SourceWitness rejection also changes its import list before the final version; its theorem headers remain the same. The other rejected theorem-header comparisons do not show a change of statement. Missing lemmas/imports, natural-index normalization and failed proof calculations are all preserved.

One retained joint replay covers all 16 final mathematical modules and 67 explicit named declarations (56 theorems, 11 definitions). One Audit compilation/print pass covers all 56 theorem closures. The printed sets contain only permitted axioms: 53 closures list propext, Classical.choice and Quot.sound; three list propext and Quot.sound. Definition bodies are in the replay selection, but are not 11 additional named theorem-closure print results. Generated/private declarations and optional binary parts retain the established checker limitations.

## Inherited imports and method boundary

The direct inherited project imports are MarkovFactoredRowM964, MarkovFibSecondRowMC3E and MarkovSecondJet8934, plus implicit Init. The selected import base has 2,675 inherited modules, consisting of the sealed172 base of 2,669 plus six worker172 modules: CorrectionBudget, FactoredRow, LiftBudget, RobustCut, ThirdOutput and TwinKernel. The selected mathematical source closure has 2,691 nodes; including Audit gives 2,692.

Fourteen endpoints inherit 2,534 modules; BandTransport and BandSourceWitness inherit 2,675. All sixteen inherit the old worker121 **212** unreplayed-module backlog, including its **195** subset, plus the separate **19** historically accepted modules, as well as the old WindowLC and Abel validation boundaries. No whole-old-module recovery is performed here. The replay excludes explicit new selected names from its starting environment and checks their declarations over inherited compiled imports; it does not rebuild or independently replay the inherited bodies.

The source-hash support additionally pins 475 named older mathematical sources (323 imported, 152 comparison-only), 181 historical pending/other-status sources, two historical operational sources and 16 named external source/object pairs. Worker172 ThirdClosed and its root equivalence are historical comparison material outside this round's dependency graph; no new root endpoint is imported or proved. Comparison is not import, and import is not replay recovery. Worker166's seven unreplayed prefix candidates remain outside newly credited recovery; the inherited CorrectionFactor alone does not repair that history. Worker156's timeout and its distinct worker157 recovery remain separate. Worker171's missing_or_malformed_report / return1 / null-report outcome remains unchanged despite its saved mathematical validation and later preservation. Worker172's completed outcome and stronger 3j≤b+9 theorem remain available historically without changing its seal.

The isolated checker SHA is f2e304f85f1ae6d83383714316ffe3263e334d824fbacb399c4db436480d4216. It is an exact worker172 request/suffix retag, with the ordinary worker110 body after removal of the added isolation guard. The guard rejects base-present, unsafe and partial selected-suffix constants; its observed 67 names equal the explicit inventory. The validation/Audit wrappers and finalizer likewise retain their established method. Preparation selects fifteen then sixteen modules (adding BandSupport); this is one validation stage, not two accepted stages.

The finalizer's generic predicate requires successful matching-source replay coverage and permitted axiom prints for the selected theorem subset. It does not itself require a single joint replay, checker-hash equality, replay success-marker text, singleton build maps or exact theorem-name-set equality. The independent saved-record review establishes the actual stronger bindings in this run. Its lexical comment stripping and forbidden-token scan are not a complete Lean parser; version return codes are recorded rather than asserted, and no future-write lock is created.

The ordinary method limits remain: source snapshots/hashes are not an atomic compiler-read attestation; recorded object/source associations and wrapper outputs do not replace a fresh trusted rebuild; checker executables/optional binary pieces retain their inherited boundary; axiom-print coverage differs from replay scope; and finalizer validation is operational evidence, not a new mathematical proof.

## Finalization, timing and preservation

The recorded start is 03:31:41.344245 UTC, nominal deadline 04:01:41.344245, host finish 03:59:19.814574. The host elapsed is therefore 141.5296709537506 seconds under the 1800-second limit. The last selected mathematical build finishes at an estimated 03:57:19.308072. Joint replay runs approximately 03:57:55.075264–03:58:10.558352 (15.48308812500909 seconds), overlapping Audit compilation 03:57:55.075492–03:58:07.212360 (12.13686820899602 seconds). These estimates use receipt filename epochs and saved elapsed time; the axiom-JSON filename is not the Audit start time. All mathematical build bounds are 120 seconds, Audit100 and replay180.

Original validation, manifest and last-verification mtimes are 03:58:32.863650, 03:58:33.665642 and 03:58:33.671970. Their later archive-copy mtimes record retention, not execution. The final report file mtime is 03:58:51.359386, 169.98485922813416 seconds before the deadline. Event289 records finalizer success; event290 contains the structured report; event291 is turn.completed. The report equals final.json and the receipt report. There are 291 events / 1,536,634 event-log bytes, empty stderr, and a terminal record for every started item. These are completed-delivery records, not proof of root resolution.

All 7,340 initial input entries and all 187 predecessor artifacts are checked unchanged, with no owned-before-snapshot exception. Reconciliation preserves completed172 and the earlier171 failed-report history. Its predecessor event-history hash field is absent in this round's schema; this is recorded as a schema distinction, not fabricated or treated as a hash mismatch.

The controller/archive contain 142 files and the final manifest has 142 entries, with 140 common entries. Manifest and last-verification administrative records occur in the archive/controller; two opaque caches occur in the manifest/current exact-request scope but are absent from the archive/controller. Thus the initial current exact-request scope has 144 files. These distinct sets must not be flattened into a claim of identical inventories.

Two opaque manifest-matching caches were copied only into the separate temporary preservation bundle, without executing, disassembling or interpreting them. Discovery is not creation; mtime is not proof of producing process or source version. No successor attribution or validation upgrade is made. The original archive, index and controller records were not altered.

Required supplemental preservation paths are:

- /private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle.json
- /private/tmp/math_gkm_godel_20261013/markov_worker_000173_unarchived_cache_observation.json
- /private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle/research/__pycache__/band_experiment_139fed75.cpython-314.pyc
- /private/tmp/math_gkm_godel_20261013/markov_worker_000173_late_cache_bundle/research/__pycache__/validate_139fed75.cpython-314.pyc

The binary copies total 15,732 bytes: band cache 9,924 bytes, SHA db7d0ed69aab5a3749ffe323b70aa58c4fe0c2969bda359eb1587a027594a101; validate cache 5,808 bytes, SHA 502e449c3fb81c3c6ce65589e12cd7590b24ee2c392cf95280208394a6fe4edd. Source and copied bytes, mode0644, uid501, gid20 and mtime match. Separate metadata observation is 04:03:44.859112 UTC; copying is 04:03:44.859766–04:03:44.860408. Their manifest hashes match. Original mtimes are 03:38:07.972267 and 03:57:55.067763; no creation-time inference follows.

The previously documented COW storage operations affect metadata of specified older retained copies only, with hashes preserved. They are storage provenance, not proof recovery. No worker173 storage mutation was performed.

## Audit outputs

The seven supports are mathematical_source_hashes.json, source_structure_audit.json, finite_domain_audit.json, validation_audit.md, validation_evidence.json, replay_method.md and replay_method_evidence.json under the worker000173 prefix. The inherited_pair_expectations.json records independently authenticated inherited source/object pairs. static_audit_worker173.py is audit-owned and performs no research execution. The separate seal helper reads only the audit directory.

The own static helper passed its first execution. A later audit-only parser refinement preserved the full source_band_lcM139 statement, including its local let B/U margin binders: the earlier first-assignment delimiter truncated that displayed header, though its complete source body had already been read and hashed. The corrected proof-delimiter parser passed a second static run on the same named records; all counts and source/artifact hashes remained unchanged. H/F changed only their observation timestamp, while S also gained the full header. The mathematical conclusion and main scope were unchanged.

The validator's supplementary rejected-header parser first stopped before output on a term-style proof header; an explicit delimiter correction, with a no-prior-let-binder assertion, allowed the second pass to compare all 16 diffs. Its failed helper/hash is retained as audit-method provenance. Rejected project proof attempts are distinct from audit-helper development. No missing research check was supplied by auditors.

## Final audit observation

The method review closed its project reads after **208 named inputs** were unchanged over **2026-10-17 04:12:35.519967–04:12:35.574531 UTC**. Its separate absence record at **04:12:35.574543** is not applicable: all current mathematical modules have ordinary retained objects, and no new absence checks were performed. Twenty-two method audit-only input pins also agree.

The validation review closed its project reads after **10,700 named inputs** were unchanged over **04:14:57.648645–04:15:22.929620 UTC**. Its exact-request inventory and opaque-cache metadata observation at **04:15:22.941598** found **142 archive paths / 144 current paths**, with only the same two manifest-listed cache gaps separately retained, no other extra or missing paths, and matching bytes/mode/uid/gid/mtime. Its absence record is also not applicable, with no extension of earlier absence windows. Twenty-five validation audit-only input pins agree.

The two reviews agree on **74 shared fields, 2,675 inherited source/object pairs and 195 shared input hashes**, with no mismatch. The independent pair-hash observation at **04:03:32.511344–04:03:53.825408** remains a separately bounded earlier observation. The H/S/F parser refinement was rebound before either final window at **04:12:14.543296**, with old/new support hashes retained and source/result identities unchanged; no byte-diff claim is made for already-replaced preliminary audit files.

No project read is performed by the final integrity sealer. It reads only temporary audit files, verifies the final main hash and support consistency, binds both reviewers' distinct windows and all four supplemental retention files, and records final audit-files-only concurrence. It does not extend either project observation window, execute a missing research check or upgrade any historical host outcome. No necessary mathematical or provenance correction remains after the reviewed refinements. The full conjecture and the explicit residual premises remain open.

Final support bindings are:

| File suffix under markov_worker_000173_ | Bytes | SHA256 |
| --- | ---: | --- |
| mathematical_source_hashes.json | 383664 | bc26f94ae70721e321736a34451dc9b041bb24fae3aeb523114bcfa75178f9bf |
| source_structure_audit.json | 71814 | 9efaf7360f9ddc86ca342a0aaeb01e19641d8e3147b767b1e8d5f40c533f8e5f |
| finite_domain_audit.json | 93405 | 10bade3e88080660ef20f0f29e5c3f53c06837407cbd7290d81eb778f2e8ac0b |
| validation_audit.md | 24981 | c12ab74b34950000236dd2234a8429a68e3836656c10b381b8b0673d4485f86b |
| validation_evidence.json | 9802349 | e30ba3ffb490e2c67baf50e8677d302fd6d916ff12d2747863303753ea624669 |
| replay_method.md | 27540 | 78ad503c5e9ff13b17c7a02d1800daf1d9b792a51bb253a051c9336fc085c1a5 |
| replay_method_evidence.json | 17586104 | 12324be7291b08870cefe8a571d2b4dd9f605d8853a746e3495863b5562e0361 |
| inherited_pair_expectations.json | 2472867 | a8a5dcdb042b0cacb1cb0b55e946d9ab1996758299a153df25b24a1040931a2d |
| late_cache_bundle.json | 3048 | 5666af071337060a4cbcf5207e379733a976ac55fd8133033099759620ecd495 |
| unarchived_cache_observation.json | 2081 | bda2d733f431af26722372a13b7d38f54be65cf9de4a1685685d04416e1b45be |

Preservation requires the main, seven supports, pair map, two audit-owned helpers, integrity JSON and the four supplemental bundle files: **16 files in total**. The integrity record supplies their exact absolute paths and hashes. The standalone watch JSON is embedded in H and the seal; it is not an additional required preservation file.

