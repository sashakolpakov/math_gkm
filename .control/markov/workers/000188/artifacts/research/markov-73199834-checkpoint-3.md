# Checkpoint 3 — checked representations and margin

MarkovTopIntegerDensityM731 and MarkovTopIntegerResidualM731 compile. They prove
the binomial form of the actual q factor, the exact integer-group rescaling,
and sign equivalence of its total with the inherited tail gap. TopIntegerWedgeM731
is exactly equivalent to the current unresolved upper moment condition. This is
an auxiliary representation change; the underlying density is also the inherited
topKernel evaluated at i+k. It is not a new independent source identification.

The inherited first-central margin now compiles in separate definitions,
identity, and margin modules. The final automatic positivity call was replaced
by an explicit product-of-positive-factors proof. That change resolved the
timeout after both expanded and Horner versions had timed out. The full
endpoint attachment is currently being checked, not yet accepted.

A separate exact positive polynomial certificate for the raw columns 4,5,6
is generated. It uses the inherited universal short-sum representation and
154 positive coefficients; these counts carry no decision reward. Its Lean
validation and source transport are in progress.

Finite source checks passed 23,472 coefficient comparisons retaining 3,838
zeros, and 488,872 polygon-valid triples across all directions. Experiments
are not proofs. Full Conjecture63 remains open.
