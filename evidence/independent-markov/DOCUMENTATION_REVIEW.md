# Final Markov documentation review

Reviewed the copied `docs/round2/MARKOV.md`, `evidence/markov/english-lean-review.md`,
README, and the mathematical status fields of RESUME.json against the final
48-theorem snapshot. Exact document hashes are in documentation-hashes.json.
All mathematical sources and all four documents matched their reviewed
snapshots at the final comparison.

No substantive mathematical English/Lean mismatch was found.

- The raw coefficient convention, zero-retaining triple predicate, all three
  directions, endpoint conventions, and path-indexed target are correct.
- Reducedness of generated labels is distinguished from unproved general
  rational-index coverage. The missing full Laurent-family equivalence is
  also explicit. None is silently inferred from finite scans.
- The boundary theorem is accurately stated as an unconditional result for
  the actual generated recurrence with a literal raw coefficient bridge.
- CrossLC is correctly described as a stronger hypothesis than unrestricted
  adjacent log-concavity. The smoothing and polynomial coefficient bridge
  descriptions match the proofs and retain zeros.
- The third-diagonal expression result keeps 3<=a<b, the ordinary-polynomial
  exponent range, and the separate ThirdDiagonalFormula hypothesis. The
  documentation expressly avoids claiming the entire generated-diagonal
  identification or full Conjecture 6.3.
- The algebraic gap certificate has exactly the coefficients in the proved
  identity. Negative discriminant and coefficient log-concavity are correctly
  distinguished. The subtraction and factorial-normalization examples are
  not described as counterexamples to the raw Markov conjecture.
- The denominator-16 and denominator-28 scan counts match independent
  reproduction. The initial 57 eligible third-diagonal polynomial formulas
  were additionally checked coefficient by coefficient against the saved
  data. The 1,293 initial diagonals and 2,018 initial critical-point counts
  were independently recomputed. Residual and factor-four claims remain
  finite observations, not universal theorems.
- The final open-work description correctly lists the recurrence-to-third-
  diagonal bridge, other interior directions, residual statements, and
  formal index coverage. The README accurately summarizes checked universal
  partial results with the full conjecture still open.

This review concerns mathematical statements, experimental arithmetic, and
their documented scope. The engine chronology, software-origin metadata, and
controller behavior paragraphs are outside this mathematical review.

No mathematical statement correction is required for this checkpoint. One
status update becomes appropriate when this independent review is archived:
RESUME.json still says independent Markov review has not yet been performed
and lists it as pending. That accurately describes its pre-review status but
should be updated by the supervisor upon accepting this report.

The final prose clarification that diagonal counts include zero-only lines is
correct. Such lists have no nontrivial adjacent comparison; their inclusion
does not increase coverage of valid raw polygon triples. The clarification
that compile logs preserve observations, rather than complete failed-source
snapshots, avoids overstating evidence.

The separate residual-scope audit was also read. Its distinction between
adjacent nonnegative log-concavity and CrossLC is sound: the current finite
residual experiment tests the former, while the proved smoothing transport
uses the latter. The final documentation does not claim the missing universal
implication. Any future residual-to-original-diagonal deduction must provide
that bridge, as well as exact divisibility; this is additional mathematical
work, not a defect in the presently accepted theorems. No conclusion about
all directions follows from a diagonal-only residual assertion.

