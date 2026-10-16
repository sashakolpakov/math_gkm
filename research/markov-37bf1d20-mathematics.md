# All-index moments and a discriminant support bound

Machine-authored request 37bf1d20e23d45ac82d81edbb57c3fd5.
The full pinned Conjecture63 remains unresolved. The final source-bound
validation inventory, when present, is evidence/markov-37bf1d20/validation.json.

## Exact all-index adapter

For a real polynomial P, integer k, and natural n, set H=n+2, D=(n+1)(n+2).
Let B(n,z) be choose(n,z) for integer z>=0 and zero for z<0; ordinary binomial
vanishing also applies when z>n. For r in the finite support of P put

    x_r=k+2-r,  q_r=P[r] B(n+2,k+2-r),
    W=sum q_r, U=sum q_r x_r, V=sum q_r x_r^2.

These are unnormalized weights. Unlike the inherited quotient formula,
there is no division by x_r or H-x_r. The identities therefore remain valid
at x_r=0 and x_r=H, at negative k, beyond the degree, and for signed P.

MarkovBinomialAllM37B proves the zero-extended raising identities

    z B(n+1,z)=(n+1) B(n,z-1),
    (n+1-z) B(n+1,z)=(n+1) B(n,z),

then their three second-order versions and the exact coefficient convolution.
For Q=(1+X)^n P, MarkovMomentAllM37B proves

    D Q[k]   = V-U,
    D Q[k+1] = H U-V,
    D Q[k+2] = H(H-1)W-(2H-1)U+V,

and consequently

    D^2 (Q[k+1]^2-Q[k]Q[k+2])
      = (n+1) {U(HW-U)-H(WV-U^2)}.

All Q coefficients here are zero-extended ordinary coefficients. Since
D and n+1 are strictly positive, moment_lc_iffM37B is an equivalence with
nonnegativity of the braced expression, without a nonnegativity assumption
on P. integer_moment_lc_iffM37B transports this exactly to integer coefficients.

MarkovSourceMomentM37B identifies this criterion with the actual source
inequality in all three forward-factor ranges. It removes the earlier
full-overlap restriction on the position along each row, column or diagonal.
It does not prove the moment-gap sign. It also does not invert smoothing in
the reverse-factor ranges.

## Discriminant support criterion

For nonnegative weights with all nonzero-weight positions in [A,B], let

    F=U(HW-U)-H(WV-U^2),
    T=(H-1)U^2-H(A+B-1)WU+HABW^2.

Summing q_r(x_r-A)(B-x_r)>=0 gives V<=(A+B)U-ABW and hence F>=T.
The completed-square identity is

    4(H-1)T = [2(H-1)U-H(A+B-1)W]^2
      + H[4(H-1)AB-H(A+B-1)^2]W^2.

Thus H>1 and H(A+B-1)^2<=4(H-1)AB imply F>=0. All weights may vanish;
neither W nor any source coefficient is divided out. This argument is checked
in MarkovMomentSupportM37B. In MarkovSharpRegionM37B, P has nonnegative
coefficients supported in [lo,hi], and A=k-hi+2, B=k-lo+2. Subtractions in
SharpRegionM37B are real subtractions, so there is no truncated-index artifact.
No full-overlap restriction is needed for this theorem.

MarkovSourceSharpM37B uses the exact inherited source factorizations and support:

* Horizontal j: n=b-2j-1, lo=a-floor(aj/b), hi=a+j, when 2j+1<=b.
* Vertical i: n=a-2i-1, lo=b-floor(bi/a), hi=b+i, when 2i+1<=a.
* Diagonal depth r: n=a+b-1-2r, lo=0, hi=r, when 2r<=a+b-1.

Each conclusion is the literal raw inequality in the corresponding principal
direction. MarkovResidualM37B proves Conjecture63 iff InteriorCore63M37B,
retaining all inherited residual clauses and excluding only these proved regions.
InteriorCore63M37B is not proved.

## An unbounded actual-source improvement

For every natural t>=1, let

    m=6t^2+2t-1, path=R^m L L,
    a=3m+1, b=3m+4,
    r=6t, i=j=18t^2+3t-2.

MarkovSharpWitnessM37B proves the labels, all three polygon memberships,
every inherited diagonal residual guard, failure of the previous square-margin,
mixed-pair and variance criteria, and the new raw inequality. Here H=r^2 and
A+B=H; the discriminant bound is an equality. The source depth r is unbounded.
Failure of an auxiliary sufficient criterion is not failure of source LC.

At t=1 this is source 22/25 with positions (19,21),(20,20),(21,19).
The finite exact source calculation gives coefficients
8197281905056200, 8817141130741680, 8615630549003280, respectively.
Those numeral evaluations are experimental; the universal raw inequality
for the family is the Lean theorem unbounded_sharp_onlyM37B.

## Why source-specific information is still required

For equal weights at (H-w)/2 and (H+w)/2, the moment gap is H(H-w^2).
MarkovSupportObstructionM37B proves this identity and, for H>0, that its
nonnegativity is equivalent to w^2<=H. The discriminant bound is therefore
sharp for this symmetric two-point support model. This is not a claim of
optimality for every asymmetric support or every Markov distribution.

The same module proves a concrete ordinary-polynomial failure:
Q=(1+X)^12(1+X^4) has Q[8]^2<Q[7]Q[9]. Its three coefficients are
1012,990,1012. This is an auxiliary nonnegative seed, not an actual source
polynomial and not a refutation of Conjecture63. It prevents replacing the
remaining source-specific inequality by unrestricted nonnegative smoothing.

Finite experiments separately checked all-index identities and source signs,
including negative indices and zero triples. Their exact input bounds, counts,
script hashes and outputs are in experiments.json and residual-gain.json.
No finite scan establishes an unbounded sign theorem or historical novelty.
