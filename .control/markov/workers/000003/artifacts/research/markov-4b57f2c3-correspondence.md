# Source numerator recurrence bridge

Machine-authored by the live research worker 4b57f2c364b44937ac866aa14bd8c6bb.
This is a local scope argument, not the independent completion audit.
Validation status is recorded separately in evidence/markov-4b57f2c3/validation.json.

The publisher was retrieved live on 2026-10-13:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
Equation (5) supplies the seeds; equation (8) supplies the homogeneous
numerator mutation; equation (9) supplies the raw coefficient interpretation.

The new nested polynomial variables HU4b5, HV4b5 and HW4b5 represent u, v and w.
Their degree-one support predicates are proved by literal coefficient extraction.
Multiplication preserves homogeneous degree by three nested coefficient
convolutions; addition and subtraction preserve a common degree. This does
not rely on positivity. Fixed-degree specialization injectivity then proves
that the inherited reconstruction satisfies equation (8) exactly, including
the w power in the subtracted monomial. Both branches are handled.

sourceSeed4b5 is the triple (1, (u+v)^2+uw, u+v). sourceAdvance4b5 updates
three-variable polynomials using only that literal recurrence and the integer
labels. It does not call homogenize21a or inspect bivariate coefficients.
Its pair accumulator also carries the original Frame to obtain the labels;
although that Frame has a polynomial field, sourceAdvance4b5 accesses only
its integer labels. source_tree_eq_4b5 identifies every finite iteration
with the homogeneous reconstruction of the pinned frame.
source_raw_coeff_4b5 extracts the exact coefficient at (i,j,a+b-1-i-j),
for all paths and natural i,j, including zeros. Above the degree bound the
coefficient vanishes, so natural subtraction introduces no false nonzero term.

Correspondence obligations:

* Coverage: inherited checked coverage/uniqueness applies to the unchanged
  labels. The new theorem ranges over all finite paths, without a depth bound.
* Source family: the new identity connects precisely the source numerator
  seeds and recurrence in both orientations. The source's identification of
  that recurrence with its Conway-topograph family is documented; inherited
  arbitrary-field Vieta evaluation bridges remain separate checked evidence.
  No theorem about all arbitrary matrix words or all Laurent solutions is used.
* Homogeneity and coefficients: the literal homogeneous recurrence and exact
  raw extraction are connected. No binomial or factorial normalization occurs.
  This is not a new proof of coefficient nonnegativity or degree attainment.
* Polygon: the upper degree bound is inherited; lower support containment,
  vertex attainment and convex-hull equality are still formal gaps.
* Directions, zeros, endpoints: WeakLC and Conjecture63 are untouched; their
  three directions retain zeros and weak inequalities. Both endpoint seeds
  are included. No new log-concavity assertion is made in any direction.
* Assumptions: only pinned Lean/Mathlib and permitted ordinary axioms; see
  actual successful axiom receipts. Failed builds do not establish results.
* Scope: neither the pinned root nor its negation is proved. Universal raw
  inequalities, polygon correspondence, and independent hash-bound completion
  audit remain necessary. completion is null.
