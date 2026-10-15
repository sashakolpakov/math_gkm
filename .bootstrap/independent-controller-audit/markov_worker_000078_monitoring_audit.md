# Worker 000078 independent mathematical monitoring audit

Request: `bdee9a64cacb4562b1d69ef649d7da48`. Controller outcome: **timeout**. Audit date: 2026-10-15.

This is a read-only review of the retained English accounts, final Lean sources, experiment scripts and outputs, validation receipts and archive boundaries. No project source was edited or executed, no proof or experiment was rerun, no mathematical suggestions were supplied, and no active successor was inspected or contacted. Independent audit notes were saved outside the project.

**Finding:** the round proves universal formulas for the first four coefficient orders of every entry of the actual run matrices, an injectively embedded rational expression for the actual third lower source slice, the formerly unaccepted auxiliary log-concavity inequality, and a conditional source transfer. The source coefficient-identification premise remains unproved. No new unconditional raw log-concavity region or root reduction is established or claimed. All eighteen mathematical modules have matching recorded successful compilation and alternate-driver replay. Finalization is retained despite the host timeout; the full conjecture remains unresolved.

## Actual run recurrence and sixteen universal identities

`run_matrix_recurrenceBDEE` is an entrywise identity for `M_n = lowerMatrix487 n = A B^n`, preserving the actual multiplication order:

```
M_(n+2) = (1+V+U*(1+V)^2)*M_(n+1) - V*M_n.
```

Here the equation abbreviates the four scalar entry equations in the theorem; it is not a reordered product assertion. `U` is the cut-count variable and `V` is the embedded coefficient variable. `runEntryBDEE` selects exactly one of the four matrix entries using `Fin 4`.

For every natural `n,k` and every entry, taking the coefficient of `U^(k+1)` yields

```
J_(n+2,k+1) = (1+X)*J_(n+1,k+1) - X*J_(n,k+1)
                + (1+X)^2*J_(n+1,k).
```

The coefficient-zero recurrence is proved separately without the final term. These recurrences hold at every coefficient order. The **explicit closed formulas**, in contrast, cover only orders `k=0,1,2,3`, which are exactly the orders used later:

```
6*(1-X)^(2*k+1)*J_(n,k) = P_(e,k)(n,X) + X^n*Q_(e,k)(n,X).
```

All sixteen formulas hold for every natural `n`, including zero and one. The four jet modules prove the actual matrix base cases and use two-step induction with the established coefficient recurrences and exact ring identities. The lower-order jet identities used in each inductive step were proved earlier; there is no finite-range or interpolation assumption in the statements. The generation script's 512 numerical-polynomial comparisons are separate evidence, not an input to the Lean proof.

## Fraction-field interpretation and exact source expression

`RunFieldBDEE` is `FractionRing ℤ[X]`, and `runEmbedBDEE` is the canonical ring homomorphism. `run_embed_injectiveBDEE` proves injectivity. `one_sub_runX_neBDEE` proves that the image of `1-X` is nonzero by reducing a putative equality to a contradictory constant-coefficient equality. The denominator `6*(1-runXBDEE)^(2*k+1)` is therefore proved nonzero; division is not performed under an omitted hypothesis.

This is a rational-function identity in an **indeterminate**, not evaluation at a numerical value of `X`. In particular, no theorem here asserts that the displayed rational expressions can be evaluated at `X=1` without addressing their written denominators. The polynomial identities before division remain unconditional.

`map_run_jetBDEE` identifies every actual jet of orders zero through three with its explicit rational expression. `map_constant_gauge_jetBDEE` proves that coefficient extraction commutes with the actual gauge when its parameters are constant in the outer cut variable. `map_run_gauge_jetBDEE` discharges those parameters using the actual run's zero-order lower-left coefficient. It does not assume that coefficient extraction is multiplicative for arbitrary polynomial matrices.

`closedThirdBDEE` consists of these explicit jet formulas, fixed finite algebra, the natural parameters `n,c,r`, and the established actual-source pattern-count expressions. The count expressions retain the natural-number truncations in `2r-c`, `3r-c`, and `3r-2c`, as well as the required minimum; they are not silently replaced by signed subtraction. The expression contains no recursively computed source word or run matrix. `correctedClosedThirdBDEE` retains the two-block and three-block corrections proved in the preceding round.

