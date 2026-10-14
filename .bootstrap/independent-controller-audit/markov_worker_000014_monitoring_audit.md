# Independent monitoring audit: worker 000014

Read-only review, 14 October 2026, request `274e697316c74a42a3ef9a5e29d76c17`. Reviewed the completed archive `/Users/sasha/math_gkm/.control/markov/workers/000014/artifacts`, all six final `Markov*274.lean` modules, checkpoint/correspondence/mathematical note, final report, and `evidence/markov-274e6973/validation-1791944710984284000.json`. No project edits, proposer contact, mathematical advice or interference with active worker 000015.

## Main conclusion

The earlier source-formula gap is now discharged, and the small-numerator cases are proved. `vertical_one_all274` establishes

    A(1,j) A(1,j+2) ≤ A(1,j+1)^2

for every finite source path and every natural j, using the literal pinned raw integer coefficient function. There is no formula hypothesis, numerator lower bound, denominator cutoff, polygon guard or nonzero-coefficient assumption in this final theorem. All zeros are retained. No substantive English/Lean mismatch was found. This is the first interior vertical line i=1, not the full vertical predicate or the full conjecture.

## Source formula and actual block counts

`blocks_scaled274` proves the cleared additive block-jet identity for arbitrary finite lists of the two run blocks, including the empty-list base. Nonempty-product shape conditions required by the inherited multiplication theorem are explicitly discharged. This generic identity is applied to the source only after the actual source decomposition is proved.

`source_block_counts274` strengthens that decomposition with both source-label relations: the number of blocks is the actual numerator a, and total word length is a(n+1)+r=b, where r counts long blocks. Both block types occur outside the all-left branch. Hence r<a; q=n+1 is at least one. These are properties of the actual source word, not guesses based on a finite scan or an arbitrary-word identification.

`source_cleared274` uses those counts and the inherited actual source trace/determinant jet for a≥2. The all-left branch is excluded by the separately proved numerator-one identity. `source_formula274` then proves the exact source coefficient polynomial for a≥3, with q,r satisfying

    1≤q, 0≤r<a, b=aq+r.

The theorem does not separately mention `Nat.div`, but these relations uniquely characterize the usual quotient and remainder since a>0. This is sufficient for its mathematical meaning and for the subsequent inequality. The cancellation of v^q(1+v)^3 is performed in the integer polynomial domain with nonzero factors proved; q≤b and a≥3 justify the remaining exponents. Natural subtraction is not masking a missing exponent condition.

`blockH_ramp_map274` proves the coefficient-preserving integer-to-real map of the resulting residual to the already checked ramp polynomial. `vertical_one_raw274` explicitly supplies this equality to the inherited conditional theorem `vertical_one_of_formula025`. Thus the latter's previously free representation parameters are now the actual source a,b and the proved q,r, and its missing equality premise is no longer assumed in the a≥3 source result.

## Small numerators and zero extension

`source_one_spine274` proves that a source path with a=1 consists entirely of left steps. The new exact run-jet recurrence then supplies `source_one_formula274`, an actual polynomial representation by a truncated arithmetic sequence. It is not an assumed closed formula from the paper or an enumeration up to a denominator bound.

For a=2, `source_two_formula274` starts with the proved cleared source identity. The exact source coprimality and r<2 force r=1; cancellation gives the shifted truncated-arithmetic representation. The necessary matrix and polynomial conditions are proved in this chain. No case a=2 is silently left to the a≥3 ramp theorem.

`trunc_cross274` proves CrossLC for a positive arithmetic progression whose final entry is any nonnegative value at most its arithmetic continuation. It proves nonnegativity and interval support as well as adjacent inequalities, and includes zero extension, a zero terminal entry and q=0. `truncPoly_cross274` connects the literal polynomial coefficients and monomial shifts. The two actual small-source representations meet these hypotheses.

Finally `vertical_one_all274` uses source a>0 and an exhaustive split into a≥3, a=1 and a=2. Its raw adapter converts CrossLC back to the actual integer coefficient inequality for every natural j. The inherited source-coverage result supplies all reduced interior rational indices. The separate 0/1 and 1/1 endpoint obligations remain vacuous within the protected root; no nonvacuous endpoint is removed.

## Matching verification records

The worker completed after approximately 1144.56 seconds. Each final source hash matches the archived bytes, manifest and controller-recorded artifact hash. Every successful build/replay receipt matches its archived hash and the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovBlockAssembly274 | `b9209e366744acb53deac92a5ea609bd7d9cf05a0c1d551e0bc2bdfb91b3fb2e` | `run-1791943770279124000.json` | `run-1791943797346988000.json` |
| MarkovBlockCounts274 | `e9518a0a5b25b8d60b57bc0b23185e61809d17c1b5a7e4a27afcecf0f0cbbe5b` | `run-1791943895518873000.json` | `run-1791943924431018000.json` |
| MarkovVerticalFormula274 | `955326ea9fca7142ce3a4a8f060bdbe02f3099205340496e29d062ec13d4f21b` | `run-1791943963942407000.json` | `run-1791944372292054000.json` |
| MarkovVerticalLC274 | `ed5b6d7ff97296ad9eca1674a1cd72c0718d42fdcb967829c8f1fd0f3b130bd6` | `run-1791944481246224000.json` | `run-1791944533632624000.json` |
| MarkovTruncated274 | `d8e013b7046ef9b42f07566e28eef584a3ea8396b7929485494e112662d34db8` | `run-1791944410139380000.json` | `run-1791944481245322000.json` |
| MarkovSmallVertical274 | `f02ca2647196072594f8272de626b6e617f259316ffb3aac152ac304419c89ee` | `run-1791944599803671000.json` | `run-1791944644604762000.json` |

Receipts are under `evidence/markov-274e6973/`; all listed builds and kernel replays exit successfully. Nine printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`. Eight earlier rejected compilations each have exit code 1 and are not accepted evidence. The protected root source remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected recorded named-module compilations and kernel replays against inherited compiled imports; it did not independently rebuild the full dependency graph. The manifest explicitly records that limitation and a null completion claim.

## Remaining scope

The 383-fraction formula comparison is finite supporting evidence, not part of the proof of the universal statement. The verified new result fills the i=1 vertical line for every source polynomial; it does not settle i≥2 vertical interiors, all horizontal rows, the remaining diagonals, or Conjecture 6.3. Historical novelty has not been independently assessed. This note is a monitoring audit, not a root completion certificate.
