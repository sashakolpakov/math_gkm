# Worker 000133: validated half-cone strip, historical timeout retained

Request `5703599b8b9a4638b67a688a6b77e4cb`. Archive-first independent static audit of saved worker133 material under `/Users/sasha/math_gkm/.control/markov/workers/000133/artifacts`. No project program, Lean, checker, replay, experiment or finalizer was executed; no mathematical coefficients, recurrences, polynomial expansions or inequality gaps were recomputed. Only saved source/records, content hashes and integer domain/index counts were examined. No project file was changed, successor134 mathematics inspected, proposer contacted or research assistance supplied. Audit files are confined to `/private/tmp/math_gkm_godel_20261013`.

**The historical controller result remains TIMEOUT, returncode0, reportnull, elapsed1850.6812479496002seconds.** There is no `final.json`, structured final report or `turn.completed`. Independently, the retained predeadline records support complete local validation of all **30 final mathematical modules,48 theorem closures and51 definitions**. Earlier prose that leaves final assembly replay pending is superseded by worker133's own later receipts and successful finalizer; no successor reconciliation is needed to establish that fact. A successful finalizer does not upgrade the controller outcome or prove Conjecture63.

The accepted new result is `source_strip_halfconeM570`: for every generated source path satisfying **2a≤b**, and every natural i,

    coeff P i 2 * coeff P i 4 ≤ coeff P i 3 ^ 2.

These are the original raw integer coefficients at **(i,2),(i,3),(i,4)**, including zeros, with no denominator cap, run bound, additional word-shape hypothesis, or unresolved formula/gap premise. The exact accepted equivalence is `Conjecture63 ↔ InteriorCore63HalfM570`. Its remaining vertical j=2 clause has b<2a; higher vertical strips and the inherited horizontal/deep diagonal clauses remain. The full conjecture is open. High-cone b<2a experiments and symbolic charts do not extend the theorem.

## Source correspondence, corrected formulas and all-index assembly

Write a,b,P for the actual `(frame path).mid` data, d=a+b−1, and f_r=coeff P i r. `frame_reduced` provides a≥1,a<b,coprimality. The proof starts from inherited actual-source row identities, not arbitrary words, empirical candidates or a presumed log-concavity statement. The middle bridge uses worker132's accepted `MarkovStripMiddleSourceMD11` and `MarkovStripMiddleChooseMD11`; it does not import the five failed/unbuilt MD11 gap/assembly/residual drafts.

For the interior use i=a+k, l=b−2−k, N=k+l=b−2, C=choose(N,k), with natural k≥0,l≥3,N≥7. Write F_r(x)=x(x−1)…(x−r+1). J,H,I denote the inherited low-cone second-, third- and fourth-row polynomials. All choose identities are multiplicative and retain natural zero cases; there is no division by C or a raw coefficient. The previously proved quartic-all boundary supplies l=3, where the shifted quartic parameter is0, rather than silently applying its positive-parameter-only predecessor.

For **3a≤b≤4a**, b≥9, put t=(4a−b:ℕ). The actual fourth seed is X²[96t+XQ₄]. The inherited source identity yields the coefficient correction at k+1. Worker133 defines

    I_mid = (k+1) I + 96t F_5(l−3),
    G_mid = 4(N−5)(N−6)(l−1)(k+1) H²
            − 3(N−3)(N−4)(l−2) J I_mid.

The checked source equations are

    2F_3(N) f₂ = C l J,
    6F_5(N) f₃ = C l(l−1) H,
    24F_7(N)(k+1) f₄ = C l(l−1)(l−2) I_mid.

For l=L+7, the substitution a=(k+L+9+t)/4 scales J,H,I_mid by16,64,256. Their degrees in t are2,3,4. Four unrestricted real-polynomial expansion identities link them to the seven coefficient certificates for4096G_mid. Each certificate gives a positive-integer Horner expression in nonnegative k,L, proves the identity by ordinary `ring`, then uses `positivity`. Static parsing confirms all14 middle/next certificate right sides use only positive integer literals, variables,+,*,parentheses; their identities were not recomputed by this audit. The saved compiled/replayed proof bodies, not that syntax observation alone, establish the polynomial identities.

