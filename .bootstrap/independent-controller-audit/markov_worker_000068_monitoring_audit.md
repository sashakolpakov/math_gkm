# Worker 000068 mathematical monitoring audit

Worker `000068`, request `89ce11adb69243f8836fc68470d6d524`.

**Conclusion.** The seven final Lean modules contain 28 named theorems with successful matching compilation and alternate-driver kernel-replay records. The English account accurately distinguishes a nontrivial sufficient transport certificate from its still-unproved universal source existence. The derived source theorem gives the full raw diagonal clause conditionally; it does not prove the horizontal/vertical clauses, endpoint conjunction, or Conjecture63. The unconditional weighted theorem covers source 2/7 at two cuts. The negative example is expressly an auxiliary array, not a source counterexample. I found no mathematical contradiction or scope inflation in those claims.

This audit inspected saved sources, records and hashes only. No proof compilation, replay, finite experiment regeneration, project write, proposer contact or mathematical research assistance was performed. A separate static finite-data review is recorded in `markov_worker_000068_finite_audit.md` alongside this report.

## Exact English meaning of the new Lean results

### Pair order: four theorems

`NatCross89 w` means `w i * w (j+1) ≤ w (i+1) * w j` for all natural `i≤j`. `natCross_of_increasing_adjacent89` derives this from three separate assumptions: every weight is nonnegative, the sequence is **nondecreasing**, and every adjacent log-concavity inequality holds. The proof handles `w i=0` separately; its later cancellation has a proved strictly positive factor. No hypothesis of strict positivity is hidden.

`natCross_balanced89` supplies the balanced-pair inequality. `degree_pair_order89` and its unsorted version then say that the product of the weights does not decrease when the minimum degree and the sum of the two degrees both increase. The sorted theorem includes both sorting hypotheses; the unsorted theorem applies `min` and `max` explicitly. This is a weak product inequality, not a strict one. The nonnegativity, monotonicity and cross conditions are all visible premises.

### Finite transport: two theorems

For a finite set D, a signed gap array G, nonnegative residual R, nonnegative flow M, and nonnegative test weights W, suppose

`G(x) = R(x) + Σ_y M(y,x) − Σ_y M(x,y)`

and every nonzero flow moves from a point of smaller W to a point of larger W. Then `Σ_x G(x)W(x) ≥ 0`. The proof expands the finite identity and swaps the incoming double sum; it uses no assumed nonnegativity of the desired sum. `degree_transport_nonneg89` specializes this result to products of nonnegative nondecreasing log-concave degree weights, using the minimum-and-sum order from the previous module.

Only values and flow edges inside D enter the premises or conclusion. The later source application supplies an exhaustive finite D; the generic statement does not silently assert that an arbitrary truncation is exhaustive.

### Exact gap and source bridge: four theorems

`pairGap89 A B C (d,e)` is `2 B_d B_e − A_d C_e − A_e C_d`. Summing over the ordered Cartesian square D×D gives **twice** the original weighted gap. `pairGap_sum89` proves that identity for arbitrary real arrays and arbitrary real weights. `weighted_array_lc_of_transport89` derives the weighted log-concavity inequality from a finite transport certificate and the weight assumptions.

`HasDegreeTransport89` is an explicit existential proposition about R and M, their nonnegativity, the allowed edges, and the exact signed conservation equations. It is not defined as log-concavity, does not contain the desired weighted inequality as a premise, and is not asserted as an axiom. The ordered-pair factor two is accounted for algebraically and does not alter the raw source coefficients.

`marked_diagonal_of_transport89` specializes to constant degree weight one. It explicitly requires that all three marked coefficient polynomials have degree below N. Its evaluation-at-one identity therefore sums **all** their coefficients. `source_diagonal_of_transport89` uses the inherited exact degree-layer/marked-coefficient equality and the raw source coefficient bridge, with the displayed index equation `i+j+2=a+s`. The final cast transfers a real inequality back to the literal integer coefficients.

The prose uses an unordered-pair convention for the experimental certificates; its stated conversion to the Lean ordered convention is arithmetically correct. Doubling each unordered mass and dividing it among its distinct orientations gives the ordered G array; splitting each transport across both endpoint orientations preserves the conservation equations. That conversion is explained in prose; the saved Python certificates are not presented as individually imported Lean proofs.

### Universal conditional source result: three theorems

`markedCoeff_degree_bound89` proves the concrete bound `natDegree ≤ 1+2*word.length`, by applying the inherited mask-degree bound to every actual mask in the sum. This includes the zero polynomial. `SourcePairTransport89` demands a certificate on `range (2*word.length+2)` for **every** finite source path and every natural cut count and coefficient start. Consequently this range includes every possible marked degree; the previous extra truncation hypothesis is discharged.

