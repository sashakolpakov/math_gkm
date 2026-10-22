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


## Historical accepted checkpoint through round 37

The round-37 checkpoint preserves 38 independently admitted results. The
archive's `MANIFEST.json` `current_checkpoint` selects the latest accepted
registry, checked proposition DAG and every remaining residual; follow that
pointer rather than an older snapshot. The three records added at round 37 are:

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


## Historical accepted checkpoint through round 38

The round-38 checkpoint preserves **41 independently admitted results**. The top-level `MANIFEST.json` `current_checkpoint` indexes the exact
accepted registry, checked DAG and every open residual. All earlier archive
payloads retain their original bytes, including the round-37 checkpoint, its
proof receipts, the separately recorded `ffd4aee…` activation metadata and all
historical prepared-candidate packets. The three new exact proof directories
are:

- `markov-actual-right-cross-separator-r0038-v1`: at the actual midpoint
  `M_3=(frame(replicate 3 true)).mid.p`, with label `(4,5)`, all three points
  `(4,0)`, `(4,1)` and `(4,2)` belong to the original polygon. Their midpoint
  coefficients are `[1,11,63]`; the gap
  `G_3=M_3-U*(frame(replicate 3 true)).lo.p` has coefficients `[0,3,37]`.
  The cross product `1*37` exceeds `11*3`, while the two individual adjacent
  log-concavity margins are `58` and `9`. The statement also includes the same
  strict reversal for integer zero-extended coefficients. This is a closed
  fixed-instance theorem with no hypotheses. It refutes the proposed stronger
  cross-state criterion, not an original Markov inequality. The additional
  finite scan reversals are experimental evidence, not further universal
  consequences of this fixed-instance theorem.
- `markov-conditional-nonnegative-mixture-r0038-v1`: for arbitrary finitely
  supported integer sequences `a,b : Z -> Z` and natural weights `alpha,beta`,
  suppose `a(x),b(x) >= 0` at every integer `x`, each sequence satisfies
  `a(x)*a(x+2) <= a(x+1)^2` and `b(x)*b(x+2) <= b(x+1)^2`, and both
  `a(x)*b(x+2) <= a(x+1)*b(x+1)` and
  `b(x)*a(x+2) <= a(x+1)*b(x+1)` hold at every integer `x`. Then
  `alpha*a+beta*b` satisfies the adjacent log-concavity inequality at every
  integer `x`. Finite support is part of the Lean type; no common support,
  gap-free support, strict positivity or original polygon premise is added.
  Zero coefficients and zero weights remain allowed. Every individual and
  cross premise remains explicit; no actual-family consumer is proved here.
- `markov-cross-positive-transfer-control-r0038-v1`: the fixed auxiliary
  polynomials `A=1`, `B=U^2 V` satisfy pointwise nonnegativity and both individual
  adjacent inequalities and both cross inequalities at every integer start in
  each direction `(1,0)` and `(0,1)`. Negative coefficient indices are explicitly
  zero. The weights `H=(U+V)^2`, `r=U`, `q=V` have nonnegative natural-index
  coefficients. One step of the exact renewal update
  `(A,B) -> ((H+r)*A+q*B, H*A+q*B)` gives an `A'` whose coefficients at
  `(0,2)`, `(1,2)`, `(2,2)` are `[1,0,1]`, so its adjacent inequality fails.
  This is a closed auxiliary control with no assumptions and no assertion that
  the input belongs to the actual Markov family. It does not prove
  nonreachability as a separate statement and supplies no original-polygon
  counterexample.

The original independent admission records contain **75 successful checks**:
36 project compilations, 36 independent kernel replays and three complete
premise inspections, each within its recorded 900-second admission allowance.
The obligation closures use only `propext`, `Classical.choice` and `Quot.sound`;
the interface and transport closures use no axioms. The separate English/Lean
scope audit authenticated the records, original FINISHED receipts, source
snapshot, checked targets and exported aliases. It ran no new Lean compiler,
kernel replay, inspector, model or campaign test. This is not a fresh rebuild
of all 41 results.

