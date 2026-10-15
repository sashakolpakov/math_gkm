# Worker 000080 independent mathematical monitoring audit

Request `07f1d4107cd9444f9e7c04207d4f33d9`, audited read-only on 2026-10-15. No project changes, proof or experiment reruns, missing validation work, proposer contact, mathematical guidance, or active-successor inspection were performed. Controller-bound evidence and late evidence are distinguished below.

## Mathematical scope

There is a substantive extension of the previous restricted third-lower-diagonal result. The first-band theorem now covers every starting index `j+1 ≤ n`, including `j=0,1,2,3`. A final compiled composition extends the mathematical statement to `j ≤ 2n` for `n ≥ 4`. Both are unconditional statements about the actual raw coefficients of every source path of the form `replicate n true ++ false :: rest` satisfying their index conditions. The latter composition's compilation must not be confused with completed independent replay or aggregate acceptance.

For a source with numerator/denominator indices `a,b`, write `A(i,j)` for its original integer numerator coefficient at `w=1`. The two source statements have the common conclusion

`A(i,j+2) * A(i+2,j) ≤ A(i+1,j+1)^2`,

with natural `i,j` and `i+j+2=a+3`:

| Declaration | Additional hypotheses | Mathematical meaning |
|---|---|---|
| `source_third_first_band07F1` | `j+1 ≤ n` | All triples starting in the first coefficient band, with no lower restriction on `j`. |
| `source_third_two_bands07F1` | `4 ≤ n`, `j ≤ 2*n` | All triples starting in the first two bands, including their crossing positions. |

Neither theorem has a formula-identification, moment, positivity, polygon, denominator cutoff, or arbitrary-word premise. `rest` is an arbitrary Boolean list and the polynomial is obtained by the pinned source recurrence. The conclusions retain zero coefficients and apply even when a stated triple is outside the polygon. No coefficient filtering or index-dependent normalization occurs. These inequalities imply the corresponding polygon-guarded instances; they do not alter the pinned root's guards.

The first theorem has no qualifying triple when `n=0`; the second explicitly requires `n≥4`. Pure repeated-right paths and endpoint clauses are not newly covered by these mixed-path statements. Only direction `(1,-1)` and total degree `a+3`, the third **lower** diagonal, are addressed. The other directions, other outstanding diagonals and the remainder of this diagonal are not resolved. The full conjecture remains open, and no exact new root-equivalence result is supplied in this batch.

The first-band coverage strictly extends worker 79's `4 ≤ j`, `j+2 ≤ n`. For example, the actual `13/15` source obtained with `n=6` and empty `rest` permits `i=9,j=5`, giving points `(9,7),(10,6),(11,5)` of degree 16. They satisfy the pinned polygon conditions. This position is outside worker 79's index range, outside the previous low-slope whole-slice coverage `3a≤2b`, and outside the first six upper diagonals. This is a scope comparison, not a new numerical experiment or publication-novelty assertion.

## Exact coefficient identities and first-band proof

Let `T = thirdRunPolyADB2 n c r`. The inherited exact denominator identity is

`(1−X)^6 T = K0 + X^(n+2) D`.

`MarkovFirstCoefficients07F1` extracts each of `T_0,...,T_5` as an explicit integer polynomial. Each theorem explicitly requires its coefficient index to be below `n+2`; the source application supplies that condition. These expressions are proved using the denominator identity and exact formal-power-series coefficient extraction, not inferred from finite interpolation. The new unrestricted monomial extraction identity handles a monomial above the requested coefficient by returning zero.

Four first-gap certificates cover the starting indices 0,1,2,3 under respective bounds `n≥1,2,3,4`, together with `1≤r` and `r+1≤c`. They expand the actual gap into a polynomial in nonnegative shifted parameters and prove its nonnegativity. Seven further coefficient certificates prove the interior-shape gap nonnegative, extending the previous center range to `5≤center≤n`. The change of variables has explicit nonnegative parameters and exact ring identities; no sampling assertion is used as a premise.

`third_first_band_lc07F1` exhaustively splits `j≥4` from the four smaller natural values. It invokes the actual coefficient identity for the first case and the six exact low coefficients for the remaining cases. Consequently it proves `T_j*T_(j+2) ≤ T_(j+1)^2` whenever `1≤r<c` and `j+1≤n`.

