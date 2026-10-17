# Closed worker 000170 — independent mathematical and retained-validation audit

Request `a646848db8dc4dffbca4cc335370b378`, suffix `MA64`. The controller records **completed**, return code **0**, a delivered report, completion null and mathematical resolution false, after **1586.8477318286896 seconds**. The new unconditional result is the complete first-correction horizontal row for every actual numerator-three source, including all natural starting columns, zero coefficients and small parameters. Combined with the previously proved lower rows, the direct source theorem covers **`3j≤b+3`**. Full Conjecture 6.3 remains open.

All **12 final mathematical modules, 53 theorem declarations and 9 definitions** have matching retained final-source compilation, joint replay and permitted-axiom prints. There are thirteen rejected compiler attempts. One module has three distinct successful source versions; only the last version receives final-source credit. The next-row formula and its scalar tests remain experimental. No new vertical or constant-sum diagonal region is proved in this round.

This is an archive-first static audit of closed worker 170 and explicitly named inherited/current counterparts. No project code, compiler, Lean/checker/replay, experiment, generator, CAS or finalizer was executed or imported. No coefficient, binomial, gap, sign, polynomial value, ratio or certificate was recomputed. Audit-owned code hashes, parses retained text/data, compares literal syntax and counts finite index domains. All audit writes are under `/private/tmp/math_gkm_godel_20261013`; no project edit, proposer contact, proof repair, research guidance or active worker 171/later inspection occurred. Earlier outcomes, seals and observation windows remain final.

## Exact unconditional source result

`first_correction_closedMA64` proves, for every natural **`q≥1`**, both Boolean residues `r` and every natural `i`,

`threeRaw(q,r,i,q+1) * threeRaw(q,r,i+2,q+1) ≤ threeRaw(q,r,i+1,q+1)^2`.

The actual denominator is **`3q+1` when `r=true`** and **`3q+2` when `r=false`**. The earlier path classification proves that every actual generated path with numerator three is represented, with `q≥1`; the source coefficient identity is literal integer equality, not merely a comparison of auxiliary polynomials.

`source_lower_first_pathMA64` states the final result directly: for every path with `(frame path).mid.a=3`, all natural `i,j` satisfying **`3*j≤(frame path).mid.b+3`** obey

`coeff(p,i,j) * coeff(p,i+2,j) ≤ coeff(p,i+1,j)^2`.

The proof uses the accepted source classification to derive `j≤q+1`, then separates `j=q+1` from the previously closed lower range `j≤q`. No formula, gap-sign, shape or denominator-bound premise remains in this theorem. The inequality is weak log-concavity; it does not assert strictness at zero coefficients. The scope includes all natural starts, and therefore all polygon-valid horizontal triples in these rows.

The previously open first-correction predicate was exactly the window **`q≥2, 7≤i≤correctionExponentMDB2 q r+2`**. Worker 168 handled the prefix `i≤6`, the tail `i>d+2` and small parameters; worker 169 proved a boundary of the sufficient auxiliary criterion. Worker 170 now supplies the whole remaining criterion and closes this window. It adds an entire row for unbounded numerator-three denominators; it does not newly prove every numerator-three row or direction.

The `q=1` cases use the inherited small-source theorem through `first_correction_all_iff_windowM418`. They are not substituted into the first-correction factorization requiring `q≥2`. The prefix/tail split retains zero starts and tails. The transport uses the exact correction exponent `q−2` for true and `q−1` for false, with correction constants 8 and 4 respectively. No factorial, multinomial or other rescaling of the final raw coefficients occurs.

## Quantitative complete-kernel estimates

The auxiliary complete polynomial is `completeLiftMA64 j t = (qPolyM7E2 j t).comp (X+1)`. Its coefficient at `m` is the inherited integer `liftTermMAE9 j t m`, cast to the reals. This complete polynomial has degree at most `j`; it must not be confused with the triangular reversed lift used later in source transport.

The general composition upper bound assumes nonnegative coefficients of a real polynomial `P` and `P.natDegree≤j`. It bounds coefficient `m` of `P(X+1)` by its constant coefficient times `choose(j,m)`. The lower bound needs only coefficientwise nonnegativity and retains a chosen coefficient of `P`; the proof explicitly handles that index being outside the support. These statements retain zero polynomials, zero binomial factors and all natural coefficient indices.

