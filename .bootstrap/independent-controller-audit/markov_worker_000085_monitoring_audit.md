# Worker 000085 independent mathematical monitoring audit

Read-only review of ended-timeout request `01f51d63cfb342788663ad652d76ab8c`, 2026-10-15. No project sources/evidence were changed; no proposer or successor was contacted or inspected; no mathematical advice was supplied; and no project code, build, replay, finalizer or polynomial experiment was executed. Text/receipt/hash inspection and finite loop-domain arithmetic alone were used.

## Mathematical result and limits

The retained final statements establish **an exact fourth-lower-slice identity for every mixed source path**, generic fourth-order matrix/trace identities, a checked local Boolean identity, and six universal candidate-polynomial log-concavity theorems with conditional raw-source transports. **They do not establish a new unconditional fourth-lower-slice source inequality.** The source fourth-moment/count identification remains an explicit missing mathematical premise.

`source_fourth_run_raw01F` quantifies over all natural `n,i,j` and every finite Boolean list `rest`. For `path=replicate n true ++ false :: rest`, its only hypothesis is

`i+j=(frame path).mid.a+4`.

Its conclusion is

`24*coeff (frame path).mid.p i j = (fourthRunPoly01F n rest).coeff j`.

There is no conductor/denominator/path/run bound, polygon guard, positivity assumption or numerical premise. Zero coefficients are retained. These are the pinned literal raw integer coefficients in squared variables; the factor 24 is common to the whole slice. The identity concerns mixed paths; pure-right sources retain their existing separate results.

The right side is a **local-statistic representation depending on the whole predecessor word**, through `sourceFourthTrace01F`. It is not yet a closed formula solely in `n,c,r`. Describing it as an unconditional identity is correct; describing it as an unconditional source log-concavity result, or as the completed source identification for the six candidate formulas, would be incorrect.

## Generic matrix hypotheses and fourth-order algebra

The generic declarations work over an arbitrary commutative ring. `logFour01F(P)` is explicitly the integer polynomial

`24*P₄ - 24*P₁*P₃ - 12*P₂² + 24*P₁²*P₂ - 6*P₁⁴`.

Its description as 24 times a fourth formal-log coefficient is explanatory; the Lean definitions/proofs use this displayed algebra, not an analytic logarithm or division in an arbitrary ring. `ratioOne/Two/Three01F` are likewise explicit jet polynomials. Their ratio interpretation uses a numerator constant coefficient zero and denominator constant coefficient one, supplied in applications by `Projection6905`.

`Projection6905` requires the matrix constant coefficient to be `diag(0,1)`. Under that hypothesis, the multiplication and product-ratio theorems identify the first three upper-right/lower-right quotient jets with the recursive `headRatio...` expressions. `head_ratios_local01F` proves that only the first one, two and three matrices are used. `product_openFour01F` expresses the fourth polynomial for the lower-right entry as the sum of terms depending on at most four consecutive matrices; it covers the empty list by a separate base case.

For a single arbitrary projected matrix, `trace_four_boundary01F` also assumes its upper-left linear coefficient is zero. The product theorem derives that fact for products of **at least two** projected matrices. Its boundary expression is exactly

`B = 24*(r₁*l₃+r₂*l₂+r₃*l₁) - 12*(r₁*l₁)²`,

and the determinant correction is

`E = 24*(e₄-2*d₁*e₃+(3*d₁²-2*d₂)*e₂) - 24*r₁*l₁*e₂ - 12*e₂²`.

Here the `r` and `l` jets are obtained from the product and its transposed reversal, and `eₖ` is the determinant's kth coefficient. `product_trace_four01F` proves the exact sum `openFour+B+E`; it does not omit the short-product correction. `product_det_power01F` proves divisibility by `X^(list.length)`, so `product_trace_four_long01F` removes `E` only for length at least five.

`cyclic_four_local01F` identifies the quantity named `cyclicFour01F` with the precise definition `localFourScan01F (w.take 3) w` for a nonempty projected list. Its proof is an exact append/subtract boundary identity. **Short-cycle terminology qualification:** when the list has length two, `take 3` appends only its two existing entries. This is the stated truncated-list closure, not automatically the convention of repeating a two-element cycle until every four-position window is full. For length at least three, the appended prefix supplies the three successors. The actual source/trace identity remains exact under its definitions; the small-cycle determinant terms are explicit. This qualification prevents an unsupported interpretation of the generic short-list scan, not a rejection of its Lean identity.

