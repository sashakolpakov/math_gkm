# Checked representation and discrete target

Machine-authored d0292f142b0e4db995dc25f58edefaca. Full root remains open.

MarkovMiddleKernelMD02 and MarkovMiddleKernelSourceMD02 compiled: the weighted
gain sum is now an exact finite integer-binomial formula, uniformly in the
column and row depth. MarkovMiddleKernelShapeMD02 proves the correction at
column c+3 is strictly positive exactly when c+2<=k, and zero otherwise.

Put B=true?5:4, q=x+2k+B. MarkovMiddleDiscreteMD02 identifies the actual raw
middle coefficient with middleRawMD02(x,k,r,c), using only natural binomials.
It proves that nonnegative mixed forward differences of the TOTAL gap would
imply every horizontal inequality in this strip. This sign premise is open.
The generic Newton expansion is reused from earlier MarkovNewtonM295 with
fresh compilation under MD02 names; its old compiled module was unavailable
on the inherited import path. No new mathematical novelty is claimed for it.

MarkovMiddleShortResidualMD02 compiled the exact equivalence

    Conjecture63 iff MiddleShortLCMD02 and ThreeOutsideMiddleMD02 and OtherFourM9E2.

All three conditions are unproved. The new Newton condition is stronger and
sufficient, not equivalent to the raw gap condition.

Finite probes through starting column 18 support total-gap Newton positivity.
Cross-gap Newton coefficients are negative; componentwise addition shortcuts
remain invalid. Template self-gap dominates those tested negatives, but this
is not a uniform theorem. A shifted-factorial strengthening passed 101871
finite top-mass tests and Newton-coefficient tests through index 15. The
unshifted factorial strengthening fails (d,T,i)=(0,7,0). These are proposed
route diagnostics, not a change to the target or a source refutation.

The current draft MarkovCorrectionNewtonMD02 attempts to prove nonnegativity
of every mixed Newton coefficient of the correction alone. This does not
establish the total-gap sign premise.
