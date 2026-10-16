# Completed worker 000142: independent static monitoring audit

Request `6e1369de81764210b3799e9af43f1bb5`. This audit reads completed worker 142 archives and exact named prior/current counterparts. Active successor work is excluded. No project code, Lean proof, checker, replay, experiment, generator or finalizer was executed. No coefficient, binomial, polynomial, matrix, recurrence, moment or gap value was recomputed. The audit uses source reading, static declaration parsing, hashes and finite input/index-domain counts. All audit writes are confined to the designated temporary audit directory; no project edit, proposer contact or research assistance occurred. Prior audit seals and observation windows remain unchanged.

**Finding:** the newly formalized result is raw horizontal log-concavity at **every natural starting column** in the central row of every actual numerator-two source. For a = 2 and b = 2j + 1,

    A(i,j) A(i+2,j) ≤ A(i+1,j)²    for every natural i.

Actual-source classification derives j ≥ 1. Columns 0 and 1 and every column beyond j + 2 remain zero; the exact positive support is 2 ≤ i ≤ j + 2, equal to the original polygon section. An unbounded literal source family at starting column 3 satisfies all former residual guards, including exclusion from worker 141's column-2 triple. This is a proper extension of the earlier formal coverage.

Nine final mathematical modules contain 29 theorems and five definitions. The retained checks cover their final source compilation, all 34 explicit declarations in one joint replay, and all 29 theorem closures in axiom output. The new equivalence `Conjecture63 ↔ InteriorCore63M6E1` is validated. Its residual and the full conjecture remain **unproved**. The lower-row extension remains an unformalized formula candidate with a separate unresolved sign obligation.

The controller records completed, return code 0, with a structured final report and elapsed 1727.8650040626526 seconds. Host finish is 72.134996 seconds before the nominal deadline. This operational completion is not mathematical completion; the report's completion field is null.

## Final mathematical inventory and source family

| Module, with prefix Markov and suffix M6E1 | Theorems | Definitions | Formal scope |
|---|---:|---:|---|
| CentralBinomial | 4 | 0 | Finite hockey-stick, convolution, product and shifted convolution identities |
| FibGlobal | 1 | 0 | Fibonacci coefficient formula below the axis, including total-degree zeros |
| CentralFormula | 2 | 0 | Pair convolution and full central square formula |
| CentralValues | 5 | 2 | Integer row values, zero range and scaled consecutive identities |
| CentralLC | 3 | 2 | Polynomial ratio-gap certificate, exact gap identity and raw LC |
| SourceRow | 6 | 0 | Low-column zeros, square-sum formula and all-start actual-source row |
| CentralSupport | 5 | 0 | Exact positive support, polygon section and outside zeros |
| Residual | 1 | 1 | Exact updated root equivalence |
| CentralGain | 2 | 0 | Former residual guards and an unbounded newly covered family |

All nine final mathematical sources were read completely. Whole theorem headers were extracted through the proof assignment, preserving internal `let` binders. Independent enumeration agrees with the top-level axiom declaration map and all 29 names. The final sources contain no detected admission, custom-axiom, native-evaluation, unsafe or partial token after block-comment removal. This lexical review supplements the retained checks; it does not replace them.

The inherited theorem `source_two_squares3556` assumes only `(frame path).mid.a = 2` and supplies a natural q ≥ 1 with b = 2q + 1 and

    (frame path).mid.p = fib6(q+1)² + V·fib6(q)².

Its source connection uses the actual numerator-two path classification, product identity and Cassini identity. The separate conditional `source_two_of_product6` is not used to assume an arbitrary product is log-concave. The inherited `fib6` is defined from the actual run-matrix/source recurrence, with its total-degree bound and coefficient recurrence retained in the source chain. No paper coefficient formula or finite interpolation is a new assumption.

