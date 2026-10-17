# Builder source review before validation

Read MISSION.md, docs/DESIGN.md, fixed requirements, round-4 construction report
and all round-4 review notes. No mathematical gate or Lean source changes.
Round-4 successes and interrupted attempts remain pinned to their old manifests.

Changed edges reviewed:

- StudyFixtures freezes the neutral contract and patches only dependency-tree
  identity. Its actual child controller uses the same identity fixture. All
  lifecycle cases remain; test support inheritance no longer duplicates tests.
- The Toy target context precedes the adapter. Use credit and mandatory closure
  are distinct, as stated in the exact runtime review. Unrelated True is used
  for the neutral root-negative because natural identity is no longer unrelated.
- Test output paths are unique retained directories; no old evidence overwritten.
- Source-storage collect reads the contract root, removing a campaign-specific
  path; it has no decision consumer.
- conditional_pair validates each present endpoint before deciding whether a
  comparison exists. Missing endpoints suppress differences, not observations.
  Plotting still requires adjacency; no gap is bridged as progress.
- Direct root resolution and direct proof encoding are explicitly separate in
  machine output and generated README. No new encoding estimator or reward.
- Checkpoint includes the current independent round-4 review files. Supported
  regression selection is explicit; no imported class rediscovery is needed.

Static AST parses succeeded for the five changed/new Python files. Diffs retained
alongside this note. Test outcomes are pending the immutable pre-validation copy.

Two setup commands failed before editing or testing: `python3 machinery/neutral_checkpoint.py ...`
resolved to the unavailable system xcrun shim; a zsh here-document was denied
temporary-file creation. The successful commands use /opt/homebrew/bin/python3
and apply_patch. Neither setup failure is counted as a test result.
