# Worker 000166 retained replay method and import audit

Request `db238071732b4d94a95826082e34e37e`. This is an archive-first static review of closed worker166. No project compiler, Lean proof, checker, replay, finalizer, generator, experiment or mathematical-value computation was executed. Active167 and all later workers, separate documentation work and unrelated project paths were excluded. Only exact named closed/current/inherited counterparts were read; audit writes stay under `/private/tmp/math_gkm_godel_20261013`. Earlier seals and observation windows remain unchanged.

## Coverage conclusion

The retained record supports **twelve compiled and axiom-printed mathematical modules, containing 33 theorems and 13 definitions**, but successful isolated replay of **only five core modules, containing 26 theorems and six definitions**. Seven selected product-prefix modules, with seven theorems and seven definitions, compiled and printed permitted axioms but did not successfully replay. The earlier combined replay timed out on nine modules; it was not a replay of all twelve. Its lack of output is not a successful partial traversal. The worker explicitly records the seven unreplayed modules and keeps completion null.

| Source status | Modules | Theorems | Definitions | Retained coverage |
| --- | ---: | ---: | ---: | --- |
| selected replayed | 5 | 26 | 6 | Successful build, isolated union replay, explicit axiom prints |
| selected not replayed | 7 | 7 | 7 | Successful build and explicit axiom prints; no successful replay |
| timeout only | 7 | 7 | 7 | Final source has only a compiler timeout history |
| unbuilt | 45 | 77 | 39 | No retained compiler attempt |

These 64 mathematical sources total 117 theorems and 59 definitions. There are separately two operational Lean sources and one generated Audit source. `KernelRflMDB2` successfully compiles an anonymous example and registers a tactic; `KernelRflRejectMDB2` is an intentionally failed anonymous negative test. Neither contributes a named mathematical theorem or explicit axiom print. The retained 14 ordinary objects comprise twelve selected mathematics objects, KernelRfl and Audit. There is no additional compiled-only named mathematics module.

There are 27 compiler receipts: fourteen successes, four return-code-one failures and nine timeouts. Thus thirteen unsuccessful compiler attempts are distinct from the additional replay timeout. Timeout receipts omit the raw compiler `returncode` field; the audit normalizes that absence to null. The wrapper exits one for a timeout. All successful snapshots match their retained final source byte for byte, including KernelRfl and Audit; no superseded successful mathematical version is credited.

## Exact selected source and object associations

| Module | Theorems / definitions | Successful build receipt | Successful replay |
| --- | ---: | --- | --- |
| `MarkovCorrectionFactorMDB2` | 6 / 4 | `build-1792197197691826000.json` | yes |
| `MarkovCorrectionSupportMDB2` | 9 / 1 | `build-1792198048934982000.json` | yes |
| `MarkovDenseTransportMDB2` | 2 / 0 | `build-1792197062549278000.json` | yes |
| `MarkovDirect2S15MDB2` | 1 / 1 | `build-1792196960621862000.json` | no |
| `MarkovDirect2S16MDB2` | 1 / 1 | `build-1792197209396397000.json` | no |
| `MarkovPackedConvolutionMDB2` | 6 / 1 | `build-1792197719227104000.json` | yes |
| `MarkovPackedExamplesMDB2` | 3 / 0 | `build-1792197812449855000.json` | yes |
| `MarkovProduct0S19MDB2` | 1 / 1 | `build-1792196618668488000.json` | no |
| `MarkovProduct0S20MDB2` | 1 / 1 | `build-1792196750561306000.json` | no |
| `MarkovProduct1S19MDB2` | 1 / 1 | `build-1792196639818808000.json` | no |
| `MarkovProduct1S20MDB2` | 1 / 1 | `build-1792196727502933000.json` | no |
| `MarkovSwap3S15MDB2` | 1 / 1 | `build-1792197189754271000.json` | no |

