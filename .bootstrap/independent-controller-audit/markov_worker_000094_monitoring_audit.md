# Independent monitoring audit: worker 000094

Request `04290504255048ec8a33fbe263ddb123`. Read-only mathematical/retained-evidence review on 2026-10-15. No project source, theorem, build, replay, experiment, finalizer or controller was changed, executed or completed. No proposer was contacted, no mathematical guidance was supplied, and no active successor was inspected. Independent calculations were limited to reading/parsing, hashing and counting finite input/index domains. This is not a fresh full-publication correspondence or historical-novelty audit.

**Result and validation boundary:** the compiled source proof gives actual raw fourth-diagonal log-concavity in the block `j=n+k`, `5≤k≤n`, for actual predecessors with denominator `c≥5` and **numerator `r≤3`**. The source adapter and exact residual have successful separate replay records, but their eighteen new fixed-numerator algebra dependencies have only successful compilation, not a completed separate replay. Thus no mathematical formula hypothesis remains in the source theorem, while an independent replay of the complete new proof chain remains unfinished. The broader `r≥4` block result is not established. The full conjecture remains open.

## Exact coefficient meaning and hypotheses

For `n : Nat`, `rest : List Bool`, define

```
path = replicate n true ++ false :: rest,
c = (frame rest).mid.b,   r = (frame rest).mid.a,
a = (frame path).mid.a,   P = (frame path).mid.p.
```

Inherited source identities give `a=nc+r`, `b=(n+1)c+r`, and the actual reduced predecessor has `1≤r<c`.

The final `source_fourth_block_smallM042` assumes exactly

```
c≥5,   r≤3,   i,k : Nat,   5≤k≤n,
i+(n+k)+2=a+4,
```

and concludes

```
coeff P i (n+k+2) · coeff P (i+2) (n+k)
  ≤ coeff P (i+1) (n+k+1)^2.
```

Let `j=n+k` and `b_t=coeff P (a+4−t) t`. The ordered triple is

```
(b_j,b_(j+1),b_(j+2))
  = (coeff P (i+2) (n+k),
     coeff P (i+1) (n+k+1),
     coeff P i (n+k+2)).
```

Its first coordinate pair is `(i+2,n+k)`, not `(i,n+k)`. All three points have total degree `a+4`. For each `n≥5`, the covered starting indices are `n+5,…,2n`, **including `2n`**. For `n<5`, the stated `k` interval is empty. There is no fixed upper bound on `n`, `c`, the predecessor path, or denominator.

The theorem assumes no polygon membership, positivity, nonzero support, experimental word identification, coefficient formula, or auxiliary gap inequality. Natural zero coefficients remain. It is stronger than its original polygon-guarded instances. The restriction `r≤3` is essential to the stated proved scope; it refers to the **predecessor numerator**, not the final source numerator `a=nc+r`. Actual-path reducedness supplies the corresponding coprimality automatically; no arbitrary non-source polynomial is substituted.

Separate final declarations handle `r=3`, `r=2` and `r=1`. The combined theorem uses `(frame_reduced rest).1` to rule out `r=0` and exhaust these three cases. This is not an all-predecessor or complete fourth-diagonal theorem. Offsets `k=1,2,3,4`, later shifted positions and small denominators `c=2,3,4` are outside the new block assertion.

## Algebraic statements and actual source transfer

For each fixed numerator `r=3,2,1`, the chart substitutes

```
c=C+5,   k=J+5,   n=J+E+5,
C,J,E≥0.
```

The extra chart argument `R` occurs only as `R^0`; the source application sets it to zero. It is not a free predecessor numerator. The three coefficient-value identities expand

```
V_t = fourthShape(c,nc+r,n+k+t) + shiftShape(n,c,r,k+t),
t=0,1,2,
```

as degree-four polynomials in `C`, with exact integer-polynomial coefficients in `J,E`. Each fixed-numerator gap module defines the nine coefficients of `V_1²−V_0V_2`, proves their exact expanded identities using `ring`, and proves nonnegativity for `J,E≥0` using `positivity`. The chart combines all nine coefficients with `C≥0`. All three value identities and all nine gap coefficients are present for each fixed numerator; there is no fitted value or unproved middle-value premise retained in the chart statement.

