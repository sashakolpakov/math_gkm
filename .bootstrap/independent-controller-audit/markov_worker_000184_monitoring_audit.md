# Independent closed-worker 184 audit

Worker **184**, request **eb6a900170904ab59255de637301f446**, has a retained **completed / return code 0** receipt, a delivered structured report, and `mathematical_resolution=false`. Its new source results and the later recovery of worker 183 are supported by the retained compilation, joint replay and axiom-print records described below. **The full pinned conjecture is still open.** This audit supplies no new proof, missing check, numerical calculation, or research assistance.

The exact receipt is `.control/markov/workers/000184/receipt.json`, 21,664 bytes, SHA256 `c7eaeb3ee3e197db66a0ade9453907964a2c50bb4f9c81c9fe9609063829c6b9`. The archive is `.control/markov/workers/000184/artifacts` beneath `/Users/sasha/math_gkm`. Audit outputs reside only in `/private/tmp/math_gkm_godel_20261013` (T). Reads were archive-first and then restricted to exact named inherited/current counterparts. Active worker 185 and later research were not inspected. No project source, machinery, or `/Users/sasha/collatz` file was changed. No project program, Lean, checker, replay, finalizer, experiment, generator or CAS was executed. Own code performed static parsing, hashes, literal comparisons and finite index-domain counts only; it did not evaluate coefficients, gaps, binomial values, polynomial products, signs or random samples.

## Mathematical conclusion and its exact domain

For every actual source with numerator `a=3`, inherited exhaustive source classification supplies `q≥1` and a Boolean residue: `b=3q+1` for `true`, `b=3q+2` for `false`. The source equality identifies the machine's `threeRawM9E2` with the original raw coefficient function, without a normalization or formula premise. In the upper sector

`5 ≤ t ≤ q+2`, `j=b+2−t`,

worker 184 proves the two strict horizontal inequalities

`c(3,j)c(5,j) < c(4,j)^2`,

`c(t−2,j)c(t,j) < c(t−1,j)^2`.

The second is the last three nonzero positions of that row. The formal polygon characterization is `InPolygon 3 b i (b+2−t) ↔ 1≤i ∧ i≤t`; both triples therefore satisfy the original polygon guards. The actual sector is empty for `q=1,2`, so there is no silently omitted small-source strict case. For `5≤t≤6`, all natural starting columns are now covered, including the zero positions and tails. At `t=5` the two new edge triples coincide, as the source proof and finite counts reflect. These are source-level improvements beyond the earlier starts 1 and 2. The generic template edge theorems require only `5≤t` and `2t≤n`; the actual-source attachment retains the stated sector bounds.

There is also a universal **fixed-depth eventual theorem**: for every natural `t≥5`, an explicit natural bound `B(t)` ensures that every actual numerator-three source with denominator `b≥B(t)` satisfies every horizontal inequality in row `b+2−t`, for every natural starting column. Zeros remain in the theorem. The quantifier is `∀t≥5, ∃B, ∀actual paths with a=3 and b≥B, ∀i`. It is not one denominator bound valid for all depths and does not close all numerator-three horizontal inequalities.

The exact final reduction is

`Conjecture63 ↔ ThreeFrontierMEB6 ∧ OtherFourM9E2`.

Neither conjunct is proved. `OtherFourM9E2`, the remaining actual-source numerator-at-least-four problem, is unchanged. The root still denotes the full raw bivariate Markov polynomial conjecture in all three directions, with original natural indices, zeros, polygon guards and endpoints. There is no claim of a root proof or refutation.

## Source argument and boundary audit

The primary reviewer read all eleven new mathematical source bodies. Recovered sources were matched to the sealed worker 183 statements and to worker 184's successful archived build snapshots; they are not treated as eleven-plus-ten new research results. The seven support files retain exact declaration headers, hashes and the module inventory.

The inherited high-column kernel is

