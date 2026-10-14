# Correspondence and remaining scope, worker 5a7c193a

Machine-authored research audit; not an independent completion audit.
The pinned root MathGKM.Markov.Conjecture63 is unchanged. Completion is null.
The validation manifest in evidence/markov-5a7c193a records exact successful
source hashes, compilation, kernel replay, axiom closures and rejected attempts.

The principal new declaration is
MathGKM.Markov.first_four_polygon_logConcave5a7 in research/MarkovFourth5a7.lean.
For every source path, natural r<=3, and indices i,j with
i+j+2+r=a+b-1, it proves

    coeff P i (j+2) * coeff P (i+2) j <= coeff P (i+1) (j+1)^2,

under polygon membership of the first endpoint. Requiring only one polygon
premise is stronger than the root's three polygon premises on these slices.
The omitted homogeneous exponent is r. Thus these are precisely the first
four upper diagonals in direction (1,-1). There is no denominator bound.

MarkovLowSlices5a7 extends the third-diagonal result to a=1 and a=2 and supplies
the exact linear residual on the second diagonal. The top diagonal reuses
the inherited checked theorem. MarkovCubicJet5a7 proves the cubic formula for
every nonempty matrix-word core over every commutative ring. MarkovCubicBounds5a7
proves real polynomial certificates with the actual integer exceptions retained.
MarkovFourth5a7 uses the existing exact source-word theorem and integral quotient
positivity, proves a universal word switch-count bound, cancels scaling by six,
and transports CrossLC by the exact binomial factorization to raw coefficients.

For d>=6, the fourth-diagonal statement is proved without polygon restrictions.
For a valid fourth-diagonal triple, d<6 would force d=5,i=j=0; membership of
(0,2) contradicts a>0,a<b and d=a+b-1. This is proved, so the combined polygon
theorem has no separate small-degree exception. Zeros are never removed.

Correspondence obligations:

* Coverage: inherited rational coverage and uniqueness remain available. Every
  new source theorem quantifies over all finite paths, with no finite cutoff.
* Source family: the paired Farey matrix construction and source_word774 identify
  the exact quotient for each actual path. Cubic identities about arbitrary words
  are applied only through that bridge. Enlarged-family experimental failures
  are not declared source-family counterexamples.
* Homogeneity and coefficients: the homogeneous reconstruction, exact raw
  diagonal adapter and quotient factorization are inherited checked bridges.
  Integer-to-real inclusion is coefficientwise. Multiplication by six clears
  denominators and is canceled in the inequality; no raw coefficient is
  factorial- or binomial-normalized.
* Polygon: the new result uses the pinned InPolygon predicate and proves the
  small-degree exclusion from its literal inequalities. It does not prove full
  Newton-polygon equality or support saturation.
* Directions, zeros and endpoints: the new claim concerns only direction (1,-1)
  and r<=3. All negative-index, terminal and internal zeros are retained through
  CoeffSeq and CrossLC. Endpoints 0/1 and 1/1 keep their inherited vacuous proofs.
  Interior horizontal and vertical inequalities are not solved.
* Assumptions: no custom axioms or external mathematical facts. Successful
  theorem closures use only propext, Classical.choice and Quot.sound. Builds
  use pinned read-only Lean/Mathlib and recorded inherited compiled imports.
  This is not a fresh rebuild of every imported project source or an independent
  hash-bound English/source completion audit.
* Proof scope: neither the exact root nor its negation is proved. General higher
  residual inequalities, lower-half transport, horizontal/vertical interiors,
  and full polygon correspondence remain open. Experiments are not proofs.

Rejected compilation attempts and partial diagnostics are preserved in immutable
run receipts and source snapshots. Python SymPy was unavailable; exploratory
interpolation used exact standard-library rational elimination. The requested
.scratch location was not used because higher-priority instructions deny it.
No controller, protected root, prior independent evidence, dependency or
permission was changed; no package update, external contact or commit occurred.