The public theorems `source_two_rowM6E1`, `source_two_row_formulaM6E1` and the support/zero adapters quantify over every finite Boolean source path. Their only family hypotheses are a = 2 and b = 2j + 1. They obtain q ≥ 1 from the source theorem, identify q with j, and write j = r + 1. The internal polynomial theorem uses `fib6(r+2)² + V·fib6(r+1)²` in row r + 1; the shift is explicit. There is no finite source, denominator, path-depth or starting-column bound and no remaining formula, positivity or gap premise.

## Full coefficient formula and zero-safe finite convolutions

`fib_globalM6E1` applies to natural n,l,t with l ≥ 1 and t < n:

    [u^l v^t] fib6(n) = choose(n−t−1,l−1) choose(t+l,l).

If l + t ≤ n, it specializes the inherited recurrence-derived formula with the natural complement n−l−t and explicitly rewrites the guarded subtractions and binomial symmetry. If l + t > n, the inherited degree bound makes the raw coefficient zero, and the binomial is separately zero because n−t−1 < l−1. Thus the theorem includes the out-of-degree range without extending a positive-range formula by assumption. It is not a claim about arbitrary t ≥ n; the later convolution proves its strict-below-axis hypotheses for every use.

CentralBinomial proves finite identities in natural numbers. The hockey-stick identity uses induction and Pascal. The unshifted convolution

    Σ(t=0,…,n) choose(t,r) choose(n−t,s)
      = choose(n+1,r+s+1)

uses induction, including r = 0 via finite reflection. The product identity is a specialization of the finite choose-product lemma. The shifted convolution assumes l ≤ r and b ≤ s, extends the full finite sum to n + l + b, and proves every added head/tail summand zero. Bounds from `Finset.range` justify the truncated natural differences. It is not an infinite-series or convergence argument.

For l,b ≥ 1, `central_pairM6E1` sums the product of the u^l and u^b coefficients of `fib6(n+1)` across t = 0,…,n. Both t and n−t are strictly below n + 1. Two choose-product rewrites give fixed factors `choose(l+b−1,l)` and `choose(l+b−1,b)`, and the shifted convolution gives `choose(n+l+b+1,2(l+b)−1)`. The positivity conditions l,b ≥ 1 supply both bounds required by that shifted identity.

`central_square_formulaM6E1` then uses the inherited exact bivariate coefficient multiplication formula, interchanges the finite sums and sums over l = 0,…,i. At l = 0 and l = i, the u⁰ coefficient vanishes because its row is strictly below the sole nonzero axis degree; the matching binomial factor is zero as well. For the interior terms, l and i−l are positive. Finite Vandermonde and guarded binomial symmetry finish the formula for every natural n and i ≥ 2:

    [u^i v^n] fib6(n+1)²
      = choose(2i−2,i−2) choose(n+i+1,2i−1).

The i = 0,1 cases are separately proved zero by the same finite convolution and axis-zero theorem. No positive-support restriction is silently used to discard a summand or a boundary column.

Combining the two squares in the source identity, with multiplication by V shifting the lower square's row by exactly one, gives the actual central-row formula. For every i ≥ 2,

    A(i,j) = choose(2i−2,i−2)
      · [choose(j+i+1,2i−1) + choose(j+i,2i−1)].

The formal source theorem expresses i = k + 2 and calls this integer expression `centralValM6E1 j k`. Unlike worker 141's full-row document, this identity and its source adapter are now accepted Lean declarations. Columns 0 and 1 have separate formal zero theorems. There is no position-dependent normalization of the raw coefficient function.

## Raw log-concavity and exact support

For natural q,k, the integer sequence `centralValM6E1 q k` is a product of natural binomial coefficients cast to ℤ, hence nonnegative. It is zero for k > q by explicit choose-zero bounds. The auxiliary value is

    E_k = choose(q+k+2,k) choose(q+2,k+2).