`K(d,i,s)=choose(s,i) choose(d+s+i+8,i+3)`,

`Mass(d,T,i)=K(d,i,T)+4 Σ(s<T) (T−s) K(d,i,s)`.

For all natural parameters this equals the template coefficient at column `i+3`, depth `T+3`, and `n=2(T+3)+d`. Thus actual-source parameters are `T=t−3` and `d=b−2t`. Every use of natural subtraction is accompanied by the relevant bounds; the actual-source sector implies `2t≤b` and `3t≤b+5`. Low template columns 0, 1 and 2 are handled by the existing zero/strict statements, and right tails by exact zeros. No proof divides by a raw coefficient or deletes a zero-containing triple.

`MarkovPolynomialBoundMEB6` proves a general rational-polynomial eventual-positivity statement. It defines the negative mass as the sum of `max(0,−coeff k)` over `k<natDegree`, and takes `ceil(negativeMass/leadingCoeff)+1`. A positive leading coefficient and a natural argument at least that threshold imply positive evaluation. Degree zero is handled explicitly, and the larger-degree argument uses positive leading coefficient and a bound on lower negative terms. There is no numerical root search.

`MarkovTopGapPolynomialMEB6` defines

`G(T,i)(d)=Mass(d,T,i+1)^2−Mass(d,T,i)Mass(d,T,i+2)`.

The evaluation identity holds for all natural `d,T,i`. Its degree is at most `2i+8`; for `i+1≤T`, the coefficient at that degree is the strict leading-coefficient gap proved in the recovered worker 183 module, so the degree is exact and the leading coefficient is positive. `topGapThresholdMEB6 T i` applies the general bound. Taking the finite supremum over `i∈range T` gives `topRowThresholdMEB6 T`. Above this row threshold all natural mass indices satisfy log-concavity; indices within the range use the strict result, and the rest use a zero endpoint. The empty finite range at `T=0` is retained.

`topSourceThresholdMEB6 t = 2t + topRowThresholdMEB6 (t−3) + 1`. The source theorem requires `q` at least this threshold and derives the source-sector conditions rather than assuming them. The path theorem uses `B(t)=3*topSourceThresholdMEB6 t+2` and the exact inherited classification of every actual numerator-three path. The direct parameter theorem also states the less coarse condition `topRowThresholdMEB6(t−3)≤b−2t` within `5≤t≤q+2`. These bounds depend on coefficients of finite polynomials and on depth, not on an unproved uniform sign assertion.

`MarkovTopVandermondeMEB6` establishes the all-natural short-sum identity

`Mass(d,T,i)=Σ(k<i+4) choose(i+k,i) choose(d+2i+8,i+3−k)`

`                         * (choose(T,i+k)+4 choose(T+1,i+k+2))`.

The proof separates `i≤s` from the kernel-zero case, uses guarded binomial multiplication and a finite antidiagonal reindexing, then evaluates the endpoint-plus-weighted-sum functional. Natural binomial zeros and the endpoint contribution are retained. The number of summands depends on the column index, and the identity does not itself assert the sign of every resulting gap.

The first remaining high-column gap is proved in `MarkovTopThirdGapMEB6` by a rational identity in nonnegative `h,d`, with `T=h+2`. The saved generated certificate and the final source contain the same 99 ordered positive integer literals, with scale `6350400` and constant literal `9741716812800`. The source's identity is checked by its retained Lean build; its positivity argument then yields strictness. Our audit compared the serialized terms and expressions, without expanding or evaluating the polynomial. The transfer from natural `T≥2` uses `h=(T:ℚ)−2` with its nonnegativity proof.