The evidence records each selected archive/current source and ordinary-object hash, controller-after pins, exact successful receipt and archived source snapshot. All agree. The worker validation now has no `compiled_sha256` object table: these object associations come from the independent archive/current/controller audit. Compiler receipts themselves do not hash their produced object. A successful receipt plus preserved matching bytes is a retained association, not fresh authentication of binary production.

All accepted local dependencies have an earlier successful receipt matching the final dependency source. The current graph has no source-import cycle. No same-module build intervals overlap, and no observed final current source mtime lies within its own retained build interval. Those observations do not prove atomic source reads, exclude earlier writes that later restored the same bytes, or prove that a snapshot was the compiler’s live-path input. Source hashes and build snapshots precede the compiler invocation; the compiler reads the named live source. Replay source hashes precede invocation, checker hashes are sampled afterward, and Audit source maps are sampled after compilation.

## Replay stages and isolation

The driver `ReplayIsolatedMDB2.lean` is exactly worker165’s checker with the suffix retagged. Its SHA256 is `7677dfca91bea4eaa17e04eac9934cc22f27ea4934984bc7be8d42d78a49a2b5`. Removing the added name/safety guard and normalizing comments/whitespace leaves the previously retained worker110 replay body. This static equality is not execution of either checker.

The driver resolves each target’s `.olean`, conditionally loads server/private parts if present, collects the union of target constants, and imports only direct module imports that are not target module names. It imports that base, checks selected mathematical names against it, then runs `env.replay` on the union and joins the Lean task. The ordinary object bindings and saved search-path order are checked; optional module parts and the complete external compiled dependency tree are not independently authenticated. The imported environment’s definitions and proof bodies remain compiled-import trust.

The guard applies to names beginning `MathGKM.Markov.` and ending `MDB2`; the duplicated suffix disjunction is redundant. It rejects names already present in the base and unsafe/partial constant information for that subset. It is not a guard over every generated, private, operational or elaborator-registration constant. The whole collected union still follows ordinary Lean replay handling. No pending module or imported inherited theorem is promoted to selected replay coverage by declaration-name similarity.

The first receipt, `replay-1792197734100336000.json`, targets seven product-prefix modules plus DenseTransport and CorrectionFactor. Its bound is 300 seconds; recorded duration is 301.1161153750145 seconds. It records timeout with stdout/stderr strings `None`, no return code, no isolation count and no success marker. Static source resolution gives nine explicit direct imports plus implicit Init, ten total; that is an expected source-derived boundary, not emitted runtime output. The wrapper lists nineteen names, while the complete source inventory has 26 declarations: seven `noncomputable def` names are omitted by its line-leading theorem/def/abbrev regex. The driver’s suffix condition would include those names if reached, but this failed receipt demonstrates no completed guard pass. Its base includes current operational KernelRflMDB2.

The successful receipt, `replay-1792198156409403000.json`, targets DenseTransport, CorrectionFactor, PackedConvolution, CorrectionSupport and PackedExamples. Bound 90 seconds; recorded duration 12.349011707992759 seconds. It prints five collected modules, seven inherited imports, 32 guarded mathematical constants and `replay union passed`, with return code zero. All 32 explicit declarations match both the complete source inventory and wrapper names. The selected five are absent from their base, their explicit names are unique and disjoint from the base’s parsed names, and their source map and checker hash match exactly.

The successful core direct imports are `MarkovCross774`, `MarkovDenseCertificateMC9F`, `MarkovFirstCorrectionPolynomialMAE9`, `MarkovPositiveRowsMDAB`, `MarkovRowTransferMFFD` and `Mathlib.Data.Nat.Digits.Lemmas`, plus implicit `Init`: **seven total**, not six. KernelRfl is absent from this successful core base. It belongs to the timed-out nine-module base and the Direct/Swap source closures.

## Explicit axiom prints and operational elaboration

