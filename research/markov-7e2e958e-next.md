# Revisable research advice

Machine-authored 7e2e958e. Full Conjecture63 remains open. Preserve ThreeRemainingMAE9 AND OtherFourM9E2 in full; no new complete source direction was proved.

The predecessor's full Laurent-extension gap positivity is now proved through its polynomial realization E_(j,t)=reflect_j(Q_(j,t)(1+X)). MarkovQShapeM7E2 and MarkovExtendedShapeM7E2 establish every coefficient's nonnegativity for all parameters. MarkovQSourceM7E2 gives the exact lift-kernel coefficient bridge. See markov-7e2e958e-mathematics.md.

The unresolved LC-positive condition now has the exact auxiliary reduction LiftLCPositiveM7E2 iff LiftBoundaryM7E2. The remaining domain is h<=t<j+h, or t=h+v with 0<=v<j. The untruncated tail and the zero-left-polynomial case are proved. The general LC-positive-to-binomial-weighted-output transport still needs a formal proof before this condition can be used to conclude all lower source horizontal inequalities.

A possible uniform route is normalized symmetric-pair monotonicity. For the extended kernel K_t(r)=L(j,t,t-r), form

    Z(r,s)=2-[K_(t-1)(r)K_(t+1)(s)+K_(t+1)(r)K_(t-1)(s)]/[K_t(r)K_t(s)]

where t>=1 and both denominator factors are positive, with r+s fixed and r<=s. Reversed indices may be negative. Exact tests found 396,270 successive inward comparisons nondecreasing (j<=35,t<=2j+2). This is not a theorem. A proof of this monotonicity, combined with the now-proved full coefficient sum, could establish the needed centered truncated sums. Outer terms with zero current factors must be handled separately; do not divide by zero. The signed-pair-to-truncated-gap and binomial-weighting bridges also remain explicit proof tasks.

MarkovKernelStepM7E2 supplies an exact recurrence useful for this algebra. With W(j,t,m)=liftWeightMAE9 j t m, fixing r=t-m gives

    W(j,t,t-r)=r^2+(4j+7)r+4j^2+16j+2t+20,
    W(j,t+1,m+1)=W(j,t,m)+2.

The literal kernel's cleared adjacent-(t,m) ratio is proved for m+1<=j. Boundary support cases require their own use of zero tails.

For a smaller first step, boundary_probe_7e2e958e.py derives exact rational polynomial candidate certificates for the cut h=t (v=0). For j>=2,t>=0 all coefficients of its three cleared gap numerators after j=S+2 are nonnegative (87,75,55 terms). These are unvalidated algebraic candidates, not new Lean inequalities. j=1 is separately simple: L(1,t,0)=t+8 and L(1,t,1)=t+5. Do not silently apply the j>=2 certificate at j=1.

Do not infer truncation preservation merely from coefficientwise parameter LC and CrossLC of each polynomial. MarkovTruncationObstructionM7E2 disproves that inference with full gap 4+4X+X^2 and truncated gap X-1. The older midpoint criteria also fail; the source-range witness is in auxiliary-experiments.json and is not a source counterexample.

Any root closure still requires all source/English correspondence obligations, fresh whole-source rebuilding, kernel replay, and the separate independent hash-bound audit. No current auxiliary or experimental result substitutes for them.
