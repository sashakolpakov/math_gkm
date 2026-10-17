# Closed worker 000168 — independent mathematical and retained-validation audit

Request `418bcc643df14f6f8cfd3b6b16eb3aef`, suffix `M418`. The controller records **completed**, return code **0**, a delivered report, completion null and mathematical resolution false. The elapsed time is **1633.0466740131378 seconds**. This audit supports a new unconditional horizontal log-concavity region in the first correction row of every actual numerator-three source, together with an exact smaller residual formulation. It does **not** establish the full first correction row or the conjecture.

The ten selected mathematical modules contain **61 theorems and 27 definitions**. Their final sources have successful retained builds, a successful joint replay and one matching 61-name axiom audit. Two further mathematical candidates are excluded: the twelve-theorem/twelve-definition boundary certificate timed out twice, and the four-theorem source substitution was never compiled. No conclusion below credits those candidates, GAP output or finite experiments as proofs.

This is an archive-first, static audit of closed168 and explicitly named inherited/current counterparts. No project program, Lean/compiler/checker/replay, experiment, generator, CAS or finalizer was run or imported. No mathematical coefficient, sign, gap, binomial, polynomial value or certificate was recomputed. Audit-owned programs only parse records/source syntax, hash bytes, compare literal text and count finite index domains. Writes are confined to `/private/tmp/math_gkm_godel_20261013`. There was no proposer contact, research assistance, project modification or active169/later inspection. Earlier audit outcomes and observation windows remain final.

## Exact new source-level scope

Write `A(i,j) = coeff (frame path).mid.p i j` for the original integer bivariate coefficient. Actual numerator-three sources are exhaustively represented by `threeRawM9E2 q r`, where `q ≥ 1`, `r` is Boolean, and the denominator is `3q+1` for true or `3q+2` for false. This uses the inherited actual-path classification, not an unrestricted word or arbitrary polynomial hypothesis.

Let `d = correctionExponentMDB2 q r`: the natural subtraction `q−2` for true and `q−1` for false. The new theorem `source_correction_outside_windowM418` proves, for every natural starting column `i`,

`A(i,q+1) A(i+2,q+1) ≤ A(i+1,q+1)^2`

whenever **`i ≤ 6` or `d+2 < i`**. The theorem is unconditional within this source domain. It has no extra formula, positivity, support-shape, run-length or denominator-bound premise. The path theorem `source_first_correction_pathM418` transfers precisely this statement to every generated path with numerator three and records its actual denominator. All natural starts and zero coefficients in the stated region are retained.

The same file proves the entire first correction row for **`1 ≤ q ≤ 5`**, both source families. The `q=1` cases use the inherited small-row theorem directly; they are not forced through a formula whose premise is `q ≥ 2`. For `q≥2`, starts zero and one use the actual source zero theorem. Starts two through six use newly checked exact column/gap formulas. Starts beyond the correction support use the already proved lift-output log-concavity.

The new tail statement says that the **binomial correction term** vanishes beyond its cutoff. It does not say that every remaining raw coefficient vanishes: the lift-output summand can remain nonzero. Its generic auxiliary version permits any integer correction scalar because that summand has vanished; source scalars are still the fixed 8/4 specified by the actual source formulas. There is no deletion of zero tails or passage to a positive-coefficient subsequence.

This extends the preceding unconditional lower-row result `3j ≤ b`, while preserving all earlier low-row/strip results. The whole first correction row is not claimed for unbounded `q`; its remaining window is explicit below. This audit makes no novelty claim beyond the source-level change against the inherited theorem inventory.

## Column formulas, gaps and source bridge

`MarkovCorrectionColumnsM418` proves exact rational expressions for the raw first-correction-row columns **2 through 8**, uniformly in both source families. Its parameter is `q+2` with arbitrary natural `q`, so the row is `q+3` and the actual source parameter is at least two. Column two comes from the constant term of the augmented output. Columns three through eight use the inherited first-correction polynomial identity and explicit lower-column polynomials zero through five.