The single Audit module `MarkovAudit1792198116956325000MDB2` is compiled by `build-1792198116956469000.json` and recorded in `axioms-1792198145422283000.json`. Its twelve imports and 33 exact theorem print commands match the selected final sources. Raw compiler output independently yields the same names and axiom lists: 24 use `propext, Classical.choice, Quot.sound`; five use `propext, Quot.sound`; four use `propext`. None uses a forbidden axiom. Within the five replayed modules, the partition is 24 / 1 / 1; within the seven unreplayed modules it is 0 / 4 / 3. Definitions and anonymous operational examples are not invented extra theorem prints.

`KernelRflMDB2` imports Lean.Elab.Tactic.Decide and defines the `kernel_rfl_mdb2` tactic elaborator. Its source proposes an Eq.refl term from the equality’s right-hand side and passes that candidate with the expected type through `mkAuxLemma`, disabling asynchronous elaboration for that step. The one successful anonymous example and the deliberately false equality’s retained kernel type-mismatch diagnostic are bound to their snapshots and receipts. The failed negative example is not a source counterexample, and one negative test is not a general proof of tactic correctness. The operational module is not explicitly selected, axiom-printed or successfully replayed here. Imported tactic registration and inherited `dense_data%` elaboration retain their ordinary loader and compiled-body limits.

## Version and timeout boundaries

The seven timeout-only mathematical modules are `MarkovProduct0S21MDB2`, `MarkovProduct1S21MDB2`, `MarkovProduct2S15MDB2`, `MarkovProduct3S15MDB2`, `MarkovDirect2S17MDB2`, `MarkovSwap0S21MDB2` and `MarkovSwap3S16MDB2`. Their retained timeout snapshots equal their final sources. DenseTransport’s earlier 90-second timeout also equals its later successful source. CorrectionSupport’s later 120-second timeout equals its final successful 80-second source. A timeout does not prove falsity or certify an object; no ordinary object is retained for the seven timeout-only modules.

CorrectionFactor’s return-code-one snapshot has the same six theorem/four definition inventory, imports and normalized headers as its final success; two proof blocks differ, `correction_exponentMDB2` and `source_correction_factorMDB2`. PackedConvolution’s failed snapshot retains its six theorem/one definition inventory and imports, but the `nat_dense_evalMDB2` header changes from `(Nat.ofDigits B a : ℚ)` to `((Nat.ofDigits B a : ℕ) : ℚ)`. Three common blocks differ: that declaration, `convolution_digit_boundMDB2` and `packed_convolution_sum_soundMDB2`. This cast-syntax difference is preserved rather than classified as proof-only or silently equated by elaboration. CorrectionSupport’s first failed version differs in the `correction_residual_succ_coeffMDB2` proof block, with unchanged headers and nine theorem/one definition inventory. Exact diagnostics and source hashes are retained in the evidence; no attempted proof is repaired by the audit.

All 64 mathematical source declaration names are distinct in this current inventory; there are no selected/excluded name collisions. The complete gap, four product evaluation layers and source/root consequence drafts are unbuilt. Their source text and conditional statements are not accepted outputs. Exact ordinary-object absences cover 52 mathematical drafts and the rejected operational negative test: 106 archive/current paths. These are bounded retained-absence observations, not claims that no transient object ever existed.

Compiler bounds are invocation-specific: direct calls use 30 seconds for the negative test, 60 for KernelRfl, 80 for final Support, 90 for DenseTransport, 120 for CorrectionFactor/PackedConvolution/earlier Support/PackedExamples, 150 for the first Product0S19 invocation, and 300 for Direct2S15 and Swap0S21. Product and dependent-chain drivers use 180 seconds. Audit was changed from inherited 180 to 100 seconds at events215–216 before its invocation. Replay bounds are 300 then 90 seconds. The source/profile output and receipt durations, rather than a single default bound, determine these associations.

## Inherited imports and endpoint split