For every natural `n` and every finite `rest`, `source_third_closedBDEE` proves

```
runEmbedBDEE (6 * actual third-cut polynomial of replicate n true ++ false::rest)
  = correctedClosedThirdBDEE n (frame rest).mid.b (frame rest).mid.a.
```

Its proof connects the first, second, local cubic, Boolean-moment and correction expressions to the actual source through explicit mapping theorems and the already proved all-cycle source identity. There is no remaining source-word, cycle-length or moment premise. All predecessor cycle lengths and all run lengths are covered. Pure repeated-right paths are not of this mixed form and are not silently included; endpoint and rational-coverage obligations remain those of the unchanged root.

`source_third_closed_iffBDEE` proves that an integer polynomial `P` has this rational-function image **if and only if** it equals the actual polynomial `6*C3`. Injectivity makes this a full polynomial characterization, not agreement at a point or agreement modulo a truncation.

`source_third_closed_coeffBDEE` then states: **given** an integer polynomial `P` whose image equals that rational expression, for every natural `i,j` with the actual total degree `i+j=a+3`, its coefficient at `j` is `6*A(i,j)`. This premise is an explicit representation condition on `P`, not a proof that the later interpolated interior expression is already the required coefficient. The theorem covers all natural positions on the slice, including zeros and positions outside polygon support; it has no support filter or denominator bound. Six is a constant multiplier of the entire polynomial, not an index-dependent normalization.

## Auxiliary inequality genuinely completed; source transfer remains conditional

The defining polynomial expression of `thirdShapeBDEE` is byte-identical to the corresponding expression in worker 77's archived `MarkovThirdInteriorShape8BBB.lean`. This round proves the previously unaccepted auxiliary inequality under new, separately validated sources; it does not retroactively accept the earlier timed-out files.

`MarkovShapePartsBDEE` proves the exact left/center/right expansions after substituting

```
j=t+5, n=t+s+6, r=u+1, c=u+v+2.
```

Seven gap modules prove the coefficients of `s^0,…,s^6` nonnegative for all nonnegative integer `t,u,v`, using exact ring identities and positivity proofs. Their reported monomial counts are `252,224,196,168,140,112,84`, totaling 1,176. `thirdShape_shift_lcBDEE` combines those checked coefficients, and `thirdShape_lcBDEE` states the resulting inequality for **all integers** `n,c,r,j` satisfying

```
1 ≤ r, r+1 ≤ c, 5 ≤ j, j+1 ≤ n:
shape(n,c,r,j-1)*shape(n,c,r,j+1) ≤ shape(n,c,r,j)^2.
```

No coprimality or source assumption is needed for this abstract polynomial theorem. It neither assumes nor concludes that `shape` equals an actual source coefficient.

`ThirdInteriorFormulaBDEE n c r` is explicitly defined as the still-unproved proposition

```
∀ j : ℕ, 4≤j → j≤n →
  thirdShapeBDEE n c r j = 15*(thirdRunPolyADB2 n c r).coeff j.
```

The now compiled theorem `source_third_interior_of_formulaBDEE` keeps that proposition as hypothesis `hf`. For any actual mixed source, natural `i,j`, `4≤j`, `j+2≤n`, and total degree `i+j+2=a+3`, it conditionally proves the raw `(1,-1)` inequality. The proof uses the candidate inequality at center `j+1`, the three explicit formula instances, and the established correction-support result. It proves all three coefficient indices lie below the actual denominator, so the small-cycle corrections do not introduce an additional hidden hypothesis. Polygon guards are unnecessary in this conditional, more restricted all-index statement. The sole substantive source-identification premise is still visible and unproved; it is a proposition parameter, not a new axiom.

Accordingly, this round adds **no unconditional raw inequality region** beyond the preceding `3a≤2b` result. It adds useful universal identities and completes an auxiliary inequality and conditional transfer. Horizontal/vertical obligations, other diagonals, the remaining high-slope third-lower cases and the full root are not settled.