The inherited source identity has the exact raw-coordinate form at row `q+1`, column `t+3`: the lower-column polynomial plus `8 * choose(q−2,t+1)` or `4 * choose(q−1,t+1)`, under `q≥2`. The general lower-column identity used in that bridge retains its own range `2j+1 ≤ n`. There is no arbitrary extension of that range, change of coefficient normalization or omission of natural-zero cases.

`MarkovCorrectionGapsM418` proves five exact gap identities and five nonnegativity statements for rational parameter `x≥0`, then transfers the five adjacent raw triples beginning at columns **2,3,4,5,6** back to the integer coefficients by exact casts. The displayed Horner forms are the checked gap certificates. A raw column formula may have negative scalar coefficients; the audit does not infer that each such formula is coefficientwise positive. Nor does the file claim strict positivity for every gap: one gap polynomial has zero constant term.

The first failed Columns source imported the historical unbuilt `MarkovColumn0MAE9`. The final accepted source instead includes the renamed definition `columnZeroM418` and general identity `column_zero_explicitM418`. Literal comparison after identifier/whitespace normalization confirms these two blocks reproduce the old definition and identity. The old `source_column0MAE9` theorem is not copied. The renamed identity receives new compilation/replay/print coverage; the old module remains unbuilt and receives no retrospective recovery credit.

All ten selected files and theorem bodies were read. Named inherited reads were limited to the completed161 ColumnPolynomial, FirstCorrectionPolynomial, SmallHorizontal and Column0 sources, plus already sealed named source/hash boundaries. Earlier complete source bridges were not recomputed or re-audited as new work. The large excluded certificate was read at the level of formulas, declarations and proof skeletons; its long generated numerator literals were omitted from display and hash-bound, never evaluated. The excluded four-theorem Source candidate was read in full.

## Exact remaining root statement

`FirstCorrectionWindowM418` is the proposition that, for every `q≥2`, both Boolean families and natural starting column `i`,

`7 ≤ i ≤ correctionExponentMDB2 q r + 2`

implies raw horizontal log-concavity at row `q+1`. `first_correction_all_iff_windowM418` proves that this proposition is **equivalent** to the entire first correction row being horizontally log-concave for every `q≥1` and every natural start. The reverse implication combines the window premise with the proved prefix/tail and the separately handled `q=1` cases. The window itself remains unproved.

The accepted root theorem is exactly:

`Conjecture63 ↔ FirstCorrectionWindowM418 ∧ ThreeBeyondCorrectionM418 ∧ OtherFourM9E2`.

All three residual conjuncts are still open. For every `q≥1`, both families, and natural indices, `ThreeBeyondCorrectionM418` retains:

- Horizontal triples at rows `q < j`, except `j=5` and `j=q+1`.
- Vertical triples outside `((i=3 or i=4) and j+1≤q) or (5≤i≤8 and j+2≤q)`.
- Diagonal triples outside `3≤i≤6 and j+2≤q`, with literal endpoints `(i,j+2)` and `(i+2,j)` and middle `(i+1,j+1)`.

`OtherFourM9E2` retains the inherited `GlobalLC18` obligation for every actual path whose numerator is at least four. The root remains the original raw polynomial `Conjecture63`, with its original source/path scope and all three polygon-membership guards per direction. The guard is `ab≤bi+aj` and `i+j≤a+b−1`; coefficient indexing is unchanged. The all-natural arithmetic source predicates retain zero coefficients and are connected to the guarded root by the inherited exact equivalences, not by an undocumented guard weakening.

**English scope correction:** prose about preserving endpoints and every numerator family describes the root equivalence as a whole. It does not mean that already discharged endpoint or numerator-at-most-two families become newly open residual obligations. In particular, the completed152 theorem for all three directions of every actual numerator-two source, all natural indices and zeros, remains inherited. No root-completion claim is warranted.

## Absorbed representation and conditional positivity route

The accepted auxiliary kernel is

`absorbedLift d j c t = liftPoly j t + C(c * ((d−t : Nat) : Real)/(t+1)) * X^t`.

