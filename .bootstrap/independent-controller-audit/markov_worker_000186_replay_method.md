# Worker 186 retained replay-method and import audit

Closed request `ca9709f2af7048a4813bd37d46ae4ce9`, suffix `MCA9`. This archive-first static review binds retained sources, compiler snapshots, ordinary object identities, replay and axiom records, wrapper/driver semantics and explicit inherited pairs. No project compiler, Lean proof, checker, replay, finalizer, generator, experiment, CAS, mathematical-value or RNG computation was executed or imported. Active worker 187 and later inputs are excluded. The host receipt records completed, return code 0 and a report; mathematical resolution remains false. These checks do not prove the whole conjecture or assert novelty.

The final selected set is twelve newly compiled mathematical modules, 73 theorem declarations and 20 definitions. All twelve participate in the final joint replay, and all 73 theorem names are explicitly printed in the final Audit. No mathematical module is compiled but unselected, pending or unbuilt. The two Audit modules are operational validation products and are counted separately. Worker 186 performs no new historical recovery.

| Selected module | Theorems | Definitions | Final source-matching build receipt |
| --- | --- | --- | --- |
| MarkovTopBetaComparisonMCA9 | 9 | 4 | build-1792229602132013000.json |
| MarkovTopBetaGroupingMCA9 | 7 | 5 | build-1792229743765427000.json |
| MarkovTopBetaMeanMCA9 | 5 | 2 | build-1792229464046315000.json |
| MarkovTopBetaTransportMCA9 | 8 | 0 | build-1792229880528360000.json |
| MarkovTopCentralGroupsMCA9 | 4 | 1 | build-1792230517265324000.json |
| MarkovTopEndGroupsMCA9 | 6 | 0 | build-1792230453134176000.json |
| MarkovTopLinearResidualMCA9 | 4 | 3 | build-1792229944566480000.json |
| MarkovTopLinearSourceMCA9 | 7 | 0 | build-1792229905241085000.json |
| MarkovTopLowerGroupsMCA9 | 8 | 3 | build-1792230441514379000.json |
| MarkovTopPTiltObstructionMCA9 | 3 | 0 | build-1792230565540888000.json |
| MarkovTopRadialCompareMCA9 | 5 | 0 | build-1792229550876741000.json |
| MarkovTopWeightedBetaMeanMCA9 | 7 | 2 | build-1792230305655895000.json |

There are 22 compiler attempts: fourteen successes (twelve mathematics and two Audits), eight return-code-1 failures and no compiler timeout. All fourteen successful snapshots are byte-identical to their retained final source. There is no superseded successful source. All eight rejected snapshots retain the final import list, declaration-name set and whitespace-normalized common declaration headers. Those header checks are lexical; complete literal source diffs are embedded to distinguish changes the header comparison does not see.

| Rejected receipt timestamp | Module | Correction in final source |
| --- | --- | --- |
| 1792229377069338000 | BetaMean | betaBaseSumMCA9 changes implicit m-k to ((m-k : ℕ) : ℤ); definition-body subtraction/cast correction. |
| 1792229527403369000 | RadialCompare | Explicit nonnegativity facts and linear arithmetic in the radial comparison proof. |
| 1792229575842634000 | BetaComparison | Uses pos_of_mul_pos_right instead of pos_of_mul_pos_left. |
| 1792229699193698000 | BetaGrouping | Supplies the explicit summand to antidiagonal_square. |
| 1792229820040397000 | BetaTransport | Casts the choose identity and adjusts field_simp/ring proof chaining. |
| 1792230226247174000 | WeightedBetaMean | Only adds set_option maxRecDepth 8000. |
| 1792230416776212000 | EndGroups | Names and substitutes the endpoint equality before unfolding. |
| 1792230518469682000 | PTiltObstruction | Expands choose, descending factorial and factorial in norm_num. |