## Binomial identity versus missing coefficient extraction

`MarkovShapeBinomialBDEE` defines ten explicit integer polynomials `lowNumerator0BDEE,…,lowNumerator9BDEE`. It proves an all-integer falling-factorial identity and then, for every integer `n,c,r` and natural `j≥4`,

```
thirdShapeBDEE n c r j
  = 15 * sum_(l=0)^9 lowNumerator_l(n,c,r) * choose(j+5-l,5).
```

The top arguments of `choose` are natural numbers. The bound `j≥4` ensures `l≤j+5` for every `l=0,…,9`, so conversion between integer subtraction and natural subtraction is justified. Small top arguments give the ordinary zero binomial coefficients; no index is silently omitted. This is an unconditional algebraic identity for the defined auxiliary expressions.

It is **not** a theorem equating those ten polynomials with the low band of the actual rational source expression. The Python normalization and subsequent extraction still lack their formal bridge to the source. Thus the binomial theorem does not discharge `ThirdInteriorFormulaBDEE` by itself.

## Finite evidence, kept separate from proofs

The retained scripts and outputs were inspected without execution. Loop-domain and record counts were independently checked by counting indices only, without recomputing source coefficients or symbolic normalizations.

- Jet candidate generation checks four entries, four orders and `n=0,…,31`: **512** comparisons. Universal Lean induction, rather than these comparisons, establishes the final jet identities.
- The exact Python rational arithmetic reports a denominator power six and a 525-term numerator in four bands `X^(kn)`, `k=0,1,2,3`. The stored bands have respectively 169,164,128,64 terms and additional `X`-degree ranges `0–9`, `2–9`, `3–10`, `4–11`. The low band is independent of the adjacent/triple-count variables in the retained symbolic representation. These are properties of saved symbolic data, not a Lean source-normalization theorem.
- The normalization's **2,760** additional coefficient comparisons range over `n=0,…,15`, five specified predecessor pairs, and `0≤j<3n+12`. Their count matches the script. The complete composite normalization/extraction is explicitly marked unproved in the English account.
- The literal source scan has **360** reduced mixed source labels, denominators through 36, **5,569** natural raw positions, **14,422** backward-cut positions and **2,409** polygon-valid triples. The domain is `3≤b≤36`, `1≤a<b-1`, coprime, with the mixed-path remainder condition. These counts agree with the loop bounds. It includes small-cycle and zero coefficients. It is finite evidence, including cases outside the proved slope range, not a new universal source inequality.
- Saved extensions at `n=j` and `n=j-1` report nonnegative symbolic gap coefficients, but no corresponding Lean theorem is claimed or accepted.

## Validation and timeout qualification

The companion [validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000078_validation_audit.md) gives the full bindings. All **eighteen mathematical modules plus the audit module** have final-source successful build/replay pairs, **38 selected successful receipts**, in correct event order. All **65 named theorem declarations** match the individual printed permitted axiom closures and inventory. No current BDEE mathematical module is excluded or dependent on a merely timed-out BDEE build.

The complete receipt set is **59**: 38 successes, twenty failed builds and one timeout, with no extra successful receipts. Rejected attempts precede repaired passing checks under changed source hashes. The earlier prematurely launched dependent build is a rejection, not accepted evidence. No failed or partial proof is counted by the final inventory.

All **182 indexed artifacts** and both self-manifests agree across live bytes, archived bytes and controller hashes: **184 controller artifacts**. All **169 preservation rows** agree. The finalizer succeeds twice, at events 275 and 280, with a checkpoint append between; the second manifest matches the final retained bytes. All **134 started events** have completion events. A status message at event 276 reports completed validation, but no structured final report, `final.json`, or `turn.completed` is retained.

