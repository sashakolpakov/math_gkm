# Independent monitoring audit: completed worker 000150

Request `4f4ac079ee56466da7d21ce9055918ab`, archive `/Users/sasha/math_gkm/.control/markov/workers/000150/artifacts`. The retained work proves **exact lower/upper prefix formulas and a common kernel for actual numerator-two raw coefficients in columns i≥3, including zero tails**. It also proves conditional kernel-to-source log-concavity implications and an exact finite-per-column reduction of the earlier Newton sign premise. **The kernel shape conditions and uniform Newton signs remain unproved; no new unconditional raw LC region is established.** The exact residual remains `InteriorCore63M295`, unchanged, and Conjecture63 remains open.

All **seven final mathematical modules, 70 theorem closures and eleven definitions** have matching successful compiler, joint replay and axiom records. There are no final pending mathematical modules, compiled-only modules or superseded successful versions. Eight earlier compiler attempts failed with return code 1; none was a wrapper timeout. Those earlier snapshots are retained separately from the accepted versions.

The worker completed with return code 0. Stored elapsed is **1784.50137424469 seconds**; the retained timestamp difference is **1784.5013732910156 seconds**, differing by about 0.954 microseconds. Host finish was **15.498626709 seconds before** the nominal controller deadline. This is successful completion of the research turn, not mathematical completion of the root.

## Review boundary

This review is archive-first and static only: completed source and record reading, byte hashing, declaration parsing and input-index counting. It executed no project program, proof, Lean compiler, checker, replay, experiment, finalizer or generator and recomputed no mathematical coefficient, binomial, recurrence, polynomial, moment, gap or finite-difference value. It made no project/source/machinery changes and provided no research help or proposer contact. Active worker 151 was not inspected. All writes are confined to `/private/tmp/math_gkm_godel_20261013`.

The mathematical review read all seven accepted sources and proofs, three experiment scripts, six documents and the relevant explicit completed inherited source bridges. It binds 148 named older mathematical sources to before-150 and sealed149 pins, without implying new replay. Exact named external library identities remain subject to compiled-import trust. The validation and method companions independently review snapshots, objects, selection, printed closures, import boundaries, preservation and chronology. Earlier seals and observation windows are unchanged; the disclosed worker-148 search exception was not repeated.

## Prefix formulas and exact hypotheses

Write `L_i(j,d)=lowerValM58E j d i`, `U_i(N,d)=upperValM2B3 N d i`. The new bases are the original integer binomial products

    B(i,j,d) = C(j+i,i) C(j+2d,i−2),
    D(i,N,d) = C(N+2d+i,i) C(N,i−2).

All indices use the source's natural-number subtraction convention. For **i≥2 and all natural j,d**, `lower_prefixM4F4` proves

    L_i(j,d) = B(i,j,d) + 2 Σ_{t<j} B(i,t,d).

The first-difference proof requires `h+2≤i` only inside the sum `h<i−1`, where it follows from the range. Pascal and binomial-product identities reduce the difference to two binomial products. The inherited exact Vandermonde sum includes all natural zeros. The initial j=0 proof retains h=i−2 and proves the other summands zero; induction gives every j. Its actual-source adapter requires `a=2`, `b=2(j+d)+1` and i≥2, with no support/nonzero/formula premise left over.

For **i≥2, d≥1 and every natural N**, `upper_prefixM4F4` proves

    U_i(N,d) = D(i,N,d) + 2 Σ_{t<N} D(i,t,d).

Here the first difference uses h≤i from the finite sum. The rising-binomial convolution is obtained by applying a coefficient map to the formal power-series identity `geo(1)^(a+b)=geo(1)^a geo(1)^b`. The general rising sequence handles exponent zero; conversion to ordinary choose uses positive exponents. This is formal power-series algebra with finite coefficient sums, not an analytic convergence claim.

The upper initial N=0 proof explicitly splits i=2, using three h cases, from i>2, where the relevant binomials vanish. Thus the arithmetic upper prefix covers N=0, but **the actual-source upper-prefix adapter still requires N≥1 and d≥1**, as does its inherited source formula. Equality of an arithmetic expression at N=0 does not extend that source adapter automatically.

