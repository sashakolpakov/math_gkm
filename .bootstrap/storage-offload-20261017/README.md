# Verified local cache offload, 17 October 2026

This records a completed local-only cleanup. Necessary sources, inputs, proof records and Git history remain public. No tracked file was removed. The reviewed batch contains 621 distinct compiled objects at 1,864 untracked current/archive/CAS paths; all 2,882 protected active object paths remained unchanged.

All five recovery archives and both metadata assets were independently downloaded from the public [recovery release](https://github.com/sashakolpakov/math_gkm/releases/tag/recovery-cache-2026-10-17) and checked for exact size and SHA-256 before local removal. Local archive members had also been decompressed and individually hashed. `remote-download-verification.json`, `archive-content-verification.json`, `local-cleanup.json` and `protected-after.json` record these separate checks. `staging-cleanup.json` records removal of the temporary upload archives after verification.

Use the portable [recovery command](../../repro/README.md#restore-archived-caches) to restore original bytes. Git clone alone does not fetch Release assets. The exact deletion plan, its input inventories, independent review and one-time helpers are retained here for audit; these helpers describe this completed batch and are not general cleanup commands. Source paths and toolchain/platform bindings are in `manifest.json`. Restoring caches does not improve their historical proof-validation status or recreate original filesystem metadata.

The interrupted worker 189 evidence was preserved separately before the unchanged autonomous controller resumed. No mathematical suggestion was supplied to the researcher.