The pair map contains **2,632 exact inherited source/object identities**: 2,602 inherited bindings from sealed165 plus thirty accepted worker165 modules. Worker165’s CorrectionObstruction is the only one of its 31 accepted modules outside this graph; its two compiled-only and all pending sources remain outside. Source hashes match controller-before166 pins; old object hashes match those before pins and established sealed identities. Current-only fallback was not used. The independent validation pass checked all 2,632 current pairs from `2026-10-17T00:54:27.675748+00:00` through `00:55:09.332902+00:00`, with no mismatch.

The full local graph has 2,699 nodes: 2,632 old modules plus 64 current mathematical sources, two current operational sources and Audit. The twelve selected source closures contain 2,645 nodes. Their nonselected base has 2,633 nodes because it includes **current KernelRfl plus 2,632 inherited modules**. The successful five-module union has 2,532 inherited local base nodes and no current non-target module. The saved ordered LEAN_PATH candidates select the pair-map object first for every inherited module. This is a static before-inventory/path-order check, not runtime filesystem instrumentation or fresh object production.

| Selected endpoint | Local nodes | Current nodes, including operational imports | Inherited nodes | Old 212 / subset 195 / accepted 19 | Window / Abel |
| --- | ---: | ---: | ---: | --- | --- |
| `MarkovCorrectionFactorMDB2` | 2,532 | 1 | 2,531 | 212 / 195 / 19 | yes / yes |
| `MarkovCorrectionSupportMDB2` | 2,533 | 2 | 2,531 | 212 / 195 / 19 | yes / yes |
| `MarkovDenseTransportMDB2` | 2 | 1 | 1 | 0 / 0 / 0 | no / no |
| `MarkovDirect2S15MDB2` | 2,611 | 2 | 2,609 | 212 / 195 / 19 | yes / yes |
| `MarkovDirect2S16MDB2` | 2,612 | 3 | 2,609 | 212 / 195 / 19 | yes / yes |
| `MarkovPackedConvolutionMDB2` | 2 | 1 | 1 | 0 / 0 / 0 | no / no |
| `MarkovPackedExamplesMDB2` | 3 | 2 | 1 | 0 / 0 / 0 | no / no |
| `MarkovProduct0S19MDB2` | 2,611 | 1 | 2,610 | 212 / 195 / 19 | yes / yes |
| `MarkovProduct0S20MDB2` | 2,612 | 2 | 2,610 | 212 / 195 / 19 | yes / yes |
| `MarkovProduct1S19MDB2` | 2,611 | 1 | 2,610 | 212 / 195 / 19 | yes / yes |
| `MarkovProduct1S20MDB2` | 2,612 | 2 | 2,610 | 212 / 195 / 19 | yes / yes |
| `MarkovSwap3S15MDB2` | 2,611 | 2 | 2,609 | 212 / 195 / 19 | yes / yes |

DenseTransport and PackedConvolution each import only DenseCertificateMC9F as their inherited project module. PackedExamples adds current PackedConvolution. These three endpoints avoid old212/195/19 and Window/Abel. Both correction endpoints and all seven selected prefix endpoints import all 212 historical compiled-but-unreplayed modules, their 195-module subset, and the separate nineteen historically accepted modules. The backlog remains globally unrecovered; current source-level replay does not reopen imported bodies.

The current graph preserves the twenty-three worker134 recoveries with their worker135 provenance; this is separate from the sixteen originally accepted worker134 modules. Failed HighCone2GapM81F remains excluded while its accepted MF25 replacement is imported. Four accepted worker135 strip modules are imported; FallingGapMF25 and SourceFallingMF25 remain outside. Four accepted worker136 modules are imported; InteriorWitnessMF1E remains outside. Corrected final worker145 Scalar and final worker146/151 dependencies retain their historical source/object associations; superseded successful source versions receive no credit.

