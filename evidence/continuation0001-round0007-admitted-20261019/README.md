# Continuation 0001, round 0007: admitted subleading component

This small preservation packet contains **one closed own-main admission**, `markov-r0007-uniform-subleading-component-v1`, with complete accepted record and its untouched FINISHED evidence. It includes no active proofs, round8 drafts, full state, jobs, private evaluations, role payloads/events, dependencies, caches or credentials.

For **every finite Boolean Farey path**, take its **middle** entry (a,b,P) and d=a+b−1. The admitted theorem proves

    [P]_(d−1) = ((b−1)U + (a−1)V)(U+V)^(d−2).

Here [P]_n is the actual sum of its raw integer-coefficient monomials of total degree n. Generated-label positivity and d≥2 are proved internally; no unproved mathematical antecedent or fixed denominator restriction appears. The empty path has label1/2, P=(U+V)²+U, and component [P]_1=U, so the identity has nonzero content.

**This admission proves no additional log-concavity inequality.** It determines the full next coefficient layer uniformly, but does not assert LC, discharge the open residual or prove the full conjecture. No scientific novelty is claimed or assessed. Earlier frame invariants, support and top-form lemmas are reused through source declarations; no prior Accepted export occurs in this proof closure. Exact scope, source interpretation, recorded axioms and nonvacuity are in SCOPE.json.

The core seed/recurrence/coefficient definitions remain the same as in the completed human English/Lean audit of the Markov source family; no generic arbitrary-family bridge is needed to identify these direct definitions. That audit is separately retained with the prior round4 packet and is referenced by its exact hash in SCOPE.json. Kernel proof checking and human English/source-definition matching are distinct recorded checks. Paper: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html

## Contents and integrity

- `receipts/exploration/<id>/`: the exact FINISHED marker plus exactly its bound files, including all required historical local source versions, pins, witness, inspector, declaration artifact, result and command record. No compiled object is copied.
- `registries/exploration-knowledge.json`: the complete accepted record for this one claim.
- `pins/`: the exact Lean/Lake/dependency pins.
- `registry-bound-exports/`: one post-admission wrapper, recovered only from immutable FINISHED-bound StudyCheck source by the generator's exact renamings. Its bytes match the official registry hash. It is distinguished as registry-bound rather than separately FINISHED-certified; no active workspace file was read.
- `SCOPE.json`, `VERIFICATION.json`, `MANIFEST.json`, `MANIFEST.sha256`: human scope, recorded checks and exact byte/binding index. Retain the manifest SHA256 independently; this is an integrity manifest, not a digital signature.

The unchanged prior helper verifies packet bytes and task/solution/FINISHED/export bindings without Lean:

```sh
python3 reproduce.py verify
python3 reproduce.py list
```

## Independent reconstruction, explicitly opt in

Restore into a new nonexistent project outside the packet and original study, under an existing parent:

```sh
GKM_PACKET=/absolute/path/to/evidence/continuation0001-round0007-admitted-20261019
python3 "$GKM_PACKET/reproduce.py" restore --arm exploration --id markov-r0007-uniform-subleading-component-v1 --project /private/tmp/gkm-round7-component-repro
```

Restoration copies only the selected FINISHED source and pins; it downloads nothing and runs no Lean. All earlier local proof dependencies needed for this historical admission are already in its own preserved source closure. Never substitute another round's module versions.

Prerequisites for an explicit later rebuild are Python3.9+, Git and Elan/Lake for `leanprover/lean4:v4.32.2`. Mathlib is fixed at `905b95818eb32af7874a58b427f50c1711a5e96c`; the complete included manifest pins its transitive packages. Network access or an independently supplied matching installation is necessary: dependencies/caches are not vendored and this is **not an offline archive**.

```sh
cd /private/tmp/gkm-round7-component-repro
lake update
lake exe cache get
python3 "$GKM_PACKET/reproduce.py" verify-project --arm exploration --id markov-r0007-uniform-subleading-component-v1 --project /private/tmp/gkm-round7-component-repro
```

Dependency setup may consume substantial disk/RAM. If setup rewrites a pin, inspect it and restore the exact preserved bytes before continuing; do not accept a changed revision. Cache retrieval is optional if exact dependency objects are already built.

Only this explicit command executes historical local compiler/replay/inspector operations sequentially, with one Lean worker per local compilation:

```sh
python3 "$GKM_PACKET/reproduce.py" rebuild --arm exploration --id markov-r0007-uniform-subleading-component-v1 --project /private/tmp/gkm-round7-component-repro
```

Original paths/platform execution wrappers are preserved as historical metadata; the helper maps execution into the fresh project using `lake env`. Historical binary hashes identify the original platform and need not equal another platform's binaries of the same release. Fresh outputs are new verification evidence; historical receipts are never rewritten or automatically reissued. Fresh/historical declaration artifact hashes are printed for comparison; differences require investigation.

No fresh Lean/compiler/model/research test was run to prepare this packet. The reused helper was previously tested for isolated restoration; only byte/metadata verification is performed here, with no new temporary projects or large duplicate copies. This reconstructs a historical mathematical proof, **not full campaign replay**, private assessment, proposer state or scheduling. Publication/Git changes are separate operator actions.