All 38 previous accepted records remain unchanged. The full proposition DAG
and remaining obligations are unchanged: all root and residual nodes remain
open, with no new reduction or discharge. No additional unconditional Markov
log-concavity coverage is established by these three admissions. The full
all-path, all-three-direction Conjecture 6.3, including its original endpoints
and raw zero coefficients, remains open. Novelty, publication correspondence,
measured usefulness and certified researcher self-improvement are not inferred.

For manual reproduction, extract the archive into a new empty directory and
follow the current manifest's registry and hash bindings. Each of the three
`proofs/<record-id>/` directories contains its original `FINISHED.json`,
`REBUILD.json`, `source/` and `rebuild-pins/`; generated aliases are separately
under `exports/`. Restore the exact Lean toolchain and dependency pins, use a
fresh source/build workspace, and relocate only the historical source, build,
toolchain and dependency paths in the recorded commands. Recreate the bounded
sandbox and output directories for those new paths; preserve source bytes,
module order, flags, isolated imports and every compile, kernel-replay and
premise-inspection step. Generated aliases require a fresh rebuild in each new
consumer. Original receipt and snapshot identities remain historical; do not
rewrite them to describe a new run. Incomplete or failed checks do not establish
a reproduced proof.

The existing `repro/repro.py` baseline profiles are unchanged and are **not a
41-result campaign profile**. The archive retains the required proof sources,
pins, receipt bindings and recorded manual recipes; this update neither adds
an automatic all-41 runner nor claims a fresh all-campaign rebuild. The applied
`ffd4aee…` source transition remains distinct from every historical prepared
packet and from the mathematical proof receipts.


## Accepted proof checkpoint through round 39

