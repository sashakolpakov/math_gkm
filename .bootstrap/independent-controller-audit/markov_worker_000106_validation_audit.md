# Worker 000106 retained validation audit

Request `8ae35b59ea65417ba5e729586edff267`; controller `/Users/sasha/math_gkm/.control/markov/workers/000106`. Static archive, source, record and hash inspection only. No project code, Lean/checker/replay, experiment, finalizer or missing check was executed; no project files were changed. Mathematical scope is assessed separately by the parent audit.

## Result and timing qualification

The retained records support successful final-source compilation and alternate kernel replay for all **87 selected new mathematical modules**, with **227 explicit named theorems and 170 definitions**. All 227 theorem names have directly printed standard axiom closures. There is no inherited selected target, recovery replay, or selected mathematical module left compiled-only.

The controller reports **completed**, return code 0, elapsed **1804.2578942775726 seconds**, and a retained final report. Its finish timestamp exceeds the nominal start-plus-1800-second deadline by **4.257894 seconds**. This is distinct from the proof and report timing: all changed project artifacts, the complete retained event stream including final report and `turn.completed`, and `final.json` have predeadline timestamps. The controller receipt itself was written afterward. These records do not support relabeling the run as a timeout or claiming postdeadline mathematical validation.

All **531 controller artifacts** match archive and current bytes; all **528 artifact-index entries** match expected, archive, current and controller hashes. The three controller artifacts outside the index are `artifact-verification.json`, `final-check.json`, and the subsequent `last-verification.json`. No current extra file, unarchived validation receipt or pending command item was found in this worker scope.

## Inventory and axiom counts

The 87-module label includes **14 import-only shims**, with no local explicit theorem or definition declarations. The other 73 modules contain the declared 227 theorems and 170 definitions:

| Source family | Modules | Theorems | Definitions |
|---|---:|---:|---:|
| Base coefficient chunks | 9 | 105 | 105 |
| Split coefficient-gap components | 46 | 92 | 46 |
| Column components | 11 | 11 | 11 |
| Numerator-two gap components | 4 | 8 | 4 |
| Complete subfamily modules | 2 | 10 | 4 |
| Small-onset source adapter | 1 | 1 | 0 |
| Import-only shims | 14 | 0 | 0 |

Thus 216 names are in the algebraic helper families and 11 in the two complete-subfamily modules plus source adapter. These are declaration counts, not 227 independent full-source conclusions. The replay method handles constants beyond named theorem declarations.

Three Audit modules compiled: ProgressAudit prints 148 names, SecondAudit 206, and FinalAudit all 227. These are **581 printed rows, 227 distinct names**, exactly the selected theorem inventory. All requests and outputs match the final inventory and validation axiom map, with no missing or extra name. Every closure uses only `propext`, `Classical.choice`, and/or `Quot.sound`. Audit modules are compilation/axiom-output evidence, not replay targets. BaseAudit timed out and has no object; its partial attempt contributes no successful audit coverage.

The archive has **174 new Lean sources**: 87 selected mathematical sources, **83 excluded unbuilt mathematical sources**, and four Audit sources (three successful, one timed out). The 83 excluded math sources have neither object nor successful final-source build. They comprise 53 pending split coefficient gaps, eight column candidates, six general chart/source/residual candidates, eight duplicate drafts and eight missing import shims. Those pending categories are not new accepted theorem scope.

## Attempts, queued work and source bindings

There are **107 retained actual Lean validation invocations**: 103 builds and four unions. Builds comprise 90 successes (87 math + three Audit), six compiler errors and seven timeouts. No direct replay or interrupted Lean outcome is retained.

Of the 13 rejected build attempts, seven belong to earlier versions of ultimately selected modules: two Base timeouts and five errors in FourthTwoComplete, three Columns and one split Gap. Five attempts belong to excluded mathematical module names: two timeouts each for `MarkovMiddleGap0_2M8AE` and `MarkovMiddleGap2_2M8AE`, and one error for `MarkovMiddleGap0_2_3M8AE`. The remaining timeout is BaseAudit. All rejected mathematical snapshots differ from their final archived source versions; BaseAudit's unchanged source remains unaccepted. Every snapshot matches its own receipt hash.

The foreground pipeline's completed event 211 records 67 child build summaries and eight **skipped**, uninvoked queue entries at its 900-second bound. Its result has 19 groups, eight true and eleven false; group status includes queue skips and is not an additional Lean invocation count. These bounded queue leftovers are separate from pending live processes. The final source inventory preserves the remaining gaps without completing them.

Every selected successful build matches the final source and saved source snapshot. Retained objects match index/archive/current/controller hashes. All matching builds precede their successful replay. Every ordinary receipt has a matching completed-event wrapper summary; all union receipts have matching full completed-event payloads.

## Replay ordering and wrapper versions

| Union selections | Receipt timestamp UTC | Duration | Completed event |
|---:|---|---:|---:|
| 12 | 20:02:09.868897 | 78.556 s | 95 |
| 16 | 20:12:06.245499 | 52.158 s | 163 |
| 48 | 20:20:40.011041 | 242.674 s | 220 |
| 15 | 20:22:45.285783 | 80.500 s | 236 |

