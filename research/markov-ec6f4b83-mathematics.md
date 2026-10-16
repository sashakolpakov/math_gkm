# Entire numerator-two horizontal theorem

Machine-authored request ec6f4b83e32c444bb048bd75468b418d. Local proof scope;
the full pinned Conjecture63 remains unresolved.

The principal result is source_two_horizontal_allMEC6 in
MarkovUpperGlobalMEC6. For every finite Boolean path with middle label a=2,
and every natural i,j, it proves the raw integer inequality

    A(i,j) A(i+2,j) <= A(i+1,j)^2.

There is no bound on the denominator, row or column. Zeros are retained,
including indices outside the polygon. The polygon-restricted version is
numerator_two_horizontalMEC6. It closes the exact horizontal subproblem
NumeratorTwoHorizontalM2B3 previously reduced to UpperBinomialLCM2B3.
It does not close either other direction, other numerators, or the exact root.

## Upper summands

Use the inherited exact positive formula, with N,d>=1, q=N+d and j=N+2d:

    U(N,d,i) = sum_h T(N,d,i,h),
    T(N,d,i,h) = C(2d+h-1,h) K(N,i,h),
    K(N,i,h) = C(2i-2-h,i-h)
               [C(N+i-h+1,2i-1-h)+C(N+i-h,2i-1-h)].

The actual definition uses natural subtraction and explicitly sets T=0 for
i=0 or h>i. No altered convention is substituted. A nonzero T implies
1<=i<=N+2 and h<=i. Thus if both factors on the left of the desired comparison
are nonzero, i<=N. Otherwise nonnegativity proves the comparison directly.

The proved global comparison is

    T(i,h) T(i+2,k) <= T(i+1,min(h+1,k)) T(i+1,max(h+1,k)-1).

The inherited finite four-functions summation theorem proves U(i)U(i+2)<=U(i+1)^2.
The inherited source formula and exact horizontal reduction then supply every
source row. Outside the polygon, inherited raw_outside_polygon18 makes a
neighbor zero; polygon convexity handles the remaining case. No division by
a possibly zero coefficient occurs.

## Guarded core comparisons

For i>=2, use the inherited exact H and D scaled recurrences. New region gluing
exhausts the cases k>=2, k=1, k=0 and the appropriate p,r subcases. It proves
the H, D and local gap signs with explicit guards. The generic ratio_crossMEC6
multiplies by positive denominators and nonnegative coefficients, deriving a
cross inequality without assuming any coefficient is nonzero.

The cases for the core are:

* k<=h: compare H(N,i,h) to H(N,i+1,k).
* k=h+1: compare H(N,i,h) to H(N,i+1,h+1).
* k>=h+2: compare D(N,i,h) to D(N,i+1,k-1).

All scalar sign hypotheses now match their use. The rising weights obey

    C(s+h,h) C(s+k,k) <= C(s+h+1,h+1) C(s+k-1,k-1), h<k.

This follows from their adjacent scaled identities: the cleared gap is
s(k-h-1)C(s+h,h)C(s+k-1,k-1), nonnegative for s>=0. Substitute s=2d-1.
Ordered weights are simply exchanged; separated weights move inward.

## Exceptional first column

K(N,1,0)=0 and K(N,1,1)=2. With h=1 only k=0,1,2,3 can contribute.
Exact scaled formulas for columns two and three reduce their comparisons to
these nonnegative factors (N>=1):

* (2N+3)(N+2)(N+1)(3N^2+4N+5), with scale 30;
* (N+1)^2(N^2+2N+2), with scale 2;
* (2N+1)(N+1)(N+3), with scale 3;
* 2N^2+4N+1, with scale 1.

These are checked using elementary binomial identities and ring arithmetic,
not a sampled sign or a new axiom.

## Exact remaining root

MarkovResidualMEC6 proves Conjecture63 iff InteriorCore63MEC6. It removes all
numerator-two horizontal cases from the prior residual. The other horizontal
guards, both other directions, and reverse-factor ranges remain verbatim.
The new residual is still unproved.

MarkovUpperGainMEC6 exhibits an unbounded actual-source family in the previous
residual: a=2,b=2(n+6)+1, row n+7 and columns 3,4,5. All polygon and prior
residual guards are proved, followed by the raw inequality. This witnesses
strictly broader scope, without claiming novelty or root completion.

## Direct extension obstruction

The same summands do not provide an immediate vertical or diagonal proof.
For every natural fixed shift s, the min/max-shift vertical certificate fails
at N=3,d=1,i=2,h=0,k=1: left product 720, right product 504.
The diagonal certificate fails at N=1,d=3,i=1,h=1,k=0: 1296>504.
MarkovDirectionObstructionMEC6 proves both universal-shift obstructions.

Both are attached to the actual 2/9 source. Its vertical triple at column 2,
rows 5,6,7 is [83,100,92]; its diagonal triple (1,7),(2,6),(3,5) is
[12,100,348]. Polygon membership and both raw inequalities are proved.
Thus these are failures of a particular sufficient certificate, not failures
of the published conjecture. A representation change or a less restrictive
summation argument is required for those directions.