For l=3,4,5,6 the correction vanishes; `strip_middle_smallM570` identifies G_mid=(k+1) times the inherited low-cone gap. Thus `strip_middle_gap_nonnegM570` covers all natural a,k,l,t with4a=k+l+2+t,l≥3,N≥7, including k=0 and l=3. No unmentioned upper bound on t is required by this abstract gap theorem. The transfer proves

    144F_5(N)²(N−5)(N−6)(k+1)(f₃²−f₂f₄)
      = C² l²(l−1) G_mid.

The common scalar is strictly positive from N≥7,k≥0; the right side is nonnegative. The final assembly casts the real inequality back to the original integer coefficients. `source_strip_thirdconeM570` combines this middle interval with worker132's b≥4a theorem and proves the raw strip for every actual b≥3a.

For **2a≤b≤3a**, b≥9, the actual statistics are q=0,t=(3a−b:ℕ),u=w=z=0,v=(b−2a:ℕ). In `strip_next_seedM570`, natural subtraction is converted using the corresponding inequalities. Let

    c₀ = −480t + 288at + 96(b−2a),
    c₁ = (96a+96b−864)t,
    Q_next = Q₄ + C(c₁).

The exact actual-source seed is X²[C(c₀)+XQ_next]. The inherited `hfourth_eval_clearedM511` requires only b≥5 and positive real evaluation point; it does not require a≥3. Equality at infinitely many positive points supplies the polynomial equality

    24 X³(1+X)⁹ map(R₄) = Xᵃ(1+X)ᵇ sourceSeed.

Using actual a≥1 and b≥9, the proof rewrites Xᵃ=X·X^(a−1), factors (1+X)⁹ and cancels the nonzero polynomial X³(1+X)⁹. It obtains

    24 map(R₄) = X^(a−1)(1+X)^(b−9)[C(c₀)+XQ_next].

This cancellation avoids an a≥3 restriction or a truncated X^(a−3) interpretation. Extraction at k+1+(a−1)=a+k, coefficient mapping and `swap_coeff46` restore exactly the raw coefficient f₄, with the same positive factor24:

    24 f₄ = coeff((1+X)^(b−9)Q_next,k) + c₀ choose(b−9,k+1).

The additional constant c₁ in Q_next also contributes the unshifted seventh-order choose identity. The accepted scaled equation is therefore not merely the middle correction with t renamed. It uses

    H_next = (k+1)H + 24t F_4(l−2),
    I_next = (k+1)I + c₀ F_5(l−3) + c₁(k+1)F_4(l−3),
    G_next = 4(N−5)(N−6)(l−1) H_next²
             − 3(N−3)(N−4)(l−2)(k+1) J I_next.

H_next is the inherited corrected `stripHMCE8`. The equations for f₃ and f₄ both include k+1 on their left sides; f₂ does not. For l=L+7,a=(k+L+9+t)/3 the factors9,27,81 lead to seven729G_next coefficient certificates. Four direct `ring_nf; positivity` small charts use (a,k,l)=(A+1,K+4,3),(A+1,K+3,4),(A+1,K+2,5),(A+1,K+1,6), with A,K,t≥0. These and the large chart cover the natural gap domain3a=k+l+2+t,l≥3,N≥7. The transfer scalar becomes

    144F_5(N)²(N−5)(N−6)(k+1)²,

with right side C²l²(l−1)G_next. Strict scalar positivity and the final integer cast are explicit; the abstract transfer does not assume C>0.

The all-index proofs retain the necessary zero and small-source cases. Numerator1 uses inherited `source_one_global6`. For a≥2, actual coprimality excludes b=2a, so the adjacent assembly derives **2a<b**, needed to force f₂=0 when i<a by the original polygon support. For i+4>d, f₄=0. The remaining indices give natural k=i−a,l=b−2−k, including k=0 and l=3. No natural subtraction is treated as integer subtraction without its guard.

The middle small-denominator branch reduces to2/7 after excluding2/6 by coprimality. Its literal path is `[false,false,true]`, with i≤8 checked from the inherited literal polynomial and larger i handled by a zero coefficient. The adjacent branch has exactly2/5,3/7,3/8, paths `[false,true]`, `[false,true,true]`, `[false,true,false]`, with finite i≤6,9,10 respectively and larger i handled by polygon zeros. Path injectivity connects these literal certificates to every actual source with those labels. These finite base certificates are part of the universal Lean assembly; the experiments' b≥9 scans omit all four small sources.