No prefix proof introduces a factorial normalization of target coefficients, cancels a possibly zero term, or assumes a log-concavity inequality. Casts identify natural binomials with their integer values, including zeros.

## Common kernel, source range and support

The literal Lean definition is

    K_i(j,m) = C(j+i,i) C(m,i−2)
      + 2 Σ_{k<min(j,m)} C(j−(k+1)+i,i) C(m−(k+1),i−2).

Every subtracted index in the sum is guarded by k+1≤j,m. The Python experiment's weighted sum from k=0 to min(j,m), with weight 1 at zero and 2 otherwise, uses the same index convention after separating its first term and shifting the remaining index. No extension to negative arguments is silently used in the formal kernel.

Finite sum reflection proves `L_i(j,d)=K_i(j,j+2d)` for i≥2 and `U_i(N,d)=K_i(N+2d,N)` for i≥2,d≥1. The bounds justify all natural subtraction rearrangements. These identities cover whole prefix sums, not only individual summands or finite samples.

`source_two_kernelM4F4` quantifies over every actual source path with `a=2`, `b=2q+1`, **i≥3** and **j≤2q**, concluding exactly

    coeff p i j = K_i(j,2q−j).

The inherited source classification ensures q≥1 for actual numerator-two paths, and canonical paths realize all such q. There is no denominator/path-length bound, polygon restriction or sign premise. The proof splits lower j≤q, upper j>q with N=2q−j≥1, and the edge N=0. In that last case j=2q; i≥3 places the raw point outside the original polygon, while the kernel's support theorem also gives zero. **This is why the formal unified source theorem explicitly starts at i≥3.** It does not prove the prefix-derivation document's earlier i≥2 candidate at that edge.

`source_two_kernel_outsideM4F4` proves the raw coefficient is zero for i≥3 and j>2q by the original outside-polygon theorem. Together the two statements cover every natural row, including upper/lower crossings and zero tails, without changing raw coefficients or suppressing zeros. The original polynomial still represents u=x²,v=y²,w=1 with the inherited homogeneous-degree interpretation.

The kernel itself is nonnegative for **all natural i,j,m**. It is zero when m<i−2 and strictly positive when i−2≤m. The latter follows from the initial summand, whose two binomials are positive, plus a nonnegative tail. These two statements characterize its support, with natural i−2 retained even for i=0,1. No restriction on j or additional interval-support premise is hidden in the subsequent argument.

## Conditional shape argument and direction map

`KernelShapeM4F4 i` contains three unproved, universal natural-index predicates:

| Predicate | Exact inequality |
|---|---|
| Row LC | `K(j,m) K(j+2,m) ≤ K(j+1,m)²` |
| Column LC | `K(j,m) K(j,m+2) ≤ K(j,m+1)²` |
| Adjacent minor | `K(j+1,m) K(j,m+1) ≤ K(j,m) K(j+1,m+1)` |

The scalar glue theorem assumes b,e,f,z≥0, c>0 and `ac≤b²`, `zc≤f²`, `bf≤ec`. Multiplication gives a bound after multiplying by c², and strict positivity permits cancellation. It does not assume a>0 or cancel any unproved nonzero coefficient.

For the kernel application, m<i−2 makes the last endpoint `K(j+2,m)` zero and finishes by a square's nonnegativity. Otherwise the support theorem proves `c=K(j+2,m+2)>0`; the two LC premises and adjacent minor supply the scalar inequalities. Therefore `KernelShapeM4F4 i` implies

    K_i(j,m+2) K_i(j+2,m) ≤ K_i(j+1,m+1)²

for all natural i,j,m. No zero case is omitted from this conditional theorem.

Under the source identity, set m=2q−j−2. The kernel anti-diagonal triple maps to **the original source vertical triple** `(i,j),(i,j+1),(i,j+2)`. It is **not** the source's constant-i+j diagonal direction. The actual-source vertical adapters explicitly require **i≥4**, even though the coefficient identity is valid for i≥3. If j+2>2q, the last source coefficient is zero; otherwise all three kernel substitutions are within range. Both crossing triples and tails are covered.

