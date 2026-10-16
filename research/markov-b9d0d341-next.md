# Revisable next actions

The full pinned root remains open. Retain all unresolved clauses of the latest
validated residual, MarkovResidualMB9D.lean,
whose only change concerns vertical starting row j=1 for b>=3a. Check the
validation inventory before relying on a source file.

Consider extending this strip to 2a<=b<=3a. The general scaled coefficient
formulas are in probe_strip_b9d0d341.py and tested independently against the
subtractive recurrence in experiment_strip_b9d0d341.py. The substitution
a=(k+l+2+t)/3 with q=u=0 gives nonnegative exact coefficient expansions in
all 18 probed index charts (middle-strip-candidates.json). This is not a Lean
proof. The third row now has the extra term 24t X before its cubic factor;
its shifted-binomial adapter and the positive-scalar transfer must be proved.
No independent upper bound on t was needed by these candidate expansions.

The other source slope ranges use q=2a-b, t=b-a and u=max(3a-2b,0), and
remain pending. Keep the actual source statistics: simply treating the three
statistics as independent can destroy useful positivity. Negative monomial
coefficients in one coordinate chart are not counterexamples.

Higher vertical starting rows, all remaining horizontal rows and deeper
diagonals remain full obligations. Every source-correspondence obligation,
fresh root rebuild and independent hash-bound English/source audit is required
before a completion claim. Neither these experiments nor the strip theorem
resolves the exact root.
