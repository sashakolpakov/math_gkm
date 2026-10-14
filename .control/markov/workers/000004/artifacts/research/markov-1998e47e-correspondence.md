# Top face and remaining scope

Machine-authored by live worker 1998e47e852946dda2d4b1a02d4df1f3.
This is a local scope report; it is not an independent English/source audit.
Consult the validation receipts for actual accepted versus rejected builds.

The published source was retrieved live during this worker:
[Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Theorem 4.1 gives the top face as (u+v)^(a+b-1); Theorem 4.2 identifies its
coefficients as binomial coefficients. Section 6 states the boundary
log-concavity consequence. These results are already in the paper; no novelty
claim is made. The current work supplies formal bridges for that boundary.

`topEval1998` sets only w to zero in the three-variable numerator. It retains
u and v as independent polynomial variables. Positivity of the retained
denominator label makes the recurrence's w exponent strictly positive in
both branches, so that term vanishes. The other term multiplies top faces.
`top_formula1998` uses fold induction on arbitrary finite paths, with all
three seeds. `topEval_coeff1998` extracts the actual w^0 coefficient;
`top_raw_coeff1998` then uses the inherited homogeneous reconstruction to
identify the exact integer coefficient, without rescaling.

`top_raw_logConcave1998` has exactly the target's constant-i+j orientation:
(i,j+2), (i+1,j+1), (i+2,j). Its only extra restriction is that their common
degree is a+b-1. It follows from the checked binomial CrossLC invariant.
No adjacent-to-cross implication in the presence of zeros is assumed.
`top_in_polygon1998` checks the actual pinned polygon predicate for every
top-face point. `total_degree_exact1998` combines the previous upper bound
with a coefficient-one vertex to establish degree attainment.

## Correspondence obligations

* Coverage: inherited all-rational coverage and path uniqueness are unchanged;
  new statements quantify over every path, without any finite bound.
* Source family: inherited literal homogeneous recurrence/seed identification
  is used. The interrupted worker's completed kernel receipt was reconciled.
* Homogeneity and coefficients: raw integer coefficients and exact omitted
  exponent are retained. Neither factorial normalization nor evaluation of u
  or v at numerical values enters the coefficient theorem.
* Polygon: the top boundary and upper degree attainment are connected. Lower
  support containment, the remaining vertices, and full convex-hull equality
  remain open formal obligations. No polygon equality is claimed.
* Directions, zeros, endpoints: the root's three directions, weak inequality,
  zero retention and both endpoints are unchanged. This result establishes
  only top-face third-direction inequalities. Endpoint formulas occur in the
  seed invariant; the existing endpoint WeakLC proofs remain separate.
* Assumptions: successful printed axiom closures must contain only propext,
  Classical.choice and Quot.sound. Failed builds establish nothing. This run
  reuses explicitly hash-recorded inherited compiled imports after a timed-out
  fresh root rebuild; it is not a complete independent fresh rebuild.
* Proof scope: full Conjecture63 and its negation are unresolved. Universal
  interior raw inequalities in all three directions, full polygon bridge,
  and an independent hash-bound completion audit remain necessary.

## Suggested next research

The top-face proof also shows a path for extracting higher w coefficients.
A possible invariant for residual divisibility is weighted support after
substituting v=s-u: assign weight 1 to s, 2 to w, and 0 to u. Together with
ordinary homogeneity, a lower weight bound d would force the coefficient of
w^r to contain s^max(d-2r,0). This is a proposed route only: the weighted
support invariant and its algebraic transport have not been formalized or
experimentally tested here. An informal inductive derivation is recorded in
markov-1998e47e-weighted-divisibility.md. Even successful divisibility alone would prove
neither nonnegativity nor CrossLC of the quotient and would not cover the
other two directions.