The formal root implication assumes `KernelShapeM4F4 i` for every i≥5 **including i=8**, together with unchanged `OtherVerticalCoreM0D3`. It uses the inherited exact region/source equivalence. This is sufficient only, not an equivalence or a proved shape theorem. The remaining horizontal/diagonal and other-numerator obligations stay explicit. The document's convolution/Toeplitz/Cauchy–Binet derivation remains a proposed argument; its unproved formal bridges are not inferred from the accepted scalar glue or finite scans.

## Finite-degree Newton reduction

`PolyBoundM4F4 F n` means there exists a rational polynomial of natural degree at most n whose evaluation equals F at every rational input. `SeparateBoundM4F4 f m n` supplies such a bound in x for each fixed natural y and in y for each fixed natural x, agreeing with the integer function through casts. It need not supply a single joint polynomial.

The source proves compatibility of unit forward differences with Nat→Q and Int→Q casts, and commutation of the two difference operators. The pinned Mathlib `Polynomial.fwdDiff_iter_eq_zero_of_degree_lt` applies to evaluation of a polynomial over a commutative ring and gives zero above its natural degree; its exact source statement was inspected. Injectivity of the integer cast transfers that result back to the original integer sequence. Commuting differences handles the second-coordinate cutoff without an unjustified interchange of assumptions.

Consequently, `newtonCoeffM295 f r s=0` whenever r>m or s>n. The accepted theorem is an **exact equivalence** between nonnegativity of all mixed coefficients and nonnegativity on `0≤r≤m, 0≤s≤n`, conditional on the proved separate degree bounds. The zero polynomial and constants are covered by the natural-degree bounds. This establishes no sign value inside the rectangle by itself.

`MarkovRegionDegreeM4F4` proves the lower and upper rational coefficient expressions have separate x-degree at most 2i and y-degree at most i, for every natural i and rational fixed other coordinate. It uses finite sums, products and affine substitutions of the binomial polynomials. The bounds are sufficient upper bounds, not asserted minimal/exact degrees or positivity of rational extensions.

`MarkovGapDegreeM4F4` transports those bounds to the **precise inherited integer gap functions**, preserving every shift. The lower cast identity holds for all natural i,x,y; upper and crossing identities require i≥1, using positive upper d offsets. In rational expressions the quantities i−1 and i−2 are explicitly **natural subtractions cast to Q**, not rational subtractions with potentially negative values. This distinction is retained even at i=1.

The separate bounds are (4i,2i) for lower and upper gaps, and (4i,0) for each crossing. For i≥1, the exact theorem is

    FiniteNewtonVerticalM4F4 i ↔ NewtonVerticalM295 i.

The finite predicate checks r≤4i,s≤2i in each interior gap and r≤4i,s=0 in each crossing. Every coefficient outside those ranges is formally zero. The checked range has been proved sufficient; its signs have **not** been proved uniformly.

The resulting root implication assumes this finite predicate for **every unbounded i≥5 except i=8**, together with `OtherVerticalCoreM0D3`. The excluded i=8 case uses worker149's accepted direct proof through `root_of_remaining_newtonM295`. This differs from the shape implication, whose stated premise includes i=8. Finite per column is not a fixed finite computation that resolves the root, and the earlier Newton sign predicate remains stronger than merely source LC.

## Unchanged root residual and continuation limits

`MarkovResidualM295.lean` matches its before-150 and archived149 bytes exactly. No new residual module or exclusion appears. All earlier actual-path quantifiers, raw triple indices, three-point polygon guards, natural zeros, degree/boundary guards, original diagonal conditions and endpoint handling remain in the inherited root/equivalence chain. The accepted conditional theorems do not remove any of them. Both the exact residual and full root remain unproved.

The continuation experiment extends a binomial expression to a negative offset and records 55 versus 47 at i=2,N=2,d=1. A correction depending on i,d and a positive coefficient expression are conjectured from finite data. **Neither continuation identity nor correction formula is formalized here.** The mismatch is an auxiliary continuation failure, not a source log-concavity counterexample, and those values were not recomputed by the auditor.

## Finite-domain audit

