# Independent monitoring audit: worker 000009

Read-only mathematical review, 14 October 2026. Request `18ae9bbc80dc488c816e56bdde0bc2ff`. The reviewed snapshot is `/Users/sasha/math_gkm/.control/markov/workers/000009/artifacts`, with its correspondence/checkpoint and `evidence/markov-18ae9bbc/validation-1791939123445506000.json`. No project files were edited, no mathematical advice was supplied, and active worker 000010 was left undisturbed.

## Conclusion

The worker establishes an exact positive matrix representation of the raw source numerator, nonnegativity of all its coefficients, the stated Newton polygon as the actual real convex hull of nonzero support, and an exact equivalence between the protected full conjecture and coefficient inequalities for the source-restricted matrix products. No substantive English/Lean mismatch or vacuity was found in these claims. Neither the root nor its negation is proved. The universal matrix inequalities remain the unresolved mathematical statement.

The matrix/nonnegativity and polygon results formalize published facts: Theorem 10.1, Corollary 10.2, and Theorem 3.2 respectively. Their importance here is establishing checked connections to the literal target without introducing those facts as assumptions; this is not a historical novelty claim. [Original paper](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

## Raw matrix identity and positivity

The two generators are, with S=u+v+1,

    A = [[v, 1], [uv, u+1]],
    B = [[vS, u+v], [uv(S+1), uS]].

The correspondence to the paper's equation (35) is correct: set z²=1, replace x²,y² by u,v, and conjugate to divide the upper-right entry by x and multiply the lower-left entry by x. Equation (36) then predicts the numerator identity. The Lean proof independently verifies seed, determinant, trace and recurrence identities instead of assuming that prediction. [Paper, §10](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).

`Mat16.b` is the upper-right entry and `mm16` is ordinary 2×2 multiplication. The pair update replaces (X,Y) by (XY,Y) or (X,XY), according to the same Boolean source-path choice. `raw_matrix18` states, for every finite path, that the literal pinned polynomial equals the upper-right entry of the product of the resulting pair. It does not replace source words by arbitrary words.

`raw_coeff_nonneg18` then proves 0≤A(i,j) for every source path and all natural i,j, including lower-half slices and zero coefficients. It concerns the unchanged integer coefficients extracted from the nested polynomial, with no normalization, degree cutoff, denominator bound or residual-positivity assumption. The proof uses nonnegative generator coefficients and closure under addition and multiplication.

## Support and actual Newton polygon

`weighted_orders18` proves that the lowest degree of P(T^m,T^n) is min(am,bn), simultaneously for each label in every source frame, for all natural weights m,n, including zero. Nonnegativity and nonvanishing are proved first, and the weighted coefficient bound explicitly handles distinct monomials landing on the same specialized degree. Thus weighted substitution does not rely on an unjustified lack of cancellation.

For m=b,n=a this gives the oblique support bound bi+aj≥ab. Combining it with the existing total-degree bound i+j≤d, where d=a+b−1, yields `raw_outside_polygon18`: every coefficient outside the protected polygon predicate is exactly zero.

`polygon_certificate18` additionally proves positivity at (a,0),(0,b) and coefficient one at (d,0),(0,d). Its premise is only a source path. In particular the four defining vertices belong to actual nonzero support. Degenerate cases such as a=1, where two of these vertices coincide, are allowed.

`RawSupport18` is explicitly the set of real-coordinate pairs (i,j) at which the actual raw coefficient is nonzero. `NewtonRegion18` is the real region x,y≥0, bx+ay≥ab, x+y≤d. `newton_polygon18` proves equality of this region with `convexHull ℝ (RawSupport18 P)`. The forward inclusion uses support containment; the reverse inclusion uses the four supported vertices and an explicit convex-combination argument. The radial endpoint-coincidence case is handled separately. This is genuine convex-hull equality, not a definition that identifies the target region with the support by stipulation.

`inPolygon_iff_region18` proves that the protected natural-index polygon predicate is precisely membership of the cast lattice point in that real region. All these source theorems quantify over every interior path. The inherited coverage theorem supplies all reduced interior rational indices. No statement here proves every lattice point in the region has a nonzero coefficient: convex-hull equality is distinct from saturation.

## Exact root equivalence

`GlobalLC18 P` conjoins, for all natural i,j, the horizontal, vertical and constant-i+j adjacent inequalities on the literal coefficients, with no polygon guards. `RawMatrixGoal18` asks for this property of the upper-right entry of every paired source product.

The auxiliary equivalence `global_iff_weak18` assumes only that coefficients outside the polygon vanish. This assumption is discharged for source polynomials by the new unconditional support theorem. It neither assumes log-concavity nor positivity at interior lattice points.

The forward implication from unrestricted inequalities to the polygon-restricted inequalities is direct. Conversely, when both endpoints are in the polygon, the two defining linear inequalities imply its midpoint is in the polygon, so the protected inequality applies. If either endpoint is outside the polygon, its coefficient is zero and the desired inequality reduces to 0≤a square. Internal and terminal zero coefficients are retained; non-strict inequalities are not strengthened to strict ones.

`root_iff_raw_matrix18` applies this equivalence and the exact raw matrix identity in both directions. It also supplies the protected endpoint obligations for 0/1 and 1/1: their polygons contain no valid consecutive triples in the three directions, so these cases are genuinely vacuous. It does not silently discard a nonvacuous endpoint or add an all-four-matrix-entry condition. The quantifier over all finite paths has no bound. There is therefore no hidden strengthening or weakening of the pinned root in this reformulation.

## Matching verification records

The worker completed after approximately 1150.34 seconds. The six archived source hashes match both the validation manifest and the controller's recorded artifact hashes. Each successful build and replay receipt also matches its archived hash and names the same final source hash:

| Module | Source SHA-256 | Build receipt | Replay receipt |
|---|---|---|---|
| MarkovRawMatrix18 | `fae8ccf54cd2a1aafe73b308095b72df077ec10cf22d7eb7f5658ad463b43cc8` | `run-1791938267781822000.json` | `run-1791938385088912000.json` |
| MarkovWeighted18 | `44b47c5e8aa16a567e72e432ed029c8c367cdee943f66fb7a4f9a9239666975e` | `run-1791938585441663000.json` | `run-1791938630126558000.json` |
| MarkovPolygon18 | `9a34f4ea6636f4e5e2d37691c6f7058ec2541c39c62dcc56c5401d42c54b19a3` | `run-1791938661795094000.json` | `run-1791938706722098000.json` |
| MarkovVertices18 | `d00a64ab1ab1fbff73f08ffa4518e05d566a3fbcc452d14b3ad6b372927cb504` | `run-1791938749173474000.json` | `run-1791938814483343000.json` |
| MarkovReduction18 | `263fa11be4ee4f7d3851f4fc22ec88a7e93399c6a5772fa92904de2488c783f9` | `run-1791938814481812000.json` | `run-1791938883507757000.json` |
| MarkovGeometry18 | `4f66e5f3fe5b6654c46be781c2d28f8ebe7f98b96347861f2e184868a22b9d21` | `run-1791939057914275000.json` | `run-1791939084894492000.json` |

All receipts above are under `evidence/markov-18ae9bbc/` and exit successfully. The 22 printed theorem closures use only permitted standard axioms (`propext`, `Classical.choice`, `Quot.sound`, with the elementary tropical identity needing only a subset). Seven unsuccessful compilation attempts are separately retained, each with exit code 1; none is treated as accepted evidence.

The inherited exchange module was also rebuilt and replayed successfully from its existing source hash `827dd6f77968f1321a538b768bedb07f1ebba11f493c0754382b2f3e1f1f5610`. The protected root hash remains `8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.

These are inspected recorded compilations and kernel replays against inherited compiled imports, with project binary hashes recorded. This audit did not independently rebuild the full dependency graph. The manifest correctly records a null completion claim and no independent completion audit.

## Experiment and remaining work

The retained exact experiment reports 127 reduced fractions with denominator at most 20 and no source-matrix mismatch, weighted-minimum mismatch or tested all-entry adjacent-LC failure. I inspected its recorded scope, not a new independently rerun experiment. It is finite evidence only. An all-four-entry LC invariant would be stronger than the proved root equivalence, which uses the upper-right entry; neither that stronger invariant nor the equivalent universal raw-matrix goal has been proved.

The useful advance is a checked direct representation and support geometry for the entire conjecture, complementing the previous four-diagonal partial theorem. Conjecture 6.3 remains unresolved. This monitoring note is not a full-root proof/refutation audit.
