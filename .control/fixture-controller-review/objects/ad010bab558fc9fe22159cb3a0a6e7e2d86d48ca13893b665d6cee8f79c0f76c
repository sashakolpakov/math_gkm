# Local English/Lean review

This is the actual proposer's review, not an independent supervisor report.
The source SHA-256 values and elaborated theorem statements are in `build.json`
and `MarkovAudit.log`; 48 theorem declarations pass compilation and axiom audit,
and six modules pass separate kernel replay.

| English statement | Formal scope and review |
|---|---|
| Full published target | `Conjecture63` is an unproved proposition. `WeakLC` tests raw integer coefficients at all three consecutive points inside the specified polygon. It never discards a zero coefficient. |
| All fractions | Paths generate reduced interior labels (`frame_reduced`). Completeness of path indexing is a remaining Lean theorem; standard Stern--Brocot coverage is used only in the mathematical source audit. |
| Universal boundary | `boundary_raw_logConcave` quantifies over arbitrary `List Bool` and arbitrary natural index. It follows from the actual recurrence via `edgeEval_coeff`, not a hypothesized binomial identity. No positivity or numerical cutoff is silently assumed. |
| Pascal preservation | The hypothesis is `CrossLC`, stronger than adjacent local LC. The proof does not assert that all locally log-concave sequences with zeros satisfy this stronger hypothesis. The quadratic seeds are proved to satisfy it under explicit nonnegativity and AC<=B². |
| Polynomial coefficients | `CoeffSeq` sets negative integer indices to zero; `coeffSeq_smooth` and `coeffSeq_binomial_mul` establish exact coefficient identities. The coefficient sequence includes endpoints and exterior zeros. |
| Third diagonal | The unconditional theorem concerns the explicit polynomial for all naturals 3<=a<b. `sourceThird_factor` checks equality of the two written polynomial expressions. The transfer to raw Markov coefficients still takes `ThirdDiagonalFormula` as an explicit hypothesis. It is not asserted universally. |
| Normalization failure | A checked recurrence polynomial at path `[false]` supplies coefficients 1,2,3. Division by the corresponding multinomial factors 3,6,3 fails LC. This refutes a stronger normalization, not the published raw-coefficient conjecture. |
| Other obstructions | Subtraction of two nonnegative CrossLC seeds can fail LC. The (3,4) quadratic has no real root but satisfies the coefficient inequality. These rule out specific proof shortcuts, not Conjecture 6.3. |
| Boundary cases | 0/1 is the constant numerator with a singleton polygon; 1/1 has a line of length two. Both are vacuous LC cases. The 1/2 initial numerator is checked in all three directions. |

No custom axioms, admissions, native evaluation proofs, or global soundness
assumption are used. Axiom closure is a subset of propext, Classical.choice,
and Quot.sound. The finite Python observations and engine external-result
records are not Lean proofs or independent authentication.
