# Independent monitoring audit: worker 000008

Read-only mathematical review, 14 October 2026. Request: `5a7c193a9eab42449226721ceef3a3a6`. Reviewed the completed worker archive under `/Users/sasha/math_gkm/.control/markov/workers/000008/artifacts`, its correspondence/checkpoint and validation manifest `evidence/markov-5a7c193a/validation-1791937954198370000.json`. No project files were edited, no proof advice was supplied, and active worker 000009 was left undisturbed.

## Main conclusion

The new final theorem genuinely proves the required raw-coefficient log-concavity inequality on the first four upper diagonals of every source-path Markov polynomial. There is no denominator or path-length cutoff, no remaining small-a condition, and no factorial or other coefficient normalization. No substantive English/Lean mismatch was found in this claim. This is a partial result toward Conjecture 6.3, not its completion.

Write d = a+b−1 and A(i,j) for the integer coefficient of the source polynomial. `first_four_polygon_logConcave5a7` quantifies over every finite source path and natural r,i,j, assumes r≤3, membership of (i,j+2) in the prescribed polygon, and i+j+2+r=d, and proves

    A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2.

The three indices have constant sum d−r. Thus r=0,1,2,3 mean exactly the first four upper diagonals in the conjecture's third principal direction. The protected root requires all three points to belong to the polygon; the new theorem requires only the first endpoint, so it covers all root-valid triples on these diagonals. Coefficient zeroes are retained. The universal source-path quantifier connects to the previously checked coverage of all reduced interior rational indices. The separate rational endpoint cases remain handled by the existing boundary results.

## Small indices and zeroes

`first_three_raw_logConcave5a7` handles r≤2 without any polygon premise. It combines the existing top-face result, the exact linear residual for the second diagonal, and a third-diagonal proof now including a=1 and a=2. In the latter cases the quadratic constant coefficient vanishes; the other coefficients are nonnegative by the established source quotient positivity. The formal CrossLC argument uses the zero-extended sequence and does not delete zeroes or assume an unstated positive-support condition.

For r=3, `fourth_raw_logConcave5a7` proves the raw inequality whenever d≥6 and i+j+5=d. `fourth_polygon_logConcave5a7` discharges d≥6 from the actual polygon premise. If d<6, the index equation forces d=5 and i=j=0. Polygon membership at (0,2) would require ab≤2a; reduced source indices give a>0 and b≥3, a contradiction. Therefore this cutoff does not leave any valid small-degree polygon triple untreated.

## Exact cubic formula and inequality scope

`word_cubic5a7` is an exact identity over any commutative ring for a word A(core)B with nonempty core. Let n be its core length, m its number of B letters, and s the number of adjacent letter changes inside the core. Six times the cubic-in-t quotient coefficient, after u=xt and v=t, equals

    A6 + B6 x + C6 x² + D6 x³,
    A6 = m(m−1)(m−2),
    B6 = 3[2(n−1)+3m−5m²+nm+nm²−4s],
    C6 = 3[2n(n−1)+m(n−1)(n−4)],
    D6 = (n+1)n(n−1).

The proof is a row-state induction, not an inference from numerical fitting. The nonempty-core restriction is genuine and explicit: the formula does not hold for the empty core. The source application with d≥6 supplies the restriction, so it creates no gap in the final theorem. The source word bridge supplies n=b−2, m=a−1, and the bound s≤2(n−m).

`cubic_inequalities5a7` assumes natural n,m with m≤n and 4≤m+n, real s with 0≤s≤2(n−m), and the relevant nonnegative coefficients, and proves all three products needed for the zero-extended cubic CrossLC predicate: A6*C6≤B6², B6*D6≤C6², and A6*D6≤B6*C6. Its discrete small cases are present, including m=n=2. In the source application coefficient nonnegativity is discharged by the previously proved quotient-slice nonnegativity, rather than left as a new conjectural premise. The established residual/binomial transport then yields the actual raw integer coefficient inequality. The factor six is canceled over the reals and does not change the target normalization.

## Compilation and replay evidence

The worker completed after approximately 987.36 seconds. I checked the archived source hashes against the manifest and host-recorded archive, and inspected matching successful compilation and additional kernel-replay receipts for all four new modules:

| Module | SHA-256 | Successful build receipt | Successful replay receipt |
|---|---|---|---|
| MarkovCubicBounds5a7 | `4bde4472e83b1864ac873bfce4ba6684d05ff8ae748541edebd2b3003b791821` | `run-1791937726833481000.json` | `run-1791937789650204000.json` |
| MarkovCubicJet5a7 | `cb14b3147724120d83bcf26e7ffc549fb7c4df9373a1c86922e9a9b9164269fc` | `run-1791937591382853000.json` | `run-1791937726833220000.json` |
| MarkovFourth5a7 | `29038028bccc076676078dcfd85376967b8465815f3f9cac3299b9e9bbc8f966` | `run-1791937840971793000.json` | `run-1791937916113664000.json` |
| MarkovLowSlices5a7 | `3839ae5afe8f41d0f0ceb2923f9cf85a48269d2363587af9064e550c4f514c49` | `run-1791937297008712000.json` | `run-1791937397346341000.json` |

Receipts are under `evidence/markov-5a7c193a/`. The 13 printed theorem closures report only `propext`, `Classical.choice`, and `Quot.sound`. Six rejected earlier build receipts remain separately recorded and are not accepted proof evidence. The protected root source hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

These are inspected recorded builds/replays against inherited compiled imports, whose hashes are recorded in the manifest. I did not perform a fresh independent rebuild of the complete dependency graph. The manifest correctly records no independent completion audit and a null completion claim.

## Experiment interpretation and remaining scope

The worker's finite experiments also find a failure in an enlarged family of words with palindromic interiors and coprime letter counts. That family is larger than the source Farey words: the failing word for counts 8/11 differs from the actual 8/11 source word. This is not a counterexample to Conjecture 6.3. Finite word scans are supporting evidence and did not substitute for the universal cubic proof.

The first two upper diagonals include published results; the third extends the paper's stated ratio-restricted result, and the fourth is additional verified progress within this project. No historical novelty conclusion is warranted without a separate literature review. Higher upper diagonals, the remaining horizontal/vertical inequalities, and the full conjecture remain unproved. There is no final completion claim, and this monitoring note is not a root proof/refutation certificate.
