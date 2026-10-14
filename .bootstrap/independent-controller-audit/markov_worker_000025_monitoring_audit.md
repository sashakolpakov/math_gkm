# Independent monitoring audit: worker 000025

Request: `3edac4bf4f1040d0b967711f6c52c66f`.

Audited the completed worker snapshot under
`/Users/sasha/math_gkm/.control/markov/workers/000025/artifacts`, its host
receipt, seven Lean source modules, correspondence, mathematical report, and
`evidence/markov-3edac4bf/validation.json`. Current copies of the seven sources
also match that snapshot. This is a read-only mathematical and recorded-evidence
review, not a fresh Lean build or full dependency rebuild. No source edits,
research instructions, or contact with the running next worker occurred.

## Conclusion

The worker proves full lattice saturation of the actual source numerators,
interval support of every raw diagonal, and two exact reformulations of the
pinned log-concavity conjecture. These are universal structural results, not
another finite denominator check. Neither reformulation establishes its
remaining coefficient inequalities, and neither checked obstruction refutes
the pinned conjecture. No substantive discrepancy between the English claims
and the seven accepted Lean modules was found.

The host outcome is `completed` after 1107.69 seconds; mathematical resolution
is false and completion is null. The root remains unresolved.

## Exact source support

Let `(a,b,P)` be the middle label and raw numerator produced by any finite
source path. The established source bounds are `0 < a < b`, coprimality, and
degree bound `a+b-1`. The raw coefficients are integers of `u=x²,v=y²`, with
the homogeneous third variable set to one; no coefficient normalization is
introduced.

`source_take_floor3eda` identifies the number of B letters in the first `j`
letters of the actual source word as `floor(a*j/b)`, for every `0 ≤ j ≤ b`.
It handles the terminal prefix as well as proper prefixes. The exact source
polynomial/raw ordered matrix product bridge is explicit.

`source_saturated3eda` then proves, for every natural `i,j`,

```
a*b ≤ b*i+a*j  and  i+j ≤ a+b-1  imply  0 < coeff P i j.
```

The proof covers `j=0`, `0<j<b`, and `j≥b`. It uses positive source vertices
for the first and last ranges; in the middle range an actual word suffix
supplies a positive monomial below the desired point, and the proved source
support propagation reaches the desired point. The source prefix identity
discharges the required lower-coordinate bound. There is no hidden positivity
or log-concavity assumption and no exception for small numerator/denominator.

Combining with the established outside-zero result gives both exact statements:

```
0 < coeff P i j  ↔  InPolygon a b i j
coeff P i j = 0  ↔  ¬ InPolygon a b i j.
```

This is literal lattice saturation, stronger than the previously proved
convex-hull equality or interval support. It supplies no inequality comparing
different positive coefficient magnitudes.

