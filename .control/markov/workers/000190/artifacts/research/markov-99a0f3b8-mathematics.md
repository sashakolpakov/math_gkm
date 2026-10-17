# Middle-row progress for the pinned Markov root

Machine-authored live request 99a0f3b808934dc5b239bd3d92eab1f5. Accepted local
scope is controlled by evidence/markov-99a0f3b8/validation.json, when present.
The full pinned Conjecture63 and its negation remain unproved.

Write b=3q+epsilon, where epsilon=1 for r=true and epsilon=2 for r=false,
and q>=1. A(c,j) denotes the unchanged integer raw coefficient of the actual
numerator-three source. Put t=b+2-j. The predecessor closed the upper sector
t<=q+2 and the lower half-plane was already closed. This work addresses the
intervening rows, not the previously finished fourth-moment attachment.

## Actual source representation

For every 0<=k<=q the new polynomial identity is

    row at j=b+2-(q+3+k) = topTemplate(b,q+3+k) + D(q,r,k).

Define G(q,r,k)=gainRows(q,r,q+epsilon-k). The correction is determined exactly by

    D0 = 4 X G0,
    D1 = 4 X G1 + 2(1-X)D0,
    D(k+2) = 4 X G(k+2) + 2(1-X)D(k+1) - (1+X)^2 Dk.

This follows from the actual source discriminant equation, including the
forcing term that vanishes in the predecessor upper sector. Natural subtraction
is guarded explicitly. MarkovMiddleCorrectionM99A proves the identity.
MarkovMiddleLocalityM99A proves deg(Dk)<=k+1, hence every coefficient at c>k+1
equals the template coefficient, including all exterior zeros.

MarkovMiddleParameterM99A proves the parameter identity and the exact diagonal
second difference

    D(q+4,k+2)-2D(q+2,k+1)+D(q,k) = 4 X G(q+2,k+2).

Along q=d+2k+2 the right side has nonnegative coefficients. The explicit initial
values are D0=8X or 4X, and

    D1 = 20X+(8q-8)X^2       for r=true,
    D1 = 16X+4qX^2          for r=false.

Induction proves coefficient nonnegativity and monotonicity along that
diagonal, and hence D(q,r,k)>=0 coefficientwise whenever 2k+2<=q.
The middle-strip condition 2(q+3+k)<=b implies this bound. Source majorization
and positivity for columns 2<=c<=t follow in MarkovMiddlePositiveSourceM99A.
No closure of log-concavity under addition is asserted.

## Wider finite-moment certificate

The inherited sixth-moment identity is reused with new positive polynomial
certificates. With its variables a=i+1 and H=d+2i+9, the five required signs
hold for a>=7, m>=2 on either domain

    6a+m+2 <= 2H,       or       9a+2m+32 <= 4H.

The expanded polynomials are checked by Lean ring normalization; positivity
of their Horner expressions supplies the signs. Both actual-weight generator
inequalities and the actual-weight sixth central-moment bound are retained.
This proves strict tail-gap positivity for i>=6, r>=1 when

    i+r <= d+5,         or       i+4r+5 <= 4d.

The old sufficient domain was i+r<=d+2. Four inherited small-column certificates,
the inherited first/fourth-column certificates and the zero tail complete the
new high-template transport. At physical column c>=3, for n>=2t, the template
inequality follows if

    3t <= n+8,          or       c>=9 and 12t+2 <= 4n+3c.

It is strict when c+2<=t. MarkovMiddleSecondM99A separately proves the template
columns 2,3,4 inequality for every t>=5 and n>=2t, removing its old sector
restriction entirely. All these statements are universal in their parameters.

## Raw-source consequences

The entire first middle row j=b-q-1 is weakly horizontally log-concave for every
q>=1, both residues, and every natural starting column c. For parameters with
2(q+3)<=b, D0 only changes column one, cancelling the negative template entry
there; columns zero and one of the source are zero. Columns >=2 use the new
template results. Smaller parameters use inherited lower-row results and two
finite exceptional cases, checked by ordinary `decide`, plus a universal zero
tail. MarkovMiddleFirstAllM99A includes explicit polygon triples for 2<=c and
c+2<=q+3. Thus the finite base cases do not restrict the universal denominator.

Farther into the middle strip, let t=q+3+k. Every raw horizontal inequality
holds if

    k<=q, 2t<=b, c>=9, k+1<c, 12t+2<=4b+3c.

It is strict for c+2<=t, and all three polygon memberships are proved in
MarkovMiddleRegionM99A. In integer terms the last bound is c>=4k+10 for
r=false and c>=4k+12 for r=true. This rephrasing is arithmetic explanation;
the displayed Lean theorem retains the original inequality. Both depth k and
denominator q are unbounded. Example: q=15,r=false,b=47,k=2,t=20,c=18,j=29
has raw values [815476219378480,224104213323320,28277527346376] and positive
gap 27163047335469835016455433920. This example is an experiment, not the proof.

The exact root equivalence is

    Conjecture63 <-> ThreeAfterMiddleM99A AND OtherFourM9E2.

The first proposition retains every horizontal case outside the inherited
upper region and the new MiddleClosedM99A, and retains the previous vertical
and constant-i+j clauses verbatim. OtherFourM9E2 is unchanged for all paths
with numerator at least four. Neither residual is proved.

## Failed shortcuts and experiments

Unrestricted positivity of each antidiagonal group is false. The checked
auxiliary integer witness is betaIntegerGroup(0,0,20,2)=-238694400. The actual
total top-mass coefficient gap at d=0,T=20,i=0 is nevertheless strictly positive.
MarkovMiddleObstructionM99A proves both facts. This is not a source-family
refutation and does not imply a negative coefficient gap anywhere in the root.

Finite correction tests passed positivity and adjacent LC in 1,946 cases,
but found negative cross terms between template and correction. For example
q=8,r=false,k=2,c=2 gives template [660,44024,824160] and correction [124,112,0].
Their cross gap is -92334464, while the actual sum gap is 1301845056.
Thus an argument requiring all cross terms nonnegative cannot be silently used.
Correction LC itself remains experimental and does not finish the source sum.

All source and shape experiments are separately recorded and are not universal
proof evidence. Full root closure still requires the remaining mathematics,
fresh whole-source rebuild and a separate independent hash-bound English/source
audit covering every correspondence obligation.