Seven worker156 modules are imported: LowDifference, LowForce, LowLC, LowSolutions, LowSource, LowerShape and LowerUniform. Their recovery provenance remains worker157’s twelve-module replay and 44 printed closures. Original worker156 remains TIMEOUT/return0/null report, twelve compiled modules, one successful seven-module union and zero printed closures. No new worker166 recovery is claimed. All eight worker157 modules, eleven worker158 modules, eight worker159 modules, five worker160 modules, twenty-four worker161 modules, eight worker162 modules, twelve worker163 modules and ten accepted worker164 modules appear in the exact graph. The evidence lists names; counts are not broad whole-worker acceptance claims.

The eight imported worker159 modules are FiveDirections, FiveForce, FivePolynomial, FiveShape, FiveSource, Residual, RowCoeff and RowParameter, with suffix M468. The five worker160 modules are DiagonalRows, MinimalRatio, MinimalShape, PositiveRows and PositiveSource. Worker161 LiftObstruction, worker162 TruncationObstruction and worker163 RatioObstruction remain outside. Worker160 KernelLimit, worker161 unbuilt Column0, worker163 PairCleared, worker164 compile-only halves/timeouts/unbuilt pair candidates, and worker165 pending product/gap/source candidates receive no import or recovery credit. Historical absence windows are not extended.

WindowLC6d34 retains exact source `8b015db25a614375ce03c0d983b31d0aac7ed9bdf9a828184cd03a35771415cb` and object `cfbb826a7802dd327aace2004d150aa0f4c56b6211222d3f575d597e0b898237`. Its old successful compiler receipt has no object digest; the old checker reports empty stdout; its two historical printed names are runInterval_cross6d34 and runInterval_smoothed_lc6d34. The distinct crossLC_balanced6d34 is not an additional old print. Abel65c4 retains source `c2b2cc87d1da49be68a3e298daafdbeca19858151165a23bab4267a357e9080b` and object `a800fd6ae098cc7020e6ddfc5b10f8eb8703bb1e2395da18cc78d0fb03fb1e89`. Its two failed snapshots remain separate from its later success; its successful receipt has no object digest and old checker stdout is empty. Only tail_weight_nonneg65c4 and centered_weight_nonneg65c4 were separately printed, not crossLC_center_weights65c4. These current imports establish no new inherited-body compilation or replay.

## Wrapper, finalizer and reconciliation changes

The validation wrapper is an exact worker165 retag. It uses pinned Lean 4.32.2, compiler `-j 1`, replay stack option `-s 131072`, saved inherited search paths and bounded foreground subprocesses. Audit differs only by its 100-second bound. Finalization is materially rewritten: it chooses the last matching receipt in unsorted glob iteration rather than lexicographic maximum; each actual selected source has exactly one matching successful receipt, so this change introduces no ambiguity in the observed associations.

Finalizer checks selected sources are covered by the union of axiom-report source maps and permits only the standard axiom sets. It no longer asserts the exact theorem-name set, removes the forbidden source-token scan, drops compiled_sha256, and summarizes successful replay module by module from return-code-zero receipts matching selected hashes. It requires neither a full selected union nor the replay success text. Its actual five-module receipt and every final printed theorem are independently bound by this audit. The finalizer does not itself authenticate the checker, raw Audit execution or compiled object bytes.

The finalizer still asserts all 7,015 initial hashes and all 298 predecessor manifest hashes unchanged. Own setup is included; there is no exclusion. Controller-before may omit cache paths that the initial snapshot includes. Explicit literal root/contract expected-hash assertions are removed; those paths remain in the preserved initial inventory and their actual saved hashes match the fixed pins. The final manifest mismatch list is computed but no longer asserted empty by finalizer; it is independently empty in the retained output. There is no final-check.json or authored draft report artifact in this run.

Two finalizer invocations complete at events230 and236. The same selected validation is serialized both times. Between them events231–232 inspect the operational wording and events233–234 update finalizer source. The final output replaces the tentative foreground wording with completed-foreground prose, and the manifest hash changes while its 172 indexed-path count remains constant. The first full script bytes are not separately snapshotted, so the exact earlier script is not reconstructed solely from that line. Final output236 equals saved validation/last-verification. Delivered event237 equals final.json and the controller report; event238 is turn.completed. Foreground-complete wording is report prose, not independent process-table authentication.

