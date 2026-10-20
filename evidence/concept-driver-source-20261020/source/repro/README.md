# Reproduction and cache recovery

The standalone runner creates a separate workspace and fresh proof outputs. It does not invoke or modify the autonomous researcher, change theorem sources, or overwrite historical evidence.

The pinned source snapshot is public commit `ca0cb5c1151a11237f11e7c759b81e8a84bf48c5`, through worker 188. `manifest.json` binds 2,874 project sources, three fixed build inputs, Lean 4.32.2 and all nine dependency commits. Every source/input hash was checked against that public Git tree. Later interrupted worker 189 records are preserved separately and are not included in this profile.

## Build and check

With Python 3.9+, Git and Elan installed, run from the repository root:

```sh
python3 repro/repro.py bootstrap --workspace /path/to/new-repro-checkout
python3 repro/repro.py run --workspace /path/to/new-repro-checkout --profile construction
python3 repro/repro.py run --workspace /path/to/new-repro-checkout --profile agoh
python3 repro/repro.py run --workspace /path/to/new-repro-checkout --profile initial-markov
```

Bootstrap requires an absent destination. It fetches each exact Git commit with depth 1 and uses Git sparse checkout for the project sources and build inputs. Historical records remain in GitHub and can be fetched when needed; their local absence is not a Git deletion. It installs the exact Lean toolchain without changing the Elan default, and runs `lake exe cache get`. `--dependencies build` builds Mathlib from its pinned sources instead; `--dependencies none` restores source dependencies only and cannot run proof profiles. The dependency lock and Git revisions must remain unchanged. Tool paths come from Elan rather than an author's home directory.

| Profile | Project modules | Checks and scope |
| --- | ---: | --- |
| `construction` | 12 | Fresh compilation and kernel replay of the retained construction source closure, including its existing audit modules. |
| `agoh` | 4 | Fresh compilation and kernel replay of the exercise, main result, consequences and existing audit. |
| `initial-markov` | 6 | Fresh compilation and kernel replay, plus exact coverage and permitted-axiom checks for 48 named declarations. |
| `sealed188` | 2,857 | Available source-closure build/replay command; **not executed in this reproduction check**. It does not reproduce every historical isolated-driver/finalizer check. |

All three baseline profiles passed fresh compilation and independent `leanchecker` replay on 2026-10-17, using the existing pinned dependency binaries read-only. The initial Markov output also passed the 48-declaration axiom audit. Twelve orchestration, Git-checkout, archive and failure-handling tests passed. Records are under `checks/2026-10-17/`.

A second test fetched the public project snapshot and all nine exact dependency commits into a new isolated workspace, populated fresh dependency build trees with `lake exe cache get`, and passed all three baseline profiles again (22 compilations, 22 kernel replays and the 48-declaration axiom audit). All 2,877 pinned source/build-input hashes matched. See `checks/2026-10-17/fresh-dependencies/`. The existing exact Lean installation was reused; the upstream download cache was not forced empty. The first failed bootstrap and its Elan-command fix are recorded. The manifest remains unchanged so earlier records keep their hash binding; its `validation` block describes the original tests, while the later results are recorded separately.

**The entire later research campaign has not been rebuilt in this check.** These profiles do not run the full `machinery.check` Python runtime suite or finite scan/stress programs. Historical validation limits remain unchanged. The existing historical wrappers remain preserved; their author-specific paths are not the portable entry point.

For a source-hash check without compilation:

```sh
python3 repro/repro.py verify --workspace /path/to/repro-checkout --profile sealed188
```

To test with an already installed, pinned toolchain and packages while keeping project outputs separate:

```sh
python3 repro/repro.py prepare --source /path/to/math_gkm --workspace /path/to/new-smoke-workspace --profile initial-markov --toolchain-dir /path/to/lean-v4.32.2 --packages-dir /path/to/pinned/packages
python3 repro/repro.py run --workspace /path/to/new-smoke-workspace --profile initial-markov
```

