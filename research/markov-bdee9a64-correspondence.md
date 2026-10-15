# Source and scope correspondence — bdee9a64

Machine-authored scope audit, not the required independent hash-bound audit.
Completion is null; the pinned root and protected inputs are unchanged.

* **Coverage:** the new exact source expression covers every n and every rest
  path in `replicate n true ++ false::rest`, including all predecessor cycle
  lengths. Pure-right paths and endpoints are not silently included in this
  statement. No new full reduced-rational coverage audit is claimed.
* **Source family:** the recurrence, run matrices, cyclic gauge, source counts,
  all-cycle corrections, and raw extraction are connected by explicit Lean
  dependencies. No arbitrary adjacent-run word is treated as a source witness.
  The abstract inequality is kept separate from its unproved coefficient bridge.
* **Homogeneity and coefficients:** the source quantity remains `(P.coeff i).coeff j`
  of the squared-variable numerator at w=1. Six multiplies the entire third
  slice, and fifteen is a uniform scalar in the candidate extraction. There
  is no index-dependent normalization. Fraction-field embedding is proved
  injective and uses an indeterminate X, not a numerical specialization.
  The full homogeneous Laurent correspondence is not newly audited here.
* **Polygon:** the exact expression and coefficient bridge retain every index,
  including indices outside support. They do not replace the pinned polygon.
  The conditional source inequality is stronger than a polygon-guarded one
  on its restricted slice, but its formula premise remains unproved.
* **Directions, zeros, endpoints:** the new source identity concerns the third
  lower diagonal i+j=a+3, in direction (1,-1). This is distinct from the
  published third upper diagonal. Small-cycle correction terms are retained;
  zeros are never discarded. Horizontal, vertical, other diagonals, and both
  endpoint requirements in the pinned root remain unchanged.
* **Assumptions:** ordinary pinned Lean/Mathlib, no custom axioms, admissions,
  native_decide, updates, or externally asserted mathematical facts. Accepted
  axiom closures are checked against propext, Classical.choice, Quot.sound.
  Error-recovery output from rejected builds is excluded from accepted results.
* **Proof scope:** universal closed run-jet and source-expression identities,
  an auxiliary candidate inequality, and a conditional transfer are established
  as recorded by final validation. The composite coefficient-identification
  bridge remains open. Neither these results nor the exact finite experiments
  solve the full root. The independent hash-bound English/source audit and a
  fresh full rebuild have not been performed.

Conventions checked against the live
[published Evans–Veselov–Winn source](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (5), (7), (8), and Definitions 6.1–6.2 / Conjecture 6.3.
