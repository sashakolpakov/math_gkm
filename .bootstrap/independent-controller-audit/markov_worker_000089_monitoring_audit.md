# Independent monitoring audit: worker 000089

Request: `6604cff88c7e4daf8bbf37dc04e75558`. Reviewed 2026-10-15. This is a read-only review of completed worker 89, not a completion audit of the entire Markov development or a new literature/novelty review. No project source, proof, experiment, build, replay, finalizer, or active successor was changed or run. Only source/record reading, hashing, and independent enumeration of recorded finite input domains were performed.

**Finding:** the accepted work extends the actual fourth lower-diagonal raw log-concavity theorem from the preceding bound `4a ≤ 3b` to `5a ≤ 4b`. It also proves an exact rational expression for this slice for every natural run length when the predecessor denominator is at least five. The rational expression does not prove log-concavity for arbitrary runs. The full pinned conjecture and its negation remain unproved. No material English/Lean scope mismatch was found.

## Actual new raw inequality

Write `A(i,j) = coeff (frame path).mid.p i j`, and let `a,b` be that frame's middle labels. The coefficients are the original integer coefficients of the protected bivariate numerator, not factorial/binomial-normalized coefficients.

`source_fourth_threeN6604` asserts, for every `rest : List Bool` and every `i,j : Nat`, for the actual path `replicate 3 true ++ false :: rest`,

```
i+j+2 = a+4  →  A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2.
```

There is no polygon, positivity, support, denominator cutoff, experimental formula, or unproved moment premise in this fixed-run theorem. Thus all natural positions on that slice, including its coefficient zeros, are covered. It does not assert all slices, or either other principal direction.

The repaired chain is substantive:

* Four generic coefficient identities for scalar gauges are proved for arbitrary nested integer-polynomial matrices and every natural coefficient index. Four modules extract the 44 needed literal run-three coefficients, using the previously accepted exact run-block matrices.
* Four moment modules, combined by Boolean case elimination, identify all sixteen actual local fourth-moment values with the new table. This discharges the earlier run-three matrix/local-table bridge rather than assuming it.
* Six chamber modules prove the corresponding exact moment and polynomial expansions. The strict chamber boundaries are `0, 1/4, 1/3, 1/2, 2/3, 3/4, 1` for the predecessor fraction `r/c`. Natural truncated differences and minima are explicitly evaluated under the chamber hypotheses. For `c≥5`, reducedness excludes equality at the five internal boundary fractions; the large-source theorem therefore exhausts all cases. It applies the inherited, already checked run-three coefficient certificates, then the actual source coefficient identity and cancels the common factor 24.
* For `c<5`, reducedness yields exactly `(c,r)=(2,1),(3,1),(3,2),(4,1),(4,3)`. All five actual source cases use inherited accepted short-cycle theorems. They correspond to `7/9, 10/13, 11/14, 13/17, 15/19`. No long-cycle formula is silently applied to them.

`source_fourth_lower_four_fifthsN6604` then asserts the same inequality for **every** source path satisfying `5a≤4b`, `i+j+2=a+4`, and all three original `InPolygon` conditions at `(i,j+2),(i+1,j+1),(i+2,j)`. It does not replace these conditions by nonzero-coefficient filtering. Pure repeated-right paths use the existing full Pell diagonal theorem. Every other path has the exact source labels `a=cn+r`, `b=c(n+1)+r`, with `0<r<c`; the slope condition forces `n≤3`. Runs zero, one and two use their inherited source theorems, and run three uses the new unconditional theorem above. There is no numerator or denominator search bound. This gives a genuine infinite source-region extension, while reusing already settled small cases and other overlaps.

## Exact residual, including endpoints

`root_iff_coreN6604 : Conjecture63 ↔ InteriorCore63N6604` is an equivalence with an **unproved** residual. It rewrites through the previously proved exact `root_iff_coreBE` and fills the newly covered fourth-slice cases. It is neither a proof of the residual nor a change of the root.

Let `D=a+b−1` and `s=i+j+2` for a diagonal triple. The residual keeps:

* the horizontal and vertical inequalities under all three original polygon guards and `i+j+4≤D`;
* the diagonal inequalities under all three original guards, `i+j+8≤D`, `a+4≤s`, `a+2≤b`, and `(a+5≤s ∨ 4b<5a)`.

Thus the fourth slice survives in the residual only above the new slope cutoff, while the higher interior diagonal slices remain. The root is still the original conjunction of the `0/1` and `1/1` endpoint clauses and all source-path inequalities in the three specified directions. The exact inherited equivalence carries the endpoint proofs; no new source-membership or support premise is inserted. This review checks the new equivalence against that inherited contract; it does not repeat the entire prior published-source correspondence audit.

## Exact rational representation and its limits

`jet_closed_14N6604` and `jet_closed_34N6604` prove, for every `n : Nat`, exact identities

