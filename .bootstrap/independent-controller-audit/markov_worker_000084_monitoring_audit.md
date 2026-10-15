# Worker 000084 independent mathematical monitoring audit

Read-only audit of completed request `8833a0fb588547db9bdf18872634da54`, 2026-10-15. No project changes, proposer contact, mathematical suggestions, active-successor inspection, proof/replay/experiment reruns, or project-code execution/imports occurred. Inspection of statements and proofs, file hashes and saved receipts, and loop-domain/count arithmetic supply the audit evidence.

## Main conclusion

**The final Lean proves raw log-concavity on the third lower diagonal for every finite source path.** The formerly conditional two-cycle tail identification and remaining three-cycle cases are now connected to the actual source recurrence and proved. The pure-right family reuses its existing all-diagonal theorem. This completes one diagonal direction at total degree `a+3`, not the full conjecture.

The main theorem `source_third_lower8833` quantifies over every `path : List Bool` and every natural `i,j`. With `m=(frame path).mid`, its hypotheses are exactly

- `i+j+2=m.a+3`;
- the original `InPolygon m.a m.b` guards at `(i,j+2)`, `(i+1,j+1)` and `(i+2,j)`.

Its conclusion is

`coeff m.p i (j+2) * coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2`.

There is no denominator, numerator, path-length or run-length bound, assumed coefficient formula, positivity premise, experimental assumption or support filter. These are the pinned literal integer coefficients in squared variables, with the third squared variable specialized to one. Zero coefficients are included. Uniform factors six, fifteen and ninety used in intermediate identities cancel; no index-dependent normalization is introduced. The statement does not assert an unguarded inequality at arbitrary off-polygon indices.

The theorem is universal over the pinned path-defined source family. This batch does not newly certify the entire reduced-rational/path, Laurent or homogeneous three-variable correspondence to the published paper. No publication-novelty claim is made. The rational endpoint clauses remain in the unchanged full root and are retained through exact inherited equivalences.

## Two-cycle source identification

For a mixed path `replicate n true ++ false :: rest`, put `c=(frame rest).mid.b`, `r=(frame rest).mid.a`. The proved source identities give `a=cn+r`, `b=c(n+1)+r`, and `0<r<c`. Thus `c=2` forces `r=1`.

Let `T=thirdRunPolyADB2 n 2 1` and `F=firstRunPolyADB2 n 2 1`. The inherited corrected source polynomial is

`T - 12*X^(2n+3)*(F+1+X)`.

The uncorrected polynomial itself contains an extra two-cycle term. The new definition `cleanThird8833 = T - 6*X^(2n+3)*F` removes exactly that term, and `two_denominator8833` proves its full four-band denominator identity for every natural `n`. `two_extract8833` extracts coefficients under `2n+3≤j<3n+4`, where the fourth band contributes zero because of its delay. These are exact formal polynomial/power-series identities, without convergence assumptions or discarded terms outside a proved index bound.

`two_corrected8833` then proves that the actual corrected polynomial equals

`cleanThird8833 - 6*X^(2n+3)*(F+2+2X)`.

The first two coefficients of `F` are proved directly for every `n`: `2n+2` and `6n+2`. Both layers of correction are therefore retained, rather than applying a large-cycle formula at `c=2`.

The four final coefficient theorems hold for **every `n≥4`**. After the common factor six in the source identity, they give the exact raw values

| Point on the source slice | Raw coefficient |
|---|---|
| `(3,2n+1)` | `440n-532` |
| `(2,2n+2)` | `120n-92` |
| `(1,2n+3)` | `22n-8` |
| `(0,2n+4)` | `2n` |

These were merely symbolic/finite proposals in worker 83; their actual-source identification is now proved in Lean. The two terminal inequalities follow from these identities and nonnegative polynomial expressions in `n-4`. `source_third_two_long8833` combines them with the inherited first-two-band theorem for `j≤2n`. The slice equation and nonnegative natural `i` force `j≤2n+2`, leaving exactly the two terminal starts `2n+1,2n+2`. This long-run source theorem needs no polygon premise. The all-run wrapper covers runs 0 through 3 with earlier checked theorems and states its common first-endpoint guard.

