# Worker 000134: partial validation, unfinished source strip, timeout retained

Request `81f80b2ddbc44c6e86d8079cfc7a8e81`. This independent archive-first audit reads saved worker134 records and exact named current/predecessor counterparts. It executes no project program, Lean, checker, replay, experiment or finalizer; no coefficient, polynomial, recurrence or gap computation was performed. Own computations are static parsing, content hashing and integer domain/index counts. No project file was changed, proposer contacted or assisted, or active135 mathematics/reconciliation inspected. All audit outputs are under `/private/tmp/math_gkm_godel_20261013`.

**Worker134 remains TIMEOUT, returncode0, reportnull, elapsed1904.2283971309662seconds.** Its successful finalizer records partial validation. It does not supply a missing final report, complete outstanding proof checks or resolve the root. The archive contains43 mathematical source files with299 theorem headers and66 definitions, but their validation levels differ materially:

| Historical saved status | Modules | Theorems | Definitions |
|---|---:|---:|---:|
|Compiled, axiom-printed and successfully selected-replayed|16|40|65|
|Compiled and axiom-printed, without successful selected replay|23|247|0|
|Compiled only, excluded for absent axiom audit/replay: HighCone2Gap|1|8|0|
|Unbuilt excluded drafts: HighGap, HighAll, Residual|3|4|1|
|All mathematical sources|43|299|66|

Thus the final validation list's39 modules/287 printed closures are **not39 replayed modules**. All21 coefficient-certificate modules compiled and were printed, but none received a successful selected replay. The first two covering assemblies compiled and were printed without successful replay; the third compiled but remained excluded. No new universal actual-source raw j=2 strip or stronger root equivalence is established by this round's retained validation. The last validated root reduction remains `Conjecture63 ↔ InteriorCore63HalfM570`, retaining j=2,b<2a and higher obligations.

The new fully checked ingredients are an arbitrary-degree falling-factorial coefficient identity, degree3/5/7 adapters, exact actual-source row formulas and scaling, a conditional positive-scalar transfer, cone definitions/expansion identities, and ten small-source certificates with an explicit upper index guard. The source-statistic bridge joining the real polynomial cones to actual paths, the all-source assembly, and the proposed residual are unbuilt. This distinction is preserved even though saved documentation discusses their intended formulas.

## Mathematical source and exact conditions

`fallM81F x d` is the real descending Pochhammer evaluation. `falling_monomialM81F` quantifies over natural k,l,d,r with **r≤d and d≤k+l** and states

    F_d(k+l) · coeff((1+X)^(k+l−d) X^r,k)
      = choose(k+l,k) F_r(k) F_(d−r)(l).

The degree d is not bounded by7; the displayed natural guards remain necessary. Its `falling_chooseM81F` helper additionally requires r≤k. If d−r>l, the helper explicitly makes the choose and descending factorial zero; if r>k, the monomial theorem uses coefficient and descending-factorial zeros. Factorial cancellation occurs only after the relevant inequalities, with strictly positive factorial product. There is no assumed positivity of a coefficient. The explicit fall-zero and fall-successor lemmas are included in the final checked version. Degree3,5,7 seed theorems linearly combine this identity for arbitrary real seed coefficients, with the respective degree≤k+l guard.

For an actual source `(frame path).mid=(a,b,P)`, the new row formulas use **i=a−1+k**, not a+k. `high_second_coeffM81F` requires b≥5 (actual a≥1 is inherited), `high_third_coeffM81F` requires a≥2,b≥7, and `high_fourth_coeffM81F` requires **a≥3,b≥9**. They extract seed coefficients at k,k+1,k+2, respectively, and retain the positive factors2,6,24. Integer-to-real polynomial mapping, `swap_coeff46` and guarded equalities

    k+(a−1)=i,  k+1+(a−2)=i,  k+2+(a−3)=i

connect those identities to the original raw integer coefficients at (i,2),(i,3),(i,4). Unlike worker133's cancellation variant, this fourth-row adapter directly uses `horizontal_fourth_formulaM511` and retains its a≥3 hypothesis. The lower natural exponents are not treated as unguarded integer subtractions.