For the inherited `Q` gap, the top coefficient at `2j` is

`N = choose(t+j+4,j)^2 − choose(t+j+3,j)*choose(t+j+5,j)`.

Inherited coefficientwise nonnegativity of the `Q` gap, followed by `X+1` substitution, gives a coefficient lower bound by `N*choose(2j,m)`. A corresponding upper bound on the central complete square uses **`M=completeLift(j,t+1).coeff(0)^2`**. These are universal formal inequalities, not inferred from the finite experiments.

For **`t≥4, j≥t+3`**, the auxiliary bound is

`U=8*(j−t−2)/(t+1)`, and `κ=j*(t+j+5)/(t+5)`.

The accepted binomial lower bound supplies `choose(t+j+3,j)≥(j+1)(j+2)(j+3)(j+4)(j+5)/120`. Two rational certificates then prove the exact scalar margins

`2*U*L(t+2,0)+U^2≤N`,

`U*κ*M≤N*L(t+1,1)`.

Here `L(t,m)` abbreviates the actual inherited lift term, with fixed `j`. The rational-to-real casts, denominator factors and fixed-index identities are explicitly proved in the source adapters. The audit reads those saved arguments without evaluating the expressions.

The first margin proves coefficientwise nonnegativity of the complete gap after adding arbitrary nonnegative constants `a,b,c` to its left, middle and right polynomials, with **`a,c≤U`**. The middle addition `b` needs no upper bound. The proof retains the negative constant product `a*c`; it treats coefficient zero separately, where that constant term is present, and all other coefficients separately. Increasing the central nonnegative correction does not introduce a hidden source assumption.

## Generated certificate boundary

The two certificates use rational `x,g,z≥0`, with `t=x+4`, `j=x+7+g`, and `B=marginBase(j)+z`. One proves a rational identity as `num/den`, with

`den=(x+5)^2*(x+8)^2*(x+9)*(x+10)*(x+11)`.

The relevant nonzero hypotheses and denominator positivity are explicit before `field_simp` and `ring`. The second certificate proves its polynomial equality directly with `ring`, then uses `positivity`. Python-generated expressions are proposals; the accepted ordinary Lean proofs supply the proof credit.

Both long generated expression lines were omitted from display, structurally parsed and hash-bound; all other source definitions, theorem statements and proof bodies were read. The first has **229 coefficient literals: 34 integer literals and 195 rational literals**. The second has **107: 38 integer and 69 rational literals**. Their fraction denominators are varied positive unsigned literal tokens, not uniformly 2. No fraction, polynomial, positivity claim or degree was evaluated by the auditor. The reported degree vectors `(16,12,2)` and `(12,8,1)` and reported zero negative-coefficient counts remain generator metadata.

The current generators extract a named sparse-polynomial definition slice from the closed worker 169 generator. They do not import that predecessor's whole top-level program. The current generators themselves execute at top level and were not imported by the auditor. Generated final Lean sources separately match successful immutable compiler snapshots, final replay maps and axiom maps.

## Zero-safe quantitative cut transport

`quantitative_cutMA64` is a generic theorem for nonnegative-coefficient real polynomials `A,B,C`, their inherited `PairOrder`, a real **`M≥0`**, an arbitrary real `N`, and the full coefficient inequalities

`N*coeff(B²,n)≤M*coeff(B²−AC,n)` for every natural `n`.

It proves the corresponding inequality after every common lower cut. There is **no generic `N≥0` premise**. The proof applies the existing finite-sum theorem to `M*pairGap−2*N*pairDen`; the `N` contributions cancel from the pair comparisons. When `pairDen=0`, the remaining signed numerator is proved nonpositive using coefficient nonnegativity and `M≥0`. Zero denominator terms are retained rather than divided away or excluded.

The source-specific application supplies the already proved uncorrected pair order, quantitative complete margin and nonnegative scale. Reflection and the common monomial shift preserve the coefficient indices. At the border `k=t+h`, a specific nonnegative summand of the middle square supplies the required lower bound. The diagonal lift-step estimate is proved for **`1≤n≤j`**; the application explicitly supplies these bounds with `n=t+1−h`.

