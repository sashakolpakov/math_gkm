# Revisable next actions

Machine-authored d0292f142b0e4db995dc25f58edefaca. Full root remains open.
Use validation.json for accepted source hashes and exact validation scope.

The numerator-three middle coefficient now has a uniform short integer
binomial expression, middleRawMD02(x,k,r,c), with q=x+2k+B, B=5/4.
Its summation length depends on the column, not on k. This is a proved
source representation, including zeros, not an interpolated jet formula.

Investigate MiddleShortLCMD02: the TOTAL raw coefficient gap of this expression
is nonnegative for every x,k,c,r. MiddleNewtonMD02 is a stronger sufficient
condition asserting nonnegative mixed forward differences at (0,0). Finite
exact coefficient tests through starting column 18 passed; no uniform sign
proof is available. The new natural-binomial form avoids the invalid
nonnegative-real extension rejected by the predecessor's fractional example.

Do not try to prove componentwise positivity of the template/correction mixed
gap. It is now universally refuted: its first possible k-Newton coefficient,
of order c+2 for source starting column c+3, is negative for every c and both
residues. Its corresponding total raw inequality is not refuted. The 3/26
example demonstrates a positive total gap with a negative mixed gap.

A possible sufficient route is template-gap domination of the negative mixed
gap, retaining the correction's self-gap. Finite Newton tests support this,
with a substantial observed margin, but neither domination nor the required
general self-gap signs are proved. MarkovCorrectionNewtonMD02 proves only
Newton positivity of the correction coefficients themselves.

Another experimental candidate is the shifted-factorial top-mass inequality
(i+4)M(i+1)^2>=(i+5)M(i)M(i+2). It passed the recorded finite probes. The
unshifted factorial version is formally false at an actual source triple.
Blanket real-rootedness of the high-tail polynomial also fails exact tests.
No literature theorem has been connected to the surviving candidate.

The exact root is MiddleShortLCMD02 AND ThreeOutsideMiddleMD02 AND unchanged
OtherFourM9E2. All remain open. Keep all other rows, vertical and diagonal
directions, source families, zeros and endpoints. Completion still needs all
correspondence bridges, fresh whole-source validation and the independent
hash-bound English/source audit.
