# Worker 000179 — retained method and import audit

Request beca0ad5893a498d8ecc9af0fd97b9f0; suffix MBEC; archive evidence markov-beca0ad5. Historical controller outcome is completed / return code 0 / delivered structured report, with mathematical resolution false and completion null. This review is archive-first and static, restricted to named closed/current/inherited counterparts. No project program, Lean/compiler/proof/checker/replay, experiment, generator, CAS or finalizer was executed or imported. No mathematical value or RNG draw was recomputed. Active 180 and successors, project edits, proposer help/contact and separate documentation contents are excluded. Writes remain in the temporary audit directory. Earlier sealed windows are unchanged.

Ten selected mathematical modules contain 56 theorems and 20 definitions. Their final source versions compile, the final joint replay covers all ten, and three incremental axiom audits together print all 56 theorem closures. A separate diagnostic module, MarkovDetTestMBEC, contains three theorems and one definition and has a successful ordinary compile, but is neither selected, replayed, imported by the selected graph nor explicitly printed from that module. Thus eleven mathematical sources are retained; no new unbuilt, rejected-only or timeout-only mathematical source remains.

| Selected module | Theorems | Definitions | Final-source build |
| --- | ---: | ---: | --- |
| MarkovClearedKernelMBEC | 6 | 5 | build-1792218609814298000.json |
| MarkovPolynomialCertificateMBEC | 9 | 5 | build-1792218822813539000.json |
| MarkovReverseCoreMBEC | 4 | 1 | build-1792218523688510000.json |
| MarkovReverseKernelMBEC | 5 | 3 | build-1792218314836449000.json |
| MarkovReverseThreeMBEC | 7 | 1 | build-1792218467227476000.json |
| MarkovSecondTopClosedMBEC | 5 | 1 | build-1792218278492083000.json |
| MarkovSecondTopMBEC | 3 | 0 | build-1792218094247684000.json |
| MarkovUpperResidualMBEC | 4 | 1 | build-1792218419788707000.json |
| MarkovWeightDeterminantsMBEC | 8 | 1 | build-1792218219272333000.json |
| MarkovWeightObstructionMBEC | 5 | 2 | build-1792217973826363000.json |

## Versions and retained objects

Thirty-two compiler attempts comprise fourteen successes, seventeen return-code-1 rejections and one timeout. The successes are eleven mathematical modules and three Audit modules. All fourteen successful source snapshots are final-identical; no superseded successful source needs exclusion. Every unsuccessful snapshot differs from its final source. The first two WeightDeterminants snapshots contain only three theorems; five further theorem names appear in the final eight-theorem source. No failed declaration is removed. All common statement headers agree after removing whitespace, and imports remain identical; the raw header differences caused by compact comparison spacing are preserved in evidence.

The timeout is build-1792217999438392000.json for WeightDeterminants, with a 120-second bound and retained duration about 120.144072 seconds. Its raw receipt omits the compiler returncode field, normalized to null in this audit. It is not a return-code-1 compiler result. Other diagnostics include recursion-depth limits, compact-comparison parser/type errors, rewrite orientation/index normalization, matrix evaluation, cast/subtraction normalization and ring/inequality proof failures. The diagnostic text may display synthetic `sorry` metavariables; that does not establish a literal source admission. The source scan finds none. No unsuccessful version receives successful elaboration credit.

The full literal failed/final diffs are embedded. A block/header comparison is a lexical version check, not a theorem that arbitrary local options, attributes or imports preserve proof meaning. No proof is repaired or rerun by this audit.

