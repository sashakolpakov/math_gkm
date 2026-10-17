# Worker 185 retained replay-method and import audit

Closed request `dcb6402998ac4eed9feb37199e0f0cee`, suffix `MDCB`. This is an archive-first static review of retained sources, wrappers, receipts, snapshots, ordinary object hashes and explicit inherited identities. No project compiler, proof, checker, replay, finalizer, generator, experiment or mathematical/RNG computation was executed or imported by this review. Active worker 186 and later inputs were excluded. The completed host receipt has return code 0 and a report; its mathematical-resolution flag remains false. No full-conjecture or novelty claim follows from these checks.

The final selected set contains nine newly compiled modules, 51 theorem declarations and 25 definitions. All nine occur in the final joint replay and all 51 theorem names occur in the final axiom output. There is no compiled-but-unselected mathematics, pending mathematical draft, unbuilt mathematical draft, or new recovery in worker 185. The two Audit modules are operational validation products, separately counted.

| Selected module | Theorems | Definitions | Final source-matching successful receipt |
| --- | --- | --- | --- |
| MarkovTopBetaClearedMDCB | 4 | 0 | build-1792228543254512000.json |
| MarkovTopBetaMomentsMDCB | 5 | 1 | build-1792228455997703000.json |
| MarkovTopBetaScalarMDCB | 3 | 1 | build-1792228226802234000.json |
| MarkovTopLikelihoodMDCB | 7 | 3 | build-1792228305543808000.json |
| MarkovTopTail3MDCB | 2 | 0 | build-1792227631169474000.json |
| MarkovTopTail4MDCB | 2 | 0 | build-1792227631169462000.json |
| MarkovTopTailPolynomialMDCB | 8 | 9 | build-1792227895881093000.json |
| MarkovTopTailRepresentationMDCB | 11 | 8 | build-1792227568368516000.json |
| MarkovTopTailResidualMDCB | 9 | 3 | build-1792227790146761000.json |

All eleven successful build snapshots (nine mathematics and two Audits) are byte-identical to their corresponding retained final source. Fourteen compiler attempts comprise eleven successes and three return-code-1 failures; there is no compiler timeout or superseded successful mathematical source. Every rejected snapshot retains the same imports, declaration-name set and whitespace-normalized common declaration headers as the final source. Literal complete source diffs, rather than only parser classifications, are embedded in the evidence.

| Rejected receipt | Module | Final proof-only change |
| --- | --- | --- |
| 1792227835304197000 | TailPolynomial | Adds map_ofNat to four proof simp lists. |
| 1792228268267584000 | Likelihood | Replaces two convert/ring blocks by explicit calc equalities. |
| 1792228416967921000 | BetaMoments | Adds the natural-subtraction rewrite i+u-i=u. |

These rejected versions receive no success or replay credit. The retained success and final replay records bind the corrected final sources. The header comparison is lexical and the complete diffs delimit its interpretation; it is not a new type check.

## Recorded replay and axiom stages

| Completed event | Modules | Theorems / definitions | Guarded names | Replay record | Audit source |
| --- | --- | --- | --- | --- | --- |
| 146 | 8 | 47 / 25 | 72 | replay-1792228489072357000.json | MarkovAudit1792228501503179000MDCB |
| 157 | 9 | 51 / 25 | 76 | replay-1792228640022061000.json | MarkovAudit1792228651654033000MDCB |

| Stage | Replay timestamp estimate UTC | Replay seconds | Audit compiler start UTC | Audit finish estimate UTC | Axiom JSON write timestamp UTC |
| --- | --- | --- | --- | --- | --- |
| 1 | 2026-10-17T09:14:49.072357+00:00 | 12.397856041963678 | 2026-10-17T09:15:01.503291+00:00 | 2026-10-17T09:15:08.786879+00:00 | 2026-10-17T09:15:08.790006+00:00 |
| 2 | 2026-10-17T09:17:20.022061+00:00 | 11.589157874986995 | 2026-10-17T09:17:31.654130+00:00 | 2026-10-17T09:17:38.353252+00:00 | 2026-10-17T09:17:38.356456+00:00 |