The subtraction is performed in the naturals **before** the real cast, so it is clamped at zero. The denominator `t+1` is positive for every natural `t`. The accepted choose identity and weighted evaluation identity hold for all natural `d,j,t`, including indices outside binomial support. The latter identifies the binomial-weighted evaluation with the exact augmented output at index `t+1` for integer `c`. Coefficient nonnegativity of the absorbed kernel separately assumes `c≥0`; the equality itself does not.

`absorbed_output_lc_of_cutsM418` is a conditional transport theorem: coefficientwise nonnegativity of every lower-cut gap implies adjacent augmented-output log-concavity at the successor triple `t+1,t+2,t+3`. It uses inherited binomial CrossLC and the weighted evaluation theorem. It does not prove the all-cut premise. Its generic integer scalar is not silently assumed nonnegative where the theorem does not need that assumption.

The accepted tail `d≤t` reduces to the old lift kernel. Coefficients past degree `t` vanish. Cuts with `h>t` vanish, leaving a nonnegative middle square when `c≥0`. The remaining predicate `AbsorbedMiddleM418` universally quantifies natural `d,t,h,k` and both source families with **`4≤t<d` and `h≤t`**. Its actual relations are `j=d+3,c=8` or `j=d+2,c=4`.

That predicate is **unproved**. The accepted reduction shows it suffices for the remaining first-correction window and hence the whole row; combining it with the two other residual predicates suffices for the root. It is not presented as an equivalence with the root and does not discharge the other directions or larger numerators. The coordinate map for the window is `t=i−3`, consistent with the source's raw column `t+3` and the weighted-output successor indexing.

## Boundary model versus excluded certificate

For the boundary cut `h=t`, the accepted bridge proves an exact polynomial identity

`gap = X^(2t) * (C gap0 + C gap1 * X + C gap2 * X^2)`

for all natural `d,j,t` and real `c`. It derives coefficientwise nonnegativity **conditional on the three scalar signs**. The accepted normalization identifies those scalars with three rational models when `j≥2` and `c` is integer. It also proves the natural binomial lower bound `j+1 ≤ choose(t+j+3,j)` used to shift the free binomial parameter. These are identities and conditional bridges, not an accepted universal boundary positivity theorem.

The excluded generated certificate has twelve cases: `s=2/3`, two modes and three scalar gaps. Its parameter substitutions cover `t=x+4`, `d=t+2+g` or `d=t+1`, with nonnegative rational `x,g,z`, and a binomial placeholder `B=z+j+1`. The `d=t+1` mode respects the natural clamp. The final source uses factored positive denominators and generated numerator expressions, but both recorded build attempts time out. The first attempted source differs from final in all twelve definition/proof bodies; the second snapshot is final-identical. Neither is accepted, replayed or printed.

The excluded Source file has four universal substitution candidates for actual natural parameters, using the accepted binomial lower bound to supply `z≥0`. It was never compiled and imports the failed certificate. No source-level boundary positivity is inferred from this file or from the generator's assertions. This keeps the failed attempt separate from the valid exact model/bridge already selected.

## Auxiliary obstruction, not a source counterexample

The selected `MarkovWeightedObstructionM418` formalizes a coefficientwise failure for the **augmented** kernel with `j=7,d=4,c=8`. The three original polynomials are `8`, `1968+8X`, and `18150+4026X+8X²`; their binomial-weighted forms are `8`, `1968+32X`, and `18150+16104X+48X²`. The formal gap has coefficient one equal to `−2880`.

The same source connects this to the actual path `threePathM9E2 5 true`, labels `3/19`, with raw row-seven columns `2,3,4` equal to `[8,2000,34302]`. It proves all three polygon memberships and a positive raw gap, recorded as `3725584`. These are retained formally checked literals, not values recomputed by this auditor. The negative auxiliary coefficient does not refute raw log-concavity, the new source region or Conjecture63. The obstruction concerns the augmented coefficientwise certificate, not the separately defined absorbed kernel.

## Selected inventory and retained checks

