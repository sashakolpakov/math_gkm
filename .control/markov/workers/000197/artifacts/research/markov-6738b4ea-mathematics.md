# Weaker template margin and six remaining middle columns

Machine-authored live research request 6738b4ea67b64d608769e0669c472752.
The full pinned Conjecture63 and its negation remain unresolved.
Final validation status is recorded in evidence/markov-6738b4ea/validation.json.

Use the inherited exact parameterization B=5 for r=true and B=4 otherwise,
q=x+2k+B, j=b-q-k-1, and physical starting column c+3. The raw coefficient
is R_c=A_c+C_c, where A_c=topMassM55C x (x+3k+B) c and C_c is the full
correctionShortMD02 expression. All parameters are natural, both residues
are retained, and the formula includes zero coefficients.

## Weaker margin

The inherited correction estimate is 3^(c+2) C_c <= 21 A_c. For c>=7,

    84 (8(c+4)+1) <= 3^(c+2).

Consequently the quantitative template condition

    8(c+4) A_(c+1)^2 >= (8(c+4)+1) A_c A_(c+2)

implies the complete raw inequality R_(c+1)^2 >= R_c R_(c+2).
MarkovWeakMarginM673 proves this using the inherited positive perturbation
lemma. The negative mixed contributions and the correction product are
controlled in the total inequality; none is discarded or asserted positive.

For the actual template weights, let M be the mass, E the spectral excess,
V the unnormalized variance, and D=2c+d+10. The exact scaled gap identity
identifies the weaker margin with nonnegativity of

    (15c+47) E^2 + (c+1)(8(c+4)+1) D M E
      - (c+1)(8(c+4)+1) V.

The source weights and their modified endpoint are the same as in the
predecessor's proved deficit-moment attachment. Write T=c+r, H=r+2c+d+9,
L=(c+1)(r-1)H-r(2r+c+1), and S=c(c+1)+6r(c+1)+6r^2.
The new sufficient scalar polynomial is

    (15c+47)L^2(c+4)
      +(H-r+1)L(c+1)(8(c+4)+1)(c+3)(c+4)
      -(H+r)^2 S(c+1)(8(c+4)+1)(c+3).

After c=16+x, r=3+y, H=r+2c+9+z, its 76 nonzero monomial
coefficients are positive. Ordinary Lean ring reasoning checks the expansion
and positivity; a separate expansion proves L>0. MarkovWeakAttachmentM673
applies the inherited actual first and second deficit bounds and the actual
spectral identities. There is no remaining arbitrary-weight assumption.

MarkovMiddleNineteenM673 proves every middle raw inequality with c>=16,
including the last supported triple via the inherited exact tail inequality,
and every zero tail directly. Its path theorem covers every numerator-three
generated path with the stated middle-row guard. Its polygon theorem explicitly
checks all three positions when the right neighbor is supported.

## Lower fixed columns with unbounded parameters

MarkovDenseIntegerM673 gives an ordinary-kernel integer expression evaluator
and dense coefficient sign checker. MarkovTemplateIntegerM673 proves the
factorial-cleared representation of the complete template sum. For column c,
the coefficient scale is (2c+5)!, and the gap scale is

    (2c+5)! (2c+9)! ((2c+7)!)^2 > 0.

The transfer theorem removes this scale. No normalization changes the target.
The checked certificates MarkovTemplateC5M673 through MarkovTemplateC9M673
prove, for all d,T with c+2<=T,

    (c+4) A_(c+1)^2 >= (c+5) A_c A_(c+2).

Together with the complete correction bound and explicit zero-tail handling,
these close physical starting columns 8 through 12 for every middle parameter.
Their finite column indices do not bound d,T,x,k or the denominator.

The final compiled exact equivalence is

    Conjecture63 iff MiddleSixColumnsM673
      and ThreeOutsideMiddleMD02 and OtherFourM9E2.

MiddleSixColumnsM673 has 10<=c<16, k>=3, arbitrary x, both residues,
and the inherited cone guard. Thus physical starting columns 13..18 remain
in this middle-strip residual. The other two root conditions are unchanged.

## Unaccepted attempts and experiments

Exact symbolic probes produced positive template gap coefficients for c=5..15,
with 494 through 2,184 entries. Only c=5..9 have accepted certificate builds.
Larger direct checks and two attempts to use the factorial implementation of
Nat.choose timed out. MarkovTemplateFastM673 itself proves the representation
identity, but no success of a larger certificate is inferred from that identity.
The full middle closure and seven-row residual drafts are unbuilt/unaccepted.
Their declarations must not be imported as established results.

The source experiment passed 29,172 raw coefficient comparisons and relative
bounds, retaining 2,845 zeros; 15,028 weaker-template checks; 9,724 lower-column
strong-template checks; and 907,150 polygon-valid triples in all three directions.
These are finite exact computations, not proofs. The full root remains open.