For k ≤ q, finite choose identities give

    (2k+3) centralVal(q,k) = (2q+3) E_k,
    (k+1)(k+3) E_(k+1) = (q+k+3)(q−k) E_k.

Natural subtractions are rewritten into integer subtractions only under the stated bounds. Combining these identities yields the consecutive cross-multiplied relation, for k + 1 ≤ q,

    A_k centralVal(q,k+1) = B_k centralVal(q,k),
    A_k = (2k+5)(k+1)(k+3),
    B_k = (q+k+3)(q−k)(2k+3).

These position-dependent factors are not presumed to preserve log-concavity. The proof instead establishes the exact integer identity

    A_k A_(k+1) (M²−LR)
      = (B_k A_(k+1) − B_(k+1) A_k) L M

from the two consecutive relations. When k + 2 ≤ q, it writes q = k + 2 + r with the **explicitly cast natural** r = q−k−2 ≥ 0. The bracketed factor has a saved polynomial expansion with positive coefficients. Ordinary `ring` proves that identity, and positivity proves its sign for k,r ≥ 0. This audit read the expression and proof without recomputing its coefficients. The experimental polynomial expansion is not a substitute for the formal identity.

Since L,M ≥ 0 and A_k A_(k+1) > 0, cancellation gives the original unscaled raw inequality. No coefficient or possibly zero mass is divided out. When k + 2 > q, the right endpoint R is zero and the inequality follows from M² ≥ 0; this branch includes triples straddling the final support point. The actual-source all-start theorem separately handles i ≤ 1 using the zero left endpoint, and writes i = k + 2 otherwise. All natural starts and both zero tails are retained. The formal result is non-strict LC; this audit does not promote the positive certificate to an additional unstated strict theorem.

`central_positiveM6E1` proves `0 < centralVal(q,k) ↔ k ≤ q` for all natural q,k. One binomial summand is strictly positive inside the range; outside it, the already proved zero formula contradicts positivity. The second summand is required only to be nonnegative, preserving its zero boundary case.

`central_polygonM6E1` directly unfolds the fixed `InPolygon` and proves

    InPolygon 2 (2q+1) i q ↔ 2 ≤ i ∧ i ≤ q+2.

The actual-source support theorem combines that section identity with the full formula and low-column zeros. It proves positive raw coefficients exactly on that polygon section. A separate theorem proves the coefficient is zero outside it; this does not merely infer zero from failure of strict positivity. The generic polygon identity holds for natural q, while actual source classification still supplies q ≥ 1. No fictitious actual source at q = 0 is introduced. The all-start LC theorem needs no polygon hypothesis and therefore covers every original polygon-guarded horizontal triple in that row.

## Proper added coverage and the exact remaining root

CentralGain reuses the literal inherited `centralPathM3A1 n = false^(n+4) ++ [true]`, with a = 2 and b = 2(n+5) + 1. For every natural n, put j = n + 5 and start at i = 3. The new guard theorem proves all three original polygon memberships at (3,j),(4,j),(5,j), the old horizontal total-degree guard 3+j+4 ≤ a+b−1, j ≥ 5 and a ≥ 2.

It also proves failure of the older square-margin, pair-or-variance and Sharp predicates. The Sharp branch keeps the exact natural quotient and zero forward smoothing exponent before proving the discriminant condition fails. Finally it proves the old worker-141 special family does not apply, because its start is required to equal 2. Thus these are actual obligations of the immediately preceding residual, not only points outside a loosely described earlier sufficient region. `central_gain_rawM6E1` supplies their raw inequality using the new all-start source theorem. The witness range is unbounded j ≥ 5; its first source is again 2/11 but its triple starts at 3, rather than the earlier start 2.

Independent static definition comparison reproduces `InteriorCore63M6E1` exactly from `InteriorCore63M3A1` by renaming the definition and replacing only

    ¬(m.a = 2 ∧ i = 2 ∧ m.b = 2*j+1)

with

    ¬(m.a = 2 ∧ m.b = 2*j+1).