| Mathematical module, common prefix `Markov` and suffix `M418` | Theorems | Definitions | Retained status |
| --- | ---: | ---: | --- |
| CorrectionTail | 3 | 0 | compiled, joint replay, printed |
| CorrectionColumns | 8 | 8 | compiled, joint replay, printed |
| CorrectionGaps | 15 | 5 | compiled, joint replay, printed |
| CorrectionRegion | 5 | 1 | compiled, joint replay, printed |
| CorrectionRoot | 1 | 1 | compiled, joint replay, printed |
| AbsorbedKernel | 7 | 2 | compiled, joint replay, printed |
| AbsorbedReduction | 8 | 2 | compiled, joint replay, printed |
| WeightedObstruction | 5 | 0 | compiled, joint replay, printed |
| AbsorbedBoundaryBridge | 6 | 3 | compiled, joint replay, printed |
| AbsorbedBoundaryModel | 3 | 5 | compiled, joint replay, printed |
| AbsorbedBoundaryCertificate | 12 | 12 | two timeouts, excluded |
| AbsorbedBoundarySource | 4 | 0 | unbuilt, excluded |

The full mathematical inventory is twelve files, 77 theorem declarations and 39 definitions. The operational Audit and replay driver are separate. Neither excluded mathematical candidate is imported by the selected graph. Final source hashes match archived/current/controller/manifest values, successful immutable snapshots and recorded source maps for build, replay and axiom auditing. Selected ordinary objects match archived/current/controller/manifest/finalizer samples. Exact hashes and the individual failed snapshots are retained in the companion evidence.

There are **nineteen compiler receipts: eleven successes, six return-code-one failures and two timeouts**. The successes are ten selected modules plus the Audit. The failed attempts comprise one Columns version, two AbsorbedKernel versions, three WeightedObstruction versions and the two certificate timeouts. A generator JSON-parse failure and a subsequent missing-source wrapper failure occur before the certificate's receipt-bearing builds; the latter does not start a compiler and is not a twentieth compiler attempt.

The first certificate timeout took about 180.3739326 seconds and binds the earlier expanded-denominator version; the second took about 150.2368930 seconds and binds final source. Ordinary successful or failed proof edits are preserved as failed versions. A failed proof script is not an accepted alternate theorem version. No mathematical equivalence between the two generated certificate bodies was recomputed.

The one joint replay selects all ten modules, returns zero and prints `replay union passed`. Its 88 explicitly guarded names match the complete selected 61-theorem/27-definition inventory. It starts at **01:42:00.610313 UTC** and has a duration-based finish estimate **01:42:28.874665 UTC**. The concurrent Audit starts at **01:42:00.612745**, compiles successfully and finishes by estimate **01:42:25.599052**. It is not a separate post-replay Audit. All 61 distinct theorem print requests match 61 raw rows and the axiom JSON. Every recorded closure uses only `propext`, `Classical.choice` and `Quot.sound`.

The checker is an exact inherited retag with hash `9812df00f75e49a1d3bf86b348f90a40dfcc13c8f5ac06784baa4fa97a83e7ac`. It gathers selected module declarations, removes selected modules from direct inherited imports, rejects guarded selected names already present in the imported environment, rejects guarded unsafe/partial constants, and calls ordinary `env.replay` on the union. The explicit suffix guard is not an exhaustive enumeration of every generated/private constant. Optional module-part handling and compiled imported declarations retain their inherited trust boundary.

Build receipts snapshot/hash a named source before invoking the compiler on its live path; they do not include a digest of the object bytes produced by that subprocess. The finalizer's object hashes are later samples. The wrapper also hashes the checker after replay and records source maps after Audit compilation. Successful final snapshot/object associations are strongly cross-bound, but they are not atomic compiler-output authentication. No same-module build overlap or observed source-mtime overlap was found; bounded event/mtime observations cannot rule out transient path changes. No fresh whole-source build was performed.

## Imported proof boundary and historical gaps