Stage one validates eight modules and 47 theorems; stage two adds BetaCleared and validates all nine modules and 51 theorems. The 47 plus 51 print rows total 98 rows and 51 distinct final theorem names. Every one of the 98 rows, including all 51 final rows, reports exactly `propext`, `Classical.choice` and `Quot.sound`. Neither an empty axiom set nor a narrower partition is claimed. Both stage source maps agree with the retained final source bytes. The final validation selects the second-stage replay and axiom source set.

The initial finish wrapper was introduced in events 143–144 and updated in 151–152. Its initial source file and the overwritten initial validation JSON were not separately snapshotted. Stage-one scope instead rests on the immutable replay receipt, Audit source/build snapshot, axiom JSON and literal completed-command output. The final wrapper hash must not be assigned retrospectively to the first invocation. The axiom JSON filename timestamp denotes its later write, not the Audit compiler start. Compiler starts encoded in receipt names and end times formed by adding durations remain estimates, not independent process telemetry.

## Checker isolation and binary trust

The retained `ReplayIsolatedMDCB.lean` has SHA-256 `9e47b8e9c040e3dd282128b79c73f6a5e62896f9ded442549b48d27d0a312ec3`. Its reviewed body agrees with the predecessor checker apart from changing the dual `M55C`/`MEB6` guard to the single `MDCB` suffix. The operational function retains the historical spelling `replayIsolatedM55C`; that spelling does not determine the guarded target suffix. The driver collects constants from the selected compiled module data, gathers the nonselected direct imports, constructs and finalizes their imported environment, then replays the selected constants.

The additional guard applies to every collected name whose namespace begins `MathGKM.Markov.` and whose name ends `MDCB`: it checks absence from the preimported environment and rejects unsafe or partial declarations. It is not restricted to the wrapper’s explicit lexical theorem/definition list. The observed guarded totals are 72 and 76. Here the independently parsed final declarations match the wrapper’s anchored theorem/definition enumeration. That agreement does not establish that every generated or private constant has this spelling; differently named generated/private declarations remain subject to the driver’s ordinary loading/replay behavior. Optional server/private module parts and the operational unsafe loader are part of the retained implementation boundary.

Four written direct inherited imports are `MarkovPolynomialCertificateMBEC`, `MarkovTopFrontierMEB6`, `MarkovTopTailKernelMEB6` and `MarkovUpperDifferenceM4F4`. The saved replay reports five direct imports because implicit `Init` is also present. This is consistent with a full transitive inherited base of 2,817 modules. Importing those ordinary compiled objects is not a fresh replay of their bodies. The Lean executable, kernel, library objects and existing project objects remain trusted dependencies; no whole-source or whole-campaign rebuild occurred in this audit.

Validate and audit wrappers match the retained predecessor versions after the specifically checked request/suffix retagging. The compiler wrapper hashes and snapshots a source, then invokes compilation using its live path. These operations are not atomic. A compiler receipt contains a source digest but no authenticated output-object digest captured at compiler completion. Matching archived/current objects, finalizer object hashes and matching replay source maps provide later identity observations; they do not manufacture an absent compiler-completion object attestation.

The two Tail3/Tail4 build estimates overlap each other; their modules differ. No same-module build overlap, completed source-edit/build overlap or final-source modification time inside its own build estimate was found. Tail3 and Tail4 use 180-second limits, the other mathematical attempts use 120 seconds, and Audit’s inner compiler uses 100 seconds. The final finish wrapper uses a 240-second joint-replay limit and a 120-second outer Audit limit. These observations retain the live-source limitation just described.

## Independent inherited graph and endpoints

The independently reconstructed graph contains 2,826 modules: nine selected worker-185 modules plus 2,817 inherited modules. The inherited set is all 2,797 predecessor inherited entries plus 20 of worker 184’s 21 selected entries. `MarkovTopObstructionsM55C` is the sole excluded predecessor selected module. Thus worker 185 imports nine of the ten worker-183 modules later recovered by worker 184. The ten-module/54-closure recovery remains a worker-184 event; worker 185 performs no new recovery and does not alter worker 183’s uncertain host status.