Every other horizontal guard, all vertical and diagonal clauses, the original polygon tests and older sufficient-region exclusions remain byte-identical in that comparison. H still retains j ≥ 5 and i+j+4 ≤ a+b−1. V retains i ≥ 4, j ≥ 3 and i+j+4 ≤ a+b−1. D retains i+j+8 ≤ a+b−1, a+5 ≤ i+j+2 and a+2 ≤ b. All three polygon memberships and the exact raw directional indices remain present. The interior path condition is still a ≥ 2; endpoint treatment is retained through the inherited exact root equivalence. Reverse-factor ranges are not dropped.

The iff proof invokes the old iff, passes V/D through unchanged, and handles H by splitting on the full central-row family. In that family it applies `source_two_rowM6E1` with arbitrary natural i; otherwise it uses the new residual hypothesis. The forward implication simply derives the weaker old-family exclusion from the stronger new-family exclusion. No formula or sign obligation is assumed in this logical reduction. The new **equivalence theorem is validated; the residual and the full root remain unproved**.

## Finite experiments and the unformalized lower-row candidate

Both new experiment scripts and the residual generator were read and hash-bound without execution. The inherited 136 raw/source helper and scan.py were checked against exact archived/current and prior pins. The finite counts below are independently counted from input/index domains only. Coefficient values, binomial values, polynomial expansions, signs and zero counts remain saved numerical evidence.

The central probe uses 90 sources 2/(2q+1), q = 1,…,90. For each it checks columns i = 0,…,2q+4, giving **8640 coefficient identities**. It then checks starts i = 0,…,2q+2, giving **8460 raw triples**, with **4455 zero-containing triples reported**. The zero count was not reproduced. There are also **149 source-polynomial comparisons** from the source generator with denominator bound 22; this input-label domain was counted as reduced fractions 1 ≤ a < b ≤ 22 without generating any polynomial. These 149 are comparisons across that general source domain, not 149 numerator-two central rows.

The probe uses assertions for the formula, triple and source comparisons. Its failures list is initialized empty and never appended; an empty list alone would not certify those checks without the saved successful command. Event 99 has return code 0 and emits a gap-polynomial line followed by the exact retained experiments.json object. experiment-progress.json equals that object with only the final runtime omitted. The saved runtime is 30.653621790988836 seconds. The fifteen saved gap-polynomial terms match the command output text; this audit did not reevaluate the polynomial.

The offset probe uses q = 1,…,30 and d = 0,…,q−1, with row j = q−d. Its **30 sources, 465 rows and 21235 coefficient positions** match static counts; each row tests i = 0,…,2q+4. This includes d = 0 central rows, as well as lower rows, and excludes row j = 0 and upper rows. The saved **6820 zero values** were not recomputed. The script appends formula mismatches to a list and does not assert that it is empty; the saved list is empty and event 197 emits exactly the retained JSON with return code 0. Process success alone would not imply absence of mismatches. Saved runtime is 0.4305657499935478 seconds. This probe checks coefficient identities only, with no log-concavity or sign test.

The candidate lower-row formula is explicitly unformalized. Its prose expands finite Vandermonde sums with additional indices and then proposes a single sum over h = 0,…,i−2. It identifies outstanding reindexing and zero-tail bounds, including the original e ≤ b−1 and f ≤ l−1 conditions that cannot simply be replaced by truncated natural subtraction. Even a proof of that candidate identity would leave the sign/LC argument for its positive sum unresolved. No lower-row theorem is in the accepted inventory, and no full numerator-two WeakLC result is inferred.

The separate symmetry command, events 165–166, compares each raw source at q = 1,…,7 with the homogeneous v/w exchange `(i,j) ↦ (i,2q+2−i−j)`. It prints seven false outcomes and exits 0. Events 170–171 then manually write those outcomes to symmetry-probe.json. That record is a later transcription of the finite output, not a standalone universal symmetry theorem or an automatic runtime binder. The failure of this uncorrected exchange is not a counterexample to raw LC or the root conjecture.

