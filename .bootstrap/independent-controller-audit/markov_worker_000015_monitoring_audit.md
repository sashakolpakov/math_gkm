# Independent monitoring audit: worker 000015

Read-only review, 14 October 2026, request `6ade2697ecb948b480f5d51ccf815ce8`. Reviewed the completed archive `/Users/sasha/math_gkm/.control/markov/workers/000015/artifacts`, all seven final `Markov*6ade.lean` modules, checkpoint/correspondence/mathematical note, final report, and `evidence/markov-6ade2697/validation-1791945852426264000.json`. No project edits, proposer contact, proof advice or interference with active worker 000016.

## Conclusion

The complete numerator-one source subfamily is proved in all three raw coefficient directions, with zero retention and no denominator bound. The exact reduction of the protected root to source numerators at least two is sound. The numerator-two source classification and product identity are also proved, but its log-concavity transfer retains an explicit unproved consecutive-product hypothesis. The arbitrary-product obstruction is not a source counterexample. No substantive English/Lean mismatch was found; the full root remains open.

The numerator-one result reconstructs the known Markov–Fibonacci special case of published Theorem 6.4. It is valuable formal completion of a whole source family, not a new solution of that previously proved special case. [Primary paper, §6](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

## Actual numerator-one family and formula

`fib6` is a polynomial family, not merely a numerical Fibonacci sequence. It has F₀=1 as a recurrence auxiliary, F₁=u+v and F₂=(u+v)²+u. `source_fib6` identifies F_(n+2) with the actual all-left source path, and `spine_b6` proves its label b=n+2. The inherited source-one classification proves that every path with numerator a=1 has this form; hence no numerator-one paths are omitted.

The coefficient formula is proved from the exact source recurrence and boundary identities:

    [u^(i+1) v^j] F_(i+1+j+k)
       = choose(i+k,i) choose(i+1+j,j),    i,j,k natural.

This matches the published formula after relabeling its denominator and applying binomial symmetry. The i=0 axis in the original coefficient coordinates is handled by `fib_axis6` as the single monomial v^b; the formula does not use an implicit convention for negative binomial upper indices. The top face and horizontal boundary are separately proved, and the interior formula uses strong induction on the recurrence. There is no external formula assumption.

## Three directions, zeros and endpoints

`fib_horizontal6`, `fib_vertical6` and `fib_diagonal6` prove the three raw adjacent inequalities as products of binomial inequalities. The auxiliary `choose_upper_lc6` includes the zero case where the lower binomial index exceeds its upper index. No coefficient division or positivity assumption is applied at an unproved zero boundary.

`fib_weakLC6` proves exactly `WeakLC 1 b (fib6 b)` for every natural b. For polygon triples touching the original i=0 axis, horizontal and vertical triples are impossible, while diagonal triples are reduced to the separately proved top face. The theorem therefore does not silently exclude this boundary. In particular the b=1 endpoint is included, with no nonvacuous triple there.

`source_one_weakLC6` transfers this to every actual a=1 path. `source_one_global6` then uses the checked source support containment and `global_iff_weak18` to obtain the all-natural-index property in all three directions, including zero coefficients outside support. It does not infer positivity or assume saturation. No arbitrary denominator cutoff or finite scan appears in these statements.

## Exact remaining root

`root_iff_numerator_ge_two6` states an equivalence between the unchanged `Conjecture63` and `GlobalLC18` of every actual source path with numerator at least two. The forward direction follows from the protected inequalities and the established support equivalence. The reverse direction exhausts source numerators using a>0 and the newly proved numerator-one theorem, then invokes the already checked exact raw-matrix root equivalence, which includes both rational endpoint obligations.

Thus the new remaining statement preserves every direction and natural index for every a≥2 source path. It does not replace the root by a stronger product conjecture, discard endpoints, or make completion automatic. That remaining universal statement is still unproved.

## Numerator two and product obstruction

`source_two_path6` proves every a=2 path is L^nR. `source_two_product6` therefore supplies q≥1, actual denominator b=2q+1, and the exact identity

    P_(2/(2q+1)) = (u+v+1)F_q F_(q+1) − u v^q.

`two_removed_outside6` proves the subtracted monomial has zero coefficient at every point of the literal source polygon. Its sole exponent (1,q) fails the oblique support condition. `source_two_of_product6` uses this to transfer all three polygon-restricted inequalities **assuming** `GlobalLC18` of (u+v+1)F_q F_(q+1) for every q≥1. That hypothesis is explicit and unresolved. This is a sufficient conditional bridge, not an equivalence or an unconditional numerator-two result.

`fib_product_triple6` proves that the different, nonconsecutive product F₁F₄ has coefficients 2,3,5 at (1,2),(1,3),(1,4), giving 9<10. `fib_product_obstruction6` proves each factor's source `WeakLC` property and failure of the product's unrestricted `GlobalLC18` property. It refutes an unrestricted multiplication-closure claim. The product is not identified with a source polynomial, and this witness neither refutes the protected root nor disproves the specific consecutive-product hypothesis above.

## Matching verification records

The worker completed after approximately 1138.73 seconds. All seven final source hashes match the archived bytes, manifest and controller-recorded artifact hashes. Every successful build/kernel receipt matches its archived hash and identifies the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovFibonacciBase6ade | `c362da0debfefd408affae28ce9ae82cacf404924c7b729e376f5a34dd2feb99` | `run-1791945073898672000.json` | `run-1791945333992079000.json` |
| MarkovBinomialLC6ade | `690acf9d2a094b84af3f086c8aff9cf572d04b84dfe1a1cf8da629d9cc3bdcbd` | `run-1791945137087657000.json` | `run-1791945335179079000.json` |
| MarkovFibonacciFormula6ade | `c6f6103bf1e0892e3a9bf28ab9b90a739139554e693bda86d051b7d0240dd436` | `run-1791945198411940000.json` | `run-1791945288948435000.json` |
| MarkovFibonacciLC6ade | `2aede04f9b666e1b3fb12ff9954724de6bfd1d5f2e1aaccdda94ed6f0dcf91c4` | `run-1791945332799062000.json` | `run-1791945454695443000.json` |
| MarkovRemaining6ade | `1ee3dd34d7eee3b66e7aa35af83684892222b2c7df66fad9f78c7aca7ad1c63a` | `run-1791945453505607000.json` | `run-1791945551318655000.json` |
| MarkovNumeratorTwo6ade | `1195946c3c3b573d8582e4438d9b3fba5216e654c781bae9ff29fec37867b5ca` | `run-1791945713374546000.json` | `run-1791945832044736000.json` |
| MarkovProductObstruction6ade | `944ae5d464efebc226d4492027e9a1acea805354cf920dcb421eafdcb7c2e0e3` | `run-1791945671447120000.json` | `run-1791945786949238000.json` |

All receipts are under `evidence/markov-6ade2697/` and exit successfully. Eighteen printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`. Five earlier rejected compilation attempts each have exit code 1 and are separately retained. The root source remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected recorded named-module compilations and kernel replays against inherited compiled imports; it did not independently rebuild the full dependency graph. The manifest records that limitation and a null completion claim. Reported finite family/product scans are supporting evidence only and were not rerun for this audit. This note is not a full-root proof/refutation certificate.