## Three-cycle identification, crossings and terminal correction

When `c=3`, source reducedness gives exactly `r=1` or `r=2`. Six crossing coefficient identities, at indices `2n+1` through `2n+6`, now hold under `n≥4` and `c≠2`; their derivations retain the original formal-series delays. They are not introduced as numerical formulas.

For each actual remainder, four crossing-gap certificates are universal in the nonnegative integer parameter `n-4`. Two additional reversed-tail certificates are universal in their nonnegative integer parameter. Their exact gap identities are proved by ring normalization and their signs by Lean arithmetic/positivity. The Python symbolic expansions are development evidence, not premises.

The corrected terminal polynomial coefficients correspond to the following raw source values beginning at `j=3n+2`:

- `r=1`: `72,12,1`;
- `r=2`: `292,72,12,1`.

The last value one in each list comes from the **positive `6*X^b` three-cycle correction** to the six-times-source polynomial. The uncorrected coefficient at that exponent is proved zero before adding the correction. Omitting it would change the endpoint and would not prove the actual source statement.

The full coefficient assembly is exhaustive: first-two-band starts `j≤2n`; crossing starts `2n+1,...,2n+4`; reversed-tail starts from `2n+5` through `3n+1`; and the corrected terminal start(s). `three_lc_18833` covers all `j≤3n+2` for remainder one; `three_lc_28833` covers all `j≤3n+3` for remainder two. These bounds are exactly those forced by the source slice equation and natural `i`. In particular run four and the boundary of the reversed tail are included. `source_third_three_long8833` transports the result with all formula premises discharged and no polygon assumption for these long-run cases.

## Global path coverage and accounting

The global source theorem invokes the proved first-false decomposition. For a pure-right path, `right_raw_diagonal0618` already proves every polygon-valid diagonal, and the exact source labels are rewritten before applying it. The worker correctly identifies this as inherited coverage, not a newly solved Pell obligation.

For mixed paths, run lengths 0, 1, 2 and 3 use their existing theorems. For `n≥4`, reducedness gives predecessor denominator at least two; the branches `c=2`, `c=3` and `c≥4` use the new two-cycle result, new three-cycle result and inherited worker-82/83 result respectively. No path or small-cycle case is silently omitted. The substantive mathematical gain is completion of the missing long-run small-cycle source inequalities and the resulting universal third-lower-slice assembly.

## Exact reduced goal

`root_iff_interior8833` first removes the now-proved degree `a+3` cases from worker 83's residual. All horizontal/vertical clauses remain exactly as before. The diagonal clause has the original three polygon guards, inherited upper bound and the new lower bound `a+4≤i+j+2`.

`root_iff_core8833 : Conjecture63 ↔ InteriorCore638833` further reuses the already proved six upper slices and the entire Pell diagonal family. Let `s=i+j+2` and `D=a+b-1`. The remaining diagonal premises in Lean are

`i+j+8≤D`, `a+4≤s`, `a+2≤b`,

together with all three original polygon guards. The first is `s+6≤D`, hence the English range is exactly

`a+4≤s≤a+b-7`, `a+2≤b`.

There is no off-by-one deletion: the six inherited upper depths are `D-s=0,...,5`, while depth six remains in the core. When `a+2≤b` fails, reducedness gives `b=a+1` and the checked near-one/Pell source theorem supplies the omitted diagonal. The horizontal and vertical predicates keep their original three guards and the unchanged interior condition `i+j+4≤D`; they are not discarded for Pell paths or small denominators.