The independently reconstructed inherited map has **2,616 source/object pairs**, all checked against sealed167 expectations and the controller-before/current hashes. Its observation window is **01:50:17.741319–01:51:04.090757 UTC**. Expectations are not invented from current bytes. This is 2,604 earlier inherited pairs plus twelve accepted167 modules. There are eight explicit direct inherited imports plus implicit `Init`; the selected source closure has 2,626 local nodes and the full graph, including excluded candidates and Audit, has 2,629.

All twelve mathematical endpoints inherit the old worker121 boundary: **212 globally unrecovered modules**, including the **195 subset**, with **19 separately accepted modules** retaining their own historical provenance. No old212 replay is performed or credited in168. The subset is not an additional backlog. WindowLC and Abel retain their historical compiler/source associations, unauthenticated produced-object bytes, empty old checker stdout and only two historical printed closures each. Stronger imported helpers acquire no new print coverage by implication.

Twelve of the thirteen accepted167 modules are in the inherited closure; LowerCross is absent, and the compiled-only ExpressionData helper is outside. The concrete167 degree/mass/packed certificate is inherited as compiled proof, not freshly replayed here. Worker166's seven compiled/printed but unreplayed prefix modules remain outside the selected dependency graph and unrecovered. Its five replayed core modules retain their historical scope. Other pending old candidates, including Column0, PairCleared and KernelLimit, retain their earlier status.

Worker156 remains historically TIMEOUT/null report with one seven-module replay and no complete axiom audit at cutoff; its twelve-module/44-closure recovery belongs to157, not to156's cutoff. Reconciliation or unchanged hashes do not backdate recovery. Old storage COW operations changed only attributed inode/ctime metadata of earlier retained copies; no hash or earlier seal is upgraded. The current mathematical-source support additionally pins 388 named older sources (264 imported and 124 comparison-only), 179 historical pending/other-status comparisons, two operational comparisons, sixteen inherited script identities and sixteen external source/object pairs. The 179 includes the compiled-only167 data helper and must not be described as 179 unbuilt files.

## Finite evidence and domain-only recount

All seven numerical programs, three generators, three CAS wrappers and three current GAP scripts were read statically, never executed or imported. Four numerical programs have main guards; the three absorbed probes run at top level. The generators and CAS wrappers also run at top level, so importing them would execute work and was not done. A long display of the GAP export was truncated; the full saved JSON stream was subsequently parsed only to count literal rows/terms, not to evaluate algebra or signs.

| Retained experiment | Exact audited finite domain/count scope |
| --- | --- |
| Source experiment | `q=1..64`, both families: 128 source cases for 13,312 adjacent triples, including 8,256 polygon-valid triples and 3,481 window triples. Coefficient/zero checks occur **only for q=2..64**, 126 cases: 13,545 coefficient positions and 5,040 positions in the index-defined zero region. |
| Correction probe | `j=3..40`, the two source relations, `t=0..d+j+1`: 180,310 coefficient slots. Separate small-`j` loop has `j=0..2,d=0..9,c=4/8`. Failure arrays are capped at ten/twenty, not total counts. |
| Column polynomial probe | Columns 2..20, both families and two prescribed shifts: 76 saved rows, 73 unique parameter rows. Saved degree/sign flags are not recomputed and do not enlarge the formal columns 2..8 or gaps 2..6. |
| Early absorbed probe | `j=4..30`, `t=1..d−1`, `h=0..t+1`: 226,872 coefficient slots. The `extra_failures` list is initialized but never populated; an empty list is not a separately tested assertion. |
| Clamped absorbed probe | `d=0..40`, both actual relations, `t=0..d+2`, `h=0..t+2`: 1,394,328 coefficient slots and 5,658 weighted identities. |
| Precomposition probe | `d=1..44`, both actual relations, `t=0..d−1`: 129,360 coefficient slots. The saved 1,980 negative constant observations and capped negative arrays are auxiliary failures, not source failures. Their signs were not recomputed. |
| Symbolic absorbed probe | `t=0..12`, both relations, `h=0..t`, with `d=t+2+G`: 3,458 outer gap-polynomial slots recounted. The reported 76,804 rational coefficients depend on dynamically trimmed symbolic arrays and are **reported only**, not independently recounted without forbidden algebra. This probe excludes the clamp boundary `d=t+1`. |