| Endpoint | Selected ancestors including endpoint | Ancestor theorems / definitions | Inherited modules | Old 212 / included 195 / separate 19 |
| --- | --- | --- | --- | --- |
| MarkovTopBetaClearedMDCB | 4 | 27 / 12 | 2809 | 212 / 195 / 19 |
| MarkovTopBetaMomentsMDCB | 3 | 23 / 12 | 2809 | 212 / 195 / 19 |
| MarkovTopBetaScalarMDCB | 2 | 14 / 9 | 2809 | 212 / 195 / 19 |
| MarkovTopLikelihoodMDCB | 2 | 18 / 11 | 2809 | 212 / 195 / 19 |
| MarkovTopTail3MDCB | 2 | 13 / 8 | 2809 | 212 / 195 / 19 |
| MarkovTopTail4MDCB | 2 | 13 / 8 | 2809 | 212 / 195 / 19 |
| MarkovTopTailPolynomialMDCB | 5 | 32 / 20 | 2817 | 212 / 195 / 19 |
| MarkovTopTailRepresentationMDCB | 1 | 11 / 8 | 2809 | 212 / 195 / 19 |
| MarkovTopTailResidualMDCB | 4 | 24 / 11 | 2817 | 212 / 195 / 19 |

Endpoint counts are transitive source-import closures, not counts of fresh replayed inherited bodies. TailResidual and TailPolynomial each import the full 2,817 inherited modules; the other seven endpoints each import 2,809. Every endpoint imports the historical 212 group, including its 195 subset, and the separate 19 accepted modules. The 195 is not an additional group to add to 212. No graph cycle, unresolved project-source dependency or selected declaration-name collision was found.

The expected source/object pair map was derived independently from sealed worker-184 identities and the exact controller-before185 map. Ordered object lookup candidates and their first matching expected object are retained; a current-file fallback was not used to invent expected identity. M’s explicit static input map hashes selected/current artifacts and audit companions, not every inherited source/object anew. Independently, V freshly hashed all 2,817 pairs (5,634 exact source/object paths) at 09:34:58.977131–09:35:21.608971 UTC. All sealed expected, controller-before and current identities agree; all 2,817 rows also exactly match M’s independently derived pair map. That interval is V’s fresh byte-hashing observation, not an M observation window. Its saved output is pinned in M evidence, and V’s later bounded final pass covers its full named-input map.

Historical nested fields labeled before183/current183/current184 are preserved as those prior observations. Explicit current185 flags and the current graph state present membership separately, so a false historical selection flag is not current import absence. No earlier audit window is silently extended.

## Historical validation limits

The old 212/195 group and separate 19 remain inherited object/source identities, not freshly rebuilt or replayed bodies in worker 185. Every current endpoint imports the named WindowLC and Abel modules. WindowLC retains its historical empty-checker limitation and only the two printed closures `runInterval_cross6d34` and `runInterval_smoothed_lc6d34`; `crossLC_balanced6d34` gains no newly printed closure here. Abel has its distinct historical source/object and two-print boundary, `tail_weight_nonneg65c4` and `centered_weight_nonneg65c4`; `crossLC_center_weights65c4` is not newly printed. These are separate qualifications, not a shared empty-checker assertion.

Worker 166’s host completed with return code 0 and a report. Its large combined replay timed out, leaving seven compiled/printed prefixes unreplayed. Only `MarkovCorrectionFactorMDB2` from the relevant boundary is imported here; the seven prefixes are absent and receive no recovery credit. Historical shorthand referring to a “166 timeout” denotes that replay, not the host outcome. Worker 171’s missing/malformed report and return code 1 remain unchanged. Worker 179’s compiled-only DetTest is outside this graph. Earlier worker-156 interruption and later worker-157 recovery remain distinct. The worker-180 RisingConvolution live-build overlap and FixedZeroClosed natural-subtraction qualification remain inherited limits. The original 183 uncertain-effects interruption, absent receipt and absent replay at its recorded cutoff are not rewritten by the later worker-184 recovery.

