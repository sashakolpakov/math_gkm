# Frozen004 resource review — scoped execution clearance

Independent resource auditor. Candidate `/Users/sasha/math_gkm/.scratch/strategy-v3-blended-20261018`; source manifest `evidence/construction-v3/source-audit-004/SOURCE_MANIFEST.json`, SHA-256 `bb1c09cdc706569ffdcd3814fbc9b3248dce901c832db18cedc222786a28bc64`. All266 live entries matched the frozen manifest in an independent streaming-hash check. No candidate imports, tests, builds or edits performed.

**Clearance:** supported `machinery.v3_validate` may now run small sequential neutral/resource tests beneath approved supervisor outerwatchv5 (`6b91082ac9a6d69ebd2242674b2623ac9eacecede985daf71e35ba2606b870ac`). This is execution-safety clearance to obtain actual evidence, not deployment acceptance, correctness certification, or authorization of an untested unattended campaign.

Verified actual runtime fixes:

- `process.run` keeps the direct child unreaped, queries its native zombie status with arg1, and invokes original private-group cleanup before wait on normal exit, timeout and post-spawn failure. It no longer relies on discovering an ordinary orphan before its parent exits. Group cleanup independently observes whether live members remain; zombie-only EPERM is not blindly treated as a failure or ignored when live members exist.
- Known owned descendant birth identities are immutable. Native current PPID is checked, and stale ps ancestry does not replace ownership. Unknown native permission errors remain operational failures.
- Darwin /bin/ps helper fallback verifies public short native parent/euid/ruid, exact kernel executable, root-owned setuid regular file and unchanged parent identity; it rechecks public identity/path. Helpers are not adopted into birth-owned signal targets. Their RSS and process count remain included, bounded64MiB/3s/max4.
- Tree-only observation checks memory/disk headroom and unresolved-cleanup holds without acquiring the leaf validator's heavy lease. Actual validators retain the single shared lease.
- Post-spawn cleanup remains inside finally. In the final frozen process.py, cleanup-error hold persistence happens **after** the unconditional child reap/pipe/selector/log close, fixing the earlier WIP hold-write ordering defect. Required monitoring/cleanup failures retain an explicit hold rather than silently resuming.
- Supported runner accepts an explicit review file (`--review`), binds its manifest hash, bounds and streams its log, and checks frozen source hashes afterward. New tracked permissions config removes the worker's unshipped bootstrap-profile dependency.

Approved first sequence: Resources004 alone; then Pure004/PureRepair and already-reviewed Pure; then individual real neutral CheckedMath/Construction positives. Existing Resources/ResourceRepair suites also use small finite fixtures and may run sequentially as actual evidence dictates. Avoid broad parallel suites or simultaneous model/compiler jobs. Full deployment and comparative campaigns await actual positive/negative and connected-loop results.

`Resources004` forces immediate-parent-exit/timeout conditions with3-second sleep children, records native child identity, checks it is gone, and retains a6-second unrelated process that must survive until finally. Its independent finally checks recorded identities before cleanup. Other new resource tests simulate limits or refuse launch; none allocates OOM-sized memory. Preserve fixture files, raw results, admission/replay/premise artifacts and failures; use fresh labels. An operational failure is not false mathematics.

The existing observer limitation for a separate-session descendant never observed while its parent is alive remains explicit; ordinary polling is not complete arbitrary-daemon containment. These small finite reviewed tests do not require that stronger claim. D1–D3 remain open. No broad cleanup or unrelated-process actions were taken.