Both implications are checked. Root-to-core restricts existing obligations. Core-to-root applies either the core premise or the corresponding proved upper-slice/Pell theorem, after the earlier exact equivalence has already accounted for the three lower slices and endpoint clauses. The reverse implication takes the core predicate as its stated antecedent; it does not assert that predicate unconditionally or hide an unproved coefficient-identification premise. The endpoint propositions for `0/1` and `1/1` are not silently removed from the root: their treatment is inherited through the exact equivalences.

`source_lower_three8833` combines the first three lower slices using the polygon-derived lower bound `s≥a+1`. `source_diagonal_ten8833` then proves every guarded diagonal inequality for source denominator `b≤10`: the three lower and six upper ranges overlap or meet. This corollary is a universal algebraic consequence of those bounds, not a finite scan. It establishes **only the diagonal direction**, not the full conjecture even for that finite denominator range.

The core remains an infinite, unproved proposition. It is not advertised as a minimal list of every inequality not covered by any older special-family result. The theorem proves neither the root nor its negation.

## Finite evidence

I inspected the scripts and matched the saved loop domains and count arithmetic without evaluating source polynomials or rerunning experiments.

The third-slice experiment includes 231 small-cycle inputs, namely three pairs `(c,r)` with `4≤n≤80`. It records 847 terminal coefficient comparisons, 27,104 backward-slice positions, and 504 independent literal-recurrence positions for `n≤10`. It also checks all reduced fractions with `2≤b≤40` by the literal recurrence. The resulting **30,629 triple comparisons** comprise 26,642 in the small-cycle scan and 3,987 in the all-fraction scan. They represent **29,799 distinct source/index triples**, with 830 repeated between the two scans. Saved inputs and these counts match, and the failures list is empty. Repetition does not invalidate the experiment, but its comparison count is not a count of distinct triples.

The fourth-lower-slice probe checks 1,101 reduced fractions with `2≤b≤60`, 12,866 valid triples and 4,185 independent literal coefficient positions for `b≤30`. These counts match the saved ranges. The twelve displayed core examples, beginning at source `3/11`, are finite valid inputs with positive computed gaps. The probe explicitly establishes **no universal fourth-slice formula or inequality**, and this batch admits no such theorem. Neither the finite third-slice checks nor the fourth-slice probe substitutes for a universal proof or resolves the core.

## Validation and provenance

The independent [validation audit](markov_worker_000084_validation_audit.md) and [method audit](markov_worker_000084_replay_method.md) establish these retained-record findings without executing any check anew:

- All **84** controller after-hashes match current bytes and worker-84 archive bytes; all **82** manifest entries also match. The two excluded self-manifest outputs are separately controller-bound. All ten final source/object pairs match. There are no late/unarchived worker-84 files, pending command items or unfinished validations.
- All **nine mathematical modules and final Audit** have successful final-source builds and alternate kernel replay. Two unions check eight modules and then all nine: **17 selections of nine distinct modules**, not 17 modules. The final union explicitly includes `MarkovDiagonalCore8833`; the global slice theorem and both residual modules are selected targets rather than merely imported declarations. Every target build precedes its selected replay.
- There are **17 ordinary receipts**: eleven successful builds (nine mathematical modules plus the earlier and final Audit), two successful Audit replays, and four failed builds, with no timeouts. The failed TwoTail, TwoCoefficients, TwoSource and ThreeBridge attempts are retained and superseded. Receipt snapshots and controller events match, allowing only exact documented output-prefix truncation.
- The earlier Audit checks 52 names; the later, final Audit directly prints **all 55** names, including the core module's three additional theorems. The final source inventory, requests, full build output and validation entries agree exactly. All axiom closures are subsets of `propext`, `Classical.choice`, `Quot.sound`.
- All **159** preservation rows, 40 initial reconciliation entries and worker 83's 189 inherited manifest entries match; these overlapping lists are not counts of disjoint inputs. Pinned root and canonical contract remain unchanged. The eight upper-six reconciliation entries retain their distinct historical statuses (including compiled-only and unaccepted development files); matching their hashes does not promote those statuses or constitute fresh replay.