The first correction is not proof-only: it changes a definition body while retaining its header. WeightedBetaMean changes only a compiler recursion option, with no theorem-body or header change. Its failed attempt returned 1 after 53.12379045796115 seconds under a 120-second limit; the successful final attempt took 121.09243483300088 seconds under an explicitly increased 180-second limit. It is not a timeout or a successful breach of the configured limit. The other six changes are proof rewrites. Rejected sources receive no successful-build or replay credit.

## Recorded validation stages

| Completed event | Modules | Theorems / definitions | Guarded names | Replay record | Audit source |
| --- | --- | --- | --- | --- | --- |
| 129 | 7 | 45 / 14 | 59 | replay-1792229969158761000.json | MarkovAudit1792229977427182000MCA9 |
| 197 | 12 | 73 / 20 | 93 | replay-1792230612754560000.json | MarkovAudit1792230628840587000MCA9 |

| Stage | Replay start estimate UTC | Replay seconds | Audit compiler start UTC | Audit finish estimate UTC | Axiom-record write timestamp UTC |
| --- | --- | --- | --- | --- | --- |
| 1 | 2026-10-17T09:39:29.158761+00:00 | 8.243094292003661 | 2026-10-17T09:39:37.427266+00:00 | 2026-10-17T09:39:44.147430+00:00 | 2026-10-17T09:39:44.150268+00:00 |
| 2 | 2026-10-17T09:50:12.754560+00:00 | 16.056757624959573 | 2026-10-17T09:50:28.840796+00:00 | 2026-10-17T09:50:36.006152+00:00 | 2026-10-17T09:50:36.010725+00:00 |

The first stage covers seven modules and 45 theorems. The second adds WeightedBetaMean, LowerGroups, EndGroups, CentralGroups and PTiltObstruction, reaching twelve modules and 73 theorems. The 45 plus 73 print rows total 118 rows and 73 distinct names. Across both stages 114 rows report `propext`, `Classical.choice`, `Quot.sound`, and four report only `propext`, `Quot.sound`. In the final stage the corresponding partition is 71 plus two: `beta_scalar_radialMCA9` and `beta_scalar_symmetricMCA9` are the two without Classical.choice. No empty axiom set occurs. Both stage source maps match the retained final bytes; final validation selects only the second-stage replay/Audit records.

The finish wrapper was created by completed event 119 and expanded by completed event 190. Its earlier file bytes and overwritten first validation JSON were not separately snapshotted. The initial stage is instead bound by its retained replay receipt, Audit source/build snapshot, axiom JSON and exact completed-event 129 output. The final wrapper hash is not assigned backward to that earlier invocation. Receipt-name start clocks and durations yield compiler/replay interval estimates, not independent process telemetry; the axiom JSON filename marks its later write, not compiler start.

## Checker, wrappers and binary trust

The retained `ReplayIsolatedMCA9.lean` has SHA-256 `2ca212d0790f2223d78aad01d4a3a5502d383f1cdbf337ea456069119493095e`. Its full body matches the predecessor driver after the single MDCB-to-MCA9 suffix retag. Its operational function still has the historical spelling `replayIsolatedM55C`; that spelling does not select the guard suffix. The driver reads selected compiled module data, collects constants and the nonselected direct imports, constructs and finalizes the imported base environment, then replays selected constants. Optional server/private module parts and the operational unsafe loader remain part of this implementation boundary.

The additional guard checks every collected name beginning `MathGKM.Markov.` and ending `MCA9`: it requires absence from the imported base and rejects unsafe or partial declarations. It is not limited to the wrapper’s explicit lexical name array, despite narrower isolation_scope prose in a saved wrapper label. The observed totals are 59 and 93. In these final sources the wrapper’s anchored theorem/definition enumeration agrees with independent lexical declarations. This does not prove that every generated/private declaration follows that naming pattern; differently named constants remain within ordinary loading/replay behavior.