The source adapter obtains `1≤r<c` from `frame_reduced rest`, with `c=(frame rest).mid.b` and `r=(frame rest).mid.a`. It proves each used index is below the actual cycle-correction threshold `b=c(n+1)+r`, uses the inherited all-cycle raw identity, and cancels the uniform factor six. Thus the exceptional two- and three-cycle corrections are not silently ignored.

## Second band and crossing composition

The second denominator identity is proved for every natural `n,c,r`:

`(1−X)^6 T = K0 + X^(n+2) K1 + X^(2*n+3) R2`.

Here `K1=tailPoly07F1 n c r` is an explicitly specified polynomial with eight coefficients. Its equality to the actual first delayed band is proved by a ring identity for arbitrary integer count parameters. `R2` retains the next two bands and the two-cycle correction. The first omitted term begins at precisely `2n+3`.

`extract_two_bands07F1` requires `n+2≤j<2n+3`. It expresses `T_j` as the coefficient of the inverse-sixth-power series applied to `K0`, plus the shifted coefficient applied to `K1`. `extract_tail07F1` requires the shifted index to be at least two; this condition guarantees the required binomial/falling-factorial identities include all eight monomials correctly. Combining these identities proves

`secondShape07F1 n c r j = 15*T_j`

for all natural parameters with `n+4≤j≤2n+2`. No source-admissibility condition is needed for this polynomial identity. Formal inversion is algebra over `ℤ[[X]]`, not analytic evaluation or convergence.

The crossing coefficient declarations identify the actual six coefficients at indices `n,...,n+5`, scaled uniformly by fifteen, for `n≥4`. In particular, indices `n+2` and `n+3`, where the general falling-factorial formula is not yet available, use exact constant and linear coefficients of the shifted series. Four crossing-gap certificates cover centers `n+1,...,n+4`.

For the second-band interior, the nonnegative parameterization `n=t+s+4`, center `2t+s+9` exactly represents `n+5≤center≤2n+1`. The `r≥2` case uses `r=u+2,c=u+v+3`. Eleven coefficients of the gap in powers of `s` are accounted for: nine nonzero nonnegative polynomials and two exact zero coefficients. The separate `r=1,c≥3` case uses coefficients in powers of `c−3`; the `c=2,r=1` case has its own exact nonnegative gap identity. These cases exhaust `1≤r<c`; no exceptional parameter is assumed away.

`third_two_bands_lc07F1` splits its natural starting indices into `j+1≤n`, `n≤j≤n+3`, and `n+4≤j≤2n`, applying the first-band, crossing and second-band proofs respectively. `source_third_two_bands07F1` then supplies actual source parameters and proves every used coefficient index through `2n+2` lies below `b=c(n+1)+r`, since `c≥2,r≥1`. The cycle corrections are therefore absent precisely in the asserted range. There is no remaining unproved formula or source-identification premise in the compiled composition.

## Finite checks and range limitation

The experiment's recorded parameter domain is `1≤n≤24`, `2≤c≤10`, `1≤r<c`, `gcd(c,r)=1`. I independently checked the saved input list and loop-domain counts, without importing or running the project code or recomputing coefficients:

- 744 distinct source parameter triples;
- 20,553 coefficient positions, through `2n+2` when `n≥4` and through `n+1` otherwise;
- 375 literal raw-numerator comparisons in the subset `4≤n≤8,c≤4`;
- 19,065 polygon-valid raw triples, including 2,604 crossing triples.

All reported assertions in these ranges passed and the saved failures list is empty. These finite calculations are not universal proofs.

The same experiment records eight failures of extrapolating the truncated two-band expression beyond its proved coefficient range. For the actual `9/11` source with `n=4,c=2,r=1`, index `j=11` gives predicted scaled coefficient 552 versus actual scaled coefficient 480. The proved formula ends at `j=10`. This is finite evidence against the unrestricted truncation formula, not a counterexample to raw log-concavity or the published conjecture. It has not been independently rerun or promoted to a Lean theorem in this audit.

## Validation evidence and qualifications