```
24 (1−X)^9 [U^4] runEntry(e,n) = jetClosed(e,4,n),   e=1,3.
```

The entries are the actual upper-right and lower-right run-matrix entries. Their explicit right sides are polynomial expressions in `n,X` plus `X^n` times such expressions. The accepted proofs use two-step induction, the exact scalar matrix coefficient recurrence, and inherited third-jet identities. They do not use the finite interpolation checks as assumptions. The generated entry-zero and entry-two candidates are explicitly excluded from accepted results.

The embedding is `ℤ[X] → FractionRing ℤ[X]`, proved injective in the inherited `RunFieldBDEE` module. The formal element `1−X` is proved nonzero there, so the denominators `24(1−X)^9` and the inherited jet denominators are legitimately inverted. This is not evaluation at a real number, a restriction of the source family by `X≠1`, an analytic approximation, or an ordered-field inequality. The resulting fraction is identified with an embedded whole integer polynomial.

The new mapping lemmas commute this embedding through the scalar gauges, fourth local moment, and Boolean source-moment expression. `map_fourthN6604` holds for all natural formal parameters `n,c,r`; its source interpretation uses the inherited exact moment theorem for `c≥5`.

`source_fourth_closedN6604` identifies `closedFourthN6604 n c r` with the embedding of **24 times the actual fourth cut polynomial**, for every natural `n`, every predecessor path `rest`, and `c=(frame rest).mid.b≥5`. `source_fourth_closed_iffN6604` proves equality to that actual polynomial if and only if an integer polynomial `P` has this fraction-field image. No truncation or coefficient-support restriction occurs.

The adapters have explicit hypotheses:

* `source_fourth_closed_coeffN6604` requires an integer polynomial `P` and its representation equality, then identifies `P.coeff j = 24 A(i,j)` whenever `i+j=a+4`.
* `source_fourth_lc_of_closedN6604` additionally requires the **particular coefficient inequality** `P_j P_(j+2) ≤ P_(j+1)^2`. It transports that inequality to the actual raw source triple by canceling the common factor. It does not discharge this premise for general runs.

The closed-form source theorem excludes `c=2,3,4`; the existing all-cycle parameter formula and proved fixed-run cases handle their own stated scopes separately. The universal rational identity does not validate the later experimental denominator normalization, formal-series coefficient extraction, or gap certificates automatically.

## Finite evidence, retained as finite evidence

The scripts were read but not executed. The saved `experiments.json` has no recorded failures. Its input list agrees exactly with all coprime `1≤r<c`, `2≤c≤23`, and `n∈{3,4,7,12}`. Independent enumeration of these inputs and the literal polygon/index conditions, without calculating source coefficients, reproduces all three totals: **684 cases, 3,836 literal raw comparisons, and 20,760 valid triples**. Literal recurrence comparisons are restricted to `c≤8`; the larger cases use the recorded cut recurrence. These checks do not prove all runs or denominators.

The other saved experiments have appropriately limited scope:

* Fourth-jet candidate checking uses `n=0,…,41` for each of four entries (168 checks). Only entries 1 and 3 have the new accepted universal induction proofs.
* The symbolic gap probe checks runs `4,…,8` in six chambers: 855 finite coefficient-gap expansions, with no negative coefficients reported. This is not a Lean theorem for all runs or an independently checked source closure.
* The rational normalization records six numerators over `(1−X)^8`, with 1,394–1,420 terms, powers `0,…,4` of `Z=X^n`, and a common 411-term `Z^0` part of `X`-degree 12. Each `Z^1` part begins at `X`-degree 2. The 1,116 saved coefficient comparisons use seven runs `0,1,2,3,4,7,12`, one interior mediant parameter pair per chamber, and indices below `4n+10`. This is far less than universal parameter checking.
* The pre-shift experiment produces a 202-term candidate coefficient polynomial with separate degrees at most four in `n,c,r` and seven in the coefficient index. The stated range is center `j=t+6`, `n=s+t+7`, nonnegative slacks and strict chamber coordinates. Each of six saved gap expansions has 3,645 nonnegative rational coefficients. Neither the universal normalization/extraction bridge nor these complete certificates is Lean-checked here; other positions and small cycles remain outside the claimed experimental range.

The mathematics and correspondence notes explicitly preserve these distinctions. No new arbitrary-run raw inequality or root completion is inferred from them.

## Validation and preservation

Read-only validation support is recorded separately in `markov_worker_000089_validation_audit.md`, its evidence JSON, and the corresponding replay-method note/evidence. These completed notes were read for this mathematical audit; no new execution was performed.

All **156 controller/current/archive bindings** and **154 manifest entries** match. The 23 mathematical-module entries plus Audit have 24 matching final successful builds and one successful 24-target alternate kernel union replay. Every matching final build precedes that replay. All **87 named theorem closures** are requested and individually printed, with only subsets of `propext`, `Classical.choice`, and `Quot.sound`. This includes the new residual and both final Closed adapters. No official CLI or individual direct replay is claimed for this worker.

