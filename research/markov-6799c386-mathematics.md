# Finite positive formula for every numerator-two coefficient

Machine-authored request 6799c3863d3d4155ab0184f7674d4702. Full pinned
Conjecture63 remains unresolved. The new contribution is the universal formal
expansion and coefficient bridge; the candidate expansion itself was already
recorded in 3af43e69 and ec6f4b83. No historical novelty claim is made.

Let F_n be the inherited Fibonacci polynomial, with F_0=1, F_1=u+v,
F_(n+2)=(u+v+1)F_(n+1)-vF_n. Put P_q=F_(q+1)^2+vF_q^2.
The inherited classification identifies every actual a=2 source with P_q,
b=2q+1, q>=1. The q=0 polynomial is auxiliary.

Write g_a(t)=sum_(n>=0) a^n t^n, a formal power series. The new generic
geometric lemmas prove g_a(1-at)=1 and

    [t^n]g_a^(m+1)=a^n C(m+n,m).

Put T=u(2(v+1)+u), H=T g_1 g_(v²), and

    N=2uv(1+vt)g_v g_(v²)^2 + u²(1+vt)g_1 g_(v²)^2.

From the inherited checked denominator equation and algebraic split identity,
MarkovTwoPositiveM679 proves

    (1-tH)(G-v(v+1)g_(v²))=N,
    P_q=v^(2q+1)(v+1)+sum_(r=0)^q [t^(q-r)] H^r N.

The second equality follows by a finite telescoping identity. Its remainder
is divisible by t^(q+1), so its qth coefficient is zero. There is no exchange
of analytic infinite sums, division by a possibly zero scalar, or convergence
assumption. All identities hold over the original integer bivariate ring.

Here is the fully finite kernel used in the final formula. Define

    R(0,n)=[n=0],   R(m+1,n)=C(m+n,m),
    K(m,l,s;n;v)=sum_(a+b+c=n) R(m,a)R(l,b)R(s,c)v^(b+2c),
    J(m,l,s;n;v)=K(m,l,s;n;v)+[n>0]v K(m,l,s;n-1;v).

The sums are finite natural antidiagonals. In particular m=0 or l=0 is
handled explicitly; no generalized binomial convention is silently imposed.
MarkovPositiveKernelM679 proves these are exactly the coefficients of
(1+vt)g_1^m g_v^l g_(v²)^s. MarkovTwoKernelM679 proves

    P_q=v^(2q+1)(v+1)+sum_(r=0)^q T^r *
      (2uv J(r,1,r+2;q-r;v)+u² J(r+1,0,r+2;q-r;v)).

Define the polynomial in v

    E(r,e,i;v)=[r+e<=i] C(r,i-r-e) [2(v+1)]^(r-(i-r-e)).

Natural subtraction occurs only after the displayed guard; if i-r-e>r,
the binomial coefficient is zero. The all-column identity is

    [u^i]P_q=[i=0]v^(2q+1)(v+1)
      +sum_(r=0)^q (2v E(r,1,i;v)J(r,1,r+2;q-r;v)
                   +E(r,2,i;v)J(r+1,0,r+2;q-r;v)).

MarkovTwoColumnM679 proves this for every natural q,i. Its source adapters
quantify over every path with middle numerator two, not a finite sample.
MarkovTwoArithmeticM679 expands the last polynomial coefficients into natural
binomial products and finite antidiagonal sums, defining rawTwoM679(q,i,j).
It proves that its integer cast equals the actual raw coefficient for every
i,j. This is an equality, not a change of coefficient normalization.

MarkovTwoReductionM679 proves the exact alternative equivalence

    Conjecture63 iff TwoRemainingM679 and OtherSourcesM679.

TwoRemainingM679 retains every vertical and constant-i+j inequality for all
q>=1 and all natural i,j, using rawTwoM679. OtherSourcesM679 retains all three
global raw inequalities for every source path with numerator at least three.
The horizontal numerator-two part uses the inherited completed theorem.
The outside-polygon zero bridge and endpoints are inherited through the exact
root reduction. Neither remaining proposition is proved. The more refined
InteriorCore63MEC6 and all of its clauses remain unchanged and available.

## Why positivity does not finish the argument

Pairing the two Fibonacci-square contributions at a fixed split of i produced
no individual LC failure in the finite probe, but the mixed synchronization
condition fails even away from the extreme split. At q=6,i=8,j=4, two such
triples are [5,6,7] and [3865,2430,735]: the cross sum is 30730, exceeding
29160. This experiment rules out that sufficient summation argument.

Grouping the positive-expansion term A_r with B_(r-1) also fails. The new
MarkovColumnObstructionM679 proves the q=3,i=3,r=1 group equals

    2v+4v²+10v³+12v⁴+12v⁵.

Its triple [2,4,10] fails LC. The separately proved actual source at 2/7 has
the polygon-valid vertical triple [28,68,108], which satisfies LC. Thus this
is a formal obstruction to that termwise strategy, not to Conjecture63.

The finite source checks compared 50,180 coefficients, including 27,438 zeros,
and 136,344 vertical/diagonal triples, including 77,660 zero-containing triples.
No failure occurred. These counts are computational observations only.
The experiments, bounds, source implementation and script hashes are recorded
in evidence/markov-6799c386/experiments.json and the associated scripts.

## Possible next research

The explicit raw formula is now available for exact arithmetic manipulation.
A useful next action could seek a mixed-gap identity for the complete sum,
or a new grouping supported by actual inequalities. Individual positivity,
individual LC of the paired Fibonacci contributions, and naive termwise LC
of A_r+B_(r-1) do not supply the required implication. The choice of approach
remains open; this is advice, not a prescribed recipe.