The three written direct inherited imports are `MarkovTopBetaClearedMDCB`, `MarkovTopBetaScalarMDCB` and `MarkovTopTailResidualMDCB`. Saved replay output reports four because implicit `Init` is also present. The full transitive base has 2,825 inherited modules. Importing their ordinary objects is not fresh replay of their bodies. The Lean executable, kernel, imported library binaries and older project objects remain trusted; no fresh whole-source or whole-campaign rebuild is claimed.

Validate and audit wrappers are exact predecessor retags. The compiler wrapper hashes and snapshots the source, then compiles the live source path; this sequence is not atomic. Compiler receipts carry source hashes but no output-object digest authenticated at compiler completion. Matching archived/current objects and final replay source maps supply later identity observations, not a missing completion-time attestation.

Two estimated cross-module build overlaps occur: successful WeightedBetaMean with failed EndGroups, and successful CentralGroups with failed PTiltObstruction. No same-module overlap, completed selected-source edit inside a compiler invocation, or final source mtime inside its own build estimate was found. The final WeightedBetaMean uses 180 seconds; the other mathematical attempts use 120 seconds. Audit’s inner compiler limit is 100 seconds; the finish wrapper uses a 240-second replay and a 120-second outer Audit limit. These checks do not remove the live-input non-atomicity limitation.

## Independent inherited graph

The reconstructed graph has 2,837 modules: twelve selected and 2,825 inherited. The inherited set is all 2,817 worker-185 inherited entries plus eight of its nine accepted selected modules. `MarkovTopTailPolynomialMDCB` is the sole excluded worker-185 selected module. The other eight are BetaCleared, BetaMoments, BetaScalar, Likelihood, Tail3, Tail4, TailRepresentation and TailResidual. Nine of the ten worker-183 bodies later recovered by worker 184 remain imported; TopObstructionsM55C stays outside. The ten-module/54-closure recovery is historical worker 184 validation, not a new worker-186 recovery.

| Endpoint | Selected ancestors incl. endpoint | Ancestor theorems / definitions | Inherited modules | Old 212 / included 195 / separate 19 |
| --- | --- | --- | --- | --- |
| MarkovTopBetaComparisonMCA9 | 3 | 19 / 6 | 2814 | 212 / 195 / 19 |
| MarkovTopBetaGroupingMCA9 | 4 | 26 / 11 | 2814 | 212 / 195 / 19 |
| MarkovTopBetaMeanMCA9 | 1 | 5 / 2 | 2814 | 212 / 195 / 19 |
| MarkovTopBetaTransportMCA9 | 5 | 34 / 11 | 2814 | 212 / 195 / 19 |
| MarkovTopCentralGroupsMCA9 | 11 | 70 / 20 | 2825 | 212 / 195 / 19 |
| MarkovTopEndGroupsMCA9 | 5 | 32 / 11 | 2814 | 212 / 195 / 19 |
| MarkovTopLinearResidualMCA9 | 7 | 45 / 14 | 2825 | 212 / 195 / 19 |
| MarkovTopLinearSourceMCA9 | 6 | 41 / 11 | 2825 | 212 / 195 / 19 |
| MarkovTopLowerGroupsMCA9 | 9 | 60 / 19 | 2825 | 212 / 195 / 19 |
| MarkovTopPTiltObstructionMCA9 | 7 | 42 / 13 | 2814 | 212 / 195 / 19 |
| MarkovTopRadialCompareMCA9 | 2 | 10 / 2 | 2814 | 212 / 195 / 19 |
| MarkovTopWeightedBetaMeanMCA9 | 4 | 26 / 8 | 2814 | 212 / 195 / 19 |

LinearSource, LinearResidual, LowerGroups and CentralGroups each import all 2,825 inherited modules. The other eight endpoints each import 2,814. Every endpoint imports the old 212 group, including the 195 subset, and the separate 19 accepted modules; 195 is not additive to 212. These are source-import closure counts, not counts of newly replayed inherited bodies. No graph cycle, unresolved project source or selected declaration-name collision was found.

