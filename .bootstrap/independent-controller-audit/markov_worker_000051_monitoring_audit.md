# Independent monitoring audit: worker 000051

Request `487ae88398fa4257b0567f68f6371317`, reviewed 2026-10-14. This audit is observational: no active source changes, compilation/replay retries, numerical reruns, proposer contact, mathematical guidance, or successor operations were performed. Exact reviewed source and receipt snapshots are saved in `markov_worker_000051_audit_evidence/` beside this note.

## Verdict and mathematical wording error

All **seven final modules, totaling 29 named theorems, compiled successfully**. Four modules—CyclicTrace, LowerBlocks, RunJet, and LowerSequence, totaling **20 named theorems**—have successful kernel replay. LowerFormula, LowerSource, and Interior contain the remaining nine named theorems and have only timed-out replay attempts. No late successful receipt changes this classification.

The compiled source-diagonal theorem has the advertised universal path scope and correct raw coefficient indexing. It includes the Pell branch and its single endpoint contribution; no zeros or polygon guards are suppressed. The compiled residual equivalence removes exactly the first nontrivial lower diagonal from the prior infinite residual, while retaining all other obligations. Neither equivalence side is proved as a proposition. The top-level documents qualify their formal status by the validation records, which correctly distinguish these three replay-incomplete modules.

There is **one algebra error in the English mathematics document**. It states that the first-center sequence gap, when the right coefficient is nonzero, equals

\[
(a-1)^2+4c(c-1).
\]

For the actual defined sequence `L0=a+c−1`, `L1=3a−1`, `L2=4(a−c)` in that case, the exact gap is instead

\[
(3a-1)^2-4(a+c-1)(a-c)
=\boxed{4a^2+(a-1)^2+4c(c-1)}.
\]

The prose omits `4a²`. For example `a=3,c=2` gives `[4,8,4]`, whose gap is 48; the prose expression gives 12. **The Lean proof is unaffected:** `lowerSeq_lc487` proves the inequality by algebra and nonnegativity and never asserts the erroneous equality. The next-center and interior-gap expressions agree with the source. No document was edited.

## Compilation/replay evidence and late receipts

| Module in `research/` | Theorems | Build | Replay |
|---|---:|---|---|
| `MarkovCyclicTrace487.lean` | 4 | exit 0, 6.875 s | exit 0, 29.581 s |
| `MarkovLowerBlocks487.lean` | 7 | exit 0, 17.259 s | exit 0, 79.254 s |
| `MarkovRunJet487.lean` | 7 | exit 0, 30.175 s | exit 0, 84.731 s |
| `MarkovLowerFormula487.lean` | 5 | exit 0, 24.354 s | timeout, 100.358 s |
| `MarkovLowerSequence487.lean` | 2 | exit 0, 28.002 s | exit 0, 59.959 s |
| `MarkovLowerSource487.lean` | 2 | exit 0, 36.729 s | timeouts, 100.250 s and 65.011 s |
| `MarkovInterior487.lean` | 2 | exit 0, 62.534 s | timeout, 65.007 s |

The manifest is dated `2026-10-14T19:42:24.869701Z`. The late Source retry `run-1792006930555041000.json` completed as a timeout at `19:43:15.568184Z` and is in the controller archive; archived event 211 records that timeout. The Interior retry `run-1792006952051148000.json` was written as a timeout at **19:43:37.060439Z**, after the worker timeout at **19:43:34.707900Z**. That late receipt is absent from the controller archive and final change list; its started source snapshot is present. Its source hash matches the final Interior source, but it is not a successful replay. The archived transcript starts Interior replay and contains no completion event for it.

Thus there is no analogue of worker 50's late successful replay. The four-success/three-incomplete manifest classification remains accurate. The older 19:35 checkpoint is explicitly an intermediate account; it is not the final validation summary.

The controller timed out after 1202.300 s, with `report: null`, `mathematical_resolution: false`, and no root completion. Its process return code 0 is not evidence that replay or final reporting completed.

All seven final source hashes match their successful build records, saved build snapshots, current source bytes, archived source, and controller receipt. All seven current `.olean` hashes match the manifest, archived artifact bytes, and controller receipt. Selected replay snapshots and source hashes also match. The late Interior timeout receipt is separately marked unarchived in the companion summary.

