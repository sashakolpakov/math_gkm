# Worker 000107 retained validation audit

Request `8b851864e2a148b2a2642ba6713f61c4`; controller `/Users/sasha/math_gkm/.control/markov/workers/000107`. Archive-first static source, receipt, event and hash inspection, plus the specifically identified late receipt. No project code, Lean/checker/replay, experiment, finalizer or missing check was executed; no project file was changed. Mathematical scope and finite inputs are reviewed separately by the parent audit.

## Exact retained scope

The archive supports **239 distinct successful mathematical builds**, containing **1,013 named theorems and 170 definitions**. Of these, **216 modules / 956 theorems / 153 definitions** have explicit successful replay receipts in the worker 107 archive. This supersedes the mid-run checkpoint of 149 replayed modules.

At the archived cutoff **23 mathematical modules / 57 theorems** are compilation-only: 22 Five gap/chamber modules (52 theorems, 17 definitions) plus `MarkovFourthFourCompleteM8B8` (five theorems, no definitions). A separately retained successful late union covers the 22 Five modules, but was written after both deadline and controller finish and is absent from the worker archive. It does not revise the historical 216-module scope. Even counting that later observation separately, FourthFourComplete remains without explicit replay.

The archive contains **244 new Lean sources**: 239 successfully compiled mathematical sources, four successfully compiled Audit sources, and one unbuilt mathematical draft, `MarkovResidualFourM8B8`. There is no inherited explicit target or recovery replay. Eight of the 216 archived replay targets are import-only shims (`MiddleGap0_0` through `0_3` and `MiddleGap2_0` through `2_3`, suffix M8B8), with no local explicit declarations.

All **1,055 controller artifacts** match archived and current bytes. All final accepted source/build snapshots and retained objects bind through their successful receipts, archive and controller hashes. There is **no aggregate artifact index or validation.json**. The only current worker-scope file absent from the archive/controller is the identified late union receipt.

## Public module status

| Module (suffix M8B8) | Matching final build | Archived explicit replay | Direct printed axioms |
|---|---|---|---|
| FourthAll | Yes | Yes: union `1792097269960523000` | Its one theorem |
| OnsetWindowLC | Yes | Yes: same union | Its one theorem |
| FourthSixComplete | Yes | Yes: union `1792097423360703000` | All three theorems |
| Residual | Yes | Yes: same union | Its one theorem |
| ResidualSix | Yes | Yes: same union | Its one theorem |
| ResidualWindow | Yes | Yes: same union | Its one theorem |
| FourthFourComplete | Yes, completed event 254 | **None, including the late union** | **None of its five names** |
| ResidualFour | **No object or build receipt** | None | None |

FourthFourComplete's five names are `source_finalFourM8B8`, `run_fourth_fourM8B8`, `source_finalFiveM8B8`, `run_fourth_fiveM8B8`, and `run_fourth_ge_fourM8B8`. Its dependencies' replay coverage is not an explicit replay of this module. FinalAudit's inventory was generated for 238 mathematical modules before this final successful build; its omission is an inventory/validation boundary, not a completed check.

## Axioms, attempts and cutoff inventory

Four successful Audit builds print **814, 893, 956 and 1,008 names**, respectively: **3,671 output rows / 1,008 distinct names**. FinalAudit's 1,008 names exactly cover the 216 archived replay targets plus the 22 late targets. All source requests and printed outputs agree and use only `propext`, `Classical.choice`, and/or `Quot.sound`. FourthFourComplete's five names are the only missing printed closures among the successfully compiled mathematical sources. Audit compilation does not confer replay coverage.

There are **264 completed validation records in the archive**: 254 builds and ten successful unions. Builds comprise 243 successes (239 math + four Audit) and 11 compiler errors; no compiler timeout, skipped-build receipt, or interrupted Lean outcome is retained. All 11 failures belong to older source versions of ultimately successful module names, and their saved snapshots match their own receipt hashes. One additional replay was launched before cutoff and produced the separate late receipt, bringing observed invocations to 265 while keeping archived completions at 264.

All selected successful build hashes match archived final sources and saved snapshots. Matching builds precede every explicit successful replay, including the separately observed late group. Ordinary event summaries match the validator's 1,800-character error previews; complete output remains in the receipts. Every archived union has a matching completed event summary. No older rejected version is promoted by a later success under the same module name.

## Replay groups and parallel dependency ordering

The first six successful unions cover **149 modules / 814 theorems / 97 definitions**. A five-module union adds eight theorems and seven definitions. Three further unions of 25, 25 and 12 targets add **62 modules / 134 theorems / 49 definitions**, yielding the final archived total of 216. All ten target sets are disjoint. Their completed events are 197 (first six), 207 (five), and 240 (last three).

The new batch wrapper topologically sorts source dependencies, groups at 25 modules and runs groups with **two parallel workers**. Topological position does not guarantee that an earlier dependency's replay has finished before a dependent invocation starts. Receipt-duration estimates show the 24-target group starting while 19 imported new-module replays were unfinished, and the 12-target Four source/chamber group starting while 25 were unfinished. Every such dependency later succeeded within the archived 216. Thus final archived dependency coverage is complete, but the wrapper's stronger “earlier checked before invocation” description needs this qualification.

