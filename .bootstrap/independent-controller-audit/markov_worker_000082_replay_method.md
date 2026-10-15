# Worker 82 replay-method continuation audit

Read-only review of the four saved groups in `evidence/markov-e2cd486c`; no Lean/project code, replay, or experiment was executed. Parent audit owns artifact/receipt/controller binding and repair chronology.

**The four disjoint groups select all 15 listed mathematical modules, containing 74 explicit theorems and 25 definitions.** No target-source hash mismatch, duplicate explicit target name, selected-module contamination, target-name collision in a retained local source, or source import cycle was found.

| Receipt suffix | Target modules | Theorems / definitions | Local base closure | New worker-82 modules in base |
|---|---:|---:|---:|---:|
| 1792054670831495000 | 5 | 29 / 23 | 129 | 0 |
| 1792054997721058000 | 2 | 14 / 0 | 187 | 5 |
| 1792055074828959000 | 5 | 22 / 0 | 129 | 0 |
| 1792055297353539000 | 3 | 9 / 2 | 319 | 12 |

The final three-module group explicitly selects `MarkovRun4CombineE2`, `MarkovLongSourceE2`, and **`MarkovResidualE2`**. The root-residual module is therefore included as a replay target, not merely imported. Its explicit theorem names are `root_iff_interiorE2`. This is a method/scope observation, not an assessment of their mathematical strength.

Both replay drivers match their worker-82 before-run hashes: batch `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`; established per-module driver `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The prior pinned Lean.Replay/LeanChecker analysis applies unchanged. The batch collects all constants from each selected object’s most-private available part, excludes selected module names from direct imports, and invokes one kernel replay over the union map. Retained earlier worker-82 modules remain imported dependencies relative to each group.

All preexisting local base sources match their before-run source hashes. The closure analysis terminates at four retained external imports: `Mathlib`, `Mathlib.Algebra.Polynomial.Bivariate`, `Mathlib.Data.List.Palindrome`, and `Mathlib.RingTheory.PowerSeries.WellKnown`. These dependencies are not freshly rebuilt or replayed by this procedure.

The unchanged method skips unsafe/partial constants, accepts axioms as axioms, and can skip proof-body comparison for an already-present theorem matching name/type/universe parameters/mutual-block field. Union-map insertion also retains only the last same-name constant. No duplicate explicit target names, imported target declarations, or checked unsafe/partial/custom-axiom/sorry tokens were found in the selected sources. Pending dependency bookkeeping does not insert declarations as assumptions; ordinary declarations still require kernel acceptance.

**Exact binary qualification:** these checks follow source imports and explicit source declaration names. They do not inspect actual compiled import tables or compiler-generated/private constant inventories, which the group outputs do not list. Absence of source overlap supports the static method assessment under the retained dependency boundary; it is not a separate per-declaration binary witness. No invocation-time object hashing, official CLI replay, or whole-source rebuild is established by this note.

Full source closure graphs and input hashes are in the companion evidence JSON.
