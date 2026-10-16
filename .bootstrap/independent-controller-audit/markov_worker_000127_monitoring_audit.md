# Worker 000127 independent monitoring audit

Request `f52ba1417d354fe7831df8391636160f`; completed archive `/Users/sasha/math_gkm/.control/markov/workers/000127/artifacts`; research suffix `MF52`. Audit date 2026-10-16 UTC. This audit reads completed archived sources and records, exact named counterparts and sealed predecessor audits. It runs no Lean, checker, replay, experiment, finalizer, project code, polynomial recurrence, coefficient or inequality-gap calculation. Independent computations are static parsing, hashes and integer word/index-domain counts. No project file was changed, active128 mathematics inspected, or proposer contacted or assisted. Output is confined to `/private/tmp/math_gkm_godel_20261013`.

## Finding and scope

The retained final evidence supports **13 new mathematical modules,44 theorem closures and six definitions**. The new universal statement is horizontal raw row **j=2** log-concavity for **every finite Boolean core w** in the word A–w–B and **every natural starting index i**, including zeros. An exact inherited source adapter specializes this to every actual source path. No source-balance condition, denominator bound, coefficient-formula hypothesis or unproved gap premise remains in that final statement.

This enlarges the family of words with a proved second row. It removes **no new region from the source root residual**, because actual-source row j=2 was already proved. The inherited exact reduction `Conjecture63 ↔ InteriorCore63MF8` remains unchanged. Neither the full conjecture nor its negation is proved.

The new infinite example family has a non-log-concave **unsmoothed cubic seed**, while its smoothed raw second row satisfies the all-word theorem. Its words are formally excluded from **every** complete actual source word. A separate finite directed-term obstruction does occur at a complete source word, but it concerns one directed piece of a mixed expression, not the full raw inequality. These distinctions are essential to the non-refutation conclusion.

The old worker121 backlog of **212 compiled but unreplayed modules remains unrecovered** and is absent from these successful import bases. Selected new replay, axiom printing, inherited compilation and historical preservation are separate evidence categories. There is no fresh whole-source rebuild or independently verified full loaded-binary environment.

## Literal coefficients and exact word/source correspondence

The protected coefficient remains `(P.coeff i).coeff j` in the squared raw variables, without individual normalization. `InPolygon a b i j` remains `a*b ≤ b*i+a*j` together with `i+j ≤ a+b-1`. Root SHA-256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

`raw_word_second_allMF52 (w : List Bool) (i : ℕ)` has the exact conclusion

```
let P := (rawWord80 (false :: (w ++ [true]))).b
coeff P i 2 * coeff P (i+2) 2 ≤ coeff P (i+1) 2 ^ 2.
```

Thus the literal three points are **(i,2),(i+1,2),(i+2,2)**. The theorem has no polygon premise and therefore includes every polygon-valid triple in this row as well as all other natural indices. It is horizontal only. The core is arbitrary: it need not be mechanical, balanced, palindromic, or a source core. Initial A and final B are explicit word boundaries; the theorem is not a statement about all unrestricted words.

The inherited `hword_raw46` identifies `hword46 X w` with the coordinate-swapped second matrix entry of precisely A–w–B. `swap_coeff46` then converts row coefficients back to the protected literal `coeff`. The new `hword_second_allMF52` proves the integer coefficient inequality before this translation.

For each actual path, inherited `source_hword46` supplies a core w with `length w+2=b`, `count_B w+1=a`, and exact polynomial equality `swap(frame path).mid.p=hword46 X w`. `source_second_via_wordMF52` uses this equality and the all-core theorem for every path and natural i. No rational enumeration, source balance, run restriction or bound on b is introduced by this adapter. The inherited path/rational and homogeneous/Laurent correspondence retains its earlier validation boundary; it is not independently rebuilt here.

## Smoothed coefficient formula and exhaustive gap charts

For a nonempty core, let n be its length, m its B count, and t the first-B indicator plus last-B indicator plus twice its number of adjacent BB pairs. Inherited `stat_bound8934` proves **t≤2m** for every such word. Inherited `word_second8934`, valid when n≥3, gives the exact integer polynomial identity

