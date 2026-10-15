# Worker 000085 validation audit

Read-only static audit of timed-out request `01f51d63cfb342788663ad652d76ab8c` in `/Users/sasha/math_gkm`. No project code, Lean, replay, experiment or finalizer was executed. No project/archive file was changed, no missing check was completed and no successor was inspected. Mathematical scope is audited separately.

**Retained matching receipts establish successful compilation and alternate kernel replay of 14 mathematical modules plus the Audit module, with all 94 named theorem closures directly printed and permitted. The final Audit replay completed just before the deadline. The finalizer was never invoked: its aggregate validation, preservation and manifest outputs are absent.** The timeout therefore did not interrupt a retained mathematical replay, but it did leave finalization and a final response unfinished.

## Controller/archive binding and reconstructed module coverage

All **117** controller `receipt.json` after-hashes match both current and timeout-archive bytes. These cover 89 evidence files, 15 final Lean sources and 13 other research files. All final source/object pairs and retained attempt snapshots match. No current worker-85 file is outside the controller archive and no later mutation was found. The named temporary directory is empty.

There is **no worker artifact manifest** to compare. The companion audit evidence reconstructs matching records from the retained source files, receipts and controller archive; it is not a worker `validation.json` and does not manufacture a missing worker finalization result.

The **32 ordinary receipts** comprise 15 successful builds, 15 failed builds and two successful individual replays, with no recorded timeout. The 15 successful builds are exactly the 14 mathematical modules and `MarkovAudit01F`; there are no extra successful source versions. Every failed module has a later successful build of its final source. All 32 recorded source hashes equal their saved snapshots, and all reconstructed final build/replay hashes equal the final archived sources.

Every ordinary receipt payload matches its completed controller event, allowing the validator's exact stdout/stderr truncation at 8,000 characters. The union receipt likewise matches its completed event. Shell or batch exit status is not substituted for the individual receipt's return code.

Replay coverage is:

| Retained operation | Coverage | Completed event |
|---|---|---:|
| `kernel-union-1792060243873119000.json` | 13 mathematical modules, 87 named theorems | 245 |
| `run-MarkovFourthConditional01F-replay-1792060249857554000.json` | Conditional module, seven further named theorems | 251 |
| `run-MarkovAudit01F-replay-1792060305068644000.json` | Operational Audit module | 263 |

All three record return code 0 and explicit successful replay output. Every final target build precedes its replay. Thus “15 final sources” means **14 mathematical modules plus Audit**, not 15 mathematical modules. The union alone covers 13; the separate Conditional replay is necessary for the final mathematical count.

Final object bytes are bound by current/archive/controller hashes and the build/replay chronology. No invocation-time object digest is recorded. The lack of a worker manifest does not erase the controller hash bindings, but it must not be described as a passed manifest verification.

## Axiom coverage and failed attempts

The final Audit source SHA-256 is `27807d28b586044af4d9b6f833f5fa24e4a7b2a1a07776425c0bcadbee7f8b7a`; the build and replay snapshots match it. Its successful build is `run-MarkovAudit01F-build-1792060249857528000.json` at event 250. The full receipt prints **94** named theorem axiom closures. The set exactly equals the mathematical source declarations, inventory and Audit's explicit `#print axioms` requests. All lists are subsets of `propext`, `Classical.choice`, `Quot.sound`; there are no extra axioms. The event's truncated stdout is not the complete axiom inventory; the retained full receipt is.

The Conditional source SHA-256 is `d6243db44755c176a2d87c200027058ef594351b79421a5a9bc24ea0dc846660`. Its matching build and individual replay are separate from the Audit. The Audit source contains imports and print commands, with no explicit new mathematical declaration; replaying it does not recheck imported mathematics. The successful union and Conditional receipts provide that separate coverage.

All 15 rejected Lean attempts returned code 1 rather than timing out. They include a generator syntax-error episode retained at event 184, followed by six unsuccessful builds of stale low-chamber sources. The generator/source repairs are followed by successful matching final builds. Durations exceeding 100 seconds for some attempts do not make them timeout records: those attempts used their recorded explicit limits and returned code 1. No rejected attempt counts toward accepted final-source coverage.

