# Worker 000143 retained validation audit

Request `58e5700333bc4922a9949ab13f9bac6f`; archive `/Users/sasha/math_gkm/.control/markov/workers/000143/artifacts`. This archive-first review covers completed worker 143 and exact named prior/current counterparts. Active worker 144 is excluded. Only static parsing, file hashes and audit-record comparisons were performed. No project code, Lean, checker, replay, experiment, generator or finalizer was executed, and no coefficient, binomial, polynomial, matrix, recurrence, moment or gap value was recomputed. No project file was changed and no proposer was contacted or assisted. Prior seals and observation windows remain unchanged.

**Controller outcome: completed, return code 0, recorded elapsed 1588.1232650279999 seconds.** Host finish is 211.876736 seconds before the nominal deadline. Structured event 180, final.json and the controller report agree; event 181 is turn.completed. Completion is null and mathematical_resolution false. There is no report.json draft in this request.

The accepted inventory contains **nine mathematical modules, 34 theorem closures and nine definitions**. Final source/build/object, one joint replay and axiom output bindings agree. The new equivalence concerns LowerSourceLCM58E and LowerBinomialLCM58E, with a root-implies-lower theorem. There is no new full-root iff or proved residual. The prior ResidualM6E1 source is unchanged and is not in this import closure. Local adjacent summand inequalities do not prove the arbitrary-pair midpoint bound or its separate summation bridge.

## Final source and object bindings

| Module | Theorems / definitions | Final successful build identifier |
|---|---|---|
| MarkovOffsetPairM58E | 3 / 0 | 1792157283326587000 |
| MarkovOffsetSquareM58E | 4 / 1 | 1792157443374906000 |
| MarkovOffsetFormulaM58E | 3 / 0 | 1792157597594376000 |
| MarkovSourceOffsetM58E | 4 / 1 | 1792157635814293000 |
| MarkovOffsetSupportM58E | 4 / 0 | 1792157829985488000 |
| MarkovOffsetReductionM58E | 3 / 3 | 1792158003692799000 |
| MarkovOffsetTermM58E | 4 / 2 | 1792158059223969000 |
| MarkovOffsetMixedM58E | 3 / 1 | 1792158111283509000 |
| MarkovOffsetObstructionM58E | 6 / 1 | 1792158181902137000 |

| Module | Final source SHA256 | Retained object SHA256 |
|---|---|---|
| MarkovOffsetPairM58E | `2e0ac6defc5c48a2482aba176529a7893f25ea7219d6077f41631ee35cc659f3` | `86eb6eabc240745cd1146ea110bc04d5755682e57827500d404c022360e80104` |
| MarkovOffsetSquareM58E | `0a9bd6ccee840521b4b08929f95a73e62556617cb7607f997b9ea44351d2fd98` | `df36f084b7971861c261c25ff5bd5dfa2356df418fbd1b14178995e5dce1f0d1` |
| MarkovOffsetFormulaM58E | `ce2651d4d31f2586f92acd21dc35f8b0eac272295d79fb73a1e48d30bc5a47e3` | `5bda3c52fa048b9d1768cfbbe766988ba6ff2fc6fe0a72c670f54f0aa0f1010e` |
| MarkovSourceOffsetM58E | `43abe853eff08a48238a47800c3f5c3d8deb764258e04bce8f1af35653f5693a` | `f3127c2288c112921cfbf31e4db918db7619d6e159b79a38b18328e6872725f9` |
| MarkovOffsetSupportM58E | `c00f77063274271f637f3da3218cef8d373c32fe5828e69e4f8c6713727b779a` | `83527416c351ec352ab3d811cf94ea1b10d6aa1883e2473d7d722670076deff4` |
| MarkovOffsetReductionM58E | `23ac582b232d18e56363ea43e378401cac40f2ea91cf969107fde5514a82d5b0` | `fa4a6f2069b24a28a7b23264856bdb2905e2522636bec01a87503d56c8f63c34` |
| MarkovOffsetTermM58E | `9f6eddd2fa04502ef908605774ba9798a65e2f81a97031d7c624468f8a92ae24` | `fcb2d60991e29034f1d3f91068acc1d8543aaab096c755e9dbe16d922686494e` |
| MarkovOffsetMixedM58E | `bf39a4ae521d078ed09a0f706b0655a213f2c95a93ae72e2ee4d129661042f27` | `0a4c72226728f64777f412e2dc61176cb4f27622c3adf110be8faef5d1dc19ed` |
| MarkovOffsetObstructionM58E | `6d759b55c939f85d9401238780422a8a001dcaea7f83ccfe23e222f9e0aebc1c` | `20f9e6f71f522fb811bd69e6fbe6607f8e1a30e498422ea71fea13ed38c3fd83` |

