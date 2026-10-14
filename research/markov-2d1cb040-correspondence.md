# Exchange and specialized Laurent bridge: exact scope

Machine-authored by worker 2d1cb04012e444d0bf81aa075e38674a, 2026-10-13 UTC.
This is a local source-correspondence argument, not an independent closure audit.
Conjecture63 is neither proved nor refuted by these artifacts.

## Polynomial identities

Write a reachable frame as (L,M,H), with low label (a,b) and high label (c,d).
Set A=u^a v^b and B=u^c v^d. The index invariant gives the middle label
(a+c,b+d), hence its monomial weight AB. The new invariant is

    M² + B L² + A H² = (u+v+1) L M H.

It holds at the exact pinned initial frame. Under the right recurrence
N=(u+v+1)HM-BL, the residual of the new invariant is B times the old
residual. Under the left recurrence it is A times the old residual.
This is an integer-polynomial identity, using no division or positivity.
Induction on arbitrary finite paths therefore yields the invariant and

    L N_right = M² + A H²,
    H N_left  = M² + B L².

These are exact subtraction-free product equations. They alone do not show
coefficientwise nonnegativity of the quotient, or preservation of log-concavity.

## Specialized Laurent interpretation

The companion module defines evaluation in any field K, sending u to x²
and v to y². For nonzero x,y it associates to label (a,b,P) the field element

    xy P(x²,y²) / (x^a y^b).

For positive a,b this equals the source normalization at z=1. The same formula
also gives x at (0,1,1), with no erroneous natural exponent a-1.
The exact initial triple is

    (x, ((x²+y²)²+x²)/y, x²+y²).

The transport asserts equality with every finite iteration of Vieta's linear
formula, using k=(x²+y²+1)/(xy), in both path orientations. The generic
ring-homomorphism version exposes its variable-image hypotheses; the explicit
evaluation version constructs that homomorphism rather than postulating it.

Source: [Evans–Veselov–Winn, published article](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
equations (3), (5), (7), (8), retrieved live this invocation. This argument
identifies the specialized algebraic recurrence, not an imported theorem.

## Restoring the third variable

MarkovProjective2d1 defines sourceValues by multiplying the preceding values
at (x/z,y/z) by z. The scaling law sends a Vieta parameter k to k/z.
Thus source_full_evaluation_2d1 identifies the values, for every finite path
and every field with nonzero x,y,z, with the Vieta iteration of parameter

    (x²+y²+z²)/(xyz)

starting from the literal source seed triple

    (x, ((x²+y²)²+x²z²)/(yz²), (x²+y²)/z).

This is full three-variable evaluation transport, conditional only on explicit
nonzero coordinates and field structure. It is not yet an injective formal
Laurent-polynomial coefficient identification. In particular it does not prove
that every dehomogenized term has i+j≤a+b−1, or identify the Newton polygon.
For a term u^i v^j, the projective expression has Laurent exponents
(1−a+2i, 1−b+2j, a+b−1−2i−2j). Their injectivity in (i,j) suggests a direct
Laurent-coefficient bridge; that injectivity/transport has not been formalized
in this worker and is not silently treated as a theorem.

## Root correspondence obligations

* Coverage: inherited checked rational existence and uniqueness apply to the
  same protected recurrence. New exchange/fold theorems quantify over every
  finite path, with no bound.
* Source family: linear Vieta transport is supplied at z=1 and, via projective
  scaling, at all nonzero x,y,z in every field. A formal Laurent-polynomial
  identity and coefficient extraction still need an injective representation
  bridge; no pointwise-to-coefficient argument is silently assumed.
* Homogeneity and coefficients: the polynomial identities are in the pinned
  nested integer polynomial ring, with unscaled coefficients. Field evaluation
  is not used to infer coefficient inequalities. Injective homogeneous recovery
  from w=1 remains open; no degree theorem is claimed here.
* Polygon: InPolygon is unchanged; equality with the Newton polygon remains
  a separate formal obligation.
* Directions, zeros and endpoints: WeakLC is unchanged in all three directions,
  with zeros retained and non-strict inequalities. The initial field triple
  includes both endpoint labels. No new WeakLC assertion is made.
* Assumptions: ordinary pinned Lean/Mathlib only. Field nonzero hypotheses are
  explicit and belong to the specialization lemmas, not added to Conjecture63.
  Successful compilation, kernel replay and axiom output are recorded separately.
* Proof scope: exchange equations and specialized recurrence correspondence
  are partial results. They provide neither a universal coefficient inequality
  nor a counterexample. Completion must remain null.

## Validation

Reproduction uses research/validate_exchange_2d1.py. It freshly rebuilds source
into evidence/markov-2d1cb040 and excludes project build imports. `new` rebuilds
the exchange module; `laurent` rebuilds the specialized bridge; `kernel` replays
all five modules. Each run preserves a timestamped source copy and JSON output.
No dependencies, root definitions, contracts, controller records or previous
independent evidence are modified. The final validation manifest determines
which candidate sources actually passed; an uncompiled candidate is not a result.

Final local status: all five source modules compiled and passed kernel replay;
all 23 new declarations have permitted axiom closures. Two failed attempts
are preserved and rejected. The final source hashes and successful receipt
paths are bound by evidence/markov-2d1cb040/validation.json. No independent
source audit or root closure is claimed.