```
2 * [v^2] P = u^m * (1+u)^(n-3) * Q(u),
Q(u) = 4t + (9m^2+13m+6)u
     + (6m^2+6mn+8m+6n+6)u^2
     + (m+n+2)(m+n+1)u^3.
```

The polynomial in `secondRow340 n m t` is the smoothed part `(1+X)^(n-3)*Q`, over the reals. The formula is inherited from all-word matrix/jet identities; it is not an empirical assumption. Its earlier derivation cancels a nonzero polynomial `(X+1)^3` in an exact equality, not in a log-concavity assertion. The earlier actual-source seed proof used the additional condition `n≤2m ∨ t=0`. This new argument does not import that condition into its final all-word theorem.

`secondHMF52 k l m t` is the cubic falling-factorial expression

```
4t*l(l-1)(l-2)
+ (9m^2+13m+6)*k*l(l-1)
+ (6m^2+6m(k+l)+8m+6(k+l)+6)*k(k-1)l
+ (m+k+l+2)(m+k+l+1)*k(k-1)(k-2).
```

`second_coeff_clearMF52` proves, for natural n,k with n≥3 and k≤n and arbitrary real m,t,

```
n(n-1)(n-2) * (secondRow340 n m t).coeff k
  = choose(n,k) * secondHMF52 k (n-k) m t.
```

It specializes the inherited falling-factorial coefficient identity and explicitly handles the natural subtraction through k≤n. This is a coefficient equality, with one common scalar for a fixed n, not a change to the root's coefficient definition.

The gap is

```
G(k,l,m,t) = (k+1)(l+1)H(k,l,m,t)^2
            - k*l*H(k-1,l+1,m,t)*H(k+1,l-1,m,t).
```

`second_bernsteinMF52` is a ring identity for all real k,l,m,t expressing `(2m)^2 G(t)` as `(2m-t)^2 G(0) + t(2m-t) Mixed + t^2 G(2m)`. For natural shifted center indices k=i+1,l=j+1 with i+j≥1 and real m≥1, the eight chart modules prove nonnegativity of both endpoint gaps and the mixed term. They cover

```
(1,2), (1,≥3), (2,1), (2,2), (2,≥3),
(≥3,1), (≥3,2), (≥3,≥3).
```

Each chart has three certificates, for **24** in total, using k=x+3 or l=y+3 where appropriate and m=z+1, with x,y,z≥0. Boundary equalities are included. The missing (1,1) corner is impossible when n=k+l≥3; it is not an omitted valid interior case. The assembler performs the exhaustive natural i,j split and substitutes m−1≥0. Some chart binders x or y are unused in fixed-coordinate cases, but no additional source condition is hidden there.

Each accepted chart expands the displayed definitions with ordinary Lean `ring_nf` and `positivity`. The Bernstein identity uses `ring`. Python-generated symbolic output is not imported as a premise. The early unshifted `second-symbolic.json` records two endpoint charts with negative coefficients; the later generator substitutes m=z+1 and records24 positive expansions with1251 terms in total. These are different symbolic scopes. The final Lean sources directly prove the shifted identities/signs; an early negative symbolic coefficient is neither an accepted negative gap witness nor a failed theorem receipt.

Combining the charts with 0≤t≤2m and `(2m)^2>0` gives `second_gap_nonnegMF52`. The inner coefficient bridge takes n=i+j+2 and proves the exact binomial product relation

```
(i+2)(j+2) B0 B2 = (i+1)(j+1) B1^2,
Br = choose(n,i+r).
```

It multiplies the nonnegative gap by **B1²≥0**, then cancels only the positive factor `(i+2)(j+2)*L²`, with `L=n(n-1)(n-2)>0`. **No division by a binomial coefficient and no reverse cancellation of log-concavity through binomial smoothing occurs.** The proof works directly with the smoothed coefficients.