The three `source_high*_scaledM81F` theorems share actual a≥3,b≥9,b=k+l+2,l≥2, with natural k,l. **They impose no slope inequality.** Let N=k+l=b−2,C=choose(N,k), and write c₂,c₃,c₄ for the raw coefficients at i=a−1+k. The exact scaled identities are

    2F_3(N)c₂ = C J,
    6F_5(N)(k+1)c₃ = C l H,
    24F_7(N)(k+1)(k+2)c₄ = C l(l−1) I.

Here J,H,I are defined from the literal second/third/fourth source seed coefficients. They use descending factors F_r(k)F_(3−r)(l), F_r(k+1)F_(5−r)(l−1), and F_r(k+2)F_(7−r)(l−2). The statistics remain the actual natural expressions q=(2a−b)₊,t=min(b−a,(3a−b)₊),u=(3a−2b)₊ and inherited h4v/h4w/h4z. The algebraic adapters use (k+1,l−1) and (k+2,l−2), with l≥2 ensuring these shifts and casts are valid. Multiplicative `bc_lower6` identities convert the shifted binomials without dividing by C or any coefficient, retaining zero cases.

`high_transferM81F` is conditional: its hypotheses include all three scaled equations and **G≥0**, in addition to real k≥0,l≥2,N≥7. It defines

    G = 4(N−5)(N−6)(k+2)l H²
        − 3(N−3)(N−4)(k+1)(l−1) J I,

and proves the exact clearing identity

    144F_5(N)²(N−5)(N−6)(k+1)²(k+2)(c₃²−c₂c₄)
      = C² l G.

The left scalar is strictly positive under the displayed guards, and the right side nonnegative under G≥0. C is an arbitrary real; C>0 is not required. This proves the transfer implication, not the missing actual-source gap sign. The mathematics document has a stray `,+` joining its displayed right side and gap definition; the checked Lean statement separates the equations correctly.

## Three polynomial cones and chart coverage

The independent real parameter Q is not the actual source statistic q in every cone. With b=k+l+2, the three polynomial substitutions are:

| Cone | Numerator formula | Substituted (q,t,u,v,w,z) |
|---|---|---|
|0|a=(b+Q)/2|(Q,b−a,0,0,Q,0)|
|1|a=(2b+Q)/3|(2a−b,b−a,Q,0,b−a,0)|
|2|a=(3b+Q)/4|(2a−b,b−a,3a−2b,0,b−a,Q)|

The expansion identities are unrestricted real polynomial equalities. For denominators s=2,3,4, they scale J,H,I by s²,s³,s⁴ and G by s⁶=64,729,4096. There are seven coefficients in Q for each scaled gap. Their definitions and four expansion theorems per cone are among the16 successfully replayed modules. These identities themselves do not prove the gap nonnegative.

Each coefficient has eleven real nonnegative-parameter certificates:

* k=K+1,l=L+9 and k=0,l=L+9;
* l=2,…,8 with k=K+max(7−l,1);
* k=0,l=7 and k=0,l=8.

Each certificate supplies an explicit integer Horner identity proved by ordinary `ring`, followed by `positivity`; zero identities use a form that tolerates a goal already closed by rewriting. Static parsing verifies231 certificate statements in21 modules and nonnegative integer-literal right sides using only K,L,+,*,parentheses;18 of the right sides are literally0. The audit did not expand or evaluate these polynomials. Compilation and permitted-axiom print evidence exist for every certificate, but successful selected replay does not.

The covering proofs have natural k,l with l≥2,k+l≥7. Their case split retains k=0 separately: l≥9 or l=7,8. For k≥1, l≥9 uses the large shift and l=2,…,8 uses shifts5,4,3,2,1,1,1. This includes the boundary l=2 and k=0 where permitted by N≥7. All21 coefficient-cover proof bodies are identical after ordinary name normalization. The final cone sign theorem combines seven nonnegative coefficients with Q≥0 and divides only by the positive fixed scale. Cone0 and Cone1 each have eight compiled/printed but unreplayed theorems; Cone2 has eight compiled-only theorems, excluded from the printed set.

The real cone formulas allow independent Q≥0 and do not themselves enforce the source upper/lower slope boundaries. The unbuilt `high_source_gapM81F` is intended to bridge them for natural a≤b≤2a,b=k+l+2,l≥2,N≥7. Its source text splits first at3a≤2b, then at4a≤3b, and chooses Q=2a−b,3a−2b,4a−3b respectively; it attempts the necessary min/h4-statistic equalities and guarded natural casts, including equality boundaries. This remains an **unbuilt bridge**, not a verified source correspondence. No new source cone inequality is inferred by completing that reasoning outside Lean or by treating independent real parameters as source witnesses.