| Unsuccessful receipt | Module | Changed common blocks | Result |
| --- | --- | --- | --- |
| build-1792217745982683000.json | MarkovWeightDeterminantsMBEC | weight_det_rectangleMBEC | return 1 |
| build-1792217801888627000.json | MarkovWeightDeterminantsMBEC | weight_det_rectangleMBEC | return 1 |
| build-1792217821903345000.json | MarkovWeightDeterminantsMBEC | weight_det_emptyMBEC, weight_det_hookMBEC, weight_det_rectangleMBEC | return 1 |
| build-1792217874646989000.json | MarkovWeightDeterminantsMBEC | weight_det_emptyMBEC, weight_det_hookMBEC, weight_det_rectangleMBEC | return 1 |
| build-1792217875908267000.json | MarkovWeightObstructionMBEC | arbitrary_lc_weight_shortcut_falseMBEC, bad_weight_crossLCMBEC, bad_weight_gapMBEC, bad_weight_nonnegMBEC | return 1 |
| build-1792217901486463000.json | MarkovWeightObstructionMBEC | arbitrary_lc_weight_shortcut_falseMBEC, bad_weight_crossLCMBEC, bad_weight_nonnegMBEC | return 1 |
| build-1792217911002822000.json | MarkovWeightDeterminantsMBEC | weight_det_emptyMBEC, weight_det_hookMBEC, weight_det_rectangleMBEC | return 1 |
| build-1792217999438392000.json | MarkovWeightDeterminantsMBEC | weight_det_emptyMBEC, weight_det_hookMBEC, weight_det_rectangleMBEC | timeout |
| build-1792218000695862000.json | MarkovSecondTopMBEC | q_product_second_topMBEC | return 1 |
| build-1792218052151177000.json | MarkovSecondTopMBEC | q_product_second_topMBEC | return 1 |
| build-1792218073937747000.json | MarkovDetTestMBEC | det_testMBEC | return 1 |
| build-1792218151955802000.json | MarkovSecondTopClosedMBEC | q_product_pre_normalizedMBEC, q_product_second_normalizedMBEC, q_second_last_adjacentMBEC, top_choose_ratiosMBEC | return 1 |
| build-1792218162499344000.json | MarkovDetTestMBEC | det_testMBEC | return 1 |
| build-1792218191518530000.json | MarkovSecondTopClosedMBEC | q_second_last_adjacentMBEC, top_choose_ratiosMBEC | return 1 |
| build-1792218220440233000.json | MarkovSecondTopClosedMBEC | q_second_last_adjacentMBEC | return 1 |
| build-1792218266791201000.json | MarkovReverseKernelMBEC | reverse_adjacent_iffMBEC | return 1 |
| build-1792218373765367000.json | MarkovUpperResidualMBEC | ReverseInteriorMBEC, reverse_interior_iffMBEC, reverse_twoMBEC, source_band_of_reverseMBEC | return 1 |
| build-1792218421005104000.json | MarkovReverseThreeMBEC | reverse_kernel_threeMBEC | return 1 |

Mathematical build bounds vary over 30, 60, 90 and 120 seconds; DetTest uses 30 seconds. Audit builds use 100 seconds and all three replays use 180 seconds. No same-module build overlap or final source mtime inside its own accepted build interval is observed. Matching dependency successes precede dependent accepted builds. The saved source-edit chronology provides no completed source-edit overlap with those intervals.

Archived/current final source and ordinary object, controller digests, compiler snapshot, finalizer source/object association, replay source maps and Audit source maps agree in their stated scopes. Compiler receipts do not hash objects at production time. A source snapshot precedes compilation of a live named path and does not lock the source read. Finalizer object hashes are later samples. These retained associations do not constitute atomic production-time attestation.

DetTest imports MarkovWeightRepresentationMA45. Its weightDetMBEC definition and weight_positive_indexMBEC / weight_det_forbiddenMBEC theorem names overlap with selected WeightDeterminants; det_testMBEC is diagnostic-only. The selected environment has no duplicate names. A print or replay of the selected module's names does not validate the separate DetTest bodies. The ordinary DetTest object and final-source compile remain explicitly bound without upgrading their scope.

## Three cumulative replays and incremental axiom audits

