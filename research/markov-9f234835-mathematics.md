# Outer-region transverse inequalities

Machine-authored live request 9f234835b0cf47d395d489f5776d690b.
The exact published root and its negation remain open. Validation receipts,
not this report alone, determine the local checked status of the modules.

## Uniform parameter variation

Use the inherited positive convolution

    D_t(j,k) = sum_(r<=min(j,k)) w(r) C(j-r+t+3,t+3) C(k-r+t,t),
    w(0)=1, w(r)=4r for r>0.

The previous unrestricted parameter minor is false at t=0, j=0, k=1.
This run proves the parameter minor and parameter log-concavity for every
t>=1. It does not retract that obstruction or require an increasing ramp
weight to have a decreasing tail.

For the generalized ramp kernel with binomial parameters a,b, set
f(k)=w(k) C(R-k+b,b), g(k)=w(k) C(R-k+b+1,b+1), zero outside 0<=k<=R.
The initial ratio f(0)/g(0) and successive increment ratios
(f(k+1)-f(k))/g(k+1) form a decreasing sequence when b>=1.
The exact ratios are

    f(0)/g(0) = (b+1)/(R+b+1),
    (f(1)-f(0))/g(1) = (b+1)(3R-b)/(4R(R+b)),
    (f(k+1)-f(k))/g(k+1)
      = (b+1)(R-k-bk)/((k+1)(R-k)(R-k+b)),  k>=1.

Every denominator is positive on the stated support. Three checked scalar
polynomial certificates compare adjacent ratios. The last certificate retains
a square term; a negative monomial was not discarded. A new abstract increment
lemma turns these inequalities into f(y) prefix(g)(x)<=f(x) prefix(g)(y).
The inherited determinant summation argument then gives the parameter/row minor.
The rectangle-prefix identity and the two symmetric ratio comparisons prove
parameter log-concavity when a,b>=1. Setting a=t+3,b=t and combining with
row log-concavity yields

    D_t(j+2,k) D_(t+2)(j,k) <= D_(t+1)(j+1,k)^2, t>=1.

MarkovRampPrefixM9F23 through MarkovLowerParameterM9F23 contain these exact
statements and proofs. The new direct paired-summand shortcut is also false:
the pair t=0,j=0,k=2,r=0,s=2 has mixed gap -6. MarkovRampDiagnosticsM9F23
proves this auxiliary obstruction; it is not a source counterexample.

## Complete lower diagonal source transport

For b=3q+1 or 3q+2, the inherited source identification on j<=q equates the
raw coefficient at (i,j) with D_(i-3)(j,b+2-i-j) inside its valid wedge.
The new parameter inequality proves every diagonal triple with j+2<=q
and i>=4. The existing direct i=3 theorem handles parameter zero, columns
i<=2 vanish at the left endpoint, and degree support handles the zero tails.
Thus source_lower_diagonalM9F23 quantifies over all columns, all q and both
residues without a bound. The path form is 3(j+2)<=b.

## Complete upper transverse source transport

The exact upper template has the same D model in its source sector:

    A(i,j) = D_(i-3)(j,b+2-i-j),
    i>=3, b<=j+q, i+j<=b+2.

This is proved from top_shift_massME10, reversing the finite ramp sum, with
no extrapolation across the middle correction. In particular, the proof does
not identify the earlier signed lowerKernel outside its proved wedge.

The inherited fixed-parameter row/column/minor inequalities now give all upper
vertical triples. The new parameter inequality gives upper diagonal starts
i>=4. A bivariate polynomial certificate closes i=3, equivalently the
parameter-zero model when j>=k+3. Two additional bivariate certificates close
starts i=1 and i=2. Their parameters are t=k+3 and b=3t+e+1, k,e>=0.
The exact exceptional-column formulas and top-mass identities supply all
coefficient bridges. Start i=0 is zero below the top three diagonals, which
are covered by the inherited global theorem. The same theorem and degree
zeros handle all shallow exceptional cases.

Consequently source_upper_verticalM9F23 and source_upper_diagonal_allM9F23
cover every column when b<=j+q. The exact path cutoff is 2b+1<=3j, not the
slightly stronger 2b+2 cutoff in earlier intermediate path wrappers. The exact
wrapper and polygon attachment are in MarkovOuterPathM9F23. Both residues'
first upper row are included there.

## Remaining exact target

root_iff_middle_onlyM9F23 states

    Conjecture63 iff ThreeMiddleOnlyM9F23 and OtherFourM9E2.

ThreeMiddleOnlyM9F23 retains vertical and diagonal triples with
q<j+2 and j+q<b. Its vertical clause also retains the inherited exclusions
for already proved low columns. OtherFourM9E2 retains every direction and
every path with numerator at least four. Both propositions remain open.
All numerator-three horizontal inequalities were inherited as proved.
Neither the new root equivalence nor any finite experiment resolves the root.