## Small cases, zeros and unbuilt all-source reduction

`MarkovHighSmallM81F` is compiled, replayed and printed. Its ten literal cases are2/3,3/4,3/5,4/5,4/7,5/6,5/7,5/8,6/7,7/8. They use the corresponding inherited literal protected polynomials and actual path injectivity. The exact per-case bound is **i≤a+b−1**, giving104 natural index positions across the ten cases. The combined `source_high_smallM81F` requires actual a≥2,b≤8,b<2a and this same i≤d guard. Coprimality and finite natural label classification select exactly the ten sources. It is not an all-natural-start theorem as stated; its upper guard must not be silently discarded.

The unbuilt HighAll source intends to combine inherited b≥2a coverage with the remaining b<2a cases. It handles i<a−1 by a zero raw coefficient at (i,2), and i+4>d by a zero coefficient at (i,4). For remaining b≥9 indices it sets k=i−(a−1),l=b−2−k≥2 and derives a≥3 before calling the new source identities and missing gap bridge; b≤8 uses the checked small-source theorem within its index guard. These are descriptions of saved **unbuilt** `source_high_interiorM81F` and `source_strip_fullM81F`, not admitted universal statements.

Likewise `MarkovResidualM81F` is unbuilt. Static comparison shows its proposed `InteriorCore63M81F` changes the prior HalfM570 vertical condition j≥2 plus `(j=2 → b<2a)` to j≥3, retaining all other clauses exactly. Horizontal triples keep all three polygon guards,j≥5,i+j+4≤d. Vertical triples keep all three guards,i≥4,i+j+4≤d. Diagonal triples remain (i,j+2),(i+1,j+1),(i+2,j), all three guards,i+j+8≤d,a+5≤i+j+2,a+2≤b. The inherited endpoints and all zero conventions are unchanged in the draft. Its iff proof depends on the unbuilt universal strip and therefore supplies **no accepted residual reduction**. The pinned root remains open.

## Finite-domain records

The completed denominator≤24 script selects actual labels a≥3,b≥9,b<2a. Own integer-domain counting reproduces179 generated coprime fractions,79 selected,2678 raw triples,1159 identity/gap positions,3477 coefficient identities and1519 exterior index positions matching the saved zero-containing count. Starts are `range(a+b+3)` without a polygon filter; identity positions are a−1≤i≤a+b−5. Each position performs three coefficient identities, one gap-sign test and one scalar-clearing identity, with no separate clearing counter. N≥7 throughout. No whole-polynomial comparison is performed by this script.

The saved failure list is empty and the wrapper's successful stdout JSON exactly matches the saved result. The audit did not recompute any coefficient, gap, support truth or reported absence of failures. Small b≤8 formal cases are outside this experiment. The denominator48 execution was explicitly interrupted with Ctrl-C, exit130, during exact polynomial multiplication; it produced no completed result or claimed partial counts. The smaller script is exactly the saved48 script with the bound changed to24 and is a separate completed execution, not evidence that48 finished. The21-entry design record contains eleven chart term-count fields per coefficient; those symbolic monomial counts were read, not re-expanded.

The experiment depends on the inherited literal seed source and `scan.py`. Named input hashes are preserved in the supplements; `scan.py` is outside the before/index pin scope, so its observed current hash is not an execution-time import binding. Finite passes and symbolic chart metadata do not validate HighGap,HighAll or the new residual.

## Validation provenance and historical boundary

The successful selected batches are8 initial modules (14 theorems/5 definitions),6 cone Defs/Expand modules (12/60), and2 HighCoefficients/HighSmall modules (14/0):16 distinct targets and105 explicit constants. Four definition-only targets account for64 definitions; Falling supplies the other one. Every explicit selected name ends in M81F, with no duplicate, forbidden-token flag, target/base collision or missing final-source compilation. Their recorded isolation counts19+72+14 match these inventories.

