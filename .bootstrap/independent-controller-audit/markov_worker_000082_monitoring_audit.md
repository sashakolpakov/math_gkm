# Worker 000082 independent mathematical monitoring audit

Read-only audit of request `e2cd486cc57d40438212692fe73d38ca`, on 2026-10-15. No project sources or evidence were changed, mathematical guidance supplied, proposer contacted, successor inspected, project code executed/imported, or proofs/experiments/replays rerun. The audit assesses final statements and retained validation evidence; it does not complete research or missing checks.

## Mathematical conclusion

**The entire polygon-valid third lower diagonal is proved for every actual mixed source path with run length `n≥4` and predecessor denominator `c≥4`.** The two terminal positions left by worker 81 are now handled using the fourth numerator band and the original polygon conditions. The run-four gap is also supplied. This is an infinite source family with no upper denominator bound, not a proof of the full published conjecture.

The exact main statement, `source_third_ge_fourE2`, is:

> Let `n,i,j` be natural numbers and `rest` an arbitrary Boolean list. Let `m = (frame (replicate n true ++ false :: rest)).mid`, and `c = (frame rest).mid.b`. If `n≥4`, `c≥4`, `i+j+2=m.a+3` and `InPolygon m.a m.b i (j+2)`, then
> `coeff m.p i (j+2) * coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2`.

There is **no remaining upper bound on `j`**, coefficient-identification hypothesis, chamber hypothesis, positivity requirement or numerical certificate premise. The conclusion compares the original integer numerator coefficients at `w=1`, with zero coefficients retained. Uniform scalars six and fifteen cancel in the proof; no index-dependent normalization is introduced.

The complete-slice theorem uses the original polygon guard on the first endpoint `(i,j+2)`. Consequently it covers every instance of the original three-guard diagonal predicate in this family. It does not assert an unguarded inequality at every off-polygon index. The polynomial is produced by the pinned source recurrence, not an arbitrary word or synthetic parameter model.

The restrictions remain explicit: this is direction `(1,-1)` at total degree `a+3`, the third **lower** diagonal; predecessor denominators two and three and run lengths below four are not newly included by this theorem. Pure repeated-right paths, horizontal and vertical directions, other unresolved slices and the complete root remain separate. No assertion of publication novelty is made by this audit.

## Fourth-band extraction and corrected chambers

The proof retains the fourth term in the exact denominator identity for `T=thirdRunPolyADB2 n c r`. It begins at degree `3n+4`, precisely where extrapolating worker 81's three-band expression ceased to be justified. With natural count parameters

`q=max(2r−c,0)`, `t=min(c−r,max(3r−c,0))`, `u=max(3r−2c,0)`,

the first two fourth-band numerator coefficients in the final Lean definitions agree with the English formulas:

`R0 = 24t + 48q − 72r + 24c`,

`R1 = 24u − 144t − 480q + 744r − 96rq + 192r² − 288c + 96cq − 288cr + 96c²`.

The complete polynomial equality `fourth_polyE2` identifies the fourth band with eight explicit coefficients. `fourth_series0E2` and `fourth_series1E2` then prove its inverse-series coefficients are `R0` and `6R0+R1`. `extract_four_bandsE2` is an exact formal-power-series identity for all `j≥3n+4` with `c≠2`, retaining every band. There is no analytic convergence assumption or discarded remainder.

The terminal algebra specializes the old reversed shapes at indices `1,0,−1,−2` and adds the actual fourth-band correction at the last two. The corrected chamber definitions match the final English polynomial expressions. The source coefficient adapters used in the inequalities have `n≥3`, `c≠2` and the following explicit parameter ranges:

| Chamber | Range | Proved named coefficient adapters |
|---|---|---|
| Low | `2r≤c≤3r` | Indices `3n+2`, `3n+3`, `3n+4` |
| Middle | `c≤2r`, `3r≤2c` | Indices `3n+2`, `3n+3`, `3n+4` |
| High | `r≤c`, `2c≤3r` | All four indices `3n+2,...,3n+5` |

