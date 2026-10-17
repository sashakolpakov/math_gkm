# Independent closed-worker 185 audit

Worker **185**, request **dcb6402998ac4eed9feb37199e0f0cee**, has a retained **completed / return code 0** receipt, a delivered structured report, and `mathematical_resolution=false`. Its new unconditional source results are two strict upper-row horizontal strips for actual numerator-three sources and complete horizontal log-concavity at depths **5 through 8**, in the exact domain below. The full conjecture remains open. General tail positivity and the proposed beta-comparison source cutoff are not proved by this worker.

The receipt is `.control/markov/workers/000185/receipt.json`, 16,600 bytes, SHA256 `330d9363efd22ff503710adf8919ebf0e834026139fe4223ee87a8b54a3741f4`. The archive is `.control/markov/workers/000185/artifacts` beneath `/Users/sasha/math_gkm`. Audit outputs reside only in `/private/tmp/math_gkm_godel_20261013` (T). The first exact receipt observation was 09:19:59.011999 UTC, after its recorded closure; no active-source inspection preceded it. Reads were archive-first and restricted afterward to exact named inherited/current counterparts. Active worker 186 and later work were not inspected. No project, machinery or `/Users/sasha/collatz` file was changed, and no proposer was contacted or advised. No project program, Lean/compiler, checker, replay, finalizer, generator, experiment or CAS was executed. Own code performed static parsing, hashing, literal comparisons and finite index-domain counts, without evaluating mathematical coefficients, gaps, binomials, polynomial products, signs or random samples.

## Exact source-level gain

For every actual numerator-three source, the inherited exhaustive classification gives `q≥1` and a Boolean residue, with denominator `b=3q+1` for `true` or `b=3q+2` for `false`. The inherited source equality identifies `threeRawM9E2` with the original raw coefficient function. There is no remaining formula premise, invented source shape, normalization of the conjecture, or finite-denominator restriction.

At row `j=b+2−t`, worker 185 proves

`c(t−3,j)c(t−1,j) < c(t−2,j)^2` for `6≤t≤q+2`,

and

`c(t−4,j)c(t−2,j) < c(t−3,j)^2` for `7≤t≤q+2`.

These are literal horizontal starting positions `t−3` and `t−4`. The generic template versions require only the respective depth minimum and `2t≤n`. They do not assume the stronger source-sector inequality `3t≤n+5`. The actual-source adapters derive their required template bounds from `q≥1`, the Boolean denominator formula and `t≤q+2`.

For **every natural starting column** `i`, both numerator-three families now satisfy horizontal log-concavity at `j=b+2−t` whenever **`5≤t≤8` and `t≤q+2`**. The formal theorem `source_top_depths_through_eightMDCB` starts at depth 5. Its name or prose “through eight” must not be read as an independent theorem with `0≤t≤8`. This all-start theorem retains leading zeros, ending zeros and arbitrarily far zero tails. It combines the inherited low columns, first and last gaps and zero-tail cases with the new strict gaps. For depths 7 and 8 it supplies additional whole-row coverage beyond worker 184's depth-5/6 theorem. At depth 6 the new `t−3` start coincides with an older first-high-column result; no duplicate is counted as a wholly new triple.

For `t≥7`, `source_top_new_tail_polygonMDCB` proves membership for all columns `t−4≤i≤t−1`, covering the two new triples. The depth-6 triple is covered by the inherited exact polygon characterization. No invalid or omitted polygon point is used to claim gain. The strict sector has no small-parameter exception hidden by a division; when its inequalities on `q,t` cannot hold, its premise is simply empty.

The exact final reduction is

`Conjecture63 ↔ ThreeFrontierMDCB ∧ OtherFourM9E2`.

Neither conjunct is proved. `OtherFourM9E2` is the unchanged remaining problem for actual numerators at least four. The reduction preserves the original raw bivariate polynomial, natural indices, zeros, original polygon guards and endpoints. There is no proof or refutation of the root conjecture.

