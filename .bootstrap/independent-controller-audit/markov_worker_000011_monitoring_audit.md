# Independent monitoring audit: worker 000011

Read-only review, 14 October 2026, request `b46c0efc5502437a8359d3724c9d631c`. Snapshot: `/Users/sasha/math_gkm/.control/markov/workers/000011/artifacts`. Reviewed all five final `Markov*B46.lean` modules, correspondence/checkpoint and mathematical note, final report, and `evidence/markov-b46c0efc/validation-1791941306264983000.json`. No project edits, proposer contact, mathematical advice or interference with active worker 000012.

## Findings

The all-path horizontal j=1 and vertical i=0 inequalities are correctly connected to the literal raw integer coefficients, including zeros and small cases. The source 2/5 nonreal-zero example is genuine and does not violate coefficient log-concavity. The reported auxiliary formula discrepancy in published Theorem 4.2 is real, with no indexing or binomial-boundary ambiguity. It does not refute Conjecture 6.3. The full root remains unresolved.

## Exact new inequality scope

`swap_coeff46` explicitly proves that transposing the two nested polynomial variables transposes the raw coefficient indices. Thus coefficient 1 of the swapped polynomial is the horizontal j=1 row in the source notation, not a vertical column or a specialization summing distinct coefficients.

`source_hword46` connects every source path to its actual A–core–B matrix word, with core length b−2 and B count a−1. `hword_scaled46` proves an exact first-coefficient identity over every commutative ring. The uncancelled identity is used at that generality; cancellation of X+1 is performed only in the integral polynomial ring. For b≥3 the resulting source row formula is

    [v]P_(a/b)(u,v,1) = u^a (1+u)^(b−3) [(3a−1)+(a+b−1)u].

The empty-core case, corresponding to 1/2, is handled separately as 2u. It is not omitted because the displayed formula has b−3 in its exponent. `horizontal_one_raw46` quantifies over every finite source path and every natural i and proves

    A(i,1) A(i+2,1) ≤ A(i+1,1)^2.

The theorem has no polygon guard, denominator bound, nonzero-coefficient assumption or residual conjecture. It follows from a proved zero-extended CrossLC property and retains zeros. This is the non-strict inequality required by the root; it does not purport to formalize the additional strictness of the published line result.

`vertical_boundary_formula46` similarly proves the literal identity [u^0]P=v^b(v+1)^(a−1). `vertical_boundary_raw46` proves A(0,j)A(0,j+2)≤A(0,j+1)^2 for every source path and natural j. This is the vertical boundary i=0, not an interior vertical line. Both statements extend beyond polygon guards on those particular lines, but neither quantifies over all rows or columns. The separately vacuous rational endpoints remain covered by the inherited root equivalence.

The horizontal line and vertical boundary are known portions of the source conjecture; the contribution here is the complete checked derivation from the actual source recurrence/matrices. No historical novelty claim is warranted.

## Actual source nonreal root

`two_fifths_horizontal46` proves that the j=2 row of the actual path LR, index 2/5, equals u²(14+28u+15u²). `horizontal_quadratic_obstruction46` proves discriminant −56, strict positivity of the quadratic on the reals, and 14·15≤28². `source_horizontal_nonreal_zero46` constructs z=(-14+i√14)/15, proves its imaginary part nonzero, and proves its evaluation in the actual integer source row, mapped into the complex numbers, is zero.

This is an exact Lean witness against universal real-rootedness of source horizontal-row polynomials. It is not merely a numerical root estimate or an arbitrary-word example. It does not obstruct the root's weaker log-concavity assertion: the nonzero row coefficients 14,28,15 satisfy it, and the leading/trailing coefficient zeros are harmless. No source-family counterexample to the protected inequality is supplied.

## Confirmed published formula discrepancy

I checked the publisher HTML and linked PDF, as well as the arXiv PDF. Theorem 4.2 prints

    A_(i,1)=(3a−1) choose(b−2,i−a)+(b−2) choose(b−3,i−a−1).

Equation (9) defines these as the raw u,v exponents. For a=2,b=3,i=3 the formula gives 6; the paper's explicit P_(2/3) and top-edge formula give 4. The point (3,1) is in the polygon, and every binomial argument is nonnegative. Thus neither boundary conventions nor index transposition explain the difference. Theorem 4.1 instead has prefactor b−2a, consistent with 4. This is a genuine inconsistency in the displayed auxiliary formula. [Publisher PDF, printed p.8](https://armj.math.stonybrook.edu/Articles/250708-Winn/article.pdf), [publisher HTML](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html), [arXiv PDF, printed p.8](https://arxiv.org/pdf/2501.14882).

`printed_row_formula_mismatch46` proves the recurrence value 4 and the printed numerical expression's value 6 in Lean. It does not change the root or assert its negation. The accepted new line proof uses its independently proved source formula, not the inconsistent display as an assumption.

## Matching verification records

The worker completed after approximately 1054.85 seconds. Each archived source hash matches the manifest and the controller's artifact hash. Each listed successful compilation/replay receipt matches its archived hash and identifies the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovRowJetB46 | `be11c43980f3216be1cb3c21c87c6491c0c88ef23d72711589d2ed105748569d` | `run-1791940572789208000.json` | `run-1791940605555420000.json` |
| MarkovHorizontalB46 | `1eb8adb1d6f44e2c03eb670de80ca06fcc8e875f783a776049cb05e2a5e92c84` | `run-1791940691435912000.json` | `run-1791940730897895000.json` |
| MarkovHorizontalLCB46 | `7298e29ecbf33942845269013976590daa30bfca2334861f673a5d5c201f17c6` | `run-1791941023369355000.json` | `run-1791941105031535000.json` |
| MarkovVerticalBoundaryB46 | `4348039afc1edd0597786a24896016e40c3f98c1f5bc98fafc742cb1686ed79f` | `run-1791941102674260000.json` | `run-1791941207224879000.json` |
| MarkovHorizontalExampleB46 | `6a165e4ec32f3f885936678e4d27808bfd836e712ee7e96ad7a2c7dd5e00eecf` | `run-1791941227162675000.json` | `run-1791941274651469000.json` |

All receipts are under `evidence/markov-b46c0efc/` and exit successfully. The 12 printed theorem closures use only `propext`, `Classical.choice`, `Quot.sound`. Nine earlier rejected compilations each have exit code 1 and are not proof evidence. The root source remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

This audit inspected recorded Lean builds and kernel replays against inherited compiled project imports. It did not independently rebuild the entire dependency graph. The manifest records binary hashes and correctly claims no independent full completion audit.

## Remaining interpretation limits

The arbitrary-word directional scan, rational Sturm searches and guarded rotation scan remain finite experiments. In particular a cyclic-word failure having an endpoint outside the canonical polygon is not a guarded source inequality failure. The worker's mathematical note explicitly preserves that distinction. General interior horizontal, vertical and diagonal inequalities remain obligations; the two new line results and nonreal-root obstruction do not resolve the full conjecture. This note is a monitoring audit, not a root completion certificate.
