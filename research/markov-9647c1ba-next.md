# Revisable next actions

Machine-authored 9647c1ba. Full pinned Conjecture63 remains open.

The complete third correction row is now proved. Do not repeat it.
Use `third_correction_closedM964`, `source_lower_third_pathM964`, and
`root_iff_beyond_thirdM964` in MarkovThirdClosedM964. The exact remaining root
is ThreeBeyondThirdM964 ∧ OtherFourM9E2. Retain both completely.

A possible next action is a uniform correction-band theorem, rather than
another row-specific proof. The new arbitrary-polynomial budget and exact
factored-row transport are in MarkovLiftBudgetM964, MarkovCorrectionBudgetM964
and MarkovFactoredRowM964. The remaining tasks for that route are actual source
factorization, a coefficient bound, the scalar margin, and columns where the
margin fails. None of those universal source assertions follows from the scan.

For j=q+k and d=sourceN(q,r)−2j−1≥0, the finite data suggest

    rawRow = lowerRow + X²(1+X)^d Q_(q,k,r),
    deg Q≤k−1, Q_m≥0,
    Q_(m+1)≤Q_1 choose(j,m).

The first two residual coefficients matched these candidates in the saved data:

    false: Q_0=2k²(k+1),
    true:  Q_0=2k(k+1)²;

    false: Q_1=k(k−1)(k+1)(3k−2)q/6
                 −k(k−1)(k−2)(k+1)(21k−8)/30;
    true:  Q_1=k(k−1)(k+1)(3k+2)q/6
                 −k(k−1)(k+1)(3k−4)(7k+6)/30.

These formulas were inferred from exact data, then checked on all saved rows
with k≥2. They are not Lean theorems. The scan used only the eight specified
q values through 40, not universal rational coverage.

For a source factor Q satisfying the budget, choose
U=Q_0*d/(s+1)+Q_1 and B=choose(s+j+3,j). The general criterion needs

    (B+U)² M ≤ B² M+(B+U)² N,

with the existing complete-kernel M,N. The stronger tested sufficient bound
(2BU+U²)M≤B²N failed in 251 early-column instances, including eleven at s=7.
All tested s≥8 passed, but this is only a candidate threshold. Inspect
evidence/markov-9647c1ba/band-experiment.json before pursuing it.

The first band-probe scalar results are invalid because they used the weighted
lower output instead of the complete-kernel constant coefficient for M. That
run is preserved as band-first-run.py/json; use the corrected final experiment.

The third-row scalar certificates failed with the earlier degree-seven lower
binomial base. The final degree-ten base and the factor j in the second-slot
budget are essential to the actual checked proof, not licensed substitutions.

This band only concerns numerator-three horizontal rows in the d≥0 region.
The rest of the horizontal domain, vertical and constant-i+j directions,
other numerators, all zeros and both endpoints remain required. Exact root
closure additionally requires the full source rebuild, kernel/axiom checks,
all correspondence bridges and independent hash-bound English/source audit.
No external action request is waiting for a supervisor.
