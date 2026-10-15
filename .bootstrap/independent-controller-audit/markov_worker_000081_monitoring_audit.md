# Worker 000081 independent mathematical monitoring audit

Read-only audit of completed-timeout request `53d5229e9f134234a21bc350e491d476`, on 2026-10-15. No project files were edited, mathematical guidance supplied, proposer contacted, successor inspected, project code imported/executed, or proofs/experiments/replays rerun. This audit records retained evidence and does not finish missing checks.

## Mathematical conclusion

The final source theorem extends the third-lower-diagonal raw inequality through three contiguous coefficient bands. It has an actual source conclusion and no remaining coefficient-identification or chamber hypothesis. Its exact scope is:

> For every natural `n≥5`, every Boolean list `rest` with predecessor denominator `c=(frame rest).mid.b≥4`, and natural `i,j` satisfying `j≤3n+1` and `i+j+2=a+3` for the actual source `frame (replicate n true ++ false :: rest)`,
> `A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2`.

Here `A` denotes the original raw integer coefficients of the squared-variable source numerator at `w=1`. The source is obtained by the pinned recurrence, not an arbitrary word or experimental matrix. No polygon, positivity, nonzero-coefficient, denominator cutoff or additional source-formula premise occurs in `source_third_three_bands53D`. Zeros are retained. The theorem covers only direction `(1,-1)` at total degree `a+3`, the third lower diagonal, not the paper's third upper diagonal.

The bounds `n≥5` and predecessor `c≥4` are essential to the proved scope. The result does not newly cover small runs, predecessor denominators 2 or 3, pure repeated-right paths, endpoints, or the full collection of source inequalities. It does not close or refute the pinned conjecture.

This extends worker 80's proved statement `j≤2n` in this family. For example, the actual source obtained with `n=5` and predecessor `1/4` is `21/25`; the triple `(11,13),(12,12),(13,11)` has total degree 24 and starting index `j=11>2n`. All three points satisfy the pinned polygon conditions. It lies outside the earlier low-slope whole-slice range and the first six upper diagonals. This is a scope comparison, not a new coefficient experiment or a claim of publication novelty.

## Exact source and coefficient bridges

Let `T=thirdRunPolyADB2 n c r`, and let `q=(2r−c : ℕ)`. The new denominator identity, assuming `c≠2`, is proved in `ℤ[X]`:

`(1−X)^6 T = K0 + X^(n+2) K1 + X^(2n+3) K2 + X^(3n+4) K3`.

`K2=thirdTailPoly53D n c r q` has eight explicit coefficients. Its equality with the actual second delayed band is proved for arbitrary integer count parameters by a polynomial identity. It is not assumed to match an interpolation. The exceptional two-cycle contribution is eliminated only under the explicit hypothesis `c≠2`.

Formal-power-series extraction retains all three displayed low bands and removes the final band only for coefficient indices below `3n+4`. For `2n+5≤j≤3n+3`, the shifted third-band index is at least two, so every binomial/falling-factorial identity used for the eight monomials has its required range. The two coefficient statements are:

- if `2r≤c`, then `tailLow53D c r (3n+3−j) = 15*T_j`;
- if `c≤2r`, then `tailHigh53D c r (3n+3−j) = 15*T_j`.

Both are universally quantified over natural parameters subject to `c≠2`, the respective chamber and the index bounds. The subtraction in the displayed tail argument is performed after casting to integers; it is not truncated natural subtraction. The chamber-dependent cast of `q` is discharged explicitly as zero or `2r−c` over the integers.

The reversed shapes are explicit polynomials in `c,r,k`, without `n` as a separate parameter. Thus the run length disappears **after reindexing by `k=3n+3−j`**. This does not assert that coefficients at a fixed original index are independent of run length. The formal inverse of `(1−X)^6` has no numerical-evaluation or analytic-convergence assumption.

The actual raw adapter invokes the inherited `source_third_run_rawADB2` with its explicit `c≥4` hypothesis. It does not extend the uncorrected polynomial identity to exceptional two- or three-cycle sources. Six and fifteen are uniform positive scaling constants and cancel from the squared inequalities; there is no factorial or binomial normalization of source coefficients.

