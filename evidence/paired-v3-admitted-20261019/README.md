# Historical admitted Markov proofs: paired-v3, 2026-10-19

This source-and-evidence packet preserves **21 closed own-main admissions**: 10 exploration and 11 baseline. It contains no private evaluation tasks or answers, research role prompts/events, active drafts, full campaign states, quarantines, credentials, or build caches. It is an operator retention artifact, not feedback to an autonomous proposer.

## Mathematical scope

These admissions establish structural foundations: Farey frame arithmetic and rational coverage, homogeneous support/lift laws, correspondence between defined path recurrences, rational indexing uniqueness, and conditional source-family bridges. **None establishes a substantive interior coefficient log-concavity inequality, and the general Markov log-concavity conjecture remains unproved.** No novelty claim is made.

Exploration source-family comparisons retain their explicit hypotheses, including seeds, mutation recurrence and normalization; the uniform path identity itself is an identity between independently defined path frames. Its trivariate/bivariate log-concavity equivalence uses the pinned polygon predicate and a support hypothesis; it does not prove equality with the published Newton polygon. Its endpoint log-concavity cases are vacuous.

Baseline round 0002 proves both homogeneous mutation laws and agreement between the independently defined trivariate recurrence and lifted bivariate frames for every finite Boolean path. “False” and “true” in names denote branch choices. Round 0003 proves uniqueness of middle paths by rational label; every coprime 0<a<b has exactly one path. Every coprime 0<a≤b has a unique GeneratedNumerator; 1/1 is explicitly u+v, the middle-path equality clause there is vacuous, and 0/1 is excluded from that positive-index relation. **Identification of that generated family with an independently specified published Laurent family remains open.** Exact hypotheses and propositions are preserved in the complete knowledge records and their checked Target sources.

## Preserved evidence and its meaning

- `SCOPE.json`: per-admission English scope/conditions, exact formal claim, limitations and actually consumed Accepted declarations.
- `VERIFICATION.json`: completed lightweight integrity/restoration fixtures; explicitly records that no Lean rebuild was run.
- `registries/`: complete own-main knowledge records only, not full states. These retain exact tasks, solutions, claim predicates, admitted exports, actual checked declaration dependencies, source hashes and receipt bindings.
- `receipts/<arm>/<admission-id>/`: unchanged FINISHED bytes and exactly their listed bound files, including each historical source version, checked witness, inspector, declaration artifact, result, pins, and command record. No `build/` objects are included.
- `registry-bound-exports/`: 13 later export wrappers absent from all FINISHED source closures. Their original source hashes and binding admission IDs are recorded in INDEX.json. They are **registry-hash-bound post-admission exports**, not separately FINISHED-certified source artifacts. They are not silently mixed into a historical proof reconstruction.
- `pins/`: the common exact toolchain, package declaration, and complete dependency manifest.
- `MANIFEST.json` and `MANIFEST.sha256`: content hashes and exact allowed file set. The manifest is not a digital signature; use a separately retained manifest SHA256 as the publication/review anchor.

Per-admission sources stay separate. Never merge the two arm namespaces or combine historical snapshots into one build. Compiler and inspector output paths in historical metadata remain unchanged as evidence; reconstruction maps execution into a fresh project.

## Verify without running Lean

From this directory:

```sh
python3 reproduce.py verify
python3 reproduce.py list
```

The standard-library-only verifier checks the exact packet file set and hashes, each FINISHED marker and file binding, complete registry task/solution identities, recorded successful checks and producer artifact identities, and the separate export bindings. It does not contact a model, download packages, invoke Lean, or inspect the live study. Historical producer receipts were additionally checked with the repository's original `machinery.validation_receipts.reuse` before packaging. This portable verifier is a retention/integrity check; fresh theorem verification is the explicit rebuild below.

## Reconstruct any one historical admission independently

Prerequisites: Python 3.9+, Git, and Elan/Lake capable of installing **leanprover/lean4:v4.32.2**. The precise mathlib revision is **905b95818eb32af7874a58b427f50c1711a5e96c**. The included manifest fixes every transitive package by revision; package source and compiled caches are not vendored. Network access or an independently supplied matching dependency installation is needed. This is not an offline installation archive.

Choose any exact arm/ID printed by `list`, and a **new, nonexistent project directory outside this packet and the original active study**, whose parent already exists. For example, with an absolute packet path assigned to `GKM_PACKET`:

```sh
GKM_PACKET=/absolute/path/to/evidence/paired-v3-admitted-20261019
python3 "$GKM_PACKET/reproduce.py" restore --arm baseline --id r0003-markov-unique-generated-numerator-lift-20261019 --project /private/tmp/gkm-baseline-r0003-repro
```

Restoration copies only that admission's FINISHED-bound Lean source versions and pins. It launches no compiler or package download. Enter the new project and materialize the pinned packages and standard mathlib cache:

```sh
cd /private/tmp/gkm-baseline-r0003-repro
lake update
lake exe cache get
python3 "$GKM_PACKET/reproduce.py" verify-project --arm baseline --id r0003-markov-unique-generated-numerator-lift-20261019 --project /private/tmp/gkm-baseline-r0003-repro
```

`verify-project` requires the original source and pin bytes. If dependency setup rewrites a pin file, inspect the change and restore the exact included pin before continuing; do not accept an updated revision. Cache retrieval downloads ordinary reproducible dependency artifacts; it is optional if those exact dependencies have already been compiled locally. Dependency builds can consume substantial disk/RAM and are not started by restoration or packet verification.

Only the following **explicit command** runs Lean. It checks pinned package Git revisions, executes each historical local compilation sequentially with one Lean worker, replays each local module using `leanchecker`, and runs the preserved premise inspector, all in the fresh project:

```sh
python3 "$GKM_PACKET/reproduce.py" rebuild --arm baseline --id r0003-markov-unique-generated-numerator-lift-20261019 --project /private/tmp/gkm-baseline-r0003-repro
```

To rebuild a different admission, repeat restoration into a different new project, then the same dependency setup and rebuild with its arm/ID. The entry point supports all 21 listed admissions. It preserves historical command order while replacing original local executable/build paths with `lake env` in that project; the original macOS execution wrapper is historical metadata, not a portable dependency. No instruction runs a model or a research campaign.

Recorded binary hashes identify the historical macOS executables. Other platforms can have different binaries for the same Lean release. Fresh compiler/kernel/inspector outputs are new verification evidence; historical receipts are not rewritten or automatically reissued. The script prints both fresh and historical declaration artifact hashes for comparison; a mismatch requires investigation and is not silently accepted as historical equivalence.

## Boundaries and limitations

This packet reconstructs and recompiles checked historical mathematical admissions. **It does not reconstruct the full autonomous research campaign, private assessment, experimental comparison, scheduling, policy selection or proposer state.** It provides no evidence that either lane solved log-concavity. Published-source reuse was not assumed or used to omit source; all required local proof source is included. The packet does not depend on private development Git ancestry. Review and publication must use the operator's independently verified public base.