The final border argument cancels only **`kernelScaleMA64 j t>0`**, established from the positive fixed auxiliary coefficient `L(t+1,0)`. It does not divide by a raw source coefficient or discard any raw zero. The other multiplier is nonnegative under its explicit index range.

## Absorbed corrections, all relevant cuts and natural clamps

The absorbed correction is `c*((d−(t+s):Nat):Real)/(t+s+1)`. Natural subtraction is clamped before casting. `absorbed_extra_boundMA64` bounds every such shifted correction by `U` under `t≤d`, `j≥d+2` and **`0≤c≤8`**. In particular, the last correction vanishes when its natural exponent exceeds `d`; it is never replaced by a negative real subtraction.

The complete corrected kernel is reflected at degree `j`. Its explicit tail theorem gives zero above that degree. A checked common-shift identity relates its cuts to the triangular absorbed lift. The above-border argument uses the generic cut-versus-full comparison only when **`k>t+h`**, with its degree and nonnegativity assumptions discharged. Below the border the older exact localization applies. At equality, the quantitative border margin applies.

The final strengthened theorem `absorbed_middle_generalMA64` therefore proves every coefficient `k` nonnegative for **natural `d,j,t,h,k`, `4≤t<d`, `j≥d+2`, `h≤t`, and real `c∈[0,8]`**. This exact `h≤t` condition must remain in its English description. The inherited high-cut theorem handles `h>t`; the inherited tail theorem handles `d≤t` when assembling the actual output transport. The source uses the particular relations `j=d+2,c=4` and `j=d+3,c=8`.

`AbsorbedMiddleM418`, `AbsorbedUncutMF8F` and `AbsorbedBorderMarginMF8F` are now proved. `BorderDominanceMF8F` remains an unproved stronger candidate, and no accepted source conclusion assumes it. Its module is imported for prior definitions and proved transport; importing that module does not assume the predicate. The new general argument also covers `h=t` directly; importing the earlier boundary-certificate modules does not mean their special proof is required for the new quantitative positivity step.

## Exact remaining root obligations

`root_iff_beyond_correctionMA64` proves exactly

`Conjecture63 ↔ ThreeBeyondCorrectionM418 ∧ OtherFourM9E2`.

Both predicates remain open. The first retains all natural starts for the numerator-three obligations outside the established ranges:

- Horizontal rows `q<j`, excluding the already proved row `j=5` and the newly closed `j=q+1`.
- Vertical triples outside `((i=3 or i=4) and j+1≤q)` or `(5≤i≤8 and j+2≤q)`.
- Constant-sum diagonal triples outside `3≤i≤6 and j+2≤q`, with literal points **`(i,j+2),(i+1,j+1),(i+2,j)`**.

`OtherFourM9E2` retains `GlobalLC18` for every actual path with numerator at least four. This does not reopen previously proved endpoints or numerator-at-most-two families. The completed worker 152 all-directions result for every actual numerator-two source remains inherited.

The pinned root remains unchanged: original integer coefficients, original polygon predicate **`ab≤bi+aj` and `i+j≤a+b−1`**, all three memberships per direction, zeros, endpoint clauses and actual path scope. The all-natural arithmetic statements connect through inherited exact equivalences. This round does not provide a fresh global source-homogeneity, Laurent-family completeness or Newton-polygon identification proof. The source-visit JSON records the researcher's primary-source retrieval; it is not a new independent retrieval or a Lean premise in this audit.

## Final-source compilation and historical versions

The selected final inventory has twelve modules, 53 theorems and nine definitions. Two Audit modules and the isolated checker are operational records, not additional mathematical modules. All final mathematical source hashes agree across archive, current named counterpart, controller, manifest, immutable successful compiler snapshots and final replay/axiom maps. Ordinary object hashes agree across archive/current/controller/manifest and finalizer samples.

There are **29 compiler receipts: 16 successes and 13 return-code-one failures, no compiler timeout**. The successes comprise twelve final mathematical builds, two superseded successful `CorrectionClosed` versions and two Audits. The failed snapshots keep the same declaration headers and imports as the final versions but differ in proof bodies. Their failures concern casts, nonnegativity functions, choose symmetry, rewrite selection, unavailable lemma names, denominator regrouping, coefficient sums and one absent repaired dependency. They are rejected proof attempts, not accepted alternate bodies or source counterexamples.

The version history of `MarkovCorrectionClosedMA64` is essential:

| Successful source snapshot | Theorems | Recorded coverage |
| --- | ---: | --- |
| `9863b838f60096596b6cf3ab761b96edaf3e0ea3ad93b6bea136f8dc259d68e5` | 7 | Compilation only at these source bytes. |
| `5b55a8218dd38c58cf36853af57c7d0679fd0f75ff670f9018c5d465a2bb9096` | 8 | Adds the direct actual-path theorem; first joint replay and 52-closure Audit. |
| `a41a6b98ef8432bfe4bf537291978ae0a3d55656720073c02a770e42edaf299b` | 9 | Adds the general auxiliary theorem and changes the closed-middle proof; final joint replay and 53-closure Audit. |

The two earlier immutable source snapshots remain retained. Their ordinary object path was reused, and only final ordinary-object bytes are archived. No separate old-object digest or final-source validation is inferred from an earlier successful return code. Final validation correctly filters out the earlier replay and axiom maps because their `CorrectionClosed` source hash differs.

Ordinary mathematical build limits are 100 seconds, with three explicitly recorded 120-second invocations: the successful MarginCertificate build, first rejected CompleteMargin build and rejected BorderMarginScalar build. Both replays use 180-second limits and both Audit compiles use 100. Exact per-attempt source/diagnostic/timing evidence is in the validation and method supports.

## Replay, axiom and import boundaries

Both replay stages select twelve module names. The first checks **61 guarded names** and its Audit prints **52 closures**; the final checks **62 names** and prints **53 closures**. There are **105 printed rows and 53 distinct names** overall. All final closures use exactly `propext`, `Classical.choice` and `Quot.sound`. The final all-module invocation independently covers the final source bytes; final coverage is not inferred by combining differently versioned stages.

Audit and replay run concurrently within each stage. The first replay runs approximately 02:32:26.394499–02:32:46.524445 UTC, with Audit 02:32:26.396814–02:32:43.179995. The final replay runs 02:36:20.099926–02:36:35.006892, with Audit 02:36:20.101801–02:36:31.263510. The final strengthening lies between the stages. Neither Audit is described as beginning after its replay completed.

The checker SHA is `093b9212289c33f03dad699dee585ea6999c96baa27f7015bcf60b9d674f08cf`. It is an exact predecessor retag, with the same ordinary isolated `env.replay` body. Selected modules are removed from the initial import base. The guard applies to **every collected constant matching the mathematical namespace/suffix condition**, rejecting pre-existing guarded names and unsafe/partial information. The observed counts match the explicit source inventories. The predicate is not an exhaustive binary-authentication claim for all generated/private names or optional compiled parts.

Compiler source hashes and snapshots precede compilation of the live named file; raw compiler receipts have no compiler-produced object digest. Replay source maps are sampled before invocation and checker hashes afterward. Audit source maps and finalizer object hashes are later samples. These associations agree, but they are not an atomic source/object-production guarantee, an authenticated compiler executable, a filesystem freeze or a fresh whole-source rebuild. Retained chronology shows no same-module build overlap or observed final-source mtime inside its own build estimate; that observation is bounded.

The inherited base has **2,644 source/object pairs**, from 2,623 sealed worker 169 pairs plus all 21 accepted worker 169 modules. The direct inherited imports are `MarkovBorderDominanceMF8F` and implicit `Init`. The selected graph has 2,656 local nodes, or 2,658 including two Audits. Every selected endpoint inherits all 2,644 old nodes. Expected identities come from sealed records and controller-before pins, not current-byte fallback; worker initial snapshots exclude objects.

Every endpoint inherits the **212 unrecovered worker 121 modules**, including the **195 subset**, and the separate **19 accepted historical modules**. None is newly replayed or recovered here. WindowLC and Abel retain their old source/build associations, empty historical checker output and two historical printed closures each; their stronger imported helpers do not acquire new print coverage. No current replay rebuilds the whole inherited chain.

Only CorrectionFactor from worker 166 is inherited; its seven compiled/printed but unreplayed prefixes remain outside and unrecovered. The worker 167 concrete certificate remains inherited compiled proof. Worker 168's combined timeout/unbuilt boundary files remain excluded; new worker 169 split names do not backdate their validation. Worker 156 retains its TIMEOUT/null-report and incomplete historical validation; its later twelve-module/44-closure recovery belongs to worker 157. Other old pending statuses and absence observations remain unchanged.