## Exact residual and remaining scope

Static comparison shows `InteriorCore63M570` and final `InteriorCore63HalfM570` are exactly the inherited `InteriorCore63FullMCE8` definition with the extra vertical implication `(j=2 → b<3a)` and `(j=2 → b<2a)`, respectively. Forward implication restricts the prior residual. Reverse implication fills the omitted j=2 cone with the corresponding all-source theorem. The final definition still requires actual a≥2 and retains:

* Horizontal triples (i,j),(i+1,j),(i+2,j), all three original polygon guards, i+j+4≤d and j≥5.
* Vertical triples (i,j),(i,j+1),(i,j+2), all three guards, i+j+4≤d,i≥4,j≥2, plus j=2→b<2a.
* Diagonal triples (i,j+2),(i+1,j+1),(i+2,j), all three guards, i+j+8≤d,a+5≤i+j+2,a+2≤b.

The pinned root and its special endpoints remain inherited unchanged. This equivalence is a reduction to an unproved proposition; it neither assumes that proposition nor proves the complete raw bivariate three-direction conjecture.

The final residual source closure contains29 new modules, including the residual itself,47 new theorem declarations and50 definitions. Its28 new transitive imports contain46 theorems and49 definitions. The separately accepted intermediate `MarkovResidualM570` contributes the remaining one theorem/one definition but is absent from the final residual's import graph. The full accepted union is2352 local modules=30new+2322inherited; final residual graph2351=29new+2322inherited. Worker132's excluded MD11 candidates remain excluded historical versions despite the successful newly named M570 proofs.

## Retained validation, versions and trust limits

The three mathematical inventories agree: final source declarations, source-matching successful compilation and selected replay. Thirty modules contain48 named theorems and51 definitions,99 explicit declarations. MiddleDefs and NextDefs each contain23 definitions and no theorem-print rows. Four disjoint successful replay batches select14+14+1+1 modules, with44+48+5+2 explicit declarations. Three successful Audits print20+27+1 distinct closures; every one uses exactly the permitted set `{propext, Classical.choice, Quot.sound}`. Definitions receive replay coverage but are not counted as axiom-print closures.

All36 compiler receipts have immutable snapshots:33 successes are30 final mathematical modules plus three Audits; three return-code1 failures are obsolete NextSource, MiddleAll and NextAll versions. The failures concern missing `map_neg` normalization, `decide` unable to unfold locally irreducible frame for2/7, and unknown `Nat.coprime_self.mp`. Later matching builds separately validate the final proof bodies; unchanged normalized headers do not validate rejected versions. There is no superseded successful source, final unbuilt/compiled-only mathematical module, validation timeout, unsuccessful replay or parser rejection. Initial failed generator/nonexistent-source and exploratory syntax errors are operational failures without accepted Lean receipts.

The isolated driver SHA is `cac25a8b429a24d9cd147dbdac06e77c3f917e3c2d42ca2b5c67ac59492e29bf`, identical to worker132 after suffix substitution. It uses ordinary `env.replay`, compiler-j1, stack131072, joined-task result propagation and the same explicit-name guard. Selected target modules are excluded from each invocation's inherited base; collected explicit `MathGKM.Markov.*M570` names already present or marked unsafe/partial are rejected. All99 explicit names fall within that guard. Generated/private constants outside the predicate and inherited imports retain ordinary replay handling; this is not a claim that every binary constant is independently reconstructed.

Selected source hashes/declaration lists are captured **before** invocation. The checker source SHA is recorded **after** subprocess return. Audit source maps are another post-Audit measurement. These bind the saved sources and matching objects/receipts but do not identify every runtime executable/library/module-data part or establish a fresh source-to-object build of dependencies.

The four target-free local bases contain2322,217,2335,2350 modules. The latter two import27 and28 current133 modules respectively; target-free means free of that invocation's targets, not free of all current-round mathematics. All27 current dependencies of NextAll had completed separate replays before its invocation. ResidualHalf's NextAll object was compiled, but NextAll's replay was still running when the residual replay started. ResidualHalf finished about0.457seconds earlier than NextAll. Thus the documentation's blanket wording “over already replayed imports” needs this chronology qualification. Both replays succeeded before the finalizer; there was no single30-module replay.