The last gap uses `MarkovTopTailKernelMEB6`, `MarkovTopTailScalarMEB6` and `MarkovTopTailClosedMEB6`. At `T=i+2` the exact masses have the `8,4,1`, `4,1`, and singleton forms. The row-step kernel identity clears denominators using `i≤s`. The scalar certificate has 70 ordered positive integer literals and constant `552251520`; the saved certificate matches the source literally. Exact scaled mass identities yield a gap identity with strictly positive factors `L`, the scale factors, and `K(d,i,i)`. Cancellation is justified by those positive factors, not by an assumed sign or nonzero value of a raw gap. The result is strict mass log-concavity for every natural `d,i` at `T=i+2`.

`MarkovTopTwoEdgesMEB6` attaches both gaps to raw coefficients and proves their polygon membership. `MarkovTopFrontierMEB6` combines them with the earlier finished region and the new denominator-threshold region. Its depth-5/6 argument exhausts starts at most 2, right-zero tails, and the two remaining edge starts; it does not impose a finite column bound on the final theorem.

## What remains open

The older upper-sector moment bound is proved equivalent first to `TopFiniteStripMEB6` and then to `TopInnerFiniteStripMEB6`. The final inner predicate requires, for **all** natural `T,i,d`,

`1≤i`, `i+3≤T`, `T≤d+2`, `d<topGapThresholdMEB6 T i`

implying `0≤G(T,i).eval(d:ℚ)`. First and last gaps are removed by the new unconditional edge theorems, and large `d` by the polynomial threshold. For a fixed `T`, the remaining index domain is finite; `T` remains universally unbounded. No finite experiment or finite-by-depth reduction proves this predicate.

The final `ThreeFrontierMEB6` horizontal clause retains every natural `i,j` satisfying `q+3<j`, `b<2j+1`, `j≠5`, and exclusion from `TopClosedRegionMEB6`. That closed region comprises the worker 183 finished region, the threshold region, and the new starts `i=3` or `i+2=t` in the upper sector. Its vertical clause still excludes only the already proved regions `((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)`. Its diagonal clause still excludes only `3≤i≤6 and j+2≤q`, with literal indices `(i,j+2),(i+1,j+1),(i+2,j)`. There is no new unconditional vertical or diagonal region in worker 184.

The all-numerator-two, all-three-directions result from worker 152 and the numerator-three lower/central horizontal results, including `2j+1≤b` from worker 181 and earlier correction bands/row 5, remain inherited. The recovered auxiliary obstructions from worker 183 remain failures of proposed summand/weight shortcuts, not source counterexamples. No failed build or empirical positive gap is promoted into a theorem.

## Validation and recovery chronology

The selected inventory is exactly 21 mathematical modules: eleven new modules with 40 theorems and 20 definitions, and ten recovered worker 183 modules with 54 theorems and 26 definitions. Every selected final source matches a successful archived build snapshot and the source hashes named by the joint replay and axiom audit. There are 29 retained build receipts: 21 successful mathematical builds, one successful print-Audit build, and seven failures with return code 1. There are no build timeouts and no additional pending or compiled-only mathematical source in this closed worker's inventory.

All ten recovered source hashes and their retained object hashes equal the sealed worker 183 finals. Worker 184 rebuilt them into its own evidence directory, then jointly replayed them with the new modules and printed their 54 closures in the same 94-name audit. This is a concrete later recovery, not inference from reconciliation prose or imported compiled code. Worker 183 remains historically `uncertain_effects`, interrupted controller/watchdog, null report, no receipt, and no recorded replay or axiom prints. Its partial archive, zero-byte archived object, separate retained ordinary objects, late opaque observations and original seal are not repaired or rewritten.

The Audit source `MarkovAudit1792226823913821000M55C.lean`, SHA256 `a6a116434758fc4a57d27b068843845b5746da4434135705d440568eaada3c7a`, was only an opaque late observation in the sealed worker 183 audit. Closed worker 184 now provides its generated source, successful build receipt, output and axiom record. Its suffix does not date its production to worker 183. This later attribution supplies worker 184 evidence only.

