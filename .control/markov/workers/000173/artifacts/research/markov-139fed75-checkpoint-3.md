# Checkpoint 3: budget obstruction

Machine-authored 139fed75. The previously proposed universal budget with c=Q_1
is false. This is now a compiled Lean theorem in MarkovBandBudgetObstructionM139,
using new universal formulas for the first and second coefficients. For
q=73, r=false, k=36, j=110, d=0:

    Q_1=21,714,264,
    Q_2=2,390,762,400 > 110 Q_1=2,388,569,040.

The source-factor theorem attaches Q to the actual numerator-three source.
The direct recurrence experiment identifies fraction 3/221 and the valid raw
triple at (2,110),(3,110),(4,110):
[104044,609161488,879400499960], with positive gap 279581372844535904.
Formal verification of these raw numbers is under validation. This is not
a counterexample to Conjecture63. The general transport allowing arbitrary c
remains valid; the specific proposed choice c=Q_1 fails.

A new parameter-shift recurrence is proved and reduces nonnegativity of Q
throughout the band exactly to d=0. A hypergeometric boundary identity is
stated as BandBoundaryFormulaM139 and experimentally checked through k=50;
it remains unproved. Conditional propagation is explicit, not an axiom.

The scalar scan's ten s=8 failures all occur after the correction's support,
so they do not refute a useful in-support threshold. The budget failures above
are genuine failures of the universal coefficient hypothesis, independent of
that scalar distinction. Preserve both diagnostics and their scopes.