Historical scope: the primary preprint [S. J. Evans, Saturation of Markov
Polynomials, arXiv:2604.18333v1](https://arxiv.org/html/2604.18333v1), dated
20 April 2026, states the same lattice-saturation claim and supplies a proof.
The worker accurately treats saturation as known mathematics, with a new
checked proof in this project rather than a historical novelty claim. The
primary source's introduction and Conjecture 1.2 were independently inspected.

## Exact goal reformulations

`mechanicalWord3eda a b` has length `b`, with its `k`th letter B precisely when
`floor(a*k/b) < floor(a*(k+1)/b)`. The goal quantifies over every positive
coprime `a<b`; the general word definition at other inputs does not broaden
the goal. The proof establishes literal equality with every source word from
the successive prefix counts. Conversely, the inherited rational coverage
theorem supplies an actual source path for each admissible pair and the exact
same raw polynomial. Thus `root_iff_mechanical3eda` has no remaining
identification, balance, palindrome, or polygon-support premise.

`rawDiagonal3eda path n k` is `A[k,n-k]` for `k≤n` and zero otherwise. The
explicit guard prevents natural subtraction from manufacturing coefficients
past the diagonal endpoint. For every natural `n`, saturation and the linear
polygon inequalities establish interval support, including lower diagonals
and entirely zero slices. The integer zero extension is also covered.

`rawDiagonal_cross_iff3eda` turns ordinary adjacent diagonal log-concavity into
the project's CrossLC inequalities using already proved nonnegativity and
interval support. `all_diagonal_cross_iff3eda` covers all diagonals and all
natural adjacent triples, including the cases extending beyond a diagonal.

`root_iff_cross3eda` combines this with the corresponding horizontal and
vertical results. Its right-hand side requires CrossLC for every raw slice in
each of the three principal directions. Source nonnegativity and interval
support are discharged, not hypotheses left to the user. The prior exact
root/raw-matrix bridge preserves the endpoint clauses at 0/1 and 1/1; the
global inequalities also preserve zeros outside the polygon.

Both equivalences retain the full non-strict raw target in all three directions.
They do not establish their right-hand sides, invert smoothing, prove quotient
slice log-concavity, or replace the target by arbitrary-direction concavity.

## Checked obstructions and their limitations

The gas core `ACAAAAACA` is a palindrome and is balanced in the ordinary finite
word sense: any two contiguous factors of the same length have B/C counts
differing by at most one. Its scalar polynomial has coefficients `8,12,20` at
`(1,5),(1,6),(1,7)`, so the middle square is strictly smaller than the product
of its neighbors. This proves balance plus palindrome is insufficient for
that enlarged gas-core class. The formal non-source theorem specifically
excludes equality with any source polynomial labeled `3/8`: the positive
coefficient at `(1,5)` violates its lower polygon bound. The English report
correctly states that scope; the theorem is not a separate quantified
exclusion of equality with every possible source label.

For the actual source `1/9`, the exact coefficients at
`(0,9),(1,6),(2,3)` are `1,7,50`. Lean checks the label, all polygon memberships,
and `7² < 1*50`. These points lie in direction `(1,-3)`, which is not one of
the conjecture's three directions. This rules out a stronger arbitrary-direction
assertion and is consistent with the previously proved full principal-direction
log-concavity of the numerator-one source family.

The additional scan through denominator 35 and the palindrome enumerations are
finite experimental records, not universal premises of the accepted proofs.

## Recorded verification checked

For each final module, the archived source SHA256 equals the manifest hash,
the host receipt's recorded change hash, and the current source hash. Both
listed build and kernel receipts have return code zero, bind the same final
source hash, and themselves match the archived host receipt hashes. The kernel
commands invoke Lean 4.32.2 `leanchecker` on the corresponding module.

| Module | Final source SHA256 |
| --- | --- |
| MarkovMechanical3eda | `de355dfd7b2611c5db374ed1be35c99f4eb9afd57fa851963eb14410a78d3f29` |
| MarkovSaturation3eda | `6f4838e68c71eeeea8b6e7d28d873069e782d63494e4c830a3141cbddb299921` |
| MarkovDiagonalSupport3eda | `3cd11137dff9eeae55dcce3558361bcbad9214b77d3ebdc02f05b4ec6d02977c` |
| MarkovMechanicalGoal3eda | `eaac6d7d4a84525e5e26f0ba688d0507f8834b620e52c5d89923634cb6f6cef5` |
| MarkovCrossGoal3eda | `f82bcdf3091db65de3afe505516a02b5a1649dda24c0d135d649e8ff54984300` |
| MarkovPalindromeObstruction3eda | `f50346d16233378d342b32fde0940ffbc3b6030f35b422f5657f6dd25dbe7c9b` |
| MarkovDirectionObstruction3eda | `f5b975f7c9eec56339482b9208b9326d5454d52bf9d190ae6beddb7b9028a186` |

All 15 printed declaration dependency closures in the successful build outputs
contain only `propext`, `Classical.choice`, and `Quot.sound`; the manifest's
axiom-output fields exactly match those build outputs. Kernel replay stdout
and stderr are empty, with successful return codes. The saturation source has
one harmless unused-simp-argument warning.

All 12 distinct project-local direct-import binary hashes recorded in the
manifest match the available files. This checks the stated inherited compiled
imports; it is not a full source rebuild of those dependencies.

Five earlier elaborations returned code 1: two Mechanical drafts, two
Saturation drafts, and one CrossGoal draft. Their diagnostic `sorryAx` output
belongs to failed elaboration and is not accepted proof evidence. All later
accepted versions have the successful final-hash receipts described above.

The protected root remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The recorded toolchain, lake configuration/manifest, and controller contract
hashes also match. No claim of full conjecture completion is justified.