For the source experiment, the index zero region counted is `i<2 or i+j>n+2`; this recount does not evaluate coefficients. All seven result JSON records match complete retained stdout (the symbolic output follows thirteen progress lines). Empty failure lists are recorded finite observations only. No source polynomial, inequality, or binomial value was regenerated by the audit.

The first GAP invocation returns code zero but prints an explicit read-only-variable-`Z` error, so it is not successful mathematics. The corrected weak bound `B=Z+1` reports negative coefficients in four cases. The later linear bound `B=Z+j+1` reports zero negatives in twelve cases. Exported literal term-list lengths match the later printed counts. These are retained CAS observations, not Lean proofs. An initial JSON parse failed on line-wrapped output; the later generator used a streaming decoder. The generated Lean certificate still times out twice. The finite/source/hash support preserves all exact domains, saved counters, caps, output associations and this distinction.

## Finalizer repair, preservation and chronology

The initial worker snapshot contains **7,138 entries**. Two worker-owned files, checkpoint and setup, were created before setup/snapshot; the finalizer's repaired policy exempts exactly those two. Setup remains byte-identical, and only the checkpoint changed after its recorded update. All **7,136 non-owned initial inputs** match. No inherited input is exempted. Frozen documentation is checked by identity only, without reading its contents as part of the mathematical audit.

The retained traceback/control flow and preserved validation support that the first finalizer writes `validation.json` and then fails its unchanged-input check on the owned checkpoint. Its invocation-time script was not separately snapshotted, and this is not a continuous filesystem observation. The worker repairs the ownership exclusion, explicitly copies the already written validation to `validation-before-finalizer-reconciliation.json`, retains original `before.json`, and reruns finalization successfully. The two validation files are byte-identical, SHA `0477c3f4719218e46110f46ef88dd6a5860e2f35ba4c15977a494a80095b7272`. This is a recorded failed-finalizer repair, not a proof recovery or relaxation for inherited inputs.

The finalizer requires current-source-matching successful build/replay coverage and acceptable merged axiom declarations. It does not by itself require one joint replay, authenticate checker equality/success stdout, establish exact declaration-set equality or bind each print to its successful Audit object. The actual retained records satisfy those additional cross-checks independently. It selects a matching successful build and samples its object afterward. There is no future-write lock or compiler-output authentication.

There are **114 controller/archive artifacts**, **116 manifest entries**, an intersection of **112**, and **118 current exact-request files**. Manifest and last-verification are the two unindexed administrative archive entries. Four manifested opaque caches are absent from controller/archive. Every observed archived/controller and manifested current hash matches. Prior167's 124 controller/archive artifacts and 123 manifest entries remain unchanged; its separately retained cache is now an initial168 input, without altering its old archive or observation window.

| Timing observation | UTC, 2026-10-17 |
| --- | --- |
| Controller start | 01:20:04.529026 |
| Last selected mathematical build finish estimate | 01:41:45.978293 |
| Joint replay finish estimate | 01:42:28.874665 |
| Final last-verification original mtime | 01:45:53.746062 |
| Event-log mtime | 01:46:29.789471 |
| Delivered final.json mtime | 01:46:30.584358 |
| Activity content timestamp | 01:46:30.593161 |
| Host finish | 01:47:17.575700 |
| Nominal deadline | 01:50:04.529026 |

The host finish precedes deadline by **166.95332598686218 seconds**; final.json mtime precedes it by **213.9446680545807 seconds**. Report event242 equals final.json and receipt.report, followed by turn completion243. The event log has 243 entries, 115 started items, 29 completed file-change records, 516,805 bytes and empty stderr. All started items have terminal records. Archive-copy times record retention, not proof execution. Receipt epochs plus durations give finish estimates, not authenticated nanosecond timestamps; the report-to-host lag is not assigned a cause.

