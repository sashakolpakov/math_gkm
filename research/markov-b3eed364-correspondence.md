# Correspondence and exact scope

Machine-authored b3eed364. This is a worker scope record, not the required
independent hash-bound English/source completion audit. Completion is null.

The unchanged root is MathGKM.Markov.Conjecture63 in MathGKM/Markov.lean,
SHA256 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
The pinned contract canonical serialization hash remains
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.
The publication remains [Evans–Veselov–Winn, Conjecture 6.3](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

* Coverage: source_three_rawM9E2 and source_three_cubicM9E2 quantify over
  every generated numerator-three path, with q unbounded and both residues.
  The full-root equivalence retains all other paths. This work does not
  replace universal rational coverage by a denominator scan. Inherited
  coverage bridges are used at their stated scope, not re-audited as a
  fresh whole-source completion package.
* Source family: threePolyM9E2 is tied to the original Farey recurrence by
  the inherited path theorem. source_top_templateMB3E and its path wrapper
  prove exact equality, without postulating a new source family. The
  broader denominator-only TopTemplateLCMB3E is explicitly auxiliary.
* Homogeneity and coefficients: rawRowMC3E.coeff is the literal integer
  coefficient of U^i V^j. Depth t=b+2-j uses the numerator-three degree.
  Rational casts in the gap certificate are injective arithmetic transport;
  they do not divide source coefficients by factorials or binomials. The
  final inequality is in the original integer coefficients. Homogeneous
  source identification is inherited, not silently replaced by a new
  normalized conjecture.
* Polygon: all new raw inequalities hold on the indicated columns without
  needing a polygon guard. The strict first triple is additionally proved
  polygon-valid. Outside-support zeros are derived from existing source
  support and from the new exact interval-support theorem.
* Directions, zeros, endpoints: the new result is horizontal only. The
  vertical and constant-i+j clauses are preserved verbatim in the exact
  residual. The endpoint clauses are retained through the inherited root
  equivalence. No zero is removed from the formal predicate. Removing the
  exterior X factor for an experimental Sturm count changes only that
  auxiliary root-count calculation, not any coefficient statement.
* Assumptions: ordinary pinned Lean/Mathlib only. No external source,
  experiment or symbolic fit is an axiom. The axiom audit and joint replay
  receipts list the checked closures; the allowed set is propext,
  Classical.choice and Quot.sound.
* Proof scope: root_iff_remainingMB3E retains the unproved
  ThreeRemainingMB3E and OtherFourM9E2. TopTemplateLCMB3E is also unproved.
  There is no proof or refutation of the exact full root. A future closure
  still needs fresh whole-source rebuild/replay and a separate hash-bound
  independent audit addressing every contract obligation.