The mathematical-modules.json SHA256 `8851e46d094e84e699fbc14500ffba17d7e81db7b11eb0d69875530a5b1fb6ed` binds all nine modules, matching independent declaration-bearing-source enumeration, final successful snapshots, validation and joint selection, without duplicates. Eleven final Lean files comprise nine mathematics sources, one Audit and one replay driver. Ten objects comprise mathematics plus Audit.

The raw validation schema is unchanged: per-module source/object hashes and build_receipts, with replay, axioms and theorem_closures at top level. The raw record is preserved. Source paths and declaration inventories are independently derived in a labeled comparison projection, not attributed to nonexistent raw per-module theorem lists. Null completion comes from the final checks/report, not an invented validation field.

Final source hashes agree across archive/current bytes, compiler receipt/snapshot, replay and Audit maps. Final object hashes agree across validation, controller, index, archive and current bytes. Each current dependency successfully builds before its dependent final successful build; all final mathematics builds precede replay and Audit. These are retained source/build/object associations, not an independent source rebuild.

The sole replay, `replay-1792158217616154000.json`, selects all nine final modules and **43 explicit declarations**, exactly 34 theorems plus nine definitions. Its declared-name inventory agrees with source parsing; no selected name is duplicated or occurs in the inherited base. One Audit requests and prints all 34 theorems once. Thirty-three closures use exactly `{propext, Classical.choice, Quot.sound}`; offset_kernel_zeroM58E uses exactly `{propext, Quot.sound}`. All are permitted. Audit source/snapshot, requests, stdout, source-hashed axiom JSON and final pointers agree. Definitions participate in replay without theorem-print rows.

## Rejected and superseded versions

Twenty compiler receipts have twenty immutable snapshots: **eleven successes and nine return-code-1 failures**, with no timeout. Ten successes bind the nine final mathematical modules plus Audit; the eleventh is a superseded successful Obstruction source. No rejected snapshot equals final bytes, no snapshot-only invocation, unsuccessful replay, new unbuilt module, definition-only accepted module or compiled-only remainder is found.

| Rejected build identifier | Module | Outcome | Seconds | Snapshot theorems / definitions |
|---|---|---|---|---|
| 1792157212879316000 | MarkovOffsetPairM58E | return 1 | 26.854666 | 3 / 0 |
| 1792157262403740000 | MarkovOffsetPairM58E | return 1 | 3.772578 | 3 / 0 |
| 1792157365393997000 | MarkovOffsetSquareM58E | return 1 | 9.959607 | 4 / 1 |
| 1792157538157858000 | MarkovOffsetFormulaM58E | return 1 | 22.863450 | 3 / 0 |
| 1792157722588738000 | MarkovOffsetSupportM58E | return 1 | 8.771083 | 4 / 0 |
| 1792157786221625000 | MarkovOffsetSupportM58E | return 1 | 3.989903 | 4 / 0 |
| 1792157908918521000 | MarkovOffsetTermM58E | return 1 | 3.987835 | 4 / 2 |
| 1792157972209530000 | MarkovOffsetReductionM58E | return 1 | 3.609810 | 3 / 3 |
| 1792158002524697000 | MarkovOffsetTermM58E | return 1 | 5.088418 | 4 / 2 |

The failures comprise two OffsetPair, one OffsetSquare, one OffsetFormula, two OffsetSupport, two OffsetTerm and one OffsetReduction attempts. All nine rejected snapshots retain their final explicit theorem/definition inventory. OffsetSquare build-1792157365393997000 has invalid unspaced inequality tokens and parser errors, so whitespace-normalized header equality does not establish parsed-statement equivalence for that source. Other retained header comparisons are static; proof-body repairs concern syntax, rewriting, coercions and arithmetic/elaboration. Diagnostic placeholders are not source admissions, and a failed proof attempt is not a mathematical counterexample.

The initially successful Obstruction build, **1792158111283498000**, has four theorems and one definition at source SHA256 `18cb2305ed4bd18da2e7c18383dd6e7d041278d1d7b7f84adc44957fe9972d4c`. Final acceptance uses the later source hash listed above. The final source adds lower_term_nonnegM58E and lower_term_localM58E and changes its import from OffsetTerm to OffsetMixed. It is rebuilt successfully as **1792158181902137000**, before replay and Audit. The earlier successful source was not separately replayed and is not credited with the two later theorems.