The validation wrapper is an exact retagged132 copy, with successful console stdout suppressed but retained in receipts. The Audit wrapper changes only its wall limit120→180seconds after the first20-closure Audit completed under120; parser and permitted-axiom checks remain unchanged. Replay limits240,180,100,100 all succeed with no stack/method change or retry. The finalizer is a retagged132 copy with predecessor manifests128/132. It reconstructs successful source-matching associations, rather than trusting old validation booleans. It does not independently enforce the expected checker SHA, re-evaluate axiom sets, bind their JSON to compiler stdout or prove inventory exhaustiveness; those associations and coverage were checked independently against saved records here.

All2322 inherited source/object pairs match before133 pins and sealed predecessor bindings:2314 older inherited pairs plus eight accepted132 modules, excluding accepted132 ResidualLowMD11. The first, third and fourth replay bases inherit all **212 historical worker121 compiled-but-unreplayed modules**, including195 in the specified subset, plus19 previously accepted121 modules. The second217-node base contains none of the212. **Zero backlog modules were newly selected, rebuilt or replay-recovered.** Reconciliation/preservation does not repair this limitation. Old unbuilt121 modules,128 mathematical/Clustered candidates,130 excluded probes and all five unbuilt132 MD11 candidates are absent from these current proof bases.

Ordinary trust in inherited compiled imports, Lean/Mathlib and runtime binaries remains. This audit ran no fresh proof check or whole-source rebuild and makes no independent protected-root completion claim.

## Finite records and candidate boundary

The audit recounted coprime fraction labels and integer start/index domains only. It did not compute coefficients, expand symbolic polynomials, test gaps or rerun experiment scripts. `source_fractions` counts generated labels, not whole-polynomial comparisons; none of these three scripts compares complete source and positive-word polynomials.

| Saved scan | Bound | Generated / selected fractions | Raw triples | Coefficient identities | Gap positions | Saved zero-containing triples |
|---|---:|---:|---:|---:|---:|---:|
|3a≤b≤4a,b≥9|48|711 /58|2661|5082|1694|967|
|2a≤b≤3a,b≥9|48|711 /115|5750|10071|3357|2393|
|a≥3,b≥9,b<2a|24|179 /79|2678|3477|1159|1519|

All scripts iterate i in `range(a+b+3)` without a polygon filter. The first two restrict identity/gap checks to a≤i≤a+b−5; the high candidate uses a−1≤i≤a+b−5, with k=i−a+1,l=b−2−k and l≥2. Each such position has three scaled coefficient identity tests, one gap-sign test and one scalar-clearing identity test; `gaps` counts positions and the clearing test has no separate counter. All have N≥7. Exterior index counts match the saved zero totals, but this is not a recomputation of coefficient support or of any recorded empty failure list.

The two accepted-cone scans total15153 identities,8411 raw inequalities,5051 gap/clearing positions and3360 recorded zero-containing triples. Their selected fraction domains are disjoint here; equality b=3a would force actual1/3 and is excluded by b≥9. Neither scan selects numerator1. Small2/7,2/5,3/7,3/8 are covered formally elsewhere, not by those scans. Saved failure lists are empty; this bounded evidence is separate from the universal Lean proofs.

The b<2a high-cone source formulas and gap remain candidates. The naive symbolic record has three cones×eight charts=24 charts; its first large chart and all three l=7 charts have negative monomial coefficients. That is failure of a chosen positive-coefficient representation, not a negative polynomial value, raw counterexample or refutation of Conjecture63. The refined record has three×eleven=33 charts: k≥1/k=0 at l≥9, l=2…8 with k shifted by max(7−l,1), and k=0 at l=7,8. These index labels cover k≥0,l≥2,N≥7; the saved coefficients are nonnegative, but no expansion was rerun and no Lean source/statistic bridge or universal gap theorem is admitted. Algebraic charts do not themselves impose the source cone upper bounds. The 1099-monomial counts apply to the three `large_kpos` records, not every refined chart.