## Uniform tail identities and cancellation

The primary reviewer read all nine mathematical source bodies. Their exact declarations, source hashes and build-snapshot bindings are retained in the support files. The new representation works with the inherited natural-parameter mass

`Mass(d,T,i)=K(d,i,T)+4 Σ(s<T)(T−s)K(d,i,s)`,

where `K(d,i,s)=choose(s,i) choose(d+s+i+8,i+3)`. The inherited coefficient bridge identifies this with template column `i+3`, depth `T+3`, and `n=2(T+3)+d`. Thus actual upper-sector parameters are `T=t−3` and `d=b−2t`; all natural-subtraction rewrites use established bounds.

For integer `i,d`, the new definitions are

`Num(k)=Π(j<k)(i+j+1)(d+2i+j+9)`,

`D(r)=Π(j<r)(j+1)(d+i+j+6)`,

`Rest(r,k)=Π(k≤j<r)(j+1)(d+i+j+6)`,

`V(r,k)=Num(k)Rest(r,k)`.

Let `L_r(f)=f(r)+4Σ(k<r)(r−k)f(k)`. The three polynomial masses are

`A=L_r(V)`,

`E=L_r(k(d+2i+k+9)V)`,

`C=L_r(k(k−1)(d+2i+k+9)(d+2i+k+10)V)`.

Their gap is `G_r(i,d)=(i+2)(i+5)E²−(i+1)(i+4)AC`. The definitions make sense over integers; the source/mass identities and positivity of cancellation factors are proved for all natural `d,i,r`.

At `T=i+r`, the retained formal identities clear denominators in the three masses: `D Mass_i=A K_i(i)`, `D S_i Mass_(i+1)=E K_i(i)`, and `D S_i S_(i+1) Mass_(i+2)=C K_i(i)`, with the inherited explicitly defined positive scale factors `S`. Their exact gap identity multiplies the raw mass gap by `D² S_i² S_(i+1)` and equates it to `K_i(i)² G_r(i,d)`. All factors used to transfer sign are proved strictly positive. Both nonstrict and strict gap equivalences hold for every natural `d,i,r`; no raw coefficient is divided out and no positive-support assumption replaces zero cases.

The finite mass reindexing removes only `s<i≤i+j` kernel-zero terms. It retains the weighted endpoint separately. The `k(k−1)` in `C` is an integer factor, so its first two terms vanish through the formal factors/binomial identities; it is not an unguarded replacement of truncated natural subtraction. Empty products and small `r=0,1` remain in the universal identities. Those identities do not assert strict positivity in every degenerate case.

For `r=3` and `r=4`, the generated final Lean identities contain respectively **117** and **176** ordered positive integer coefficient literals. The constant literals are `4088588451840` and `40053534550917120`. The saved certificates match those expressions literally. The source proves their polynomial identity and then positivity for every integer `i,d≥0`, transfers to natural mass gaps, and attaches the results to actual source coefficients. The auditor compared literal terms and source structure; it did not expand or evaluate either polynomial.

## Exact residual and conditional results

`top_moment_iff_tail_residualMDCB` proves the exact equivalence

`TopMomentBoundM55C ↔ TopTailResidualMDCB`,

where the new tail predicate requires, for every natural `d,i,r`,

`1≤i`, `5≤r`, `i+r≤d+2` imply `0≤G_r(i,d)`.

This universal sign assertion is still open. In the reverse implication the interior range forces `r≥2`; `i=0` and tails `r=2,3,4` are discharged by existing or new unconditional results. The reduction does not silently remove them by an extra source hypothesis.

The bivariate integer polynomial `tailGapPolyMDCB` evaluates to the same `G` for all natural parameters. The predicate `TailCoefficientPositiveMDCB` asks for all coefficients to be nonnegative for **every `r≥5`**. It is a sufficient condition for the tail residual, the moment bound and actual-source horizontal log-concavity throughout the upper sector `5≤t≤q+2`. This coefficient sign condition is unproved; it is not a theorem that all those source inequalities now hold, and is not claimed to be an exact root equivalence.