`source_diagonal_of_source_transport89` still takes `h : SourcePairTransport89` as an explicit premise. `source_diagonal_clause_of_transport89` derives the integer raw inequality

`c(i,j+2)c(i+2,j) ≤ c(i+1,j+1)^2`

for every generated source path, assuming just the first point `(i,j+2)` lies in the actual `InPolygon`. The source's positive reduced labels and this polygon guard imply `a≤i+j+2`, so `s=i+j+2−a` is a valid natural index satisfying the exact bridge equation. There is no truncated subtraction error.

Requiring only that first guard is stronger than the root's diagonal clause, which has three guards, and therefore supplies the entire root diagonal clause conditionally. It does **not** supply either other direction. The generated-path family includes the initial middle source 1/2; the separately listed 0/1 and 1/1 endpoint conjuncts of `Conjecture63` are not closed by this new theorem.

This is a **sufficient-condition implication**, not an equivalence between source log-concavity and transport existence. Universal existence of the certificates is the remaining mathematical obligation, explicitly left open by the module and documentation. Its quantification also includes cut/index cases outside the finite scans.

### Unconditional weighted source 2/7: five theorems

The path is the exact inherited `[false,false,true]`, whose source word is `[false,false,true,false,false,true]` and whose labels are 2/7. At cut count 2, `weightedCut89` sums every actual cut mask, with its original multiplicity, multiplying its polynomial by the weight at its marked degree. There are 15 masks (choose two of six positions); none is selected by a sign or support test.

`source27_weighted_formula89` proves the complete polynomial

`(w0+3w1+11w2) + (3w1+25w2)X + 14w2 X²`.

`source27_weighted_gap89` proves the displayed decomposition into `9(w1²−w0w2)`, `5(w1w2−w0w2)`, `103w1w2`, and `471w2²`. The subsequent theorem derives nonnegativity from the weight assumptions. `source27_weighted_cross89` proves CrossLC of the coefficient sequence extended by zero to all integer indices; `source27_weighted_all_lc89` gives every natural adjacent inequality. All-zero weights and zero coefficients are admitted, and no internal or boundary zero is deleted.

`weightedCut_at_one89` is a general exact identity for every word and cut count. At constant weight one it recovers the original cut polynomial. The inherited `full27_raw07a7` supplies the actual polygon-valid raw points `(4,0),(3,1),(2,2)` with values `[15,28,14]` and gap 574. This weighted theorem is unconditional in the sense that it assumes no transport existence; it still has the explicitly stated nonnegative/nondecreasing/log-concave weight premises. It establishes no new unrestricted raw-source family beyond the inherited example.

### Separation from scalar tails: ten theorems in two modules

The first module proves the exact gap polynomial `1−X⁴+X⁸`, its degree 8, and all the scalar coefficient-tail inequalities required by `CoeffTailNonneg7d`. It defines the global weight sequence `[1,10,100,100,…]`, proves nonnegativity, monotonicity and adjacent log-concavity, and evaluates the weighted gap as `−19799`.

The second module proves a generic consequence of the transport equations: for every r the sum of G over degree pairs with total degree at least r is nonnegative. This is the precise finite total-degree-tail statement formalized; it is not a universal certificate-existence theorem.

Its arrays have A supported at degree 2 with value 1, B at degrees 0 and 4 with value 1, and C at degree 2 with value 3. Their geometric weighted gap is exactly the evaluation of `1−X⁴+X⁸`. The capped weights give `[100,101,300]`, so `101²−100·300=−19799`. Applying the transport implication yields a contradiction, and `tail_arrays_no_transport89` proves that these arrays admit no certificate on `range 5`.

Thus scalar tails alone do not imply the stronger transport criterion. The arrays are not asserted to arise from a Markov source. In particular their degree-two coefficient layer has an internal zero, and neither this obstruction nor the independent arbitrary-word example is a counterexample to the root conjecture.

## Recorded proof verification

| Module (prefix `Markov`) | Named theorems | Build seconds | Alternate replay seconds |
| --- | ---: | ---: | ---: |
| PairOrder89ce | 4 | 12.049 | 33.216 |
| PairTransport89ce | 2 | 15.703 | 27.537 |
| PairGap89ce | 4 | 16.349 | 18.654 |
| SourceTransport89ce | 3 | 15.075 | 33.063 |
| Source27Weights89ce | 5 | 15.600 | 33.148 |
| TailSeparation89ce | 7 | 26.942 | 13.555 |
| TransportSeparation89ce | 3 | 6.218 | 9.622 |