The mathematical support pins **419 named older sources: 292 imported and 127 comparison-only**, plus 181 historical pending/other-status comparisons, two operational comparisons, sixteen external source/object pairs and 41 inherited scripts. These are identity records, not fresh validation. The historical-other-status set includes compiled-only material and is not a count of unbuilt sources.

## Finite domains and auxiliary failures

All five current experiment/generator/wrapper scripts were read, never imported or executed. Only the source experiment has a guarded main. The margin script, both generators and the subprocess wrapper execute top-level work. Static parsing preserves that distinction.

| Saved experiment | Independently counted index domain |
| --- | --- |
| First correction | `q∈{1,2,3,4,6,9,16,24,40,64}`, both residues: 20 source cases, 1,184 visited positions and 1,144 triples; coefficient comparisons exclude `q=1`, yielding 18 cases and 1,161 positions. There are 462 established first-row index-zero positions, 666 polygon-valid triples and 252 window triples. |
| Quantitative margins | `j=7..40`, `t=4..j−3`, two scalar margins per pair, and `h=0..t`: 1,190 scalar checks and 9,520 border checks. |
| Next row | Ten specified `q` values `{1,2,3,4,5,6,8,12,20,32}`, both residues: 20 source cases, 728 coefficient positions and 688 triples. Fifteen nonnegative-exponent cases yield 659 proposed-formula comparisons and 184 scalar checks. |

The source positions are `i=0..n+6`, with adjacent starts `0..n+4`. The first-row zero count is recounted from the established index support in the formula domain, not from coefficient evaluation. The next-row **345 zeros remain a reported value count**; the first-row `i<2` mask is not applied to all exceptional next-row cases. No next-row coefficient or zero was recomputed.

The next-row proposed identity has false residue `d=q−3,c0=24,c1=4q` and true residue `d=q−4,c0=36,c1=8q−8`. Five source cases with negative proposed exponent are excluded from formula comparison. The universal source identity and uniform next-row log-concavity are not formal results of this round.

The saved actual `3/14` diagnostic at row 6, starting column 2, records lower terms `[0,1092,9918]`, correction `[24,40,16]`, mixed gap `−150672` and raw triple `[24,1132,9934]` passing the finite raw LC test. These are saved values, not independently recomputed or a Lean-certified counterexample. Negative mixed summands do not refute raw LC. The mixed-example list is capped at eight and is not an exhaustive failure count.

Four additional diagnostics perturb the constant coefficients of the unshifted `Q` polynomials and record negative auxiliary gaps. Four over-relaxed next-row cases test `U=36*(j−t−5)/(t+1)+8*j`; the failures at the reported parameters concern a sufficient enlarged bound. Neither diagnostic establishes an actual-source LC failure. Their output signs, coefficients and scalar values were not recomputed by the audit.

The original margin/next-row outputs at event 202 are retained separately from a rerun at event 207, caused by an interactive import of the top-level margin script. The retained first records are reconstructed from the actual earlier output and match it completely; final/rerun records match the later event. Only elapsed fields differ. This later retention does not authenticate invocation-time file bytes, and repeated execution does not double the distinct parameter domain.

The source wrapper event 176 prints only 200 stdout characters; the full retained receipt contains all ten progress lines and matching final result. Event 188 separately prints the complete result as a Python dictionary literal. The audit helper initially expected JSON at that event and stopped before writing supports; safe literal parsing corrected this data-format assumption. No project code or numerical experiment was rerun. Progress files match final results except elapsed fields. The wrapper samples its source hash after execution; this is not an atomic runtime-input guarantee.

## Finalizer, inventory and deadline

Setup asserts the six inherited bindings and predecessor-manifest agreement before snapshotting and copies the finalizer alongside the wrappers. Its lowercase request-tag exclusion is a **basename-substring test**, applied before the snapshot. The finalizer has no owned-input exemptions: all **7,223 initial entries** are checked unchanged. All **142 predecessor archive/controller artifacts and 142 manifest entries** remain unchanged. Reconciliation records do not replay inherited proof bodies or upgrade predecessor failed experiments.

One successful finalizer invocation is retained, events 224–225. Its outer counts match final validation; its preservation subobject equals the saved last-verification record. The delivered report is event 226, matching final.json and controller.report, followed by turn completion 227. There is no failed finalizer or current pending mathematical module.

