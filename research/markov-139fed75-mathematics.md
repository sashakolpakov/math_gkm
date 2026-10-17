# Mathematical results

Machine-authored live request 139fed75c29240ba95427717b28c29a7.
Full pinned Conjecture63 remains unresolved. No historical novelty is claimed.

Write A=1+X, j=q+k+1 and d=sourceN(q,r)-2j-1. The new uniform source theorem
applies to every q≥2, k≥0 and both residues, provided d is nonnegative in the
literal sense 2j+1≤sourceN. No natural-subtraction truncation is substituted
for this hypothesis. The source row equals

    lowerRow(sourceN,j) + X² A^d Q(q,r,k).

MarkovBandRecurrenceM139 proves this polynomial identity and its raw integer
coefficient version. MarkovBandTransportM139 connects it to every actual
numerator-three path and to the inherited factored-row LC criterion. The
criterion's positivity, coefficient-budget and scalar-margin assumptions remain
explicit. Other numerators, other directions, q=1 and the upper d<0 region
are not covered by this new source identity; no root obligation is discarded.

The construction is explicit. Fibonacci rows factor as X A^(n-2j-1) F(n,j),
where F is a finite binomial sum. The normalized forcing G is an explicit sum
of F's. Q_0=4G_0, Q_1=4G_1+2(1-X)Q_0, and

    Q_(k+2)=4G_(k+2)+2(1-X)Q_(k+1)-A²Q_k.

This is a signed recurrence, not a positivity proof. The following properties
are separately proved: degree Q≤k; the exact constant, linear and quadratic
coefficients; and leading coefficient 4 choose(q,k) for false residue and
8 choose(q-1,k) for true residue. In the source range the leading coefficient
is positive, so degree Q=k. MarkovBandSupportM139 retains the final nonzero
correction slot d+k+2 and proves vanishing beyond it.

The constant is 2(k+1)²(k+2) for false, 2(k+1)(k+2)² for true. In variables
q=d+2k+1 (false) or q=d+2k+2 (true), the linear coefficient satisfies

    30 Q_1 = k(k+1)(k+2)
      [5(3k+e)d + 3(3k+f)(k+3)],

with (e,f)=(1,2) or (5,7). This proves Q_1≥0. The exact quadratic expression
is bandQuadraticM139/1260 in MarkovBandBudgetObstructionM139. Its universal
proof uses the recurrence and checked polynomial identities; interpolation
only proposed the expression and is not used as proof evidence.

## Refuted coefficient-budget shortcut

The proposed universal bound Q_(m+1)≤Q_1 choose(j,m) is false. At q=73,
r=false, k=36, j=110, d=0, the kernel-checked coefficients are

    Q_1=21714264, Q_2=2390762400,
    Q_2-110 Q_1=2193360>0.

This factor belongs to the actual 3/221 source. The raw triple at
(2,110),(3,110),(4,110) is [104044,609161488,879400499960]; all three points
are polygon-valid and its gap is 279581372844535904>0. The formal source
attachment and raw calculations are in MarkovBandSourceWitnessM139.
Thus this is a refutation of an auxiliary hypothesis, not of Conjecture63.
The general transport with arbitrary c remains valid; it cannot be universally
instantiated with c=Q_1.

## Boundary reduction

A parameter-shift identity for Q is proved in MarkovBandShiftM139. With
P(d,k)=Q(d+2k+1,false,k), or Q(d+2k+2,true,k), it gives

    P(d+1,k+1)-P(d,k+1)
      =P(d+2,k)-P(d+1,k)+X P(d+2,k).

Consequently nonnegativity of all coefficients throughout this band is
equivalent to nonnegativity just at d=0. If that boundary hypothesis holds,
every coefficient is also nondecreasing in d. This is an exact conditional
reduction in MarkovBandBoundaryReductionM139; boundary nonnegativity remains
unproved.

A more explicit boundary candidate, for 0≤m≤k, is

    (2m+3) P(0,k)_m = 2 L choose(k+m+2,2m+2) choose(2m+2,m+1),

where L=3k+3-m (false) or 3k+m+6 (true). BandBoundaryFormulaM139 is a Prop
definition, not an axiom or an established identity. Its implication to
universal band nonnegativity is proved. The candidate matched 2652 finite
coefficient checks through k=50. A separate guessed discrete derivative
identity failed; its witnesses are retained in boundary-probe.json.

## Experimental scope

The direct source run covered 211 rows: 11860 coefficients including 5320
zeros, 11438 horizontal triples including 6118 polygon-valid triples, 770
budget tests and 595 residual adjacent tests. No failures occurred in that
small range. The wider d=0 budget scan through k=100 found 4825 budget
failures; the earliest saved one has q=63,k=31,m=3. The simpler m=1 witness
above was selected for formal certification. These are separate scan scopes.

A scalar diagnostic checked 120931 cases, with 245 failures. All ten s=8
failures occur beyond the correction support; none challenges an in-support
s≥8 candidate. This does not prove that candidate. The 182 Newton-interpolation
checks through k=12 found no negative coefficient, but give no universal
positivity assertion. All experiments are exact finite computations only.
