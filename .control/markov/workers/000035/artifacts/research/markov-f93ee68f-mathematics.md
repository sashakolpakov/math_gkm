# Horizontal sector obstruction in a literal source row

Machine-authored research, request f93ee68f6b414a928b23bb07728597c4.
This is not a resolution of the pinned Conjecture63. Final build and replay
status is recorded separately in evidence/markov-f93ee68f/validation.json.

The fixed-charge matching agenda did not yield a new injection or inequality.
A different sufficient strategy was tested: factor each horizontal polynomial
into linear factors and quadratic factors whose own raw coefficients are LC.
Nonreal roots of a real quadratic a+bX+cX² with ac<=b² obey
Im(z)²<=3 Re(z)². Thus a source root violating this inequality obstructs that
factorization strategy, even though the source's coefficient sequence can be LC.

Take the actual protected frame at List.replicate 22 true. Its label is 23/24.
The horizontal row j=26 has degree 20 and coefficients, starting at i=0:

    231, 18970, 790020, 21380814, 411390021, 5877864648,
    63867821040, 535035189040, 3482178704004, 17673238724232,
    70013501181456, 216200137267800, 518547977245980,
    960132948955632, 1359501339086496, 1451168335625904,
    1142452982137950, 640766198533860, 241484804873928,
    54673498591404, 5608233007146.

MarkovSectorSourceF93e connects the entire polynomial to the literal source
row, using the inherited exact raw Pell coefficient formula and zero cases.
It also proves the raw horizontal inequality for every natural starting i,
including indices beyond the support. Its polygon on this row is exactly
0<=i<=20. Thus the sector obstruction is explicitly NOT a raw LC failure.

## Exact complex root certificate

The root lies in the radius-1/10000 disk about an explicitly recorded rational
complex center approximately

    -0.02823064230705693446 - 0.05087697677069144583 i.

The full 100-decimal rational coordinates are in the Lean module and
sector-certificate.json. Exact rational Horner evaluation bounds |Re P(c)|+
|Im P(c)| strictly below (1/10000)^20. No floating-point assertion enters the
proof. The general certificate in MarkovRootCertificateF93e uses factorization
over C: if every root were at distance at least r, then

    |P(c)| = |leadingCoefficient| product_roots |c-z|
           >= |leadingCoefficient| r^degree.

The strict reverse bound therefore supplies an actual root in the disk.
Elementary rational bounds on the entire disk imply Re z<0 and
3(Re z)^2<(Im z)^2. This is outside the closed 120-degree sector centered on
the negative real axis. The initial numerical approximation only selected the
rational center; the formal proof checks the residual and existence directly.

MarkovQuadraticObstructionF93e gives the precise factorization obstruction.
For any real a,b,c, not all zero, with ac<=b², a complex number satisfying
Im(z)²>3 Re(z)² cannot annihilate a+bz+cz². Taking imaginary and real parts
forces b=-2c Re(z) and a=c(Re(z)²+Im(z)²), contradicting ac<=b² when c≠0;
c=0 forces all coefficients zero. Therefore the actual source row is not a
finite product of such nonzero real linear/quadratic factors. This statement
even omits nonnegativity assumptions on the factors, making the obstruction
stronger. It excludes a specific sufficient proof route, not more general
factorizations or direct coefficient arguments.

## Finite probes and limits

The first numerical scan considered 6175 nonconstant stripped slice polynomials
through denominator 20. It found vertical and diagonal sector violations; no
horizontal violation occurred in that finite range. The subsequent source
scan with bound 45 was time-capped after 194 source polynomials and 6275 rows;
it is NOT complete coverage through denominator 45. One row exceeded the
numerical residual tolerance and is marked unreliable.

The enlarged-word scan stopped after 519 words and 6225 rows on finding
horizontal candidates outside the sector; two numerical rows were unreliable.
Those enlarged words are not asserted to belong to the source family.
The targeted Pell scan located the exact-source candidate above. Every
numerical result remains experimental; only explicitly checked Lean theorems
receive theorem status. No universal claim follows from any scan.

The direct source is Evans--Veselov--Winn, published Conjecture 6.3:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
Hosted literature search found no applicable general proof of the fixed-charge
fiber goal. Sector-stability and matching references were exploratory only;
no external assertion was introduced as an axiom. No novelty claim is made.