Neither new numerical result contains an internal input-hash map, and no experiment-bindings.json is supplied. Index/controller hashes, exact event associations and separately checked helper/scan hashes are distinct from invocation-start interpreter authentication or a complete transitive runtime attestation. source-use.json records the worker's own publisher retrieval; this audit did no new literature search and no retrieved assertion becomes a new axiom.

## Retained validation, replay boundary and chronology

### Final-source acceptance and unsuccessful versions

There are 21 numbered compiler receipts with 21 immutable source snapshots. Ten successful builds cover the nine final mathematical modules and one Audit. The **eleven unsuccessful builds consist of nine return-code-1 errors and two wrapper timeouts**. No superseded successful source, same-final rejected snapshot, snapshot-only invocation, new unbuilt module, compiled-only remainder or unsuccessful replay is found. The lower-row document is an unformalized candidate, not an omitted accepted Lean module.

The rejected inventory is three CentralBinomial attempts, one FibGlobal, two CentralFormula, one CentralValues, three CentralLC and one CentralSupport. The first CentralBinomial snapshot, build `1792155296505361000`, has only three theorems and lacks the later `shifted_binconvM6E1`. The other ten unsuccessful snapshots retain the final explicit declaration inventory. Thus matching final declaration names cannot be claimed for every failed version.

The second Binomial and first Formula snapshots have parser errors around unspaced inequalities. Whitespace-normalized header equality is not parsed-statement equivalence for an invalid draft. Other edits concern proof syntax, simplification/rewrite orientation, casting, diagnostics and elaboration settings. No rejected source contains literal sorry/admit. Diagnostic partial output is not successful proof validation or a mathematical counterexample.

The two CentralLC timeouts, builds `1792155799598535000` and `1792155921595377000`, last 150.179814 and 150.189366 seconds. They overlap by an estimated 28.182972 seconds and target the same mutable source/output paths. Their immutable snapshots are pre-invocation observations, not continuous source-identity attestations during that overlap. Both attempts remain unsuccessful. The subsequent CentralLC build `1792156110581041000` exits 1 with Lean heartbeat exhaustion; it is **not a third wrapper timeout**. Its two diagnostic `#check` lines are not an axiom audit.

The final successful CentralLC build begins after all three earlier failures have finished by retained estimates. The early snapshots use maxHeartbeats 3000000; the third failure and final source use 300000. Final source adds local irreducibility attributes for the value/auxiliary definitions, removes diagnostics and fixes proof-body elaboration, including the explicit natural-difference cast. These are elaboration/resource settings, not added mathematical assumptions or a replay bypass. The final object/source association and later joint replay establish accepted evidence separately from the failed attempts.

The sole joint replay selects all nine final modules and all 34 explicit declarations. One Audit imports the final modules and prints each of the 29 theorem names exactly once. **Twenty-seven closures use `{propext, Classical.choice, Quot.sound}`; `central_aux_stepM6E1` and `central_zeroM6E1` use `{propext, Quot.sound}`.** All are within the permitted set. The five definitions participate in replay without adding theorem-print rows. All current dependency builds precede dependent successful builds, and all nine final mathematical builds precede the replay and Audit.

### Checker, imports and inherited trust

The driver SHA256 is `be465f5f990edddf348d402776c8db0dfb2927beea783c0b3c1acd7d4896d2ac`. It is an exact worker 141 suffix retag, with the ordinary body matching the retained Wide replay driver after the documented guard/entry normalization. Validation and Audit wrappers are exact retags. Saved checks use Lean 4.32.2, compiler `-j 1`, replay stack 131072, a joined Lean task and propagated result. Audit retains a 180-second timeout. The successful replay is invoked with a 240-second timeout argument; this changes the bound, not the checker core, parser or failure handling.

