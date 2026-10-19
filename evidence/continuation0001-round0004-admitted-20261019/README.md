# Continuation 0001, round 0004: admitted Markov boundary proofs

This review packet preserves **three closed own-main admissions** from the first continuation: uniform top-boundary coefficients, uniform top-diagonal log-concavity, and a checked reduction of the unchanged root to an open residual. It contains no round5 drafts, full states, jobs, private evaluations, role payloads/events, quarantines, credentials, dependencies or build caches. No active proof workspace was inspected to make it.

For every finite Farey path and all three frame entries L=(a,b,P), put d=a+b−1. The admitted theorem gives c_P(i,j)=binomial(d,i) when i+j=d. The admitted LC theorem proves c_P(i,j+2)c_P(i+2,j)≤c_P(i+1,j+1)² when i+j+2=d and the three points satisfy the pinned polygon predicate. It has no unproved LC/residual premise. The empty path's middle polynomial (U+V)²+U gives the admissible nonvacuous top triple1,2,1 at label1/2.

This is **formal reproduction of a known published uniform boundary case**, not a newly solved open case. The full conjecture remains open. Its residual retains every horizontal/vertical admissible triple and diagonal triples strictly below the top line, universally over all middle paths.

## Definition matching and the historical correction

An independent human English/Lean audit identifies the directly defined seeds, mutations, raw squared-variable coefficients and polygon with Evans–Veselov–Winn, *Arithmetic and Geometry of Markov polynomials*, equations(5),(7)–(11), Theorems3.1/3.2/4.1 and Section6:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html

The source audit is preserved as `observer-reviews/source-definition-audit.json`. A separate generic theorem for an arbitrary independently specified affine family is not needed for this definition match. The earlier observer audit is preserved byte-for-byte under `observer-reviews/historical/`, **with its overbroad source-family caveat explicitly superseded by CORRECTIONS.md**. Do not treat the older caveat as the current verdict.

Kernel checking establishes the exact recursive theorems; the separate human audit establishes English/source-definition correspondence. No new kernel theorem about mathematical prose is claimed. Prior separately archived coverage covers all coprime positive labels0<a≤b, with endpoints represented separately. The current three historical proof closures themselves rebuild independently from this packet.

## Contents and provenance

- `registries/exploration-knowledge.json`: complete accepted records for exactly these three admissions.
- `receipts/exploration/<id>/`: each exact FINISHED marker and exactly its bound files. Historical source versions are separate; no compiled objects are retained.
- `registry-bound-exports/`: three post-admission wrappers recovered by exact renaming of the immutable FINISHED-bound StudyCheck source. Every reconstructed byte string matches the original registered export SHA256. Their status is registry-bound, not independently FINISHED-certified; no active workspace export was read.
- `pins/`: exact Lean/Lake/Mathlib dependency pins.
- `SCOPE.json`: exact formal statements, English quantifiers/conditions, actual Accepted reuse, nonvacuity and remaining obligations.
- `VERIFICATION.json`: operator integrity/restoration checks; no fresh Lean/model/compiler/research test.
- `MANIFEST.json` / `MANIFEST.sha256`: exact file set, content hashes and historical binding index. Retain the manifest SHA256 independently; it is an integrity anchor, not a digital signature.

## Verify and reconstruct an individual admission

`reproduce.py` is the same safe verifier/restore/rebuild entry point as the prior admitted-proof packet. Default verification and restoration use only Python's standard library and run no Lean or model:

```sh
python3 reproduce.py verify
python3 reproduce.py list
```

For example, set an absolute packet path and choose a new nonexistent project directory outside this packet and the original study, under an existing parent:

```sh
GKM_PACKET=/absolute/path/to/evidence/continuation0001-round0004-admitted-20261019
python3 "$GKM_PACKET/reproduce.py" restore --arm exploration --id markov-r0004-top-diagonal-inequality-v1 --project /private/tmp/gkm-round4-top-lc-repro
```

This restores only the selected FINISHED-bound source and its exact pins. All earlier local dependencies needed for this historical theorem are already in that receipt closure. Never combine snapshots into one project.

Prerequisites for a subsequent **explicit operator rebuild** are Git, Python3.9+, and Elan/Lake for `leanprover/lean4:v4.32.2`. Mathlib is pinned to `905b95818eb32af7874a58b427f50c1711a5e96c`, with every transitive revision fixed in the included manifest. Materialize those dependencies in the new project:

```sh
cd /private/tmp/gkm-round4-top-lc-repro
lake update
lake exe cache get
python3 "$GKM_PACKET/reproduce.py" verify-project --arm exploration --id markov-r0004-top-diagonal-inequality-v1 --project /private/tmp/gkm-round4-top-lc-repro
```

If dependency setup rewrites a pin, inspect the change and restore the exact preserved pin bytes before rebuilding. Do not silently accept a new revision. Cache retrieval is optional if the exact dependency objects were built separately. Dependencies/build caches are not vendored; network access or an independently supplied matching installation is necessary, so this is not an offline archive. Dependency setup can consume substantial disk/RAM; verification/restoration does not start it.

Only this explicit command runs the historical local compiler, kernel-replay and premise-inspector operations, sequentially in the fresh project:

```sh
python3 "$GKM_PACKET/reproduce.py" rebuild --arm exploration --id markov-r0004-top-diagonal-inequality-v1 --project /private/tmp/gkm-round4-top-lc-repro
```

Repeat with another listed ID in a different fresh project to reconstruct its exact historical proof. The entry point maps original executable/build paths to `lake env` in that project while preserving command order. It uses one Lean worker for each local compilation. The original macOS execution wrapper and absolute paths remain historical evidence, not portable runtime requirements.

Historical binary hashes identify the original platform. Other platforms can have different binaries for the same Lean release. Fresh outputs are new verification evidence; historical receipts are not rewritten or automatically reissued. The script prints fresh and historical declaration-artifact hashes for comparison; a difference requires investigation, not an assumption of identity.

This reconstructs historical admitted proofs, **not full campaign replay**, scheduling, proposer state or private assessment. It introduces no research suggestions or machine changes. Actual Lean rebuilding was intentionally not run while preparing this packet. Review/publication is a separate operator action.