Two ten-module cone0/cone1 unions time out under150second limits. Each selects89 theorem declarations and20 definitions,109 explicit constants, with final source hashes. Neither receipt has a successful result or isolation-pass output; literal `None` streams cannot establish partial coverage. Later successful replay of the three Defs/Expand pairs recovers those pairs only. Sixteen current modules occur only in failed selections (fourteen cone0/1 certificates and two Gaps); eight compiled modules were never selected (seven cone2 certificates and Cone2Gap). The three unbuilt drafts have no replay selection.

Three successful Audits print14+178+95=287 distinct closures, each exactly `{propext, Classical.choice, Quot.sound}`. Exact requests, compiler output, axiom JSON source maps and validation pointers match. Only40 of these printed closures belong to successfully replayed targets. The178-name Audit passes while both cone replays are still running and subsequently time out. Axiom printing is not alternate body replay. The95-name Audit covers the cone2 Defs/Cert/Expand group, HighCoefficients and HighSmall, not Cone2Gap.

The archive has58 numeric compiler receipts and59 immutable source snapshots. Numeric results are43 successes (40 mathematical modules, three Audits),11 return-code1 errors and four timeouts. No successful source is superseded. All11 error snapshots are obsolete; four timeouts concern Falling at120seconds (obsolete), HighSmall at120, Cone2Cert4 at150, and Cone2Gap at90. The latter three match final bytes and later compile successfully. HighSmall also receives print/replay coverage; Cone2Cert4 remains printed but unreplayed; Cone2Gap remains compiled only. Its100second retry succeeds in74.387750seconds. Failed proof-script versions and unchanged theorem names are not admitted merely because a later version succeeds. Rejected Falling versions lack the final fall-zero/fall-successor declarations; other rejected-to-final headers agree after whitespace normalization without validating their rejected bodies.

Historical unsuccessful receipt count17 is **15 compiler outcomes plus two replay timeouts**. The extra source snapshot belongs to the last eight-name Cone2Gap Audit, with no archived numeric outcome. Its late timeout is preserved separately below and does not change17 to18 in the historical finalizer record. Diagnostic errors concern zero rewriting, unfolding, stale shifted indices, redundant tactics, cast/chart goals and coefficient simplification, not a recorded mathematical counterexample.

## Replay method and inherited imports

Driver `ReplayIsolatedM81F.lean` SHA-256 is `1e10c9e3856b15a87fc742608fc736945764af682bb6d3157c97c3dfcd834f2d`, identical to worker133 after suffix substitution. It uses ordinary `env.replay`, compiler-j1, stack131072 and joined-task result propagation. Its explicit guard rejects collected `MathGKM.Markov.*M81F` names already present in the imported base or marked unsafe/partial; all105 successful explicit names are covered. Available target module-data/server/private parts are collected, but generated/private/inherited constants outside the guard retain ordinary replay behavior. There is no independently enumerated binary-constant or imported-body rebuild claim.

Selected source hashes and declared names are measured before invocation; checker source SHA is measured after subprocess return, and Audit source maps separately after Audit completion. All retained measurements match the final sources. They do not identify every runtime executable/library/module-data part or independently reconstruct source-to-object provenance.

The validation wrapper is exactly retagged133. A new foreground batch helper schedules the same build wrapper with150second bounds and at most three concurrent jobs; each Lean build still uses-j1. It joins results and returns0 only if all results succeed. Smaller replay batches change scope, not checker semantics. The Audit wrapper changes only its180second limit to35 at events194–195 for the final Audit; the earlier three successful Audits used180. Parsing, exact-name/permitted-set checks and successful-compiler requirements remain unchanged. No larger-stack retry or alternative proof-checking path is used.

| Replay | Result / limit | Local base | Current134 modules in base |
|---|---|---:|---:|
|Eight initial bridges|pass /180s|208|0|
|Cone0 ten-module union|timeout /150s|108|1|
|Cone1 ten-module union|timeout /150s|108|1|
|Six Defs/Expand modules|pass /120s|108|1|
|HighCoefficients/HighSmall|pass /90s|226|7|

Targets and their explicit names are absent from their own imported bases. Current HighDefs is imported by the cone bases; seven current bridge modules are imported by the last base. Each had matching successful compilation and completed selected replay before the dependent invocation. No compiled-only certificate or Gap module is imported into a successful replay. The union of successful bases is226=7current+219inherited, not the sum of overlapping base sizes.

