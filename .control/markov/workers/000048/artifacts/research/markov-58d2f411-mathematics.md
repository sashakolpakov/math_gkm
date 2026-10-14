# Top-face horizontal comparisons

Machine-authored request 58d2f4111d4e480ca66e64acbf12e225. No novelty claim.
The full pinned Conjecture63 remains unresolved. Formal status is specified
by the final validation manifest, not by draft files or this derivation.

For an actual source a/b, put d=a+b−1, N=b−1, B=a−1. Consider
the horizontal triple (i,j),(i+1,j),(i+2,j) with i+j+2=d. Let
L,M,R be its literal raw coefficients, and F=choose(i+j,i).
The inherited exact first three upper-diagonal identities give

    (i+1)M = F[N(i+1)+Bj],
    (i+1)(i+2)R = (i+j+1)(i+j+2)F,
    2(i+j)(i+j−1)L = TF,
    T = N(N−1)i(i−1)+2(BN+N−3B−1)ij+B(B−1)j(j−1).

Here N+B=i+j+1, B≥0 and N≥B+1. The last identity is used when
i+j≥2; coefficient zeros are retained, including i=0 and i=1.
These are integer coefficients cast to reals for algebra, without normalization
of the target or deletion of support zeros.

The new certificate establishes

    2N LR ≤ (N−1)M².

Writing D=i+j and K=N(i+1)+Bj, its cleared numerator is

    P=(N−1)D(D−1)(i+2)K²−N(i+1)(D+2)(D+1)T.

Use c=D−2B=N−B−1≥0. The checked certificate expresses
(2D)^3 P as a sum of nonnegative monomials in i−2,j,2B,c
when i≥2. Separate certificates use j−1,2B,c for i=1 and
j−2,2B,c for i=0. They contain respectively 108,29,29 nonzero
monomials. The equality and positivity are checked by ordinary Lean ring
and order reasoning. No floating-point test enters this proof.

Multiplying the desired scaled gap by D(D−1)(i+1)^2(i+2)
gives F²P exactly. All factors cancelled are strictly positive in their
stated ranges. The raw horizontal inequality follows by nonnegativity of
L and R and N−1>0. The remaining low-degree polygon cases force j=0
and use the inherited raw boundary theorem. The final source theorem thus
concerns every path and every admissible horizontal triple whose rightmost
point is on the top face. It does not cover arbitrary interior triples.

## Experiments and rejected paths

The fixed-y-coefficient Sturm probe stopped at ABA, j=2, with
x²(14+28x+15x²). Inspection showed that this is the previously proved
2/5 obstruction in MarkovHorizontalExampleB46. It is a rediscovery, not
a new result, and the coefficients satisfy raw LC.

The exact top-layer probe checked 277139 polygon triples across 2924 reduced
fractions (a≤80,b≤100), with no failure of the stronger bound. It also checked
2332 formula identities against the independent positive transfer through
b≤20. One low-degree triple was outside the experiment's third-layer formula
range and explicitly counted separately. These tests are not proofs.

An initial auxiliary certificate used N+B=D+2. The final source bridge
rejected that relation. It was corrected to N+B=D+1, and all certificates
were regenerated. Earlier checks of the different auxiliary statement do not
certify the final theorem. Build snapshots and failed outputs are retained.
The first positivity proof timed out; a direct positive-factor cancellation
replaced an unnecessarily large nonlinear arithmetic step. An attempted
targeted process stop failed because process listing is unavailable; the
validator's own foreground timeout remains effective. No controller change
was made and no external action remains pending.

The published target was read live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html . Hosted
searches supplied no theorem used as an axiom or proof premise.
