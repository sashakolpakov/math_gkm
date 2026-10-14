# Common-weight baseline and first response

Machine-authored research, request 80b7912a37f44a85a9093d9d5ef87118.
No historical novelty claim. Full pinned Conjecture63 remains unresolved.

Let D=(u+v)^2+u and let P_a(t) be the inherited common-C-weight Pell
deformation. Its recurrence is P_0=1, P_1=D and

    P_(a+2)(t)=(D+t v)P_(a+1)(t)-t u v P_a(t).

Only t=1 identifies this object with the published source a/(a+1).

## Unbounded zero-weight result

P_a(0)=D^a. If i+j=a+k, its literal raw coefficient is

    [u^i v^j]P_a(0) = choose(a,k) choose(2k,j).

If i+j<a, the coefficient is zero. This is proved using the exact shear
u=x,v=xy, under which P_a(0)=x^a(1+x(1+y)^2)^a. No coefficient
normalization occurs. Every natural a,i,j is retained, including a=0,
out-of-support positions and internal zeros.

The horizontal inequalities follow by multiplying binomial log-concavity
in k with upper-index-stride-two binomial log-concavity. The diagonals are
ordinary binomial sequences with a constant nonnegative factor.

For the vertical direction put B(a,k,j)=choose(a,k)choose(2k,j). Inside
its support, an exact recurrence is

    B(a,k+1,j+1)(j+1)(2k+1-j)=2(a-k)(2k+1)B(a,k,j).

Write r=2k-j. The numerator controlling the decrease of consecutive ratios is

    2(a-k)(2k+1)(j+2)(r+2)
      -2(a-k-1)(2k+3)(j+1)(r+1)
    =2(a-k-1)((j+1)^2+(r+1)^2-1)
      +2(2k+1)(j+2)(r+2).

It is nonnegative for k+2<=a and j<=2k. Outside these conditions an
endpoint vanishes. The Lean proof clears positive denominators and never
divides by a coefficient. MarkovZeroAll80b7 proves GlobalLC18(P_a(0)),
all three directions at all natural positions. This is a deformation theorem,
not a theorem at source weight one and not a root resolution.

## Exact polynomial parameter

MarkovParameter80b7 represents P_a as an actual polynomial in t with BiPoly
coefficients. It identifies evaluation at each integer t with typeP3 t a,
and evaluation at one with the protected repeated-right source numerator.
The first two parameter coefficients are

    [t^0]P_a = D^a,
    [t^1]P_(n+2) = (n+1) v (u+v)^2 D^n.

Raw extraction preserves the polynomial parameter. In particular the
constant coefficient of every horizontal gap polynomial is nonnegative.
This controls one coefficient of the gap, not its evaluation at one.
Validation status and final hashes are in the run's validation.json.

## Candidate next coefficient

An exact sparse Python calculation found a positive polynomial certificate
for the bulk first-order horizontal gap. If A0(k)=choose(a,k)choose(2k,j),
then the proposed first-order coefficient formula gives

    A1(k)/A0(k)=j k(a-k)/(a(2k-j+1)).

Set r=2k-j>=0 and m=a-k-2>=0. The rational expression for the gap divided
by A0(k)^2 factors as 4j(a-k)(a-k-1)(2k+1)T divided by
a(r+1)^2(r+2)^2(r+3)(r+4)(r+5). The explicit T and its 21 nonnegative
monomial coefficients are in linear-gap.json. This symbolic observation
is NOT yet a Lean theorem; the raw first-order coefficient formula,
the rational identity, and r<0 boundary cases need checking.

## Rejected invariant and finite tests

For a suffix pair f,g, set h=vf+ug and q=(u+v)h. A proposed sufficient
condition required nonnegative mixed horizontal gaps of certain summands.
At weight one on source core 2/17, the pair (h,g) gives triples
[0,4,377] and [2,94,1715]; its mixed gap is -2. On source core 17/19,
the pair (q,vf) gives [0,16,6008] and [2,370,26390]; mixed gap -176.
These are auxiliary summands, not source coefficient triples. They rule out
those sufficient mixed inequalities; neither is a counterexample to 6.3.

The other two tested mixed conditions survived 1,259 source cores through
denominator 64. The no-CC scan tested 3,944 word/weight pairs through length
14 at weights 0,1,2,10. A separate test of 496 products of two all-A scalar
blocks of lengths 0..30 found no horizontal failure. All are finite experiments.
The surviving conditions and general product inequality remain unproved.

The live primary source consulted was the published target:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html.
Hosted literature searches supplied no theorem used as a proof premise.
