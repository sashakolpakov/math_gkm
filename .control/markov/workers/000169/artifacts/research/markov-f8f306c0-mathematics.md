# Mathematical checkpoint

Machine-authored live request f8f306c0701a4692b57e05ac3c809fa5.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. Completion is null.
Source-bound compilation, replay and axiom receipts in validation.json determine
the validated selection; experiments and candidate expressions are not proofs.

## Closed absorbed-kernel boundary

Keep the inherited absorbed polynomial

    B(d,j,c,t;X) = liftPoly(j,t;X) + alpha(d,t,c) X^t,
    alpha(d,t,c) = c * (d-t : natural subtraction)/(t+1).

Let G(d,j,t,h,c) be cut_h(B_{t+1})^2-cut_h(B_t)cut_h(B_{t+2}).
MarkovAbsorbedLocalMF8F defines precisely this polynomial, without normalization.
For the source parameters j=d+2,c=4 or j=d+3,c=8, the new theorem
absorbed_boundary_sourceMF8F proves every coefficient of G(d,j,t,t,c)
nonnegative whenever 4<=t<d. The case d=t+1 uses the actual clamped zero at
t+2; it is not replaced by a negative rational correction.

Twelve rational certificates cover the two source residues, the cases d=t+1
and d=t+2+g, and the three possibly nonzero coefficients. They use t=4+x and
the exact normalization B0=choose(t+j+3,j)=j+1+z with z>=0. The inherited
binomial lower bound supplies that last hypothesis. Each certificate is an
ordinary Lean proof of a rational identity followed by positivity. Python
generated the Horner numerators but did not add assertions to Lean.

The new files MarkovBoundary201MF8F through MarkovBoundary313MF8F use common
denominators with fewer repeated factors than the timed-out predecessor
attempts, and separate each case into its own module. Four
MarkovBoundarySource*MF8F modules prove exact parameter/cast transport to
the inherited boundary model. MarkovBoundaryClosedMF8F combines all cases.
No unvalidated predecessor certificate is imported.

## Localization and two exact remaining tests

MarkovAbsorbedLocalMF8F proves, for arbitrary c, that the coefficient of G at
k<t+h is exactly the inherited lift-cut gap coefficient, and that it is zero
for k>2t+2. Consequently the former is nonnegative by the already established
unperturbed lift theorem. Together with the newly closed h=t boundary,
AbsorbedMiddleM418 is equivalent to AbsorbedInteriorBandMF8F, retaining
4<=t<d, h<t and t+h<=k<=2t+2, both residues, and all zeros.

MarkovAbsorbedTwoTestsMF8F gives a further exact reduction. If A,C have
nonnegative coefficients and B has degree at most n, then for k>=n+h,

    coeff_k(B^2-AC) <= coeff_k(cut_h(B)^2-cut_h(A)cut_h(C)).

Indeed a discarded pair has one index below h; its other index exceeds n,
so its B-product is zero and its entire signed summand is nonpositive.
This is proved directly from the coefficient convolution, including zero
factors. Applied with n=t+1, every affected coefficient k>t+h follows from
the uncut gap. The remaining coefficient is exactly k=t+h. Thus

    AbsorbedMiddleM418 iff AbsorbedUncutMF8F and AbsorbedBorderMF8F.

Both predicates remain unproved. The uncut predicate retains every
t<=k<=2t+2; the border predicate retains every h<t. This equivalence concerns
the auxiliary sufficient criterion, not an equivalence of either predicate
alone with the published conjecture.

## Exact border margin and a possible propagation principle

MarkovAbsorbedBorderMF8F proves the full perturbation identity and, for h<=t,

    coeff_(t+h) G = coeff_(t+h) liftCutGap(j,t,h)
                     - alpha(d,t,c) L(j,t+2,t+2-h),

where L is the existing integer liftTermMAE9. This gives the exact equivalent
predicate AbsorbedBorderMarginMF8F: a quantitative lower bound on the old
nonnegative lift gap. Mere nonnegativity of that old gap is insufficient.

MarkovBorderDominanceMF8F introduces an unproved source-independent candidate
for all t>=4,j>=t+3,h<=t:

    gap(j,t,t;2t) * L(j,t+2,t+2-h)
      <= gap(j,t,h;t+h) * L(j,t+2,2).

The file proves that this candidate propagates the now-established h=t source
boundary to every source border. The cancellation uses explicitly proved
strict positivity of L(j,t+2,2); no zero denominator is silently discarded.
Thus AbsorbedUncutMF8F plus BorderDominanceMF8F suffices for the entire first
correction row. This is a conditional result, not a proof of either premise.
The exact implication to the root also retains ThreeBeyondCorrectionM418 and
OtherFourM9E2 without changing them.

## Experiments and rejected routes

The exact rational structure probe covers d=5,...,40 and 4<=t<d in both
residues. It checked 83,472 complete extended-kernel gap coefficients,
22,200 normalized border values (successive values were nondecreasing), and
662,004 normalized pair steps, with no recorded failures. These are finite
tests and establish none of the universal predicates above.

A stronger relaxed normalized-edge candidate passed a separate 7,395-case
interactive rational probe. GAP then computed a rational representation with
24,434 numerator terms and 22,589 denominator terms, all nonnegative, after
t=4+T,m=2+M,j=m+J,B0=j+1+Z. This remains a symbolic experiment. It relaxes
the two relevant corrections upward to 8j/(t+1); its source transport and
positivity have not been proved in Lean. The first attempted reduction script
had a generated variable-name error; the corrected polynomial-gcd reduction
timed out at 60 seconds. Do not import that experiment as a certificate.

The source experiment checks selected q values 1,2,5,6,10,20,40,64,80,96 in
both residues against the actual recurrence, retaining zero columns, tails,
polygon guards and the q=1 exception. Its exact final counts are recorded in
evidence/markov-f8f306c0/source-experiment.json. A preceding cumulative q<=96
attempt was intentionally interrupted before completion and supplies no
claimed scan result; its source and interruption record are preserved.

These results do not prove a new entire source direction, later correction
rows, general numerator>=4 cases, or any refutation of the exact root.