The isolated replay driver SHA256 is `e6e4c2d5978d872af2fa6cb975c7c76ec64b9b413ce9a9999a513692791827f2`. It collects the selected module constants, builds the inherited base, and rejects a pre-imported mathematical constant whose namespace is `MathGKM.Markov` and whose name ends in **either `M55C` or `MEB6`**, before ordinary `Environment.replay`. The retained output says 21 modules, four inherited imports, and 140 guarded mathematical constants, then `replay union passed`. This matches 94 theorems plus 46 definitions. The receipt's prose `isolation_scope` still mentions only `M55C`; that stale description is narrower than the actual two-suffix code and wrapper, and is not used as the coverage rule.

There are three explicitly written inherited imports (`MarkovTopCoefficientsMB3E`, `MarkovTopSupportMB3E`, `Mathlib`); the replay's compiled import set reports four, including the ordinary implicit `Init` import. The full project source graph has 2,818 nodes: 21 selected plus 2,797 inherited project source/object pairs. The latter match the previously sealed inherited base; the recovered ten are now selected targets, not silently inherited replacements. The general polynomial-bound endpoint imports no project module, the recovered kernel/moment endpoints have a smaller inherited closure, and the remaining endpoints use the full inherited project base. Exact endpoint maps are retained in the method evidence.

The axiom output names exactly 94 theorem closures. Ninety-two list `propext, Classical.choice, Quot.sound`; two list `propext, Quot.sound`. The printed names, source hashes and final selected inventory agree. The axiom wrapper parses the retained Lean print output, and the final validation checks its subprocess return code and the replay return code. Source text was scanned for forbidden admission tokens. These are recorded checks of the selected declarations; they are not a fresh rebuild or body replay of every imported module, compiler, Mathlib or kernel. The binary search path and object hashes are bounded evidence, not an atomic compiler source-to-object attestation. Source snapshots precede compilation of live paths; no same-module overlap or intervening source-change event was found for this worker's accepted builds.

The older 212 worker 121 unreplayed modules remain imported, including the 195-module subset; the separate 19 accepted modules remain a separate group. **Zero** of that backlog is newly recovered in worker 184. WindowLC retains its historical empty-checker and two-print boundary. Abel retains its historical source/object and two-print boundary. Importing either is not new coverage of its other named bodies. Worker 166's seven compiled-and-printed but unreplayed prefix modules remain absent from the current import graph; its recovered `MarkovCorrectionFactorMDB2` is imported, and no new recovery of those seven occurs. Prior timeout/failed-report outcomes, later explicitly dated recoveries, and historical source-version qualifications remain unchanged. There is no fresh whole-source rebuild, independent full-root completion audit, or goal completion.

## Failed versions and recorded finite evidence

The seven rejected builds are retained with their source snapshots and literal diagnostics: one polynomial-bound proof failure, two gap-degree proof failures, two Vandermonde proof failures, one missing TailScalar import while that dependency was still compiling, and one final-region rewriting mismatch. Each selected final source has a subsequent successful receipt. The TailClosed failed snapshot is already byte-identical to its later successful final source; its first failure was dependency availability. The final-region failure is not credited for its later corrected proof. No failed version is selected merely because its declaration names resemble the final version.

Finite counts were independently checked by iteration-domain and list-length counting only:

| Recorded domain | Audited count and limit |
|---|---|
| Gap polynomial probe | `2≤T≤50`, `0≤i≤T−2`: 1,225 polynomial cases and 50,225 coefficient slots. Empty negative list is saved experimental output, not arbitrary-depth proof. |
| Short-sum identities | `2≤T≤24`, `0≤i≤T`: 322 comparisons. |
| Newton cases | `i=0..12` and two sector flags: 26 cases. Finite difference values were not regenerated. |
| Monomial cases | `i=0..6`: seven cases; only the `i=0` generated certificate is the formal first-edge theorem. |
| Source upper-row scan | 42 numerator-three families, `q=1..18,29,43,67`, both residues; 746 rows, 13,948 coefficient positions, 3,546 short-sum comparisons. |
| Strict edge calls | 1,076 calls, 1,038 distinct `(q,r,t,i)` positions; the two starts coincide at `t=5` and the script counts both calls. |
| Saved source labels | 60 unique labels after the family/random-path/endpoint deduplication. Random paths were not regenerated. |
| Polygon-valid raw triples | H 90,383; V 90,383; D 90,889; total 271,655, counted from saved labels and original polygon/index guards. |