Each run checks exact inputs, compiles in dependency order into a new `.scratch/run-*/build`, and replays every compiled project module. Only that fresh build, the pinned package libraries and pinned core are import paths. Unused packages may have no compiled library; any missing required import fails in Lean. Logs and failures go into the new workspace. No mathematical source is repaired by this tool.

## Restore archived caches

Necessary sources, scripts, inputs, pins and manifests stay in ordinary Git. Local cache removal must not become a Git deletion commit or history rewrite. Large optional caches live in the [recovery release](https://github.com/sashakolpakov/math_gkm/releases/tag/recovery-cache-2026-10-17), and **are not downloaded by `git clone`**.

```sh
python3 repro/repro.py recover --recovery-manifest repro/cache-2026-10-17.json --destination /path/to/new-cache-restore
```

Use a separate destination: the cache archive binds public worker-187 snapshot `07374c32`, while the proof bootstrap binds worker-188 snapshot `ca0cb5c1`. Recovery downloads the five archives, verifies archive sizes/checksums and every object digest, then restores the original current paths into a separate directory. `--historical-copies` also restores the recorded archive/CAS paths. A different existing file is never overwritten. Only listed ordinary files are accepted; path traversal, links, duplicate members and incomplete coverage fail. The cache is specific to Darwin ARM64 and Lean 4.32.2. Its historical validation status is unchanged by restoration. Original filesystem metadata is not reconstructed.

The manifest covers 621 distinct objects representing 622 inactive current objects; all have matching public sources. All accepted 188 dependencies and interrupted 189 material were excluded from this cleanup batch and kept local. The [completed cleanup records](../.bootstrap/storage-offload-20261017/README.md) retain the independent public-download verification and exact local deletion inventory. All protected objects remained unchanged; no tracked file was removed. The pinned dependency commits and Lean release were also checked on GitHub; see `dependencies-remote-2026-10-17.json`.

GitHub blocks ordinary Git blobs over 100 MiB, while these release assets are each below 2 GiB. Releases avoid putting large compiled objects into normal Git history or relying on LFS pointers without their payloads. See [GitHub file limits](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github) and [release asset limits](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases).

Run the small helper tests without executing project proofs:

```sh
python3 -B -m unittest discover -s repro -p test_repro.py -v
```


## Blended V3 formal Construction profile

`manifest-construction-v3.json` is a separate, seven-module source closure bound
to public source commit `4915b7c6cfa50c2c66c33155d944e13d2f067f84`.
It preserves the historical manifest unchanged and avoids importing historical
Agoh or Markov results through the top-level aggregate.

For an isolated workspace using explicitly supplied pinned toolchain/package
binaries, run from this repository (replace the example paths for your host):

```sh
python3 repro/repro.py --manifest repro/manifest-construction-v3.json prepare \
  --source "$PWD" --workspace /ABSOLUTE/NEW/WORKSPACE \
  --profile construction-v3 --toolchain-dir /ABSOLUTE/PINNED/TOOLCHAIN \
  --packages-dir /ABSOLUTE/PINNED/PACKAGES
python3 repro/repro.py --manifest repro/manifest-construction-v3.json run \
  --workspace /ABSOLUTE/NEW/WORKSPACE --profile construction-v3 --timeout 300
```

Alternatively use the same manifest with the runner's `bootstrap` command to
fetch its exact public source and dependency revisions. The manifest lists only
the necessary seven project modules and three fixed inputs; dependency packages
are pinned separately. `prepare` reuses existing dependency binaries and does
not by itself establish a cold bootstrap.

This formal profile compiles and independently replays the mathematical
Construction closure. Actual Python-harness positive/negative controls, premise
inspection and English/source audits have separate versioned receipts in the
[V3 release record](../STRATEGY_V3_RELEASE.md). A generic continuation theorem is
not a certified arbitrary host edit; D1/D2/D3 remain open.