Each adapter concludes that the stated terminal expression is `15*T_j`. The actual source identity for `c≥4` then gives the uniform scale `90*A_(a+3−j,j)`. Low/middle fourth-entry zeros also have explicit terminal algebra identities and generic extraction infrastructure; there are no separately named low/middle fourth-coefficient source adapters in this batch. The actual terminal inequality proofs use the ten adapters in the table, so no missing adapter is assumed.

The initial middle-chamber specialization used the wrong branch of `t`. The final `terminal_mid_coeff2E2` explicitly proves, from its chamber hypotheses, that the natural minimum coerces to `c−r`; it does not use `3r−c`. The final high branch likewise uses `c−r`; the low branch uses `3r−c`. Equality at `c=2r` is included by the non-strict bounds, rather than omitted to avoid the branch boundary. The boundary `3r=2c` is likewise included.

The recorded independent experiment rejected the initial specialization at `n=3,c=5,r=3,j=13`: predicted scaled coefficient 3600 versus actual raw coefficient 32, hence correct scaled coefficient 2880. This was a coefficient-identification error in an intermediate formula, not a source log-concavity counterexample. Earlier compiled helper identities are not sufficient evidence for their intended source interpretation. Acceptance here concerns the corrected final source hashes and the actual source adapters, which supply the minimum-branch proof explicitly.

## Polygon restrictions, terminal inequalities and run four

`third_polygon_terminal_chamberE2` derives

`c*(j+2) ≤ 3*(c*(n+1)+r)`

from the original polygon's lower-edge inequality and the slice equality. Thus the two starts left by the inherited polygon bound impose exactly the conditions used by the terminal proofs:

- at `j=3n+2`, `c≤3r`;
- at `j=3n+3`, `2c≤3r`.

These are deduced from the source guard, not assumed because an experiment found them. The previous bound ensures no further polygon-valid starting index remains. The coefficient identities retain the fourth-band corrections and zeros, including the zero terminal entry at the upper chamber boundary.

Seven exact polynomial gap certificates discharge the integer chambers. The low chamber is divided into two nonnegative integer parameter regions; the middle chamber into three regions forced by `c≥4`; the high chamber has the two required gap certificates under `r<c`. Their algebraic identities and nonnegativity arguments include boundary cases. The source composition obtains `1≤r<c` from the predecessor frame and supplies all remaining hypotheses. The two- and three-cycle source corrections are excluded by the explicit `c≥4` assumption, not silently discarded.

The first complete-slice theorem has `n≥5`. To extend it to `n=4`, the six exact crossing coefficient identities are proved under the lower run bound. Sixteen separate crossing-gap certificates and exhaustive low/high/small-parameter cases cover starts 9 through 12. The old first-two-band theorem covers starts through 8, and the inherited unified tail theorem covers start 13. The same polygon/terminal argument handles all later permitted starts. This is the content of `source_third_ge_fourE2`; there is no unproved run-four assembly hypothesis.

## Exact residual equivalence

`LongLargeE2 path` is purely a source-family condition:

`∃ n rest, path = replicate n true ++ false :: rest ∧ 4≤n ∧ 4≤(frame rest).mid.b`.

It contains no coefficient inequality, conjecture or proof-certification condition. Its use does not require uniqueness of the representation: any witness is sufficient for the proved source theorem.

The new `Interior63E2` is the inherited exact `Interior638BBB` predicate with **one additional antecedent on its diagonal clause**:

`i+j+2 ≠ a+3 ∨ ¬LongLargeE2 path`.

The horizontal and vertical clauses are unchanged. The three diagonal polygon guards, top-degree and lower-degree restrictions, and inherited low-slope restriction are retained. The new antecedent excludes precisely the third-lower-diagonal cases of the newly proved family; it does not remove another slice or all diagonal obligations on those paths.

