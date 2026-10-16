# Uniform horizontal residual support

Machine-authored request ea4238fc86ab42dca04c21467d7fa66c. Full pinned Conjecture63 remains unresolved. Build/replay status is recorded separately; this prose is not an admission receipt.

Let x be the horizontal coefficient variable, Y the rescaled row variable, and h=1+x. For a product M of the inherited integral horizontal matrices, put F=M.a+M.c and H=M.b+M.d-M.a-M.c. Appending letters has the following exact positive recurrence, starting from (F,H)=(1,0):

    A: F'=Y(hF+xH), H'=F+H.
    B: F'=Y(h²F+x(x+2)H)+Y²(h³F+xh²H),
       H'=x(F+H)+Y(h²F+xhH).

This follows by a ring identity from the actual K matrices, not from interpolation. If a is the number of B letters, every nonzero row j of both states has nonnegative coefficients, no internal gaps in positive support, and upper endpoint j+a. The proof uses shifted support bounds, addition at a common endpoint, multiplication by x, and multiplication by x+1 or x+2. Each summand in the displayed recurrence has the same endpoint after accounting for its Y shift. Zero rows remain allowed.

For sourceWord28 path, the second state is exactly the inherited hresidualM511, by hresidual_diffM511, and the B count is the source numerator a. The proof therefore gives uniform interval support for every horizontal residual row, without a denominator or row cutoff. It does not assert log-concavity. An adjacent-to-CrossLC equivalence and a source raw transfer for 2j+1<=b are being checked separately. For larger j, canceling an extra binomial smoothing factor backwards would still be invalid.

The expanded alphabet admits an additional atomic operation, with M=hF+xH:

    A: (F,H) -> (Y M,F+H),
    C: (F,H) -> (F+Y h M,M),
    B=A followed by C.

The C operation has a lower-degree F term. Its support proof must not assume identical endpoints for every summand. The checked strengthened invariant records outer-degree bounds, a zero F row at index zero, and attained top coefficients in every remaining row. These conditions supply the missing endpoint for that lower-degree term. Starting after A, both operations preserve the invariant.

For the vertical integral matrices, take F=M.c+M.d and H=M.a+M.b-M.c-M.d. Prepending the original A acts by C above, while prepending the original B acts by A then C. Every source word ends in B, so right-to-left induction starts in the checked invariant. Consequently every vertical residual row i also has nonnegative interval support, ending at i+b whenever nonzero. No claim of arbitrary signed-matrix positivity is involved.

MarkovHorizontalIntervalMEA423 compiles the adjacent-to-CrossLC equivalence and the raw horizontal transfer under 2j+1<=b. MarkovVerticalIntervalMEA423 supplies the vertical counterparts under 2i+1<=a. The first six modules passed isolated kernel replay and permitted-axiom closure inspection (41 theorem closures). The later validation manifest is authoritative.

Exact finite checks passed 1,064,166 coefficients in the source scaling identity and 639,351 horizontal residual adjacent comparisons across all 449 reduced fractions with b<=38, retaining 91,614 zeros. The mixed same-row F/H adjacent condition had no failure in this scan. None of these finite observations is a proof.

The enlarged palindrome family A B A^n B B fails residual LC: n=24 gives row 4, coefficients at exponents 1,2,3 equal to 4,56,799, with 56²<4*799. This is an experimental non-source obstruction, not a refutation of Conjecture63. Thus palindromicity and the proved interval-support invariant alone cannot justify extending LC to every word.

The independent vertical recurrence implementation passed 548,836 coefficients in the source scaling identity and 443,294 residual adjacent comparisons across all 323 reduced fractions with b<=32, retaining 48,182 zeros. Its same-row F/H mixed comparison also had no failure. These are finite experiments and the full mixed or residual LC claims remain unproved.

MarkovResidualEndpointsMEA423 proves that either coordinate residual is zero exactly when its row index exceeds d=a+b-1. For a nonzero horizontal row j its degree is a+j; for a nonzero vertical row i its degree is b+i. It also proves the high-index identities

    R_horizontal,j=(1+x)^(2j+1-b) [v^j]P, when b<=2j+1,
    R_vertical,i=(1+x)^(2i+1-a) [u^i]P, when a<=2i+1.

These are identities in the direction opposite the low-index transfer. Log-concavity of their left side does not justify cancellation of the extra smoothing factor. No new unconditional raw LC region is claimed in this run. The exact pinned root residual remains MarkovResidualMF8, unchanged and unproved.

MarkovResidualLeadingMEA423 derives the exact top coefficients by extracting the common highest degree in the cleared source identity. They are choose(d,d-j)=choose(d,j) horizontally and choose(d,i) vertically. Thus the endpoint degree is attained with the original top-diagonal binomial coefficient, not an experimentally fitted value.

The further mixed-term probe tested 366,288 comparisons on 127 actual source states through b=20. Pairwise synchronization of all B-update summands fails already at source 1/7, row 2, starting exponent 1: the xH_j term gives [0,3,18], while h²F_(j-1) gives [2,5,4]. Their mixed gap is 2*3*5-0*4-2*18=-6. The full sum is not claimed to fail; this is a finite strategy obstruction. The same-row F/H observation cannot by itself justify an induction that adds all cross-row summands individually.

Final validation passed for all eight mathematical modules and 53 theorem closures. No whole-source rebuild or independent source/English completion audit occurred. No residual or raw LC hypothesis was discharged merely by these support theorems or scans.