## Gap certificates and composition

The tail gap arguments cover four exhaustive parameter cases under `c≥4` and `1≤r<c`:

- low chamber `2r≤c`, with `r=1` or `r≥2`;
- high chamber `c≤2r`, with `c−r=1` or `c−r≥2`.

Their nonnegative shifted parameters are explicitly supplied by the hypotheses. The large expressions are exact ring identities for the gap, followed by nonnegativity proofs. The initial low-tail result requires center `k≥2`; two additional edge certificates prove the missing center `k=1`. The final low-tail result therefore has `k≥1`, while the high-tail auxiliary result permits `k≥0`.

The latter auxiliary `k=0` statement must not be read as a proof of a further actual terminal raw triple: identification of all three coefficients still has its own range. In the final unified source tail range `2n+5≤j≤3n+1`, the reversed middle index is `3n+2−j≥1`, and every one of the three coefficient identities is valid.

The six crossing coefficient identities cover indices `2n+1,...,2n+6` for `n≥5,c≠2`. The first two use the previously proved second-band formula. The next four retain respectively the exact constant, linear, quadratic and cubic coefficients of the new shifted band. In particular the first two positions of that band are not incorrectly forced into the general falling-factorial formula. Twelve separate low/high expansion identities and sixteen chamber gap certificates establish the four crossing triples.

`third_three_bands_lc53D` exhaustively divides starting indices into:

1. `j≤2n`, supplied by the inherited two-band theorem;
2. `2n+1≤j≤2n+4`, supplied by the four crossing triples;
3. `2n+5≤j≤3n+1`, supplied by the unified tail theorem.

The final actual-source theorem supplies predecessor positivity and `r<c` from `frame_reduced rest`, applies this auxiliary inequality, and substitutes the inherited exact raw coefficient identities. No formula or chamber assumption survives as an unresolved premise.

## Polygon bound: exact scope and limitation

`third_polygon_bound53D` states, for natural `n,c,r,i,j`, that

`0<c`, `r<c`, `i+j+2=cn+r+3`, and `InPolygon (cn+r) (c(n+1)+r) i (j+2)`

imply `j≤3n+3`. It uses the original polygon predicate; its lower-edge inequality suffices. No coefficient or log-concavity claim is part of this lemma.

The source corollary `source_third_remaining_terminal53D` is actually broader in hypotheses than the main three-band inequality: for **every** mixed path, it needs only the slice equality, the first endpoint's original polygon membership and `j>3n+1`, and concludes

`j=3n+2 ∨ j=3n+3`.

It has no `n≥5` or `c≥4` assumption. Any triple meeting the root's three polygon premises in particular meets its first-endpoint premise. Combined with the main inequality in the latter's restricted family, it confines the still-uncovered polygon-valid starts to these two indices. It does **not** prove their inequalities, assert that both indices are polygon-valid for every source, or close the full third lower diagonal. No new exact root-equivalence theorem is provided here.

## Finite evidence

The saved experiment uses `5≤n≤20`, `4≤c≤12`, `1≤r<c`, `gcd(c,r)=1`. I checked its saved input list and loop-domain arithmetic without rerunning its coefficient calculations:

- 672 distinct source parameter triples;
- 11,760 formula checks, comprising third-tail positions and six crossing positions for each source;
- 396 independent literal-numerator coefficient comparisons in the subset `n≤7,c≤5`;
- 26,544 polygon-valid raw triples, through starting index `3n+1`.

The formula count includes two positions checked by both formula families for each source. Thus it represents **10,416 distinct source/index positions**, with 1,344 repeated positions receiving a second identity check; it is not 11,760 distinct positions. All stored in-range assertions passed and the failures list is empty. These remain finite evidence, separate from the universal Lean proofs.