`root_iff_interiorE2 : Conjecture63 ↔ Interior63E2` first invokes the existing exact equivalence. The forward direction restricts its diagonal obligations. The reverse direction splits on whether the degree is `a+3` and whether a `LongLargeE2` witness exists: it applies the new full-slice source theorem in that case, and otherwise uses the residual assumption. There is no circular invocation of the desired residual, no assumption that it is already proved, and no hidden stronger theorem replacing the root.

The endpoint clauses of the unchanged root remain accounted for through the inherited exact equivalence; they are not deleted by editing `Conjecture63`. The residual is still an unproved proposition. This equivalence is not a proof of the root or its negation, nor a claim that the residual is a minimal list of every inequality not covered by any historical result.

## Finite evidence

The final terminal experiment ranges over `3≤n≤15`, `4≤c≤18`, `1≤r<c`, `gcd(c,r)=1`. I independently matched the saved inputs and loop-domain/count arithmetic, without recomputing polynomial coefficients:

- 1,274 source parameter triples;
- 3,380 terminal coefficient comparisons in the chambers meeting `c≤3r`;
- 168 independent literal-numerator comparisons for `n≤5,c≤7`;
- 1,274 polygon-valid terminal triples.

The separate run-four experiment ranges over `4≤c≤30`, `1≤r<c`, `gcd(c,r)=1`, and records 274 sources, 4,110 polygon-valid triples across the slice, and 585 literal coefficient comparisons for `c≤8`. The inputs and counts also match. These are finite checks, with empty final failures lists; they are not substitutes for the universal source proofs. The initial failed middle-chamber experiment is retained as development evidence, not erased or counted as a final pass.

## Validation and provenance

The independent companion [validation audit](markov_worker_000082_validation_audit.md) and [replay-method audit](markov_worker_000082_replay_method.md) confirm the following final evidence. No checks were rerun by the auditors.

- All 129 controller-listed artifacts match their live bytes and worker-82 archives. All 127 manifest entries also match; the two additional controller entries are the manifest outputs themselves. All 16 final Lean source and object bindings match. There are no late, unarchived worker-82 files or pending recorded command items.
- The 15 mathematical modules and final Audit each have a successful final-source build. Four successful union replays cover all 15 mathematical modules, in groups of 5, 2, 5 and 3, with each target built before its selected replay. The Audit has a successful individual replay. The last union explicitly targets `MarkovResidualE2`, so its proof is checked as a target rather than merely imported.
- The 27 ordinary validation receipts comprise 21 successful builds, five failed builds and one successful individual Audit replay, with no timeout. Sixteen builds are the selected final builds. The five extra successful builds consist of two obsolete-source helper passes (`Algebra` and `Gaps`) and three earlier same-source helper passes (`FourthPoly`, `Extract`, `Chambers`). They do not add accepted final modules.
- All 74 named mathematical theorems are individually printed in the final Audit output; the source inventory, audit requests, printed closures and validation entries agree. Every closure uses only the permitted standard axioms `propext`, `Classical.choice` and `Quot.sound` (or a subset).
- All 169 preservation rows and 165 initial reconciliation entries match. Saved validation receipts, source snapshots and event payloads agree after accounting for the recorded stdout-prefix limits. There is no unexplained output discrepancy.

The failed chamber experiment occurs at event 93. Events 94–95 preserve the initial probe and correct the branch, and events 101–102 regenerate the affected helpers. The final source coefficient bridge first builds successfully after this correction; its selected replay also follows the corrected build. The obsolete helper passes establish only their auxiliary statements and are not accepted as proofs of the erroneous source interpretation. The final corrected source identities, chamber inequalities and complete-slice theorem have their own matching successful records.

