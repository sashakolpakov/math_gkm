# Worker 81 replay-method continuation audit

Read-only review of the four saved replay groups under `evidence/markov-53d5229e`. No project code, Lean, replay, or experiment was executed. Parent audit owns receipt/object/controller binding and timing.

**No selected-module contamination, explicit target-name collision, duplicate explicit target name, or source import cycle was found.** The four disjoint groups select 19 modules containing 71 explicit theorems and 19 definitions. Their current source hashes match the group records.

| Group receipt suffix | Targets | Explicit theorems / definitions | Local base-closure modules | New worker-81 modules in base | Imports predecessor TwoBandsSource? |
|---|---:|---:|---:|---:|---|
| 1792052755481715000 | 7 | 15 / 1 | 126 | 1 | No |
| 1792053321658419000 | 6 | 25 / 18 | 133 | 7 | No |
| 1792053444554492000 | 2 | 15 / 0 | 179 | 16 | Yes |
| 1792053451814792000 | 4 | 16 / 0 | 131 | 5 | No |

The two-module group selects `MarkovCrossTailLC53D` and `MarkovThreeBandsSource53D`. Its retained imports include `MarkovTwoBandsSource07F1`; none of the four groups selects that predecessor module for replay. These checks therefore do not repair its worker-80 replay gap. Other groups retain earlier worker-81 modules as imported dependencies. In particular, the seven-module group retains `MarkovTailShape53D`, which is outside these four target lists. “Inherited” is relative to each selected group.

All local base sources that existed in worker 81’s `before.json` still match those baseline hashes. Each closure stops at the same four external source imports: `Mathlib`, `Mathlib.Algebra.Polynomial.Bivariate`, `Mathlib.Data.List.Palindrome`, and `Mathlib.RingTheory.PowerSeries.WellKnown`. These are retained trusted dependencies, not a fresh rebuild.

`ReplayBatch07F1.lean` remains SHA-256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, matching the worker-81 before-run hash. The earlier method analysis applies unchanged: all constants from each selected object’s most-private available part enter a union map; requested module names are removed from direct imports; `Lean.Replay` then invokes kernel declaration checks. Unsafe/partial constants are skipped, axioms are admitted as axioms, and equal already-imported theorems can bypass proof-body comparison. None of the selected mathematical sources contains the checked unsafe/partial/custom-axiom/sorry tokens. Replay does not itself enforce an allowed-axiom policy.

A later same-name insertion would overwrite an earlier union-map entry. The explicit target-name and base-source scans found no such collision or imported-target route here. Dependency recursion does not insert pending declarations as assumptions; declarations must still be accepted by the kernel against declarations already present. The unchanged driver adds no circular-proof shortcut.

**Exact binary-import qualification:** these are source import and explicit declaration-name checks, not inspection of actual compiled import tables or compiler-generated/private constant inventories. The group outputs do not list those tables or individual declarations. The absence of source overlap therefore supports the static method conclusion under the reused dependency boundary; it is not a separate per-declaration binary witness. No invocation-time object hashing or whole-source rebuild is established by this method note.

The companion JSON stores full local closure graphs and input hashes; the worker-80 method note records the pinned Lean.Replay/LeanChecker analysis.