The experiment also records six failures of extending the reversed tail past its stated range. At `n=5,c=4,r=1`, actual source `21/25`, index `j=19=3n+4`, the uncorrected expression is −360 while the actual coefficient scaled by ninety is zero. This concerns a truncated coefficient formula beyond its boundary, not a raw log-concavity counterexample. It is recorded finite evidence and was not rerun or converted into an additional theorem by this audit.

## Validation and preservation

The companion [validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000081_validation_audit.md), SHA-256 `f6a69ed7a3c1116921aa55b1d319fa32658451b009138727923c0c7a6aa34790`, records the complete read-only source/receipt/method and timing comparisons. Its [944-input-hash evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000081_validation_evidence.json) has SHA-256 `67d849cb46246523aaac826d6cd467d334a35ca566adb790c3fea40c415555dc`. The accepted retained status is:

- All **21 new mathematical modules** have matching successful final-source builds and completed replay coverage. Nineteen are covered by four successful union replays, selecting groups of seven, six, two and four modules. `MarkovTailShape53D` and `MarkovTailPolygon53D` have direct `ReplayKnown6d2c` replay records. These groups include the final three-band source composition; it is not merely compiled or omitted from an earlier inventory.
- The final `MarkovAudit53D` compiled and replayed. It individually prints exactly all **76 named new theorem closures**, each contained in `{propext, Classical.choice, Quot.sound}`. The earlier Audit version is superseded rather than counted as final-source evidence.
- There are **37 ordinary validation receipts**: 24 successful builds (21 mathematical modules, final Audit, superseded Audit and inherited-inventory Audit), four successful direct replays (TailShape, TailPolygon, final Audit and inherited TwoBandsSource), four failed builds and five timed-out builds. Every selected union target has a successful build preceding that union. Rejected or timed-out checks are not relabeled as successful proofs.
- All **162 controller-listed changes** agree with current bytes, archived bytes and controller after-hashes. All **159 indexed artifact entries** additionally match the manifest values. The three controller entries outside that artifact index are the two self-manifest files and the preserved late worker-80 union receipt. No additional current worker-81 file is outside its archive.

Unlike workers 79 and 80, the finalizer here ran successfully and produced the final validation, artifact and preservation records. All 259 final preservation comparisons and 343 initial reconciliation comparisons match their recorded expected hashes. A saved `report.json` exists. The host nevertheless ended the worker with outcome `timeout`, without a final conversational response or completed-turn event. This distinction does not erase the completed mathematical and finalization records.

### Inherited worker-80 validation

The previously missing replay of `MarkovTwoBandsSource07F1` is now completed in its own receipt,

`evidence/markov-53d5229e/run-MarkovTwoBandsSource07F1-replay-1792052403931742000.json`,

using `ReplayKnown6d2c`, successfully in approximately 43.96 seconds. It matches the unchanged final source from worker 80. Thus the predecessor's final composition used by the new theorem has an actual recorded replay, not a presumption based on its compilation or its imports.

The inherited 39-module inventory was also printed by a fresh compiled `MarkovInheritedAudit53D`; this is the previous 72-name inventory, not an invented 75-name predecessor audit. A newly attempted whole 39-module inherited union timed out at 150 seconds and is explicitly **not** a successful replay.

Separately, worker 80's already-audited late successful 39-module receipt, `kernel-union-1792051911627555000.json`, is now preserved in worker 81's controller archive with unchanged SHA-256 `13530b05854227766d621842b84fc17c6e41719b661394581bf4c0fa98c276cd`. This does not rewrite worker 80's archive or make that late completion occur before worker 80's cutoff. The worker-81 prose statement that the predecessor union “left no receipt” is overly broad: no completion receipt was retained inside worker 80's archive, but the known late receipt exists and is now separately preserved. The worker-81 fresh union timeout, worker-80 late union success, and worker-81 successful individual final-source replay are three distinct events.

### Replay method and timing