The integer parameter inequalities `blockThree_logConcaveM042`, `blockTwo_logConcaveM042`, and `blockOne_logConcaveM042` then substitute `C=c−5`, `J=k−5`, `E=n−k`, discharging every sign condition from `c≥5`, `5≤k≤n`. Their auxiliary domains do not require coprimality. These are actual compiled Lean proofs, with their incomplete separate replay status distinguished below.

For each actual source, the adapter uses the inherited exact identity `source_fourth_block_shape_extendedCC` at offsets `k,k+1,k+2`. Its hypotheses `5≤offset<n+3` hold at all three points because `5≤k≤n`. In particular, at the boundary `k=n`, the last coefficient is at second index `2n+2`, still within the source coefficient formula. The three values equal the same positive scalar **7560** times the three raw coefficients. The proof applies the appropriate fixed-numerator inequality and cancels that common scale. There is no index-dependent normalization or deletion of zeros.

This establishes the source theorem from the compiled algebraic proofs, rather than making the algebra a formal hypothesis. Successful replay of the adapter over those compiled imports does **not** separately recheck the imported proofs. That is a validation limitation, distinct from a hidden mathematical premise.

## Early exact representation and general-numerator partial work

`source_fourth_early_shapeM042` is an exact identity, not an inequality. For actual `c≥5`, natural `n,i,k`, `i+(n+k)=a+4`, `5≤n+k`, and `k<n+3`, it proves

```
7560 · coeff P i (n+k)
  = fourthShape(c,nc+r,n+k)
    +315·convSeven(shiftPoly(n,c,r), k).
```

The offset `k` itself need not be at least five: the correction is evaluated by its exact truncated finite convolution. `earlyBlockValue_eqM042` recovers the inherited polynomial `shiftShape` expression only under `k≥5`. Thus the small-offset falling-factorial restriction has not been silently dropped. Neither declaration proves the missing early-offset inequalities.

For the general-numerator chart `r=R+4`, `c=R+C+5`, only the scalar gap groups of `R`-degree four through eight have successful selected checks. These supply fifteen individual nonnegativity theorems for their explicitly defined scalar expressions. The three full coefficient-value decompositions and lower gap groups remain unfinished. Without those identifications and remaining coefficients, the selected high-degree pieces are not an actual source block inequality for `r≥4`.

In particular, the written `source_fourth_blockM042` in `MarkovBlockSourceM042.lean` omits the `r≤3` restriction, but it is an **excluded draft**, not the accepted combined theorem. The similarly broader LC and residual drafts must not be substituted for `source_fourth_block_smallM042` or `root_iff_coreSmallM042`. Some split helper files duplicate later grouped declarations and are excluded even though their separate compilation succeeded; exclusion and compile failure are different statuses.

## Exact residual and preserved boundaries

`InitialFourthRegionSmallM042` contains the actual path decomposition, `c≥5`, unchanged equation `i+j+2=a+4`, and exactly the disjunction

```
j<n
or (j=n and n≥4)
or (there is k with r≤3, j=n+k, 5≤k≤n).
```

The predecessor-numerator restriction appears inside the new block branch. It is not applied to the already proved initial/first-shift branches, and it is not omitted from the new branch.

`root_iff_coreSmallM042` starts from `root_iff_coreN6604`, keeps the horizontal and vertical clauses unchanged, and adds only the negation of that exact removed-region predicate to the diagonal clause. All three original polygon guards remain, along with `i+j+8≤a+b−1`, `a+4≤i+j+2`, `a+2≤b`, and `a+5≤i+j+2 ∨ 4b<5a`. The reverse implication fills the three removed branches with the matching source theorems; the forward implication restricts the old inequality. Original endpoint clauses remain inherited through the exact equivalence. There is no altered root, shifted boundary or weakened target.

The residual itself remains unproved. The source and residual proofs are compiled and separately replayed only over their retained compiled dependencies, as detailed below. Neither the equivalence nor the isolated high-degree certificates resolves the full conjecture.