`second_row_allMF52` quantifies over natural **n,m,t,i**, assuming only **n≥3 and t≤2m**. In particular it does not require m≤n or n≤2m. For m≥1 and i+2≤n it uses the inner theorem with j=n−(i+2). For m=0 the bound forces t=0, and the inherited cubic/CrossLC/Pascal theorem handles that case. For i+2>n, the proved degree bound makes the right coefficient zero and the squared middle coefficient is nonnegative. Thus all natural starts and upper zero positions are explicit.

`shifted_adjacentMF52` transfers adjacent inequalities through an exact equality `2*p=X^a*q`. When i≥a it uses a common factor2 at the three shifted coefficients; when i<a the first coefficient of p is zero, so the desired inequality follows from a square. This covers the leading zero transition without deleting it. Mapping the integer row to the reals and back uses exact coefficient mapping and casts. Cores of length at most two use the inherited seven cases (length0, the two length1 words and the four length2 words) and their shifted quadratic CrossLC certificates. No short core is left as a conjectural formula or finite-only exception.

## Infinite unsmoothed failure with a proved raw row

`rescueCoreMF52 n = B A^n` and `rescueWordMF52 n = A B A^n B`. Its core has length n+1, B count1, and statistic1 when n≥1. For **n≥2**, `rescue_factorMF52` proves

```
2 * [v^2] P = X*(X+1)^(n-2)*rescueSeedMF52 n.
```

The seed is the explicitly defined `secondExpr8934 X (n+1) 1 1`; its displayed expansion is `4+28X+(12n+32)X²+(n+4)(n+3)X³`. `rescue_seed_coeffMF52` formally extracts its coefficients0,1,2 as **[4,28,12n+32]** for every natural n. `rescue_seed_failureMF52` proves the strict reversed adjacent inequality for **every n≥14**.

Nevertheless `rescue_word_rawMF52` proves the raw horizontal row inequality for **every natural n and every natural i**, by the all-core theorem. The factorization uses n≥2; the raw inequality itself has no such lower bound. This is a proved family in which a non-LC unsmoothed cubic is followed by an LC raw row after multiplication by the binomial factor and monomial, with a common factor2. The seed is not the protected raw polynomial, and the theorem does not infer its LC by cancellation. No new identification with an independently defined canonical source residual is needed or claimed by this audit.

For every n≥2 and every actual source path, `rescue_not_sourceMF52` proves the rescue word differs from `sourceWord28 path`. Equality would force a=2,b=n+3 from source counts. The word's first two letters contain one B, while inherited `source_take_floor3eda` requires `floor(4/(n+3))=0`. The contradiction applies uniformly, without a coprimality assumption on n+3. Hence the failing-seed family is formally excluded from all complete sources; it is not a root counterexample.

The retained finite n=16 display `[2,42,490]` refers to raw points **(1,2),(2,2),(3,2)** after the monomial shift, while seed `[4,28,224]` is at seed indices0,1,2. The saved raw gap784 and reversed seed gap112 are experimental displayed values, not separately recomputed here. The universal seed failure, factorization, raw LC and source exclusion are formal theorems with the ranges just stated.

## Root residual, zeros and endpoints

No new residual module is introduced. The inherited `InteriorCore63MF8` still requires, for every actual path with a≥2 and with all three original polygon guards:

- Horizontal j≥5 with i+j+4≤a+b−1, at `(i,j),(i+1,j),(i+2,j)`.
- Vertical i≥4 with i+j+4≤a+b−1, at `(i,j),(i,j+1),(i,j+2)`.
- Diagonal with i+j+8≤a+b−1, a+5≤i+j+2 and a+2≤b, at `(i,j+2),(i+1,j+1),(i+2,j)`.

The exact root includes both endpoint clauses `WeakLC 0 1 1` and `WeakLC 1 1 (U+V)` in addition to every generated path. They remain unchanged, as do all natural zeros and original polygon inequalities. Existing source rows j≤4, columns i≤3 and diagonal coverage retain their prior proofs and validation boundaries. The present enlarged-word j=2 result removes nothing further from this residual and supplies no new vertical or diagonal theorem. The full conjecture remains open.

## Finite and symbolic evidence