The checker gathers selected module-data constants, constructs the inherited environment without selected modules in its direct-import union, and invokes ordinary `env.replay`. Its guard rejects selected `MathGKM.Markov.*M6E1` declarations already imported or marked unsafe/partial. All 34 explicit declarations match that predicate, are absent from the inherited base and have no duplicate or selected-name collision. Generated/private constants outside the predicate retain ordinary replay handling. This audit does not decode every compiled part, authenticate external compiler/Lean/Mathlib binaries, rebuild all inherited sources or freshly replay inherited bodies.

The wrapper observes selected-source hashes before invocation, checker-source hash after replay and Audit source maps after compilation. Compiler commands target the research source rather than the immutable snapshot. Matching saved observations therefore do not establish uninterrupted source immutability or invocation-start executable identity. The actual final source, successful snapshot, retained object, replay map, requested names, compiler stdout and axiom JSON agree independently.

The joint base has **2423 inherited local modules and zero current selected modules**. Its five explicit direct imports are MarkovCentralSquareM3A1, MarkovCentralWitnessM3A1, MarkovResidualM3A1, MarkovSquares3556 and MathGKM.Markov; implicit Init gives six total direct imports. The accepted local mathematical closure has **2432 = nine new + 2423 inherited** modules; adding Audit gives 2433. The operational driver and external library trees are excluded. No local import cycle or source-resolution failure is found.

No individual new root imports all nine current modules. Residual has 2429 local nodes (seven new, 2422 inherited), excluding CentralSupport and CentralGain. CentralGain has 2431 (eight new, 2423 inherited), excluding the new Residual. The support/gain theorems are separately selected and audited; they are not required imports of the new iff. The inherited Lean path has 143 entries behind the current directory; this is a path count, not active-successor inspection.

All **2423 exact inherited source/object pairs** match sealed worker 141, before-142 and current hashes. They comprise 2417 inherited pairs plus six accepted worker-141 modules: FibLow, CentralSums, CentralSquare, SourceCentral, Residual and CentralWitness M3A1. CentralLinearM3A1 is omitted. The five dropped worker-141 inherited nodes are MomentSlackM553, LinearCenterM553, SourceLinearM553, SourceLinearValueM553 and SourceMomentM37B. Consequently no accepted mathematical module from worker 140 enters this batch's import closure. RawPrefixM10D remains absent. No older fallback or guessed object path is used. The complete pair check ran from 13:23:44.409993 to 13:24:10.785039 UTC; preserving these bytes is not fresh inherited-body compilation/replay.

Of the mathematical review's 57 named older comparisons, 42 are imported and 15 are comparison-only: CentralLinearM3A1; all seven accepted M553 modules; SourceMomentM37B, SharpWitnessM37B and SupportObstructionM37B; VarianceWitnessMAC3; InteriorWitnessMF1E; SourcePrefixM10D and RawPrefixM10D. Scope comparisons are not misreported as current proof dependencies.

The old worker-121 backlog is unchanged: **all 212 compiled-but-unreplayed modules, including the 195-module subset, remain inherited compiled dependencies**. None is rebuilt or selected here; recovery remains zero. Its 19 historically accepted modules are inherited, while its unbuilt drafts are absent. All 23 worker-134 modules recovered in worker 135 retain that later provenance without a new current check. Old HighCone2GapM81F and three unbuilt worker-134 drafts remain excluded, distinct from the MF25 replacement. Four accepted worker-136, six worker-138 and six worker-139 modules are inherited; the earlier witness/obstruction omissions and failed SmoothProbe remain omitted. No historical timeout, failure or missing check is upgraded by inheritance.