The single finalizer invocation succeeds at events 194–195. Final verification is timestamped **2026-10-15 10:01:22.494491 UTC**, 383.955369 seconds before the deadline. Both unions and the final Audit replay precede it. The final agent JSON and turn-completed event are retained, and `final.json` equals the controller report and final agent JSON. There is no separate local evidence report, which does not affect that retained final response. Controller outcome is **completed** at **10:02:01.453627 UTC**, elapsed **1455.003768 seconds**, with 344.996232 seconds remaining. Four rejected builds, shell capability failures and a repaired documentation patch are not counted as proof successes. Mathematical resolution remains false and completion null.

The replay evidence uses the unchanged established individual driver and union driver; it is **alternate-driver kernel replay**, not official-CLI success or a fresh whole-source rebuild. The wrapper hashes selected sources before replay, requires successful matching builds, and records the driver digest afterward. Static source-import/name analysis finds no selected target in either imported base, explicit-name collision, duplicate target, source cycle or retained baseline mismatch. The source closures have 353 and 371 local imported modules, with zero worker-84 targets in those bases. All available target constants are collected, including definitions and generated declarations, rather than only the named theorem list.

Inherited compiled dependencies remain trusted. The replay procedure's unsafe/partial skip, axiom admission and already-imported-equal-theorem proof-body skip remain explicit qualifications; static source checks expose no selected-target import route to the last behavior. Dependency recursion does not install unfinished proofs as assumptions. Actual binary import tables, private/generated-constant inventories and invocation-time object digests are not supplied. Source snapshots, build chronology, final object hashes and archives support the retained validation record but do not establish a new whole-dependency-tree proof audit.

Supporting report hashes:

| File | SHA-256 |
|---|---|
| `markov_worker_000084_validation_audit.md` | `c5eeb63717d1217b8695ea1670f57cb623265277aef3bb9ad0f67b2c37c64e40` |
| `markov_worker_000084_validation_evidence.json` (397 stable input hashes) | `59a2df73d93b693f19612178fd6500a314632c5bf4d2ddce6860af9bcbfbad12` |
| `markov_worker_000084_replay_method.md` | `f0e13e85a508070f2834841048c8e79ee900c6ffdbccb7c724da2f63c802ad11` |
| `markov_worker_000084_replay_method_evidence.json` (387 input hashes) | `da5be2eedc60b18be98ca5ee8cf56101408bf1ff40ef309a9d3ddb041156942c` |

## Principal final-source hashes

All ten final `Markov*8833.lean` files match their worker-84 archive bytes: nine mathematical modules and Audit. Principal SHA-256 values:

| Source | SHA-256 |
|---|---|
| `MarkovThirdGlobal8833.lean` | `cad5fbec1cbc4fc6dd51a0fe7a8a9ccd659abd1f58efb153cc9616b53f1a3ee1` |
| `MarkovDiagonalCore8833.lean` | `8a9257ddf87503e29066be6f8552df7c39ebf86ceedbdac2607dc181f52c714c` |
| `MarkovResidual8833.lean` | `e5671c4ab0a23e45c01916ef7b23c083ed7b105e6048f853a1b686ca4249c090` |
| `MarkovTwoTail8833.lean` | `40e8babe4e87d3f45c5eb2d7b1c05d5722ea4d47d5b01a3322158af1d5efa253` |
| `MarkovTwoCoefficients8833.lean` | `ab035fa269a9e26be54601fdbec807275188c4b8ccfb31ca566448119c79edcd` |
| `MarkovTwoSource8833.lean` | `5cdef91205d98c21eb63e8a4eb2c2ad596233bca616e12b81fa6a61644bb8e7b` |
| `MarkovThreeBridge8833.lean` | `643070e88e20c5eb192f466a71a5f825971259f0e8aee54e34d76ce3c0c0aef3` |
| `MarkovAudit8833.lean` | `facdafb42b5a42f96dfb359f5e27a8bdb9725ec746c98937795d8379d0c60f9c` |
