# Worker 000108 retained validation audit

Request `38ebef17ca8b4ee9b725755d9dcec986`. Read-only audit of the archived worker, retained receipts/events, and matching current bytes. No project code, Lean, replay, experiment, finalizer or missing check was executed; no project writes, proposer contact or successor inspection occurred. Mathematical scope is assessed separately by the main audit.

## Result and exact scope

All **56 new mathematical modules**, containing **385 named theorem declarations and 304 definitions**, have final-source-matching successful builds and explicit successful alternate kernel-replay selections. There are no compiled-only modules within this selected new inventory. Four new public modules are included: `MarkovResidualFourM38E`, `MarkovFourthAllM38E`, `MarkovResidualAllM38E`, and `MarkovFourthGapM38E`. The numeric residual draft `MarkovResidualSmallGapM38E` timed out, has no object or successful build/replay, and is excluded. Its final source matches the timeout snapshot. The checked root equivalence is the explicit solved-region version; this audit does not accept the numeric residual draft.

| New selected family | Modules | Named theorems | Definitions |
|---|---:|---:|---:|
| SmallQuot coefficient modules | 24 | 72 | 48 |
| SmallLC certificate modules | 24 | 300 | 252 |
| SmallRun source adapters | 4 | 8 | 0 |
| Public composition/residual modules | 4 | 5 | 4 |
| Total | 56 | 385 | 304 |

The 62 archived new Lean sources comprise those 56 mathematical modules, the one excluded mathematical draft, and five Audit sources. Three Audits compiled; ProgressAudit and SecondAudit have inventories/plans but no successful build or object. No Audit module is a replay target. There are no definition-only or import-only modules among the selected 56.

## Attempts, versions and closures

There are **93 completed validation invocations**: 85 ordinary build receipts and eight union receipts. The builds are 60 successes (56 new math + three Audits + one unchanged inherited rebuild), 24 errors on superseded source versions, and one timeout on the excluded numeric residual. The unions are seven successes and one failure. Thus the retained 26 rejected attempts are exactly 24 errors + one timeout + one failed union; no interruption or skipped invocation is hidden in this count. All 85 attempt snapshots and receipt outputs bind to the retained controller events; every successful selected build precedes its matching union invocation under receipt-stamp timing. All 24 erroneous build sources differ from final accepted source bytes.

The seven successful unions select 76 module occurrences, 57 distinct targets: the 56 new modules plus inherited `MarkovFourthFourCompleteM8B8`. Nineteen new targets occur twice. There are no direct-replay invocations. The failed 25-target union selected inherited `MarkovFullChamber0FA` alongside 24 new Quot modules and failed with duplicate declaration `MathGKM.Markov.chamberH02FA`. That module was transitively reintroduced by the imported base. The corrected successful Quot union excludes it; no worker 108 replay success is credited to the inherited chamber. Its unchanged source was successfully rebuilt in worker 108, remains imported, and is outside the 56 new modules.

Successful Audit outputs exactly match their requested names: `MarkovRecoveryAuditM38E` prints five names, `MarkovThirdAuditM38E` 386, and `MarkovFinalAuditM38E` 388. These are **779 printed rows and 393 distinct closures = 385 new names + five FourComplete recovery names + three inherited FullChamber0FA names**. Every selected new named theorem is directly printed, including certificate helpers. All reported axiom sets are subsets of `propext`, `Classical.choice`, `Quot.sound`; none is missing or extra relative to that partition. The final Audit inventory's 57 modules/388 names includes the inherited chamber, whereas validation's 56 modules excludes it. Printed closure coverage and selected replay scope are distinct.

## Recovery and worker 107's historical boundary

The 239-row `recovered-validation.json` is a combined inventory, not 239 fresh 108 replays. It partitions exactly as **216 worker 107 archived replay targets + 22 worker 107 late targets + one newly replayed in worker 108 recovery target**. Its 1013 axiom names equal the old 107 1008 names plus the five new RecoveryAudit prints. All 239 final source/build/snapshot/object bindings match their historical worker 107 archive and controller, current bytes and worker 108 before-map source hashes.

Only `MarkovFourthFourCompleteM8B8` receives a new 108 replay, in the two-target union `kernel-union-1792098174649549000.json` with `MarkovResidualFourM38E`; its successful receipt is timestamped 21:02:54.649549Z. The five missing closure prints subsequently return successfully. The inherited FourComplete compilation remains a worker 107 build; worker 108 does not rebuild it. The old unbuilt `MarkovResidualFourM8B8` draft stays outside recovery and successful import bases.

The known late receipt `evidence/markov-8b851864/kernel-union-1792097744398600000.json` is reused for 22 targets. Its bytes match worker 108’s `before.json` and the independently preserved [late receipt snapshot](/private/tmp/math_gkm_godel_20261013/markov_worker_000107_late_evidence/kernel-union-1792097744398600000.json), SHA256 `66ecffb1baecb754015b125b7fa1a21533cdf07faf1ec302db65ed4c490ddb59`. It is absent from **both 107 and 108 artifact archives**, and from 108’s 1596-entry initial-hashes/preservation list. Its known mtime is 20:55:44.399240Z, after worker 107’s deadline and finish. Worker 108’s before-map binds the bytes but its finalizer does not newly preserve that receipt. No historical worker 107 cutoff status is rewritten, and these 22 are not new 108 selections.