Setup embeds the last three closed165 and interrupted156 events. Worker165’s exact event hash and last three events match the named old log and its sealed validation pin. Worker156’s event hash and last three of the previously preserved five events match sealed165 data; that old log is not reread. This preserves the original interrupted status and later recovery separately. The previously retained two worker165 opaque caches match initial166 hashes; controller-before166 omits them. Their supplemental copies and original observation window remain unchanged, and no current cache source-version interpretation is made.

## Current cache retention supplement

The archived/controller inventory has 174 files, of which 172 are indexed. Exact current request enumeration identifies 176 files: two additional research caches, `finish_products_db238071.cpython-314.pyc` and `validate_db238071.cpython-314.pyc`, outside archive/manifest/controller changes. They are separately retained as opaque bytes in the worker166 audit supplement, totaling 11,438 bytes. This is distinct from worker165’s earlier two-cache supplement. Copies and metadata were supplied by the independent validator; this method reads and hashes only their temporary audit copies, never interprets or executes bytecode, and makes no source-version or successor attribution. Final current-file enumeration belongs to the validation companion’s later observation, not this method’s fixed named-input hash pass.

## Timing and cutoff

Controller start is `2026-10-17T00:21:19.250758+00:00`; nominal deadline `00:51:19.250758`. Host finish `00:51:38.690058`, elapsed 1,819.4393000602722 seconds, exactly the saved timestamp difference: 19.439300060272217 seconds overrun. Completed/return0/delivered-report classification remains unchanged; the evidence does not identify why the host finishes later.

| Event or original mtime | UTC on 2026-10-17 |
| --- | --- |
| Nine-module replay starts | 00:42:14.100336 |
| Nine-module replay times out, estimated | 00:47:15.216451 |
| Last selected mathematical build finishes, estimated | 00:48:11.462022 |
| Audit build starts | 00:48:36.956469 |
| Audit build finishes, estimated | 00:49:05.417047 |
| Five-module replay starts | 00:49:16.409403 |
| Five-module replay finishes, estimated | 00:49:28.758415 |
| Final validation original mtime | 00:50:26.642608 |
| Final manifest original mtime | 00:50:27.891730 |
| Last-verification original mtime | 00:50:27.922773 |
| Event-log mtime | 00:50:47.293045 |
| Delivered final.json mtime | 00:50:48.792290 |

Audit and the successful core replay do not overlap: the latter starts approximately 10.992356 seconds after Audit finishes. The axiom JSON filename timestamp denotes its later write, not the Audit compiler start. All selected checks and original final output mtimes precede the deadline. Archive-copy mtimes around 00:51:38 describe controller copying after the deadline; they do not establish proof execution times. Receipt epoch plus monotonic duration yields a finish estimate, not independent nanosecond wall-clock precision. The event log has 238 events, 110 started items and 82 command starts; the independently bound log size is 507,273 bytes.

## Companion bindings and final bounded observation

Parent mathematical/source/finite supports have been compared audit-files-only; the exact support identities and matching declaration/status/import bindings are recorded in companion_crosscheck. This compares saved evidence and strings only, not mathematical values.

Final method observation: 292 exact named inputs unchanged from `2026-10-17T01:05:20.238778+00:00` through `2026-10-17T01:05:20.401611+00:00`. The 106 exact ordinary-object absences were confirmed at `2026-10-17T01:05:20.402709+00:00`. Project reads close at this observation. Later crossreviews read audit files only and do not extend it. The separately bound audit-only input count is 24.

The machine-readable evidence and inherited_pair_expectations JSON retain full source/receipt/object hashes, exact source graphs, endpoint boundaries, version inventories, wrapper diffs and historical qualifiers. Nothing here completes a pending proof or upgrades the seven printed-only prefixes, unbuilt full products/gap/source drafts, or full pinned root conjecture.