The replay stages select eight, nine and ten modules, with 51, 62 and 76 guarded names respectively. These match their lexical theorem/definition inventories: 41/10, 47/15 and 56/20. Every stage uses the final retained versions of its selected sources. The second adds ClearedKernel; the third adds PolynomialCertificate. All report three inherited direct imports.

The Audit stages are different scopes: the first prints 41 theorems from the initial eight modules, the second only six ClearedKernel theorems, and the third only nine PolynomialCertificate theorems. The disjoint union has 56 rows and 56 distinct theorem names. Later Audits do not reprint all earlier selected theorems. All rows use propext, Classical.choice and Quot.sound. Raw successful Audit output, explicit print directives, axiom JSON, source maps and ordinary Audit objects agree. Definitions are replay constants, not additional theorem prints.

| Stage | Replay receipt / interval UTC | Audit build / interval UTC | Axiom JSON / prints |
| --- | --- | --- | --- |
| 1 | replay-1792218554894188000.json; 06:29:14.894188–06:29:31.590503 | build-1792218556066549000.json; 06:29:16.066549–06:29:27.067858 | axioms-1792218567071079000.json; 41 |
| 2 | replay-1792218692038250000.json; 06:31:32.038250–06:32:05.726527 | build-1792218692038593000.json; 06:31:32.038593–06:32:01.988698 | axioms-1792218721989859000.json; 6 |
| 3 | replay-1792218863987625000.json; 06:34:23.987625–06:34:43.945611 | build-1792218865160585000.json; 06:34:25.160585–06:34:38.171924 | axioms-1792218878173815000.json; 9 |

Within each stage replay and Audit compilation overlap; the stages themselves are separate. Receipt filename epochs plus saved durations estimate these intervals, rather than independent nanosecond telemetry. Audit source identifiers, build identifiers and axiom JSON identifiers are distinct; an axiom JSON filename denotes its later write. Source-map compatibility and saved commands establish the association, not timing alone.

## Driver, wrappers and finalizer

The checker, validate, Audit, setup and finalizer match worker 178 after full current/predecessor tag and suffix normalization. Removing the later guard leaves the retained worker 110 ordinary replay body. The driver imports an inherited environment excluding selected modules, gathers selected constants and rejects every collected MathGKM.Markov name ending MBEC if already present in the base, unsafe or partial. The check is not restricted to the wrapper's lexical name list. The duplicate suffix disjunction is redundant. Observed 51/62/76 guards match the explicit declarations; differently named generated/private constants and optional binary parts retain ordinary replay limits.

Direct inherited imports are MarkovUpperReductionMA45 and MarkovWeightRepresentationMA45, plus implicit Init. No source-resolution error or cycle is found. Ordinary replay reuses compiled inherited bodies. Replay maps are sampled before invocation, Audit maps after compilation and checker hashes after subprocess execution. The successful receipts are evidence of those retained operations, not a fresh auditor run or full inherited-source rebuild.

Checker SHA256: 3143edb34ab86889556eef39b6ee589f4f89293774a1924d931b51f973f0b285. Wrapper hashes and full normalized comparisons are embedded.

The generic finalizer chooses the last sorted successful current-source build and samples its object hash. It does not require singleton build maps. Successful source-matching replay maps must cover all selected modules; it does not require one joint invocation, matching checker hash or success-marker stdout. Axiom selection requires current-source maps, the selected theorem-name subset and permitted axiom sets, not exact name equality or direct successful raw Audit/object linkage. This audit independently verifies the stronger actual retained associations, including the final ten-module joint replay and exact 56-print union.

Forbidden-token scanning removes block and line comments with a lexical regex, not a full Lean parser. The version subprocess return code is recorded but not asserted; its retained value is zero. Initial and predecessor preservation are asserted, with no owned exceptions. Root and contract are compared to reconciliation. There is no future-write lock or whole-tree guarantee. Setup records inherited-binding and predecessor-mismatch flags without asserting them; the observed values agree.