The saved source result reports 2,858 zero coefficients and no failures. Those values are copied observations, not recomputed zeros or coefficient checks. Every raw triple uses the original H/V/D indices and polynomial dictionary zero default. The all-natural theorems have their own formal support arguments and do not rely on these scans. Saved finite JSONs are tied to completed command outputs; generic positivity and the universal inner-strip sign remain open. The third-gap generator ran at event 126 and was edited at event 149. Its retained final helper hash does not authenticate the bytes used by the earlier invocation. The literal final certificate/source match and successful source checks are separate bindings; the audit neither reconstructs nor executes an earlier generator. Own primary parsing encountered a pre-output syntax typo and a command-record key mismatch, corrected before successful support generation; reviewer parsing refinements are separately recorded. They changed only T audit helpers and did not execute project code.

## Host cutoff, finalization and preservation

The worker started at **08:28:01.310879 UTC**, finished at **08:51:34.053195 UTC**, and reports elapsed **1,412.7423160076141 seconds**, matching the timestamp difference. Its nominal 1,800-second deadline was **08:58:01.310879 UTC**. Host completion is about **387.257684 seconds before** that deadline. Recorded proof/replay/Audit completion and finalization precede the delivered report. Receipt filenames plus durations provide interval estimates, not exact independently timestamped theorem acceptance times.

Finalizer event 189 returns the retained last-verification object; delivered report event 190 matches final.json and the receipt, and event 191 is `turn.completed`. There are 191 events and 56 completed command records, with no unmatched started item. The saved draft `report.json` and delivered report differ in wording and compression; they agree on the supported scope and open root, but are not asserted byte-identical. The draft mtime is 08:50:36.257834 and `last-verification.json` mtime is 08:50:39.157284. Archive copy mtimes near host finish must not be mistaken for proof-completion times.

There are exactly 131 archived files matching the controller's 131 changed paths. The manifest has 139 entries: 129 archived entries plus ten recovered source paths. The manifest itself and last-verification are the two archived administrative files outside the manifest. All archived/controller/current/manifest bindings checked agree. All 22,101 frozen input hashes remain unchanged, without exclusions; setup and checkpoint 1 are the two entries absent from the controller's earlier before-map. The finalizer also checks the 95 worker 182 manifest artifacts. Reconciliation and preservation are not substitutes for the separately recorded worker 184 replay.

Pinned root SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The request contract's ASCII compact sorted serialization hashes to `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`; the saved raw contract-file hash is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. Different serialization hashes are not a contract mutation. No mutable successor contract was read.

The initial exact current inventory additionally identified three unindexed/unarchived request-named `.pyc` files. They are retained only as opaque supplemental bytes with metadata, separately bound from mathematical validation. Their observation time is not their creation time; no bytecode was decoded or executed and no producer is inferred from the filename. The ten recovered source counterparts already have sealed worker 183 retention and are not treated as missing worker 184 source files. The final seal identifies all required supplemental copies and exact paths, so ordinary `.pyc` exclusion must not silently drop this explicit preservation bundle.

Prior operational COW consolidation changed some retained-copy inode/ctime values while preserving bytes and stated stable metadata; those historical operations supply no mathematical validation. No storage mutation was performed by this audit.

## Bounded final observation and audit bindings

