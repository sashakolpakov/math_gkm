# Universal top scalar closed

Machine-authored 09fffb56. Full pinned Conjecture63 still unresolved.

MarkovWeightedSeparationM09F proves the weighted two-binomial estimate directly
by induction; MarkovBaseCurvatureM09F supplies the sharper base curvature.
MarkovCorrectionBudgetM09F and MarkovTopScalarM09F close the clamped regime.
MarkovChooseGrowthM09F and MarkovAbsorbedBudgetM09F compare linear endpoint growth
against binomial base growth, closing every k>=1 without any d bound.
MarkovZeroBandBudgetM09F includes k=0, both residues and the clamped endpoint.
The combined closure module is MarkovSharpScalarsClosedM09F.

The new uniform budget is C(s+9,4)*U_s <= (s+3)*B_s for s>=3, all d,k and
both residues. The inherited bound used 3(s+3) and required d<=s. The new bound
attaches to actual raw source coefficients through the previously proved
kernel weighting, with no clamp hypothesis. This is not itself source LC.

SharpTopScalarsMBE3 is discharged. The complete convolution margin
SharpCompleteMarginMBE3 remains unproved and is sufficient, alone, for the
horizontal correction-band inequalities. ThreeBeyondBandM657 and OtherFourM9E2
remain intact; no full-root residual clause has been removed.

Finite exact source experiment: 449 rows, 36,521 coefficients (16,284 zeros),
35,623 raw triples, 19,339 polygon-valid triples and 33,827 sharper source bounds;
no failure. Separate finite budget checks: 14,608 cases (5,500 positive-clamp),
12,666 top scalars; no failure. These are experiments, not proofs.
Receipts: evidence/markov-09fffb56/source-experiment.json, budget-experiment.json.