The saved scripts and outputs were read and hashed without execution. Fixed-seed **word metadata only** and integer index ranges were reconstructed for counting; no raw polynomial, matrix product, recurrence, coefficient, symbolic expansion or inequality gap was recomputed. Every pass/fail, zero-value and witness-value statement below is a retained observation. Finite domains are not universal proof premises.

The full-degree grouped probe takes2047 initial-A words from exhaustive tails of lengths0 through10 plus300 sampled tails of lengths12 through79: **2347 inputs, all distinct**. At each word it constructs raw-pair expressions R=Q+xP, S=R+P, f=yR and g=xS. Its full natural triangular center domain through one zero boundary layer yields **1,290,238 comparisons for each of** the symmetric mixed B expression, f's adjacent gap and g's adjacent gap. Independent word/index counting matches that total using retained degree endpoints. The three predicate counts share the same centers; they are not three independent word domains. The saved record reports no failures and **363883 centers with at least one zero middle component**, counted once per shared center. There is no polygon filter.

The low-row grouped probe uses511 exhaustive initial-A words through tail length8,392 structured word inputs and200 sampled tails of lengths10 through79: **1103 inputs but1042 distinct words**. It truncates outer degree to8 and checks rows0 through8 with missing coefficients zero. The row/index domains independently give **332118 comparisons each** for R_LC and S_LC and **342045 each** for B_group,AA_group,A_compensated. The R/S self-mixed tests are twice the corresponding adjacent gaps; A_compensated is likewise a self-mixed test of the sum. The saved failures are **3819 in AA_group only**. At ABA,row2,start0 the summand triples are `[0,0,5]` and `[2,9,13]`; the saved mixed gap is−10, component-gap sum55 and full sum gap45. A negative mixed contribution therefore does not state a negative full sum gap. The **729906 zero-center observations** accumulate across the five predicates and repeated word inputs, rather than counting unique coefficient positions. Positive outer shifts make the truncation one-way in the script; no new formal truncation proof is claimed.

The final full and low records reached every planned input. Earlier saved progress files at2300 and1100 inputs have matching independently recounted partial index totals; they are intermediate progress, not unresolved or late final evidence.

The directed probe uses511 arbitrary initial-A words plus **627 actual mechanical source words** for all reduced 1≤a<b≤45, for1138 input occurrences. There are27 overlapping words between the two categories. It retains rows0 through8 and tests the two pieces `f1*g1-f0*g2` and `f1*g1-f2*g0` separately. Counts independently match **66807 per arbitrary predicate** and **273699 per source predicate**. Saved failures are13 arbitrary-left,6 arbitrary-right and2969 source-left; no source-right failure is reported. The first source-left witness is the complete source word A^5 B for **1/6**, row2,start1, with f triple `[2,11,28]`, g triple `[0,7,42]`, and directed value−7. Its actual-source word membership is independently checked from word metadata. This is one directed summand of the symmetric mixed expression; it is not a reversed raw source adjacent inequality, and the record provides no root counterexample.

The smoothed-cubic finite envelope takes n=3 through40, m=0 through2n, and distinct admissible t from `{0,1,floor(2m/3),m,2m−1,2m}`. There are **9690 parameter triples** and **272859 starts** i=0 throughn. The latter count is independently reproduced. The saved9690 zero-middle observations happen to equal the number of parameter triples; zero values are not independently regenerated. This envelope is a finite sample of t and includes m beyond actual-word count bounds; it is distinct from the universal theorem.

The A–core–B word checks comprise all2040 cores of lengths3 through10 plus100 sampled cores of lengths11 through64: **2140 core inputs**. Their index lengths n+m+4 yield **41759 coefficient identities and41759 adjacent comparisons**, independently recounted. Another **277 reduced source fractions** through b=30 yield **8954 comparisons** against independently generated complete-source coefficients. All saved checks pass. Rescue parameters14 through500 give487 finite examples; the displayed formulas and values were read, not recalculated.

