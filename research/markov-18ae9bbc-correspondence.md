# Source correspondence and remaining scope, worker 18ae9bbc

Machine-authored audit, not an independent completion audit. The pinned root
MathGKM.Markov.Conjecture63 is unchanged; completion remains null.

The new positive generators at w=1 are

    A = [[v,1],[uv,u+1]],
    B = [[v(u+v+1),u+v],[uv(u+v+2),u(u+v+1)]].

They arise from the published Cohn matrices by replacing x²,y²,z² with u,v,1
and conjugating so the upper-right entry is divided by x and the lower-left
entry multiplied by x. Source: equations (35)–(36),
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
The Lean proof uses explicit matrices, seed identities, determinant identities
and Cayley–Hamilton; it does not take the paper's theorem as an axiom.

`raw_matrix18` identifies the upper-right product entry with the literal
pinned numerator for every Farey path. `raw_coeff_nonneg18` proves every raw
coefficient is nonnegative, including lower-half slices and all zeros.
This supplies a direct raw representation, avoiding inverse blowup transport.

`weighted_orders18` establishes that substituting u=T^m,v=T^n gives lowest
degree min(am,bn), for all natural weights m,n, including zero. Nonnegativity
prevents cancellation under specialization and in the positive exchange sum.
The numeric tropical exchange identity is proved, and the source exchange
identity is rebuilt from its existing checked source. The weight choice (b,a)
gives the oblique support bound bi+aj>=ab. Combined with the inherited degree
bound, `raw_outside_polygon18` proves exact zero outside the pinned polygon.
`polygon_certificate18` adds positivity at (a,0),(0,b), and coefficient one
at (a+b-1,0),(0,a+b-1). This does not assert saturation.

`root_iff_raw_matrix18` is an exact equivalence between the pinned root and
GlobalLC18 of every source middle matrix product. GlobalLC18 tests all natural
indices in all three prescribed directions, without polygon guards. For a
triple whose endpoints are in the polygon, its center is in the polygon by
the linear inequalities; otherwise a vanishing endpoint makes the inequality
automatic. Both directions and the separately vacuous 0/1 and 1/1 endpoints
are proved. The matrix inequalities themselves remain unproved.

Correspondence obligations:

* Coverage: inherited rational coverage and uniqueness remain available. All
  new source statements quantify over every finite path, with no cutoff.
* Source family: only the paired Farey product starting at A,B is used in the
  exact root equivalence. Arbitrary matrix words are not substituted for it.
  The source numerator recurrence and full homogeneous/Laurent adapters remain
  inherited, separately recorded results.
* Homogeneity and coefficients: no coefficient normalization occurs. The
  coefficient extraction is literally the pinned nested-polynomial function.
  The inherited degree/homogeneous reconstruction fixes the omitted w exponent.
  Weighted specialization is used to bound support, never to identify distinct
  original coefficients without the proved nonnegative-summand bound.
* Polygon: universal containment and all four vertices are proved. The separate
  `newton_polygon18` identifies the real convex hull of the actual nonzero raw
  coefficient support with the region x,y>=0, bx+ay>=ab, x+y<=a+b-1.
  `inPolygon_iff_region18` identifies its natural lattice points with the pinned
  predicate. Validation status is recorded in the final manifest. This uses an
  explicit radial convex-combination proof, with the coincident-endpoint case
  handled separately; it does not infer saturation from convex-hull equality.
  These theorems cover every interior path. The separate endpoint numerators
  have singleton and two-point supports respectively, and their root inequalities
  are proved vacuous in the exact reduction.
* Directions, zeros, endpoints: the exact reduction retains all directions,
  internal/terminal zeros, both endpoints, and universal scope. No strict
  inequality is silently substituted for the non-strict root.
* Assumptions: only pinned Lean/Mathlib and ordinary permitted axioms. Validation
  uses inherited compiled project imports with hashes; it is not a fresh
  independent rebuild of all source or an independent English/source audit.
* Proof scope: the root and its negation remain unproved. The six developing
  bridge modules do not supply the remaining universal coefficient inequalities.
  The 127-fraction all-entry matrix experiment is finite evidence only.

Every failed compilation is retained as a rejected receipt and source snapshot;
error-produced axiom output is never accepted. The shell here-document failure
and prohibited .scratch capability are operational restrictions, not mathematics.
No protected source, controller record, dependency, permission, prior independent
evidence, or Git state was modified. No external action request is pending.

Final validation: evidence/markov-18ae9bbc/validation-1791939123445506000.json
records successful compilation and kernel replay for all six new modules,
source and imported-project binary hashes, permitted axiom closures and every
rejected attempt. In particular the final MarkovGeometry18 source and its
Newton-polygon equality passed replay. This receipt remains local operational
evidence, not an independent completion audit or proof of Conjecture63.