The union groups use the unchanged `ReplayBatch07F1` module-union driver, SHA-256 `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc`, already independently audited for worker 80. The [worker-81 method continuation](/private/tmp/math_gkm_godel_20261013/markov_worker_000081_replay_method.md), SHA-256 `9d5261e42a4d500eaba5a2779909c686e0c465afcef689ea502de8c8e0e1d2e9`, and its [190-input-hash evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000081_replay_method_evidence.json), SHA-256 `877386179ca633b2975859b1ebbd1ae31f0117cf60b7d885ca1f3b7398b57647`, check the new selection boundaries. The driver collects module constants and calls the pinned `Environment.replay`/kernel declaration-checking path. It does not select only named public theorems. Static import/name analysis of the new groups finds no selected target in their retained transitive source import boundaries, no explicit target-name collision and no source import cycle. Existing replay behavior concerning already-present matching theorems, unsafe/partial declarations and declared axioms remains part of the method's stated scope; it is not silently removed by the group wrapper.

Inherited compiled imports are reused, rather than freshly rebuilt or recursively replayed. Each group's inherited boundary is relative to its selected modules: the four local base closures contain 126/133/179/131 modules, including 1/7/16/5 earlier worker-81 modules. The two-module group containing the final three-band source theorem imports `MarkovTwoBandsSource07F1`; that import itself does not replay the predecessor. Its separate direct replay receipt, identified above, does. The group wrapper records source hashes after its subprocess, does not dump binary constant/import inventories or invocation-time object hashes, and does not include a driver hash inside each group receipt. Driver identity and object/source consistency are instead checked against the retained source and controller/archive records. These are alternate-driver replay records, not official `leanchecker` CLI receipts or a fresh whole-dependency rebuild. No new checking run was performed by the auditors.

The final artifact-verification file's recorded modification time is **08:40:25.032244 UTC**; the completed retained event stream's modification time is **08:40:25.062383 UTC**, approximately **29.446 seconds before the 08:40:54.508084 deadline**. The controller finishes with timeout at **08:41:01.616671 UTC**. Retained events record successful finalization, with no pending started item, but no final response. These facts support completed retained finalization before cutoff; they are not an invented per-event wall-clock timestamp.

## Principal final-source hashes

All 23 live `*53D.lean` files independently matched their worker-81 archives. They comprise 21 new mathematical modules, the current Audit and the inherited-inventory Audit. Principal SHA-256 values:

| Source | SHA-256 |
|---|---|
| `MarkovThreeBandsSource53D.lean` | `cfdfa7702608e5c1ab7114b2f84d7c7845bf4b8890e8c1a8c6d3062d6eb13ecc` |
| `MarkovTailPolygon53D.lean` | `70aa9fe5b9a7a2a05fd4ad70b3e4e33cef9b38879d0b4f843abf071c5846cc57` |
| `MarkovTailCoefficients53D.lean` | `b1e0e33dd63bb517e218569291d8e091114841ad2310328bdbd7f2c40aa7e3fc` |
| `MarkovTailShape53D.lean` | `fc40c99a332d48b87276db071486cdabc4fa0bac93158d73a85e5f1544e5a234` |
| `MarkovCrossTail53D.lean` | `49c3202ab76aa0bbd915324111527d6970746b829eba43d758ec7a5f802c6063` |
| `MarkovCrossTailLC53D.lean` | `59a2ac049760e66b9aab638c5d1e63d4646174114adf19867bb93ccdc27b68e4` |
| `MarkovTailUnifiedSource53D.lean` | `dfcd6913d5f75f25a9d525a3a9b32f2a46d2629fbc54e82d55f8c41e9ad7fa2d` |
| `MarkovAudit53D.lean` | `e2315b03f88912015bb8cc8a33902b69147d1e9d749584ac3910541f63512e7b` |
| `MarkovInheritedAudit53D.lean` | `7aa60efda3340345c673be0c9117dbf110bb9cebc43925a31a1cb3f3fc349066` |

The substantive mathematical descriptions match the final Lean statements with the restrictions above. All new mathematical modules, the final source composition and polygon lemma have matching compilation and alternate-replay records; the final audit and finalization are retained. The predecessor's missing source replay is also separately completed. The old “no receipt” wording needs the archived-cutoff qualification, and the finite formula count includes repeated positions. This batch does not establish either terminal inequality or the full conjecture.