The assigned watch read only the exact receipt: four absent observations followed by the fifth/final observation at **01:47:35.070186**. Consecutive checks were at least sixty seconds apart and individual waits at most fifty-nine seconds. An initial closure message accidentally called these five absent checks and was immediately corrected. The support records the exact timestamps and interrupted waits. No active mathematics was read while waiting.

## Required opaque supplemental preservation

Four exact-request manifest-matching `.pyc` files were found in the initial named inventory but absent from the controller/archive. Their later copy window, **01:50:10.767640–01:50:10.769585 UTC**, is not their creation or discovery time. The observed source mtimes precede deadline. Bytes, mode, owner and mtime agree between observed source and copied supplement. No bytecode was interpreted, disassembled, imported or executed; no generating-process, source-version or successor attribution is asserted.

Preserve all four files under `markov_worker_000168_late_cache_bundle/`, retaining these relative paths:

- `research/__pycache__/correction_polynomials_418bcc64.cpython-314.pyc` — 6,198 bytes, SHA `c705af2aad547fd8979273c0ab5fde94c860a61968074ea718b5f9526aadeb72`.
- `research/__pycache__/correction_probe_418bcc64.cpython-314.pyc` — 5,697 bytes, SHA `f184bfe11e43aa6ca1b3e1ca56e68c985c20add40e84fd519e9b884db1f2adab`.
- `research/__pycache__/generate_boundary_418bcc64.cpython-314.pyc` — 6,875 bytes, SHA `7ed9f22ed6283d3b96f756233d56f2bed7ff924ece0c8ed7e3d4ade5158f855c`.
- `research/__pycache__/validate_418bcc64.cpython-314.pyc` — 5,808 bytes, SHA `b9bad7fa5a192b49d3a66c73d134bdcd31269e9ff30679da5abd1350b2a93d41`.

Total opaque bytes: **24,578**. Also preserve `markov_worker_000168_late_cache_bundle.json` (SHA `bfa3bab1938040cdd6c18dfe58e360ef573010978b8888ef70a76f97267f3f64`) and `markov_worker_000168_unarchived_cache_observation.json` (SHA `d4bade46d003543961490ec9fb30a4f9f82888226fdf27a10fb7e41e347a5a51`). These are separate retention supplements; the original archive/index/history remains unchanged and no validation is upgraded.

## Companion evidence and final review

The seven companion supports are mathematical_source_hashes.json, source_structure_audit.json, finite_domain_audit.json, validation_audit.md, validation_evidence.json, replay_method.md and replay_method_evidence.json, each prefixed `markov_worker_000168_`. The independent inherited pair map and two audit-owned helpers are additional preservation records. Exact source/object/snapshot/import/hash/axiom identities and failed versions are carried by these supports rather than duplicated as an enormous table here.

## Final audit observation

The method review closed its 176-input hash window at **02:08:55.816272–02:08:55.909612 UTC**, with all inputs unchanged and the four exact pending-object absences observed at **02:08:55.909695**. The validation review then closed its **10,265-input** window at **02:09:23.896139–02:09:55.262064**, all unchanged. Its four exact new ordinary-object absences were observed at **02:09:55.276871**. The closing exact-request inventory at **02:09:55.277182** retained **114 archive/118 current files**, precisely the four known manifested opaque extras, and no other missing or extra paths. Original/copy byte and selected-metadata checks for all four caches agree.

Independent records agree on **68 retained fields, 2,616 inherited pairs and 162 shared hashes**. The final audit-files-only rechecks cover **23 validation and 25 method temporary inputs**. The method companion crosscheck is embedded in its evidence, so its separate scratch JSON is not an additional preservation dependency. A sealer preflight corrected one audit-schema assertion: the initial-check list has 7,138 entries including two owned exclusions, while 7,136 non-owned entries are checked. No research program or validation was rerun by that correction.

All project reads are now closed. Subsequent main/helper review and sealing read temporary audit files only and do not extend these bounded project observations, assert future immutability or upgrade any older cutoff. The independent full-body source and method reviews concur; the integrity record binds the subsequent exact-file concurrence. No required research execution is pending for this audit, and none is authorized to fill the remaining mathematical gaps.