The early Obstruction and Mixed builds overlap, but that early Obstruction source imports Term rather than Mixed. This is not a dependency-order defect in the accepted version. The final Obstruction build follows Mixed's successful finish. Immutable snapshots are pre-invocation observations; compilation targets the research source. Accepted final evidence is not inferred from matching names or the old successful receipt.

## Replay method and sharply reduced import scope

Driver SHA256 is `30bdb33b389de3533536041b40aacb445d8f4a9f28549728a88fa58266755608`. ReplayIsolatedM58E and the validation/Audit wrappers are exact 142 retags; normalization reproduces the retained ordinary Wide replay core. Recorded checks use Lean v4.32.2, compiler `-j 1`, replay stack 131072 and a joined task with propagated result. The current replay invocation uses **180 seconds**, versus 142's 240-second argument; Audit remains 180 seconds. This invocation-limit change is not a checker, parser, stack or failure-propagation change.

The checker gathers available selected module-data constants, excludes selected modules from the direct-import union, constructs the inherited environment and invokes ordinary replay. Its guard rejects collected MathGKM.Markov.*M58E names already in that base or marked unsafe/partial. All 43 explicit declarations satisfy it. Generated/private/equational constants outside the predicate retain ordinary replay handling. This audit does not decode every compiled part, authenticate external executable/library binaries, rebuild inherited sources or freshly replay inherited bodies.

Source maps are recorded before invocation, checker hashes after replay returns and Audit maps after compilation. Matching retained observations do not authenticate invocation-start executable identity or continuously monitor source changes. Audit starts **1.153311 seconds after** replay and finishes **0.110199 seconds after** it. They overlap; axiom printing does not imply replay completion at Audit start.

The joint base contains **53 inherited local modules and zero selected current modules**. Its three explicit imports are MarkovCentralBinomialM6E1, MarkovFibGlobalM6E1 and MarkovSquares3556. Implicit Init makes **four total direct imports**. The accepted mathematical closure is **62 = 9 new + 53 inherited**, with Audit giving 63. Operational driver and external library trees are outside these local counts. No local cycle, unresolved source or saved final-source mismatch is found.

Final OffsetObstruction reaches all nine current modules and all 34/9 declarations, giving the complete 62-node closure. This differs from the earlier batches where no single current root reached every selected module. There is no earlier 143 replay. The inherited Lean path still carries older directories, but resolved/selected import membership is the 53-node base, not the number of path entries.

All **53 exact inherited source/object pairs** match sealed 142, before143 and current hashes without fallback. The independent current pass ran from 2026-10-16T14:02:52.972396+00:00 through 2026-10-16T14:02:52.996009+00:00. They comprise 51 of 142's inherited bindings plus its accepted CentralBinomialM6E1 and FibGlobalM6E1. The other seven accepted 142 modules, including ResidualM6E1, are absent. Three accepted 141 modules remain inherited: FibLowM3A1, CentralSumsM3A1 and CentralSquareM3A1; the other four are absent. Preserving source/object identity is not fresh source compilation or inherited-body replay.

**None of the old 212 worker-121 compiled-but-unreplayed modules is imported here.** The historical backlog, including its 195-module subset, remains unrecovered globally; current recovery, compilation and selected replay counts are zero. The 19 historically accepted 121 modules and its unbuilt drafts are also absent from this closure. Absence is not recovery or revocation of earlier results.

The 23 worker-134 modules recovered by 135 are also absent from this base, retaining their 135 provenance globally. Their exact saved receipt hashes remain preserved; no current recovery is inferred. No accepted modules from workers 135, 136, 138, 139 or 140 enter this reduced base. Historical excluded drafts, HighCone2GapM81F and failed SmoothProbe remain excluded, without upgrades to old timeout/failure states. Comparisons to older sources below document scope and preservation, not current import credit.

## Preservation and administrative evidence

All **89 controller artifacts** match archive/current bytes; all **87 index entries** agree. Manifest.json and last-verification.json are the two unindexed controller artifacts. Composition is ten objects, 34 JSON files, 31 Lean files (eleven final plus twenty snapshots), one text file, seven Python files and six Markdown files. No extra exact-request archive/current artifact was found.

All **6132 initial entries** are preserved without exclusions, including the request's unchanged setup source and 156 Python cache files. This is a snapshotted-input count, not a claim that every entry predates the request. Controller before143 and evidence/before.json have different coverage but matching pins where both contain a path. Initial source/configuration preservation is separate from inherited-object verification.