The initial setup rewrite displayed at event 31 mistakenly used ReplayIsolatedMBEC as both source and destination. Event 33 corrected the source to ReplayIsolatedMA45 before first invocation 35. This is a pre-execution preparation correction, not a compiler failure.

Selection events write eight modules at 221, append ClearedKernel at 245 and append PolynomialCertificate at 261. The capability object printed as a Python literal in event 245 matches the saved JSON by safe literal parsing. The event also runs a bounded GAP invocation; these are retained worker records, never auditor executions. Capabilities record Sage unavailable, GAP/Lean/Lake executable paths, denied scratch access, a missing guessed predecessor helper followed by discovery, no additional model invocation and no shell networking. Source-visit metadata records hosted publisher/arXiv retrieval and relevant sections. This audit does not verify literature novelty, turn web prose into a Lean axiom, or infer command-time source identity from a final script hash alone.

## Inherited graph and historical limits

The expected inherited graph has 2,764 source/object pairs: 2,754 sealed worker-178 inherited pairs plus its ten accepted modules. The selected closure has 2,774 nodes; adding the diagnostic and three Audit modules gives 2,778. Expected identities derive from sealed evidence and controller-before179 source/object maps, without fallback to current observed hashes. The worker's initial suffix-filtered inventory excludes objects. The validator's separate fresh 2,764-pair byte-hashing observation runs 06:40:40.494878–06:41:13.517454 UTC; it is distinct from worker 176's qualified cached comparison and from later closing windows.

| Endpoint | Current closure | Inherited modules | Old 212 / subset 195 / separate 19 | Window / Abel |
| --- | ---: | ---: | --- | --- |
| MarkovClearedKernelMBEC | 7 | 2,763 | 212 / 195 / 19 | both |
| MarkovDetTestMBEC | 1 | 2,764 | 212 / 195 / 19 | both |
| MarkovPolynomialCertificateMBEC | 8 | 2,763 | 212 / 195 / 19 | both |
| MarkovReverseCoreMBEC | 6 | 2,763 | 212 / 195 / 19 | both |
| MarkovReverseKernelMBEC | 1 | 2,763 | 212 / 195 / 19 | both |
| MarkovReverseThreeMBEC | 2 | 2,763 | 212 / 195 / 19 | both |
| MarkovSecondTopClosedMBEC | 2 | 2,763 | 212 / 195 / 19 | both |
| MarkovSecondTopMBEC | 1 | 2,763 | 212 / 195 / 19 | both |
| MarkovUpperResidualMBEC | 4 | 2,763 | 212 / 195 / 19 | both |
| MarkovWeightDeterminantsMBEC | 1 | 2,764 | 212 / 195 / 19 | both |
| MarkovWeightObstructionMBEC | 1 | 2,764 | 212 / 195 / 19 | both |

WeightDeterminants and WeightObstruction use all 2,764 inherited modules; the other eight selected endpoints use 2,763, omitting WeightRepresentationMA45. DetTest separately uses 2,764. Every endpoint contains the old 212 unrecovered worker-121 modules, including its 195 subset, plus the separate nineteen historically accepted modules. None gains current body replay or rebuild credit through importing it.

WindowLC retains its historical empty-checker limitation and the two printed closures runInterval_cross6d34 and runInterval_smoothed_lc6d34; crossLC_balanced6d34 gains no third print. Abel retains its historical source/object and two-print scope, tail_weight_nonneg65c4 and centered_weight_nonneg65c4; crossLC_center_weights65c4 is not newly printed. These are separate limitations.

Worker 166 completed at the host with return 0/report, while the large combined replay timed out. Its seven compiled/printed but unreplayed prefixes are absent and unrecovered; only CorrectionFactor contributes here. Original 156 timeout/null report remains distinct from 157's twelve-module, 44-closure recovery. Corrected 145 Scalar remains inherited; rejected M81F remains distinct from accepted MF25. KernelLimit160, Column0/161, PairCleared163 and older 164/168 unsuccessful candidates retain their status. Current membership tables preserve the corrected 174/M831 label while leaving the sealed 177 payload unchanged.

