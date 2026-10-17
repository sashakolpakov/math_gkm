# Worker 000180 — retained method and import audit

Request 1c65a30634f843b1b22e83fb453dc26d; suffix M1C6; archived evidence markov-1c65a306. Controller outcome is completed / return code 0 / delivered structured report, mathematical resolution false and completion null. This is an archive-first static review of exact named closed/current/inherited counterparts. No project program, Lean/compiler/proof/checker/replay, experiment, generator, CAS or finalizer is executed or imported; no mathematical value or RNG sample is recomputed. Active 181 and successors, project edits, proposer help/contact and separate documentation contents are excluded. Writes are temporary audit files. Historical seals and observation windows remain unchanged.

All twelve current mathematical sources are selected. They contain 66 theorems and 18 definitions; their final sources have successful builds, one complete joint kernel replay and one complete 66-name axiom audit. No additional current compiled-only, unbuilt, timeout-only or rejected-only mathematical module remains. The thirteen retained ordinary objects are twelve mathematical modules plus one Audit module.

| Selected module | Theorems | Definitions | Final-source build |
| --- | ---: | ---: | --- |
| MarkovCertificate4M1C6 | 4 | 2 | build-1792219564121186000.json |
| MarkovCertificate5M1C6 | 4 | 2 | build-1792219564121177000.json |
| MarkovFixedZeroClosedM1C6 | 7 | 1 | build-1792220489593352000.json |
| MarkovFixedZeroFormulaM1C6 | 4 | 2 | build-1792220288074671000.json |
| MarkovFixedZeroPositiveM1C6 | 2 | 2 | build-1792220358868370000.json |
| MarkovMomentObstructionM1C6 | 6 | 0 | build-1792220133416673000.json |
| MarkovPowerSumsM1C6 | 11 | 0 | build-1792220182915998000.json |
| MarkovReverseMomentsM1C6 | 8 | 2 | build-1792219557075911000.json |
| MarkovRisingConvolutionM1C6 | 5 | 1 | build-1792220146005248000.json |
| MarkovUpperTailM1C6 | 4 | 2 | build-1792219835987017000.json |
| MarkovVarianceContractionM1C6 | 6 | 1 | build-1792219835986659000.json |
| MarkovVarianceDriftM1C6 | 5 | 3 | build-1792219809680135000.json |

## Versions, objects and overlapping attempts

Twenty-three compiler attempts comprise thirteen successes and ten return-code-1 rejections, with no timeout. All thirteen successful snapshots are final-identical, including the Audit source. There is one successful final-source mathematical build per selected module and no superseded successful source. Every rejected snapshot differs from its final source. Imports agree across every failed/final pair. Failed elaborator diagnostics can contain synthetic `sorry`; this does not establish a literal source admission, and the retained source scan finds none.

The first RisingConvolution snapshot has an extra placeholder definition risingConvM1C6, removed from the final source. It is not a failed theorem later certified under that definition. The rejected FixedZeroClosed snapshot contains five theorems and one definition; the final source has seven theorems and one definition, adding q_zero_orderedM1C6 and sharp_zero_marginM1C6. Its fixed_zero_closed_gapM1C6 statement changes real subtraction h−1 to an explicit coercion of natural subtraction (h−1:ℕ). Those expressions are not interchangeable without their domain hypotheses; only the final statement obtains successful credit. Other common headers agree after whitespace normalization. Full literal failed/final diffs and diagnostics are embedded. These are static version comparisons, not proof repairs or a general semantic-equivalence certificate.

| Failed receipt | Module | Changed common blocks |
| --- | --- | --- |
| build-1792219445861911000.json | MarkovCertificate4M1C6 | certificate_4_evalM1C6 |
| build-1792219465384456000.json | MarkovCertificate5M1C6 | certificate_5_evalM1C6 |
| build-1792219536097996000.json | MarkovReverseMomentsM1C6 | reverse_kernel_shiftM1C6, reverse_unbalanced_momentM1C6 |
| build-1792219637451200000.json | MarkovVarianceDriftM1C6 | reverse_center_positiveM1C6 |
| build-1792219721881143000.json | MarkovVarianceDriftM1C6 | reverse_center_positiveM1C6 |
| build-1792220019916254000.json | MarkovMomentObstructionM1C6 | witness_drift_positiveM1C6 |
| build-1792220064109730000.json | MarkovRisingConvolutionM1C6 | scaled_reverse_coeffM1C6, weight_product_splitM1C6 |
| build-1792220126863604000.json | MarkovRisingConvolutionM1C6 | scaled_reverse_coeffM1C6 |
| build-1792220201991364000.json | MarkovFixedZeroFormulaM1C6 | closed_A_coeffM1C6, closed_B_coeffM1C6 |
| build-1792220438874111000.json | MarkovFixedZeroClosedM1C6 | fixed_zero_closed_gapM1C6 |

