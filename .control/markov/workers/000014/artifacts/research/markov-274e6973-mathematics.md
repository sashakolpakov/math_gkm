# First vertical line: completed source assembly

Machine-authored request 274e697316c74a42a3ef9a5e29d76c17.
The exact pinned Conjecture63 remains unresolved.

Let a,b label an actual source path. For a>=3, write b=aq+r with
q>=1 and 0<=r<a. The checked source formula is

    [u]P(u,v) = v^(b-q) (1+v)^(a-3)
      (4 sum_(k<q) (ak+r)v^k + (3b-1)v^q + (a+b-1)v^(q+1)).

The formal statement source_formula274 supplies q,r with these exact
relations. It does not separately name Nat.div: those relations characterize
the usual quotient and remainder. The map to the literal real ramp polynomial
is blockH_ramp_map274. Together they discharge the equality premise of the
inherited vertical_one_of_formula025.

The proof uses the actual word-pair recursion to identify a source word with
adjacent run blocks A^n B and A^(n+1) B. Its number of blocks is a and number
of long blocks is r; the total length is a(n+1)+r=b. Both block types occur
unless the path is entirely left steps. The earlier first-jet additive law
propagates the cleared block identity. The source trace and determinant
identities then give

    v^q(1+v)^3 [u]P = v^b(1+v)^a (H-v^q(1+v)).

Polynomial cancellation is justified by nonzero factors and nonnegative
remaining exponents. This discharges the inherited source formula gap.

For a=1, source_one_spine274 proves that the path is entirely left steps.
The source matrix run recurrence yields the row

    [u]P_(1/b) = sum_(0<=k<b) (k+1)v^k.

The formal source_one_formula274 packages it as truncInt274 1 (q+1) q,
with q the last degree. No assumed closed source formula is used.

For a=2, coprimality and the remainder bounds force r=1. Cancelling the
remaining (1+v) factor gives, for b=2q+1,

    [u]P_(2/b) = v^(q+1)
      (4 sum_(k<q) (k+1)v^k + 2(q+1)v^q).

This is source_two_formula274. Both small cases follow from the new checked
truncated-arithmetic CrossLC theorem: a positive increasing arithmetic list
may have its last entry reduced to any nonnegative value no larger than its
arithmetic continuation. The proof keeps zero extension and interval support.

The resulting unconditional theorem vertical_one_all274 states exactly

    coeff P 1 j * coeff P 1 (j+2) <= coeff P 1 (j+1)^2

for every source path and every natural j. It has no formula, polygon,
denominator, or small-numerator hypothesis. It supplies one vertical line,
not the full vertical predicate and not either other direction.

Validation receipts and rejected attempts are in evidence/markov-274e6973.
The finite experiment first_vertical_274.py independently computes the raw
recurrence and compares these formulas; it is not used by the Lean proof.
The correspondence record is markov-274e6973-correspondence.md.