All following counts come from loop-index enumeration or parsing saved records, not recalculation of coefficients or inequalities.

| Final record | Exact domain | Count |
|---|---|---:|
| Actual-source coefficients | q=1,…,40; i=3,…,24; j=0,…,2q+4 | 40,480 |
| Actual-source vertical triples | same starting positions, ending at j+2 | 40,480 |
| Direct path recurrence comparisons | q=1,…,16 | 16 |
| Lower kernel identities | i=2,…,24; j=0,…,24; d=0,…,11 | 6,900 |
| Upper kernel identities | i=2,…,24; N=0,…,24; d=1,…,11 | 6,325 |
| Kernel shape inequalities | i=2,…,24; j,m=0,…,31; three inequalities | 70,656 |
| Kernel anti-diagonal triples | same starts, one triple | 23,552 |
| Continuation comparisons | i=2,…,24; d=1,…,12; N=0,…,19 | 5,520 |
| Positive-correction comparisons | i=2,…,24; d=1,…,12 | 276 |

The 13,225 lower/upper identities are counted correctly by the final script. Its stored kernel table covers j,m=0,…,33, so all shape and anti-diagonal lookups from starts through 31 are present. Actual-source experiments use the kernel only when j≤2q, else the explicit zero-tail candidate. They retain all zeros without a polygon filter. Recorded zero counts are 12,925 source coefficients, 14,454 source triples and 8,096 kernel triples; these coefficient-dependent counts are saved observations only.

Unlike worker149's placeholder array, these source/kernel failure lists are **conditionally appended to** on mismatches. The saved arrays are empty. Return code 0 alone would not establish that, since the scripts still serialize failures; the audit checks the actual recorded arrays and exact output bindings. Continuation likewise records populated-on-mismatch lists, empty in the saved finite run.

Saved events 78,161,173 exactly match continuation, kernel and source JSON outputs. The source script hashes itself, the kernel script, raw136 helper and scan.py **after** its loops, but omits the transitive Newton148 helper. Kernel and continuation records save only their own script hash. The named old helper is separately pinned to archive/before/current bytes; it imports no poly148 helper. These observations do not provide complete invocation-time interpreter or transitive input authentication. The scripts/helpers are main-guarded and were never imported by the auditor.

Three earlier one-offs are retained in the event stream rather than separate result files. Event50 tests 30 continuation candidates and prints only the first 20 filtered failures; no full failure count is inferred. Event54 records 40 differences plus 12 observations varying N. Event112 prints **25,200**, but its loop increments by two even when d=0 skips the upper comparison. Its actual comparison domain is **12,600 lower + 11,760 upper = 24,360**. This early diagnostic counter is qualified separately; it does not alter the correct final 13,225 count. No mathematical value from any one-off was recomputed.

## Final compilation, replay and axiom selection

The final accepted inventory is:

| Module | Theorems / definitions |
|---|---:|
| MarkovNewtonFiniteM4F4 | 15 / 2 |
| MarkovRegionDegreeM4F4 | 12 / 0 |
| MarkovGapDegreeM4F4 | 18 / 5 |
| MarkovLowerDifferenceM4F4 | 5 / 1 |
| MarkovUpperDifferenceM4F4 | 8 / 1 |
| MarkovTwoKernelM4F4 | 8 / 1 |
| MarkovKernelShapeM4F4 | 4 / 1 |

There are nine final Lean files: these seven, one Audit module and the operational replay driver. Eight objects comprise seven mathematical objects and the Audit. Sixteen compiler receipts/snapshots comprise eight final successes and eight return-code-1 failures, with no wrapper timeouts, pending final mathematics, anonymous diagnostics or superseded successful mathematical versions. Failed source text and attempted headers are distinguished from successfully elaborated final declarations.

All selected final source hashes match successful snapshots, compiler receipts, replay maps, Audit imports, current/archive bytes and validation. Objects agree across final validation, controller changes, index and archive/current bytes. Selected dependencies are successfully built before final dependent compilation and replay. No compiler success is borrowed from a rejected version with a similar header.

