# Worker 83 replay-method continuation audit

Read-only review of `evidence/markov-fd72158c`; no Lean/project code, replay, or experiment was executed. Parent audit owns object/controller binding, ordering, and finalizer review.

The five disjoint groups select **32 mathematical modules**, with 281 explicit theorems and 33 definitions. No target-source hash mismatch, duplicate explicit target name, selected-module contamination, target-name collision in retained local sources, or source import cycle was found.

| Receipt suffix | Targets | Theorems / definitions | Local base closure | Earlier worker-83 modules in base |
|---|---:|---:|---:|---:|
| 1792056444552502000 | 4 | 6 / 31 | 123 | 0 |
| 1792056556780734000 | 11 | 112 / 0 | 125 | 2 |
| 1792056661004659000 | 11 | 142 / 0 | 125 | 2 |
| 1792056724230615000 | 3 | 18 / 0 | 222 | 26 |
| 1792056881560243000 | 3 | 3 / 2 | 350 | 29 |

The final group explicitly selects `MarkovThirdLargeFD`, `MarkovSmallAllFD`, and **`MarkovResidualFD`**. Its residual theorem `root_iff_interiorFD` is therefore a replay target, not merely an imported declaration. This confirms method scope, not mathematical completion.

Both drivers match their worker-83 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. All five union records contain the matching batch-driver hash.

The new Python wrapper hashes source files before execution (line 6), requires an existing successful build receipt with matching source path/hash and build mode (lines 7–8), then invokes replay (line 13). It hashes the driver after that invocation when forming the receipt (line 16). Its procedure matches worker 80’s wrapper after changing the evidence directory and timeout from 180 to 150 seconds. This restores source-before-run/build-precondition binding and a recorded driver hash; it does not hash loaded object bytes or freeze source/driver files throughout execution.

The unchanged driver collects all constants from each selected object’s most-private available part into one map and excludes selected module names from direct imports before `Lean.Replay`. Earlier worker-83 modules retained in the base are imported dependencies relative to each group. All preexisting local base sources still match before-run hashes. External trusted source leaves are `Mathlib`, `Mathlib.Algebra.Polynomial.Bivariate`, `Mathlib.Data.List.Palindrome`, `Mathlib.RingTheory.PowerSeries.WellKnown`.

The prior method limits remain: unsafe/partial constants are skipped; axioms are admitted as axioms; duplicate map names retain the last value; matching already-present theorems can skip proof-body comparison. Explicit target/base name checks found no such imported-target or duplicate route in these sources. Pending recursion does not insert declarations as proof assumptions; ordinary declarations still require kernel acceptance.

**Exact binary qualification:** these checks follow source imports and explicit declaration names. They do not inspect actual compiled import tables or compiler-generated/private constant inventories, which the saved group outputs do not list. Absence of source overlap supports the method under the retained dependency boundary, not an independent per-declaration binary witness. No official CLI replay, invocation-time object hashing, or fresh whole-source rebuild is established by this note.

Full local source closure graphs and input hashes are in the companion JSON.
