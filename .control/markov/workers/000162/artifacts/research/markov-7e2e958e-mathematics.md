# Positive auxiliary minors and the remaining truncation

Machine-authored request 7e2e958e791546e6988c1db8eaecb1c3. Full pinned Conjecture63 remains unresolved. No new complete source direction is claimed.

Put c(k)=0 for k<0, c(0)=1 and c(k)=4k for k>0. Define

    B_t(s)=C(t+s+3,s),
    Q_(j,t)(Y)=sum_(s=0)^j c(j-s) B_t(s) Y^s.

The new proof is uniform in every natural j,t and every coefficient index. It proves coefficientwise nonnegativity of

    Q_(n,t+1) Q_(m,t) - Q_(n,t) Q_(m,t+1),  m<=n,
    Q_(j,t+1)^2 - Q_(j,t) Q_(j,t+2).

The first assertion follows by pairing the coefficient summand indexed (a,b) with (b,a). Their sum is the product of two nonnegative minors:

    [c(n-b)c(m-a)-c(n-a)c(m-b)]
    [B_(t+1)(b) B_t(a)-B_(t+1)(a) B_t(b)],  a<=b.

The first factor follows from CrossLC of c, including its negative-index zero extension. The second follows from the exact ratio identity

    (t+4) B_(t+1)(s)=(t+s+4) B_t(s).

The second assertion uses the polynomial prefix recurrence

    Q_(j,t+1)=sum_(k=0)^j Y^k Q_(j-k,t).

Consequently the full LC gap is a sum of Y^k times the already nonnegative ordered minors. This avoids the single-sign-change conjecture used in the predecessor's suggested approach. The proof is in MarkovQKernelM7E2, MarkovQMinorM7E2 and MarkovQShapeM7E2.

The source-linked lift kernel remains exactly

    L(j,t,m)=C(t+m+3,m)[C(t+j+3,t+m+3)+4C(t+j+4,t+m+5)].

MarkovQSourceM7E2 proves, for ALL natural m, including zero tails,

    coeff_m Q_(j,t)(1+X)=L(j,t,m).

It uses the inherited binomial-product and weighted hockey-stick identities. No interpolation or finite test establishes this bridge. Q has degree at most j, as does Q(1+X). Therefore the fixed-degree reversal

    E_(j,t)=reflect_j(Q_(j,t)(1+X))

has coefficient L(j,t,j-k) for k<=j and zero above j. MarkovExtendedShapeM7E2 proves every coefficient of E_(j,t+1)^2-E_(j,t)E_(j,t+2) is nonnegative. Composition with 1+X and fixed-degree reversal preserve the coefficient signs, with the degree and product bridges proved explicitly. This is the precise polynomial version of the predecessor's full Laurent-extension conjecture.

Define the actual triangular polynomial

    A_(j,t)(X)=sum_(r=0)^t L(j,t,t-r) X^r.

MarkovLiftPolynomialM7E2 proves A_(j,t)=X^(t-j) E_(j,t) whenever j<=t, and therefore coefficientwise LC for the consecutive polynomials A_t,A_(t+1),A_(t+2) whenever j<=t. It also proves the literal raw source bridge

    threeRaw(q,r,t+3,j)=sum_(k=0)^t C(n-2j-1,k) coeff_k A_(j,t),
    n=sourceN(q,r), j<=q.

This is binomial weighting of coefficients, not evaluation at X=1 and not a normalization. Thus the proved auxiliary gap positivity does not already establish a raw source inequality.

MarkovLiftCutM7E2 defines cuts A_(j,t)^[h] retaining exactly indices >=h. Its auxiliary LC-positive condition is reduced equivalently to

    h<=t<j+h.

When t<h, the left polynomial vanishes and the gap is a square of a polynomial with nonnegative coefficients. When j+h<=t, no terms are cut, and the newly proved tail theorem applies. The remaining boundary domain is unbounded: writing t=h+v leaves 0<=v<j and arbitrary h. LiftBoundaryM7E2 is NOT proved. Nor is the general LC-positive-to-binomial-weighted-output theorem formalized here. These are explicit remaining obligations of this route.

The obstruction module prevents an unsound shortcut. The three auxiliary polynomials E0=1+X+X^2, E1=3+2X+X^2, E2=5+3X+X^2 each have CrossLC coefficients. Their parameter gap is 4+4X+X^2, coefficientwise nonnegative. Shifting by t-2 and discarding negative powers gives A0=1, A1=2+X, A2=5+3X+X^2, whose gap X-1 has a negative constant coefficient. These are not asserted to be source polynomials; this refutes only the general truncation inference.

Exact finite tests are in auxiliary-experiments.json and kernel-probe.json. The untransposed midpoint condition fails even for d=j=24, corresponding to the lower source row j=24 of 3/73. The actual polygon-valid raw triple in that experiment has a positive gap. No experiment is used as proof.

The exact inherited root equivalence remains Conjecture63 iff ThreeRemainingMAE9 AND OtherFourM9E2. Both predicates are still open, retaining correction bands, every direction, larger numerators, reverse-factor ranges, zeros and endpoints.