Static imported bases for the ten archived groups, in receipt-time order, contain 497 / 561 / 12 / 589 / 1114 / 667 / 1186 / 493 / 550 / 593 resolved modules; the late group has 568. Each is transitively target-free at source level, with no explicit target/base name collision, duplicate target within a union or resolved source cycle. No late-only target, FourthFourComplete, ResidualFour, Audit module, worker 106 excluded draft or unreplayed worker 103 Gap3 module enters those successful bases. Imported earlier modules are not additional explicit replay targets.

## Late receipt and preserved bytes

Original: `/Users/sasha/math_gkm/evidence/markov-8b851864/kernel-union-1792097744398600000.json`.

Byte-for-byte snapshot: `/private/tmp/math_gkm_godel_20261013/markov_worker_000107_late_evidence/kernel-union-1792097744398600000.json`.

Both SHA256: `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`.

The successful receipt selects 22 Five chamber/gap modules and reports duration 71.9337565000169 seconds. All target source hashes match their archived sources and successful pre-replay builds; its target order matches the saved final replay plan. Launch event **251** is retained without a completed event. The receipt was written **20:55:44.399240 UTC**, **52.598203 seconds after the nominal deadline** and **17.839857 seconds after controller finish**. It is absent from controller changes and archive. The archive is unchanged; this separately preserved observation is not backfilled into it.

## Timeout and missing finalization

| Boundary | UTC on 2026-10-15 |
|---|---|
| Controller start | 20:24:51.801037 |
| Last archived union receipt timestamp | 20:53:34.211582 |
| Late union estimated start | 20:54:32.464844 |
| FinalAudit successful build estimated return | 20:54:44.649823 |
| FourthFourComplete successful build receipt mtime; latest archived project artifact | 20:54:47.961592 |
| Archived event-log mtime | 20:54:47.971386 |
| Activity recorded time | 20:54:51.610199 |
| Nominal 1800-second deadline | 20:54:51.801037 |
| Controller finish | 20:55:26.559383 |
| Late union receipt mtime | 20:55:44.399240 |

The controller outcome is **timeout**, elapsed **1834.7583470344543 seconds**, return code 0, report null. There is no final.json, final agent report or turn.completed. The last activity record accounts for the complete **1,768,247-byte** event log, which ends with the two successful build completions and retains the unfinished replay launch. Individual events lack independent wall timestamps; duration-derived endpoints are estimates. No archived project artifact is after the nominal deadline, while the late receipt is explicitly outside that boundary.

`finalize_8b851864.py` exists but has no retained invocation. There is no validation.json, artifact-verification.json, preservation.json, pending-candidates.json, operational-observations.json, final-check.json or last-verification.json. This audit's reconstructed inventories are saved only under `/private/tmp`; missing worker finalization was not completed or repaired. The outer replay command remains incomplete in the archived event stream even though the late child receipt reports success.

All **531 worker 106 controller artifacts** match their original archive, before-107 hashes and current files; none was changed by worker 107. The **528 saved reconciliation entries** and **541 initial hashes** also match independently. This does not imply a worker 107 final preservation pass occurred; no such output exists. The pinned root and established raw/canonical contract hashes match.

## Method limits

The batch and direct drivers retain SHA256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` and `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. No direct replay was invoked here. The final validator defaults to 150 seconds; the final union wrapper uses 300 seconds and displays only the final 1,000 stdout characters while retaining complete output in JSON. The batch wrapper adds hash-sensitive unreplayed filtering and parallel scheduling. Creation metadata does not establish each invocation's exact wrapper bytes; no stronger version claim is made.

Static source-import checks do not independently reconstruct compiled import tables, generated/private constants or invocation-time object bytes. Retained object/source hashes and printed axiom closures are separate from replay policy. The unchanged Lean.Replay procedure can skip already-imported matching theorem bodies, overwrite duplicate keys, skip unsafe/partial declarations and admit axioms; static checks found no relevant target contamination. Inherited binaries remain trusted. No official LeanChecker CLI run, fresh whole-source rebuild, retroactive worker completion or full conjecture conclusion is established.

Support: `markov_worker_000107_validation_evidence.json`, `markov_worker_000107_replay_method.md`, and `_replay_method_evidence.json`, plus the separate late-receipt snapshot above.

Final support hashes: validation evidence `b1e74163aeed9f05d9a3da8d807c732b4daf4cc4f3a8a899e1a869c60209508c`; method note `120e47819e8e004f5fd9822685fa6d09d1fb57955b775a1dd9c1e0b2e7c705e8`; method evidence `9a15d34a936936a5f6b32acf2f3af521a6f47fea097dc0d843e1d65375cde419`. All **3,211 directly recorded inputs** were stable at **2026-10-15T21:04:47.988203Z**. The reused historical parsed graph is bound through predecessor evidence and before-107 hashes; no fresh inherited-tree rebuild was performed.
