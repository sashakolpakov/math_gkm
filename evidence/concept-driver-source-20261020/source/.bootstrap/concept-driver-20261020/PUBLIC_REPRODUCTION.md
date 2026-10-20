# Public source reproduction

The public packet contains the reviewed Python implementation, Lean sources,
all test sources, exact dependency lock and toolchain, selected design documents,
and static launch/monitor helpers. It excludes research workspaces, independent
curator/evaluation inputs and answers, adapter output, credentials, live state,
launch authorization, and rebuildable compilation caches. Existing historical
public proof packets remain in Git history.

For deterministic tests using only Python's standard library:

```sh
python3 .bootstrap/concept-driver-20261020/run_public_tests.py
```

This command runs synthetic concept, review-feedback, cache, curator-size,
deployment-receipt, launch and scheduler fixtures. It does not invoke Codex,
Lean, the researcher, a live timer, or the operating-system resource probe.
Passing these tests establishes controller behavior under their fixtures, not
mathematical novelty, conceptual discovery, or the Markov conjecture.

The separate integration command

```sh
python3 -m unittest tests.test_concept_loop_integration -v
```

uses deterministic role subprocesses and the pinned Lean protocol transition.
Its configured host currently uses macOS, the exact Lean installation and
`/opt/homebrew/bin/python3`. The live harness is not claimed portable to an
arbitrary host. An independent deployment preflight and fresh resource checks
remain required. No public archive restores an authorization or starts research.

For portable mathematical source builds with pinned dependencies, see the
existing [reproduction tools](../../repro/README.md). Their dated source profiles
remain separate from this revision's Python/controller tests; they are not
relabeled as fresh builds of the entire campaign.

`archive_public.py prepare` inventories only an explicit source allowlist.
`archive_public.py check` verifies current sources against that inventory.
`archive_public.py build` copies a fresh source-only packet after checking all
hashes. `archive_public.py verify-packet` checks the archived packet itself.
None of these commands performs Git publication, network operations, proof
compilation or live activation. A changed source requires a new reviewed
inventory. Public publication uses the existing public Git ancestry, never the
private local repository ancestry.