The companion [validation audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_validation_audit.md), SHA-256 `88aa890940fa1a2a670913c40dfad3e0b012d0422df9ad3fb82cd0718d7bfba8`, documents the individual receipt and controller/archive comparisons. Its [811-input-hash evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_validation_audit_evidence.json) has SHA-256 `bccbaa6fb06664856931dc67de986db9524aad25d37532cd7034ecfee2452841`. No missing checks were completed for this review.

There are 40 final-source mathematical modules containing 75 named theorem declarations, all with matching successful compilation records. The 68 ordinary run receipts consist of 40 successful builds, 15 successful individual `ReplayKnown6d2c` replays, 11 failed builds and two timeouts. The failed and timed-out attempts are not treated as proofs. In addition, the archived successful two-module union replay covers `MarkovFirstSource07F1` and `MarkovSecondCoefficients07F1`. Thus **17 distinct mathematical modules have completed replay evidence inside the worker-80 archive**.

The final `MarkovTwoBandsSource07F1` contains three theorems: the crossing composition, the two-band auxiliary inequality, and the actual source inequality. It compiled, but **no completed independent replay of that module is recorded**. The final generated Audit file was neither compiled nor replayed. Its inventory of 39 modules and 72 named theorems predates the final source composition and omits these three declarations. Successful mathematical builds print 24 unique permitted axiom closures, each contained in `{propext, Classical.choice, Quot.sound}`; observational source-reference chains cover the 75 named theorems. This is not an executed individual printout for every theorem or a new Lean dependency query, and the unexecuted Audit file supplies no additional axiom evidence. Static inspection of the forty mathematical modules found no admissions, custom axioms, native proof bypasses or unsafe declarations.

All **250 controller-listed files** match live bytes, archived bytes and controller after-hashes. The validation auditor also found 545 earlier/pinned observer hashes unchanged. The first comparison includes all final mathematical source files and successful ordinary run receipts. There is no worker-produced aggregate acceptance manifest: no finalizer was invoked and `validation.json` and the aggregate artifact/preservation outputs are absent. References in the mathematics and correspondence documents to completed final acceptance in `validation.json` are therefore premature.

### Late receipt outside the worker archive

One additional receipt exists in the live evidence directory:

`evidence/markov-07f1d410/kernel-union-1792051911627555000.json`

It is 6,665 bytes, SHA-256 `13530b05854227766d621842b84fc17c6e41719b661394581bf4c0fa98c276cd`. It is absent from the worker-80 archive and controller changes. My independent directory comparison found this to be the only live file in that evidence directory missing from or differing from the worker archive. The worker archive itself is unchanged.

This receipt reports a successful union replay of 39 mathematical modules, including the second-band inequality and crossing certificates, **excluding `MarkovTwoBandsSource07F1` and Audit**. It is a late completion record for the union command launched at retained event 195; that start has no matching completion event in the retained controller stream. It must be preserved separately and not represented as an archived, completed-before-timeout check. The successful mathematical compilation records and source hashes for its selected modules remain independently archived.

Controller start was **07:40:37.633314 UTC**, deadline **08:10:37.633314 UTC**, finish **08:10:42.915589 UTC**. The union wrapper names its receipt at completion, **08:11:51.627555 UTC**, approximately **68.712 seconds after controller finish** and **73.994 seconds after deadline**. Its recorded elapsed time is 176.131 seconds. This is not merely a receipt copied late for a check known to have completed before cutoff. The authoritative controller outcome remains `timeout`, with `mathematical_resolution: false`, no final report and one unmatched recorded union launch.

The live late record is additional evidence with a distinct preservation boundary. It neither completes the omitted source-module replay nor executes the final axiom audit or finalizer. No audit action here creates those missing results.

### Replay-method scope

The archived individual replays use the unchanged, previously audited `ReplayKnown6d2c` driver. Worker 80 also introduces `ReplayBatch07F1`, whose final hash is listed below. The separate [replay-method audit](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_replay_method.md), SHA-256 `78d01c817b47d34a216ae3d9850335a833877be881e8b18562dfb694d558e97d`, and its [184-input-hash evidence](/private/tmp/math_gkm_godel_20261013/markov_worker_000080_replay_method_evidence.json), SHA-256 `aaea7e46eb1c8858677dd8c0de235884d208fd0a0a8fa88ebbea41b16fe29fb1`, establish the following static findings without running the checker:

- The new driver collects all constants from the selected modules' most-private available object parts, using the same extraction pattern as the pinned per-module checker. It is a module union replay, not a selector that checks only the named public theorems. The 39 selected sources contain 72 explicit theorems and 90 definitions; generated compiled constants are also included by the collection procedure, though the receipts do not dump their names or number.
- Requested module names are excluded from direct imports before the imported base environment is constructed. The two-module batch has six explicit retained roots and 138 local transitive source modules, including 15 other worker-80 modules. Its inherited boundary is therefore relative to the selected pair. The 39-module batch has two explicit retained roots, `MarkovInteriorSourceFDDA` and `MarkovShapePartsBDEE`, with 123 local transitive modules, all matching their before-run hashes. Neither static source closure contains a selected module, an explicit target name, or a source import cycle. Mathlib leaves remain trusted imports. Metadata counts printed by the driver are seven and three imports respectively; their actual compiled import names are not dumped.
- The driver calls the pinned `Environment.replay`, which recursively processes dependencies and sends safe nonpartial declarations to `Kernel.Environment.addDeclCore`. Existing replay conventions still skip unsafe/partial constants and admit declared axioms; replay alone is not an allowed-axiom-policy checker. No such bypass/custom-axiom/admission tokens were found in the inspected mathematical sources.
- A map insertion would overwrite duplicate names, and pinned replay can skip an already-present theorem with matching name/type/level/mutual fields without comparing its proof. Static name and transitive-source inspection found no duplicate explicit target names or route to that skip here. This is not a dump or independent reconstruction of compiled constant tables, so the usual source/build/object binding limits remain explicit.
- Pending-cycle bookkeeping does not insert a theorem or axiom: ordinary declarations still need to pass the kernel against the available environment, and mutual inductives take the kernel inductive path. The batch driver adds no circular-assumption mechanism.

The method supports the retained selected-module replay records under their stated reused-import boundary; it does not extend their selected module lists or repair the late-record boundary. These records are not official `leanchecker` CLI receipts or a fresh rebuild of inherited source dependencies. Receipts hash selected source snapshots and the driver, but not object bytes at invocation or a complete compiled constant list. No replay-method equivalence is inferred merely from a success string.

## Principal final-source hashes

I independently compared all 42 live `*07F1.lean` files with their worker-80 archived copies; all matched. These comprise 40 mathematical modules, the unvalidated final Audit file and the new operational replay driver. Principal hashes are:

| Source | SHA-256 |
|---|---|
| `MarkovFirstSource07F1.lean` | `4ed9379a50804ee4963dfd269d024289f8f360ec21fb7cdf26ff438c8b2d09ba` |
| `MarkovTwoBandsSource07F1.lean` | `bfc810c1595d3cd18611995a2dd825d530c95bec0cb923594762b275e806f949` |
| `MarkovFirstCoefficients07F1.lean` | `9c9a698646b878c5eb04c8f2388296450da389ef64782f70142d80c460b15bde` |
| `MarkovSecondCoefficients07F1.lean` | `dfe416ea1d45f5c4ecf591591ea11ccdf65ba2ed4d836bf11658076c9323f2c8` |
| `MarkovSecondShape07F1.lean` | `c5f52ec3f784e29526e4ccc6c9d978e6f32707325ffae060be8ea5642b789e2a` |
| `MarkovCrossCoefficients07F1.lean` | `efbd7890c3e6cd82581b4118ae40c7e1cf402b16265ad65facba161bba8e55b2` |
| `MarkovSecondLC07F1.lean` | `b1c9d4d6c7cbf9dceb2f31cb94a15659b4a2221230b3a99ba3bf5ae4f0e98dae` |
| `MarkovAudit07F1.lean` | `7aa60efda3340345c673be0c9117dbf110bb9cebc43925a31a1cb3f3fc349066` |
| `ReplayBatch07F1.lean` | `502fedb68f64aad8487592b1844bf0a123d3c17d5826add10750a7b1c96c5cdc` |

The mathematical English agrees with the final theorem statements, with the explicit index restrictions above. The first-band raw extension has archived compilation and replay support. The complete two-band source composition has a successful compilation and mathematical source audit, but its separate replay and aggregate audit/finalization remain missing. The late 39-module replay is additional, explicitly unarchived evidence for its selected helpers and first-band source theorem. None of these results resolves the full conjecture.
