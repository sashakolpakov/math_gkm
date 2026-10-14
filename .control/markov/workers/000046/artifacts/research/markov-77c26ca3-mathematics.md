# Ambient-degree horizontal bounds

Machine-authored request 77c26ca3420f4eb0bd2b89f7946d1a23.
Full pinned Conjecture63 remains unresolved. No novelty claim.
Formal status is given by evidence/markov-77c26ca3/validation.json.

## A candidate on the entire source family

Write A(i,j) for the literal source coefficient at reduced a/b, and put
N=b-1 and s=i+j-a. Polygon membership implies 0<=s and s+2<=N for a
horizontal triple. The proposed stronger inequality is

    (s+2)(N-s) A(i,j) A(i+2,j)
      <= (s+1)(N-s-1) A(i+1,j)^2.

Equivalently, the horizontal coefficients divided by choose(N,s) should be
log-concave, with s changing along the row. This normalization is an auxiliary
sufficient condition, NOT the pinned target. The two scalar factors differ
by N+1=b. Nonnegative source coefficients and positive right scalar therefore
give the original raw inequality. MarkovAmbient77c2 proves this implication
with the actual polygon hypotheses and raw coefficients. AmbientHorizontal77
is a Prop definition and is not asserted as a theorem.

This extends the preceding Pell candidate from ambient a for a/(a+1) to
ambient b-1 for every source. It does not replace the other two directions.

## Unconditional first-row calculation

For c_k=[x^k](1+x)^n(A+Bx), A,B>=0, put N=n+2. The exact identity is

    c_k / choose(N,k+1)
      = (k+1)[A(n+1-k)+Bk] / ((n+2)(n+1)), 0<=k<=n+1.

The numerator has shape f(s)=s(C+Ds). At consecutive indices,

    f(s+1)^2-f(s)f(s+2)
      = [C+D(s+1)]^2 + D^2 s(s+2).

This is nonnegative for s>=0, including decreasing affine factors and zero
cases. The generic proof and binomial normalization identities are checked
in MarkovRowNormalization77c2. The source first-row identity already proved
in MarkovHorizontalLCB46 is

    [v]P_(a/b)=u^a(1+u)^(b-3)[(3a-1)+(a+b-1)u].

The new exact source bridge gives the ambient normalized inequality on j=1
for every path. Polynomial mapping and shifting are checked explicitly.
MarkovAmbientScaling77c2 converts normalized comparisons to their literal
integer-scaled form using the exact binomial ratio identity, without assuming
that the source coefficients are nonzero. Polygon membership on j=1 forces
i>=a, so this covers every admissible horizontal triple in that row.

## Entire numerator-one family

For the source 1/b, set N=b-1 and s=i+j-1. The exact Fibonacci formula and
the elementary binomial subset identity give

    A(i,j)/choose(N,s)
      = choose(s,j) choose(s+1,j)/choose(N,j), i>=1.

For fixed j each numerator factor is log-concave as its upper argument
increases. Their product is log-concave, so the stronger ambient inequality
holds for the entire numerator-one horizontal family. The binomial identity,
normalization, inequality and conversion back to integer scalars are checked
in MarkovFibonacciAmbient77c2. MarkovAmbientSourceBounds77c2 supplies the exact
source and polygon transports when its successful receipts are listed in the
validation manifest. No statement about general interior rows follows.

## Experiments and a refinement distinction

ambient-source.json records 824,919 raw horizontal tests on all reduced
interior rationals of denominator <=50, with no ambient failure. The 342,074
coefficientwise tests using the earlier common C-site parameter, restricted
to denominator <=24, DO have a failure. At source 2/7, row j=1, i=5,6,7,
the deformed coefficients are experimentally

    64+4t, 36+t, 8.

The scaled gap is 336-24t+5t^2. Its coefficient of t is negative (-24),
but its value is positive for every real t, since

    5(336-24t+5t^2)=(5t-12)^2+1536.

At the actual source t=1 the raw triple is [68,37,8]; its raw gap is 825 and
its scaled gap is 317, both positive. These source-deformation identifications
are finite Python evidence here, not new Lean theorems. The refinement is
different from the inherited Pell charge q. Failure of one coefficientwise
refinement does not refute either unrefined candidate.

ambient-weights.json additionally records 1,365,665 exact evaluations at
t in {0,1,2,5,10,100,1000} for the 383 reduced source words with denominator
<=35. No ambient failure was found. Only t=1 is the actual source family.
All scans preserve zero coefficients by lookup with default zero; zero
endpoint products are omitted from counted nontrivial tests because their
inequality follows from a nonnegative middle square.

## Pell generating-function route retained as a derivation

For inherited H(a,j,s,q)=choose(a-q,s)choose(s+q-1,q)choose(2s,j-q),
s>=1, negative-binomial expansions give the formal generating identity

    sum_(a>=s,j,q) H(a,j,s,q) x^(a-s)y^j t^q
      = (1+y)^(2s)/((1-x)^(s+1)(1-txy)^s).

Summing over s, including the separately defined s=0 term, produces a
quadratic denominator in x. This derivation is not a Lean theorem here and
does not prove the required diagonal coefficient comparison. It is recorded
as a possible representation for a global aggregation proof, rather than
another fixed-radius comparison.

The published target was retrieved live at
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
Hosted searches for binomial/hypergeometric log-concavity did not supply a
theorem used as a premise. No external assertion was added as an axiom.
Local validation reuses inherited compiled imports; it is not an independent
audit or fresh whole-source rebuild.