The final `TopClosedRegionMDCB` retains worker 184's earlier region, including its depth-dependent eventual-denominator threshold, and adds the new tail starts. The horizontal residual requires all natural `i,j` with `q+3<j`, `b<2j+1`, `j≠5`, and exclusion from this enlarged closed region. The vertical residual is unchanged: it excludes only `((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)`. The diagonal residual is unchanged: it excludes only `3≤i≤6 and j+2≤q`, using literal indices `(i,j+2),(i+1,j+1),(i+2,j)`. Worker 185 adds no unconditional vertical or diagonal region.

The all-numerator-two, all-three-directions theorem from worker 152, the numerator-three horizontal lower/central region `2j+1≤b` from worker 181, earlier correction bands and row 5, and worker 184's `∀depth ∃depth-dependent denominator threshold` theorem remain inherited. The latter has not become a uniform threshold for every depth in worker 185.

## Beta-moment ingredients and the uncompleted source comparison

The real likelihood sequence has `q(0)=1` and recurrence

`q(k+1)=q(k)(d+2i+k+9)/(d+i+k+6)`.

It is positive for all natural parameters. The truncated weight is `1` at `k=r`, `4(r−k)` for `k<r`, and zero for `k>r`. The likelihood and weight satisfy their stated `CrossLC` inequalities; their product is nonnegative and also satisfies that property. The formal inward comparison is one step, with `2k+1≤m`: it compares the product at `k,m−k` to that at `k+1,m−(k+1)`. It is not by itself the missing expectation/covariance argument for the raw gap.

The integer beta moment is the sum over `0≤k≤m` of

`choose(i+k,i) choose(i+m−k,i) * k.descFactorial(u) * (m−k).descFactorial(v)`.

The source proves the convolution formula for `m=u+v+N` and the zero case for `m<u+v`. The later `BetaCleared` module gives the universal identity

`descFactorial(2i+1+u+v,u+v) * Moment(i,m,u,v)`

` = descFactorial(i+u,u) descFactorial(i+v,v)`

`   * descFactorial(m,u+v) * Moment(i,m,0,0)`.

The mass is exactly `choose(2i+m+1,2i+1)` and is positive. The normalization denominator is also proved positive. Hence the real normalized formula includes zero orders and orders larger than `m` without silently dividing by zero or discarding zero moments.

The auxiliary integer scalar `betaGap(a,m,H)` is

`(2a+2)(2a+3)(H²−(3a+7)H−5a−14)`

` −4(m−2)(2a+3)(H+a²+5a+7)`

` −2(m−2)(m−3)(a²+6a+7)`.

A 21-term positive coefficient certificate, with constant literal `100`, proves strict positivity after `a=x+1`, `m=y+2`, `H=3a+2m+5+z` for nonnegative integer `x,y,z`. The resulting theorem assumes `a≥1`, `m≥2`, `H≥3a+2m+5`. Its natural tail adapter assumes **`i+4r≤d+1` and `2≤m≤2r`** and concludes positivity of this scalar only.

The written beta proof route, including proposed bounds `d≥i+4r−1`, `d≥4T−1` and `n≥6t−13`, remains explicitly unformalized. The retained formal inventory does not contain the required expectation assembly, covariance comparison, symmetrized actual-gap identity and source attachment. None is supplied, repaired or mathematically completed by this audit. The scalar positivity result and exact moments must not be promoted into a new uniform raw-source region.

## Retained validation and versions

The selected final inventory is exactly **nine mathematical modules, 51 theorems and 25 definitions**. All final source bytes match successful retained build snapshots and the final replay/Audit source maps. Fourteen build receipts contain nine successful mathematical builds, two successful operational Audit builds and three return-code-1 failures. There are no build timeouts, successful superseded mathematical versions, unselected mathematical compiles, or unbuilt mathematical candidates in the exact closed inventory.