The remaining rejected differences concern casts/map_ofNat, binomial-index normalization, positivity/cast proofs, compact comparison parsing, a redundant post-proof tactic, and fixed-zero polynomial proof structure. Mathematical build bounds are120,150 or180 seconds; Audit uses 100 and the kernel replay 180. The failures receive no final-source validation credit.

RisingConvolution has a material live-source boundary. Failed build1792220126863604000 starts at estimated06:55:26.863604 UTC and finishes06:55:51.339703. Events 144–145 record an edit after its start event 143. Original final-source mtime is06:55:33.340644, inside that failed interval. Successful build1792220146005248000 starts 06:55:46.005248 (event 147), before failed completion 148, and finishes06:55:57.917944 (event 150), later than the failure. Thus the two same-module attempts overlap. The earlier failed build1792220064109730000 spans 06:54:24.109730–06:54:31.411956 and includes the removed placeholder.

The wrapper snapshots source bytes and then compiles the live named path; it does not lock the compiler's read to those bytes. The observed edit and overlap prevent an atomic-input assertion. The final successful snapshot, final source, later successful replay, explicit Audit and preserved object associations agree, and the success finishes later, but static records alone do not rule out all transient object-write races. No other final source mtime falls inside its own recorded build interval. Matching successful current dependency builds precede dependent accepted builds.

Archived/current final sources and ordinary objects, controller after-digests, source snapshots, finalizer source/object hashes, kernel maps and Audit maps agree in their stated scopes. Compiler receipts do not hash objects at production time. Finalizer object hashes are later observations. These associations do not authenticate the exact production process or optional object parts.

## Complete kernel and axiom coverage

The raw receipt is kernel-1792220527100559000.json, using mode kernel rather than the predecessor's replay filename prefix. It succeeds on all twelve final sources, reports 84 guarded names and two direct inherited imports including implicit Init. The84 matches the explicit 66-theorem/18-definition inventory. The sole Audit source is MarkovAudit1792220527102916000M1C6, compiled by build-1792220527103001000.json. Its explicit print directives, raw successful output and axioms-1792220541614717000.json agree on exactly66 theorem names with no duplicate names. All66 rows have propext, Classical.choice and Quot.sound; definitions are ordinary replay constants, not additional theorem prints.

Kernel interval:07:02:07.100559–07:02:42.031506 UTC. Audit compiler interval:07:02:07.103001–07:02:21.608030. They overlap; Audit starts about 0.002442 seconds later and finishes about 20.423476 seconds earlier. Filename epochs plus saved durations estimate these intervals. Audit-source, compiler-receipt and axiom-JSON identifiers denote different events; the axiom JSON filename records its later write, not Audit compiler start. Exact source maps and saved commands establish the coverage pairing, not timing alone.

## Driver, wrappers and changed finalizer

Validate and Audit wrappers and the isolated driver are exact predecessor 179 retags. Removing the later guard leaves the retained worker 110 ordinary replay body. The driver imports an inherited base excluding the selected modules, gathers their constants, and rejects every collected MathGKM.Markov name ending M1C6 if already present in the base, unsafe or partial. This applies to every matching collected name, not only names recognized by the wrapper's lexical regex. The suffix disjunction is redundant. Observed 84 guards match the explicit inventory; differently named generated/private constants retain ordinary replay behavior and its limits.

Direct inherited imports are MarkovPolynomialCertificateMBEC plus implicit Init. No source-resolution errors or cycles are found. Ordinary replay reuses compiled inherited bodies; it does not freshly reconstruct their proofs from source. The driver can load ordinary/server/private module data; preserved ordinary object identities do not exhaustively authenticate optional parts. Replay source hashes are taken before invocation, Audit maps after compilation, and checker hash after subprocess return. The retained executable path selects Lean 4.32.2; no fresh auditor or new worker Lean-version invocation is claimed.

Checker SHA256: 6b6fe53ff85a87412bddb65b92bf738d7a64a309abf40bbaf6e9dd04ae6e7202. Full wrapper hashes and normalized differences are embedded.