## Finite experiments

No research computation was rerun. Independent enumeration of the experiment's input/index domain matches its saved list of **866 cases**: all coprime `1≤r<c`, `5≤c≤20`, with `n=4,5,6,9,12,17,25`, plus `n=40,81,150` at `(c,r)=(5,1),(5,4),(7,3),(11,7)`.

The script compares the stored low-plus-shift numerator convolution with exact lower-cut recurrence values, for **23,798 coefficients** at indices `0≤j≤2n+2`. Its **8,868 “shape positions”** are the subset of those coefficient checks with `j≥n+5`; it does not separately evaluate the explicit `shiftShape` polynomial. It tests **7,136** polygon-valid block triples and **122** run-four first-shift triples. The block tests include general `r`; only 251 input cases and 2,268 block triples lie in `r≤3`. Those subset counts are independent domain counts, not additional computations or universal proofs.

For `b≤70`, the script separately evaluates the literal bivariate source recurrence via its rational path and compares **5,214** full-slice coefficient positions, including zeros. All five reported counts match independent enumeration. These are overlapping tests, not a number of distinct established statements, and no finite success extends the formal `r≤3` restriction.

The onset probe records sixteen candidate gaps: offsets `k=1,2,3,4`, each in the general `r≥4` chart and the three fixed-numerator charts. Each general-chart expansion has 585 terms and each fixed-numerator expansion 117, with no recorded negative coefficient, on the declared symbolic domain `n≥4,c≥5,1≤r<c`. These are experimental polynomial records only. The early exact representation does not turn them into accepted inequality proofs.

## Retained compilation, replay and timeout boundary

Independent retained-evidence review finds **328 controller/current/archive bindings** and all **327 artifact-index entries** matching. The single `artifact-verification.json` file map omits only itself; there is no separate `artifacts.json`. All final inventoried sources have matching successful build receipts, attempt snapshots and indexed objects. No unarchived, later changed or pending worker-94 artifact was found. All 147 retained worker-93 artifacts remain unchanged. All 162 preservation and 298 initial reconciliation comparisons match, with overlap between those sets.

There are **27 inventoried mathematical modules plus Audit**, containing 64 named theorems and 135 definitions; four modules contain definitions only. All 64 final theorem names match the inventory, Audit requests and individually printed axiom closures, which use only subsets of `propext`, `Classical.choice`, and `Quot.sound`. Audit was compiled, not separately replayed. The older 63-closure Audit was superseded by the final 64-closure version. Full output is retained in hash-bound receipts, although successful event payloads report output lengths instead of duplicating that output.

The 69 actual build invocations comprise 42 successful builds, 16 failures and 11 timeouts. One additional queued DGap0 record explicitly skipped execution and is not a failed Lean invocation; its later build passed. The 42 successful builds comprise 28 final inventory/Audit checks, nine excluded SplitAG helper checks, and five superseded versions. Thus the 85 excluded drafts are not all failed compilations: nine have successful builds and objects, but are excluded duplicate helpers; the other 76 lack a successful final-hash build/object. No excluded helper occurs in any inspected replay target or import graph.

All seven union attempts have completed command events and matching target-source hashes:

| Selected group | Retained outcome |
| --- | --- |
| ResidualSmall | Success: one theorem |
| 26 inventory modules except ResidualSmall | Timeout after 180.234 seconds |
| BlockSmall and EarlyBlock | Success: nine theorems |
| LDefs and LGap4–8 | Success: fifteen theorems |
| Six B algebra modules | Timeout after 120.272 seconds |
| Six A algebra modules | Timeout after 120.278 seconds |
| Six D algebra modules | Timeout after 120.294 seconds |

The successes cover **nine distinct modules, 25 theorems and 63 definitions**. The **18 A/B/D algebra modules, with 39 theorems and 72 definitions, compiled but lack successful separate replay**. Failed union records provide no justified partial-declaration success. The final metadata accurately sets `kernel_replay_complete: false` and lists those eighteen modules. The successful source/residual replays import them, so their replay is relative to retained compiled dependencies. All 64 permitted axiom closures do not supply those missing replay checks.

