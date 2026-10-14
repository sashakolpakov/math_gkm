# Source correspondence and explicit scope limits

Machine-authored 00b360ee; no root closure or independent audit claimed.

- Coverage: `source_excess_coeff00b3` quantifies over every actual source path
  with b=a+1 and every natural i,j,s satisfying i+j=a+s. The equivalence
  quantifies over all right-spine lengths. This is an unbounded subfamily;
  it does not establish any inequality for arbitrary reduced rationals.
- Source family: the left side is literally the protected `frame` numerator.
  The inherited classification theorem supplies the right-spine identity.
  The power series is now connected by a Lean theorem, not a guessed formula.
- Homogeneity and coefficients: the unchanged `coeff` extracts integer
  coefficients of u^i v^j. Nested series coefficients are also raw integers.
  Denominator multiplication is a series identity and does not renormalize
  coefficients. Recovery of the omitted homogeneous variable and the full
  source Laurent interpretation rely on inherited bridges; no new independent
  English/source audit of those bridges was performed here.
- Polygon: all natural positions of each strip are retained. Above-degree
  and below-minimum-degree zeros are proved using the pinned polygon. The
  zero-excess strip's nonvertex points are proved outside that polygon.
- Directions, zeros and endpoints: the equivalence explicitly preserves
  horizontal and vertical raw triples; the inherited Pell diagonal theorem
  supplies the third direction. All zero terms remain. The root's 0/1 and
  1/1 endpoint obligations are unchanged and are not absorbed into the Pell
  series definition. No full-source endpoint-and-direction assembly is claimed.
- Assumptions: new successful modules use only ordinary pinned Lean/Mathlib.
  Final printed closures contain only propext, Classical.choice and Quot.sound.
  Rejected elaborations and their automatically generated error placeholders
  are recorded as failures and are not accepted evidence. Source files contain
  no sorry, admit, custom axioms or native_decide.
- Proof scope: three new modules were compiled and kernel-replayed locally.
  Imports reuse inherited compiled artifacts, so this is not a fresh rebuild
  of the entire source closure and not an independent audit. Neither the two
  remaining Pell inequalities nor the full pinned root nor its negation has
  been proved. Universal coverage beyond Pell and a separate hash-bound
  English/source audit remain mandatory for any future root closure.