Named experiment scripts, outputs and inherited probe inputs are hash-bound in the supplements. `scan.py` lies outside the before/index pin scope; its observed current hash is not a runtime-import binding. None of these finite/symbolic observations changes the exact residual.

## Cutoff and preservation

The sole finalizer is events237–238. It succeeds and reports30 modules,48 closures,three unsuccessful build receipts,5834 unchanged prior inputs and180 indexed artifacts. It verifies saved128 and132 manifests as preservation, not validation recovery. The archive has182 artifacts:180 indexed plus its manifest and last-verification record. There is no documentation refresh, second finalizer or later proof receipt used to fill a missing check.

| UTC2026-10-16 milestone | Time |
|---|---|
|Controller start|08:04:15.746603|
|Middle14-target replay finish estimate|08:22:44.101692|
|Next14-target replay finish estimate|08:30:31.936622|
|ResidualHalf replay finish estimate|08:32:55.819847|
|NextAll replay finish estimate|08:32:56.276862|
|Final Audit finish estimate|08:32:59.342630|
|Validation write|08:33:37.362822|
|Final-check write|08:33:39.524066|
|Manifest write|08:33:39.828552|
|Last-verification write|08:33:40.253999|
|Nominal deadline|08:34:15.746603|
|Controller finish|08:35:06.427850|

Replay/build finish estimates combine filename start timestamps and retained elapsed durations; they are not independent process-exit timestamps and have small subsecond discrepancies with receipt mtimes. Command completion order also confirms the overlapping singleton replay order. Last proof completion is about76.404seconds before deadline; final verification35.492604seconds before. Controller finish is50.681248seconds after deadline and86.173851seconds after verification. The archive last-verification mtime08:35:06.350818 is snapshot metadata, not the project verification time.

The238-event stream has112 started items, all completed;453851 activity bytes account for the retained log. It ends with successful finalizer completion, without a final report or turn completion. No report is inferred from elapsed time, successful finalization or successor prose. Exact-request current/archive bindings and late-file/stability observations are retained in the validation supplement; the historical timeout and inherited replay backlog remain unchanged.

The root SHA remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; canonical ASCII contract SHA `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Byte-preserving older storage maintenance changes no proof scope or historical validation status.

## Bound supporting files

The seven supplements and final integrity seal bind source inventories, exact mathematical scope, finite-domain counts, saved validation, replay method and their limitations. Hashes are recorded below after independent cross-review; no project execution is part of that review.

| Supplement (same worker prefix) | SHA-256 |
|---|---|
| `mathematical_source_hashes.json` | `5f0549162a968c439e9391daa26300715be72fd2d88eca89dccae60d8f0343ea` |
| `source_structure_audit.json` | `64aebd084c565c099edfb49e6df82e85f3032abc5b5a2b96a324e205513d23fc` |
| `finite_domain_audit.json` | `ddadd8460b57fdf33d22e73360da650130587791375a6278fbe92e61392376c5` |
| `validation_audit.md` | `1e9cd77df62e1e5ce43c9a1d01a173f29e2d9eb53ae638d241ffdbeb3e25bb37` |
| `validation_evidence.json` | `296e3262ec6e4f5194a6dd961438ec275d36041b372ab2ed326c152c0eb116ea` |
| `replay_method.md` | `72c4bdb83c3a4a9931e78e0e7abe084e168d9a6e77113abc2edc175efe4cf202` |
| `replay_method_evidence.json` | `bab1c235e6dffbb59c706c517ed3c753cf54f50bbb37eec5f38dca2777059621` |

Final method stability:154 inputs unchanged at08:56:38.506988UTC. Final validation stability:9095 inputs unchanged during09:00:56.203306–09:01:52.582075UTC. Exact-request late observation at09:01:52.626000UTC found no extra or missing file and no separately preservable late receipt. The2322 inherited source/object pairs were observed08:54:49.123650–08:56:15.885766UTC. These are observation times, not retroactive proof checks.

Own audit-file consistency confirms all30 new source hashes and declaration inventories,48 exact printed names and30 named older-source comparison hashes. The latter include ResidualLowMD11 solely as a predecessor comparison outside the actual current import graph;29 are current dependencies. Independent audit-file-only cross-review and final file digests are recorded in the integrity seal.