The generic finalizer requires successful current-source build maps, union replay coverage and permitted source-matching axiom declarations. It does not itself demand one joint replay, checker SHA equality, exact theorem-set equality or raw success-marker/Audit-object binding. Independent checks establish those stronger observed associations here. Its comment-stripped forbidden-token scan remains lexical, not a complete nested-comment parser. The version subprocess return is recorded but not asserted; the actual return is zero. No future-write lock is created.

There are **128 archive/controller artifacts and 128 manifest entries**, with **126 in their intersection**. Manifest and last-verification are unindexed administrative archive files; two manifest-only caches are absent from the original archive/controller, giving **130 current exact-request files**. Equal counts do not imply equal path sets. All observed content bindings agree.

| Observation | UTC, 2026-10-17 |
| --- | --- |
| Controller start | 02:12:47.654845 |
| Last selected mathematical build finish estimate | 02:35:18.065630 |
| Validation original mtime | 02:37:50.335227 |
| Manifest original mtime | 02:37:51.555168 |
| Last-verification original mtime | 02:37:51.584317 |
| Event-log mtime | 02:38:44.148808 |
| Delivered final.json mtime | 02:38:44.961412 |
| Activity content timestamp | 02:38:45.156791 |
| Host finish | 02:39:14.502577 |
| Nominal deadline | 02:42:47.654845 |

Stored elapsed exactly equals finish minus start in the saved floating-point fields. Host finish precedes deadline by **213.15226817131042 seconds**; final.json mtime precedes it by **242.69343280792236 seconds**. Filename timestamps plus durations give finish estimates, not authenticated nanosecond timing. Archive-copy times record retention, not proof execution. No cause is inferred for report-to-host lag.

The event log has 227 entries, 107 started items, 71 command starts and 33 completed file-change records; every start has a terminal record. Its 513,655 bytes and empty stderr match the activity counter. Receipt-only watching made seven absent observations before finding the completed receipt at **02:40:03.897696**, with every read interval at least sixty seconds and every requested sleep at most 59 seconds. The cutoff at 02:52:47.654845 was unnecessary. No active source/event material was opened during the watch.

## Required separate opaque supplement

Two manifest-matching caches were first found at **02:41:54.368002 UTC**. Metadata was observed at **02:42:31.010307**, and copies were made during **02:42:31.011138–02:42:31.011925**. Both copies preserve observed bytes, mode 0644, uid 501, gid 20 and mtime. Discovery is not creation, and neither file is attributed to a source version, process or successor. No bytecode was interpreted, imported, disassembled or executed.

Preserve the following under `markov_worker_000170_late_cache_bundle/research/__pycache__/`:

- `margin_experiments_a646848d.cpython-314.pyc`, **12,187 bytes**, SHA `bc3937b60c925e0f69ff61bf0e0baa3537194b756d86aa95a92086a1f8d336c7`.
- `validate_a646848d.cpython-314.pyc`, **5,808 bytes**, SHA `2550059fbf65062280fbb7cb4ce11a260b0b4387e2292be4d73453f87daf91c2`.

Total opaque bytes are **17,995**. Preserve both companion JSONs: `markov_worker_000170_late_cache_bundle.json`, SHA `bf95562c9bfdf4198591e4bad31faf7022080b92f3a53eb27959a1824ee486ca`; and `markov_worker_000170_unarchived_cache_observation.json`, SHA `ded68ebc363459996cd1127f0928e982f435348df8cae2b12428a9e0eed39820`. These four files require separate retention despite normal cache exclusions. Original archive/index/history remains unchanged, and the supplement grants no validation credit.

The separately reviewed operational COW consolidation of 188 retained copies from closed workers 164–168 was committed as `797199f72af630b9987e06f641c569de5ca59f2e`. It preserves bytes and recorded metadata while changing storage inode metadata. It did not replace current research sources/evidence or touch worker 169 onward; it does not extend any mathematical observation window or improve proof coverage.

## Companion evidence and final review