The rejected TailPolynomial proof lacks a required `map_ofNat` simplification; the rejected Likelihood proof uses two unsuccessful `convert`/`ring` blocks, replaced in the final source by explicit equalities; the rejected BetaMoments proof lacks the natural subtraction rewrite `i+u−i=u`. Their imports and declaration headers are unchanged, but their failed proof bodies receive no final validation credit. Final source selection binds corrected bytes rather than names alone.

Tail3 and Tail4 compiled concurrently under separate 180-second limits. The other ten mathematical attempts used 120 seconds, and each Audit compilation used 100. There is no same-module overlap in the retained timing estimates. Snapshot filenames and durations do not supply atomic compiler-input attestation: the wrapper snapshots source before compiling its live path, and receipts bind source hashes rather than output-object digests.

The first finish stage, completed event 146, selects eight modules with 47 theorems and 25 definitions: 72 guarded mathematical names. It passes joint replay and prints all 47 closures. BetaCleared then adds four theorems and no definitions. The final finish stage, event 157, jointly replays all nine modules and 76 guarded names and prints all 51 closures. Thus the two stages retain 98 print rows but only 51 distinct final theorem names. The earlier 47 are rechecked, not extra theorems.

The first-stage replay and axiom records are `replay-1792228489072357000.json` and `axioms-1792228508790006000.json`; final records are `replay-1792228640022061000.json` and `axioms-1792228658356456000.json`. Their source maps match the exact corresponding final module bytes. The finish wrapper was added at events 143/144 and changed at 151/152. Its initial bytes and overwritten initial validation.json were not separately snapshotted, so first-stage scope is established from its immutable receipts and completed output, not by backdating the final wrapper hash.

The final replay checker source has SHA256 `9e47b8e9c040e3dd282128b79c73f6a5e62896f9ded442549b48d27d0a312ec3`, matching both replay receipts. It guards collected `MathGKM.Markov` declarations ending **MDCB** against pre-imported presence and unsafe/partial status, then invokes ordinary `Environment.replay` over the inherited compiled base. Its operational function retains the historical name `replayIsolatedM55C`; that function name is not the mathematical target suffix. The actual guard is the single current suffix, narrowed from worker 184's dual-suffix guard. Both outputs report five inherited imports. The final wrapper uses a 240-second replay limit, a 120-second outer Audit subprocess limit and a 100-second inner Audit compiler limit.

Each Audit source has exactly its stage imports and theorem print commands; source, successful build snapshot, object, output and axiom JSON agree. All 98 retained print rows, including the final 51, list exactly `propext`, `Classical.choice`, `Quot.sound`. The wrapper's declaration enumeration matches all 76 selected named definitions/theorems here. These checks do not become a fresh build or body replay of imported modules, compiler, Mathlib or kernel. Generated/private/equation constants and the inherited binary search path retain the ordinary method limits.

All eleven ordinary objects, including the two Audit objects, are complete in archive/current evidence and match controller-after and manifest hashes. The eleven exact optional `.control/markov/objects/<digest>` copies were absent at the initial bounded inspection. That is a recorded cache-layout/availability fact, not a missing archive object or evidence of failed compilation. No object was repaired, decoded or executed, and no binary supplement is needed for these complete archive objects. At the separate final availability observation all eleven optional paths were present and byte-identical to those already retained objects. The change from initial absence to later presence does not identify creation time, producer or a new proof check; it does not change the exact request inventory.

The independently matched project graph has **2,826 nodes: nine selected and 2,817 inherited source/object pairs**. The inherited set is all 2,797 of worker 184's inherited pairs plus 20 of its 21 selected modules. `MarkovTopObstructionsM55C` is absent from this proof graph. TailResidual and TailPolynomial each inherit all 2,817 pairs; each of the other seven endpoints inherits 2,809. The four written direct imports are `MarkovPolynomialCertificateMBEC`, `MarkovTopFrontierMEB6`, `MarkovTopTailKernelMEB6` and `MarkovUpperDifferenceM4F4`; ordinary implicit `Init` accounts for the replay output's fifth inherited import. Source/object hashes match the sealed predecessor and controller-before bindings. These are exact named import boundaries, not fresh imported-body replays.