Setup and finalizer are materially rewritten. Raw validation.json now has modules entries containing source_sha256, build_receipts[] and olean_sha256, together with kernel_replays[], a single axiom_audit, closures, allowed_axioms, rejected_builds, limits and completion. The raw object is retained verbatim in evidence. A separate normalized comparison view does not imply that old compiled or successfully_replayed fields were present. Successful replay coverage is independently checked against the actual kernel receipt.

The new finalizer collects all unsorted successful build receipts whose modules.get(name) matches the current source hash; it does not require a singleton source map. It samples the ordinary object hash after selection. It requires at least one successful kernel receipt with exactly the selected module set and all current source hashes. It does not separately assert checker identity or success-marker stdout. For axioms it requires an exact full selected source map and chooses the last unsorted match. It counts declarations and reports the allowed-axiom list, but does not itself assert expected theorem names, permitted axiom values or raw Audit success/object linkage. It has no forbidden-token scan. The unchanged Audit wrapper independently requires every lexically enumerated theorem print, a permitted axiom set and compiler return 0; this review verifies the actual complete 66-name linkage.

Validation is written before preservation assertions. Finalizer asserts all 21,774 initial input hashes, all 388 predecessor-manifest identities, and fixed literal root and canonical-contract hashes. No own input is exempt. It computes artifacts_verified and prints/stores its true value, but does not assert that field separately. There is no future-write lock or global whole-tree guarantee. These predicates are operational selection and preservation checks, not admission authority.

Setup records inherited-binding flags and predecessor mismatch lists without asserting them; their retained values pass. It reads raw worker 171 events, compares its final four events against the prior reconciliation, checks127 old artifact identities and prints the final two error events. The recorded 'report transport failure' wording is not independent evidence of a cause. Worker 171 remains missing_or_malformed_report / return 1 / null report; no side-effect replay or historical outcome upgrade occurs.

## Inherited graph and historical limits

The expected inherited graph has 2,771 source/object pairs: 2,763 from the sealed 179 inherited set plus eight accepted179 modules. The selected closure has 2,783 modules, and adding the one Audit gives 2,784. Expected identities derive from sealed evidence and controller-before180 source/object maps, without fallback to current hashes. The worker's initial suffix inventory excludes objects. The validator independently freshly hashes all 2,771 source/object pairs during07:09:15.931804–07:09:42.213126 UTC; it explicitly uses no cached digests for that observation. This remains separate from worker 176's qualified cached comparison and later final windows.

Imported accepted179 modules are SecondTop, SecondTopClosed, ReverseKernel, UpperResidual, ReverseThree, ReverseCore, ClearedKernel and PolynomialCertificate (all MBEC). WeightDeterminantsMBEC and WeightObstructionMBEC are preserved comparisons outside this graph. Diagnostic DetTestMBEC remains compiled-only historically and is absent; its three theorem/one definition bodies gain no replay/print credit. WeightRepresentationMA45 is also absent from the current inherited graph.

| Endpoint | Current closure | Inherited modules | Old212 / subset 195 / separate 19 | Window / Abel |
| --- | ---: | ---: | --- | --- |
| MarkovCertificate4M1C6 | 1 | 2,771 | 212 / 195 / 19 | both |
| MarkovCertificate5M1C6 | 1 | 2,771 | 212 / 195 / 19 | both |
| MarkovFixedZeroClosedM1C6 | 10 | 2,771 | 212 / 195 / 19 | both |
| MarkovFixedZeroFormulaM1C6 | 8 | 2,771 | 212 / 195 / 19 | both |
| MarkovFixedZeroPositiveM1C6 | 9 | 2,771 | 212 / 195 / 19 | both |
| MarkovMomentObstructionM1C6 | 3 | 2,771 | 212 / 195 / 19 | both |
| MarkovPowerSumsM1C6 | 7 | 2,771 | 212 / 195 / 19 | both |
| MarkovReverseMomentsM1C6 | 1 | 2,771 | 212 / 195 / 19 | both |
| MarkovRisingConvolutionM1C6 | 6 | 2,771 | 212 / 195 / 19 | both |
| MarkovUpperTailM1C6 | 5 | 2,771 | 212 / 195 / 19 | both |
| MarkovVarianceContractionM1C6 | 3 | 2,771 | 212 / 195 / 19 | both |
| MarkovVarianceDriftM1C6 | 2 | 2,771 | 212 / 195 / 19 | both |