All printed main-theorem axiom closures in successful final builds contain only `propext`, `Classical.choice`, and `Quot.sound`. No final source introduces an axiom or admission. The recorded closure for the first lower source theorem and residual equivalence is a successful **compilation** check; it must not be reported as a completed separate replay. Failed earlier elaborations remain excluded. Inherited compiled imports were reused; this audit did not rebuild them or rerun axiom checks.

Final source SHA256:

```
CyclicTrace  b37ccee71d41e75c4d766f155c17d9f297d6c8489038247b911f4124f793fb48
LowerBlocks  a98e1abe125cdc5d0f2d2246b06bf79c371f15c81f3f836edd00c5670540693f
RunJet       232de23686ca34b389fd2ff92a3d741035e885f8e7ba82a34e814dec661b63f2
LowerFormula 8b61a905d0e6c797e034c4bd88d12688bf8b67826e3e11d66fed33d75ae75443
LowerSequence ec5d5fcca41a0369cbec4e1124f4bd2cbc899f97a358e332bd0d08cbeb9ed32f
LowerSource  190002538c25c8b2997c9b54f6ddd12820a16b4b0a2b800bb560ba39836d1922
Interior     3880956744a6cf639a60a85e6cc0347824fb97693213a324aa1bcff996ea0ab3
```

The companion summary records every selected build/replay receipt, exact source snapshots, archive matches, and final comparison timestamp. No large compiled artifacts were copied.

## Cyclic trace and exact source scope

`sourceMatrix_exact_word487` identifies the inherited matrix from the actual source recursion with `rawWord80 (sourceWord28 path)`. `source_ambient_trace487` then proves the polynomial identity

\[
\operatorname{tr}(T_{\mathrm{sourceWord}(path)})
=(1+x(1+y))F_{\mathrm{central}(path)}(x,y)
\]

for every finite path. Its inherited trace identity and exact shear gauge have no log-concavity premise. The only cancelled factor is the explicitly proved nonzero polynomial monomial `U^a`; this is not numerical division at `x=0` or a restriction to nonzero variable values.

`ambient_scalar_zero487` proves the entire constant-in-`x` polynomial is 1 for every ambient word. `source_first_cut_trace487` extracts the first `x` coefficient and subtracts exactly `1+y` to obtain the first cut coefficient. No value of `y` is substituted, and no normalization changes the original integer coefficients.

These source identities quantify over all finite protected paths, not just a Pell spine or a finite collection of slopes. Their correspondence with all reduced rational labels continues to rely on the inherited coverage results; the new modules do not silently replace that coverage by the numerical probe.

## Block formulas, boundary cases, and Pell endpoint

The independently reviewed formula modules are detailed in `markov_worker_000051_formula_audit.md`. Their exact source decomposition distinguishes two cases:

- `path` is a repetition of `true`, yielding one block `A B^(k+1)` and the Pell label `(a,b)=(k+1,k+2)`.
- Otherwise the actual source word is a concatenation of blocks `A B^n` and `A B^(n+1)`, encoded by a mixed Boolean word. If its length is `c` and its true-count is `r`, then `c>=2`, `0<r<c`, and the actual labels satisfy `a=cn+r`, `b=c(n+1)+r`. Thus `c=b−a`.

This decomposition is proved from the source pair recursion; arbitrary palindromes are not substituted. The case `n=0` is permitted. The mixed-word conditions exclude the degenerate single-run branch rather than silently dropping it.

For each block, the jet calculation proves its constant matrix shape and first-degree relations. `lower_trace_sum487` requires **at least two blocks**; its formula is not used for the single-block Pell case. `lowerH_coeff487` gives

\[
[y^0]H_n=n+1,\qquad [y]H_n=3n,\qquad
[y^j]H_n=4\max(n+1-j,0)\ (j\ge2).
\]

The natural subtraction in the formal coefficient formula exactly represents the truncation. The non-Pell first-cut polynomial is `c H_n+r(1+3y+4y runSum_n)−1−y`. `lowerPoly_coeff487` identifies its coefficients with

\[
L_0=a+c-1,\quad L_1=3a-1,\quad
L_j=\max(4(a-c(j-1)),0)\quad(j\ge2).
\]