The first finalizer invocation failed on a raw-file versus canonical-JSON contract-hash comparison after writing `validation.json`, before writing its preservation and manifest outputs. The worker repaired that comparison and the second invocation succeeded, regenerating the final outputs. The pinned root and contract were unchanged. The final verification file is timestamped `2026-10-15 09:10:17.962410 UTC`, 66.412851 seconds before the deadline. The controller records **completed**, not timeout, at `09:10:53.528209 UTC`, with elapsed time 1769.152948 seconds and 30.847052 seconds remaining. The structured `final.json` equals the controller report and final agent JSON, and the turn-completed event survives. The separate, more detailed local `report.json` is independently hash-bound; it is not represented as byte-identical to those final reports. Mathematical resolution remains false.

The accepted replay evidence is **alternate-driver kernel replay**, not an official CLI receipt or a fresh rebuild of every inherited dependency. Both drivers are unchanged from the independently assessed versions. The four group source-import closures contain no selected target declarations, source-level duplicate/collision, or cycle; all selected target constants, including helpers and definitions, are collected rather than only named theorems. Earlier group results and inherited dependencies are loaded as imports. Static source inspection does not supply compiled import-table dumps, invocation-time object digests, or an independent per-declaration execution witness. The existing replay behavior concerning unsafe/partial constants, admitted axiom declarations, and already-imported equal theorem declarations remains qualified; the audited source closures expose no route by which a selected target theorem is supplied in the base environment. The wrappers record source hashes after their subprocess; final object/archive bindings, snapshots and chronology supply the recorded provenance, not an invocation-time binary attestation.

Supporting audit SHA-256 values:

| File | SHA-256 |
|---|---|
| `markov_worker_000082_validation_audit.md` | `b2e2767eae87dedca5067e92a0fb8f4df7c973fe76c86a8df249a37dbe4e5e87` |
| `markov_worker_000082_validation_evidence.json` (448 input hashes) | `e2199f9ddc42324cada62196fb655da521c01f2c05b5f4768cb6bc29ac774c80` |
| `markov_worker_000082_replay_method.md` | `9dc4def6730f56c2dcd30369bf9f3dec0c63ad47a72167e0f967113df493d56f` |
| `markov_worker_000082_replay_method_evidence.json` (330 input hashes) | `e314edc93a98cc176f5385c3e7db17cf29a8c2c3716f014239aa643bda6811be` |

## Principal final-source hashes

I independently found all 16 live `*E2.lean` files equal to their worker-82 archives: 15 mathematical modules and the final Audit. Principal SHA-256 values:

| Source | SHA-256 |
|---|---|
| `MarkovLongSourceE2.lean` | `d4189670b551c135579d1ea90a61ae6da0632365b827f2dcbb269ba8f121e715` |
| `MarkovResidualE2.lean` | `e42a02896fb503650c1ae7aaaf42c7f4c5002d6ee7329bfb94e40d0974018b4b` |
| `MarkovTerminalSourceE2.lean` | `387bd6ee64b529cf41d584c6d0770b64a580202beec598c8fc3b02a8f085e96d` |
| `MarkovTerminalCoefficientsE2.lean` | `13db448fba85ccf7d94ce44cc9a345f1cd2f32948011cc40c2ad2cd7f3c7d7eb` |
| `MarkovTerminalAlgebraE2.lean` | `bb720425f63d3203568bf60a2f279ba36f8eb0443075ed3894d925c20a09d4a5` |
| `MarkovFourthPolyE2.lean` | `20045cf60e49fdd1b223ecbe72569a389e87b01f51313d82f3e8220fb5ad7352` |
| `MarkovTerminalChambersE2.lean` | `acbdb5bc1b77e29c1c8649c4d103829f1e6c6ef24ca8b087ee7c46b1a36c1b91` |
| `MarkovRun4CombineE2.lean` | `714f4893c74d0b97d5ebc53002ea7aa2f4375a6010ae1c298868dcf8e0466f43` |
| `MarkovAuditE2.lean` | `a5acd376130f2bdbcde5429afa1d72308a46db96ad1d4c83f58c54d20ce9d683` |

The main complete-slice statement and exact residual equivalence have the stated mathematical scope. The earlier incorrect chamber specialization is not part of the final source identification. The full conjecture remains unresolved.