Every endpoint imports the full 2,771 inherited base, including the old 212 unrecovered worker 121 modules, its 195 subset, and the separate 19 historically accepted modules. Importing them supplies no fresh source rebuild or body replay. WindowLC retains its historical empty-checker scope and two printed closures runInterval_cross6d34 / runInterval_smoothed_lc6d34; crossLC_balanced6d34 gains no additional print. Abel separately retains its source/object and two-print boundary tail_weight_nonneg65c4 / centered_weight_nonneg65c4; crossLC_center_weights65c4 is not newly printed.

Worker 166 completed at the host with return 0/report, while its large combined replay timed out. Its seven compiled/printed but unreplayed prefixes are absent and unrecovered; only CorrectionFactor contributes here. Worker 156's original timeout/null report is distinct from 157's twelve-module, 44-closure recovery. Corrected historical versions and KernelLimit160, Column0/161, PairCleared163 and older164/168 unsuccessful candidates retain their prior status. Nested sealed historical wording is retained without treating a replay timeout as a failed host outcome. No current recovery is claimed.

The predecessor 179 manifest contains 388 identities, including its 239 separately retained manifest-only files. All239 remain in the predecessor preservation check but none is reindexed in 180. Preservation, current import membership and historical proof coverage are distinct. Named external source/object pairs bind identities; they do not amount to a fresh rebuild of external libraries.

## Narrower inventory and three opaque caches

Setup scans research/evidence/MathGKM for .lean, .py, .md, .json and .toml, excluding only the new evidence directory. Its 21,774 entries include setup_1c65a306.py with no owned exclusion. It excludes ordinary objects, caches and .g/.sing/.txt by suffix, and does not silently include top-level fixed configuration, contracts or separate documentation files.

The new finalizer scans only top-level research files whose names contain 1c65a306 or M1C6, plus the current evidence subtree excluding manifest.json and last-verification.json. It drops the old rule that included files merely absent from the initial snapshot. Thus all 110 manifested paths are archived, and 112 archive/controller paths add the two administrative records. The archive/manifest union is 112. The separate exact-request current inventory is 115, with three unindexed/unarchived opaque caches. These are not missing manifest entries and are not a repetition of the older239-file supplement.

Initial inventory observation is 07:06:41.826260 UTC; cache metadata observation is 07:12:57.948939–07:12:57.950316. The three names are fixed_parameter_1c65a306.cpython-314.pyc, probe_moments_1c65a306.cpython-314.pyc and validate_1c65a306.cpython-314.pyc under research/__pycache__. They total18,149 bytes. The separately authorized copies retain bytes, mode, uid, gid and mtime. No bytecode is interpreted or executed. Their discovery, old-looking mtimes and names do not establish creation time, producing process, source version or successor attribution. Earlier supplements and windows remain unchanged.

Opaque bundle metadata SHA256 cb0948e80becfb0fecb6fdf00b561631630511e899fe17b761864169127adb7e; observation SHA256 cae4b11fe8a951b081c85059d4bd33997d97c6659fb9ce3fb2bcba353a5e17d6. Copy interval 2026-10-17T07:12:57.950510+00:00–2026-10-17T07:12:57.952127+00:00. Both full companion records and all three copy hashes are embedded; copies are inside the bundle directory, companion JSON files alongside it in T.

## Finalization and clocks

One finalizer invocation succeeds at event 210. Its complete printed JSON equals last-verification.json, including 12 modules, 66 closures, 10 rejected builds, 110 manifested artifacts, 21,774 initial inputs and 388 predecessor artifacts. Event 212 reads a saved validation summary; delivered event 213 equals final.json and receipt.report, followed by turn.completed 214. No evidence report.json or final-check.json is retained. There are 214 events, 101 started items and 70 command starts. Stderr is empty;996,167 event-log bytes equal activity-accounted bytes.

Controller starts 06:39:00.402322 UTC and finishes 07:04:44.860155. The exact request budget is 1,800 seconds, giving nominal deadline 07:09:00.402322. Stored elapsed 1544.4578330516815 seconds agrees with timestamp subtraction; finish is 255.54216694831848 seconds before that deadline. Last selected mathematical build finishes at estimated 07:01:39.444692. All current validation operations finish before host completion.

Original validation, manifest and last-verification mtimes are 07:03:34.130597, 07:03:37.175451 and 07:03:37.253345. Event-log mtime is 07:04:15.957765, final.json 07:04:16.816488, and activity content time 07:04:16.563441. Archive-copy mtimes are later retention bookkeeping, not original artifact creation times. No cause is inferred for the interval from report writing to host finish.

