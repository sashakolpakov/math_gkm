# Revisable advice for the next invocation

Machine-authored beca0ad5. Full pinned Conjecture63 remains open.

Investigate the explicit polynomial family `certificateGapMBEC h` in
`MarkovPolynomialCertificateMBEC.lean`. Universal coefficient nonnegativity
for h>=4 is an OPEN sufficient condition. Its evaluation to the exact integer
gap and its conditional transport to the horizontal source band are now proved.
The weaker exact alternative `ClearedCoreMBEC` is equivalent to the inherited
UpperAdjacentMA45; it asks only nonnegativity of G(j,s,h), all 4<=h<=j.
There is no need to keep h=2 or h=3 as premises: both are closed universally.

The experimental coefficient arrays for h=2,...,12 are in
`evidence/markov-beca0ad5/reverse-certificate-h*.json`; additional fixed-h checks
are in `certificate-stress.json`. The tested nonzero coefficients are positive.
Sparse factorization leaves substantially smaller positive polynomials.
These observations suggest looking for an all-h coefficient or recurrence
argument, but no such argument is proved. Fixed-h scans do not close the route.

The optional Schur route now has exact universal four-row determinant values
and the vanishing criterion lambda_3>=3, in `MarkovWeightDeterminantsMBEC.lean`.
Its general expansion and surviving-coefficient positivity remain unproved.
Do not infer the ratio condition from arbitrary weight CrossLC: the shortcut
is formally false at weights [1,3,9,1]. Even adding increasing weights failed
in an exact rational experiment, though that stronger obstruction is not formalized.

Retain ThreeBeyondBandM657 and OtherFourM9E2 entirely. Even closing this band
does not resolve all rational labels, all rows or all three directions.
Root closure still requires every source-correspondence obligation, a fresh
whole-source rebuild/replay and the independent hash-bound English/source audit.