Expected source/object identities derive independently from sealed worker-185 records and exact controller-before186 bindings. The saved inherited lookup order determines the first expected object; no current-file fallback invents an expected digest. M does not claim to freshly hash every inherited source/object in its initial static pass. V independently freshly hashed all 2,825 pairs (5,650 paths) from 2026-10-17T10:04:22.392077+00:00 through 2026-10-17T10:04:44.954635+00:00. All expected/controller-before/current source and object digests agree, and every row agrees with M’s independently derived map. The saved V output is pinned in M. This is V’s fresh byte-hashing interval, not an M observation window.

Nested historical fields labeled before183/current183/current184/current185 remain their original observations. Explicit current186 membership accompanies them. A false prior selection flag therefore does not imply current import absence, and no older window is extended.

## Historical boundaries

The old 212/195 and separate 19 are inherited identities without a fresh rebuild or replay in this worker. All current endpoints import WindowLC and Abel. WindowLC retains its historical empty-checker limitation and two printed closures, `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; `crossLC_balanced6d34` gains no fresh printed closure. Abel has its separate historical source/object and two-print boundary, `tail_weight_nonneg65c4` and `centered_weight_nonneg65c4`; `crossLC_center_weights65c4` is not newly printed. The Abel qualification is not an empty-checker assertion.

Worker 166’s host completed with return code 0 and a report. Its combined replay timed out; seven compiled/printed prefixes remain unreplayed. Only `MarkovCorrectionFactorMDB2` from that boundary is imported here, and the seven prefixes remain absent. Historical “166 timeout” shorthand refers to replay, not host outcome. Worker 171’s missing/malformed report and return code 1 remain unchanged. Worker 179’s compiled-only DetTest is absent. The worker-156 interruption and worker-157 recovery remain separate, as do inherited worker-180 RisingConvolution live-build overlap and FixedZeroClosed natural-subtraction qualifications. Worker 183 remains uncertain_effects with no receipt and no replay at its cutoff; later worker-184 recovery does not rewrite that history.

## Setup, finalizer and chronology

Setup freezes 22,293 initial entries, including its own setup source, with no exemptions. The initial suffix-based source/document/configuration scan excludes current evidence and does not include compiled objects. The 93-entry predecessor manifest and controller-before source/object map are separate records. The inherited lookup path prepends worker-185 evidence; the wrapper prepends current worker-186 evidence. Setup prints exact reconciliation and capability objects and the saved interruption object with only last_events omitted. The latter records worker 183’s 180-event interruption; its decision prose does not create a receipt or retrospective recovery.

The final finish wrapper fixes twelve module names and scans successful receipts matching current source hashes. Its glob is unsorted, but exactly one matching successful mathematical receipt exists per selected module here. Its raw forbidden-token expression also sees comments and is not a semantic proof checker. After joint replay and the Audit call it chooses the lexicographically latest axiom JSON. This review independently checks complete current name/source sets and the corresponding Audit source/build/output rather than trusting that filename choice alone.

The finalizer checks current selected source hashes, source-matching successful receipts, permitted saved axiom sets, an exact-source successful replay, all initial inputs, predecessor manifest identities, inherited bindings, root and contract serialization. Both completed calls 229 and 233 print objects exactly equal to saved last-verification, with 115 artifacts and 73 closures. An operational-note edit in event 231 lies between them; no separate first-manifest bytes are retained, and equal summaries do not establish equal manifest bytes. The finalizer alone does not require the checker digest, exact complete axiom source/name set or a successful Audit receipt/object; these are separate audit bindings. It does not stop subsequent file creation.

The manifest includes direct research basenames containing ca9709f2 or MCA9 plus recursive current evidence, excluding manifest and last-verification administration. It does not recurse into research/__pycache__. The initial exact inventories are 117 archive/controller artifacts, 115 manifest entries and 121 current-request paths. Four cache extras are separately retained; no inherited broad manifest-only supplement is asserted.

The host interval is 2026-10-17T09:27:10.370238+00:00 through 2026-10-17T09:56:11.362962+00:00, elapsed 1740.9927248954773 seconds against the exact 1,800-second request. The nominal deadline is 2026-10-17T09:57:10.370238+00:00; host finish precedes it by 59.00727605819702 seconds. The raw stream has 235 events and 72 started/completed commands. Setup completes in event 27; validation stages in 129 and 197; finalizers in 229 and 233; delivered report in 234; turn.completed in 235. Delivered JSON equals controller final.json and receipt.report. No separate report draft is retained.

The retained elapsed value exceeds direct finish-minus-start subtraction by 9.5367431640625e-07 seconds. The epoch-derived deadline margin and original recorded duration are kept distinct.

The 289-byte stderr record at 09:54:13.492087 UTC is an unsuccessful apply_patch expected-lines verification in the request’s next-step prose file. It is a text-edit failure, not an additional compiler/replay rejection. Current last-verification mtime is 2026-10-17T09:55:30.036255+00:00, its archive copy mtime 2026-10-17T09:56:11.318524+00:00, and controller final.json mtime 2026-10-17T09:55:44.076959+00:00. These filesystem observations are not independent proof-completion times.

The root SHA-256 is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Contract serialization remains distinct: compact ASCII `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, compact UTF-8 `f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4`, raw bytes `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. Event 39 prints the compact ASCII hash and agrees with the closed request/finalizer. No mutable successor contract was read.

## Program and companion scope

Seven mathematical Python files and five operational Python files are statically inventoried. The six nongenerator mathematical programs—experiment, stronger-beta probe, weighted-beta symbolic, Stein probe, Stein symbolic and Stein stress—have main guards; the weighted-mean generator does not. The generator imports the guarded symbolic definitions, so that import alone does not rerun its main scan. Validate is guarded; audit/setup/finish/finalize are operational unguarded scripts. AST inspection is not importing or executing any of them. Final script hashes alone do not authenticate all invocation-time versions; generated Lean snapshots and final source bindings are separately retained.

The generator was added in events 145–146, invoked in 147–148, then edited together with WeightedBetaMean in 155–156 after the failed build. Its final source explicitly calls run() after importing the guarded symbolic definitions. Event 148 therefore records an explicit generator-triggered symbolic rerun, whose final saved summary differs from event 138 only in seconds. The final generator hash does not authenticate its earlier invocation bytes. Event 148 labels 22,640 as lean_bytes, but the code uses len(body): the rejected generated snapshot has 22,640 characters and 23,912 UTF-8 bytes. Final source differs only by the recursion option already described.

Eleven literal event/result bindings were independently checked without mathematical evaluation: complete saved objects at 124, 169, 195 and 210; source104 omits only labels; sharper109 omits only first_negative_groups; weighted148 line1 omits its stored polynomial lists, and line2 binds stored term-list lengths plus source character length; Stein206 omits its polynomial serializations; square214 reports stored square-list lengths and failure entries; large-stress216 reports its saved cases label, failure-list length and first three records. Coefficients, signs, square identities, gap values and random sequences were not regenerated. These experiments remain finite evidence, separate from recorded Lean theorem validation.

The stable primary H/S/F companions agree with all twelve selected source hashes, imports and declaration sets (73 theorems/20 definitions), seven full saved finite objects, four further result/certificate pins, and exact inline command/output records. This is a consistency crossreview, not a new mathematical evaluation. For every actual numerator-3 path, source_top_path_linearMCA9 proves raw horizontal LC at row b+2−t for every natural start when t≥5 and 6t≤b+16, retaining zero positions and arbitrary tails. Its path adapter discharges the source-sector and generic-template guards. The strict-column result assumes 5≤t≤q+2, c≥3, c+1≤t and 6t≤b+3c+4. The three-point polygon condition additionally needs c+2≤t; the strict endpoint c=t−1 must not be described as a polygon-valid triple.

The new exact root equivalence is Conjecture63 iff ThreeFrontierMCA9 and OtherFourM9E2, both open. Earlier horizontal, vertical and diagonal regions remain; no new V/D raw region is claimed. The exact auxiliary TopLinearStrip retains 1≤i, 5≤r, i+r≤d+2 and d+1<i+4r and is equivalent to the prior tail residual. The lower beta groups and two terminal groups are proved under their stated guards. The remaining central-group sign condition is open and sufficient for the tail/source result; it is not asserted equivalent to raw/root LC because group cancellation is possible. The weighted certificate's 123 signed reduced literals and 176 positive shifted literals were retained and Lean-validated in the selected final source, with the stronger shift a≥2; the earlier a=x+1 shift has three saved negative literals. The formal auxiliary p-tilt failure uses weighted-sum argument r=0 while its positive actual terminal group uses r=49, and is not a source-family counterexample.

Primary finite-domain totals are index counts only: 1,792 rows, 34,402 coefficient positions, 671 linear rows/9,722 triples, 10,342 strict columns and 655,603 raw polygon triples. Saved zeros and random-path values were not regenerated. The stronger probe's min_sign=1 is initialized and never updated, so is not a computed minimum. Large Stein stress retains 120 entries but 105 distinct parameter tuples, with 28 failure entries/24 distinct failing tuples; its eight nonpositive-C count is saved output only. The candidate symbolic identities, square search and failed auxiliary bounds are not universal Lean proof or raw-root refutations. No expansion, sign calculation, random generation or experiment execution was performed by M.

An exploratory static graph diagnostic initially stopped before output on the already recorded Mathlib external boundary; it was corrected to honor retained external boundaries. Own augmentation initially stopped before evidence write because setup stdout omits interruption last_events. The corrected exact projection excludes only that field, and the failed helper bytes are retained. Neither correction executed project code or changed project sources. Evolving V note/evidence and main/sealer are excluded from M’s immutable static map to avoid circular finalization.

Before the final observation, the primary H/S/F companion metadata was corrected from stale worker/request labels to worker 186 and ca9709f2af7048a4813bd37d46ae4ce9. Source paths and substantive counts were already for worker 186. All twelve source/declaration identities, scope/count fields, saved finite objects and helper identity were rechecked; old/new H/S/F/helper pins and the correction time are retained explicitly. No project source or earlier observation window changed.

## Opaque preservation

All fourteen ordinary objects, twelve mathematics and two Audits, match retained archive/current counterparts. The four separately copied cache files are `stein_probe_ca9709f2.cpython-314.pyc`, `stronger_beta_probe_ca9709f2.cpython-314.pyc`, `validate_ca9709f2.cpython-314.pyc`, `weighted_beta_symbolic_ca9709f2.cpython-314.pyc`. Together they contain 34823 bytes. Initial discovery was 2026-10-17T09:58:07.026683+00:00; copying ran 2026-10-17T09:59:35.356184+00:00 through 2026-10-17T09:59:35.357264+00:00. Bundle SHA `7d9d5fed83feeeeedb65fecd7e4148c4dba71063eb7f7eedc0e9782482368441`; observation SHA `54312da427987a258bcbf1ba988dd01604193e17f2087562f4c1f7c61a33da43`. Both companion JSONs and all four copies are pinned. Copies preserve recorded selected metadata and bytes; no bytecode interpretation, creator/source-version attribution or validation upgrade follows. Original archive and older seals remain unchanged.

## Bounded final observation

The authorized pass freshly hashed 167 named inputs from 2026-10-17T10:12:20.751502+00:00 through 2026-10-17T10:12:20.917747+00:00. All were unchanged, with empty changed/missing lists. The 23 T-only pins were rechecked unchanged. Pending-mathematics/report absence is not applicable, with an empty path map, recorded separately at 2026-10-17T10:12:20.917754+00:00. Project reads closed at 2026-10-17T10:12:20.917755+00:00. This finite observation does not extend any older window or assert stability afterward. Remaining final main/sealer review uses audit files only.