## Setup, finalizer and recorded chronology

The setup freezes 22,209 initial entries, including its own setup source and with no exemptions. The initial scan covers the selected source/document/configuration suffixes under the designated roots, excludes the current evidence directory and does not include compiled objects. The 139-entry predecessor manifest and controller-before source/object map are separately retained. The setup prepends worker-184 evidence to the inherited lookup path, while the compiler wrapper prepends worker-185 evidence. The saved worker-183 interruption reconciliation uses its 180-event record and preserves that historical outcome. It does not supply a receipt or backward validation credit.

The final finish wrapper has a fixed nine-module list and scans retained successful build receipts with matching current source hashes. Although that scan uses unsorted glob order, there is exactly one matching successful mathematical receipt per module in this instance. Its raw forbidden-token regular expression also sees comments; it is not a semantic proof checker. It invokes the joint replay and axiom audit, then selects the lexicographically latest axiom JSON. The exact current name sets, source maps, final Audit source/build and print rows were independently compared here rather than inferred from that filename choice alone.

The finalizer checks current selected source hashes, source-matching successful build receipts, permitted saved axiom sets, an exact-source successful replay, initial inputs, predecessor manifest identities, inherited bindings, root and contract serialization. It writes the 93-entry manifest and last-verification record. Its echoed counts agree with validation, and its preservation subobject agrees with last-verification; whole outer-object equality is not asserted. It does not independently require the checker digest, an exact complete axiom source/name set, or the successful Audit receipt/object; those are separate bindings in this review. The finalizer also does not enforce a stop on later file creation.

The manifest scans direct research basenames containing the request tag or suffix and recursively scans current evidence, excluding its manifest and last-verification administrative records. It does not recurse into the research cache directory. Accordingly the retained scopes are 95 archive/controller artifacts, 93 manifest entries and 98 exact current-request paths; the three cache extras are separately preserved below. No inherited broad manifest-only bundle is asserted for this worker.

The host interval is 08:52:10.768975–09:19:58.663288 UTC, elapsed 1,667.8943130970001 seconds against the exact 1,800-second request. The nominal deadline is 09:22:10.768975 UTC; host finish precedes it by 132.10568690299988 seconds. The event stream contains 169 events and 54 started/completed commands. A setup heredoc failed in completed event 27 and the later setup completed in event 33. The finalizer completed in event 165, verification-only work in 167, the delivered report in 168, and turn.completed in 169. The delivered report equals both controller final.json and receipt.report. No separate report-draft file is retained.

The 271-byte stderr record at 09:17:21.108627 UTC reports an unsuccessful apply_patch expected-line match in the request’s beta-proof prose file. It is a text-edit failure, not an additional compiler/replay failure. Current last-verification mtime was 09:18:56.996756 UTC; its archive copy mtime was 09:19:58.590730 UTC, and controller final.json mtime was 09:19:32.000476 UTC. These are retained filesystem observations, not independent proof-completion timestamps.

