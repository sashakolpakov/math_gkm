# Monitoring audit: autonomous workers 000003 and 000004

Reviewed 2026-10-14 Europe/Zurich at the approximately 23:24 UTC monitoring
check. Both host receipts say timeout after about 600 seconds, with no final
report. Review used their archived artifacts, not active worker 000005's
developing sources. No hints, repairs, project edits, model calls, or proposer
contact occurred. This reviewer did not run a fresh compiler; the validation
findings below concern inspected matching recorded executions.

## Worker 000003: literal homogeneous source recurrence

Request `4b57f2c364b44937ac866aa14bd8c6bb`.

`source_step_right_4b5` and `source_step_left_4b5` prove that the previously
constructed homogeneous numerator satisfies both orientations of the
three-variable recurrence, including the subtracted monomial's w exponent.
The seed theorems establish exactly (1, (u+v)^2+uw, u+v).

`source_tree_eq_4b5` identifies every finite iteration of that literal
homogeneous recurrence with the reconstructed numerator of the protected
bivariate frame. The recurrence accumulator also carries a Frame for its
integer labels, but its homogeneous update accesses only those labels and
its own polynomial triple: it does not define the new triple by calling
homogenization or by copying the bivariate polynomial fields.

`source_raw_coeff_4b5` recovers every raw coefficient at
(i,j,a+b-1-i-j). The earlier support bound handles natural subtraction
outside the degree bound, and no coefficients are rescaled. These results
provide the previously missing literal numerator-recurrence bridge.

The source seeds and recurrence correspond to equations (5), (8), and (9)
of the [primary paper](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
The boundary result reviewed below corresponds to its Theorems 4.1 and 4.2.
Neither is presented as a newly discovered published mathematical fact.

Final source hash:
`72067ac2a0602a51e8b1a622524589a676d028ff057f6feb1a5716fec1a00ac5`.
The source compiled successfully against freshly rebuilt project imports.
Its eight printed theorem closures contain only permitted standard axioms.
The manifest made before timeout does not record completed kernel replay.
However, the matching leanchecker receipt subsequently finished with exit
zero in 46.748 seconds and is preserved in worker 000004's archive as
`artifacts/evidence/markov-4b57f2c3/run-1791933097650514000.json`.
Its start timestamp and duration place completion after worker 000003's
timeout. Thus the accurate status is successful compilation during 000003,
with successful replay subsequently reconciled by 000004, not a completed
000003 final report.

## Worker 000004: top-boundary formula and log-concavity

Request `1998e47e852946dda2d4b1a02d4df1f3`.

`top_formula1998` proves P(u,v,0)=(u+v)^d for every finite path, where
d=a+b-1. Only w is specialized; u and v remain independent variables.
`top_raw_coeff1998` proves that the actual integer coefficient A_ij equals
binomial(d,i) whenever i+j=d. This preserves the root's raw normalization.

`top_raw_logConcave1998` has the exact constant-i+j direction used by the
root: (i,j+2), (i+1,j+1), (i+2,j). It proves their adjacent weak inequality
under the additional restriction i+j+2=d. Therefore it covers every such
triple on the top face, not interior diagonals or the other directions.
Its binomial inequality uses the inherited proved CrossLC invariant; it
does not infer CrossLC from an insufficient adjacent-only hypothesis.

Additional results prove positive coefficients at every top-face lattice
point, membership of these points in the pinned InPolygon predicate, and
attainment of total degree d. The last theorem expresses exact degree as
the conjunction of an upper support bound and existence of a nonzero
coefficient on that bound. This correctly strengthens the previous upper
degree result without claiming a full Newton-polygon theorem.

Final source hashes:

* MarkovTop1998.lean:
  `c2a10f4e920bbf38e6e76fdd533e1d4c2af5c018110f393409348c4f7274b3c4`.
* MarkovTopLC1998.lean:
  `66a69fda54b1acace9c888d2ffdf0328503d7da3fdf4e22eb475c92ee87d57cf`.

Both have matching successful compile and kernel replay records, with eight
printed theorem axiom closures using only propext, Classical.choice, and
Quot.sound. Earlier failed builds and a root-build timeout remain rejected.
Five inherited compiled imports were copied with explicit hashes; each
recorded hash agrees with the preceding worker's artifact receipt and this
worker's receipt. Accordingly this was not a complete fresh rebuild of all
dependencies. The worker's own scope document states this limitation.
The latest manifest is
`artifacts/evidence/markov-1998e47e/validation-1791933727963775000.json`.

## Remaining scope and audit conclusion

No substantive English/Lean mismatch was found in these retained results.
Inspected archived text hashes match their host receipts. Both attempts leave
the root unresolved, with no proof or refutation completion submitted.

Lower sloping support containment, the remaining vertex/convex-hull
identification, and universal interior raw inequalities remain open in
these attempts. The separate residual-divisibility document is an informal
machine-authored mathematical argument with explicit uncompleted Lean
obligations; it is not counted here as a kernel-checked theorem. It does
not claim residual positivity, residual CrossLC, or completion of all three
directions. This monitoring note is not a root-completion audit.