There are **91 selections but 87 distinct targets**: four Base3 modules repeat with identical source hashes. All four unions succeed. The 48-target run's 242.674-second duration is consistent with the **earlier 300-second wrapper**, not the final 140-second wrapper. Events 224–225 preserve the earlier text as `evidence/markov-8ae35b59/replay-driver-before-final-bound.py`, then change only `timeout=300` to `timeout=140` before the last wave. Initial wrapper creation is recorded at events 34–35. The final wrapper must not be retroactively assigned to earlier invocations.

The preserved 300-second wrapper SHA256 is `3d081e9b7007526428fb0c8a20c29dd60fdb5bcff75aee47614e86ead9a010ea`. The driver algorithms are unchanged: batch SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; preserved direct-driver SHA256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. No direct replay was invoked here. The validator changes its temporary directory to `research/work-8ae35b59`; the receipts retain source snapshots and build outputs.

## Finalization and controller boundary

Finalizer event **242** succeeds after writing validation, regenerating the pending-candidate inventory, checking preservation and writing the final 528-file index. Its nested inventory script only classifies retained results; it does not run mathematical checks. There is one successful finalizer invocation and no failed finalizer/repair. Final verifier event **244** checks all 528 hashes, 87 selected source/replay/axiom bindings and 314 preserved inputs, then writes `last-verification.json`. Final report event **245** matches `final.json` and the controller report; event **246** is `turn.completed`.

| Boundary | UTC on 2026-10-15 |
|---|---|
| Controller start | 19:54:16.598663 |
| Last union receipt timestamp | 20:22:45.285783 |
| Validation mtime | 20:23:20.533414 |
| Artifact-index mtime | 20:23:23.403776 |
| Final-check mtime | 20:23:23.404044 |
| Last-verification mtime; latest changed project artifact | 20:23:30.986554 |
| Complete event-log mtime | 20:24:03.362589 |
| Activity recorded time | 20:24:03.968747 |
| `final.json` mtime | 20:24:04.315722 |
| Nominal 1800-second deadline | 20:24:16.598663 |
| Controller finish | 20:24:20.856557 |
| Controller receipt mtime | 20:24:20.857154 |

The activity record accounts for exactly **652,787 bytes**, the complete retained event log, which already contains the final report and turn completion. The final verifier output is 45.612109 seconds before the nominal deadline, complete event-log mtime is 13.236074 seconds before it, and `final.json` is 12.282941 seconds before it. Individual event lines do not contain independent wall-clock timestamps; this boundary conclusion relies on the full-byte activity record and retained file timestamps, rather than assigning an invented time to each event. Controller finish occurs later and remains accurately reported as over 1800 seconds. No changed project artifact is after deadline or finish. `completion` remains null and `mathematical_resolution` false.

All **304 worker 105 controller artifacts** match their original archive, before-106 hash and current file; none was changed by worker 106. All **301 reconciliation entries**, **314 initial hashes** and **314 preservation entries** match. These overlapping counts are not additive. Pinned root and established raw/canonical contract hashes agree. Earlier worker histories and excluded drafts are not retroactively promoted.

## Method limitations

Static imported bases for the four successful unions contain 5, 948, 976 and 27 resolved modules. They are transitively target-free at source level, with no explicit target/base name collision, duplicate selected name within a union or resolved source cycle. New imported dependencies have earlier successful replay coverage. Excluded drafts and unreplayed worker 103 Gap3 modules do not occur in these bases.

The complete replay-method note preserves the binary/import trust limits. Source hash and retained object binding do not measure actual invocation-time imported object bytes; generated/private constants and binary import tables were not independently enumerated. Matching imported theorem declarations can bypass proof-body replay, duplicate names can overwrite, unsafe/partial declarations are skipped, and axioms are admitted by the unchanged procedure. Static explicit-source checks found no target contamination here. Axiom printing is a separate check. No official LeanChecker CLI run, fresh entire inherited-source rebuild or full conjecture completion is established.

Machine-readable evidence: `markov_worker_000106_validation_evidence.json`; method support: `markov_worker_000106_replay_method.md` and `_evidence.json`.

The archived post-finalizer verifier output `evidence/markov-8ae35b59/last-verification.json` has SHA256 `be104c90cf812b3b38ee859033bec119c8afd9d61ba12bc54562f81e1a52d3df`.

Final support hashes: validation evidence `25d97887beeb86d3f41e06559b58596237efc90f9b9d0a3ecdc1910be46fe4ef`; method note `e62e08ef0ea3bf07835e71e33b020732f86a80e0cb07f42ad4f637b6a84f1371`; method evidence `85e22aaca6b08acdd47eb519987ffa9f91307bb47394e384ea456e5f33a29cae`. All **1,707 directly recorded inputs** were stable at **2026-10-15T20:33:45.119530Z**. The reused historical parsed import graph remains bound through predecessor evidence and worker 106 before hashes; no fresh inherited-tree rebuild was performed.
