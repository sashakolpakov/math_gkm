# Global correction formula: rational bridge and coefficient derivation

Machine-authored request 13e3704044384ce789e16ba0f49af882. This document gives
an ordinary formal-power-series derivation of the inherited correction candidate.
The rational identities and their attachment to the source are kernel-checkable
Lean theorems in this run. The two binomial coefficient extractions below are
paper-level deductions, still explicit open propositions in Lean. Neither this
formula nor the proved LC of its correction resolves the full source inequalities.

Put B=3q+delta, delta=1 for r=true and delta=2 for r=false, and epsilon=3-delta.
For i>=3 put c=i-3 and k=B+2-i-j. Define zero-extended kernels

    D_c(j,k) = sum_{s=0}^{min(j,k)} w_s binom(j-s+c+3,c+3) binom(k-s+c,c),
    w_0=1, w_s=4s (s>0),
    K^epsilon_(a,b)(J,K)
      = sum_{s=0}^{min(J,K)} (3s+epsilon) binom(J-s+a,a) binom(K-s+b,b).

Each kernel is zero if either of its two coordinate arguments is negative.
The formula is

    A(i,j) = D_(i-3)(j,B+2-i-j)
           + 4 K^epsilon_(i-1,i-2)(j-q-1,B-q-i-j).

No coefficient is normalized. The coordinates of a kernel are checked before
natural-number conversion. In particular this is not a formula for columns 0,1,2.

## Proved rational source decomposition

Use u,v for the literal squared-variable polynomial variables, and z to mark q.
Define S=u+v+1 and

    F=(1-vz)(1-v^2 z)-uvz,
    G=1-(S^3-3vS)z+v^3 z^2,
    R=(1-v^3 z^2)^2, A=(1-v^3 z)^3, B0=(1-vz)(1-v^2 z)^2.

The inherited source series has denominator FG and its exact degree-three-in-z
numerator N_r. This run rebuilt the unchanged cubic recurrence and source-series
modules. The new checked polynomial identity is

    N_r R A B0 = N_D,r B0 F + N_E,r A G + N_L,r F G R.

N_D,r and N_L,r are explicitly defined integer polynomials in
MarkovGFAlgebraM13E. The latter has u-degree at most two. The correction numerators
are

    N_E,false = 4u^3 v^3 z^2(1+2v^3 z^2),
    N_E,true  = 4u^3 v^4 z^3(2+v^3 z^2).

All denominators have constant coefficient one, so inverse power series exist
over the integer polynomial ring without localization or analytic convergence.
MarkovGFSourceM13E proves the universal source-series decomposition

    Source_r = N_D,r/(R A G) + N_E,r/(R B0 F) + N_L,r/(A B0).

MarkovGFLowSupportM13E proves the last summand has zero raw coefficient at every
i>=3, for all q,j. This includes an actual path-family wrapper. It is not an
assumed coefficient-support fact.

## Proved trisection bridge

Introduce a master series, now with z marking the denominator index n:

    T = u^3 z (1+v z^2)^2 /
        ((1-v z^2)^2 (1-vz)^3 ((1-z)(1-vz)-uz)).

MarkovGFSectionAlgebraM13E proves polynomial norm and numerator section identities.
MarkovGFSectionM13E then proves

    [z^q] N_D,r/(R A G) = [z^(3q+delta)] T

as an equality of the full integer bivariate polynomials. This is formal residue
extraction using PowerSeries.expand and its coefficient laws, not an inference
from finite samples. Combined with the source decomposition it proves, for all
q,i>=3,j, the literal source coefficient equals the master coefficient plus the
correction-series coefficient. The source statement uses natural q; q>=1 is
retained in the actual numerator-three path family.

## Paper derivation of the master coefficient

Expand the last factor of T geometrically in uz. The coefficient of u^i, i>=3,
is

    z^(i-2) (1+v z^2)^2/(1-v z^2)^2
      * (1-vz)^(-(i+1)) * (1-z)^(-(i-2)).

The first quotient has coefficients w_s in (v z^2)^s: it is
1+4(vz^2)/(1-vz^2)^2. The other factors have binomial coefficients by the ordinary
integer negative-binomial series. To contribute to v^j z^n, their exponents must
be j-s and n+2-i-j-s. Both are nonnegative exactly when
0<=s<=min(j,n+2-i-j). Their coefficient is

    w_s binom(j-s+i,i) binom(n-j-s-1,i-3).

Summing gives D_(i-3)(j,n+2-i-j), with zero when the second coordinate is negative.
This is the content of the still-open Lean MasterKernelExtractionM13E.

## Paper derivation of the correction coefficient

Expand 1/F in uvz. At u^i, the false correction is

    4 v^i z^(i-1) (1+2v^3 z^2)/(1-v^3 z^2)^2
      * (1-vz)^(-(i-1)) * (1-v^2 z)^(-i),

and the true correction is

    4 v^(i+1) z^i (2+v^3 z^2)/(1-v^3 z^2)^2
      * (1-vz)^(-(i-1)) * (1-v^2 z)^(-i).

The quotient has coefficient 3s+epsilon at (v^3 z^2)^s. Write x,y for the
exponents chosen from (1-vz)^(-(i-1)) and (1-v^2 z)^(-i). Solving the two
exponent equations for v^j z^q gives

    x=B-q-i-j-s,  y=j-q-1-s.

Thus x,y>=0 precisely supply the two guard conditions and the stated finite
summation bound. The coefficient product is

    4(3s+epsilon) binom(x+i-2,i-2) binom(y+i-1,i-1),

which is exactly the correction K term above. This is the content of the
still-open Lean CorrectionKernelExtractionM13E. The derivation is locally finite
in the formal series ring and involves no infinite analytic interchange.

## What is proved about shape, and what remains

MarkovAffineKernelM13E proves nonnegativity, CrossLC of the affine weight,
row/column LC, the positive minor, and constant-j+k LC of K for positive epsilon.
MarkovCorrectionModelM13E transports the latter to every vertical triple of the
guarded correction model, including zero tails and boundary crossings. It also
proves the exact A=D+4K attachment at j=q+1, for every q>=2, both residues and
every i>=3, including degree tails. The q=1 exception is not silently truncated.

The global binomial identity has the paper derivation above but is not yet a
closed Lean theorem. The rational source bridge and trisection are closed Lean
theorems. No log-concavity of their full sum is inferred from separate summand
properties. Inherited actual-source negative mixed gaps remain an obstruction.
The full total gap, diagonal parameter variation, all remaining source families,
and exact-root completion remain open. No novelty claim is made.