The terminal-A exploration uses a separate seed for2140 cores over the same length ranges. Its loop domains yield **41697 coefficient identities and41697 adjacent comparisons**, with saved17698 zero centers and no failures. The retained symbolic exploration has **48 charts**, from eight index regions, two final-bit values and three endpoint/mixed expressions, totaling2502 saved terms and no negative symbolic chart. **No universal terminal-A coefficient or LC theorem was formalized.** The suggested m=0 cancellation and prospective formula remain within the saved exploratory discussion; they are not newly accepted mathematical coverage or a pending Lean proof that this audit completes.

The mathematics note retains a staged sentence about twelve modules/37 closures, followed by the separate seven-theorem Rescue section. Its final correspondence states13/44, matching the actual two Audit/replay stages. This is distinguished from a claim that only twelve modules constitute the final result.

## Retained validation, method and cutoff

All **114 controller artifacts** match archive and exact current bytes; all **112 indexed artifact hashes** match. The manifest itself and last-verification are the only index exclusions and are separately controller-bound. The archive contains16 final Lean sources (13 mathematics,two Audits,one driver),21 immutable compiler snapshots,15 final objects,42 JSON files,14 Python files and six Markdown files. No new mathematical source is unbuilt, compiled-only or pending validation. There is **no compiled-inventory.json this round**; independent source/receipt enumeration agrees with the changed validation schema.

| New modules, suffix MF52 | Modules | Theorems | Definitions |
|---|---:|---:|---:|
|MarkovSecondGapDefs|1|1|3|
|Eight MarkovSecondGap case modules|8|24|0|
|MarkovSecondGap|1|2|0|
|MarkovSecondRow|1|6|0|
|MarkovSecondWord|1|4|0|
|MarkovSmoothingRescue|1|7|3|
|Total|13|44|6|

There are21 compiler receipts with matching immutable snapshots: **15 successes** (13 mathematical modules and two Audits) and **six failures**, all returncode1. Failed modules are OneTwo once,Row twice,Word once,Rescue twice. All six source hashes are distinct and differ from their final accepted replacements. Static declaration-header comparisons find no changed premise or binder apart from operator whitespace in the first OneTwo version; proof-text fixes do not retroactively validate rejected snapshots. No compiler timeout, interrupted or missing outcome, snapshot-only invocation, superseded successful mathematical version or failed replay is retained.

The first successful union explicitly selects the12 modules through SecondWord, containing37 theorems and three definitions, and prints isolation of **40 constants**. The later Rescue singleton contains seven theorems and three definitions, isolation of **ten constants**. All13 final modules are selected exactly once, with matching final source hash, successful build snapshot, retained object and replay receipt. Definitions are included in the50 explicit declarations;44 is the theorem-closure count.

The two successful Audit outputs print exactly **37+7=44 distinct final theorem names**, with no missing, repeated or extra name. Source-hashed `axioms-*.json` records match Audit imports, imported final sources, compiler output and finalizer references. **42 closures** use `{propext,Classical.choice,Quot.sound}`; `false_run_statsMF52` uses only `{propext}`; `rescue_statsMF52` uses `{propext,Quot.sound}`. There is no axiom-free output or parser rejection this round. The staged12/37 and13/44 scopes are preserved separately.

The final replay driver SHA-256 is **`9e86083b86ff2c08ea793eb3c464f6abf3e83c8b442d58b1c8117e09c923d11d`**. It is worker126's driver after suffix substitution, and both receipts record the matching `checker_sha256`. The compiler/replay wrapper likewise retains its earlier body after retagging: compiler `-j1`, replay stack131072, joined-task error propagation and ordinary `env.replay`. There is no field named `driver_sha256`; the actual checker field supplies the retained source hash.

The guard checks collected names beginning `MathGKM.Markov.` and ending `MF52` for absence from the imported environment and for unsafe/partial restrictions. All50 explicitly declared names lie within this predicate. Generated/private/inherited names outside it retain ordinary Lean.Replay handling. Source-level comparisons do not reconstruct every binary constant. The driver collects target module-data parts including available private/server parts into a map; checker source is hashed after subprocess return, not measured at invocation time. Object hashes bind retained bytes, not independently observed runtime-loaded binaries.

