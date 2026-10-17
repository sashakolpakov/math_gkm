# Complete third middle row and an integer-polynomial sign problem

Machine-authored live request 9db2326d4e514e22b19a30513b4cae50.
The full pinned Conjecture63 and its negation remain unresolved. Selected
source hashes and final local validation are in evidence/markov-9db2326d/validation.json.

## Complete third middle horizontal row

Write b=3q+epsilon, with epsilon=1 for r=true and 2 for false. The new theorem
source_middle_third_allM9DB proves, for every q>=1 and starting column c>=0,

    A(c,b-q-3) A(c+2,b-q-3) <= A(c+1,b-q-3)^2.

These are the raw integer coefficients of the actual numerator-three source.
All columns, small q and zero tails remain. The formal row expression
b+2-(q+5) equals b-q-3 throughout this domain. The strip part has q>=9 for
true and q>=8 for false; it is proved with unbounded denominator parameter.
The six exceptional source cases q=6,7,8 (true) and q=5,6,7 (false) are checked
directly in Lean. The remaining smaller cases follow from inherited lower-row
theorems; exterior columns follow from the proved degree bound. The path theorem
uses the inherited numerator-three classification and source coefficient identity.
The polygon theorem explicitly proves all three memberships for q>=2,
c>=3 and c+2<=q+5. The raw inequality itself has no such column guard.

The old strip theorem covered starting columns <=12. New certificates close
internal indices 10..16, physical starting columns 13..19; the inherited high
column theorem closes the rest. The exact one-variable checker interprets an
expression as a rational coefficient list, with proved evaluation and constant
folding identities. Ordinary kernel reduction proves the finite signs. This is
a symbolic proof valid for every denominator, not a scan of denominators.

## Exact remaining root

For R_c(x,k,r)=middleRawMD02 x k r c, define
G=R_(c+1)^2-R_c R_(c+2). The middle parameters are q=x+2k+B,
B=5 (true) or 4 (false), and physical source column c+3.

MarkovMiddleAfterThirdM9DB proves

    Conjecture63 iff
      MiddleAfterThirdM9DB and ThreeOutsideMiddleMD02 and OtherFourM9E2.

MiddleAfterThirdM9DB retains c>=5, k>=3, c<4k+(9 or 7), with x arbitrary.
All three conjuncts remain open. No vertical/diagonal condition, family,
endpoint or correspondence obligation is discarded.

## Uniform integer polynomial representation

For fixed k,c,r set s=max(0,c+2-(3k+B)). Below x=s, the right neighbor
vanishes; middle_gap_below_shiftM9DB proves the non-strict inequality without
a positivity hypothesis. For x>=s, write x=y+s with y>=0.

Let F(A,n;X)=product_{h=0}^{n-1}(X+A-h). The integer polynomial

    (N!/(a! b!)) F(A,a;X) F(B,b;X)

evaluates at every natural y to N! binom(y+A,a) binom(y+B,b), provided a+b<=N.
The single-binomial version uses N!/a!. MarkovIntegerPolynomialM9DB proves
these identities, including vanishing binomial cases, and applies them termwise
to the exact short top sum and correction kernel.

Set D_c=(2c+5)!. The polynomial P_c=middlePolyM9DB k c r s has integer
coefficients and satisfies

    P_c(y)=D_c R_c(y+s,k,r).

The complete correction is retained in P_c. Define

    H_(k,c,r)(X)=D_c D_(c+2) P_(c+1)(X)^2
                - D_(c+1)^2 P_c(X) P_(c+2)(X).

MarkovMiddleIntegerPolyM9DB proves exactly

    H(y)=D_c D_(c+2) D_(c+1)^2 G(r,c,y+s,k),

and the multiplying scale is strictly positive. It proves that nonnegative
coefficients of H imply the raw gap inequality for every natural x, including
the separate zero-support region. Factorials clear denominators in an auxiliary
identity; they do not replace or normalize the source inequality.

IntegerSignsM9DB asserts coefficient nonnegativity for every remaining k,c,r.
It is an open sufficient condition for MiddleAfterThirdM9DB. It is not asserted
as equivalent to the source conjecture. The other two root residuals are still
explicit hypotheses even if this sign condition were proved.

The validated degree-bound module proves degree(P_c)<=2c+5 and
degree(H)<=4c+14. Thus the inner coefficient test
is finite for each k,c; the outer depth k remains unbounded.

## Finite observations and abandoned leads

The direct source experiment passed 11,248 coefficient comparisons, 4,650
third-row triples, and 568,297 polygon-valid triples across the three directions.
The third-row triples contain 8,913 zero entries counted with multiplicity.
Both endpoints and additional non-numerator-three source paths were retained.

The exact integer polynomial probe checked every c<4k+(9 or 7) through depth 25
and both residues, with support shift s: 3,016 polynomials and 27,144 evaluation
comparisons, with no negative coefficient found. Final data are in
fixed-depth-probe.json. Every generated polynomial is compared with the
independent integer binomial formula at y=0,1,3. Coefficient computations and
those evaluation comparisons are experiments, not a proof of IntegerSignsM9DB.

A fresh geometric-weight example gave input [1000000,1000,1], kernel output
[56084120,210660,792] and negative gap -40987440. This duplicated the previously
proved obstruction in MarkovTopObstructionsM55C, so no new theorem or novelty
claim is made for it. It is not a source-family refutation. Generic preservation
under arbitrary log-concave weights cannot be used for the uniform proof.

The older M731 fourth-moment agenda was checked against the later M97B
attachment modules and found already completed. It is not a newly open task.