Worker 184's separately recorded recovery of all ten worker 183 modules and 54 closures remains intact. Nine of those recovered modules are imported in 185; the absent one is the obstruction module named above. **Zero** older modules are newly recovered in 185. Worker 183 remains historically `uncertain_effects`, interrupted controller/watchdog, null report, no receipt and no recorded replay/prints. Its partial archive, zero-byte object and separately preserved evidence are not repaired, and worker 184's later recovery is not backdated.

All 212 unreplayed worker 121 modules are still inherited, including the 195-module subset; the separate 19 accepted modules are also inherited and remain a distinct group. None receives new replay credit. Imported WindowLC retains its historical empty-checker and only the `runInterval_cross6d34` / `runInterval_smoothed_lc6d34` prints, with no new `crossLC_balanced6d34` print. Imported Abel retains its source/object binding and `tail_weight_nonneg65c4` / `centered_weight_nonneg65c4` prints, with no new `crossLC_center_weights65c4` print; WindowLC's empty-checker qualification is not assigned to Abel. Worker 166's seven compiled-and-printed but unreplayed prefix modules remain outside this graph; `MarkovCorrectionFactorMDB2` is imported, without a new recovery. Historical timeouts, worker 171's missing/malformed-report return-code-1 outcome, later explicitly dated recoveries and worker 180's source-version qualifications remain unchanged. No fresh whole-source rebuild or full-root completion audit occurred.

## Finite evidence, auxiliary failures and provenance

The following counts are checked only by static iteration domains, saved list lengths and literal output matching:

| Domain | Count and scope |
|---|---|
| Actual numerator-three source families | `q=1..24,37,61`, both residues: 52 families, 952 upper rows, 15,944 coefficient positions. |
| General tail identities | `d=0..9`, `i=0..14`, `r=0..12`: 1,950 parameter cases, four identities per case. |
| New strict-tail calls | The two respective depth bounds give 1,246 calls. |
| Saved source labels | 72 unique labels after family/random-path/endpoint deduplication; random paths were not regenerated. |
| Original guarded raw triples | H 98,269; V 98,269; D 98,895; total 295,433. |
| Tail polynomial probes | `r=2..10`, then `r=11..40`: 39 cases, 147,225 saved nonzero coefficient slots in total. |
| Antidiagonal pieces | `r=2..12`, `m=0..2r`: 165 groups. |
| Parameter comparison probe | `T=2..50`, `i=0..T−2`, deduplicated `d∈{0,1,2,T−2,T,2T,10T}`: 8,568 cases. Each failure list stores at most ten examples. |
| Weight-polynomial probe | `T=2..49`, `i=0..T−2`, four `d` entries `[0,1,T,10T]` with multiplicity: 4,704 cases, three expressions per case. |
| Beta comparison probe | `i=0..8`, `r=2..17`, recorded deduplicated four-choice `d` set, `m=2..2r`: 10,365 moment cases, 64,220 radial pairs, 5,184 comparison cases satisfying the recorded parameter bound. |

The source scan reports 3,652 zero coefficients and no failures. These are retained observations, not recomputed zeros or signs. The original raw H/V/D polygon predicates and dictionary zero defaults are preserved. The 147,225 stored polynomial terms with no saved negative coefficient do not prove arbitrary-`r` coefficient positivity. The formal certificates for `r=3,4` and the beta scalar have separate literal-source and retained Lean bindings.

The parameter probe records failures of both proposed ratio-monotonicity directions and stronger Newton/factorial log-concavity shortcuts. It stores only a capped sample of each failure class; empty placeholder fields are not audited as universal success. A saved antidiagonal piece at `r=11,m=3` has two negative coefficient literals, including a negative constant at `i=d=0`. With `T=i+r`, that parameter is outside `T≤d+2`. It is an auxiliary-piece failure and not a full tail-gap or actual-source/root counterexample. No new counterexample value was calculated during audit.