Its `r<c` premise is explicit and is supplied by the actual source decomposition. The source application also supplies `a>=1`, `c>=1` to the universal integer sequence inequality. Zeros from the ramp cutoff are retained; the proof splits cases where the right endpoint vanishes and never divides by a coefficient.

`source_pell_slice487` separately proves `H_(k+1)+y^(k+2)−1−y`. The extra `y^(k+2)` contributes **one at `j=a+1`** and cannot be omitted. For the empty path (`k=0`, source `1/2`), the first slice is `[1,2,1]`, illustrating the endpoint contribution. The source theorem's Pell branch uses the inherited full Pell raw diagonal inequality, including its polygon guards, so it does not apply the truncated non-Pell sequence to a Pell endpoint.

The sequence inequality is for every natural sequence index and integer `a,c>=1`. It asserts neither strictness at every index nor positivity of every term; vanishing tails are included. The English first-center gap equality error noted above is outside the Lean theorem.

## Exact raw diagonal theorem

The compiled theorem `source_first_lower_diagonal487 path i j` assumes

\[
i+j+2=a+1
\]

and all three original polygon memberships at `(i,j+2)`, `(i+1,j+1)`, `(i+2,j)`. It concludes the original raw inequality

\[
A(i,j+2)A(i+2,j)\le A(i+1,j+1)^2.
\]

Thus every point of the triple lies on total degree `a+1`, or excess `s=1`. The `+2` in the hypothesis is essential to matching the actual displayed triple. It is the first nontrivial lower **diagonal**, not the first coefficient in a horizontal or vertical row.

The non-Pell proof uses the exact source/cut coefficient identity at selected count 1 for all three indices, followed by the coefficient formula and `lowerSeq_lc487`. The Pell proof invokes an already-proved source theorem, not an extra hypothesis. There is no finite path bound, no source log-concavity assumption, and no unproved monotonicity premise. The proof does not remove the source polygon guards even where the auxiliary sequence result is valid more broadly.

## Exact infinite residual equivalence

`polygon_diagonal_lower487` proves from the first polygon guard and actual labels `0<a<b` that `a+1<=i+j+2`. This is a strict improvement over a bare total-degree lower bound because that endpoint has positive second coordinate `j+2`. When the new residual lower restriction fails, natural arithmetic therefore forces **equality** with the proven slice `a+1`; no lower triple is left untreated.

`Interior63487` keeps the inherited horizontal and vertical residuals unchanged, including all polygon guards and `i+j+3<=a+b−1`. Its diagonal residual keeps the three polygon guards and the inherited top-layer restriction `i+j+5<=a+b−1`, and adds exactly

\[
a+2\le i+j+2.
\]

`root_iff_interior487` proves `Conjecture63 ↔ Interior63487` by combining the inherited exact `root_iff_interiorB5` with this new slice theorem. The old equivalence already handles the two endpoint fractions and removed upper layers. Neither endpoint is silently dropped; the new proof inherits those established clauses. The remaining predicate still universally quantifies over all paths and the specified coefficient positions. It is infinite and unproved, not a bounded search certificate or a proof of the root.

The final residual theorem compiled successfully, with standard recorded axioms, but its separate replay timed out after the worker ended. This scope distinction remains necessary when reporting the result.

## Finite evidence and limits

The static subaudit found 7114 distinct reduced fraction inputs: all 6857 reduced interior fractions with denominator at most 150, plus 257 accepted seeded larger inputs (actual denominators 155 through 1497). The recorded 477626 coefficient comparisons equal the sum of `a+3` across these inputs, and 463398 adjacent tests equal the sum of `a+1`. The first-cut/transfer comparison covers 101 inputs with denominator at most 18 and checks the bounded coefficient lookups used by the script, not equality of entire dictionary representations. No finite experiment was rerun here.

The experimental palindrome with virtual label `10/13` and `[28,20,16]` is not the actual mechanical source word; the document does not use it as a source counterexample. This finite observation is separate from the proved exact run decomposition. Neither the finite input coverage nor an arbitrary palindrome substitutes for the universal source theorem.

## Final state

The protected root remains unchanged at SHA256 `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`. The final source formulas, indexing, boundary handling, and residual equivalence are mathematically consistent with their advertised scope. The only identified mathematical prose error is the omitted `4a²` in the first-center gap equality. Four modules completed replay; three did not. The published conjecture remains unproved and unrefuted.
