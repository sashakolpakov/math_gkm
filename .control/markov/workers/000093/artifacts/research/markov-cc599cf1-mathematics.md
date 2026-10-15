# Fourth-slice first shift and the whole linear block

Machine-authored live request `cc599cf12cc74c9e84112aac7bc0f9ac`.
The exact pinned Conjecture63 remains open. The final local validation inventory
in `evidence/markov-cc599cf1/validation.json` determines theorem status.

## Completed inequality

The inherited first-shift theorem required run length n>=5. Its large-index
coefficient shape does not apply at index four. The missing n=4 case is instead
proved directly from lowCoeff4F2, lowCoeff5F2, lowCoeff6F2 and the exact inherited
first-shift correction. Substituting c=R+C+2 and r=R+1 in its gap yields a
45-term polynomial with nonnegative integer coefficients. Ordinary Lean `ring`
checks the identity and `positivity` checks its sign. This parameter inequality
holds for all integers 1<=r<c. Its actual-source adapter still requires c>=5.

`source_fourth_first_shiftCC` consequently proves the triple starting at j=n
for every n>=4, every actual predecessor of denominator c>=5, and the exact
fourth-slice equation i+j+2=a+4. All coefficients are raw integers and zeros
remain. `root_iff_coreCC` identifies the exact remaining predicate
`InteriorCore63CC`; it does not prove that predicate.

## Whole shifted-block identity

Write F(N,Z,x;c,r) for the inherited cleared fourth-slice numerator
`fourthNumeratorBC`; eventually N=n and Z=x^n. The new calculation works with
Z square-zero, leaving x unrestricted. The local third and fourth observables
then depend on three Boolean arguments. A generic moment identity reduces the
four-letter moment of a three-letter observable to the three-letter moment.
The resulting cyclic moments lose all higher pattern statistics. This is
checked algebra, not a fit to finite source words.

`fourthNumerator_linearCC` proves, in every commutative ring with Z^2=0,

    F(N,Z,x;c,r)-F(N,0,x;c,r) = Z G(N,c,r,x).

G is `fourthShiftCC`, expressed using exact derivatives of the first, second,
third and fourth moments. `fourthShift_polyCC` proves its explicit polynomial
representation, with x-degree at most twelve. It is independent of the six
source chambers. Higher Z powers are not independent of those chambers.

Passing to a quotient by (Z^2) gives divisibility of the exact remainder by
Z^2. The inherited cubic-in-x calculation, together with the newly proved
G=x^2*shiftCorrection modulo x^3, gives divisibility by x^3 as well. These are
combined in the separate-variable ring Z[x][Z], where cancellation of the
nonzero coefficient x^3 proves a product divisibility. After Z=x^n:

    x^(2n+3) divides F(n,x^n,x;c,r)-F(n,0,x;c,r)-x^n G(n,c,r,x).

`source_fourth_block_extendedCC` therefore gives, for c>=5 and every j<2n+3,
the exact scaled raw source coefficient as the convolution of

    fourthLowPoly(c,nc+r,x) + x^n G(n,c,r,x)

with the coefficients of (1-x)^(-8). This is a finite coefficient identity,
not an appeal to analytic convergence. The scale is uniformly 24.

`source_fourth_block_shape_extendedCC` further identifies indices j=n+k,
5<=k<n+3, with the explicit integer expression

    7560 A_(a+4-j,j) = fourthShape(c,nc+r,j) + shiftShape(n,c,r,k).

The extra factor 315 clears the binomial denominator uniformly. No
coefficient-dependent normalization is introduced. Lower k values are not
silently identified with the falling-factorial polynomial.

## Experiments and incomplete inequality route

The exact experimental whole-block gap for 5<=k<=n, c>=5, 1<=r<c has
nonnegative-coefficient certificates after four substitutions: r>=4, r=3,
r=2 and r=1. The r>=4 substitution has 4095 terms; each fixed-r substitution
has 819. These are recorded in `block-gap-probe.json`. The general coefficient
decomposition and fixed-r Lean attempts timed out; the unvalidated drafts are
explicitly excluded. These experiments do not prove whole-block log-concavity.

An attempted factor 16(c-r)x^2 for G was rejected by exact polynomial division.
The first onset coefficient has that factor, but the entire correction does
not. This rejection concerns a proposed simplification, not Conjecture63.

The independent finite cut evaluation checked 14332 block coefficients, 5052
shape positions, 3844 polygon-valid block triples and 74 run-four triples.
There were 3844 comparisons to the literal source recurrence, with no failures.
All counts and inputs are in `experiments.json`; none is a universal proof.

The original local-four calculation timed out and was replaced by checked
split calculations. Every rejected build has a source snapshot and receipt.
All mathematical modules use ordinary Lean; inherited compiled imports were
reused, so this is not a fresh whole-source rebuild or an independent audit.