The pinned root source remains SHA `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Canonical contract SHA is `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`; raw contract SHA is `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. Controller receipt SHA is `7750e6971ba78c0db1d32caa483b0b4206b4fd0b0d232abba863ce3b44c2d7ba`.

All paths below are relative to `/private/tmp/math_gkm_godel_20261013`. Preserve these sixteen bound companion/helper/supplement files **plus this main note and the final integrity JSON: eighteen files total**. The four `.pyc` copies require explicit preservation despite ordinary cache exclusions. The original worker archive/index stays unchanged.

| Bound file | Bytes | SHA256 |
| --- | ---: | --- |
| `markov_worker_000168_mathematical_source_hashes.json` | 312191 | `8ff8912deb07eddb09ef09a68a475c0e2195b7e4c1fdc116001da347dd8891d6` |
| `markov_worker_000168_source_structure_audit.json` | 76909 | `2d397233cfe52f5916c44b43aff52cadb95e18a127d68fb660c049847b9f1ecc` |
| `markov_worker_000168_finite_domain_audit.json` | 35615 | `7b7fd7d31faa20b512ec28d63cee65cc801c0688f0d3b8d0410caf4f923edbd2` |
| `markov_worker_000168_validation_audit.md` | 24533 | `981d284ca4fbff80f3d4287de7f1fd70517594efdb70bab73167da3b306f5929` |
| `markov_worker_000168_validation_evidence.json` | 9089995 | `137d47a81af1edaff1a33dc730e3b3d3c8c65d5d32a5fe6d43d912152831eeb3` |
| `markov_worker_000168_replay_method.md` | 22863 | `d580b0bea0c5b40ef9c82b65d6d122149c341c6b3950d94f073d65f413175bab` |
| `markov_worker_000168_replay_method_evidence.json` | 15691690 | `d5a10ca3e44e4b35a30cbc5734edff7f41cdf1db7356ef32531b294350cdebaf` |
| `markov_worker_000168_inherited_pair_expectations.json` | 2418565 | `88353b354b77db4aebd0f7c1b4a659079681ef87931dd0fbd0e2d025db1753d5` |
| `static_audit_worker168.py` | 23332 | `fa0c948e0bc6875238f32ac723db4a2926b3ee128f4009f54586efb7da0e80f5` |
| `seal_worker168_audit.py` | 18778 | `709810c9cff35aa38a3c3c8fe409160b06406350652e4fe0d58c82527ba16893` |
| `markov_worker_000168_late_cache_bundle.json` | 5422 | `bfa3bab1938040cdd6c18dfe58e360ef573010978b8888ef70a76f97267f3f64` |
| `markov_worker_000168_unarchived_cache_observation.json` | 3660 | `d4bade46d003543961490ec9fb30a4f9f82888226fdf27a10fb7e41e347a5a51` |
| `markov_worker_000168_late_cache_bundle/research/__pycache__/correction_polynomials_418bcc64.cpython-314.pyc` | 6198 | `c705af2aad547fd8979273c0ab5fde94c860a61968074ea718b5f9526aadeb72` |
| `markov_worker_000168_late_cache_bundle/research/__pycache__/correction_probe_418bcc64.cpython-314.pyc` | 5697 | `f184bfe11e43aa6ca1b3e1ca56e68c985c20add40e84fd519e9b884db1f2adab` |
| `markov_worker_000168_late_cache_bundle/research/__pycache__/generate_boundary_418bcc64.cpython-314.pyc` | 6875 | `7ed9f22ed6283d3b96f756233d56f2bed7ff924ece0c8ed7e3d4ade5158f855c` |
| `markov_worker_000168_late_cache_bundle/research/__pycache__/validate_418bcc64.cpython-314.pyc` | 5808 | `b9bad7fa5a192b49d3a66c73d134bdcd31269e9ff30679da5abd1350b2a93d41` |

