# Revisable next actions

Machine-authored 418bcc64. Full pinned Conjecture63 remains open.

The first correction row is proved outside the variable window 7<=i<=d+2, where d=q-2 (true residue) or q-1 (false residue). The q=1 exception and all zero columns/tails are included. The exact root is now equivalent to FirstCorrectionWindowM418 AND ThreeBeyondCorrectionM418 AND OtherFourM9E2. Preserve all three predicates in full; their conjunction is not proved.

The main new route is AbsorbedMiddleM418. Use

    B(d,j,c,t;X) = liftPoly(j,t;X) + c*max(d-t,0)/(t+1)*X^t.

Its actual binomial-weighted value is exactly the first-correction output, including the clamped tail. The coefficientwise criterion for the old augmented polynomials remains false even after binomial weighting; the 3/19 formal witness has coefficient -2880 but positive raw source gap. Do not revisit that stronger criterion as if it were unproved.

The absorbed lower-cut criterion is needed only for j=d+2,c=4 or j=d+3,c=8, 4<=t<d and h<=t; all coefficients k remain included. Cuts above support and t>=d are proved. The criterion passed finite exact checks but is still open. A symbolic-in-G investigation at d=t+2+G passed t<=12; no induction or universal-in-t result follows.

At h=t the cut gap reduces exactly to three rational inequalities. The normalization B=choose(t+j+3,j) satisfies B>=j+1 (proved). Substituting B=j+1+Z yields positive GAP numerators for both source residues, separately for d=t+2+G and d=t+1. The weaker B>=1 relaxation fails the third coefficient certificate. Consult final validation.json before using MarkovAbsorbedBoundaryCertificateM418 or MarkovAbsorbedBoundarySourceM418: their initial build/candidate history includes a timeout, and only selected current-source successes are proved. MarkovAbsorbedBoundaryBridgeM418 and MarkovAbsorbedBoundaryModelM418 give exact algebraic transport. If the rational certificates are validated but their source-parameter substitution is not, that last bridge must still be completed.

Final status: both certificate attempts timed out (180s expanded denominator, 150s factored denominator); the certificate module is unvalidated and the generated source bridge was not compiled. Do not import them as established results or blindly repeat the same expensive ring steps. The selected exact model and boundary identities may support a smaller or differently represented certificate. The h=t band remains unproved.

The pre-composition Q shortcut has negative coefficients beyond the constant term and should not be assumed positive. No direct route from these partial results to every later correction row, the remaining vertical/diagonal regions, or numerator>=4 has been proved.

Discharge coverage, source-family, homogeneity/raw-coefficient, polygon, direction/zero/endpoint and assumption obligations; perform a fresh whole-source rebuild and independent hash-bound English/source audit before root completion.