## Actual source transport and small-cycle corrections

For the predecessor source, write `c=(frame rest).mid.b`, `r=(frame rest).mid.a` and `b=c(n+1)+r`. Source reducedness gives `0<r<c`, hence `c≥2`. The run-list length theorem and actual source word-count identities identify the matrix-list length with `c`. The determinant is proved exactly as

`U^c * V^b`.

Its kth coefficient in the outer variable is `X^b` if `c=k`, and zero otherwise. Thus the explicit `e₂,e₃,e₄` in `sourceFourthTrace01F` are nonzero exactly at predecessor denominators two, three and four. Their quadratic terms, including `e₂²`, are retained. No large-cycle theorem is applied to those cases. For `c≥5`, the determinant correction is proved zero.

Let `F=firstRunPolyADB2`, `S=secondCompressed446`, and `T=correctedThirdRun8BBB`; the inherited source identities give respectively the first slice, twice the second slice, and six times the third slice. The fourth polynomial is defined by

`sourceFourthTrace + 6*(1+X)^4 + 4*F*T + 3*S² - 12*F²*S + 6*F⁴`.

`logFour_source_cut01F`, the first-three-source identities and exact algebra yield `source_fourth_run_poly01F`, then the coefficient theorem. In particular the third-slice term uses the **corrected** all-cycle polynomial. There is no unknown coefficient hypothesis in this unconditional representation.

`source_fourth_of_lc01F` is explicitly conditional on log-concavity of this full fourth polynomial at every natural index. It is a valid transfer lemma using common-factor cancellation, not a proof of that premise.

## Six candidate inequalities and their explicit source premise

The six `fourthLowMoment...` formulas are candidate fourth moments for **run zero**, hence the actual target paths in the conditional transports are `false :: rest`. Their predecessor slope intervals are the strict intervals with boundaries

`0, 1/4, 1/3, 1/2, 2/3, 3/4, 1`.

Each candidate coefficient sequence has support contained in indices zero through seven. For the adjacent Farey endpoints `p/q < s/t`, its proved inequality quantifies over all nonnegative integers `x,y` and **every natural index `j`**, at

`c=q*(x+1)+t*(y+1)`, `r=p*(x+1)+s*(y+1)`.

Six explicit gap certificates cover `j=0,...,5`; for `j≥6`, the right endpoint `j+2≥8` is identically zero, leaving a nonnegative square. Exact polynomial expansion and coefficient-extraction identities are also proved for arbitrary integer `c,r`. These are universal auxiliary inequalities, not a finite scan.

Every `source_fourth_chamber_...` theorem retains the following premises:

- `c≥5`;
- its two strict predecessor-slope inequalities;
- **`hM`: the fourth jet of the actual source trace equals that chamber's candidate `fourthLowMoment...` polynomial**;
- the raw slice equation `i+j+2=(frame (false::rest)).mid.a+4`.

The proofs explicitly derive nonnegative Farey coordinates from the strict inequalities, convert the truncated count parameters to the correct integer formulas, identify the candidate sequence through `hM`, and cancel the common factor 24. No polygon guard is needed for these conditional all-index slice statements, and none is used to exclude a difficult coefficient. The missing source-moment formula is not erased, inferred from a scan, or admitted as an axiom.

The moment-to-source lemma itself has `c≥4`, but the six assembled conditional chamber theorems state `c≥5`. Chamber boundary fractions have reduced denominator at most four; consequently no reduced predecessor with `c≥5` lies on them. This explains the finite experiment's strict-chamber partition, but does not replace the absent universal moment and assembly proofs. No global low-slope fourth-slice theorem or arbitrary-run source log-concavity theorem is claimed here.

## Boolean local identity versus missing source counts

`fourth_boolean_coboundary01F` is proved for every five Boolean inputs and every element of a commutative ring. It is the exact identity

`local = canonical(q,r,s,t) + potential(p,q,r,s) - potential(q,r,s,t)`.