One successful joint replay covers **81 explicit declarations = 70 theorems + eleven definitions**. Audit requests, source names, printed stdout and axiom JSON agree on all **70 theorem closures**, each printed once with only `{propext, Classical.choice, Quot.sound}`. Definitions participate in replay without theorem-print rows. Failed earlier bodies receive no accepted credit.

The eight rejected builds are NewtonFinite `1792169143761397000`, `1792169263063102000`, `1792169317711834000`; GapDegree `1792169638715803000`; LowerDifference `1792169740157705000`; UpperDifference `1792169895268641000`; and KernelShape `1792170198272858000`, `1792170247956646000`. Every rejected snapshot differs from final own-source bytes. The first NewtonFinite snapshot changes a cast-bearing header and contains invalid unspaced `≤m`/`≤n` binder tokens; the second repairs binders but retains unspaced body relations. Whitespace-normalized text agreement is not evidence that rejected syntax elaborates to the final proposition. Other diagnostics concern theorem names, casts, linear-combination sign, natural reassociation and a cancellation lemma. They remain failed attempts, not admissions, source failures or accepted intermediate propositions.

No saved own-source edit overlaps its compiler interval. That agrees with the operational record but is only an event/receipt observation, not continuous monitoring. All mathematical builds use 120-second bounds. The one selected replay, `1792170389084854000`, is called through the validation CLI with all seven modules and a 120-second bound. Audit `1792170389088208000` reads the module list with no CLI module arguments and a 180-second bound; its print module is `MarkovAudit1792170389088002000M4F4`, axiom JSON `1792170431379997000`.

The checker and validation/Audit wrappers are exact worker149 retags. The checker gathers selected module-data constants, imports the inherited base after excluding selected modules, rejects collected explicit `MathGKM.Markov.*M4F4` constants already in the base or flagged unsafe/partial, and calls ordinary `env.replay newConstants`. All 81 explicit names meet the guard and are absent from the base. Generated/private/equational constants retain ordinary replay behavior. Operational unsafe IO is separate from mathematical declarations. Commands identify Lean 4.32.2, single-threaded builds and replay stack 131072 with a joined task propagating its result; no runtime executable or every optional object part is independently authenticated.

Source hashes precede subprocess invocation, checker hash follows replay, and Audit source maps follow compilation. These bounded associations are not invocation-start authentication or continuous source immutability. No checker or compiler was run by the auditors.

## Import boundaries and old backlog

The selected base has **2,493 inherited local modules** and no selected current module. The accepted closure has **2,500 local modules = seven current + 2,493 inherited**; Audit adds one. Eight explicit direct imports plus implicit Init give nine total: NewtonM295, NewtonRemainingM295, OffsetTermM58E, PositiveKernelM679, UniformVerticalM0D3, UpperCoreM2B3, VerticalPolyM0D3 and VerticalRegionsM0D3. External library trees and the operational driver are not included in these local counts.

All 2,493 exact inherited source/object pairs match sealed149, before150 and current pins, without fallback. The independent pass ran **17:16:51.430516–17:17:30.220933 UTC**. Origins are 2,480 inherited149 pairs and thirteen accepted149 modules. Worker149's Residual, NewtonObstruction and EightGain are absent from this import closure; ResidualM295 is separately compared as the unchanged latest residual. The unvalidated EightNewton candidate is absent and receives no recovery credit.

| Endpoint | Local modules | Current / inherited | Old212 imports |
|---|---:|---:|---:|
| NewtonFinite | 3 | 1 / 2 | 0 |
| RegionDegree | 105 | 2 / 103 | 0 |
| LowerDifference | 59 | 1 / 58 | 0 |
| UpperDifference | 91 | 2 / 89 | 0 |
| TwoKernel | 103 | 3 / 100 | 0 |
| GapDegree | 2,496 | 3 / 2,493 | 212 |
| KernelShape | 2,484 | 4 / 2,480 | 212 |

The unconditional coefficient identity has the smaller TwoKernel boundary, with no old worker121 backlog imports. Both conditional root branches import all **212 compiled-but-unreplayed worker121 bodies**, including the 195-module subset, and the 19 historically accepted worker121 modules with their separate provenance. **None of the old 212 is compiled, selected or recovered here; all remain globally unrecovered.** Combining the seven modules in one replay does not turn inherited bodies into selected bodies or erase endpoint distinctions.