The accepted alternate drivers are unchanged: `ReplayBatch07F1` has SHA-256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, and `ReplayKnown6d2c` has SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The wrapper timeout changed from 180 to 120 seconds without changing replay semantics. Static source graphs for all seven attempts exclude selected target declarations from their imported bases and contain no selected-name collision or source cycle. Imported proofs remain trusted, however; retained object hashes establish final equality, not immutable invocation-time object identity. The method retains its usual unsafe/partial, axiom and imported-declaration qualifications. Source-level checks are not a binary/generated-constant inventory, official CLI replay, or fresh whole-tree rebuild.

Only one finalizer invocation is recorded, and it completed successfully at event 184. Before running it, the worker changed the all-replays assertion into explicit per-module status and an unreplayed list, and amended its prose to acknowledge the limitation. There is no earlier failed finalizer invocation. The final artifact index has mtime **14:50:15.943715 UTC**, **2.435436487 seconds before** the **14:50:18.379152** deadline; the retained event log ends at 14:50:15.961393. No late/unarchived effect or pending command was found. These mtimes and post-check receipt filenames are not exact independent kernel-return timestamps.

The controller nevertheless records **timeout**, elapsed **1809.695389271 seconds**, report null and mathematical resolution false, with finish at **14:50:28.074541 UTC**. There is no final agent JSON, controller `final.json`, `turn.completed`, or local `report.json`. Successful local finalization and successful compilation must therefore remain distinct from completed worker reporting and a fully replayed new proof chain. This audit did not execute any missing check.

Detailed supporting reports, read for this mathematical audit, are [the validation audit](markov_worker_000094_validation_audit.md) (SHA-256 `e939bbf68e2be9b84f73c1aa52d1e2ba0d8805f01f17089ef0221e97383e753b`) and [the replay-method audit](markov_worker_000094_replay_method.md) (SHA-256 `3b1b6659cae4611d75720ff2b87f6cdfedd7b4f5866396e72a84aa35519412e2`). Their companion evidence JSON hashes are respectively `1f398ba8bc161c25b20d6b89a5b00c179538b9ef0f929c0d4dfcca55baa085ef` and `35c66acdf67c2b581e68ccf542431d147433b53310c6757dd9a3f866b02b0a38`. All 1506 combined supporting inputs were stable at **2026-10-15 14:59:29.212981 UTC**.

Selected independently read source hashes:

| Source | SHA-256 |
| --- | --- |
| `MarkovBlockSmallM042.lean` | `95311a385df5bc7e566b7e0cf25273c4d6acbdccf84339f981f2ee8be990ace9` |
| `MarkovResidualSmallM042.lean` | `e6b2deafe9cecce3b20a62b8face203941e009a5a97c5b855c00ec5b44e66abb` |
| `MarkovEarlyBlockM042.lean` | `17050cd8b52688a5c571c676b7be1cef47965a8bd74beb96cccdb49745ce6538` |
| `MarkovBlockAChartM042.lean` | `a75b490ffc06c50a02a9129d905d834d4b3cd58ca166558ccdf1e69d71883e85` |
| `MarkovBlockBChartM042.lean` | `7541192b99c9d20ecb6a6c1269801285e124a923324bf71a34f8de5cdeb9833d` |
| `MarkovBlockDChartM042.lean` | `f15360226b4efd06e6660293e0af2705d9b16eb72d51d11b0088f456ea1e065b` |
| `MarkovBlockAGap0M042.lean` | `50e3c8959a01da890c0ea201a11f380fbc2c7caca274543804a6e88664380957` |
| `MarkovBlockBGap0M042.lean` | `5c2980adc4bd7a8d84ad30564bcb1fa826f60067fc9017af6986fcfc94fa07f6` |
| `MarkovBlockDGap0M042.lean` | `8bff4823e4de6de9bad69967dbe0f767476d7d488a587626104ce8f64858480e` |

The compiled mathematical scope is a restricted but unbounded actual-source block result. The general-numerator block, full residual and full conjecture remain unresolved; the new fixed-numerator proof chain also lacks a completed separate replay of its eighteen algebra modules.