There are 34 ordinary build receipts: 25 successes, eight failed builds, and one wall timeout. The extra successful build is an obsolete eight-theorem Closed version. The final ten-theorem Closed source has its own successful matching build and replay coverage; the coefficient and LC adapters are not attributed to the earlier receipt. All nine rejected attempts have different hashes from their final accepted versions. Generated fourth-jet entries 0 and 2 have no accepted check or retained object. Successful event messages record output lengths rather than output bytes; the full 8,419-character Audit output is retained and hash-bound in its receipt. The union receipt matches its completed event payload.

All **173 predecessor worker-88 bindings** remain equal to their original archive/controller/current/before-89 values. Its ten excluded drafts remain excluded, with no objects; this worker creates and validates distinct repaired names. The checked imported source base has 441 local modules, including 26 previously accepted worker-88 modules and no excluded draft or new worker-89 target. No static source-name collision, target import contamination or import cycle was found. Both replay drivers are unchanged. The union uses the established batch driver `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`.

This remains **alternate kernel replay over retained imported dependencies**. The method collects selected object constants, including helpers and definitions; it is not only a selected theorem-name check. Static source/import checks do not enumerate actual binary import tables or generated/private constants. Standard unsafe/partial, axiom and already-imported matching-theorem behavior remains qualified in the method note; no source-level target route to those skips was found. Invocation-time object digests and a fresh inherited/full-tree rebuild are absent. Final object hashes are bound to the manifest/archive/controller instead. These qualifications are distinct from the directly saved permitted axiom closures.

Both finalizer invocations succeeded: the first indexed 153 artifacts, then a local report was added and the second indexed 154. The 186 preservation and overlapping 177 reconciliation checks match. The local `evidence/report.json` differs in wording/list organization from the final response, but its request, summary, null completion and substantive scope agree. `final.json`, final agent JSON and controller report agree exactly. Final artifact verification was at **12:22:01.775588 UTC**, 209.477643 seconds before the deadline. The controller completed at **12:22:24.837666 UTC**, elapsed 1613.584436 seconds, with a final response and turn completion. There are no observed late/unarchived files, unmatched started items, or pending finalizer effects. The root and contract pins are unchanged; mathematical completion remains null/false.

Supporting report SHA-256 values:

* Validation audit: `ba0900db94038842ae16c29ff3e8d102efa9d3e15227f8445ed84cdbb57f2167`.
* Validation evidence: `857ada42c89b0ae575e0b5529dd0f9e2f456797173a1b3a7bc78b6f4d8e8e055`.
* Replay-method audit: `e76f932a6bec1d09b2e06113d3020b4ae1bd273b908480fa6b86d28ccfbbd5bb`.
* Replay-method evidence: `c2f55ea077500185304c0678b1a46870c44d163bdc956dfaff710f7dcc1962aa`.

The supporting audit rechecked 1,104 combined input hashes as unchanged at 12:30:39.194006 UTC.

Selected statement-bearing final source hashes observed in this review:

| File | SHA-256 |
| --- | --- |
| `MarkovFourthThreeSourceN6604.lean` | `0928fd2bfb885a34806a5ce7a4e4c626d8ead9e398ed740c3e4ddac982befaa4` |
| `MarkovResidualN6604.lean` | `03150ff62a0206f2a5462a5f5076f4e34117036534b28097ec3d4be0a0420643` |
| `MarkovFourthClosedN6604.lean` | `0db534b663f757907ed16f5c360a2e5d3eb79b89431cc268a4bd473e4c2eb446` |
| `MarkovGaugeCoeff6604.lean` | `513cc393cf1bdec899efaf70b12ac4e9c051009d35a1a0ee89a8ec9bd7fca4b4` |
| `MarkovThreeLocalCombinedN6604.lean` | `ccbca58d0440ea23b2f3f95975510d42e4a827d5fedba82ffa65b5ee07d3b6f8` |
| `MarkovRunJetFourth1N6604.lean` | `47f284484f163c163d9ea825f374b9ee3e794233d18f9763880d7f0f294e03ff` |
| `MarkovRunJetFourth3N6604.lean` | `a6480ad70d85aa5bbaeead35f7cf6751187736dc302960d5432251420d97415f` |

The 87 named theorems include 44 coefficient helpers and the local/chamber/mapping infrastructure; they are not 87 new conjecture-level results. The reported 23 mathematical modules include a definition-only table module and a one-line compatibility import shim.

**Disposition:** accept the expanded source-connected fourth-slice theorem, the exact root/residual equivalence, and the qualified universal rational identity at their stated scopes. Retain all general inequality, coefficient-extraction, full correspondence, and root-completion obligations. No repair or research guidance was provided.
