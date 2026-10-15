# Mathematical report, request 38ebef17

Machine-authored live experimental research. The exact pinned root and its negation remain unproved. Acceptance is determined by source-bound compilation, replay and axiom records in `evidence/markov-38ebef17/validation.json`.

## Fourth lower slice assembled by denominator difference

`run_fourth_allM38E` combines the recovered worker-107 theorem for n>=4 with the checked short-run quotient route. It proves the complete fourth lower-slice raw inequality for **every natural n** and arbitrary actual predecessor path with c>=5. The resulting indices are a=cn+r and b=c(n+1)+r, where r is the predecessor numerator.

`source_fourth_gap_ge_fiveM38E` transports this to every generated path with a+5<=b, on the exact slice i+j+2=a+4, retaining all three polygon hypotheses. The list decomposition is exhaustive: pure-right paths have b=a+1 and cannot satisfy this bound; every other path has the stated run/predecessor decomposition, and its predecessor denominator is exactly b-a.

`fourth_small_gap_parametersM38E` proves that the remaining fourth-slice parameter conditions a+2<=b<=a+4 and 4b<5a force n>=4 and exactly the five predecessor pairs

    (c,r)=(2,1),(3,1),(3,2),(4,1),(4,3).

This is a classification, not a proof of their remaining inequalities. `root_iff_coreSmallGapM38E`, when accepted in validation, is the exact pinned-root equivalence with an unproved residual that retains horizontal/vertical interiors, higher slices and these small-gap fourth-slice obligations. It also retains inherited solved-region exclusions; it does not silently drop a direction or zero.

## Exact finite-run quotient route

For n=0,1,2,3 and each of the six Farey chambers, the source's cleared numerator has a checked identity

    chamberNumerator(n, X^n, c, r, X)=(1-X)^8 Q(n,c,r,X).

The coefficients of Q are explicit integral polynomials in c,r. The source identity and cancellation of the nonzero polynomial (1-X)^8 identify Q_j with 24 times the raw source coefficient. Every j is handled, including j beyond the listed degree where Q_j=0. No division by individual coefficients is used.

For chamber p/q<r/c<s/t, substitute c=q(C+1)+t(R+1), r=p(C+1)+s(R+1). The actual integral parameters satisfy C=sc-tr-1>=0 and R=qr-pc-1>=0. Each scalar gap Q_(j+1)^2-Q_j Q_(j+2) is a checked polynomial with nonnegative coefficients in C,R. The source adapters cancel the common positive factor 24². Reducedness excludes the chamber boundaries for c>=5.

These short-run inequalities were already proved by workers 062809ba and 6604cff8 via a different matrix specialization. This run provides alternate quotient proofs, not new short-run coverage or a historical novelty claim. The all-run and numeric-gap assemblies make the combined scope explicit.

## Experiments and small-cycle corrections

The exact finite experiment checked 1,088 cases, 50,112 coefficient identities, 11,424 polygon-valid triples and 1,720 literal recurrence comparisons. It retained 36,512 zero coefficient positions. These computations are not proofs.

The excluded small-cycle probe evaluates c=2,3,4 and n=0..24. Extrapolating the c>=5 formula is incorrect. Write F for that extrapolated 24-scaled quotient and T for the actual fourth cut polynomial. The observed defect has the form

    24 T-F = 24 X^b D(n,X)/(1-X)^(2(4-c)).

For c=4 and r=1 or 3, D=1: the discrepancy is one raw boundary coefficient at (i,j)=(0,a+4). For c=3,

    r=1: D=-(3n+5)+(6-3n)X+(3n+11)X²+3nX³-8X^(n+2)-4X^(n+3);
    r=2: D=-(3n+6)+(5-3n)X+(3n+12)X²+(3n+1)X³-4X^(n+2)-8X^(n+3).

For c=2,r=1, the numerator has three shift blocks, at 1, X^n and X^(2n), with coefficients of degree at most two in n; its full exact candidate is saved in `small-cycle-correction-candidates.json`. The candidates were fitted from exact n=6,7,8 data and verified against all n=0..24 observations. **Interpolation and finite checks do not establish these identities universally.** A source/moment correction theorem and subsequent LC proof are still needed.

## Validation limits

The final receipts retain failed builds, the unavailable SymPy capability and the corrected replay selection. Inherited compiled imports were reused. This is not a fresh rebuild of the entire dependency source closure and not an independent hash-bound English/source completion audit. All seven correspondence obligations remain binding for root completion.
