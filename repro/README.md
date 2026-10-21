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

## Request transport and reviewed source revisions

Request transport preserves the full controller request and its identity. Source
protection, admission and executable request programs continue to use that full
record. Proposer and researcher prompts use compact JSON and check the length
of the complete rendered prompt before launching a model. Large accepted-library
records can instead be presented through an index backed by their complete,
hash-bound context in the arm's read-only history. Exact claim statements and
exports, the goal and open proposition graph, the current commitment, protected
concept predictions and the latest research feedback remain directly visible.
No theorem, hypothesis or historical record is shortened or deleted from its
retained source. Private evaluation, selector and adapter material must never be
placed in researcher-readable history by this transport.

An input rejected before a proposal is an operational failure, not a failed
mathematical prediction or a completed plan. Non-object reports are rejected
before concept processing. Ordinary schema repair is distinct from a transport
failure; an explicit operations-only recovery must bind the closed failed
invocation and authorize a fresh request identity. The original request, receipt
and full reservation remain unchanged. No uncertain action is replayed or cost
refunded.

A reviewed source revision at a stopped boundary retains the original seal,
both arm states, deployment evidence and provenance. A fresh deployment check is
required for the new implementation. A versioned rebind changes only the seal
identity in each arm state; mathematical state, protocol, receipts and accounting
are preserved. An interrupted rebind must be reconciled before research resumes.
This is an operator-engineered repair, not a certified Goedel-machine switch or
a new mathematical result.


## Prepared catalogue-capacity candidate (inactive)

The canonical `evidence/accepted-checkpoint-20261020.tar.gz` also preserves an
inactive engineering candidate under
`prepared-candidates/catalogue-capacity-d540901eb08bfea0662128227c98da282d5637d323e3088e1994674b903cc02b/`.
Its `PACKET.json` and original `SOURCE_BINDING.json` bind the prospective
`590648…` → `5aca2555…` source change and exact reproduction inputs. This packet
is preparation evidence, not an applied source transition. The current accepted
31-record proof checkpoint, its open root/DAG and all original proof receipts
retain their existing source provenance. No fresh mathematical validation or
certified researcher self-change is asserted.

Run these commands from this repository using a new empty extraction directory:

```sh
GKM_PREPARED_REPRO=/ABSOLUTE/NEW/CANDIDATE_REPRO
GKM_PREPARED_PACKET=prepared-candidates/catalogue-capacity-d540901eb08bfea0662128227c98da282d5637d323e3088e1994674b903cc02b
mkdir "$GKM_PREPARED_REPRO"
tar -xzf evidence/accepted-checkpoint-20261020.tar.gz -C "$GKM_PREPARED_REPRO" "$GKM_PREPARED_PACKET"
python3 -B "$GKM_PREPARED_REPRO/$GKM_PREPARED_PACKET/run_pure.py"
python3 -B "$GKM_PREPARED_REPRO/$GKM_PREPARED_PACKET/test_boundary_guardian.py"
```

The first command runs the exact 163 pure capacity, cache, feedback and
continuation controls; the second runs 37 pure guardian controls. Both use neutral
fixtures and mocked process/validation effects. The overlay runner belongs inside
this isolated packet, where its sibling `tests/` contains exactly three selected
test files. Installing it at repository root would broaden discovery beyond this
pure suite. Unchanged imports come from the repository's pinned source context.
The packet includes no live authority, study state, evaluation answers or
automatic activation command.

The catalogue allowance is derived as `min(1800, 2*validation_seconds)`; ordinary
main-proof and heldout-task limits remain unchanged. The prepared hook targets
only a reviewed normal successor-7/round-36 boundary and a fresh successor 8. Its
guardian deliberately retains the earlier epoch-6 outer deadline as an extra
conservative ceiling; it does not reconstruct the actual epoch-7 deadline and
refuses insufficient time. The earlier finite guardian hold released before a
manual handoff, without applying the source change.

The separately recorded native Darwin ABI fixture tested only its own disposable
children, with all children reaped. The earlier guardian, test and native-fixture
sources are retained as the three flat `*.before-parent7.py` siblings required by
the current pure suite; their historical summaries are under `evidence/`. That
ABI check was not rerun for the current guardian revision. Current guardian
evidence consists of the 37 pure controls, with no claim that the new handoff was
exercised on live research processes. To repeat the native fixture separately,
copy `native_boundary_fixture.before-parent7.py` to a fresh temporary directory
and run that copy from repository root; it writes its new summary beside the
copied script.
