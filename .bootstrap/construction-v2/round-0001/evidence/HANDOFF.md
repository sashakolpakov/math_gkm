# Version 2 construction handoff

Phase: **construction — experimental, reviewable, not installed**.

The authoritative source/reproduction manifest is `install-manifest.json`.
Every supplied source file is byte-for-byte unchanged. All implementation work
is additive: ten `machinery/study*.py` modules, `tests/test_study_v2.py`, the clean
contract export, three study configurations and `docs/STUDY_V2.md`. The full
61-line Markov target retains SHA256
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

The final retained lifecycle is `reviewed-study/`; its source/permission seal
matches the final machinery. `reviewed-lifecycle.log` records four rounds in each
arm, 12 total fixture calls for baseline and 20 for exploration (including their
bounded policy comparisons). Both roots remain open. `reviewed-audit/` contains
ten raw snapshot measurements, a standalone SVG and a limitations report. Its
flat synthetic curve is an observed fixture output; no sawtooth is invented.
Other smoke studies are development evidence and may intentionally reject
resume after later implementation changes. Do not use them as live controls.

`validation-reviewed.log` is the final source test run: **27 tests passed** in
93.801 seconds. The additional live-empty plotting check also passed; see
`live-empty-plot.log`. Tests cover fresh paired
seeds, independent roles, prospectively committed trials, portfolio retention,
withheld-answer exclusion, source/protocol/state tampering, actual child-process
interruption with watchdog lock retention, uncertain-effect accounting without
replay, interrupted review recovery, exact-root rejection, checked component use
and transfer-driven experimental policy selection, and observer-only audit
invariance. `lean-use-checked.json`, `lean-adaptation-invention-rejected.json`,
`exact-root-negative.json` and `checked-policy-trial.json` retain actual check
records. These are toy/construction fixtures, never Markov research results.

`validation-during-edit.log` preserves a development run interrupted by the
intentional implementation-hash change while its fixture arm was active; the
resulting incomplete snapshot-count assertion failed. The subsequent sealed
`validation-reviewed.log` passes. This evidence has not been discarded.

The first broad run's positive check exhausted its shared 120-second budget
while redundantly rebuilding/replaying all of Mathlib for a toy identity. That
failure remains in `tests-first.log`; it was not called unprovability. The toy
fixture now imports only Lean, while the exact-root negative test still rebuilds
the supplied target. `frozen-component-check.log` separately passes the added
frozen-origin/use requirements. No source or result from the old mathematical
run, old tree, Git, archives or sessions was accessed. No live LLM was launched.

## Supervisor's next step

Review source hashes and fixtures, retain the version externally, and follow
`docs/STUDY_V2.md` for the bounded clean canary. Do not install into, resume or
migrate the stopped historical run. Curate/freeze obligations before trials;
an absent independent suite must remain explicitly "transfer not demonstrated."
The canary permits 1800 charged seconds and 12 external calls per arm, with
identical clean inputs and tools. Live policy changes are disabled in the canary.

Actual Codex CLI feature/permission enforcement and provider token semantics
remain untested by this builder. `sandbox-probe.log` records that this managed
builder environment denies nested `sandbox-exec`; live Lean validation fails
closed until the supervisor establishes an appropriate reviewed launch context.
General Lean elaboration is executable trusted code, not a hardened hostile-code
admission boundary. There are no CPU/disk quotas or verified monetary/token
equivalences; raw usage, wall, call limits and conservative validation reservations
are explicit. Audit accounting bases and unknown controller-only overhead remain
visible. Independent holdout relevance and English/source correspondence are
separate judgments. No whole-continuation optimality proof or Python/LLM bridge
has been supplied, and no certified persistent switch is claimed.