The old late worker-134 Audit receipt `build-1792141544717794000.json`, SHA256 `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, is before-142-pinned but outside the current initial preservation manifest/index. Its separate retained late bundle remains a timeout failure. No backdating or successful old Cone2Gap replay/print is inferred.

### Finalizer, preservation and reports

The finalizer retains the 141 schema: top-level replay, axioms and theorem_closures; per-module source/object hashes and successful build-receipt arrays. It writes the literal nine-module list, requires matching final-source successful builds, and requires exact equality of the whole nine-source map in a successful joint replay and axiom JSON. It does not separately enumerate per-theorem membership, parse permitted axiom sets from stdout or enforce a pinned checker hash. Those actual name/source/output checks are independently supplied by the retained validation audit. Its lexical list omits unsafe/partial, which are separately covered by the selected-name guard and final-source inspection here. Independent enumeration confirms the fixed list omits no archived current mathematics.

The raw validation file has no completion field or per-module theorem lists. A labeled compatibility projection is used only for audit comparison; it does not rewrite the retained record. Null mathematical completion comes from final-check and reports. validation.json is written before preservation assertions, so its mere existence would not establish later preservation success.

All **6107 initial entries**, including this request's own setup source and 155 Python cache files, are preserved without exclusions. “Initial” does not mean every entry predates the request. The snapshot covers the named source/configuration paths, not every old compiled object; inherited-object checks are separate. Reconciliation checks the latest worker-141 index's 75 entries and six inherited bindings, and separately preserves the controller-listed effects of worker 136 (88), worker 137 (zero) and worker 141 (77): 165 artifacts in total. Receipt projections remove only `changes`, retain the last two events and check effects separately. Earlier timeout/stopped/completed statuses are not rewritten and no cause or authority for the old stop is inferred.

The finalizer asserts initial preservation and the fixed root/canonical contract. It records terminal index/prior mismatch lists without asserting they are empty. Both saved lists are empty and independent hashing agrees. Its selector can include files absent from the initial inventory or matching this request/suffix; only the actual completed-request inventory is reviewed here. STOP=false is a historical recorded observation, not a current controller assertion. last-verification records counts, manifest hash, empty mismatch lists and null completion, without echoing root/contract hashes. final-check has no finished_utc field. No experiment-bindings file is generated.

All **93 controller-listed artifacts** match archive/current bytes. The index contains 91; manifest.json and last-verification.json lie outside it. Composition is ten objects, 38 JSON files, 32 Lean files (eleven final sources plus 21 snapshots), seven Python files and six Markdown documents. The corresponding source/object/snapshot inventory is consistent with the accepted/rejected partition above.

Unlike worker 141, this finalizer does **not** create report.json. File-change events 198–199 add the draft first. The sole finalizer invocation, events 200–201, returns 0 and reports the final 91-entry index. Events 202–203 read back the saved verifier and replay output and observe STOP absence; they do not rerun proof checks. The source-definition comparison at events 187–188 is likewise separate from actual successful compilation/replay of the iff theorem.

Draft report SHA256 is `1d7275f9c4443621147e0579115d33eac60fcc3f834d4aacb4afceaa82e2797c`. It differs from the delivered report in actions, agenda and observations only; summary matches. Structured event 204 parses exactly to final.json and the controller report, and event 205 records turn.completed. final.json SHA256 is `c76311700b6dfcafcc886912a33a383e09a852256838d8677428c89251bbde0c`. Both reports have null mathematical completion. A completed worker does not admit the root.

### Exact chronology

All times are UTC on 2026-10-16. Controller start is 12:52:06.909301; nominal deadline is 13:22:06.909301. Finish minus start exactly matches the saved elapsed 1727.8650040626526 seconds.

| Retained milestone | Time |
|---|---|
| Controller start | 12:52:06.909301 |
| Last mathematical build finish estimate, CentralGain | 13:15:36.379300 |
| Joint replay start | 13:16:10.075924 |
| Audit start | 13:16:10.079663 |
| Joint replay finish estimate | 13:16:57.110369 |
| Audit finish estimate | 13:16:59.490718 |
| Draft report project mtime | 13:19:36.181831 |
| Mathematical module list project mtime | 13:19:36.271668 |
| validation.json project mtime | 13:19:36.282503 |
| final-check.json project mtime | 13:19:37.200712 |
| manifest.json project mtime | 13:19:37.279568 |
| last-verification.json project mtime | 13:19:37.413763 |
| events.jsonl mtime | 13:20:22.082042 |
| final.json mtime | 13:20:23.062271 |
| Activity heartbeat content | 13:20:23.087147 |
| Archived verifier copy mtime | 13:20:54.760911 |
| Controller host finish | 13:20:54.774305 |
| Nominal deadline | 13:22:06.909301 |

Audit starts 3.739 milliseconds after replay and finishes 2.380349 seconds after it. The checks overlap; axiom printing does not imply replay was complete when Audit started. Replay and Audit finish estimates are respectively 309.798932 and 307.418583 seconds before deadline. The final verifier write is 149.495538 seconds before it; final.json is 103.847030 seconds before it; host finish is 72.134996 seconds before it. No indexed project artifact is observed after the deadline or host finish.

Receipt finish estimates add saved monotonic durations to pre-invocation filename timestamps; they are not independent wall-clock process-exit attestations. File mtimes are retained write observations. The event-log mtime is not an individually timestamped final event, and the archived verifier copy time is distinct from its project write. All 205 events and 95 started items have matched completions. The 385744-byte event log plus empty stderr agrees with activity accounting; heartbeat content is not confused with the activity file's filesystem mtime. This is retained-record accounting, not a fresh process census.

The fixed root SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; compact sorted ASCII canonical contract is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Final manifest SHA256 is `33df1760652d55c8ccb0b55961bf07c67d3cadf346f3bfdbbbb051d5487a0d14`; verifier is `ff352b732b20ae94069c23676cea0f6f38dffeb4d63f3f367cf914442bd46d61`. These bind unchanged targets and evidence, not root completion.

## Final observation and supporting audit files

The final method pass found all **107 inputs unchanged from 13:30:35.714563 to 13:30:35.784328 UTC**. Final validation rehashed **9076 inputs from 13:31:51.983791 to 13:32:16.300819 UTC**, with no changed or missing input. The exact-request current/archive observation at **13:32:16.309256 UTC** found no extra or missing worker-142 file. No new late bundle or missing preservation file is required. Project reads end at that observation; subsequent crossreview and sealing use audit files only. No historical observation window is extended.

The main audit and these seven supports are bound by `markov_worker_000142_integrity.json`. All files below are in `/private/tmp/math_gkm_godel_20261013`.

| Support | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000142_mathematical_source_hashes.json | 34302 | `64b721be32627b5b1160cfe4b23800a80b5817d484fa8cee8b57ae2873dce140` |
| markov_worker_000142_source_structure_audit.json | 17118 | `1c5f1b15fcb7c9e6e29fe4e30faa391731ae66f2ff13b3b14ebc9f505da1d1c9` |
| markov_worker_000142_finite_domain_audit.json | 135470 | `888385eb05aa4f990c2359e4b4328cde8eb6604dea35ecdce5128ff256356bd7` |
| markov_worker_000142_validation_audit.md | 22325 | `49b2835426d60d3f34e4238c9dcaf74a6cf1d80f0c35d49a226b65ad55344cbd` |
| markov_worker_000142_validation_evidence.json | 6322800 | `2c47329f594861d75a759d51aca27db24afc1c96172d35251ad3b40fadf89164` |
| markov_worker_000142_replay_method.md | 19362 | `30115a3cd70c9007143e684b9e5f27e9c44aaf674112ce116216e330401bab59` |
| markov_worker_000142_replay_method_evidence.json | 8450389 | `a22e6cec42d2fdccc155ec25339a578bdfc06d7320f9fcd9bddafb1aea9e36e6` |