Its proof enumerates Boolean inputs and checks polynomial identities. `fourth_boolean_local01F` identifies this explicit expression with the local fourth-order expression for the actual `booleanGauge6905` matrices. `source_fourth_trace_local01F` separately identifies the source fourth trace with the run-matrix local scan when `c≥5`, for every run length.

These statements do not themselves sum the Boolean coboundary over the actual mechanical source word, count all required patterns, or prove the candidate source moment. The remaining four proposed cyclic counts concern position sets `{0,3}`, `{0,1,3}`, `{0,2,3}` and `{0,1,2,3}`. Their saved six-chamber formulas agree with the English table, but they are finite experimental proposals in this batch. The two triple counts are tested separately; no unproved reversal-symmetry identification is silently used. The raw source `hM` hypothesis remains the mathematical boundary.

## Finite evidence

The six candidate moments were inferred from two sample parameter pairs in each chamber, then compared with the exact source calculations. Inference from those two samples is not a proof of linear dependence or source validity. The later Lean checks prove the candidate algebra and inequalities, while leaving source identification conditional.

I independently counted only the script's input domains and compared saved metadata, without recomputing a polynomial or pattern count. For `5≤c≤100`, `1≤r<c`, `gcd(c,r)=1`, there are exactly **3,038** source pairs. Per chamber the counts are `760,254,505,505,254,760`. The `c≤20` literal-recurrence subrange has **1,474** recorded coefficient positions. All counts match and the saved failures list is empty. The output records six gap expansions per chamber, 36 in total, each with no negative coefficients; these are separate from the corresponding Lean proofs.

The four-pattern scan uses `5≤c≤120` and the same reduced-source restrictions: **4,380** distinct words, distributed `1094,365,731,731,365,1094` across chambers. These domain counts match the saved records. The saved formula arrays match the English table and show no finite failures. No universal source count or new unconditional raw inequality is inferred by this audit.

The pinned `Conjecture63` and inherited `InteriorCore638833` remain unchanged. Higher diagonals, the general fourth lower slice and the horizontal/vertical interiors are not solved. No fresh published-source correspondence or historical novelty claim is made.

## Validation and timeout boundary

The independent [validation audit](markov_worker_000085_validation_audit.md) and [replay-method audit](markov_worker_000085_replay_method.md) reconstruct the retained records without running the missing finalizer or creating project evidence.

**The 14 mathematical modules and Audit have successful matching final-source compilation/replay records, and all 94 named theorem closures are directly printed with permitted axioms. Finalization and a final response are unfinished.** These are separate facts.

- All **117** controller after-hashes match both current bytes and the worker-85 timeout archive. All 15 final source/object pairs and saved attempt snapshots match. No worker-85 file is late or unarchived, the temporary directory is empty, and no retained command item is pending.
- The **32 ordinary receipts** consist of 15 successful builds, 15 failed builds and two successful individual replays. There are no recorded validation timeouts and no extra successful source versions. Every rejected module later has a successful build of its final source. Six stale-source build failures following a generator syntax error remain rejections, not accepted proof evidence.
- The successful union `kernel-union-1792060243873119000.json` covers **13 mathematical modules / 87 named theorems**. The successful individual Conditional replay `run-MarkovFourthConditional01F-replay-1792060249857554000.json` covers the **seven remaining theorems**. The successful final Audit replay is `run-MarkovAudit01F-replay-1792060305068644000.json`. All final builds precede their selected replays; the ordinary and union receipts match completed controller events, allowing only exact documented output-prefix truncation.
- The final Audit's **94** source names, explicit print requests, retained full successful build output and inventory match exactly. Every axiom closure is a subset of `propext`, `Classical.choice`, `Quot.sound`. The Audit imports and print commands add no mathematical theorem; its replay does not itself recheck imported mathematics. The union and Conditional replay provide that separate coverage.

The finalizer was authored, edited and read, but **never invoked**. The following aggregate files are absent from both current evidence and the timeout archive: `validation.json`, `preservation.json`, `operational-observations.json`, `artifacts.json`, and `artifact-verification.json`. Accordingly, the mathematics/correspondence prose referring readers to `validation.json` is premature. The checkpoint's intended finalizer outputs are not evidence of completed finalization, while its statement that Audit replay remained pending was overtaken by the last completed event. There is no failed finalizer run or partial-output success to reinterpret.

