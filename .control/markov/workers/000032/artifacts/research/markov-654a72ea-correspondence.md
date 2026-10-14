# Source correspondence and limits

Machine-authored request 654a72ea. No root closure is claimed.

* Coverage: the new band theorem uses every finite source path satisfying
  b=a+1, and every natural i,j with i+j=a+1. The inherited exact path
  classification reduces this entire family to replicate(n,true). There is
  no bound on n, i or j. Other rational families remain outside this result.
* Source family: all new raw coefficient inequalities refer literally to
  `(frame path).mid.p` from the protected root. No artificial word or arbitrary
  polynomial is substituted for it. `pellFamily654a 0=1` is an auxiliary
  initial value; its positive indices are exactly the right-spine sources.
* Homogeneity and coefficients: `coeff` is unchanged and extracts ordinary
  integer coefficients in u,v. Rational casts in the proof clear small
  binomial denominators and are transported back to integer inequalities.
  They do not normalize coefficients. Recovery of w is the inherited
  homogeneous correspondence, not a new assertion proved by this worker.
* Polygon: the band result proves all natural starting indices with the
  stated total, so it includes every polygon-guarded triple in that band.
  For the small-degree cases, the endpoint is proved outside the pinned
  polygon and its raw coefficient is zero. No polygon membership is assumed
  for an artificial polynomial. The root polygon definition is unchanged.
* Directions, zeros and endpoints: the two new inequalities use (1,0) and
  (0,1) literally. The inherited all-Pell (1,-1) theorem is unchanged. Zero
  coefficients and positions outside support are retained. Root endpoint
  obligations are unchanged; no full endpoint-and-directions assembly is
  claimed for all rationals.
* Assumptions: successful final build/replay receipts use pinned Lean 4.32.2
  and existing read-only dependencies. Printed final theorem closures contain
  only propext, Classical.choice, Quot.sound. Rejected elaborations are retained
  as failures, never admitted results. Validation uses inherited compiled
  imports and is not a fresh rebuild of the entire dependency closure.
* Proof scope: the exact whole-family generating equation is proved in Lean.
  The positive lower-excess regrading in the separate derivation is not yet
  formalized; its 98,760 successful exact checks are experiments only.
  Neither the arbitrary-strip inequalities nor HorizontalFiberGoal9a72 is
  proved. No full pinned root or exact negation has been obtained. A separate
  independent hash-bound source/English audit would still be required for
  any future closure claim.