Every listed final build and replay has subprocess return code zero. Each replay has the exact expected begin/pass lines, empty stderr, and the final source hash; each saved build/replay source snapshot matches. The final object hashes match the validation manifest, archived objects and controller receipt. The eleven unsuccessful elaborations remain rejected. The overlapping PairGap attempts are not used as accepted evidence; the final source has a later matching successful build and replay.

The 20 printed axiom-closure lines in the accepted builds list only `propext`, `Classical.choice`, and `Quot.sound`. The final mathematical sources contain no new axioms, `sorry`, `admit`, `native_decide`, unsafe/partial declarations or kernel-skip settings. This audit did not independently rerun every closure; its evidence is the saved successful compiler output plus source review and matching module replay.

These are **alternate-driver** replays using `lean --run research/ReplayKnown6d2c.lean`, not completed `leanchecker` CLI invocations. The unchanged driver SHA256 is `18acbc2d17aa7a1368de5d3b6f9d6b26340654c6fca17be091d0f63dc6bcb470`; its equivalence to the pinned default per-module kernel replay was independently audited in `markov_worker_000065_replay_method_audit.md`. Imported objects are reused, not freshly rebuilt or transitively replayed.

Unlike worker 65's combined receipts, the individual worker 68 replay JSONs bind their source snapshot but do not separately store the object hash or driver hash at invocation time. Their final object/driver identification comes from the validation/preservation record and archives. This distinction is preserved; no immutable whole-environment receipt is claimed.

All seven replay completions precede the final manifest and completed worker receipt. There is no observed late-success ambiguity or overwritten accepted validation file. All 86 indexed artifacts match live bytes, archive bytes and controller `after` hashes.

## Finite evidence and limitations

The static finite review confirms the full run's input list is precisely the 240 reduced pairs with `3≤b≤28` and `1≤a<b`. This intentionally excludes 1/2 and both separate endpoints. The full run traverses every cut `s=1,…,b−1` and every natural start j whose `j+2` does not exceed that cut polynomial's support extent. Zeros inside that extent remain present. The records contain 79,505 unique `(a,b,s,j)` certificate indices; 37,326 count triples whose pair array has at least one negative coefficient, not a count of individual negative pair coefficients.

The separate literal recurrence comparison checks the complete degree-summed raw coefficient arrays at 88,357 positions on those same 240 sources. It is not 88,357 independently certified log-concavity inequalities or a test of every individual degree layer.

The full and stress artifacts retain SHA256 digests of certificates/gap arrays, not their full payloads. Static inspection can verify input ranges, index uniqueness, reported counts and arithmetic-verifier logic, but cannot independently recheck every saved flow equation from a digest. The one complete retained certificate (source 3/4, s=1, j=2) satisfies the conservation equations and degree order by direct saved-data arithmetic, and its digest agrees with the full-run entry. Regeneration was expressly outside this audit. These finite computations are not Lean proofs of the source instances or the universal proposition.

The smaller exploratory transport run has 20,018 certificates on 321 listed sources; the stress run has 1,893 certificates on 23 listed larger sources with cuts at most six. They are finite selected runs and their counts overlap the full run. The arbitrary-word negative raw triple `[3378,2516,1896]` has gap `−74432` but is not asserted to be a mechanical source polynomial. The auxiliary-array obstruction and this arbitrary-word computation must remain separate from the unconditional actual-source 2/7 theorem.

## Preservation and documentation

The English scope documents correctly retain universal transport existence, horizontal/vertical directions, endpoint obligations and root completion as unfinished. The worker's controller receipt says `mathematical_resolution: false`; the checkpoint says completion remains null. The protected source SHA256 remains

`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

Two contract digests in the records use different valid representations. The scope document's `6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc` is the controller's canonical-JSON digest. The preservation record's `cc930bda09aaaa16b0662e9c0afa3c48167b1a07f2087eb6c2106c73c4a16068` hashes file bytes. I independently confirmed both; there is **no contract discrepancy**. An initial suspicion of a stale hash was withdrawn after checking the digest conventions.

Evidence is preserved under `/private/tmp/math_gkm_godel_20261013/markov_worker_000068_audit_evidence/`: reviewed text snapshots, `inputs.sha256.json`, and `summary.json` with full hashes, all 86 artifact comparisons, every accepted build/replay path, exact output and theorem inventory. Objects were hashed but not rebuilt. The outside-project record-audit script is `audit_worker68_records.py`.

Final comparison at **2026-10-15T01:27:17.550087Z** found all 96 inspected inputs unchanged. The remaining fresh full-source build, official root completion protocol and independent final source-correspondence obligations are not discharged by this partial-result audit.
