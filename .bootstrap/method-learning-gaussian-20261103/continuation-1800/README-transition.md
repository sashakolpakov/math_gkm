# Prospective old600 → fresh1800 boundary transition

**NOT ACTIVE.** This directory contains preparation and neutral controls. Neither
writing these files nor running their synthetic tests requests a live transition.
The existing owner, profile, experiment, proof work, and mathematical goal are
unchanged.

`transition.py` has two modes. Ordinary inspection only reads source-qualified
public metadata and existing receipt hashes. It never takes locks or writes a
STOP. Its positive result is explicitly a *candidate*, not a qualified boundary.
Activation requires a separate source-bound operator activation file. The root
operator must review and authorize activation, retain the gate's actual tool
handle, and provide the old owner's actual owned-handle exit observation.

## What the fence proves

A finite status is insufficient: native `study.py:1235–1246` assigns it before
final evaluation and ablations, while the invocation retains its controller lock
through the whole operation (`:1301–1318`). The gate therefore does the following:

1. Authenticate unchanged old owner/config/qualification/600 profile, original
   contract and implementation, fresh1800 profile, and root handle registration.
2. Require both original arms to have actually reached their eight-round finite
   boundary. Require the current own exploration successor, if any, to have
   reached its corresponding finite boundary with a genuine complete migration
   chain. Every selected state is integrity checked by E1; every own job must
   have an actual numeric, registered, hash-bound receipt. Native `study.verify`
   additionally checks existing source, dependency, and admission receipts; it
   does not invoke a compiler or model.
3. Require no active/intended job, root resolution, pending curation/migration,
   unsettled command, pre-existing owner/study STOP, or unresolved cleanup hold.
   The current pointer must identify the same old owner and parent epoch.
4. Acquire that parent's controller lock **nonblocking**, then the shared heavy
   lock **nonblocking**. If either is busy, release any acquired lock and refuse
   without writing STOP. Revalidate all source, state, current-parent, receipt,
   and activation bindings while fenced.
5. Retain both locks, write a fresh immutable request, and exclusively create
   the old output's STOP with a reference/hash identifying that request. Existing
   STOP content is never overwritten. Ordinary SIGINT/SIGTERM are deferred only
   during this fenced waiting interval. If create/write/flush/fsync fails after
   publication might have become visible, the gate retains both fences until
   actual owner closure, then refuses a successful receipt. Any ordinary witness
   observation error during that interval also retains both fences.
6. Keep both locks until the root supplies a valid actual owned-tool-handle exit
   marker registered for this request. A missing, malformed (including any non-object JSON), premature, false,
   or wrong-handle marker keeps the gate waiting; it cannot release the fence.
   An actual nonzero exit is recorded as such, never rewritten to success.
7. After actual closure, revalidate unchanged original/parent states, old600
   profile and sources, all numeric receipts, and preserved operational bytes.
   Write `TRANSITION_FINISHED.json` only if those checks pass. Failure after
   actual closure releases the locks without emitting a successful transition.

The fence serializes original/current native runs, independent finalization and
migration. All current paid external roles enter `study_worker.execute`'s heavy
admission before their model Popen (`study_worker.py:182,219`). Leaf validators
enter `process.run`'s admission before `_run`'s Popen (`process.py:22,47`). Outer
`tree_only` watchdogs and the owner/curator wrappers can start unpaid setup; the
leaf role still requires heavy admission. The disabled legacy worker is not an
active alternative. These facts are scoped to the pinned implementation, not an
unrestricted host-process containment theorem.

The owner can race into unpaid curation setup outside the parent controller lock.
The held heavy lock prevents new paid work, but such a wrapper can close with a
nonzero exit. The gate retains and classifies all resulting command/receipt bytes.
It never replays or deletes that setup. A changed parent, incomplete wrapper exit,
or paid/uncertain finalization prevents a successful handoff. The gate does not
claim that every possible operational artifact finishes gracefully.

## Binding and operator-owned exit observation

A binding file has exactly these keys:

```json
{
  "schema": "math-gkm.gaussian-boundary-transition-binding.v1",
  "legacy_config": {"path": "ABSOLUTE", "sha256": "SHA256"},
  "legacy_output": "ABSOLUTE",
  "legacy_owner": {"path": "ABSOLUTE", "sha256": "SHA256"},
  "qualification": {"path": "ABSOLUTE", "sha256": "SHA256"},
  "new_profile": {"path": "ABSOLUTE", "sha256": "SHA256"},
  "registration": {"path": "ABSOLUTE", "sha256": "SHA256"},
  "implementation_sha256": "UNCHANGED_NATIVE_IMPLEMENTATION_DIGEST",
  "contract_sha256": "UNCHANGED_SEMANTIC_CONTRACT_DIGEST",
  "transition_source_sha256": "SHA256_OF_TRANSITION_PY"
}
```

Pins are byte hashes; contract identity is the native canonical semantic digest.
All paths remain under the owned math_gkm workspace. No old source or config is
edited. A registration is written by the operator **before requesting STOP**:

```json
{
  "schema": "math-gkm.gaussian-owner-handle-registration.v1",
  "legacy_output": "ABSOLUTE",
  "legacy_owner_source_sha256": "OLD_OWNER_SOURCE_SHA256",
  "owned_tool_handle": "THE_ROOTS_ACTUAL_OWNED_TOOL_HANDLE",
  "registered_at": 123.0,
  "exit_marker_path": "FRESH_ABSOLUTE_PATH"
}
```

An activation file must have schema
`math-gkm.gaussian-boundary-transition-activation.v1`, `activate: true`, the exact
`binding_sha256`, and `transition_source_sha256`. The registered exit path must
not already exist. After the root obtains the actual completion of its own old
owner tool handle, it exclusively writes:

```json
{
  "schema": "math-gkm.gaussian-owner-handle-exit.v1",
  "registration_sha256": "REGISTRATION_FILE_SHA256",
  "request_sha256": "ACTUAL_REQUEST_FILE_SHA256",
  "owned_tool_handle": "EXACT_REGISTERED_HANDLE",
  "actual_tool_handle_exit_observed": true,
  "returncode": 1,
  "observed_at": 124.0,
  "tool_completion_reference": "REFERENCE_TO_ACTUAL_OWNED_TOOL_COMPLETION"
}
```

This is an explicit operator trust interface: JSON flags cannot themselves prove
that a tool actually returned. The root must use its actual owned tool handle;
no PID query/adoption, saved PID, stale status, age heuristic, or fabricated EXIT
is accepted as the operational source of this witness. The gate itself never
queries or signals a process. The exit observation must follow the exact request
and its registration; the request's timestamp must follow registration.

No launch command is supplied here: activation is pending independent review and
root authorization. A default inspection remains read-only and does not wait for
or force a live boundary.

## Fresh-owner verification contract

The builder imports:

```python
verify_receipt(binding_path, receipt_path,
    expected_new_profile_sha256=...,
    expected_contract_sha256=...,
    expected_implementation_sha256=...)
```

It returns the exact `parent_study`, `original_comparison_study`,
`legacy_owner_source_sha256`, `legacy_profile_sha256`, `new_profile_sha256`,
`contract_sha256`, `implementation_sha256`, `actual_numeric_exit_observed`,
`transition_receipt_sha256`, and the preserved `old_stop_markers` map. It rechecks
actual evidence and current immutable parent state, not just boolean fields in
the finished receipt. A new owner must invoke it before bootstrap curation and
again before migration. The old600 protocol/costs remain closed history;1800 is
only a new successor allowance. The new owner needs a newly qualified status
reader/pointer; the old reader's pins must not be silently widened.

Old STOP markers are retained with their byte hashes and the exact operator
request. They are not silently removed, and no old run is started with `--resume`.
A genuine user goal-stop overrides this transfer; the operator must not label a
separate user stop as an approved transition.

## Deliberate limits

- Any paid, partial, nonempty standalone finalization ledger or completion pointer
  is refused, because the fresh owner currently cannot safely import that paid
  state. Harmless zero-attempt `no_eligible_current_exact_root` summaries are
  allowed only with matching source/implementation pins and their own closed
  rc0 finalization commands. This limitation prevents dropping or replaying paid
  audits; it does not invalidate a proof or classify a mathematical failure.
- Operational evidence is hashed, preserved in place, and bound in the receipt;
  it is not decoded as mathematical/reviewer/model payloads or copied into a
  new model request. The source-only gate retains no compiled outputs.
- Inventory limits are10,000 files/1GiB, checked serially with streaming hashes.
  Exceeding these limits refuses handoff; it is not permission to delete evidence.
- Once STOP is requested, the supervisor must keep the fence process alive until
  actual closure. Deferred ordinary signals do not protect against machine
  failure or SIGKILL. A lost gate requires explicit reconciliation, not replay.
- Neutral tests substitute native dependency/source verification and the actual
  tool-return witness. They exercise real E1 metadata, file hashes, locks and
  transition control flow. They are not live qualification, new Lean checks,
  mathematical results, or evidence of a method-learning advantage.


## Optional prospective boundary watcher

`watch_transition.py` wraps the unchanged gate. Its default inspection and help
remain read-only. Activated watching additionally requires the approval file's
`watch_source_sha256` to equal the exact watcher source. Binding, gate, watcher
and approval hashes are checked before every attempt. Polling defaults to one
second; its bounded waiting allowance applies only **between** attempts. Once
the gate enters a fenced STOP wait, no watcher deadline cancels or interrupts it.

The watcher retries a narrow set of pre-request finite-epoch/admission/pending
transition refusals. It also waits for an exact own research/recover wrapper
intent in its matching source-qualified running phase to acquire its actual
numeric EXIT before attempting Gate; a finite state flag alone is insufficient.
Open finalizers and mismatched/uncertain command intents are not hidden by that
wait. Cheap E1/public guards reject root resolution, user STOP,
cleanup holds, changed source/bindings and paid or uncertain finalizer history
before an earlier transient can hide them. Any transition output created during
a failed attempt ends all retries and retains the artifacts. There is one
constant-size status result, with no per-attempt log or archive. A direct owned
caffeinate keeper exists only during explicitly activated watching and is closed
in `finally`. The watcher never launches a new owner or mathematical process.