The selected latest predecessor manifest is 142's 91-entry index. Separate reconciliation covers all recorded changes for workers 136, 137 and 142: **88 + 0 + 93 = 181** controller artifacts. Archive/current/controller/before pins match. Receipt projections remove only changes, preserve the other fields and retain the last **two** events; exact event hashes/counts match. Earlier 136 timeout/null report, 137 stopped/zero changes and 142 completed status remain unchanged. No old command is rerun or stop requester inferred.

The new inherited-decoded.txt, SHA256 `1e9fde32371a82cc66e7e8464729347abc433b5ced5eb8a68aadd9a792232285`, contains six exact fixed administrative path headers. Each embedded content hashes to its independently verified administrative-file pin. This direct archived-content comparison does not require parsing the current inherited index. There is no before143 hash for inherited.json; its separate current byte-hash observation is not an invocation-time identity claim. No active worker 144 state is inspected.

The old 134 late timed-out Audit receipt build-1792141544717794000.json remains before143-pinned at SHA256 `68d1770f48a05dd8bbffb57edfd6317ba72152b449e0c8075c3de7679a91799d`, outside this request's initial inventory/index and equal to its existing separate late bundle. It remains a failure record, not a successful old print, replay or backdated completion.

Companion supports agree on all nine source inventories, 34/9 declarations, **66 named older source comparisons** and five retained result hashes. Fourteen older comparisons enter this closure; 52 are comparison-only. The old ResidualM6E1 hash is unchanged but outside the selected base. Its unchanged bytes do not create a new current root reduction.

## Experimental records and their limits

No experiment-bindings file, result script self-hash or result input map is present. Named saved commands/output and separately indexed script/result bytes establish the retained associations. The inherited 136 raw/source helper and its scan.py import match exact prior/current pins; scan.py is absent from initial preservation/index but present in controller-before. No invocation-start interpreter or complete transitive-import authentication is inferred. No numerical experiment was rerun by this audit.

The initial probe executes at events 31–32, then executes again on import of C at events 33–34 because its loops/write are top-level. Final probe.json matches event **34**, including runtime **0.41699454095214605**, rather than event 32's **0.4062350000021979**. Every other field agrees. Each execution records 194565 midpoint comparisons and 194565 mixed comparisons; each failure list is capped at ten examples rather than an exhaustive failure count. Subsequent event-34 square-only modes save four lines with 59059 comparisons and no found failure per mode. These supplementary outcomes are event evidence, not separately hashed numeric result files.

Event 113 exactly matches mixed-certificate.json's saved expansion record. Its polynomial expression and nonnegative-coefficient flags are not recomputed. The final ordinary Lean identities and local inequalities are separately in the accepted inventory; generator output is not an added axiom.

Event 139 exactly matches experiments.json. Static input/index domains record 241 source comparisons, 860 tested rows, 51080 coefficient positions and support positions, 49360 source triples, 14880 scaled identities, 14065 local mixed checks and 1316172 arbitrary-pair midpoint comparisons on the finite j≥2 domain. The saved 15780 zero-containing triples and all coefficient, sign, gap and obstruction values are not recomputed. Other one-off domains and their capped/saved outcomes are recorded in the finite companion; they are not universal proof checks.

The accepted local adjacent-index inequality for j≥2 is distinct from arbitrary h,k midpoint comparison and the separate summation bridge. The universal j=1 certificate obstruction is not failure of source-row LC or a root counterexample; the source-connected 2/5 example separately proves raw LC. The arithmetic/source subproblem equivalence does not discharge its remaining universal sign proposition. No new full-root iff, residual theorem or global lower-row LC is inferred from finite success or the local theorem.

## Finalizer, report and exact chronology

The finalizer retains the literal nine-module list, matching-source successful compiler receipts and object hashes, and exact equality of the whole final source map in a successful replay and axiom JSON. It does not separately enumerate per-theorem membership, independently parse permitted axiom sets from stdout or enforce expected checker/executable identity. The actual source/name/output bindings are independently checked. Its lexical forbidden words are sorry, admit, axiom and native_decide; unsafe/partial are handled separately by the selected replay guard and source review.

validation.json is written before preservation assertions. Initial preservation and fixed root/canonical contract are asserted. Terminal index/prior mismatch lists are recorded without a final assertion that both are empty; the actual saved lists are empty and independent hashes agree. The research selector can include files absent from the initial inventory or tagged to the request; actual retained inventory contains only the recorded completed-request artifacts. STOP=false is historical recorded state, not asserted absence or a claim about current controller state.

