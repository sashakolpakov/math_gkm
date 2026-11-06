# Source checkout after the 6 November 2026 cleanup

The default branch retains the mathematical sources, Python machinery and tests,
problem contracts, dependency pins, documentation and unpacked proof evidence.
Generated workspaces and build products are excluded from Git.

For a small download of the current source tree:

```sh
git clone --depth 1 https://github.com/sashakolpakov/math_gkm.git
cd math_gkm
```

Install Python 3.9+, Git and Elan, then use the pinned `lean-toolchain` and
`lake-manifest.json`. `lake exe cache get` fetches the pinned dependency caches;
`lake build` builds the main Lean library. The separate research proof packets
have their own reproduction instructions. Existing historical validation
records describe their original sources and environments, not a fresh build.

The [portable reproduction runner](../repro/README.md) retains its historical
profiles and exact public source revisions. The
[Markov source package](../repro/markov-source-20261028/README.md) additionally
preserves 499 Lean modules and their pins from later local archives, so those
proof sources remain available after deleting the original local checkout.
The Gaussian source packets under `research/` retain their original manifests
and static verifiers.

## Historical material

Root `.scratch/`, `.bootstrap/` and `.control/` directories, Python bytecode,
compiled Lean/native objects and packed evidence workspaces are omitted from the
current tree. The retained retention-capacity tests use the unchanged fixture
sources in `tests/fixtures/retention_capacity/`.

Previously published artifacts remain in the Git history. The last public
snapshot before this cleanup is
[`2f3ec76cc2df471379b55ea090f2f5cd52dd5ae5`](https://github.com/sashakolpakov/math_gkm/tree/2f3ec76cc2df471379b55ea090f2f5cd52dd5ae5).
Historical documents may refer to paths present only in that snapshot. To
recover an individual published file from a shallow checkout:

```sh
git fetch --depth 1 origin 2f3ec76cc2df471379b55ea090f2f5cd52dd5ae5
git show FETCH_HEAD:path/to/historical/file > /path/to/recovered-file
```

No history rewrite or force push is needed for this cleanup. A full clone still
downloads historical objects; use `--depth 1` to retrieve the minimal current
version. Local-only runtime journals and duplicate operational archives are not
part of the source checkout. Runtime authorization must be established anew
before starting a research controller on a new machine.