The final Audit replay receipt was written at **2026-10-15 10:32:13.119152 UTC**. The final completed event-log mtime is **10:32:13.131215**, **3.889362 seconds before** the **10:32:17.020577** deadline. Event 263 and its receipt are inside the timeout archive; this is not a late, unarchived replay. The host nevertheless records **timeout** at **10:32:22.087577**, elapsed **1805.067000 seconds**. No final agent response, `final.json` or `turn.completed` exists; the controller report is null. This audit does not reclassify the worker as completed.

The auditor independently matched 88 initial reconciliation comparisons and 97 saved initial-input hashes, including the pinned root and raw/canonical contract hashes. That read-only comparison is not the missing worker preservation check and was not written into the project. Likewise the supporting audit reconstruction is not a manufactured worker manifest or `validation.json`.

The unchanged drivers supply **alternate kernel replay**, not official-CLI success or a fresh dependency rebuild. The union wrapper hashes selected sources before replay, requires successful matching builds and records the driver hash afterward. Static source-import/name analysis finds no selected target in its imported base, duplicate/collision, source cycle or baseline mismatch. The union's local base has 83 modules; Conditional's has 93, including ten previously checked worker-85 modules but excluding Conditional itself and its names. Audit's base has 97 modules and contains all the new mathematics, as expected for an import-only audit.

Inherited compiled objects remain trusted. The procedure collects all available selected constants rather than only the public theorem list, but skips unsafe/partial declarations and admits axiom declarations; already-imported equal theorems can skip proof-body comparison. Static checks found no selected-target source-import route to that last behavior. Pending recursion does not install unfinished proofs as assumptions. Actual binary import tables, generated/private-constant inventories and invocation-time object digests are not supplied. Final object/archive bindings and chronology support the retained per-module records, not a fresh whole-source proof audit.

Supporting report hashes:

| File | SHA-256 |
|---|---|
| `markov_worker_000085_validation_audit.md` | `e8f73fe5fd452864c065751fbb019ba075e4c049df5f239f44a66cf0e1ef0b74` |
| `markov_worker_000085_validation_evidence.json` (345 stable input hashes) | `4a2fce5f7980b5e3d0514672ffbf33096fb71f45d27602beb38cc1da76447287` |
| `markov_worker_000085_replay_method.md` | `255334ee7c7d9beb99e092c106edb6b062f77adb650822b88f5f4505271d361d` |
| `markov_worker_000085_replay_method_evidence.json` (106 input hashes) | `a082f295262bc9a7ee6063a23edd424435aa0fff2bb8198e4fbfd9ca70f5b672` |

## Principal final-source hashes

All 15 live `Markov*01F.lean` files match their worker-85 archive bytes: **14 mathematical modules plus Audit**, not 15 mathematical modules. Principal SHA-256 values:

| Source | SHA-256 |
|---|---|
| `MarkovFourthSource01F.lean` | `04b94ec0b860337901980a51393803ad4842b50ea2fe475ec0239ea2c0ebfcf1` |
| `MarkovFourthJet01F.lean` | `e3f7a3c54023c8a732636a77de465c26dbc801de00a6ccbccad4ac76f5d6e83c` |
| `MarkovFourthTrace01F.lean` | `b600768b40bcbbade2932d6d1c35ed6ac89f92c34cd9d440d06fea1cf76f532e` |
| `MarkovFourthLocal01F.lean` | `32ba8829f68682b2da9683fb0cf9d63168f86b5c543dfa09f3082d460375a79c` |
| `MarkovFourthMoment01F.lean` | `0935dca209bd04c615d101a5fdf4fd4bcfb76522a2d7967fb5e019a1107f9584` |
| `MarkovFourthBoolean01F.lean` | `9a3dd0ecf2ef4c77eb6aa1a0108b2c97a5d333265173282ba57149153aead3b5` |
| `MarkovFourthBooleanBridge01F.lean` | `e9fdd64b58b1e8c0ab419b857eacd2468bf2b43fa4eee5bc1508360d5c39c8b7` |
| `MarkovFourthConditional01F.lean` | `d6243db44755c176a2d87c200027058ef594351b79421a5a9bc24ea0dc846660` |
| `MarkovAudit01F.lean` | `27807d28b586044af4d9b6f833f5fa24e4a7b2a1a07776425c0bcadbee7f8b7a` |