The root digest is `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The contract has distinct saved serialization identities: compact ASCII `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc`, compact UTF-8 `f1129103f35b0b3335d6857c85844198d2b3e73c794953955274f416cd79a2b4`, and raw bytes `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068`. Their distinction is preserved; request/event comparison does not consult an active successor contract.

## Experiments, generators and mathematical scope crossreview

Seven mathematical Python files and five operational Python files are statically inventoried. The beta comparison, tail generator, source experiment, antidiagonal probe, stress helper, parameter probe and validate wrapper have main guards. The beta-scalar generator and audit/finalize/finish/setup scripts do not. This is an AST observation, not import or execution of any program. In particular the stress experiment ran as inline command event 96; the later reproduction helper was added in event 163. Its final hash cannot authenticate the earlier inline program bytes. The weight experiment is also an inline command, event 44.

Literal completed-command outputs were compared with saved JSON: complete objects for events 40, 44 and 105; the saved cases projection for 57; the printed negative-group projection for 70, using only saved negative-count labels; source output excluding labels for 85; one JSON object per case for 96; and the literal term-count projection for 109. Seven full saved finite result objects agree with the primary companion records. The three certificate serializations contain 117, 176 and 21 literal terms as recorded. No polynomial coefficient, gap, probability, random draw or mathematical value was regenerated by M. Finite examples and a successful script exit are not universal proof.

The primary H/S/F source/declaration bindings agree with the nine selected sources and the 51/25 count. At actual numerator 3, both denominator residues and all natural starts remain represented. The new strict tail starts are t−3 for 6≤t≤q+2 and t−4 for 7≤t≤q+2, at row j=b+2−t. The generic template uses 2t≤n for these individual edges. Whole-depth results cover 5≤t≤8 with t≤q+2, including zero positions and tails; this particular theorem is not paraphrased as 0≤t≤8. The current exact root equivalence is Conjecture63 iff ThreeFrontierMDCB and OtherFourM9E2, with both predicates open and prior vertical/diagonal regions retained.

The exact auxiliary tail residual retains 1≤i, 5≤r and i+r≤d+2. A coefficient-positivity family is an unproved sufficient condition, not a proved root clause or an equivalent replacement asserted by the audit. The beta scalar is positive only under its stated hypotheses a≥1, m≥2 and H≥3a+2m+5; the formal tail-parameter adapter assumes i+4r≤d+1 and 2≤m≤2r and concludes that scalar positivity. Universal cleared and normalized beta-moment formulas include zero and oversized orders, with the proved positive mass/denominator conditions. Likelihood inward comparison is a local formal ingredient. The written expectation/covariance/symmetrized-gap/source attachment and proposed uniform source cutoff are not completed by these checks. Inherited depth-dependent eventual bounds are not turned into a uniform depth bound. The saved negative antidiagonal example at r=11, m=3, i=d=0 is outside the actual source-sector guard, not a raw-conjecture counterexample.

Full main, primary source-scope and finite companions were crossreviewed as audit files. Their stable pins are embedded in the evidence. Evolving main/sealer and V note/evidence are excluded from M’s immutable static input map to avoid a circular finalization dependency. The two own static analysis helpers completed their prepared checks without a failed output-producing run. The latest primary H pin already binds its corrected helper digest and the nine-of-ten imported recovery wording; historical recovery remains ten in worker 184.

## Opaque retention and ordinary objects

All eleven ordinary objects (nine mathematics and two Audits) are retained in the completed archive and match their explicit current counterparts. V initially observed eleven optional controller content-addressed cache paths absent. These optional cache absences do not erase the archived objects or imply a failed proof. Their final availability is a separate V observation, not a pending-mathematics absence assertion or an M claim of continued absence.

Three exact unindexed/unarchived cache files—generate_tail, top_parameter_probe and validate with the request tag and cpython-314 suffix—were separately copied as opaque bytes. They total 16,543 bytes; the copy window is 09:22:08.495765–09:22:08.497037 UTC. The bundle JSON SHA is `8944c5a395aa76c3640d4c1dfebd8756254ec4df13f25a036e37a715659dfeeb`; observation JSON SHA is `736fe6256921166484e96aaa481bd07ab8ccf31ef13b5ca071f629fbdae1fdb4`. Both companion JSONs and all three copies are pinned in M. Their selected metadata and byte identity are recorded; no bytecode interpretation, source-version inference, creator attribution or validation upgrade is made. The original archive remains unchanged. Earlier supplemental bundles stay in their earlier seals.

## Bounded final observation

The authorized named-input pass freshly hashed 132 entries from 2026-10-17T09:44:56.490418+00:00 through 2026-10-17T09:44:56.577263+00:00. All were unchanged; changed and missing lists are empty. The 17 T-only input pins were rechecked unchanged. Object/report absence is not applicable, with an empty path map, recorded separately at 2026-10-17T09:44:56.577272+00:00. Project reads closed at 2026-10-17T09:44:56.577273+00:00. This finite observation does not extend any older window or assert continued stability after it. Subsequent main/sealer concurrence reads audit files only.
