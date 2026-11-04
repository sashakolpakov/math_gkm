# Inactive closed-round goal coordinator

This candidate resumes the existing first Gaussian successor after a separately
verified reconciliation of its interrupted round 8. It does not launch that
reconciliation itself. The full coefficientwise-positivity goal remains open;
finishing this operational round is not a proof or a new mathematical admission.
Only ROOT may qualify and launch a new owned coordinator after the old owner has
actually closed and the reconciliation has a genuine immutable FINISHED record.

`coordinator.py` reuses the exact prepared owner component
`cd254726ec500b27b277d27254faab09b76b2b94a58e4919a1542a5e377b4385`
and its original configuration, with `initial=False`. That component retains
its identity, including inherited curator context records. The new coordinator
has a separate source identity in its configuration, CURRENT, checkpoint,
CONTINUATION_ADOPTION and per-command source-binding records. Boundary STOP
requests must bind the actual coordinator source. No module hash or global
configuration is changed to impersonate an older owner.

The exact configuration keys are `schema`, `owner_source_sha256`,
`component_source`, `component_config`, `reconciliation_source`,
`reconciliation_output`, `reconciliation_finished`, `study`,
`migration_finished`, and `migration_provenance`. File references have exactly
`path` and `sha256`. The schema is `math-gkm.gaussian-closed-round-owner.v1`.
ROOT supplies a fresh configuration after reconciliation, pinning its FINISHED
record and the existing epoch1 migration marker/provenance. There is no automatic
configuration or authorization generation.

Initial admission checks that the current epoch1 state is exactly the helper's
verified round-9 result. Later checks and the read-only status reader validate
immutable source/history/receipt bindings while permitting genuine subsequent
state progress. All prepared ancestry is retained, with the completed/admitted
flags explicitly set. The first research operation is the unchanged
`continue_until_boundary(epoch1, False, 0)` loop. It never restarts the original
comparison, repeats its preflight or paid curation, or redoes prepared migration.
After epoch1 closes, normal fresh curation and the original `ccce` epoch migrator
continue in finite funded epochs until exact full proof plus independent English
correspondence acceptance, a user stop, or an operational reconciliation hold.
A finite root-open epoch is not success.

Native implementation `6f3c44...`, full contract `a9802e...`, funded profile
`99be85...`, 1800-second child/validation bounds, source guards, memory/disk
floors, genuine completion gates and historical uncertainty bridges are unchanged.
Only pure pre-child input qualification may wait and retry on the two exact
native admission disk/memory exceptions, with a 15-second STOP-responsive
checkpoint. No existing intent or paid action is retried by that wait; unknown
observer errors and cleanup holds require reconciliation.
The old comparison has revised source history; no causal performance winner or
learning gain is claimed. No proof suggestions are supplied to the researcher.

Prospective launch, only after review and actual closure qualification:

```
/opt/homebrew/bin/python3 coordinator.py --config ABS_FRESH_CONFIG --output ABS_FRESH_OUTPUT
```

`status_public.py` requires an explicit typed `REGISTRATION.json` in this source
directory, binding its own SHA, the coordinator source, the configuration and
fresh output. It uses `initial=False,native_checks=False` for the retained
component and the pure helper receipt verifier. It reports file observations and
approved public counters only. It does not establish process liveness, run
research, validate new proofs, or acknowledge scheduled monitor events.

`test_coordinator.py` uses synthetic temporary fixtures and fake backends only.
No real private state, model, compiler, native researcher, preflight or migration
is invoked by these tests. This candidate is not activated by creating its source
or passing those tests.
