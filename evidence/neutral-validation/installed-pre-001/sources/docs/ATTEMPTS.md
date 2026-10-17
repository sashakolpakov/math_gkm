# Attempt log — Codex/Astra, 2026-10-13

All entries concern this fresh bootstrap. No predecessor code or proof was read.

- Read `MISSION.md` and `docs/DESIGN.md` in full before source generation.
- The initial file listing included a denied-directory traversal attempt from
  `rg` despite a glob exclusion. No Git contents were returned. Subsequent scans
  use explicit generated directories and do not walk the workspace root.
- `lake env lean --version` with the required Git environment variables attempted
  to refresh the Mathlib symlink checkout and failed on a read-only dependency
  file. No package update/cache download was requested. Lake is not used again;
  invoke pinned Lean with explicit compiled-library search paths.
- `/usr/bin/python3` failed because the OS developer-tool path is unavailable.
  `/opt/homebrew/bin/python3` works (3.14.6). GAP works (4.15.1); Sage is absent.
- An initial `leanchecker --help` was interpreted as a default-module check,
  reporting no `Math_gkm` olean. Read its supplied toolchain source to learn the
  real interface. `leanchecker MathGKM` is the correct project-prefix invocation.
- Including the workspace root in `LEAN_PATH` made leanchecker scan the denied
  Git directory. Removed the root; use only `.scratch/build` and pinned dependency
  build-library paths. Successful replay now needs no access to Git.
- Initial Lean drafts failed on the reserved binder `extends`, unsupported nested
  `DecidableEq` derivation, structure-update indentation, incomplete constructor
  syntax, and a nonexistent `Mathlib.Tactic.Omega` module. Corrected these locally;
  the tactic is supplied by pinned `Lean.Elab.Tactic.Omega`.
- The initial dependency report omitted opaque theorem values because `value?`
  defaults to `allowOpaque := false`. Corrected it to extract actual proof bodies.
- The first runtime suite ran 26 tests with two errors. A reduction application
  needed an explicit type ascription in the restricted AST. The other error was
  a fail-closed rejection after bound gate source changed while the test ran.
  Preserved the full log in `evidence/tests-first-attempt.log` and added an AST
  type-ascription constructor. Stable-code reruns supersede this result.
- Replaced directly assigned dispatch cost in `run` with execution of explicit
  administrative bytecode. The cost normalization first left an associativity
  goal; ordinary `omega` discharged it. Failure and retry are logged in
  `evidence/commands.jsonl`. This strengthens the model-level operational link,
  without proving host elapsed-time costs or complete controller refinement.

Failed elaborations can report Lean's internal error-recovery `sorryAx`; such
candidates have nonzero exit status and are rejected. No accepted source contains
an admission, and no failed elaboration is promoted to an admitted theorem.
