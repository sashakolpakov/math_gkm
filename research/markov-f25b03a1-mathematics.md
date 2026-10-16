# Row-two vertical strip and arbitrary-degree raw gaps

Machine-authored live request f25b03a14b4d4680ba608ed153fcd2b6.
Full pinned Conjecture63 remains unresolved. The final validation manifest
determines checked source bytes; a draft's existence is not validation.

The unconditional source theorem `source_strip_fullMF25` states, for every
finite source path and every natural column i,

    A(i,2) A(i,4) <= A(i,3)^2.

Here A is the unchanged integer `coeff` of `(frame path).mid.p`. No bound on
the denominator, path length or column is present, and zeros are retained.
The b>=2a region is inherited from `source_strip_halfconeM570`. For b<=2a,
the reconciled M81F identities and certificates are connected by the new
source-statistic bridge. The three cones split at 3a=2b and 4a=3b. With
i=a-1+k, b=k+l+2 and l>=2, the nonnegative parameters are respectively
2a-b, 3a-2b and 4a-3b. Natural subtraction and the piecewise source statistics
are identified in `high_source_gapMF25` before applying the cone results.

The third cone coverage, excluded from the predecessor's final checked set,
was copied into a new MF25 module and checked. It covers k=0 separately,
l>=9 by translation, and each remaining l=2,...,8 by its explicit certificate.
The predecessor's 21 certificate modules and the first two coverage modules
now have successful individual isolated kernel replays recorded here. Their
source bytes and compiled artifact hashes match the inherited manifest.

The actual coefficient equations use J,H,I and N=k+l, C=choose(N,k):

    2 F(N,3) A(i,2) = C J,
    6 F(N,5)(k+1) A(i,3) = C l H,
    24 F(N,7)(k+1)(k+2) A(i,4) = C l(l-1) I,

where F(x,d) is the falling factorial. The exact raw-gap clearing factor is
144 F(N,5)^2 (N-5)(N-6)(k+1)^2(k+2), strictly positive when N>=7.
The corresponding gap is

    G=4(N-5)(N-6)(k+2)l H^2
      -3(N-3)(N-4)(k+1)(l-1) J I.

The source theorem handles b<=8 using literal source polynomials and path
injectivity. Before the interior, A(i,2)=0 by lower support; beyond the upper
boundary, A(i,4)=0. No coefficient is divided out. The high-cone assembly
and the final all-source theorem passed compilation, isolated replay and the
permitted-axiom audit.

`root_iff_interiorMF25` proves the exact equivalence

    Conjecture63 <-> InteriorCore63MF25.

Its unproved residual keeps horizontal j>=5, vertical i>=4 and j>=3, and
the inherited deeper constant-i+j clause. All polygon and total-degree guards,
source assumptions, zeros and endpoints are retained through the equivalence.
The full literal definition is in `research/MarkovResidualMF25.lean`.

## Arbitrary-degree coefficient method

The new general development is in `MarkovFallingGapMF25.lean`; it and its
source adapters compiled, passed isolated replay and the permitted-axiom
audit. The final validation manifest binds the exact bytes. For an arbitrary real
polynomial P of degree at most d and d<=k+l, define

    H(P,d,k,l)=sum_(r=0..d) P[r] F(k,r) F(l,d-r).

The coefficient identity is

    F(k+l,d) [X^k]((1+X)^(k+l-d) P)
      = choose(k+l,k) H(P,d,k,l).

There is no positivity assumption on P. Let n=i+j+2, Q=(1+X)^(n-d)P,
and define

    G(P,d,i,j)=(i+2)(j+2) H(P,d,i+1,j+1)^2
      -(i+1)(j+1) H(P,d,i,j+2) H(P,d,i+2,j).

Then the exact clearing identity is

    (i+2)(j+2) F(n,d)^2 (Q[i+1]^2-Q[i]Q[i+2])
       = choose(n,i+1)^2 G(P,d,i,j).

Both clearing scalars are positive. Consequently the raw inequality is
equivalent to G>=0, and the all-natural-index raw LC predicate is equivalent
to these gap conditions for all i,j with n=i+j+2. Beyond degree n the right
neighbor is zero. This does not cancel binomial smoothing or require P to be
log-concave. The case d=0 and zero or signed seeds are included.

`MarkovSourceFallingMF25.lean` connects this exact criterion to actual source
horizontal rows when 2r+1<=b, and vertical columns when 2r+1<=a, using the
inherited all-order residual polynomials and their degree bounds. These are
equivalences with unproved gap signs. They remove no additional source region.
The opposite factorization ranges cannot be inferred by reversing smoothing.

## Experiments and rejected broader route

The high-cone denominator-48 scan passed 31,155 coefficient identities and
21,011 raw inequalities on 345 high-cone sources, retaining 10,626 zero
triples. It enumerated all 711 interior reduced source fractions up to 48.
Checking child labels before constructing their polynomials avoided the
unnecessary out-of-bound products in the interrupted predecessor's scan.

The arbitrary-degree experiment passed 36,400 coefficient identities and
32,040 gap identities/equivalences on 2,184 seeds, including 1,605 signed
seed cases and 4,571 zero-containing triples. These are finite tests only.

A source-only prescribed-factor probe covered 8,702 rows at denominator<=48,
with 161,693 exact divisions, 127,898 seed LC checks and 413,115 raw checks.
It found no failure. Earlier all-order reports already contain larger finite
source scans; this is a reproduction with a monomial factor, not a new
universal statement or a claimed record in coverage.

The 2,207 enlarged-word probe reproduced known vertical and diagonal failures:
AAAABB has [4,6,10] vertically, and ABABBBBBB has [10,14,20] diagonally.
Searching inherited reports confirmed these obstructions were already known.
All 612,637 horizontal comparisons passed, while the vertical and diagonal
tests had 214 and 229 failures. These non-source words do not refute the root.
No theorem about arbitrary-word vertical or diagonal LC is used.
