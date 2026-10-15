# Source correspondence and limits

Machine-authored request 7d905904dcbe45a89408ca2cea9065c6. This is a scope
record, not the independent hash-bound completion audit. Completion is null.

* Coverage: the new unconditional positive Lean statement covers all
  numerator-one paths, all cut counts, adjacent degree pairs and coefficient
  indices. It is an auxiliary refinement on a subfamily already known to
  satisfy the raw conjecture. General rational coverage is not added by scans.
* Source family: central_left7d and source_one_spine274 identify A^n B with
  the exact pinned numerator-one source family. oneA_word68 and oneA_labels68
  identify the infinite obstruction family R^n L as (2n+1)/(2n+3).
  The 2/7 witness uses the actual path [false,false,true].
* Homogeneity and coefficients: the root definition and integer raw coefficient
  function are unchanged. The auxiliary d is individual mask degree and
  e=d-s is signed aligned grade, not the omitted homogeneous exponent.
  markedCoeff_layer7d identifies the new grading polynomial's coefficients
  with actual layer coefficients. source_markedCoeff_at_one7d recovers raw
  coefficients without normalization. At fixed s, replacing d by e only
  shifts all gap degrees by -2s, so suffix sums are unchanged; no negative
  grades are discarded. Geometric grading weights other than one change the
  coefficient array and are not source-family raw coefficients.
* Polygon: source_slanted_raw7d checks all three guards of the accompanying
  full raw boundary triple. The 2/7 triple's polygon guards and raw values
  are inherited in full27_raw07a7. Experimental source triples use the pinned
  inequalities. The diagonal tail-transfer lemma is stronger than polygon
  restriction at its specified indices, but has an explicit tail hypothesis.
* Directions, zeros, endpoints: the positive layer and tail-transfer results
  concern direction (1,-1). The slanted auxiliary obstruction compares
  varying cut counts and degrees, not a raw coefficient line. Both raw
  horizontal/vertical clauses remain untouched. All zero masks, layers,
  coefficient tails, and signed grades are retained. The 0/1 and 1/1 endpoint
  clauses remain in the root and are not reinterpreted.
* Assumptions: compiled mathematical modules print permitted axiom closures
  only. Failed elaborations and timeout receipts are rejected operational
  artifacts. No custom axiom, admission, native_decide, package update or
  external mathematical assertion is introduced. Validation.json distinguishes
  compilation, official checker timeouts and successful explicit-module replay.
* Proof scope: general-source suffix positivity, general interval aggregation,
  horizontal and vertical interior inequalities remain unproved. The full
  Fibonacci interval counting/convolution argument is a paper derivation,
  not a completed Lean theorem. No fresh whole-source rebuild or independent
  completion audit occurred. Neither the pinned root nor its negation is proved.

Protected root SHA256:
8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
Pinned contract hash:
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.
Primary published source:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.

Hosted search executed the query "Markov polynomials log concavity Evans
Veselov Winn Conjecture 6.3 2026 proof". The primary published result returned
the stated conjecture and its Fibonacci subfamily theorem. No external result
was imported into Lean and no exhaustive literature claim is made.