The seven supports are mathematical_source_hashes.json, source_structure_audit.json, finite_domain_audit.json, validation_audit.md, validation_evidence.json, replay_method.md and replay_method_evidence.json, all prefixed `markov_worker_000170_`. The inherited pair map, two audit-owned helpers and four supplemental retention files are additional preservation records. The receipt-watch record is embedded in the mathematical support. Exact source/object/snapshot/replay/axiom/import bindings and failed versions are in those companions.

## Final audit observation

The method reviewer observed **185 unchanged named inputs** during **02:55:10.887402–02:55:11.021998 UTC** on 2026-10-17, with its not-applicable absence record at **02:55:11.022007**. The validator observed **10,423 unchanged named inputs** during **02:55:24.406174–02:55:49.001059 UTC**. Its final exact-request inventory at **02:55:49.013960** contains 128 archive and 130 current files, with only the same two separately retained opaque caches. No pending-object absence check applies. No earlier absence or project-observation window is extended.

The two reviews agree on **70 retained method fields, 2,644 inherited source/object pairs and 172 shared input hashes**, with no mismatch. Each separately rechecked **22 temporary audit inputs**. Both reviewed the complete mathematical discussion and stable companions without a necessary correction. Project reads are closed; final footer/helper concurrence and sealing read only temporary audit files. The seal records that concurrence and binds the files below. The main and integrity bring the preservation total to **sixteen files**; the four opaque-supplement files require explicit retention beyond normal cache exclusions.

| Relative preservation path under the audit directory | Bytes | SHA256 |
| --- | ---: | --- |
| `markov_worker_000170_mathematical_source_hashes.json` | 344,051 | `7db6bafd2da285aa70915cbc2c0169bf8508c4a2cfdb3bb8d2e1c489c50fec58` |
| `markov_worker_000170_source_structure_audit.json` | 63,456 | `5a15390672ed13cc5c6865c492885c162e968fa794c9e3f24892a365bf380579` |
| `markov_worker_000170_finite_domain_audit.json` | 22,028 | `d108a43706187daa0c972c168467ba448a2a82f08228d471af12a1aac83612c9` |
| `markov_worker_000170_validation_audit.md` | 25,126 | `f5c5e4a83a7b9038396936d4470937ea872a64d697befe199eba6e7a00ef2635` |
| `markov_worker_000170_validation_evidence.json` | 9,282,639 | `0f2b5d6f81bb7fc3dba47d85459028ce23bd420e248da1ffa68f77b8a9b9aabc` |
| `markov_worker_000170_replay_method.md` | 27,021 | `c47e77a090e59f81fbc08dd25c38bccb48874c1403ddefa437d5b8349b8ea6ae` |
| `markov_worker_000170_replay_method_evidence.json` | 16,452,953 | `3828923177e1584b0820047a07abaf89fb01d537f0bd8a7f8e7cb57e6c0c864e` |
| `markov_worker_000170_inherited_pair_expectations.json` | 2,444,690 | `aa0bdc20794538992d31d52773d1af31b8bba9018d7f9c7d7682d8a600d17e85` |
| `static_audit_worker170.py` | 24,150 | `96c9929edde21c01a4d75148c734f22c594e9b64debd4d1001e7d2a2e1ab8773` |
| `seal_worker170_audit.py` | 19,799 | `1ef3f7bf075ac5b90e29f67528572e4b0a659b42542d808945cd68b0482bf007` |
| `markov_worker_000170_late_cache_bundle.json` | 3,059 | `bf95562c9bfdf4198591e4bad31faf7022080b92f3a53eb27959a1824ee486ca` |
| `markov_worker_000170_unarchived_cache_observation.json` | 2,088 | `ded68ebc363459996cd1127f0928e982f435348df8cae2b12428a9e0eed39820` |
| `markov_worker_000170_late_cache_bundle/research/__pycache__/margin_experiments_a646848d.cpython-314.pyc` | 12,187 | `bc3937b60c925e0f69ff61bf0e0baa3537194b756d86aa95a92086a1f8d336c7` |
| `markov_worker_000170_late_cache_bundle/research/__pycache__/validate_a646848d.cpython-314.pyc` | 5,808 | `2550059fbf65062280fbb7cb4ce11a260b0b4387e2292be4d73453f87daf91c2` |

The integrity JSON binds this final main by SHA256 and records both observation windows, coverage limits, historical versions, finite-domain qualifications and all fifteen non-integrity preservation paths. No root-completion claim or inherited validation upgrade is made.