The controller starts at **06:36:59.434045 UTC**, has deadline **07:06:59.434045 UTC**, and records finish at **07:07:02.138087 UTC**, outcome **timeout**, elapsed approximately **1802.704 seconds**. The latest selected validation ends approximately 36.179 seconds before the deadline. The final event stream's observed modification time, **07:06:55.435884 UTC**, is about 3.998 seconds before the deadline; the last activity timestamp is approximately 0.246 seconds after it. Individual events have no wall-clock timestamps, so the exact finalizer execution times are unavailable. The retained finalizer results and hashes are complete; the timing evidence supports pre-timeout finalization without converting the controller outcome into a completed turn. No later proof result is needed for the accepted claims.

The unchanged replay driver has SHA-256 `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`. The accepted records use the previously audited alternate per-module kernel replay with inherited compiled imports. They are not official `leanchecker` CLI receipts or a fresh whole-source rebuild/replay. Invocation snapshots bind sources; final object binding uses manifest/archive/controller agreement and chronology, not an invocation-time object digest. This audit adds no independent kernel execution.

## Final source versions

All these mathematical source hashes match the retained worker-78 archive and the selected successful build/replay source bindings.

| Module | SHA-256 |
|---|---|
| `MarkovRunFieldBDEE` | `8d4d69395fa528c43e12fa7a965b7f42b2cc2426264179de17bd13ca63eece89` |
| `MarkovRunJets0BDEE` | `803f04e18b32840af7808117ff0f0869ca966a2a92307163dc335fda5a06248c` |
| `MarkovRunJets1BDEE` | `5442f871f6a7ee423d6852583e784a39517ad46cb100c4d609a95fa46be71eb9` |
| `MarkovRunJets2BDEE` | `6c832c750b0200017f571bd7d03198cd7b2945fe5be81104a96e394b51dfdc8a` |
| `MarkovRunJets3BDEE` | `30785e68e6d7523e8f75f796c35b405c80c93904adb0ed1b43bfa56960d0473a` |
| `MarkovRunScalarBDEE` | `a61a4327ed19950f4146e717133788ab65423c7b791c929645dca3c8bb0f2529` |
| `MarkovShapeBinomialBDEE` | `5a6fde196f5c55065c1006e695315172dd09e4fb5839637e76e151dae51aa387` |
| `MarkovShapeGap0BDEE` | `af4ac322278540cceae19e695465ebf9547c853428715745bc149f712b126976` |
| `MarkovShapeGap1BDEE` | `cd5cdbbd2c7a22e09a4c5c5447a230c672e09a96d8b7f663cee20ec9f2611e49` |
| `MarkovShapeGap2BDEE` | `2741529d473de8414fd796c23af2284b9ebd5c10c013ac3fb0ed205e37680085` |
| `MarkovShapeGap3BDEE` | `4a43b8f0d596201b06c6c04778e3f812be2f1c0df2020a6b43e1fce95f0eee2d` |
| `MarkovShapeGap4BDEE` | `e5a3143866f9169e9c021fefa24d7ac073a3e4aa478589065a8a45c451038bc3` |
| `MarkovShapeGap5BDEE` | `8b57d2f621f0ce0901d94741adaa11b00f1d56a6e4feb45b62857a98fc733212` |
| `MarkovShapeGap6BDEE` | `9278b3cd65398f2224abf6b4ad3711bbae072ea0d863b9d5d9605ef830a1b835` |
| `MarkovShapeLCBDEE` | `e078040cbeb05bd38ccd0998e6a2d769be4d2039d7d580e0cd5049466c9a0dce` |
| `MarkovShapePartsBDEE` | `8120319f82806d1c52b1b41f28f17499bd69525f563c8718710860ab9a9f028f` |
| `MarkovThirdClosedBDEE` | `248a1051af632715189e7067e11d58af0b2d3a129df3ec08a64d7b877cfe2fce` |
| `MarkovThirdInteriorTransferBDEE` | `b1c083af241053d74d7353a0e8d1f209c1265712d9af2ca0e5edb2e18836b5d7` |

The final audit source hash is `3090568120835dcf2e50a5a04f73147ed214e92f935c8fdc68c7c18f0e0d869e`. No mathematical English/Lean scope mismatch or final artifact-binding discrepancy was found. The remaining coefficient bridge is explicit, and the controller correctly records `mathematical_resolution: false`.