## Hash and object bindings

All **344 controller-recorded artifacts** match archived and current bytes. All **341 final manifest entries** also match the controller hashes. The exact three controller artifacts omitted from that manifest are:

- `evidence/markov-38ebef17/artifact-verification.json` (the index itself);
- `evidence/markov-38ebef17/final-check.json` (the subsequent summary);
- `research/work-38ebef17/MarkovSmallQuot0_0-attempt2.lean` (nested retained attempt source).

Final validation source hashes, theorem inventories, selected build receipts, immutable attempt snapshots, recorded selected object hashes, and replay module/hash maps all agree. The three Audit objects and inherited chamber's new object are controller/index bound as well. Final object hashes describe retained output bytes; they are not per-invocation measurements of objects actually loaded.

All 1596 initial/preservation entries and 1055 predecessor reconciliation/controller artifacts remain unchanged. Both replay drivers match worker 108’s before-map and the pinned hashes; the pinned root remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. Contract raw/canonical bindings also match. The independent evidence's mismatch lists are empty. No extra current worker 108 evidence/source file was found outside the recorded archive, and no project artifact is later than the deadline or final-check.

## Method qualification

The [separate method note](/private/tmp/math_gkm_godel_20261013/markov_worker_000108_replay_method.md) statically resolves 1344 source nodes and separates the contaminated failed union from all seven successful unions. Successful unions have transitively target-free source import bases, no explicit selected/base declaration collision and no resolved-source cycle. Their local base sizes are 1272/1301/180/1295/1308/1334/1336 in receipt order. All imported new mathematical modules eventually have successful selected replay coverage.

The parallel batch scheduler does not require a dependency's replay to have finished before a dependent replay begins: one successful 19-target group starts before 18 imported Quot modules have successful replays, and another 25-target group starts with 25 dependency replays unfinished. Those dependencies later succeed. Accordingly, final coverage is complete for the selected new inventory, but 'all dependencies already replayed before every invocation' would be false.

`ReplayBatch07F1` remains `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; `ReplayKnown6d2c` remains `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The batch filter was corrected to select suffix `M38E` modules. Pre-run source hashes and post-run driver hashes are retained, but final wrapper bytes are not invocation-time wrapper measurements. The source graph does not independently reconstruct binary import headers, generated/private declarations, or loaded object identity. Inherited compiled imports remain trusted. This is alternate replay of selected declarations, distinct from compilation, named axiom printing, official CLI verification, and a fresh whole-tree rebuild.

## Finalization and timeout chronology

All times below are UTC on 2026-10-15. Build return times are estimates from attempt stamps plus elapsed duration; event lines themselves lack wall-clock timestamps.

| Retained boundary | Time / status |
|---|---|
| Controller start |20:56:11.553645Z |
| Last successful union, FourthGap |21:24:07.574890Z; event 295, return code 0 |
| Excluded numeric residual build return estimate |21:24:37.728496Z; event 303, timeout |
| Final Audit return estimate |21:25:22.917860Z; event 306, return code 0 |
| Validation file mtime |21:25:35.989139Z |
| Artifact index mtime |21:25:46.552066Z |
| Final-check mtime, latest project artifact |21:25:46.552465Z |
| Complete event-log mtime |21:25:46.602924Z; last event 311 is successful finalizer return |
| Last activity record |21:26:11.048770Z; all 849134 event bytes accounted for |
| Nominal 1800-second deadline |21:26:11.553645Z |
| Controller finish |21:26:42.997672Z; timeout, elapsed 1831.444026708603 seconds |

The one retained finalizer invocation is events 310–311, return code 0; its exact output matches final-check. It completed approximately 25 seconds before the nominal deadline. There are no unmatched started commands, no later project writes, and no current extra worker 108 receipt. Archive-copy mtimes occur later during preservation and are not evidence of late validation execution.

The controller still records **timeout**, `report:null`, `returncode: 0` and `mathematical_resolution: false`. There is no final.json, final agent report or turn.completed event. Successful local finalization is therefore established independently of the absent final agent report. The timeout does not invalidate earlier retained passes, and it does not complete the rejected numeric residual.

## Supporting evidence

- [Validation evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000108_validation_evidence.json), SHA256 `e2aaba89f10b2b0d340d63734ca152949acdf00e4e94322c1dc7907d41176dbe`.
- [Method note](/private/tmp/math_gkm_godel_20261013/markov_worker_000108_replay_method.md), SHA256 `015077f3df9b6f3ff70dffdbb53703d94da36e7f96c0431908553dd848a6fd76`.
- [Method evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000108_replay_method_evidence.json), SHA256 `78c9a5542e0f3f242a8469a69ebb635353649e299c6860ad16e4f4d3609d95ea`.

Final read-only input-stability check: 3370 hashed inputs, zero changes at 2026-10-15T21:36:08.479798+00:00. This note supplies validation/provenance findings only, with no mathematical advice or repair.
