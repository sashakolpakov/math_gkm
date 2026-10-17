# Packaging-only source review before validation

All 49 selected neutral tests now have passing evidence, with the initial stale
watchdog fixture failure retained and corrected on pre-002. Both changed recovery
methods passed. Every completed group has zero post-run source mismatches.

Review of installation packaging found a stale two-module reproduction list in
study_manifest.generate. The generator now copies the six explicit bounded
commands from docs/REGRESSION.md, includes the checkpoint's supervisor requirements
and review inputs, and refuses existing output paths. Its default output is a
new uniquely named .scratch file, preserving earlier evidence.

This is the sole source delta after pre-002. study_manifest is not imported by
the tested controller, proof gates, observer, fixtures or tests. implementation()
hashes all machinery sources as inert input metadata; new studies bind the new
hash, with the same equality check and behavior. No previous study is resumed.
The packaging command itself must now be exercised and its source pins, complete
selection, no-overwrite behavior and byte identity checked. No repeated expensive
Lean test is warranted for this unchanged executed-path argument.

The newly available LIVE_ACCEPTANCE_REVIEW.md is supervisor audit only, supplies
no implementation/proof, agrees with the retained watchdog failure and observer
scope, and is included in pre-002 and the packaging inputs. It is not live-run
authorization. Markov remains stopped.
