# Lower numerator-two rows and a local midpoint inequality

Machine-authored live request 58e5700333bc4922a9949ab13f9bac6f.
All mathematical claims below refer to the named Lean declarations, subject to
the source-bound validation receipts. Full Conjecture63 remains unresolved.

Write F_n for the inherited recurrence-defined Fibonacci numerator. For j,d≥0,
i≥2, the formerly experimental square identity is now proved:

    [u^i v^j] F_(j+d+1)^2
      = Σ_(h=0)^(i-2) C(2d,h) C(2i-2-h,i) C(j+i+1,2i-1-h).

The coefficients at i=0,1 are zero. The proof uses the global actual F_n
coefficient identity, then expands C(j-t+d,l-1) and C(t+d,b-1) by finite
Vandermonde. With l+b=i, indices e<l and f<b, the t-convolution becomes

    C(d,e) C(d,f) C(i-1-f,l) C(i-1-e,b)
      C(j+i+1,2i-1-e-f).

The restrictions e<l and f<b are extended to e,f<i only after proving each
added summand zero. This remains valid for l=0 and l=i, where the source
coefficient products vanish. The l-sum is finite Vandermonde. The double sum
over e,f becomes a triangular sum over h=e+f by triangle_sumM58E, with all
terms e+f≥i proved zero. The h=i-1 term is also zero. A final Vandermonde
convolution of C(d,e)C(d,h-e) yields C(2d,h). These facts are proved in
MarkovOffsetPairM58E, MarkovOffsetSquareM58E and MarkovOffsetFormulaM58E.

Using the inherited actual-source square identity gives, for q=j+d≥1,

    A(i,j) = D(j,d,i)
      = Σ_(h=0)^(i-2) C(2d,h) C(2i-2-h,i)
          [C(j+i+1,2i-1-h)+C(j+i,2i-1-h)].

Here an empty sum gives zero. The source is 2/(2q+1). The j=0 case is proved
separately: the V F_q² term has zero constant v-coefficient, and the second
binomial in the displayed sum vanishes. Thus there is no truncated j-1 index.
The source theorem quantifies over every finite path with the indicated label.

lower_positiveM58E proves D>0 exactly for 2≤i≤j+2d+2; lower_lowM58E and
lower_highM58E retain the zeros outside. The same interval is precisely the
pinned polygon section. For positivity one explicitly selects h=i-j-2, with
natural subtraction, and proves all three binomial support bounds before
using positivity. This natural subtraction is confined to this guarded witness.

LowerBinomialLCM58E asserts D(i)D(i+2)≤D(i+1)² for all j,d,i with j+d≥1.
lower_source_iffM58E proves its equivalence to every polygon-valid horizontal
triple in every lower row of every actual numerator-two source. In one direction
the explicit path replicate(j+d-1,false)++[true] supplies the source. Zero tails
recover all-index inequalities from the polygon-restricted statement. The full
root implies this subproblem; the converse to the full root is NOT claimed.

## Local sign calculation

Remove only the h-dependent binomial weight and write

    K(j,i,h)=C(2i-2-h,i)[C(j+i+1,2i-1-h)+C(j+i,2i-1-h)].

For h+2≤i≤j+h+2, lower_core_scaledM58E proves the exact identity

    (2i-1-h)K(j,i,h)=(2j+3+h)C(j+i,i)C(j,i-2-h).

This is an internal algebra identity, not a replacement coefficient normalization.
Finite choose identities then give the diagonal recurrence

    (i+1)(2i-h)(2j+3+h)K(j,i+1,h+1)
      =(j+i+1)(2i-1-h)(2j+4+h)K(j,i,h).

Two such recurrences reduce the local raw product gap to the scalar factor

    G=(j+i+1)(i+2)(2i-1-h)(2i+2-h)
        -(j+i+2)(i+1)(2i+1-h)(2i-h).

Put i=k+h+2, j=k+t, k≥0,t≥1,j≥2. For k=0 this is
(t-2)(h+3)(h+4). For k≥1 put x=k-1,y=t-1; its expansion is

    24+32y+62x+24xy+30x²+4x²y+4x³
      +4h+11hy+15hx+4hxy+4hx²+h²y+h²x.

Lean ring checks both equalities and positivity proves their sign. Thus
lower_core_mixedM58E proves K(i,h)K(i+2,h+1)≤K(i+1,h)K(i+1,h+1) in
the indicated support. Multiplying by nonnegative binomial weights and proving
the out-of-support terms zero yields lower_term_localM58E for EVERY natural
i,h,d when j≥2. This is a local inequality on summands, not on their sum.

## What is still missing

For the correctly zero-extended summands T(j,d,i,h), the candidate global bound

    T(i,h)T(i+2,k) ≤ T(i+1,floor((h+k)/2))T(i+1,ceil((h+k)/2))

passed 1,316,172 finite tests for j≥2. Only the adjacent h,k=h+1 instance
is newly proved. The global bound and the discrete summation theorem are not
formalized. At j=1 the bound is FALSE: for all d≥1 its comparison at
i=2,h=0,k=1 has reversed gap 2d, proved in lower_term_midpoint_failsM58E.
The more restrictive synchronized mixed-gap premise also fails. At d=1 the
actual source is 2/5 and its raw triple is [5,16,17], which satisfies LC;
lower_obstruction_sourceM58E checks that source, polygon and inequality.

Theorem 3 of Gozlan–Roberto–Samson–Tetali, *Transport proofs of some discrete
variants of the Prékopa–Leindler inequality* (2019), supplies a published
floor/ceiling summation principle on Z:
https://arxiv.org/pdf/1905.04038 . The statement on pages 2–3 was read via
hosted search on 2026-10-16. Its use here is a proposed route only. No theorem
from that paper has been added as an axiom or formal premise, and zeros and
finite support would have to be handled by a proved implementation.

The two missing steps would address lower horizontal numerator-two rows only.
Upper rows, the other directions, and every remaining higher-numerator source
are still required by the pinned root and its unchanged residual.