Initial validation inventory: **08:57:47.002828 UTC**, closed184 archive131 and explicit current144 (archive∪manifest plus exactly three opaque caches). The method reviewer rehashed 191 named inputs unchanged during **09:14:29.847035–09:14:29.938150 UTC**; its separate N/A absence record (empty paths) is at .938185, and project reads closed at **09:14:29.938187**. The validator subsequently rehashed 25,249 named inputs unchanged during **09:15:09.204213–09:15:34.857742 UTC**. Its separate N/A absence record is at .857810. Its final exact inventory ran **09:15:34.857839–09:15:34.911557**, finding archive 131, manifest 139, current 144, exactly the three identified caches, no additions/missing paths/hash changes and all six source/copy metadata comparisons equal. Validation project reads closed at **09:15:34.911652 UTC**. These are bounded observations; the integrity seal does not extend them.

The two reviewers agree on 65 copied method fields, all 2,797 inherited pairs and 182 shared hashes. Their final windows include 19 and 35 retained T input pins respectively. Final exact-byte crossreviews and the integrity seal read audit files only. Earlier audit windows, especially worker 183's sealed partial observations, remain final.

An ENOSPC infrastructure failure prevented the first method-closing preparation tool from starting; it created no observation or proof claim. After the supervisor removed redundant generated publication copies, the unchanged authorized closure was retried successfully. The audit did not delete or replace research material.

Required retention comprises **18 files including the integrity seal**: this main, seven supports, the inherited pair map, the primary static helper, the T-only sealer, the final crossreview record, and five supplemental-cache files (manifest, observation, and three opaque copies). The exact list is in `markov_worker_000184_audit_integrity.json` under `preservation_paths` (17 non-integrity entries); retain that integrity JSON as the eighteenth file. The supplemental bundle is `markov_worker_000184_unindexed_cache_bundle`, with companions `markov_worker_000184_unindexed_cache_bundle.json` and `markov_worker_000184_unindexed_cache_observation.json`. No compiled mathematical binary supplement is needed in this round.


Exact supporting-file SHA256 bindings (the integrity seal additionally binds bytes and paths):

| File | SHA256 |
|---|---|
| `markov_worker_000184_mathematical_source_hashes.json` | `765ae572dd22d8d176b77ca3b9d991632f5b6684a86165ea2322ce565fe83059` |
| `markov_worker_000184_source_structure_audit.json` | `0653cd390657fc883b7305d23af72f0b99034ea3859f24d140430961c14b7540` |
| `markov_worker_000184_finite_domain_audit.json` | `a380340a7242a1f5c4c92c94d5a2d91d504047aca196fba88f2cf567518ff744` |
| `markov_worker_000184_validation_audit.md` | `a01cadc8fc4e100fa200aedc905549c90a9b2cdcff77cb0431d1a74d498db7e9` |
| `markov_worker_000184_validation_evidence.json` | `d8a212ed976c2e965f5e6568389314a5151d8c69a8b51944984ca16100dd962a` |
| `markov_worker_000184_replay_method.md` | `7353dfe5564140d5b899f72c2031fdb7955a05a5ba7116fb3424a848aee5a6ae` |
| `markov_worker_000184_replay_method_evidence.json` | `06783cd253cd191f6154d73b5cd22be4dbab3c7271f9324cefdc54601ffc1e4b` |
| `markov_worker_000184_inherited_pair_expectations.json` | `d44f30053d87038ec4b92988a646c44d62cfe903fb8a02d2f85f2eeee5314a13` |
| `markov_worker_000184_unindexed_cache_bundle.json` | `3ad78a66673d642c11825d6404885019362814ad10b62373e22e5ccf189fb027` |
| `markov_worker_000184_unindexed_cache_observation.json` | `fcc643d626ec38c00799e68ddd80daae143d1ede5a5b41cfe09099ab1064ccfa` |
| `static_math_worker184.py` | `c7479e1f077f6fb421f36b7d7f01a50b66ed30642539a70b96ee9504c70dda2b` |
