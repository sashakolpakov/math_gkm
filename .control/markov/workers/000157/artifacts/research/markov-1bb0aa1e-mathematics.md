# First correction row and new raw source inequalities

Machine-authored request 1bb0aa1ee066482294f620401d001bf2.
The pinned full Conjecture63 remains unresolved; completion is null.

Use n=3q+1 for the true branch and n=3q+2 for the false branch, q>=1.
P is the inherited source numerator, L its lower triangular auxiliary
solution. Every coefficient is the literal raw integer coefficient in u=x²,
v=y², with the third homogeneous variable set to one.

The new first-row theorem holds for every natural column, including zeros:

 P(i,q+1)=L(n,i,q+1)+C(q,r,i).

C is zero for i<2. For i>=2 it is

 true branch, q>=2: 8 C(q-2,i-2);
 false branch, q>=1: 4 C(q-1,i-2);
 true branch, q=1: 8(-1)^(i-2).

MarkovTailCorrectionM1BB proves the forcing discrepancy and its second-order
column recurrence. MarkovTailBinomialM1BB solves the recurrence by two Pascal
steps and explicitly treats the alternating exception. MarkovFirstRowM1BB
states the complete source identity and its path transport. The correction
is an auxiliary difference: a negative entry is not a negative source
coefficient. At the actual 3/4 source the valid column-three triple [1,8,26]
satisfies strict raw LC although its final correction is -8.

MarkovTailSourceM1BB proves, at row q+1,

 A(2,q+1)=8 or 4,
 A(3,q+1)=lowThree(q+1)+[8(q-2) or 4(q-1)],
 A(4,q+1)=lowFour(n,q+1)+[4(q-2)(q-3) or 2(q-1)(q-2)].

Here lowThree and lowFour are the previously proved lower expressions;
the alternatives follow the true/false branch order. The source proof
works at q=1 and does not extrapolate a negative ordinary-polynomial power.

MarkovCrossCertificateM1BB proves four exact positive polynomial gap
certificates in k=q-1, plus strict LC of lowThree. Rational casts are used
only for polynomial algebra; MarkovCrossingLCM1BB transports the result back
to raw integer inequalities:

 for every q>=1, both branches, i=3 or i=4, and j+1<=q,
 A(i,j) A(i,j+2) < A(i,j+1)^2.

This includes the new crossing triple ending at q+1. The exact reduction in
MarkovResidualM1BB is

 Conjecture63 <-> ThreeRemainingM1BB and OtherFourM9E2.

ThreeRemaining retains every horizontal and constant-sum diagonal inequality
and every vertical triple outside the displayed new range. OtherFourM9E2 is
unchanged, including its earlier reverse-factor ranges. Neither residual is
proved. crossing_gain_unboundedM1BB explicitly supplies a polygon-valid
new crossing triple for every natural j and either of columns 3,4, using
threePathM9E2 j r. Thus the new result has no hidden finite denominator bound.

The eight new modules compiled and passed joint isolated kernel replay;
their 43 named theorems passed explicit axiom-closure checks. Predecessor
worker 156's twelve modules separately passed renewed joint replay and all
44 theorem closures passed audits. Its previously timed-out final checks
are not retroactively described as successful. Exact receipts are bound in
evidence/markov-1bb0aa1e/validation.json.

Finite experiments and two proposed row recurrences are separate evidence.
See tail-experiments.json, lower-row-experiments.json and
correction-band-experiments.json. The lower-row and correction-band universal
bridges and LC properties remain unproved. The cubic lower-row residual at
3/10 has negative discriminant; real-rootedness cannot be a general premise
of that proposed route. This is not a source refutation.
