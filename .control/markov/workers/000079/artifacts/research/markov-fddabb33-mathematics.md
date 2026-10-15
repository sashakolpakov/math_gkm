# Third-slice normalization and coefficient extraction

Machine-authored live request `fddabb33d2704cfe80b4fa474cf8edc1`.
Full pinned `MathGKM.Markov.Conjecture63` remains unresolved.

## Reconciliation

Workers 77 and 78 were reported as timed out, but both completed their final
validation and finalizer before interruption. Their raw logs have respectively
271 and 280 events and no unmatched started items. All 343 predecessor artifact
and inherited-input hash checks passed. Their side effects were retained and
not replayed. The source coefficient formula left open by worker 78 was chosen
as the next mathematical action.

## Exact algebraic normalization

The sixteen inherited run jets now have smaller rational normal forms.
Each equality is proved in Lean using the actual source jet formula and the
proved nonvanishing of `1-X` in the injective fraction field. The first and
second source moments have denominators `(1-X)^2` and `(1-X)^4`; all eight
Boolean local cubic moments have denominator `(1-X)^6`.

Write `z=X^n`, and let `c,r` be the predecessor denominator and numerator.
For the uncorrected third-run polynomial `T`, the source adapter proves

    (1-X)^6 T = K0 + z K1 + z^2 K2 + z^3 K3
                 + [c=2] 6(1-X)^6 F X^(2n+3).

Here `F` is the actual first-run polynomial. The four K-polynomials include
the exact source pattern statistics; K0 is independent of those statistics.
The first powers of X in K1,K2,K3 are respectively 2,3,4, so every delayed
term begins at degree at least n+2. The explicit definitions retain all 525
terms of the inherited Python normal form, but now their composition is
proved by four separate polynomial certificates in Lean. Python normalization
and interpolation are not premises of those proofs.

The first monolithic proof timed out at 180 seconds. Two shorter attempts at
the generic band definitions/factors also timed out. Factored definitions
and four separate coefficient certificates resolved those bottlenecks.
Rejected source adapters initially left a trivial disjunction after algebraic
simplification; this was repaired explicitly. All failed receipts are retained.

## Formal coefficient extraction

`MarkovExtractFDDA` uses the ordinary formal power-series inverse of `(1-X)^6`.
For integer polynomials satisfying `(1-X)^6 P=K+X^N R`, it proves that
`P.coeff j` agrees with the coefficient of `K/(1-X)^6` for every `j<N`.
It also proves the exact ten-term extraction from K0 and identifies it with
the predecessor's `thirdShapeBDEE`, multiplied by the uniform scalar 15.
`MarkovExtractAllFDDA` proves the all-index convolution formula

    P_j = sum_(l+m=j) K_l binom(m+5,5)

whenever `(1-X)^6 P=K`. These are ordinary coefficients and include zeros;
there is no factorial normalization or numerical evaluation.

`source_denominatorFDDA` proves the exact integer-polynomial identity with
delayed remainder exponent n+2, including c=2. `third_run_interior_coeffFDDA`
therefore proves `thirdShapeBDEE n c r j = 15*T.coeff j` for all natural
n,c,r and every 4≤j≤n+1. This discharges the inherited
`ThirdInteriorFormulaBDEE` premise.

`source_third_interiorFDDA` is now an unconditional source theorem: for every
n and rest path, every i,j with 4≤j, j+2≤n and i+j+2=a+3 satisfies
A(i,j+2) A(i+2,j) ≤ A(i+1,j+1)^2. No coefficient positivity, denominator
bound or source-formula hypothesis is assumed. It covers a restricted
strip on the third lower slice, not the entire slice.

`source_third_all_coeffFDDA` additionally proves an explicit finite binomial
convolution for every coefficient on the entire third lower slice of every
mixed source path. The corrected numerator keeps both the c=2 and c=3
exceptions. This is an identity, not log-concavity on the unproved bands.

Final accepted source hashes and separate kernel replays are recorded in
`evidence/markov-fddabb33/validation.json`. Unvalidated drafts are excluded.

## Finite checks and validation limits

The independent exact experiment covers 589 sources with 6≤n≤24 and
2≤c≤10, for all reduced predecessor numerators in that range. It checks
7,657 coefficient positions against a backward cut recurrence, 198 positions
against the literal raw numerator recurrence, and 5,890 polygon-valid triples.
There were no failures. This is finite evidence only.

Accepted final sources are compiled and separately kernel-replayed, with
axiom closures audited. Inherited compiled imports are reused; this is not
a fresh whole-source rebuild or independent completion audit. Sage and SymPy
are unavailable; GAP is present but was not needed. The active sandbox denies
`.scratch`, so uniquely named persistent research/evidence paths were used.
One shell here-document failed on temporary-file creation and was replaced
with an ordinary Python script.

The full goal still requires all remaining positions, slices and directions,
and the complete source/English correspondence audit. No partial coefficient
formula, finite scan, or successful operational receipt closes that goal.

Generation scripts retain the development history; some final Lean files were
manually repaired after generation. The validated final sources and their
receipt hashes are authoritative. Do not blindly rerun an earlier generator.