Worker 171 remains missing_or_malformed_report / return 1 / null report. Setup reads its raw 280 events and matches the final four events and 127 artifact identities through prior 178 reconciliation, without side-effect replay or status upgrade. The immediate predecessor's 334 manifest identities are also checked. Current import membership is different from preserving all predecessor records. Named external library source/object pairs are identity bindings, not a fresh library rebuild.

## Inventory and separate manifest-only retention

Setup scans research/evidence/MathGKM for .lean, .py, .md, .json and .toml, excluding only the current evidence directory. Its 21,638 initial entries include setup_beca0ad5.py, with no owned exceptions. Objects, caches and .g/.sing/.txt are outside that suffix filter. Top-level fixed configuration/contracts and separate documentation are not silently appended. The finalizer's stale request-prefix-exclusion comment does not describe the actual scan.

The research manifest includes current-tag paths OR paths absent from the initial inventory. Final 388 entries comprise 149 archived/indexed paths and 239 manifest-only entries. Archive/controller retain 151 paths, including two unindexed administrative records. Archive/manifest union is 390; exact current-request scope is separately 154 paths, consisting of 151 archived and three current caches. This is not 388 newly produced artifacts.

The 236 historical manifest-only identities match sealed 178. Eleven old non-cache entries also have controller-before179 pins; the 225 old caches omitted there are not mismatches. Three current caches make 239: 228 .pyc, nine .g, one .sing and one .txt. The supplemental copies are opaque retention evidence, not interpreted bytecode or new theorem evidence. Source/copy bytes, mode, uid, gid and mtime are compared. Observation/copy times do not establish creation time, producing process, source version or later-worker attribution. Older archives, indexes, supplements and windows remain unchanged. The required preservation set is 253 files including integrity: twelve core files, 239 copies and two companion JSON records.

All 239 copies total 2,138,798 bytes. Supplement SHA256 7f574c047abde40cddcc4d53fe8cf33fd8538d652c2f13c89e46b20ab43644b0; observation SHA256 ddbfc35e40d03007e01062dbc9775f93c06c242c2f54c54280504fed721e1c13. Copy window 2026-10-17T06:45:37.357143+00:00 through 2026-10-17T06:45:37.404868+00:00. Both companion contents and copy identities are embedded.

## Finalization and clocks

Finalizer creation is events 275–276. First finalization 277–278 reports 387 manifest entries. Events 281–282 add evidence/report.json; second finalization 283–284 reports 388. Both outputs report ten modules, 56 closures, eighteen unsuccessful builds, 21,638 initial and 334 predecessor identities, with the same validation digest. The first manifest output/hash is retained without separate first-manifest bytes. Finalizer outer counts match validation; its final preservation subobject equals last-verification.json. The final independent worker check at 285–286 reports 388 entries and no mismatch. Saved evidence/report.json differs in wording from delivered event 287, which equals final.json and receipt.report. turn.completed 288 follows.

Stderr is 318 bytes: one unsuccessful apply_patch operation at 06:18:40.849107 concerning a GAP-file hunk header. This is separate from compiler failures and from saved GAP invocation output. It is not an unexplained empty stream.

Controller starts 06:13:18.636949 UTC, deadline 06:43:18.636949, finishes 06:38:23.252076. Stored elapsed 1504.6151270866394 seconds equals saved timestamp subtraction. Host finish is 295.3848729133606 seconds before deadline. Last selected mathematical compilation finishes at estimated 06:33:53.349217.

Original validation, manifest and last-verification mtimes are 06:37:30.992624, 06:37:33.755643 and 06:37:33.770986. Event-log mtime is 06:37:54.139193; final.json mtime 06:37:55.151007 and activity-content time 06:37:55.352693 precede host finish. Archive-copy mtimes are separate retention bookkeeping. There are 288 events, 137 started items and 108 command starts. Event-log 458,312 bytes plus 318 stderr bytes equal 458,630 activity-accounted bytes. No cause is inferred for the report-to-host interval. Toolchain versions are retained observations, not auditor invocations.