The 23 worker134 bodies recovered in worker135 retain their earlier recovery provenance. Failed HighCone2GapM81F remains excluded; its distinct accepted replacement HighCone2GapMF25 is imported. The corrected adjacent-horizontal worker145 scalar version and final six-theorem worker146 Global version remain pinned, without credit to their superseded versions. Historical timeouts, late failures, excluded candidates and earlier audit seals are not upgraded by preservation or reconciliation.

The mathematical comparison set has 148 older sources, **121 imported and 27 comparison-only**. Exact named Mathlib source/object hashes identify observed bytes, not source-to-object production, invocation-time resolution or whole-library replay. All selected checks continue to trust inherited compiled imports; no fresh whole-source rebuild or root-completion audit is established.

## Finalizer and preservation

The finalizer is an exact worker149 retag, including the already narrowed `sorry|admit|native_decide` textual filter. The `axiom` token was removed in worker149, not newly removed here. Actual selected sources contain no new axiom declaration, and all 70 printed closures satisfy the unchanged permitted set. This does not restore the removed safeguard or certify arbitrary future finalizer inputs.

The finalizer requires successful matching-source compiler receipts, final object hashes, a successful exact whole-map replay and a matching axiom source map. It has no independent per-theorem/allowed-stdout/checker-identity assertion or explicit axiom-JSON returncode predicate; the audit checks the actual successful records separately. Validation is written before preservation assertions. Terminal mismatch lists are recorded without an emptiness assertion, but the actual lists are empty and independently checked. STOP=false is historical metadata, not an assertion about a later state. There is no experiment-result binder or proof/experiment rerun by the finalizer.

The initial snapshot contains **6,359 entries**: **6,357 inherited inputs**, including 173 Python cache files, plus own setup and checkpoint. All inherited inputs are unchanged. Own setup is unchanged; own checkpoint changed and is explicitly recorded outside inherited preservation. Thus it would be inaccurate to say all 6,359 entries stayed unchanged. Both own paths are absent from before150, and the initial count need not mean every entry predates the request.

The final index has **73 artifacts**, and controller/archive coverage has **75**, adding manifest and verifier outside the index. Composition is eight objects, 29 JSON files, 25 Lean files (nine final plus sixteen snapshots), seven Python files and six Markdown files. All bound source/object/index/current/archive identities agree.

Reconciliation selects worker149's 125-entry index and separately checks 88+0+127 controller artifacts from workers136/137/149. Historical136 timeout/null report, 137 stopped/zero changes and 149 completed classifications remain unchanged. The six fixed administrative paths are bound, but worker150 has no inherited-decoded.txt; current inherited.json is not read by this audit. The old134 separately preserved late failed Audit remains outside this worker's initial/index with no success credit.

The sole finalizer succeeds at events **194–195**. There is no archived draft report.json or earlier finalizer index. Structured event **196**, final.json and controller report agree; **197** is turn.completed. Completion remains null. Raw validation has no completion field; final-check has no finished_utc; root/contract pins come from final-check and independent hashes rather than being invented fields of last-verification.

## Deadline, event order and final observation

All times are UTC on 2026-10-16:

| Observation | Time |
|---|---|
| Controller start | 16:39:24.516967 |
| Nominal 1800-second deadline | 17:09:24.516967 |
| Last mathematical build, estimated finish | 17:05:22.389142 |
| Replay start / estimated finish | 17:06:29.084854 / 17:07:08.628529 |
| Audit start / estimated finish | 17:06:29.088208 / 17:07:11.359419 |
| Final validation mtime | 17:07:59.471391 |
| Final project verifier mtime | 17:08:00.783588 |
| Event-log mtime | 17:08:32.953415 |
| final.json mtime | 17:08:35.370910 |
| Host finish | 17:09:09.018340 |

