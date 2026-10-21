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
is preparation evidence, not an applied source transition. It does not change
the accepted proof checkpoint, its open root/DAG or the source provenance of
original proof receipts. The packet asserts no fresh mathematical validation or
certified researcher self-change. Later admitted proofs are recorded separately
by the top-level manifest's current checkpoint.

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


## Historical round-35 checkpoint and combined candidate

The historical round-35 checkpoint preserves 35 independently admitted results.
The top-level `MANIFEST.json` uses `current_checkpoint` to select the latest
immutable accepted registry, checked DAG and open residuals. Older snapshots,
proof sources, original FINISHED receipts, pins and generated exports retain
their original bytes. The
round-34 result is the original antidiagonal inequality for every constant-right
Markov path, under the three original polygon-membership premises. Round 35 adds
only a checked implication from a new residual to the previous true-path
interior residual. The new residual retains horizontal inequalities with
`j > 0` and vertical inequalities with `i > 0` for every path containing `true`;
its diagonal clause additionally requires `false` in the path and
`i+j+2 < E.a+E.b-1`. All three original polygon premises remain explicit in each
direction, and coefficients remain raw integers. It proves no unconditional
horizontal, vertical or mixed-path diagonal claim. The new open residual and
checked edge are preserved alongside every prior node and edge; the root and
all residual nodes remain open.
Each proof's `REBUILD.json` records its pinned source/compile/replay/inspection
inputs; this archival update performs hash and receipt verification, not a fresh
rebuild of the entire campaign.

A separate inactive packet preserves the reviewed combined catalogue-capacity
and reviewer-outcome diagnostic variant:
`prepared-candidates/catalogue-review-output-e15efddb1b96d397a75ccf6e56b0d35a92d100ac026132798745c18ee104b56e/`.
Its `combined/` folder contains the exact 17 prepared files; `diagnostic-origin/`
contains the eight original diagnostic files. The two records in
`evidence/independent/` are a separate independent run of the same 178 pure
controls. The original author run and original 15-test diagnostic result remain
unchanged. Both combined runs passed 163 existing capacity/operations controls
and 15 diagnostic controls with all three actual source overlays. These are
neutral Python fixtures, not Lean proofs, a deployment or an activated change.

The implementation recorded by that historical checkpoint is `590648…`.
That prepared packet describes prospective implementation `ffd4aee…`; the older
`5aca2555…` packet above remains separately preserved and inactive. The new hook
still requires genuine old-source verification and the exact normal
successor-7/round-36 boundary before a fresh successor 8. It supplies no authority,
automatic replay, guardian or activation command. No historical feedback packet,
proof charge or proof receipt is relabeled.

For pure reproduction, start from the preserved `590648…` repository source
context, using the source packet and applied source replacements in the archive
if a later checkout has changed. Extract into a new disposable directory:

```sh
GKM_COMBINED_REPRO=/ABSOLUTE/NEW/COMBINED_REPRO
GKM_COMBINED_PACKET=prepared-candidates/catalogue-review-output-e15efddb1b96d397a75ccf6e56b0d35a92d100ac026132798745c18ee104b56e
mkdir "$GKM_COMBINED_REPRO"
tar -xzf evidence/accepted-checkpoint-20261020.tar.gz -C "$GKM_COMBINED_REPRO" "$GKM_COMBINED_PACKET"
PYTHONDONTWRITEBYTECODE=1 python3 -B "$GKM_COMBINED_REPRO/$GKM_COMBINED_PACKET/combined/run_pure.py"
```

Run from repository root; keep the overlay runner inside its packet. It checks
the exact source context, all three overlays and every frozen input before
running the 178 controls. A new result is written beside the copied runner, so
use a disposable extraction to preserve the archived result. Historical temporary
paths in `PRESERVED_INPUTS.json` identify prepared engineering sources only;
the runner does not resolve them or require them to exist. No private evaluation
inputs, live study state, grants or authorization are included.


## Preserved migration retention allowance

A separate prepared engineering packet in the accepted archive preserves the
reviewed 896 MiB migration helper, its exact source binding and pure controls:
`prepared-candidates/migration-retention-ad5c57cfae546035f908c5193e55879064f1e9fb99989da82efafb8862bc27d0/`.
Its `source/` folder contains all 18 frozen preparation files, including the
15 bound inputs and the author 181-test result/log. `evidence/independent/`
contains the separately recorded independent 181-test result/log. Both runs
passed the 178 existing controls and three neutral migration-guard checks. The
810,147,794-byte forecast is below the 896 MiB helper retention ceiling; the
cap+1 rejection and full planned-disk reservation remain checked. No large
fixture data was allocated. The source target `ffd4aee…` and all other resource guards are unchanged.

This packet records prepared engineering evidence only. Core source activation
and fresh deployment are separate operations; neither is established by these
Python fixtures or this backup. At this packet's preservation step, all 35
accepted proof records, their snapshots and the earlier `e15…` combined packet
retained their original bytes and status. The then-current proof/source
checkpoint was unchanged.

For pure reproduction, use the preserved 590648 repository context and a fresh
disposable extraction, as in the combined-packet instructions above. Run
`PYTHONDONTWRITEBYTECODE=1 python3 -B /ABSOLUTE/EXTRACTED/prepared-candidates/migration-retention-ad5c57cfae546035f908c5193e55879064f1e9fb99989da82efafb8862bc27d0/source/run_pure.py`
from repository root. Keep the runner inside its packet. It verifies every
frozen input and all three actual core overlays, then runs 181 controls; a new
result is written beside the copied runner. It runs no models or Lean proofs.