Capabilities record Python 3.14.6, a located GAP executable that was not invoked, no Sage executable and a null SymPy module lookup. No auditor installs or capability commands occur. Hosted-source/literature and scratch/heredoc descriptions are retained worker observations, not external theorem admission or novelty verification. The worker says moment-probe stdout was displayed truncated; the independently read raw event 46 actually contains the complete JSON matching moment-probe.json, including 4,217 failure rows. The display statement must not be turned into a claim that retained raw stdout is incomplete.

## Mathematical and finite scope

The final sources establish the auxiliary fixed-s=0 ordered-ratio/adjacent results for natural indices, with zero tails and small degrees treated separately. FixedZeroClosed explicitly handles natural predecessor h−1 in its accepted statement. Certificate4 and Certificate5 establish the h=4 and h=5 auxiliary steps. The remaining positive-parameter condition concerns s≥1 and6≤h≤j, and is exactly equivalent to the inherited UpperAdjacent auxiliary predicate. This is not a new unconditional raw-source log-concavity region or a removal of a root residual.

Reverse-moment identities, positive mass/denominator hypotheses, the drift sign equivalence and variance contraction in s hold in their stated domains. Contraction alone does not prove the remaining drift sign; normalized-drift monotonicity and limiting-sign bridges remain unproved. The formal failure of monotonicity in h concerns an auxiliary variance, not an actual source-family counterexample. Conditional raw horizontal transport retains q≥2, its band condition, both source residues and the unproved global auxiliary hypothesis. Sharp zero-margin transport is s=0; it does not discharge general SharpCompleteMargin. The root remains Conjecture63 iff ThreeBeyondBandM657 and OtherFourM9E2, with both residuals open.

Seven mathematical Python programs, including two generators, have static source provenance. The saved fixed-parameter-initial.py is a worker reconstruction of the pre-edit Faulhaber bound, not an original automatic invocation-time snapshot or a fresh execution. Guarded functions do not make all imports inert: fixed_parameter builds a table at module top level, and generators/validate_fixed_zero perform top-level work. This audit never imports them. The parent source/finite review binds saved outputs, literal event projections, list lengths and index domains without coefficient, factorial, moment, gap, polynomial, sign or RNG recomputation. Finite positives or 4,217 auxiliary monotonicity failures do not substitute for universal source claims.

## Companion review

Audit-file comparisons agree on all twelve source/declaration/object inventories, 556 older named sources (419 imported / 137 outside), 18 external pairs, 99 inherited scripts and 10 result pins. Five complete saved finite objects, the moment summary without its failure list plus that list's length, and three fixed-parameter stored-array lengths agree. Crosscheck contents are embedded. Evolving main/validation drafts are not circular immutable inputs.

## Audit-owned refinements and closing status

The initial core helper stopped before writing evidence or pairmap on a stale inherited-map key in sealed 179. Its original file is retained; the correct prior178-key field within sealed 179 is now used. A current unsealed details helper carried an 1810-second deadline constant; the exact closed request establishes 1800, so the current timing was corrected before closing. The unchanged original helper and old/current derived values remain recorded. Earlier seals and windows are untouched. New validation schema, cast/header change, live-build overlap and the narrower manifest are handled explicitly rather than by stale predecessor assumptions. No project execution or mathematical-value recomputation occurred.

Final bounded method observation:

```json
{
  "absence_check_count": 0,
  "absence_observation_applicable": false,
  "absence_observed_utc": "2026-10-17T07:20:09.136332+00:00",
  "absence_qualification": "Not applicable: all 12 current mathematical modules have retained successful ordinary objects. No new candidate-object absence observation and no extension of any old absence window.",
  "all_unchanged": true,
  "audit_only_input_count": 25,
  "finished_utc": "2026-10-17T07:20:09.136320+00:00",
  "input_count": 179,
  "mismatches": [],
  "object_absences": {},
  "scope": "Exact named inputs only; no project program, mathematical computation, directory enumeration, documentation contents or active 181/successor reads. All three unindexed opaque supplemental copies are hashed without interpretation. This closes method project reads; later review is audit-files-only and prior windows remain unchanged.",
  "started_utc": "2026-10-17T07:20:08.828398+00:00"
}
```

Separate absence qualification:

```json
{
  "applicable": false,
  "observed_utc": "2026-10-17T07:20:09.136332+00:00",
  "paths": {},
  "scope": "No new candidate-object absence check: every current mathematical module has retained ordinary object; prior absence windows unchanged."
}
```

Method project reads are closed. Later footer/helper review uses audit files only; validation records its separate broader closing window.