This round has **no selected/depth scheduler or replay-plan.json**. The first union deliberately includes dependencies among its12 targets. It need not be an antichain: those targets are excluded together from the imported base. Its direct source imports after exclusion are SecondCoeff340,SecondSmall8934 and Mathlib; stdout counts four inherited roots including implicit Init. Static transitive analysis gives101 inherited local base modules and no selected target or explicit selected-name collision. The Rescue base contains118 local modules=106 inherited+the12 previously selected new modules. All12 finish their matching builds and first replay before Rescue starts. **No replay overlaps an unfinished dependency replay.** This is explicit union isolation, not an inherited-only pass of the selected declarations.

The new axiom wrapper searches for each expected fully qualified theorem name and accepts both dependent-axiom and axiom-free output forms. It requires successful Audit compilation and a permitted axiom set, then writes source-hashed axiom JSON. This is more specific than the previous count-only parser, but its search predicate alone does not reject every possible duplicate/extra output; independent comparisons establish exact name uniqueness here. Source hashes are recorded after the subprocess.

The new finalizer rebuilds validation from its explicit13-module list. For each current source it requires a successful source-matching compiler receipt, successful source-matching replay receipt, and source-matching axiom JSON containing every theorem name; it rejects forbidden source tokens and hashes final objects. It does **not itself enforce checker identity, re-evaluate the axiom sets or bind axiom JSON back to successful Audit output**. Independent comparisons establish those retained-record bindings for all actual13 modules here. Each has exactly one matching successful build/replay/axiom record, so last-match selection is unambiguous. Completeness of the explicit list follows from the independent archived-source inventory, not from a general all-candidate guarantee in the finalizer.

## Imported source/object boundary and historical backlog

Static reconstruction finds **121 local nodes=15 new mathematics/Audits+106 inherited**. The mathematical root SmoothingRescue reaches **119=13+106**, excluding the two Audits. There are no unresolved local imports or cycles. There is no worker-saved source-dependency-scope inventory; these are audit reconstructions. External Mathlib and implicit Lean source trees remain outside the local source graph.

All106 exact inherited source/object pairs match before127 and retained predecessor bindings. Their origins are49 worker126 inherited bindings,55 worker124 bindings,one worker125 inherited binding,and one additional **MarkovSecondCoeff340** pair. That last module was outside those sealed graph inventories: its source is additionally matched to the completed worker058 archive and before126/before127 pins; its object is separately matched to before126/before127 pins. Source SHA is `3f21c2e5542650c11a65cacbed9478583c465760a02d15b5691ed738f619bca6`; object SHA is `495ee4200711f92e96ff1e35099c2b5f27cfd65432add8b7f03c9797683da7b5`, at `evidence/markov-34071a88/MarkovSecondCoeff340.olean`. No prior sealed graph coverage or new replay is invented for it.

No newly accepted worker124,125 or126 mathematical module is imported by these new targets. No MAE2 module is in either successful base: intersections with worker121's212 compiled-but-unreplayed modules,195-module subset,previously accepted set and298 unbuilt candidates are empty. None is rebuilt or selected. **The212 backlog remains historically unrecovered and is absent from the present bases.** Its preservation and reconciliation cannot supply missing checks. The inherited full-root residual is also separate from this round's source-import graph and retains its previous validation boundary.

All5610 retained prior inputs match, from5612 setup entries excluding the newly created own setup and checkpoint. The checkpoint changed after setup. The snapshot includes130 `.pyc` files as preserved bytes; they are not added proof evidence and were not executed by this audit. Controller-before omissions reflect different snapshot coverage, not conflicting hashes. Six inherited administrative files remain unchanged.

The worker's reconciliation checks predecessor126's93-entry manifest and worker121's1353-entry manifest. Independent audit additionally binds **all95 predecessor126 artifacts and all1355 worker121 artifacts** against controller/archive/before/current records. Event hashes/counts match reconciliation; worker121 retains timeout,null report and228 events. Root and raw/canonical contract hashes are unchanged. The raw contract SHA is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; pinned canonical SHA is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`.

