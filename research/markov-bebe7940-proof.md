# Closed local result and proof structure

Machine-authored request bebe7940cb4f488b90ea3d92a8e3f199.

The main new theorem is `MathGKM.Markov.source_three_diagonalMBEB` in
MarkovThreeDiagonalMBEB.lean. For every q≥1, either residue r, and every natural
j, it proves

    threeRaw(q,r,3,j+2) * threeRaw(q,r,5,j)
      ≤ threeRaw(q,r,4,j+1)^2.

`path_three_diagonalMBEB` transports this to the actual polynomial on every
path whose middle label has numerator three. It does not restrict j to a finite
range, filter zeros, or assume the three points are in the polygon. Hence its
polygon restriction follows immediately. This closes one entire starting
column of the diagonal direction, not the complete numerator-three direction.

The first step closes the formerly exceptional parameter-zero base inequality:

    D(0,j+2,k) D(2,j,k) ≤ D(1,j+1,k)^2.

The inherited result handles k+3≤j. A new lower-lift polynomial certificate
handles j+2≤k, and four new short-sum certificates handle k=j+1, k=j,
j=k+1 and j=k+2. These cases exhaust natural j,k. The short-sum identity itself
is universal, proved using Vandermonde and a reversed weighted sum with its
zero extensions checked. Combined with the inherited t≥1 theorem, this yields
the complete parameter diagonal inequality for D(t,j,k), and the guarded base
diagonal for every source column i≥3.

For the full source starting at i=3, write B=3q+δ. Every j falls into:

* j+2≤q: the inherited complete lower source theorem applies.
* B<j+q+5: the entire correction is zero on this constant-sum triple, and the
  now-complete base diagonal applies.
* Otherwise, j=q−1 or j=q: the new correction-entry formulas and two residue
  certificates apply, preserving the one or two nonzero correction terms.
* Otherwise J=j−q−1 and K=B−q−j−5 are natural. If J<K, write J=x and
  K=x+1+h. If K≤J, write K=x and J=x+h. The two source formulas in
  MarkovThreeMassMBEB apply. In each residue and region the full gap has an
  exact polynomial expression with nonnegative coefficients.

The certificates use the inherited proved dense-polynomial evaluator. Each
finite coefficient-sign assertion is discharged by ordinary `decide +kernel`,
and the evaluator theorem transfers it to every nonnegative parameter value.
The kernels and source bridges, not external numerical data, establish the
expressions being certified. Negative mixed contributions are retained in the
total gap throughout.

The final exact reduction is

    Conjecture63 ↔ ThreeRemainingMBEB ∧ OtherFourM9E2.

ThreeRemainingMBEB keeps the still-open vertical correction-support region,
the small diagonal starts one and two, and the remaining diagonal starts at
least four. OtherFourM9E2 retains every numerator≥4 source. Both residuals are
open. Earlier exact reductions are preserved as history.

All 13 new mathematical modules passed local compilation and joint isolated
kernel replay. All 48 named theorem closures use only the permitted axioms;
the actual hashes and receipts are in evidence/markov-bebe7940/validation.json.
Compiled inherited imports were reused. This is neither a fresh whole-source
completion rebuild nor an independent source/English completion audit.
