# Uniform numerator-two vertical argument

Machine-authored live research db972d62445f4aceac3b243e0cba0855.
Status is provisional until the final validation inventory records compilation,
joint kernel replay and theorem axiom closures. Full Conjecture63 remains open.

For zero-extended, nonnegative CrossLC sequences f,g,w define

    D(j,m) = sum_(0<=k<=min(j,m)) w(k) f(j-k) g(m-k).

At fixed m, the sequence h(k)=w(k)g(m-k) is CrossLC by reversal and
pointwise multiplication. It is zero outside [0,m]. Realize h by a finite
polynomial and truncate f beyond j+2. Their product's coefficients at j,j+1,j+2
equal D at those indices. Polynomial convolution therefore proves row LC.
Exchange f and g for column LC. The exact cutoff bridge includes all zeros.

The determinant-sum identity gives every adjacent 2x2 minor as a finite sum
of products of two nonnegative Toeplitz minors and w(a)w(b). CrossLC supplies
these minors, so D is TP2. All sums may be extended to j+m+3 because at least
one zero-extended factor vanishes in each added term.

Take f(t)=C(t+i,i) for t>=0, g(t)=C(t,i-2) with zero extension, and
w=(1,2,2,...). The first two are CrossLC by binomial LC, with g a translate
of a negative-binomial sequence. The weight is CrossLC by direct cases.
Splitting off k=0 identifies D exactly with the inherited twoKernelM4F4.
This proves its shape conditions without any finite bound on i,j,m.

The inherited multiplication-and-cancellation lemma implies kernel
antidiagonal LC. Since source A_q(i,j)=K_i(j,2q-j), this is the source
VERTICAL direction. The inherited source adapter covers i>=3 and j<=2q;
its zero-tail theorem covers j>2q. Existing small-column results cover i<=2.
The resulting intended theorem is every raw vertical triple for every
source path with numerator two, with no bound on the denominator or indices.

The unchanged OtherVerticalCoreM0D3 retains all other numerator obligations,
the source diagonal direction, and inherited reverse-factor ranges. The
planned root equivalence removes only the now-proved numerator-two vertical
premise. It does not prove the remaining core.

An exact finite probe found that extending the same kernel terms to a
source-diagonal min/max certificate fails: at i=3,j=0,m=2,k=1,l=0 the
extreme product is 32 and the central product 30. Every tested shift 0..3
fails at the same indices. This is only a certificate failure, not a source
counterexample; formal obstruction and actual-source verification are separate.

## Exact remaining diagonal coordinates

For i=n+2 and m=r+n the kernel is

    H(n,j,r)=sum_k w(k) C(n+j+2-k,n+2) C(n+r-k,n).

The finite range is 0<=k<=min(j,r). The shift in the second zero-extended
negative-binomial sequence proves this equality exactly; it is not an
interpolation. A source diagonal triple keeps r fixed and is
H(n,j+2,r), H(n+1,j+1,r), H(n+2,j,r). The exact source parity is
n+j+r+2=2q for some natural q. Cases m<n have a zero extreme and are
handled before the reparameterization. Columns starting at i<=2 remain
explicit in SmallTwoDiagonalMDB9.

The inherited vertical proof supplies LC in j of H at fixed n,r. H is always
strictly positive. If one could also prove LC in n and nonnegative adjacent
(n,j) minors, the same scalar cancellation argument would give the desired
source diagonal inequality. MarkovDiagonalShapeMDB9 proves this conditional
implication and the exact diagonal/root equivalences. The two shape conditions
are UNPROVED. Finite tests of 89,373 shape comparisons through n,j,r=30 found
no failure. Pairwise summand versions failed, so a summation argument is needed.

The specific weight matters. For w=(1,t,t,...) the weight is CrossLC whenever
t>=1. At j=r=1 the resulting H is (n+3)(n+1)+t. For t=17 and n=1,2,3 this
gives [25,32,41], failing LC by one. For the actual t=2 the three values are
[10,17,26] and satisfy LC. MarkovReducedObstructionMDB9 formally distinguishes
this auxiliary-weight obstruction from the source conjecture.
