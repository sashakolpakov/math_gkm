# Source-only goal-continuation recovery packet

This packet preserves the reviewed operations code, fixtures, review/test evidence,
activation provenance and monitoring-instruction changes from 2026-10-19. It adds
no mathematical results. The original conjecture remained open at this checkpoint.

The packet contains **no private evaluation task bodies or curator payloads,
answers, evaluator outputs, credentials, active proofs, compiled dependencies,
model caches, live process registry, lock, STOP file, active event log or research
archive**. Activation checks are historical observations with explicit timestamps;
their PIDs and memory figures are not present-time status.

The manifest binds every payload and restoration file by SHA-256 and byte count.
The manifest itself is bound by its Git object and the review supplied by the
publishing supervisor. Verification never invokes Lean, a model or a shell child.

## Exact source recovery

Use the pinned parent math_gkm source/reproduction checkout. The reviewed frozen
implementation digest is
01a5f6e6644d8b5ebbb199efba27bef2f65cf0dfe4e0413d48742d4d4effac89.
That checkout must independently provide the unchanged machinery, root contract,
Lean/Mathlib pins and dependencies described in the existing source/repro packet:
evidence/adapter017-restart-validation-20261019. This small packet does not vendor
those dependencies or claim to replace their verification.

From /Users/sasha/math_gkm:

    PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 evidence/goal-continuation-20261019/restore.py verify-packet
    PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 evidence/goal-continuation-20261019/restore.py check --root /Users/sasha/math_gkm

The check command reports absent or conflicting canonical files without editing
anything. After reviewing the manifest and selecting the intended checkout,
restore missing files:

    PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 evidence/goal-continuation-20261019/restore.py restore --root /Users/sasha/math_gkm

Existing matching files remain intact. Any different existing file aborts the
whole restoration before a copy. File creation is exclusive, and destination
symlinks escaping the selected root are rejected. No source, live control file,
process or user configuration is overwritten. Operational source and fixtures
return to the exact canonical .bootstrap/paired-v3-restart-20261019 paths.
Historical activation/install/old-review metadata is restored only under
.bootstrap/paired-v3-restart-20261019/preserved-goal-continuation-metadata, so it
cannot masquerade as a fresh launch record. Manifest restore_to entries specify
every destination explicitly. The packet's SAFE_METADATA_PLAN.json is archival.

## Reproduce operational checks

After restoration:

    PYTHONDONTWRITEBYTECODE=1 /opt/homebrew/bin/python3 -B .bootstrap/paired-v3-restart-20261019/goal-continuation/test_continue_machine.py

All 21 fixtures use temporary files and mocked external boundaries. They run no
Lean, model, mathematical problem, real freeze or research action. The exact
original test result, log and independent REVIEW.json are preserved. A new run
is fresh observational evidence; it does not rewrite their historical hashes or
approve a live launch. See the restored goal-continuation/README.md for the
specific covered properties and limitations.

The source-only restore utility can also be checked in an empty temporary root:
restore there, run check there, and confirm that a deliberately conflicting file
is rejected without being overwritten. This does not initialize research state.

## Live inputs are intentionally separate

A functional continuation of an **existing run** also requires its exact original
paired study's sealed protocol, root contract, source snapshots, own exploration
state/history, accepted FINISHED validator bundles and terminal operator records.
The official evaluator requires the original frozen private panel and retained
curator provenance as its ordinary private inputs. No observer should open those
bodies to restore or monitor this packet. Their sealed identities, input counts
and operational exclusion rules are recorded here; their contents are not public
payloads. This packet is therefore **not a self-contained replay of research**.
Do not fake a missing parent state or substitute a new evaluator panel under an
old seal. Preserve original studies as required by the continuation provenance,
especially immutable pending-discovery original bundles, until ordinary paid
rechecks remove their declared dependencies.

For a fresh experiment, establish its own reviewed setup and independently sealed
inputs using the existing machinery. This source packet does not authorize a
fresh campaign, replace missing parent evidence or certify any mathematics.

## Activation and monitoring

Restoration starts no process, creates no STATUS.json, installs no LaunchAgent,
queues no conversation message and creates no study authorization. On a clean
recovery, independent review must inspect current process handles, original
terminal state, deployment checks, resources and any cleanup holds before live
activation. Confirm source/test/review hashes and obtain the normal separately
reviewed activation. The historical activation record explicitly describes
ordinary opaque evaluator-panel handling and is not reusable permission.

The canonical reviewed launch is documented in the restored README. It waits for
the original paired study and its operator to close, then creates distinct
own-history successor epochs with the same independent gpt-6.1-sol/high proposer.
It never supplies mathematical advice. An independent operator milestone audit,
not a worker report or fixture result, is required to conclude that a nontrivial
log-concavity case has actually been proved.

The 30-minute helper, normal LaunchAgent plist and current/before instruction
texts are preserved. Historical install/idle-delivery reviews are archival. Do
not automatically install the plist on another machine or reuse its conversation
identifier as a new destination: review the authenticated current conversation,
local paths and an actual idle-delivery test first. Existing user authorization
and approved installation rules govern any new live delivery. Restore itself
never loads launchd, queues a message, clears a pending callback or disables a
current timer.