The first finalizer, events **174–175**, returns 0 and reports 85 indexed artifacts. File-change events **176–177** add literature.json and final-checkpoint.md. The second finalizer, **178–179**, returns 0 and reports 87. Both printed final-check objects equal the saved record. Only the final manifest is independently retained; the earlier count 85 is event evidence, not an independently preserved earlier hash map. The additions are indexed by the second pass; no proof, replay, experiment or axiom check is rerun by either finalizer.

last-verification.json records artifact_count 87, prior_input_count 6132, manifest hash, empty mismatch lists and null completion. It does not echo root/contract hashes. final-check binds those targets and has no finished_utc field. No report.json draft is retained or generated. Delivered structured event 180 equals final.json and the controller report; event 181 is turn.completed. Final.json SHA256 is `b48c60dab2428303fe662209fd83ea3af503e185285b98cdb24b7bde7e9eba7e`. Null completion and completed worker status do not admit the full root. The literature record describes the worker's own retrieval; no external theorem is assumed as an added axiom and this audit did not browse for research assistance.

All following times are UTC on 2026-10-16.

| Retained milestone | Time UTC |
|---|---|
| Controller start | 13:21:34.318096 |
| Last mathematical build finish estimate, OffsetObstruction | 13:43:05.878062 |
| Joint replay start | 13:43:37.616154 |
| Audit start | 13:43:38.769465 |
| Joint replay finish estimate | 13:43:43.541220 |
| Audit finish estimate | 13:43:43.651419 |
| markov-58e57003-final-checkpoint.md project mtime | 13:47:11.752056 |
| literature.json project mtime | 13:47:11.813137 |
| mathematical-modules.json project mtime | 13:47:11.870571 |
| validation.json project mtime | 13:47:11.875089 |
| final-check.json project mtime | 13:47:11.992676 |
| manifest.json project mtime | 13:47:12.038938 |
| last-verification.json project mtime | 13:47:12.119658 |
| events.jsonl mtime | 13:47:37.386226 |
| final.json mtime | 13:47:38.454075 |
| Activity heartbeat content time | 13:47:37.789423 |
| Archived last-verification copy mtime | 13:48:02.429854 |
| Controller host finish | 13:48:02.441360 |
| Nominal 1800-second deadline | 13:51:34.318096 |

The retained elapsed is **1588.1232650279999 seconds**, while subtraction of the stored finish/start timestamps gives **1588.123263835907 seconds**, differing by **0.0000011920928955078125 seconds**. These are reported separately rather than claimed exactly equal. Host finish is 211.876736 seconds before deadline. Replay and Audit finish estimates precede it by 470.776876 and 470.666677 seconds; verifier write by 262.198438; final.json by 235.864021. Host finish follows verifier write by 50.321702 seconds.

Receipt finish estimates add monotonic durations to pre-invocation filename timestamps rather than independently measuring wall-clock process exit. File mtimes are retained write observations; event-log mtime is not an individually timestamped final event. Archive verifier copy time is distinct from the project write. Heartbeat content is distinct from activity.json's mtime. All 181 events and 84 started items have matched completions. The 439307-byte event log plus empty stderr matches activity accounting; heartbeat content follows log mtime by 0.403197 seconds. This is retained-record accounting, not an independent process census. No indexed project artifact is observed after deadline or host finish.

Fixed root SHA256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`; raw contract `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`; canonical compact sorted ASCII contract `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`. Manifest SHA256 is `ddb9d2d97eee8a8e66cc982728524d85445fbfbbeeb736a5d7cfe0307792a9cd`; last-verification SHA256 is `864eefa7f0664f53272985d28d725fca67da857439b17a47f4e9168e7882bf4d`. These bind targets and records, not a proof of the root.

## Final observation boundary

Final stability rehashed **6763 recorded inputs** during 2026-10-16T14:10:45.189824+00:00–2026-10-16T14:10:45.669249+00:00, with no changed or missing input. Exact-request current/archive observation at 2026-10-16T14:10:45.678465+00:00 found no extra or missing 143 file; no new late bundle is required. The method's **110-input** pass was unchanged during 2026-10-16T14:08:48.186497+00:00–2026-10-16T14:08:48.239959+00:00. Project reads stop after the final validation observation. Later crossreview uses audit files only and does not extend earlier windows.

Full source/object, receipt, snapshot, version, preservation, import and timing details are in markov_worker_000143_validation_evidence.json. Method note SHA256: `f1593b46d7504f33df885b63d1b2ae6dc3552a05acb5a10aabe425eb542a7429`; method evidence SHA256: `f707adbc7f9c9e0f915ea6f8afb9ebe5798b23ab357fc25bd25299fec980592a`. No missing project check was executed by this audit.