The successfully replayed source closure is235=16new+219inherited. Compiled-and-printed closure258=39new+219inherited; compiled closure259=40new+219inherited. The **unbuilt** Residual draft closure is2394=43new+2351inherited and includes299 new theorem headers/66 definitions, including the residual itself. Adding four Audit sources gives2398. Driver and external Lean/Mathlib trees are separate. No local import cycle or unresolved local source import is found.

All2351 named inherited source/object pairs match before134 pins and sealed133 bindings:2322 older pairs plus29 accepted133 modules, excluding its separately accepted intermediate ResidualM570. Only219 of these pairs belong to the currently checked/compiled short closure; the larger mapping belongs to the draft graph. Pair observation was09:24:38.382283–09:25:38.691478UTC, not a new source rebuild. The inherited search path contains136 entries behind the current evidence directory.

**All212 historical worker121 compiled-but-unreplayed modules, including195 in the specified subset, are absent from current successful replay bases and compiled/printed closures.** They remain reachable through the unbuilt final draft graph, and none is a current build/replay target: **zero backlog recovery**. It would be wrong either to claim recovery or to say they were imported by this round's successful replay. No worker133 mathematical module is in those successful bases;29 are reached by the draft graph only. Old128/133 timeouts and excluded historical drafts are not upgraded. Ordinary trust in inherited compiled imports, Mathlib/Lean and runtime binaries remains; no fresh whole-source rebuild or root completion audit occurred.

## Finalizer, preserved artifacts and exact cutoff

The finalizer is materially rewritten. It enumerates suffix-matching mathematical sources instead of requiring an explicit module list. A validation entry requires a matching successful compiler receipt and source-matching axiom JSON; successful replay is **optional**, recorded as a path or null. Missing compile/axiom evidence produces an explicit exclusion rather than failure. This is accurately labeled in its own scope string. The successful finalizer therefore certifies its recorded39/16/287 split and four exclusions, not full validation of every mathematical source.

Independent static checks verify that39 entries plus four exclusions exhaust all43 sources, and the16 non-null replay entries equal the successful target union. The finalizer does not itself enforce a precommitted count/checker hash, re-evaluate axiom sets, bind axiom JSON to compiler stdout or reconstruct imported source/object relations; those actual saved associations were separately audited. Validation is written before subsequent preservation assertions, so its existence alone would not establish a completed finalizer. Successful events197–198 do establish that its stated checks finished.

The archive/controller contain248 artifacts,246 indexed plus the manifest and last-verification records. Types are43 `.olean`,77 `.json`,107 `.lean`,16 `.py`,5 `.md`;107 Lean files are48 final sources plus59 snapshots. All final mathematical source/object/index/controller/receipt bindings checked agree. Initial preservation has5891 entries and excludes two own files: setup (unchanged) and checkpoint (changed), leaving5889 prior inputs, including144 pyc entries. All six inherited administrative pins and prior inputs checked match. Prior manifest verification is100 worker132 entries plus180 worker133 entries. **526 is246+100+180 across three manifests, not worker134's own manifest size.** These preservation checks replay no old proof or side effect.

The last Audit starts at event196 while finalizer197–198 proceeds. Its eight Cone2Gap print requests are not counted as successful outputs. Event199 is an unstructured progress message; no final.json, structured final report or turn.completed exists. Its statement that the source-statistic assembly remains unchecked refers to unbuilt HighGap/HighAll, not the fully checked three HighSource coefficient identities. There are199 events and94 started items, one unmatched final Audit;536463 activity bytes account for the saved log. This is saved-event accounting, not an independent process census.

| UTC2026-10-16 milestone | Time |
|---|---|
|Controller start|08:36:06.297250|
|Initial eight-module replay finish estimate|08:56:23.000466|
|Cone0 /Cone1 replay timeout estimates|09:00:29.530513 /09:00:30.546403|
|Last successful95-closure Audit finish estimate|09:02:31.598218|
|Defs/Expand replay finish estimate|09:02:35.519965|
|HighCoefficients/HighSmall replay finish estimate|09:04:22.316876|
|Cone2Gap successful build finish estimate|09:04:51.678723|
|Validation write|09:05:47.556626|
|Final-check write|09:05:52.717831|
|Manifest write|09:05:53.894330|
|Last-verification write|09:05:54.820690|
|Nominal deadline|09:06:06.297250|
|Late failed Audit receipt write|09:06:19.909114|
|Controller finish|09:07:50.525646|

