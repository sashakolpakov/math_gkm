# Mathematical results and remaining target

Machine-authored live research, request f88f6a75cab54deb828cd05d7806b3e4.
Full pinned Conjecture63 and its negation remain open. Matching validation
receipts determine accepted local status; this report is not an independent
completion audit.

## Complete numerator-three horizontal direction

The interrupted predecessor left physical starting columns 4..12 in two central
rows. Its shifted parameters are h in {0,1,2,3}, k natural, q=2k+h+epsilon,
T=3k+h+epsilon, epsilon=1 for b=3q+1 and 0 for b=3q+2. The exact raw formula
centralRawME10 at column c+3 was already proved, with all correction terms.

MarkovCentralExprMF88 represents this formula as an exact one-variable
polynomial in k=K+z. Natural binomial constants are computed with fast_choose,
using its proved equality to ordinary choose. The representation-to-rational
and rational-to-integer equalities are explicit. The certificate checker is
the inherited exact dense rational evaluator, whose correctness is proved.
Each of the 72 signs for c=1..9, h=0..3 and both residues is checked by ordinary
kernel reduction. Nonnegative power coefficients imply nonnegativity for every
z>=0, not merely integer sample points.

The shift K=max(0,3-h,ceil((c+2-h-epsilon)/3)) follows from the central row guard
k+h>=3 and from T>=c+2. When T<c+2 the last coefficient vanishes by the exact
source support theorem. Thus all small parameters and zero tails are covered.
MarkovThreeHorizontalMF88 combines these certificates with the inherited low
columns and c>=10 estimate, and with all other horizontal rows. It proves

  A(i,j) A(i+2,j) <= A(i+1,j)^2

for every natural i,j in every numerator-three source polynomial, unbounded q,
both residues. The path and polygon-restricted versions are explicit.

## Uniform lower vertical direction

The lower source row formula can be written, for i=t+3 and n=b, as

  C(n-j-1,t) C(t+j+3,t+3)
    + 4 sum_(s=0..j-1) (j-s) C(n-2j+s-1,t) C(t+s+3,t+3).

Put k=n+2-i-j. Reversing the summation index gives

  D_t(j,k)=sum_(r=0..min(j,k)) w(r)
              C(j-r+t+3,t+3) C(k-r+t,t),
  w(0)=1, w(r)=4r for r>0.

MarkovLowerDiagonalMF88 proves the exact equality with lowerRowMFFD on its
domain; MarkovLowerVerticalMF88 identifies lowerKernelME9C i j k with
D_(i-3)(j,k) when i>=3 and 2j+3<=i+k. It does not extend that identity outside
the wedge: the inherited auxiliary kernel can be negative there.

The zero-extended weight w satisfies CrossLC. Both binomial sequences are
zero-extended negative-binomial sequences, with checked CrossLC and
nonnegativity. The inherited finite diagonal-convolution theorems establish
row log-concavity, column log-concavity, and nonnegative adjacent minors.
The exact bridge consequently proves the previously open LowerShapeME9C i
for every i>=3, on all three specified wedge domains. Positivity follows from
the exact binomial lift and its positive first term.

The inherited minor gluing theorem now applies without any unproved shape
premise. source_lower_verticalMF88 proves every raw vertical triple with
j+2<=q, at every column, in both numerator-three residue families. Its path
form uses 3(j+2)<=b. Small columns and upper-support zeros are treated by the
actual source support theorems, without division by a possibly zero coefficient.

## Exact residual and future diagonal question

root_iff_upper_vertical_diagonalMF88 states exactly

  Conjecture63 iff ThreeUpperVerticalDiagonalMF88 and OtherFourM9E2.

The first residual retains vertical starts with i>=4 and q<j+2, except the
already proved i=4, j+1<=q case; it retains every unresolved constant-i+j
diagonal clause. The inherited all-source first-four vertical columns are
explicitly removed using their proved source transport. OtherFourM9E2 retains
every direction for every path with numerator at least four. Both residuals
remain open.

For a possible lower-diagonal continuation, the reduced model is D_t(j,k)
above. The desired parameter/row inequality is

  D_t(j+2,k) D_(t+2)(j,k) <= D_(t+1)(j+1,k)^2.

Finite parameter-gap and direct diagonal probes passed. A proposed sufficient
parameter minor fails at t=0: its gap at j=0,k=1 is -2. That exact auxiliary
obstruction is formalized in MarkovLowerDiagnosticsMF88; it neither contradicts
the desired diagonal inequality nor supplies a source-family refutation.
The finite probe found no parameter-minor failure at t>=1. No universal
parameter-sign result is claimed.

A different term-pair sufficient condition already fails in a source-relevant
lower region: n=8,t=0,j=0,r=0,s=2 has mixed gap -1. The complete convolution
argument retains that term and proves the total vertical inequality. Experiments
and auxiliary failures must not be promoted to root proofs or refutations.
