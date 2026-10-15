# Revisable next actions

The exact root remains open. Read the final source-bound inventory in
`evidence/markov-94b1de05/validation.json`; exclude failed/draft modules.

The backwards formula gives a shorter route to the remaining fourth-slice
middle interval than expanding all forward convolutions. With the corrected
numerator blocks H0,...,H4, the entire reflected numerator should decompose as

    reflect(4n+15) Q = reflect15 H4
      + X^(n+1) reflect14 H3
      + X^(2n+2) reflect13 H2
      + X^(3n+3) reflect12 H1
      + X^(4n+3) reflect12 H0.

This displayed decomposition is a proposed next identity, not a checked
theorem in this run. Reflect P at 4n+7. At an original coefficient j, put
t=4n+7-j. For j>=2n+6 the last three blocks should not contribute. Thus the
remaining coefficient is the sum of two binomial convolutions. At j=3n+k,
the additional H3 convolution has index 6-k: the six onset offsets k=1..6
need only finite expressions, while k>=7 is the one-block regime addressed
here. At j=2n+k with k>=6 the H3 convolution index is n+6-k. This may provide
a simpler formal source bridge for the inherited second-block candidates.

The new backward_coeff_generalM94 already generalizes the fixed highest-block
degree 15 to a parameter s+8, with P reflected at m+s; consult its final validation receipt. Reflection then handles the two top
blocks together. Preserve natural-subtraction guards and zero coefficients.
The six full chamber identities already exist. The saved candidate positivity
certificates remain experiments until each exact identity is checked.

The combined inherited prefix j<=2n and accepted final interval
j>=3n+7 leave 2n<j<3n+7 for n>=4,c>=5, subject to the polygon upper bound
j<=4n+5. Runs 4,5,6 need their remaining finite-run/unbounded-predecessor
certificates. Runs 0..3 have inherited results, which must be checked against
their exact hypotheses before assembly. Small cycles c=2,3,4, higher slices
and horizontal/vertical interiors remain separate root obligations.

For large polynomial gaps, group by the offset variable first. All polynomial
columns must be retained, including the zero top columns: the cancelled
degrees 13 and 14 still need formal identities before treating the column
values as opaque. Direct full gap expansion timed out in this run.

Any exact-root completion still requires all seven source-correspondence
obligations, fresh whole-source rebuild, kernel/axiom checks and a separate
hash-bound independent source/English audit.