## Mathematical and finite scope

The final accepted sources prove the auxiliary deficiency-two and deficiency-three adjacent inequalities and reduce the remaining upper-adjacent condition exactly to ReverseCoreMBEC on 4≤h≤j. This is an auxiliary equivalence; it does not remove a full-root residual. Cleared-gap and polynomial-certificate identities and conditional transports are proved, while universal CertificatePositiveMBEC / ClearedCoreMBEC assumptions remain undischarged. The certificate evaluation identity includes natural h=0; inner support guards do not constitute an extra coefficient positivity theorem. The cleared sign equivalence carries h≤j.

The four-row partition-weight determinant evaluation/nonnegativity results are proved in their stated ordered natural-partition domain. WeightObstruction formally rejects an arbitrary-CrossLC-weight shortcut, not the actual source family. Neither arbitrary-weight negative tests nor finite positive certificate coefficients establish a source-family counterexample or a universal remaining bridge. Small-j polynomial degree observations do not supply a new raw source LC region.

Conjecture63 still has the two open residuals ThreeBeyondBandM657 and OtherFourM9E2. Conditional raw transport keeps its source-domain and band assumptions. Finite source, representation, fixed-deficiency polynomial, stress, random-weight and GAP outputs are bound literally. Counts of stored records or index domains do not regenerate coefficients, signs, exact values, random samples or early-stopping searches. Six Python sources and one GAP input are read statically; guarded imports and the unguarded stress script are distinguished by the separate source/finite audit. None is executed by this reviewer.

## Companion review

Audit-file comparisons agree on all eleven source/declaration/object inventories, 546 older named sources (412 imported / 134 outside), 18 external pairs, 92 inherited scripts, 24 result pins and 12 complete saved finite objects. The crosscheck contents are embedded. Evolving main/validation drafts are not circular immutable input pins.

## Audit-owned refinements and closing status

Fresh 179 helpers adapt prior sealed static procedures. The first augmentation stopped before writing outputs because an inherited audit assertion incorrectly expected all eighteen unsuccessful builds to return 1; corrected classification is seventeen return 1 plus one timeout. Its original helper is retained. A first companion crosscheck stopped before outputs on the diagnostic record's absent imports key; the corrected predicate verifies available source/declaration/object/status fields while the separate graph binds imports. Both are audit-only schema refinements; source bytes, receipts and previous seals are unchanged. No project execution or mathematical recomputation occurred.

Final bounded method observation:

```json
{
  "absence_check_count": 0,
  "absence_observation_applicable": false,
  "absence_observed_utc": "2026-10-17T06:51:34.074606+00:00",
  "absence_qualification": "Not applicable: all 11 current mathematical modules have retained successful ordinary objects. No new candidate-object absence observation and no extension of any old absence window.",
  "all_unchanged": true,
  "audit_only_input_count": 262,
  "finished_utc": "2026-10-17T06:51:34.074597+00:00",
  "input_count": 442,
  "mismatches": [],
  "object_absences": {},
  "scope": "Exact named inputs only; no project program, mathematical computation, directory enumeration, documentation contents or active 180/successor reads. All 239 manifest-only supplemental copies are hashed without interpretation. This closes method project reads; later review is audit-files-only and prior windows remain unchanged.",
  "started_utc": "2026-10-17T06:51:33.971691+00:00"
}
```

Separate absence qualification:

```json
{
  "applicable": false,
  "observed_utc": "2026-10-17T06:51:34.074606+00:00",
  "paths": {},
  "scope": "No new candidate-object absence check: every current mathematical module has retained ordinary object; prior absence windows unchanged."
}
```

Method project reads are closed. Later footer/helper review uses audit files only; validation records its separate broader closing window.