## Accepted checkpoint through round 37

The latest checkpoint preserves 38 independently admitted results through round
37. Its `MANIFEST.json` `current_checkpoint` selects the accepted registry,
checked proposition DAG and every remaining residual; follow that pointer rather
than an older snapshot. The three new records are:

- `markov-summand-midpoint-separators-r0036-v1`: two exact failures of the proposed
  termwise midpoint condition, on valid vertical polygon triples for labels
  `(5,6)` and `(8,9)`. The reversed summand products are `48 > 40` and
  `5040 > 4704`, while the complete coefficient triples `(1,14,117)` and
  `(8,154,1590)` have positive raw log-concavity margins `79` and `10996`.
  These separate a stronger sufficient condition from the original inequality;
  they are not counterexamples to Markov log-concavity.
- `markov-right-summand-raw-recovery-r0036-v1`: for every natural `n >= 1` and
  every natural `i,j`, the actual midpoint polynomial for
  `frame(replicate (n-1) true)`, labeled `(n,n+1)`, has coefficient
  `sum_{s=0}^n W_n(i,j,s)`. There is no polygon-membership or positivity premise.
  The weight is zero unless `n <= i+j <= 2*n` and `s <= i`. When these guards hold it is
  `mc(n,i+j-n,s) * binom(2*(i+j-n),i-s)`. The `h=0` corner convention is
  `mc(n,0,s)=1` exactly when `s=n`, and zero otherwise. Natural-subtraction
  guards, the corner, outside-support zeros and raw integer coefficients are
  retained. This is a coefficient identity, not a new directional inequality.
- `markov-generic-midpoint-marginalization-r0037-v1`: for arbitrary finitely
  supported functions `f,g,b : Z -> Z`, assume all three functions are
  nonnegative at every integer and, for every integer `s,t`,
  `f(s)*g(t) <= b(floor((s+t)/2))*b(ceil((s+t)/2))`. Then
  `(sum f)*(sum g) <= (sum b)^2`. Finite support is part of the Lean function
  type; no positivity of masses, interval-support or log-concavity hypothesis
  is hidden. `Compatible` contains only the stated pointwise premises, not the
  conclusion. The proof derives fixed-sum interval domination and convolution
  domination before finite-sum reindexing. This is a one-dimensional,
  integer-valued theorem, conditional on compatibility. The checked separators
  prevent using the rejected universal termwise premise to obtain unconditional
  Markov coordinate inequalities by this route.

The original independent admission records contain 91 successful checks:
44 project compilations, 44 independent kernel replays and three premise
inspections. Their obligation closures use only `propext`, `Classical.choice`
and `Quot.sound`. The later preservation audit checked hashes, exact statements,
FINISHED reuse and English/Lean scope; it did not freshly rebuild the entire
campaign. Generated exports remain separately hash-bound aliases of checked
compositions and require a fresh rebuild in every new consumer.

All 35 previous mathematical records remain unchanged except the explicitly
recorded validator-directory relocation into the new continuation. No new
reduction or discharge was submitted with these three results. The proposition
DAG is unchanged; all residuals and the full all-path, all-three-direction
conjecture, including its original endpoints and raw zero coefficients, remain
open. No new universal horizontal or vertical Markov
inequality, mixed-path theorem, root refutation, publication correspondence or
novelty claim is established here.

This checkpoint records the actually used `ffd4aee9df33c2b3503a3ec1833e95ad5da29949394a2558c23ec01f6efffbdf`
implementation. Its complete 76-file source map is
`reviewed-source/patches/ffd4aee9df33c2b3503a3ec1833e95ad5da29949394a2558c23ec01f6efffbdf/SOURCE_BINDING.json`
inside the archive. The top-level `catalogue_feedback_source_transition`
references this source binding and its separate
`reviewed-source/patches/ffd4aee9df33c2b3503a3ec1833e95ad5da29949394a2558c23ec01f6efffbdf/evidence/ACTIVATION.summary.json`.
This records the reviewed engineering activation and neutral deployment
separately from all preserved prepared-candidate packets. Those packets retain their historical
status and original bytes; their pure tests do not establish activation, a
mathematical theorem or a certified arbitrary researcher self-change. Earlier
proofs keep their original implementation, receipt and dependency identities.

For the new proof closures, extract the archive into an absent or new empty
directory. The original inputs and commands are under each
`proofs/<record-id>/REBUILD.json`, with exact `FINISHED.json`, `source/` and
`rebuild-pins/` companions; generated aliases are separately under `exports/`.
The three record IDs above are the exact proof-directory names. Follow the
current manifest's hashes and registry bindings before using a bundle. Restore
the recorded Lean/toolchain and dependency pins, copy sources into a fresh
workspace, and relocate only the historical source/build/toolchain/dependency paths in
the recorded commands, recreating the sandbox and output working directories
for those new paths. Preserve module order, flags, compile/replay/inspection
steps and import isolation; original source bytes and evidence must not be
rewritten. A failed or incomplete rebuild is not an accepted reproduction.

The existing `repro/repro.py` profiles described above reproduce their pinned
baseline source sets. They are not a 38-result campaign profile, and their
historical passing checks must not be presented as a rebuild of these new
closures. This update preserves the complete recorded inputs and replay recipes;
no new automated full-campaign replay is asserted.