Completed-command output bindings are retained at events 40/44/57/70/85/96/105/109. Some outputs are exact whole JSON objects, others specified projections or one saved case per line. The weight experiment is the inline event-44 command. The stress experiment is inline event 96; its later retained reproduction script was added at event 163. The final script hash therefore does not authenticate the bytes of the earlier invocation. Saved results and source certificates are bound independently; no generator or experiment was rerun.

Own preparation encountered one exploratory JSON type mismatch and a primary-helper syntax error before output; both were corrected solely in audit code. Validator preparation corrected an initial 47-versus-48 print-count assertion from the exact declarations and replaced an invalid optional-CAS-presence assumption with an explicit absence record. These adjustments did not change project files, relax successful archive/current/controller/manifest matching, or execute research code.

## Host chronology, finalization and preservation

The host started at **08:52:10.768975 UTC**, finished at **09:19:58.663288 UTC**, and records elapsed **1,667.8943130970001 seconds**, exactly the recorded timestamp subtraction. Its nominal 1,800-second deadline was **09:22:10.768975 UTC**, leaving **132.105686903 seconds** at host completion. This completed status is independent of later controller operational behavior. No cause is inferred for any later controller exit and no successor operational event upgrades the proof record.

The finalizer ran once, completed event 165. Delivered report event 168 matches final.json and receipt.report; event 169 is `turn.completed`. There are 169 events and 54 completed commands. The later read-only verification command 167 is not a second finalizer. No separate report.json draft is retained. Current last-verification mtime is 09:18:56.996756, archived-copy mtime 09:19:58.590730, and final.json mtime 09:19:32.000476 UTC. These distinct file observations are not substituted for theorem acceptance times.

The finalizer checks selected source hashes and successful source receipts, permitted axiom lists, successful replay with the final source map, initial/prior/inherited inputs, root, serialized contract and fixed build pins. It does not itself independently require the replay-checker digest, complete exact axiom name/source set, or successful Audit receipt/object; this audit checks those additional bindings separately. It writes manifest and last-verification but does not enforce a later output-creation stop.

The archive has exactly 95 files matching 95 controller changes. The manifest has 93 entries; manifest and last-verification are the two administrative exceptions. All 22,209 initial input hashes remain unchanged without exemptions. Setup is the sole initial input absent from the controller before-map. All 139 predecessor-184 manifest entries remain unchanged. Preservation and reconciliation are not replay of their imported proof bodies.