Receipt finish estimates add retained durations to filename start timestamps; they are not independently timestamped process exits. File mtimes are write observations. All248 historical project artifact mtimes precede deadline. Final verification precedes deadline11.476560seconds; host finish is about104.228397seconds after it. The archive verification copy mtime09:07:49.748471 is snapshot metadata, not the project verification time. No mechanism for the absent report or omitted late receipt is inferred.

Root source remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical sorted compact ASCII contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Storage-only byte-identical COW consolidation of already audited123–133 retained copies is an attributed operational metadata change;134/135 files, live imports, sources and receipts were untouched. Content hashes, not older inode/ctime, bind this audit.

## Separate late failure bundle

The exact current file `/Users/sasha/math_gkm/evidence/markov-81f80b2d/build-1792141544717794000.json` was absent from the controller archive and246-entry index. It matches the archived final Audit source and snapshot hash and records a35.188140second **timeout**, with no returncode and literal `None` streams. Its09:06:19.909114mtime is13.611864seconds after nominal deadline, though before host finish. It supplies no compilation success, axiom coverage or proof upgrade.

Preserved copies are confined to `/private/tmp/math_gkm_godel_20261013/markov_worker_000134_late_evidence/`:

| File | SHA-256 |
|---|---|
|`build-1792141544717794000.json`|`68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`|
|`manifest.json`|`a5b51ed21032e5162d7d7e128de0543a2584cd455590070e12458b54c9b8f8b1`|

The preservation manifest records the source path, observed mtime, original bytes/hash and explicit nonmembership in controller/archive/index. The historical counts remain58 numeric compiler receipts/59 snapshots,17 unsuccessful receipts,287 prints and16 replayed modules. The late failed receipt must be preserved as a separate bundle, not inserted into the old archive/index or backdated into validation. No later successful evidence is inferred.

## Bound supporting files

The seven supplements below bind source hashes, exact source/status structure, finite domains, retained validation and replay method. The final integrity seal records independent audit-file-only cross-review and the separate late bundle. No missing project check is performed during this review.

| Supplement | SHA-256 |
|---|---|
|`markov_worker_000134_mathematical_source_hashes.json`|`810a829ad5c0f4cca4e005cea29a71c4b155e3f669671c96953cb3d6e9dc9dfe`|
|`markov_worker_000134_source_structure_audit.json`|`3a929efd9275c80d7c5dac2abc355edd458772c24f7ea9f672826e9a7d8af481`|
|`markov_worker_000134_finite_domain_audit.json`|`679ee91af1fb86dc5bab1295754b6f1bf64103a8c82938b246131e7f2547faab`|
|`markov_worker_000134_validation_audit.md`|`d9f68b568af24fc2fc122120f4e53ad6665e08f87d9735e610172c989b64bc4f`|
|`markov_worker_000134_validation_evidence.json`|`7f52eca4e93bc7a4a308ee3e1d234c2f5d66bfe249e37bb2ed5b00e5122f7d4d`|
|`markov_worker_000134_replay_method.md`|`48c3bd4454833b383f39fda3b6e7a3abc2ef810214baeaf4d58f3c80d5cece8a`|
|`markov_worker_000134_replay_method_evidence.json`|`6b1d772fe199667be623a57c53adecb85a9fa6d37689e877e6c27ac911d62f21`|

The final method observation rehashed218 retained inputs unchanged at09:27:47.138288UTC. The validation observation rehashed9203 retained inputs unchanged during09:28:23.752430–09:29:44.911354UTC. The09:29:44.937270UTC late-file observation found only the separately preserved failed Audit receipt described above, with no other extra or missing file in the observed exact-request scope. These are static byte-preservation observations, not proof executions or upgrades to the historical cutoff.

All43 new mathematical source hash/declaration comparisons and21 named older-source comparisons agree across the audit supports. Nineteen of those older named comparisons are in the currently replayed base; `MarkovNextAllM570` and `MarkovResidualHalfM570` occur only in the unbuilt draft graph. Independent audit-file-only reviews found no necessary correction to the main findings. The integrity seal binds the final main/support bytes and the separate two-file late bundle; no project input is reread or changed while sealing.
