# Frozen pre-007 K / terminal delta review

All 75 files match the frozen source manifest `241d7be7e0ae955bded56b16145737024c191500c386571162ec3773aba20b8d`. Static reads and hashes only; no candidate code or tests executed and no candidate files changed.

The terminal binding change is substantive. `study_observer.validate_resolution` (lines 9–19) checks a resolved, finished result, exact bundle digest and sealed contract, then all declared project source hashes and correspondence hash against the terminal snapshot. Both the checkpoint producer and burden reader call this check. Immutable seed Lean hashes and accepted dictionary source bindings are also checked. The source-key format agrees with `completion.prepare` (module names mapped to `.lean` paths). These strengthen terminal provenance; they do not expand what the encoding consumer measures.

The principal pre-006 K corrections remain: bound old/enlarged theories, separately bound reduction witnesses, explicit unknown holes and minimum, separate full dictionary/adapter/connecting overhead, no audit-to-policy reward. New plot markers retain actual recorded program/policy/component changes without forcing a trend.

Two limited findings remain:

1. `conditional_pair` lines 295–299 still returns before measuring the newer endpoint if the older checkpoint is absent. A final/terminal endpoint then may never receive its per-witness plot point. Raw cumulative observation is separate, so this is omission rather than fabricated improvement. Measure available endpoints independently or disclose this coverage limit.
2. Lines 310–336 still build per-witness descriptions only from reduction-ledger records. Direct exact-root completion is receipt/source-bound and exported separately but its proof encoding is unmeasured unless also represented through a supported checked reduction route. A resolved root may be labelled unwitnessed by this particular encoding. The three frozen status docs are unchanged and omit this explicit qualification. Unknown encoding must not be interpreted as unresolved mathematics or a proof-complexity lower bound.

The new terminal source-change test is explicitly a synthetic serialization fixture, not mathematical acceptance evidence. Parent reports affected tests and the exact-allowance neutral evaluation/review test passed; this independent review did not execute or authenticate those run logs. This note therefore accepts only the static delta described above and preserves the two scope qualifications. It does not change earlier sealed reviews or assert whole-harness completion.