The draft finalizer contains notes about these failures but did not write `operational-observations.json`. Its unexecuted token scan is not treated as a completed check. Independent static declaration scanning found no explicit custom axiom, opaque, unsafe-definition/theorem or partial-definition declaration. The Conditional file's textual `axiom` occurrence is documentation, not a declaration. Direct printed closure results provide the named-theorem axiom evidence.

## Replay method and imported boundary

Both drivers match worker 85's before-state:

- `ReplayKnown6d2c.lean`: `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`.
- `ReplayBatch07F1.lean`: `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

The union receipt also carries the batch-driver digest. Its wrapper hashes sources before replay, asserts successful builds with those digests, invokes the unchanged batch driver and records the driver digest afterwards. All recorded target hashes match final archived sources.

These are alternate Lean replay procedures, distinct from ordinary compilation and the official `leanchecker` CLI. The batch unions all constants in each selected object's most-private available part, removes selected names from direct imports and invokes `env.replay`. The 13 targets contain 87 explicit theorems and 32 definitions; the procedure is not limited to that public theorem list. Lean.Replay invokes kernel checks for safe nonpartial declarations; unsafe/partial declarations are skipped, axioms are admitted as axioms, and already imported equal theorems can skip proof-body comparison. Pending dependency recursion does not insert unfinished proofs as assumptions. The separate axiom audit remains relevant.

The delegated static review finds no target-source mismatch, selected-module import contamination, explicit-name collision or duplicate, source import cycle or retained-source baseline mismatch. The union's local base-source closure has **83** modules. Conditional's individual replay base has **93**, including ten earlier worker-85 modules, but excludes Conditional itself and its explicit declaration names. Audit's base has **97** local modules. The source graphs therefore reveal no imported-target shortcut for the mathematical replays.

Actual compiled import tables and private/generated-constant inventories were not dumped. External Mathlib imports and inherited compiled objects remain the trust boundary. These records do not establish invocation-time object measurements or a fresh whole-source rebuild. The companion method note states the exact limits.

## Timeout boundary and missing finalization

The finalizer was authored, edited and read in events, but there is **no invocation** of it. The following files are absent from both current evidence and the timeout archive:

- `validation.json`
- `preservation.json`
- `operational-observations.json`
- `artifacts.json`
- `artifact-verification.json`

There is no worker finalizer success, failed finalizer invocation or partial finalizer-output write to claim. The checkpoint's statement that these outputs “are written by” the script describes intended behavior, not evidence of completed finalization. Its claim that Audit replay remained pending became stale when event 263 completed successfully. No `final.json`, final agent response or `turn.completed` is retained; the controller report is null.

The final Audit replay receipt was written at **2026-10-15 10:32:13.119152 UTC**. Its start stamp plus recorded duration gives completion approximately **10:32:13.118373**. The final completed event-log mtime is **10:32:13.131215**, **3.889362 seconds before** the **10:32:17.020577** deadline. The host recorded timeout at **10:32:22.087577**, elapsed **1805.067000 seconds**. The final replay belongs inside the timeout archive; it is not a late unarchived success.

There are no unmatched started items. The intended finalization remains unfinished, but no retained command is still pending. No late/unarchived worker-85 artifact was found.

The **88** initial reconciliation comparisons still match. This auditor also compared the **97** saved initial-input hashes to current files, all matching, including the pinned root and raw/canonical contract hashes. This is an audit-only static comparison, not the missing worker preservation receipt, and it was not written into the project.

Companion evidence: `/private/tmp/math_gkm_godel_20261013/markov_worker_000085_validation_evidence.json`, containing the audit-only reconstructed selection, exact receipt/event/controller comparisons and **345 input hashes**, rechecked stable at its recorded timestamp. Method note: `/private/tmp/math_gkm_godel_20261013/markov_worker_000085_replay_method.md`; its companion evidence contains 106 input hashes and source-closure graphs. No missing worker check or finalizer action was completed by this audit.
