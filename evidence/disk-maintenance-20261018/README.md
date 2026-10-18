# Verified cleanup of inactive compiled Lean objects

On 18 October 2026, cleanup removed 9,466 untracked compiled outputs and duplicate object-store/worker copies. Their logical sizes total 151,749,943,784 bytes (about 141.3 GiB). Observed free space rose from about 20 GiB to about 75 GiB at the final observation. These numbers differ because APFS clone copies share extents; concurrent system activity also affects free space.

Every selected output was named by a successful recorded Lean build. Its exact source and build receipt were checked against both local Git commit `71afc4d53ef3ad703d2eb8ae36eaf6f616921c5c` and published Git commit `fc2d620bdb661660e21aadf3c964c92a655b66dd`. Dependency pins were checked in both repositories. Inactive worker copies and content-addressed objects were additionally streamed through SHA-256 and matched to the retained worker receipt before deletion. Sources and receipts were rehashed after cleanup. Ambiguous source cases were retained.

No tracked file, Lean source, research record, failed launch, dependency cache, Git object, or active construction directory was deleted. No process was terminated and no Lean build was started. The cleanup's observed RSS was about 78 MiB; hashing used 1 MiB chunks. The earlier OOM is not attributed to any particular process by this record.

`SUMMARY.json` gives totals. `verified-cleanup-provenance.tar.gz` contains the operational scripts, complete selected-output/source/build mappings, before-unlink deletion logs, Git object identities, retained-source rehashes, and results. `archive-manifest.json` hashes every archived member; `archive-sha256.txt` hashes the archive. These artifacts are suitable for Git publication. They contain no compiled Lean output.

## Rebuilding

Restore the source commit and its pinned Lean/Mathlib dependencies. Rebuild the needed module dependency closure in import order using the exact source hashes and original commands recorded in `legacy-provenance.json` inside the archive. If an archived `build-*.lean` source is used, materialize its contents at the original source/module path named by the command in an isolated rebuild directory; its archive filename is a preservation label, not the imported module name. Output paths can be redirected to an active build directory.

The historical records explicitly distinguish inherited-import checks from a fresh whole-source rebuild. The cleanup does not change those historical claims or assert that a new complete replay was performed. Historical raw object-store replay requires rebuilding the removed `.olean` objects first; the source and recipes remain available. The current functional reproduction checks and pinned dependency cache remain intact.