These source/object preservation checks establish retained byte identity, not fresh inherited compilation, inherited-body replay, runtime object measurement, official-checker admission or whole-source validation. Ordinary compiled-import trust and the existing Lean kernel/library boundary remain explicit.

## Finalizer failure, successful cutoff and late evidence

The first direct finalizer, events207–208, exits1 at the contract checksum assertion. The observed digest is `f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4`. Independent static serialization of the same parsed contract reproduces that digest with compact sorted JSON and `ensure_ascii=False`, while ASCII escaping reproduces the pinned canonical digest. The first script body is not separately snapshotted, so this corroborates the retained explanation without asserting possession of its exact old bytes.

Events211–212 record the finalizer/operational-note correction, and events213–214 record a successful rerun with13 modules/44 closures,5610 prior inputs,six compiler failures and112 indexed artifacts. The expected canonical digest and mathematical contract remain unchanged. The final source writes validation before the checksum assertion, permitting partial publication on that failure; the rejected attempt does not establish completed final-check,manifest or last-verification coverage. Retained final files come from the successful rerun. This operational failure is separate from the six compiler failures. Event order is retained, but exact per-event wall times are not available.

All times below are UTC on2026-10-16. Receipt filenames identify starts; completion estimates add saved durations and are not independently timestamped process exits.

| Milestone | Time |
|---|---|
|Worker start|05:16:35.219183|
|Last first-stage mathematical build completes, estimated|05:31:31.270217|
|37-closure Audit completes, estimated|05:32:35.588430|
|12-module replay completes, estimated|05:32:46.166315|
|Rescue final build completes, estimated|05:35:13.384450|
|Seven-closure Audit completes, estimated|05:36:16.786287|
|Rescue replay completes, estimated|05:36:17.700100|
|Final validation mtime|05:39:16.030123|
|Final-check mtime|05:39:21.493177|
|Manifest mtime|05:39:21.640552|
|Last-verification mtime|05:39:21.712001|
|Final JSON mtime|05:39:53.448870|
|Controller completed finish|05:40:28.092170|
|Nominal1800-second deadline|05:46:35.219183|

Controller outcome is completed,returncode0. Its retained elapsed field is **1432.8729877471924 seconds**; subtraction of stored floating-point epochs gives1432.872986793518, a difference of about one microsecond. Finish is **367.127013 seconds before deadline**. All observed project artifacts, mathematical receipts and final report precede finish and deadline.

Final report event218 equals parsed final.json and controller receipt report; event219 is turn.completed. Final JSON SHA is **`bc01d8ea3181821da3ddf64840700f845f120bcd4e3023905621dcff96b57d85`**. No separate draft report is retained. Completion remains null, and the report retains the unresolved root and partial theorem scope.

The219-event log is511499 bytes, exactly matching activity accounting; stderr is empty and all103 started events have completion partners. Event-log mtime05:39:52.398914,activity time05:39:52.803046/activity file mtime05:39:52.803291,final JSON and controller finish are distinguished rather than interpreted as late proof. Last-verification intentionally follows final-check and manifest, binds the final manifest digest and112 entries, and has no failures. No stale index or extra completed-request evidence file is observed. No independent system-wide process census is claimed.

## Audit artifacts and limits

Seven supports accompany this main note: mathematical source hashes,source structure,finite-domain audit,validation note/evidence,and replay-method note/evidence. The integrity file binds all eight after audit-file-only cross-review. New mathematical source hashes and declaration inventories are independently compared between mathematical and validation supports.

Final validation stability found **8283 inputs unchanged** at05:56:51.919972–05:57:05.051157 UTC. Completed-request late-scope observation at05:57:05.051188 found no extra or missing file. The method's143 static inputs were unchanged at05:56:50.768970. No late receipt required separate preservation. These later audit observations do not backdate mathematical coverage or alter the completed-worker cutoff. Earlier byte-preserving storage operations remain operational metadata history, not new proof evidence.

The audit supplies no missing proof, experiment, source repair or research direction. It records the universal enlarged-word second-row theorem, the exact non-source seed obstruction, finite predicate limitations, and their retained validation scope. Full `Conjecture63` remains unproved and unrefuted.
