# Operational observations

Machine-authored research de6168c6. Tool outcomes are not mathematical evidence.

The initial shell heredoc failed because zsh could not create its temporary
file. It performed no Python side effect. Subsequent scripts used new project
files or python -c. The higher-priority sandbox denies .scratch; it was not
accessed. No permission or controller change was attempted.

Sage was not on PATH; Python's SymPy module lookup returned None. GAP was
located at /opt/homebrew/bin/gap but was not needed. Exact integer/rational
Python arithmetic and the pinned Lean toolchain were used. Hosted web retrieval
of the published source succeeded. Shell networking was not used.

Two exploratory file reads named absent older module filenames; those failures
changed no files. One exploratory Python command had a SyntaxError from an
assignment expression in a comprehension iterable; it made no file changes and
was corrected. Its successful replacement confirmed the two q=2 seed charts
had nonnegative symbolic coefficient/gap expansions, but this exploratory
observation is not an admitted q=2 theorem.

Every compiler invocation was a bounded foreground subprocess. Failed source
snapshots and full diagnostics are retained with their build receipts. Failures
included unreduced mappings, mismatched local definitions, a sign in an
intermediate linear combination, finite polynomial constant-map simplification,
and tactic sequencing. Each admitted result uses the final matching source
hash. No failed attempt supplies a theorem premise.

The all-run scalar closed-jet candidates were first derived algebraically (one
coefficient extraction was checked by finite polynomial interpolation to propose
its form), then proved for every n by the exact checked matrix recurrence and
base cases. The universal theorem does not assume interpolation correctness.
The expanded three-block seed numerator is saved only as a symbolic research
candidate. Its final sparse expansion and universal LC are not admitted.

Construction and Agoh stand. No agents or additional LLMs, background workers,
controller changes, protected-root edits, package updates, Git access, outside
archives, publishing, or contact occurred. All prior inputs are hash-checked
again in final-check.json. Local validation reuses inherited compiled imports;
no whole-source rebuild or independent completion audit is claimed.
