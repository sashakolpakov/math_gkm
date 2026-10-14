# Independent monitoring audit: worker 000035

Request: `f93ee68f6b414a928b23bb07728597c4`.

Read-only review of the completed worker snapshot under
`/Users/sasha/math_gkm/.control/markov/workers/000035/artifacts`, four final
Lean modules, correspondence and mathematical reports, exact certificate,
validation manifest, successful and rejected receipts, and host receipt.
No project changes, proof suggestions, proposer contact, or interference
with the next worker occurred. No fresh Lean build was run.

## Conclusion

The worker gives a rigorous complex-root obstruction for an exact raw
horizontal row of the actual source 23/24. The same complete row is separately
proved raw log-concave. The complex root rules out a precisely specified
class of real linear/quadratic factorizations; it does not refute the Markov
coefficient conjecture or rule out arbitrary factorizations.

All four final modules have matching successful compilation and separate
kernel-replay records. No substantive English/Lean correspondence defect was
found. The host outcome is `completed` after 1171.35 seconds, mathematical
resolution is false, and completion is null.

## Literal source polynomial and entire row inequality

`sectorRowF93e` is defined by swapping the variables of the protected source
polynomial at `replicate 22 true`, then extracting its coefficient at 26.
Thus it is exactly the horizontal row

```
sum_i A(i,26) X^i
```

of that source. `sector_source_labelsF93e` proves its label is 23/24.
`sector_source_rowF93e` proves equality of the entire integer polynomial
with the explicit 21-coefficient Horner polynomial. It uses the established
raw Pell coefficient formula for indices at most 20 and proves the remaining
coefficients are zero. No root-candidate polynomial is silently substituted
for the source and no factor or coefficient rescaling is removed.

The polynomial has degree 20, constant coefficient 231, and leading
coefficient 5,608,233,007,146. All 21 listed coefficients are positive.
`sector_row_polygonF93e` proves that the pinned polygon condition on this
row is exactly `i≤20`, for natural `i`.

`sector_source_row_lcF93e` proves

```
A(i,26) A(i+2,26) ≤ A(i+1,26)^2
```

for every natural starting index `i`, including triples extending beyond
support and all-zero triples. Thus this witness is explicitly not a raw
horizontal log-concavity failure. No universal all-row or all-source
inequality is inferred from this single-row result.

## Exact existence of a root outside the stated sector

`exists_root_near_f93e` is a proved general certificate over the complex
numbers. If

```
|P(c)| < |leadingCoefficient(P)| r^degree(P),  r≥0,
```

then some actual root has distance less than `r` from `c`. Its proof uses
factorization over the algebraically closed complex field and the product
of distances to all roots, with multiplicities. If every root were at least
`r` away, that product would contradict the displayed strict inequality.
This is a mathematical existence argument, not reliance on a numerical
solver's reported root.

For the explicit source polynomial, the center has exact rational real and
imaginary coordinates near

```
-0.02823064230705693446 - 0.05087697677069144583 i.
```

`sector_residualF93e` proves by exact rational Horner arithmetic that the sum
of the absolute real and imaginary residuals is less than `(1/10000)^20`.
The proved degree and leading coefficient then meet the general certificate's
hypothesis with radius `1/10000`. No floating-point estimate is a premise.

`sector_disk_outsideF93e` proves for every complex point in this disk that
its real part is negative and `3 Re(z)^2 < Im(z)^2`. Consequently
`sector_root_outsideF93e` establishes an actual root outside the closed
120-degree sector centered on the negative real axis. The source polynomial
identity transports this exact existential statement to the actual source
row mapped into the complex coefficients.

As an additional finite audit check, the rational coordinates and coefficient
list were independently parsed from the archived Lean source and evaluated
with exact rational arithmetic. The stated residual inequality, all adjacent
raw coefficient inequalities, and the bounding rectangle's strict sector
margin all passed. This did not search for new roots or extend the experiment.

## Precisely excluded factorization class

`QuadraticLCFactorF93e p` means that there exist real `a,b,c`, not all zero,
such that

```
a*c ≤ b^2
p = a + bX + cX²
```

after the real coefficients are mapped into the complex numbers. This includes
nonzero real constants and real linear factors as degenerate cases. There is
no nonnegativity assumption on the three coefficients.

`quadratic_nonzero_outsideF93e` proves that a complex number satisfying
`Im(z)^2 > 3 Re(z)^2` cannot be a root of any such nonzero factor. The proof
handles the degenerate leading-coefficient case and otherwise derives the
contradiction from the real and imaginary parts of the quadratic equation.

`source_no_lc_quadratic_factorizationF93e` therefore proves there is no finite
list of factors in this class whose product equals the actual source row.
This is stronger than excluding only nonnegative-coefficient factors of
that shape, but its condition `ac≤b²` remains essential. It does not exclude
real quadratic factors failing that condition, complex linear factors,
higher-degree factors, or direct coefficient proofs. In particular, the
ordinary existence of a real linear/quadratic factorization is not denied.

The sector condition is being used as a stronger sufficient route toward
coefficient log-concavity, not as a necessary condition for raw log-concavity.
The separately checked raw LC of this very row prevents that logical reversal.

## Numerical evidence and limits

The numerical scans selected the candidate but remain exploratory evidence.
The source scan with a denominator bound of 45 was time-capped and is not
complete coverage through that bound. Unreliable numerical rows are explicitly
recorded. Enlarged-word candidates are not identified with the source family.

The exact-certificate JSON retains its historical `pending Lean verification`
label from certificate generation. The subsequent final-hash Lean build and
kernel-replay receipts establish the accepted formal status; the JSON label
or numerical root approximation alone is not counted as proof.

No historical novelty claim or full source conjecture proof/refutation is
supported by this round. The auxiliary general root-certificate theorem is
proved, but its usefulness elsewhere is outside this monitoring audit.

## Recorded verification

| Module | Final source SHA256 |
| --- | --- |
| MarkovRootCertificateF93e | `116f1d1cdd590fe1abcd2df7ad19528e4bd9db68f04d9a796dde8dc4fb8cf9f6` |
| MarkovSectorWitnessF93e | `1c0bcc560f6079c989b3a45ea9802b70daa59ba261160391bb874786f2ffb539` |
| MarkovSectorSourceF93e | `033ed9b3b68ea995a8b0447be072f15229f0560f1e7572d30f6296b8674c4241` |
| MarkovQuadraticObstructionF93e | `7c2589140f7307d6df218368efc62f5cbc793a2fb376419fa4b9d69bc813dc59` |

Each archived source hash matches the current source, validation manifest,
and host change receipt. The four selected build receipts and four separate
kernel-replay receipts return zero, bind the matching final source hashes,
and themselves match the archived host receipt hashes. The replay commands
invoke Lean 4.32.2 `leanchecker` on the corresponding modules.

All eight printed dependency closures in the final successful build outputs
contain only `propext`, `Classical.choice`, and `Quot.sound`. Five earlier
failed elaborations are retained as rejected: one RootCertificate, one
SectorWitness, two SectorSource, and one QuadraticObstruction attempt. Their
error terms are not accepted proof evidence.

These checks reuse inherited compiled imports and do not constitute a fresh
full-source dependency rebuild. The protected root hash remains
`8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe`.
The full Markov conjecture remains unresolved.