The historical round-39 checkpoint preserves **44 independently admitted
results** through that round. The latest 47-result scope is described in the
[round-40 section](#accepted-proof-checkpoint-through-round-40). Follow top-level `MANIFEST.json` `current_checkpoint` for the
exact accepted registry, checked DAG and open residuals. All 41 prior records,
original proof payloads and earlier source-transition and prepared-candidate
metadata retain their original bytes and provenance.

The original aggregate retained-source/history guard stopped the controller
**after the three round-39 proof admissions but before completion of the
round-39 source snapshot**. A subsequently reviewed storage-version repair and
continuation from the existing receipts completed that snapshot without
replaying round-39 research or changing the original charged calls. The round-39
checkpoint separately binds its completed source manifest, observer endpoint,
44-result registry and unchanged open DAG. The original English/Lean audit is
retained byte for byte: its earlier statement that the snapshot was incomplete
records the situation at that audit, before the repair.

For the precise statements, let `c_P(i,j)` be the raw integer coefficient of an
integer bivariate polynomial, extended by zero whenever either integer index
is negative. For a sequence `a : Z -> Z`, `LC(a)` means
`a(t)*a(t+2) <= a(t+1)^2` at every integer `t`. `Cross(a,b)` means both
`a(t)*b(t+2) <= a(t+1)*b(t+1)` and
`b(t)*a(t+2) <= a(t+1)*b(t+1)` at every integer `t`.

The three exact new record IDs and scopes are:

- `markov-finite-family-mixture-r0039-v1`: for any index type in Lean `Type`,
  finite set `s`, finitely supported integer sequences `f_r` and natural weights
  `w_r`, assume pointwise nonnegativity and `LC(f_r)` for every `r` in `s`, and
  `Cross(f_r,f_q)` for every pair of distinct indices `r,q` in `s`. Then
  `sum_{r in s} w_r*f_r` satisfies `LC` at every integer index. No finiteness
  assumption on the entire index type, common-support, gap-free-support or
  strict-positivity premise is required. Empty finite sets, zero weights and
  zero coefficients remain allowed. The proof consumes the previously admitted
  binary mixture and explicitly proves compatibility with each partial sum;
  it does not supply actual-family premises.
- `markov-conditional-shifted-transfer-r0039-v1`: write `T=U+V` and define
  `O_true(P,Q)=(T^2+U)*P+V*Q`, `O_false(P,Q)=T^2*P+V*Q`. For any integer start
  `(i,j)`, direction `(dx,dy)` and sequence parameter `t`, the five sequences are
  `f_0(t)=c_P(i+t*dx-2,j+t*dy)`,
  `f_1(t)=c_P(i+t*dx-1,j+t*dy-1)`,
  `f_2(t)=c_P(i+t*dx,j+t*dy-2)`,
  `f_3(t)=c_P(i+t*dx-1,j+t*dy)`, and
  `f_4(t)=c_Q(i+t*dx,j+t*dy-1)`. The output coefficient at
  `(i+t*dx,j+t*dy)` is exactly their weighted sum, with weights
  `(1,2,1,1,1)` for `true` and `(1,2,1,0,1)` for `false`. This identity holds
  for arbitrary integer directions, including zero or negative directions,
  with no sign or log-concavity assumption.

  Its coordinate conclusion restricts directions to `(1,0)` and `(0,1)`.
  `CoordLC(P)` requires the adjacent inequality for all integer starts in
  those directions. The complete `Premises(P,Q)` requires nonnegative
  zero-extended coefficients of both inputs, `CoordLC(P)`, `CoordLC(Q)`, and,
  for every integer start and either coordinate direction, `Cross(f_r,f_q)`
  for every distinct `r,q` among the five sequences. Each `Cross` includes
  every integer `t` and both product inequalities. Under all these premises,
  both outputs satisfy `CoordLC`. There is no polygon restriction or hidden
  output inequality in the premises.

  For every natural `k`, the actual constant-right midpoint and gap also satisfy
  the unconditional identities `M_(k+1)=O_true(M_k,G_k)` and
  `G_(k+1)=O_false(M_k,G_k)`. Their coordinate log-concavity consequence
  retains the complete `Premises(M_k,G_k)` assumption. Here
  `M_k=(frame(replicate k true)).mid.p`, with label `(k+1,k+2)`, and
  `G_k=M_k-U*(frame(replicate k true)).lo.p`. No assertion that all actual
  states satisfy the shifted premises, no antidiagonal result and no
  unconditional actual-family coordinate theorem is proved.
- `markov-missing-shifted-compatibility-r0039-v1`: the fixed auxiliary input
  `P=1`, `Q=U^2 V` satisfies the previously admitted unshifted
  `CoordinateInputs` conditions: nonnegativity, both individual coordinate
  inequalities and both cross inequalities at every integer start in either
  coordinate direction. At start `(0,2)`, direction `(1,0)`, its sequences
  `f_2(t)=c_1(t,0)` and `f_4(t)=c_(U^2 V)(t,1)` have
  `f_2(0)*f_4(2)=1` and `f_2(1)*f_4(1)=0`; hence `Cross(f_2,f_4)` is false.
  The statement has no assumptions. It separates the old unshifted conditions
  from this extra sufficient-bridge premise. It proves neither necessity of
  every shifted premise nor failure on reachable inputs, and makes no
  actual-family reachability or separate nonreachability assertion.

Their original independent validators recorded **125 successful checks**:
61 project compilations, 61 independent kernel replays and three complete
premise inspections, under the unchanged 900-second allowance for each
admission. Only `propext`, `Classical.choice` and `Quot.sound` occur in the
obligation closures; the interface and transport closures use no axioms. The
later English/Lean audit authenticated the original FINISHED/task/solution,
source, result, pin and export bindings and expanded every named predicate.
It performed no new Lean compilation, kernel replay, inspector or model call.

The entire proposition DAG and every remaining obligation are unchanged.
There is no new reduction, discharged node or unconditional Markov
log-concavity coverage. All root and residual nodes remain open. Full
Conjecture 6.3 still requires both original endpoints and every finite path,
all three original directions and every original polygon triple with raw
integer coefficients including zeros. Novelty, publication correspondence,
measured usefulness and certified controller improvement are not inferred.

The original manual inputs remain under each exact
`proofs/<record-id>/REBUILD.json`, alongside `FINISHED.json`, `source/` and
`rebuild-pins/`; generated aliases are separately under `exports/`. Extract into
a new empty directory and verify the manifest and registry bindings. Restore
the exact toolchain and dependency pins, use fresh source/build/output trees,
and relocate only historical source, build, toolchain and dependency paths in
the recorded commands. Preserve source bytes, module order, flags, import
isolation, bounded sandbox rules and every compilation, kernel replay and
premise-inspection step. A new consumer must rebuild the generated aliases.
Do not rewrite an original receipt to claim a new run; failed or incomplete
checks do not establish reproduction.

The existing `repro/repro.py` profiles remain their original baseline profiles,
**not a 44-result campaign profile**. Required source closures, pins and exact
recorded recipes are preserved here; no automatic all-44 runner or fresh
full-campaign rebuild is claimed. Original proof provenance, including the
`ffd4aee…` provenance of the three new admissions, remains unchanged. All
historical prepared packets retain their recorded status; their mathematical
admissions do not certify the later storage repair.

### Applied storage-version provenance and neutral controls

Top-level `MANIFEST.json` `storage_capacity_source_transition` identifies the
separate source binding and sanitized activation summary under
`reviewed-source/patches/3cfd280fbeea15b0a2ca0a434a7333304d282ee97ed5a66d840ad2c340f76478/`.
The full 76-file source vector differs from the preceding `ffd4aee…` vector
only in `machinery/study_common.py`: aggregate retained-source/history capacity
increases from 1 GiB to 2 GiB. The separately bound continuation helper raises
its finite migration allowance from 896 MiB to 1.5 GiB. Per-file, source
inventory, proof-bundle, per-job, time, memory, premise and kernel checks retain
their existing limits. The applied summary records the actual neutral readiness
check (316.719 seconds, zero hosted model calls), preservation of both arm
states apart from their seal binding, and continuation from the original ten
closed calls with their charges unchanged. This is engineering evidence, not
a new mathematical admission or a whole-campaign rebuild.

The exact historical preparation sources and the recorded **184 passing pure
controls** are retained under `prepared-origin/`, with their original inactive
preparation binding. Their runner requires an **isolated reconstructed
`ffd4aee…` baseline**; it must not be run directly against the newer `3cfd…`
source vector. Follow `SOURCE_REPRO.md`: use the earlier FFD binding's
`source_archive_paths` to restore and hash-check all 76 source files into a new
empty baseline directory, then run a disposable extracted copy of
`prepared-origin/run_pure.py` from that baseline with
`PYTHONDONTWRITEBYTECODE=1` and `python3 -B`. The frozen runner supplies its
reviewed new-common overlay and writes fresh result files beside itself.
Preserve the original recorded results. These controls require no Lean, model,
actual deployment or live research. This archive append did not rerun that
suite or the mathematical campaign; it preserves the complete recorded inputs
and keeps their historical and applied evidence separate.


## Accepted proof checkpoint through round 40

The historical round-40 checkpoint preserves **47 independently admitted
results** through that round. The latest 50-result scope appears in the
[round-41 section](#accepted-proof-checkpoint-through-round-41). Its archive SHA-256 is **`273496ec8d581d084e277402d0cbe31d4fd5cec1d985b6702adcda30f98b167a`**. Its top-level
`MANIFEST.json` `current_checkpoint` identifies the accepted registry, checked
proposition graph and open residuals. Earlier proof payloads and source-version
records retain their original bytes and provenance. The 44 inherited admission
records differ only in their declared validator-directory relocations into the
new finite study; their original checked proof identities are unchanged.

There are three new record IDs. All polynomials below have integer coefficients.

- `markov-grouped-polynomial-bridge-r0040-v1`: for arbitrary
  `A_0,A_1,A_2` in `Z[X]`, coefficientwise nonnegativity of
  `D=A_1^2-A_0*A_2` implies `A_0(1)*A_2(1) <= A_1(1)^2`. For every natural
  `n,l` and arbitrary functions `a,b,c : N -> Z`, put
  `E_n(w)=sum_{s=0}^n w(s)X^s`. The exact grouped identity is
  `coeff_l(D(E_n(a),E_n(b),E_n(c))) =
  sum_{0<=s,t<=n, s+t=l} (b(s)b(t)-a(s)c(t))`.
  If every such group is nonnegative for every natural `l <= 2n`, then
  `(sum a(s))*(sum c(s)) <= (sum b(s))^2`, with all three sums over `0..n`.
  Groups above `2n` vanish. No nonnegativity or log-concavity of the individual
  inputs, pointwise compatibility, strict positivity, homogeneity or Markov
  reachability is assumed. The case `n=0` and zero coefficients are included.
- `markov-grouped-nonimplication-controls-r0040-v1` contains two fixed
  auxiliary controls. For `(A_0,A_1,A_2)=(1,1+X,2X)`, the defect is `1+X^2`,
  whose coefficients are nonnegative, but the specified termwise midpoint
  product at indices `0,1` fails: `2 > 1`. Thus grouped signs need not imply
  that stronger termwise condition. For `(2,1+X,1)`, the defect is
  `-1+2X+X^2`, with value `2` at `X=1` but constant coefficient `-1`. Thus
  even a positive evaluated defect need not imply coefficientwise signs.
  Both statements are unconditional facts about these fixed auxiliary inputs.
  Neither asserts actual-family reachability or nonreachability, necessity of
  the sufficient conditions, or a counterexample to Conjecture 6.3.
- `markov-conditional-grouped-coordinate-consumer-r0040-v1` concerns every
  natural `k >= 0`, with actual constant-right midpoint
  `E=(frame(replicate k true)).mid`, label `(k+1,k+2)`, and `n=k+1`.
  The previously admitted exact weights `W_n(i,j,s)` recover its raw
  coefficient by `c_E(i,j)=sum_{s=0}^n W_n(i,j,s)`. Write `h=i+j-n`, using
  natural subtraction. The weight is zero unless `n <= i+j <= 2n` and `s <= i`;
  otherwise it is `mc(n,h,s)*binom(2h,i-s)`. For `h=0`, `mc(n,0,s)` is one
  when `s=n` and zero otherwise. For `h>0`, it is
  `binom(h+s,h)*binom(n-s-1,h-1)` when `h+s <= n`, and zero otherwise.
  All subtractions in this definition are natural subtraction and the
  binomial values are cast to integers. The degree corner `h=0` is retained.
  Define
  `G(n,i,j,dx,dy,l)` as the sum, over `0<=s,t<=n` with `s+t=l`, of
  `W_n(i+dx,j+dy,s)*W_n(i+dx,j+dy,t)
  - W_n(i,j,s)*W_n(i+2dx,j+2dy,t)`.

  Here the original polygon condition is
  `a*b <= b*i+a*j` and `i+j <= a+b-1`, with natural indices and subtraction.
  The theorem retains **both** complete premises. `H` requires
  `G(k+1,i,j,1,0,l) >= 0` for every natural `i,j` for which all three points
  `(i,j),(i+1,j),(i+2,j)` satisfy the original `InPolygon(E.a,E.b)`
  predicate, and for every natural `l <= 2(k+1)`. `V` requires
  `G(k+1,i,j,0,1,l) >= 0` for every natural `i,j` for which all three points
  `(i,j),(i,j+1),(i,j+2)` satisfy that predicate, and every such `l`.
  Under `H` and `V`, it concludes respectively
  `c_E(i,j)*c_E(i+2,j) <= c_E(i+1,j)^2` and
  `c_E(i,j)*c_E(i,j+2) <= c_E(i,j+1)^2` at every corresponding original
  polygon triple. The inputs and conclusions use the original raw integer
  coefficients, including zeros; the corner `k=0` is included. Neither
  universal actual-family sign premise was proved in round 40. The conditional
  theorem remains valid; round 41 below refutes its universal vertical premise.

These three admissions have **225 original successful checks**: 111 project
compilations, 111 independent kernel replays and three complete premise
inspections, with the original 900-second allowance for each admission. The
obligation closures use only `propext`, `Classical.choice` and `Quot.sound`;
interface and transport closures use no axioms. The English/Lean scope audit
authenticated the original FINISHED, producer-completion, source, result, pin
and export bindings. It performed no fresh compilation, replay, inspection,
model call or test. The source-version provenance of these admissions is
`3cfd280fbeea15b0a2ca0a434a7333304d282ee97ed5a66d840ad2c340f76478`.

The proposition graph and all remaining obligations are unchanged. There is no
new reduction, discharged node or unconditional Markov log-concavity coverage.
The strongest unconditional coverage remains all three original directions for
every constant-left path, and the antidiagonal direction for every
constant-right path. At the round-40 checkpoint the universal actual-family
grouped signs remained unproved. The root, residual obligations and full
arbitrary-path conjecture remain open; the later vertical sign counterexample
is described below. That original
goal still includes both endpoints, every finite path, all three directions,
every original polygon triple and the raw integer coefficients including zeros.

For each admission, the archive retains its original
`proofs/<record-id>/REBUILD.json`, `FINISHED.json`, source closure and exact
`rebuild-pins/`, with the generated declaration separately bound under
`exports/`. These are the necessary retained inputs and recorded checks for a
new isolated rebuild. Extract into a new empty directory, verify the archive
manifest and registry, restore the exact toolchain and dependencies, and use
fresh source, build and output trees. Relocate historical host paths only; keep
source bytes, module order, flags, import isolation, bounded sandbox rules and
every recorded compile, kernel-replay and premise-inspection step. Generated
aliases require a fresh rebuild in each new consumer. Original receipts record
their original runs; incomplete or failed checks do not establish reproduction.

The existing `repro/repro.py` automated profiles remain the baseline profiles
described above, **not a 47-result campaign profile**. Retaining all 47 proof
source closures, dependency pins and recorded rebuild recipes does not claim
that this archive update performed a fresh whole-campaign replay or provides
an automatic all-47 runner. Historical prepared packets and applied engineering
versions remain separate from mathematical admission and certified self-change.


## Accepted proof checkpoint through round 41

The checkpoint preserves **50 independently admitted results** through closed
round 41. The new archive SHA-256 is **`c312f3fcd8158db4a1d64dceb21721397948339899961fcc75c9a57a32eff2f1`**. Top-level
`MANIFEST.json` `current_checkpoint` identifies the exact accepted registry,
checked proposition graph and open obligations. All 47 preceding admission
records and their original proof identities are unchanged, as are the graph and
remaining obligations. Historical archive hashes, prepared packets and applied
source-version records above retain their dated meaning.

Use the original natural-coordinate polygon predicate, raw integer coefficients
and literal weights `W` and groups `G` defined in the round-40 section. Natural
subtraction is truncated at zero throughout. The three new record IDs are:

- `markov-grouped-vertical-separator-r0041-v1`: the actual midpoint
  `E=(frame(replicate 9 true)).mid`, corresponding to `R^9`, has label `(10,11)`.
  All three points `(10,0),(10,1),(10,2)` lie in its original polygon and
  `16 <= 2*10`. The proof establishes
  `G(10,10,0,0,1,16)=-3`, `G(10,10,0,0,1,17)=72` and
  `G(10,10,0,0,1,18)=130`. For every natural `s,t <= 10`, the ordered
  contribution to group 16 is `81` at `(s,t)=(8,8)`, `-84` at `(10,6)`,
  and zero otherwise. Thus group 16 is `81-84=-3`; the negative ordered
  contribution is not counted twice.

  The exact weight profiles are `W(10,10,0,s)=1` at `s=10` and zero elsewhere;
  `W(10,10,1,s)=9,20` at `s=8,9` and zero elsewhere; and
  `W(10,10,2,s)=84,288,270` at `s=6,7,8` and zero elsewhere, in each case
  for every natural `s <= 10`. Independent exact raw-coefficient recovery gives
  `c_E(10,0)=1`, `c_E(10,1)=29`, `c_E(10,2)=642`, and margin
  `29^2-1*642=199`.

  This refutes the statement that, for every natural `n >= 1` and every
  vertical triple in the original polygon for label `(n,n+1)`, all groups with
  natural `l <= 2n` are nonnegative. The witness is actual-family data, unlike
  the auxiliary controls in round 40. The old conditional implication remains
  correct, but its proposed universal vertical premise is false. The witness
  satisfies the original raw log-concavity inequality and **does not refute
  Conjecture 6.3**. No universal symbolic corner formula, horizontal group-sign
  theorem, reduction or root discharge is asserted.
- `markov-guarded-weight-support-r0041-v1` proves four exact statements about
  the literal individual weights, with all variables natural:

  1. If `1 <= n` and `i+j=n`, then `W(n,i,j,s)` is one exactly when
     `i=n`, `j=0` and `s=n`, and is zero otherwise. This separately retains
     the degree-zero-layer corner; it makes no `n=0` assertion in this clause.
  2. If `0 < h`, `h <= n` and `i+j=n+h`, then
     `W(n,i,j,s)>0` if and only if
     `s <= i`, `h+s <= n` and `i <= s+2h`.
  3. If `i+j < n` or `2n < i+j`, then `W(n,i,j,s)=0`, with no positivity
     assumption on `n`.
  4. If `(dx,dy)` is `(1,0)` or `(0,1)`, `0 < h+r`, `h+r <= n` and
     `i+j=n+h`, then `W(n,i+r*dx,j+r*dy,s)>0` if and only if
     `(i+r*dx)-2(h+r) <= s <= min(i+r*dx,n-(h+r))`.
     The lower bound uses natural truncated subtraction. This clause does not
     cover arbitrary directions or the shifted layer `h+r=0`.

  These are support/positivity identities for individual weights. They imply
  no grouped sign or original coefficient log-concavity inequality here.
- `markov-grouped-antidiagonal-r0041-v1` reindexes and symmetrizes the finite
  convolution sum. For arbitrary natural `n,i,j,dx,dy,l`, write
  `A_s=W(n,i,j,s)`, `B_s=W(n,i+dx,j+dy,s)` and
  `C_s=W(n,i+2dx,j+2dy,s)`. Then
  `G(n,i,j,dx,dy,l)=sum_s [B_s*B_(l-s)-A_s*C_(l-s)]`, and
  `2G(n,i,j,dx,dy,l)=sum_s [2*B_s*B_(l-s)-A_s*C_(l-s)-A_(l-s)*C_s]`.
  Both sums range over `0 <= s <= n`; a term is included only if
  `s <= l` and `l-s <= n`, and is zero otherwise. The factor 2 and both ordered
  negative products in the second identity are retained. There is no
  `n >= 1`, polygon, positivity, direction or `l <= 2n` hypothesis.
  “Antidiagonal” here refers only to the convolution indices `s+t=l`, not
  the original coefficient-direction antidiagonal inequality. Neither identity
  gives a sign or original log-concavity conclusion.

The three new admissions recorded **167 original successful checks**:
82 project compilations, 82 independent kernel replays and three complete
premise inspections. The English/Lean and checkpoint audits authenticated the
original FINISHED, producer-completion, source, result, dependency-pin, generated
export, admission-journal and committed-registry bindings. They did not perform
fresh Lean compilation, kernel replay, premise inspection, model calls or a
whole-campaign rebuild. The proof-source implementation remains
`3cfd280fbeea15b0a2ca0a434a7333304d282ee97ed5a66d840ad2c340f76478`.

The exact finite witness proves one positive raw margin; it adds no general or
unbounded log-concavity region or family theorem. The strongest unconditional
coverage remains all three original directions for every constant-left path
and the antidiagonal direction for every constant-right path. No new node is
discharged and the root, residual obligations and full arbitrary-path conjecture
remain open. Horizontal grouped signs are neither proved nor refuted by these
three statements. The original goal retains both endpoints, every finite path,
all three directions, all original polygon premises and raw coefficients
including zeros.

For each of the 50 admissions, the retained original `REBUILD.json`, FINISHED
source closure, exact toolchain and dependency pins, and separately bound
exported declaration provide the inputs and recorded steps for an isolated
rebuild. Follow the extraction, manifest verification, path-relocation, fresh
output, import-isolation and complete checking requirements above. Preserve
original receipt identities; rebuild generated aliases for every new consumer.
The automated `repro/repro.py` profiles remain their original baseline profiles,
**not a 50-result campaign profile**. This publication retains proof/rebuild
sources and original check evidence; it claims neither a fresh replay of all
50 admissions nor an automatic all-50 runner. Engineering-source provenance
and proof admission remain distinct from certified controller self-change.
