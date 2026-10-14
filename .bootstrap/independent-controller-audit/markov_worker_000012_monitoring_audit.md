# Independent monitoring audit: worker 000012

Read-only review, 14 October 2026, request `8934af1772f94a59862d7005ebd43159`. Reviewed the completed archive `/Users/sasha/math_gkm/.control/markov/workers/000012/artifacts`, all six final `Markov*8934.lean` modules, correspondence/checkpoint and mathematical note, and `evidence/markov-8934af17/validation-1791942456064990000.json`. No project edits, proposer contact, mathematical advice or interference with active worker 000013.

## Conclusion and exact target meaning

The reported new theorem is correct in scope: `horizontal_two_raw8934` proves

    A(i,2) A(i+2,2) ≤ A(i+1,2)^2

for every finite source path and every natural i, where A is the literal pinned integer coefficient function. There is no denominator bound, polygon guard, positive-coefficient restriction or unresolved auxiliary hypothesis in the final statement. Zeros are retained. This proves the fixed horizontal row j=2, not every horizontal row, another direction, or the full Conjecture 6.3. No substantive English/Lean mismatch was found.

The inherited `source_hword46` and `swap_coeff46` explicitly connect the actual recurrence numerator to the source A–core–B word and identify the second coefficient of the swapped polynomial with the original horizontal j=2 row. Thus the direction and raw normalization are correct. All-path quantification combines with the inherited rational coverage result; the rational endpoints remain separately vacuous in the protected root.

## Exact formula and discharged conditions

For nonempty core e::w, n is its length, m is its B count, and s is the indicator that its first letter is B plus the corresponding last-letter indicator plus twice the number of adjacent BB pairs inside the core. These are the actual statistics defined by `stat8934`, not an assumed balance or count-only replacement. The second-jet recurrence and denominator-cleared word identity are proved over every commutative ring. An induction proves s≤2m.

For n≥3, `word_second8934` proves in the integer polynomial ring

    2 [v²]P = u^m (1+u)^(n−3) Q(u),
    Q(u) = 4s + (9m²+13m+6)u
         + (6m²+6mn+8m+6n+6)u²
         + (m+n+2)(m+n+1)u³.

The cancellation of (1+u)^3 occurs in the polynomial domain, not by dividing arbitrary values or assuming an unjustified unit. For source words the label identities are n+2=b and m+1=a, and m≤n follows from the literal word count.

The cubic inequality theorem has the explicit extra premise n≤2m or s=0. `second_source_formula8934` genuinely proves this premise. If n>2m, the exponent (m,2) lies below the oblique polygon boundary: the required inequality (m+1)(n+2)≤(n+2)m+2(m+1) would imply n≤2m. The established source support theorem therefore gives A(m,2)=0. Extracting coefficient m from the exact displayed identity then gives 4s=0 and hence s=0. This step uses neither conjectural saturation nor conjectural coefficient log-concavity, and the argument is not applied indiscriminately to arbitrary words.

`second_inequalities8934` proves nonnegativity of all four cubic coefficients, positivity of its middle two coefficients, and all three product inequalities required by the zero-extended cubic CrossLC predicate. The source proof supplies every premise. The inherited binomial multiplication and monomial-shift theorems transfer CrossLC to twice the actual source row; the constant factor 2 is then canceled in the inequalities over the reals. It is a uniform scalar, not factorial or index-dependent normalization. The final coefficient inequality is transported back to integers.

## Small denominators and zeros

The final proof splits b≥5 from b<5. In the latter case the actual source core has length at most two. `second_small_formula8934` exhaustively treats the seven possible Boolean cores of lengths zero, one and two, expressing each row as a shifted nonnegative quadratic with its coefficient product inequality verified. `second_small_crossLC8934` includes their zero-extended sequences. In particular the empty core/source 1/2 is present; there is no exceptional source excluded by n≥3 in the large-case formula.

`horizontal_two_crossLC8934` combines these cases without an extra hypothesis. `horizontal_two_raw8934` applies its adjacent inequality and the exact swap adapter at every natural index. It neither filters zeros nor restricts to the polynomial's positive support. These are actual exhaustive branches, not a finite-denominator approximation to the universal theorem.

## Matching verification records

The worker completed after approximately 1118.31 seconds. All six archived source hashes match the validation manifest and controller-recorded artifact hashes. Every listed successful compilation/kernel receipt matches its archived hash and identifies the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovSecondJet8934 | `74d19c921368c6106d9bab021f1aa91b7f3aaa6902b910a786b6da65fce799bc` | `run-1791941790901558000.json` | `run-1791942158460312000.json` |
| MarkovSecondWord8934 | `52911824d3c544bc1fd5c2c8e3cd9ff8d4664f82cedeb149da55140dde2ba7d7` | `run-1791942008953452000.json` | `run-1791942158460246000.json` |
| MarkovSecondBounds8934 | `f12aaf6442b6b44571d2c2f84ed744c4c31c7df896ae4f24dcd279cb944e6619` | `run-1791942008954016000.json` | `run-1791942158460242000.json` |
| MarkovSecondSmall8934 | `6ae1b4df7ea687773ed2c096119461f41e37deaf8e435f58ce53e4f052505256` | `run-1791942106887970000.json` | `run-1791942198919412000.json` |
| MarkovSecondSource8934 | `bd54089f68866570ff4981c6db019eb227c58d8def319f31a0ab036c4bc12c3e` | `run-1791942311606007000.json` | `run-1791942365222550000.json` |
| MarkovSecondHorizontal8934 | `ded0fd45d6b56a3b1f2a147cc16f57b2aee33a16869c9d01b1ac4a18feff5579` | `run-1791942365222642000.json` | `run-1791942391330128000.json` |

Receipts are under `evidence/markov-8934af17/`; all listed builds/replays exit successfully. Nine printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`, or a subset. Eight earlier unsuccessful compilations each have exit code 1 and remain rejected. The root source still hashes to `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected recorded verification against inherited compiled project imports; it did not independently rebuild the full dependency graph. The manifest records imported binary hashes and correctly does not assert an independent full-root completion audit.

## Remaining scope

Finite arbitrary-word, support-constrained and formula scans are supporting experiments only. A residual failure for a non-source word is not a raw source counterexample; the new source proof expressly uses the support condition unavailable for arbitrary words. General higher horizontal rows, vertical interiors and the remaining diagonal inequalities are still open. Historical novelty has not been independently assessed. This monitoring note is not a full-root proof/refutation certificate.