Replay and Audit overlap. Audit's compiler-call timestamp is 0.003354 seconds later and its estimated finish 2.730890 seconds later. Their saved durations are about 39.543675 and 42.271211 seconds. The Audit wrapper command starts first in event order; this differs from the inner compiler-call timestamp and is not a contradiction. The finalizer follows both successful checks.

Recorded event188 completes the successful Audit before commentary189 says it is still running. That sentence is stale commentary; it does not establish an outstanding Audit at finalization. The structured report and actual receipt associations remain distinct from interim prose.

The verifier write precedes the deadline by 83.733378 seconds, final.json by 49.146057 seconds, and host finish by 15.498627 seconds. Operational prose's 16:39:35 start banner is later than the controller start and does not define the deadline. Archived verifier-copy mtime 17:09:09.012017 differs from its project write. Stored elapsed and timestamp subtraction have the sub-microsecond difference stated above, rather than exact floating-point equality.

Receipt finish estimates add monotonic durations to filename epochs and are not independently timestamped exits. Event-file mtime is not an individual event timestamp. All 92 started items have completed counterparts in 197 events; **535,711 event bytes plus 328 stderr bytes total 536,039**, matching activity accounting. These observations are not an independent process census or a cause-of-stop inference. No indexed artifact is observed after the deadline or host finish in the retained records.

Pinned root SHA256: `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

Raw contract SHA256: `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical contract SHA256: `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

Final manifest SHA256: `674b95824e7af170105e3b18653ff611bc709edadbb85513a8480f163144764a`; verifier SHA256: `644f286be2a58f925f961a33858ba5fcb76241fe18074fd4935ede26edd12583`; delivered final.json SHA256: `5d79118b966c8cb828644a274786bddd9ea57671e1ab8772406d26da4fe83f86`.

## Final audit observation and sealed supports

Validation rehashed **9,451 bounded inputs**, all unchanged, during **17:24:33.239923–17:25:11.790287 UTC**. The exact-request late-file observation at **17:25:11.804822 UTC** found no additional or missing archive/current files. The method review rehashed **128 bounded inputs**, all unchanged, during **17:24:15.943596–17:24:16.099116 UTC**. Project reads closed at these stated boundaries. The integrity seal and final crossreview read audit files only and do not extend them. No separate late project bundle is required.

Independent companion crosschecks agree on **50 fields, 2,493 inherited pairs and 96 shared input hashes**. Audit-only rechecks cover eleven validation-bound and thirty-two method-bound temporary inputs, unchanged. Both companion main-text reviews found no remaining necessary correction after the event/stderr accounting was corrected. Earlier audit seals and observation windows remain final.

The seven support files, all in this audit directory, are:

| File | Bytes | SHA256 |
|---|---:|---|
| markov_worker_000150_mathematical_source_hashes.json | 82165 | `847ead87b616dcb0ad2d0f0552276b30ac24a8b2ea9956a42308f44e22154b96` |
| markov_worker_000150_source_structure_audit.json | 30854 | `db5a32921744380c0fbcab6b1113305856f1d4597de51a84714fd01d093c98f5` |
| markov_worker_000150_finite_domain_audit.json | 47335 | `918adb17ff0fcf7aea78453277924c1c6d58eb549e1db4c29a0a4ce1439b9004` |
| markov_worker_000150_validation_audit.md | 25117 | `7a49179f7840d4ece37bec301d77c1e2f12c810f76f5e53fe3f0c95f915eed49` |
| markov_worker_000150_validation_evidence.json | 6763797 | `f457a9b79a3e98b533dcc79b0dc740bebe48a8c7af936e1bd66fb91e82162fc8` |
| markov_worker_000150_replay_method.md | 24965 | `45948ac734a383927903a1c463fd9a48474bdde520c485f4e930804e37407d2a` |
| markov_worker_000150_replay_method_evidence.json | 9951148 | `cd55079ef6a11d274f036b774ab52f8629482e4fe396ad086f0a0432d98481dd` |

The separately bound inherited-pair map is `markov_worker_000150_inherited_pair_expectations.json`, 2,195,247 bytes, SHA256 `e888bf4bab5d301851aa2245168eef9743ef6aa2a88bf246377e349b23a025e0`. It records the same inherited pair observation rather than a new source rebuild.