The pinned root SHA256 remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The ASCII compact sorted contract hashes to `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`; its newline-bearing raw file hashes to `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. Different serialization hashes are not a contract change. No mutable successor contract was read.

The exact initial current inventory has 98 paths, adding three request-named unindexed/unarchived `.pyc` files to the 95 archive counterparts. The three caches total 16,543 bytes and are separately retained only as opaque evidence. They were observed and copied at a bounded later time, which is not inferred to be creation time. No bytecode was decoded or executed, and filenames supply no producer or source-version attribution. Source hashes, mode, owner and mtime agree with their copies. The original archive and index were not repaired or extended.

Prior content-preserving COW operations can change retained-copy inode/ctime while preserving bytes and stated stable metadata. They add no proof validation and do not extend old observation windows. This audit performed no storage replacement or deletion.

## Bounded observations and final bindings

Initial validation inventory was taken at **09:20:48.426007 UTC**, finding archive 95, manifest 93 and exact current 98. The method reviewer rehashed **132** named inputs unchanged during **09:44:56.490418–09:44:56.577263 UTC**; its separate N/A pending-artifact/report absence record is at .577272, and project reads closed at **09:44:56.577273**. The validator subsequently rehashed **25,273** named inputs unchanged during **09:45:40.964164–09:46:06.815890 UTC**. Its separate N/A pending-artifact/report absence record is at .815907.

The validator separately observed the exact eleven optional CAS paths during **09:46:06.815909–09:46:06.840089 UTC**. All eleven, initially absent, were now present and matched their already retained ordinary/archive objects. This is bounded availability evidence only: no continuous-absence claim, inferred creation/producer, archive repair, additional validation or extra binary retention follows. Its final exact request inventory ran **09:46:06.840092–09:46:06.909073**, finding archive 95, manifest 93 and current 98 unchanged, exactly the three previously identified opaque caches, no added/missing/hash-changed request paths, and all six source/copy metadata comparisons equal. Validation project reads closed at **09:46:06.909155 UTC**. These observations do not extend earlier audit windows.

The reviewers agree on **68** copied method fields, all **2,817** inherited pairs, and **127** shared hashes. Their final maps include **17 method** and **29 validation** T-only input pins. Exact final crossreviews and the integrity seal read audit files only, without extending either project observation window. Pre-window audit refinements and the independent full pair-hash observation are retained as provenance. The minor sealer schema adjustments were made before execution; no research check was added or run.

Required retention is **18 files including the integrity seal**: this main and seven supports, the inherited pair map, primary static helper, T-only sealer, final crossreview record, and five supplemental-cache files. `markov_worker_000185_audit_integrity.json` lists the 17 non-integrity entries under `preservation_paths`; retain the integrity JSON as the eighteenth file. The supplemental directory is `markov_worker_000185_unindexed_cache_bundle`, with companion JSONs `markov_worker_000185_unindexed_cache_bundle.json` and `markov_worker_000185_unindexed_cache_observation.json`. Its exact three relative paths are `research/__pycache__/generate_tail_dcb64029.cpython-314.pyc`, `research/__pycache__/top_parameter_probe_dcb64029.cpython-314.pyc`, and `research/__pycache__/validate_dcb64029.cpython-314.pyc`. Ordinary cache exclusion must not omit this explicitly sealed opaque bundle. No compiled mathematical binary supplement is required. Earlier audit seals and historical outcomes remain unchanged.


Exact supporting-file SHA256 bindings (the integrity seal also binds bytes and paths):

| File | SHA256 |
|---|---|
| `markov_worker_000185_mathematical_source_hashes.json` | `ba0b2671fa5fa358bb7894bea79d76b348ed4899a87165b94c9bee541d4072bd` |
| `markov_worker_000185_source_structure_audit.json` | `b7e360b853dd4bc21a9a5695ffcc353078d3835ecbcad0736f35c5097f18c15c` |
| `markov_worker_000185_finite_domain_audit.json` | `b894a64a7cb096209314a93d1663d8ae530f926ed0817d7dd7e104ffca3b5849` |
| `markov_worker_000185_validation_audit.md` | `0e2f570e3c806f4dc1eb128902ce7ee5cef06ee8be2d1b072d706687fa0da091` |
| `markov_worker_000185_validation_evidence.json` | `dbbeb56537889177bbe993f6b72ad9dc2f5bddbc5f6d72fa9b0fafe3b5f5bea3` |
| `markov_worker_000185_replay_method.md` | `cb0f227a87daee591914cd790c890b8fc670987aa333d0d8418974a1a8eccdbb` |
| `markov_worker_000185_replay_method_evidence.json` | `15c607c7e978e508d33b04146d0ae3613216a546ae80b98879f03b6ff1943d5a` |
| `markov_worker_000185_inherited_pair_expectations.json` | `04d08ca297270863f46e07b833f46a70988a8003e51c0fcdbff7a6967e22c878` |
| `markov_worker_000185_unindexed_cache_bundle.json` | `8944c5a395aa76c3640d4c1dfebd8756254ec4df13f25a036e37a715659dfeeb` |
| `markov_worker_000185_unindexed_cache_observation.json` | `736fe6256921166484e96aaa481bd07ab8ccf31ef13b5ca071f629fbdae1fdb4` |
| `static_math_worker185.py` | `28189c7a8ddd5d021a0662d7b7beca3ca4037f2589bb6b9c816a7eddc58e8197` |
