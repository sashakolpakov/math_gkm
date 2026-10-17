# Upper-sector raw coefficients and their first horizontal inequality

Machine-authored request b3eed36486ad48a08ac07be4c9b62794. The full pinned
MathGKM.Markov.Conjecture63 remains unresolved. No novelty claim is made.
Exact validation receipts are under evidence/markov-b3eed364/.

## Unbounded source attachment

Every numerator-three source has the inherited parameterization
b=3q+1 (r=true) or b=3q+2 (r=false), q>=1. Define its top depth t by
j=b+2-t. MarkovTopTemplateMB3E proves the polynomial identity

    rawRow(threePoly(q,r), b+2-t) = topTemplate(b,t),  t<=q+2.

This covers j>=b-q, including both residues, with no bound on q or b.
The source formula is the actual inherited cubic/Farey polynomial, not an
arbitrary coefficient array. MarkovTopEquationMB3E proves the source's full
row discriminant equation and proves that its correction forcing vanishes
in this upper sector. High rows vanish by the proved source support. Reading
the resulting recurrence from the top determines the template uniquely.
There is no replacement of a negative exponent by natural subtraction.

Write F_n for fib6 n and

    Delta(n,t) = [v^(n+2-t)](F_(n+2)-2F_(n+1)+F_n).

The template starts at T(n,0)=1 and T(n,1)=Delta(n,1)+4. Its recurrence is

    T(n,t+2) = Delta(n,t+2)+2(X+1)Delta(n,t+1)+(X+1)^2 Delta(n,t)
               -2(X-1)T(n,t+1)-(X+1)^2 T(n,t).

These are ordinary integer polynomials. Both Delta and T satisfy a proved
denominator-shift recurrence. Combining four instances gives the diagonal
second-difference identity; finite summation then proves

    T(2t+d,t) = Delta(2t+d,t)
                +4 sum_(s=0)^(t-1) (t-s) Delta(2s+d,s).

MarkovTopSumMB3E proves this for every natural d,t. The proof uses finite
polynomial algebra, not analytic root expressions or Lagrange inversion.

## Exact coefficients, exceptional columns, and zeros

Let A_i be the coefficient of X^i in T(n,t). For n>=2t and t>=3,
MarkovTopCoefficientsMB3E and MarkovTopEdgesMB3E prove

    A_0 = 0,
    A_1 = 4(n+6-3t),
    A_2 = 4(t-2) choose(n-2t+6,2),
    A_i = choose(t-3,i-3) choose(n+2-t+i,i)
            +4 sum_(s=3)^(t-1) (t-s) choose(s-3,i-3)
                                      choose(n-2t+s+i+2,i),  i>=3.

The formal high-column function topPositiveMB3E retains an explicit guard
3<=s, so natural subtraction never fabricates an extra contribution at
s=0,1,2. Its nonnegativity is unconditional, and its strict support is
proved under n>=2t. In the source sector 5<=t<=q+2, the inequalities
n=b>=2t and 3t<=n+5 follow arithmetically. MarkovTopSupportMB3E therefore
proves for every column i:

    A_i>=0, and A_i>0 iff 1<=i<=t.

Column zero and every tail column are exactly zero. Nothing is filtered
from the root predicate. Small depths are not smuggled through these
n>=2t formulas; the general source-template identity itself covers them.

## A strict source inequality on the first nonzero triple

A general weighted binomial telescope yields

    A_3 = choose(n+5-t,3)
       +4[choose(n-t+6,5)-choose(n-2t+9,5)
                         -(t-3)choose(n-2t+8,4)].

The finite-sum identity is proved universally, rather than accepted from
symbolic output. Put s=t-3 and d=n+5-3t. The gap A_2^2-A_1 A_3 has a
25-term polynomial certificate with strictly positive constant term and
nonnegative coefficients after multiplication by 15. Lean checks the exact
identity by ring normalization and derives positivity for s,d>=0.

Consequently top_template_first_strictMB3E proves A_1 A_3<A_2^2 for
n>=2t, t>=3, 3t<=n+5. source_top_first_strictMB3E attaches this to
both actual source families whenever 5<=t<=q+2. The path-level theorem
quantifies over every source path with numerator three. Polygon membership
of all three points (1,j),(2,j),(3,j) is separately proved in
source_top_edge_polygonMB3E. The row-zero case gives the starting-column-0
non-strict inequality as well.

## Exact residual, still open

MarkovTopRegionMB3E proves

    Conjecture63 <-> ThreeRemainingMB3E AND OtherFourM9E2.

ThreeRemainingMB3E keeps the predecessor's horizontal guards and excludes
only TopEdgeRegionMB3E: starting i<=1 and j=b+2-t with 5<=t<=q+2.
It retains the predecessor's vertical and diagonal clauses verbatim.
OtherFourM9E2 is unchanged. Neither remaining proposition is proved.

TopTemplateLCMB3E is a separate unproved sufficient condition: all template
horizontal inequalities for n>=4, 3t<=n+5. Its conditional source transport
is proved. Even proving it would leave the middle upper strip, vertical and
diagonal residuals, and numerator-at-least-four family to address.

## Experiments and a revisable representation lead

The source experiment used the original polynomial recurrence, independently
of the new sum. It passed 10,156 coefficient comparisons, retaining 2,906
zeros, on 604 upper rows. Across 55 labels, including both endpoints and
additional paths, all 178,664 polygon-valid triples in three directions
passed. The 416 tested new edge triples had strict gaps. These are finite
experiments, not proofs.

Exact symbolic arithmetic found nonnegative coefficients in all 250 gap
polynomials tested at fixed depths t=3..22 after n=3t-5+d. This does not
establish any unbounded-t certificate. Exact Sturm tests found no non-real
roots in 120 tested upper templates (t=3..22; d=0,1,2,5,20,100), after
removing the exterior zero factor. The separate source-row test found 54
non-real-rooted rows outside this restricted template sector. The initial
probe counted distinct roots; the follow-up recursively checks repeated
factors. No repeated factors occurred in the tested nonzero parts, so the
earlier classifications were unchanged. Both outputs are preserved.

An informal coefficient comparison with the Jacobi finite expansion suggests

    Delta(2t+d,t; X) = P_t^(-3,d+5)(1+2X),
    T(2t+d,t) = Delta_t+4 sum_(s<t)(t-s)Delta_s.

The finite expansion in [DLMF 18.5.7](https://dlmf.nist.gov/18.5.E7) supports
this proposed identification by substitution; this run has no Lean Jacobi
bridge and no theorem about zeros of the weighted sum. Parameter alpha=-3
is outside the usual positive-weight orthogonality range. A real-rootedness
argument must address that fact and prove the weighted-sum property, not
merely cite real-rootedness of individual classical polynomials. This is
revisable research advice, not a new proof premise.
