# Mathematical results

Machine-authored request beca0ad5893a498d8ecc9af0fd97b9f0.
The full pinned `MathGKM.Markov.Conjecture63` remains open. No novelty claim.

## Exact upper-interval representation

Keep the predecessor's actual auxiliary polynomials

    q(j,s)[i] = w(j-i) choose(s+i+3,i),
    w(0)=1, w(r)=4r for r>0, w(r)=0 for r<0.

Write `F(n,r)=n.descFactorial r` and, for 0<=r<=j,

    K(j,s,r) = w(r) F(j,r) / F(s+j+3,r),
    C(j,s,t,h) = sum_(r=0)^h K(j,s,r) K(j,t,h-r).

`MarkovReverseKernelMBEC.lean` proves, universally for h<=j,

    [X^(2j-h)] q(j,s) q(j,t)
      = choose(s+j+3,j) choose(t+j+3,j) C(j,s,t,h).

The proof derives the falling-factorial/binomial identity from `Nat.choose_mul`,
then reflects the actual finite polynomials. Every canceled binomial scale and
falling-factorial denominator is proved strictly positive. No coefficient zero
is divided by, and no source coefficient is redefined.

The inherited `UpperAdjacentMA45` is exactly equivalent to

    C(j,s+1,s+1,h) C(j,s,s+2,h-1)
       <= C(j,s+1,s+1,h-1) C(j,s,s+2,h),     2<=h<=j.

This is an exact reparameterization h=2j-n, not a restriction of the remaining
upper interval. The predecessor already proves the lower interval, cutoff and
last step, including its zero-tail and small-parameter bridges.

## Two additional universal adjacent steps

`MarkovSecondTopMBEC.lean` and `MarkovSecondTopClosedMBEC.lean` prove h=2 for
all j>=2 and all s>=0. With x=s+j+3, the normalized gap is exactly

    128 j^2 (j-1) (2x+1) / [x^2 (x-1) (x+1)^2 (x+2)].

The source of this expression is proved through the top three actual q
coefficients and their binomial recurrences. The sign is established by Lean
algebra and positivity, not by the GAP computation that suggested the formula.

`MarkovReverseThreeMBEC.lean` proves h=3 for all j>=3 and all s. Put j=k+3.
The normalized gap is

    (k+2)(k+3)^2 P(k,s) /
      [(k+s+4)(k+s+5)^2(k+s+6)^2(k+s+7)^3(k+s+8)],

where the proved positive polynomial is

    P = 342528 + 123264s + 11136s^2
        + 534656k + 163968ks + 12160ks^2
        + 262656k^2 + 61184k^2s + 3072k^2s^2
        + 49024k^3 + 6144k^3s + 3072k^4.

`MarkovReverseCoreMBEC.lean` therefore proves the exact equivalence
`ReverseCoreMBEC ↔ UpperAdjacentMA45`, where ReverseCore keeps all 4<=h<=j.
It also proves every auxiliary adjacent ratio for j<=3 and arbitrary s.
This is not a theorem about all source labels with numerator at most three.

## Exact integer and polynomial certificates

`MarkovClearedKernelMBEC.lean` removes fractions from the remaining obligation.
For r<=h<=j define the integer

    L(j,s,h,r) = w(r) F(j,r) F(s+j+3-r,h-r).

Its cast equals F(s+j+3,h) K(j,s,r). Define B(j,s,t,h,m) by convolving
L(j,s,h,r) and L(j,t,h,m-r). The integer gap is

    G(j,s,h) = B(j,s+1,s+1,h,h-1) B(j,s,s+2,h,h)
                 - B(j,s+1,s+1,h,h) B(j,s,s+2,h,h-1).

`ClearedCoreMBEC`, the assertion G(j,s,h)>=0 for every 4<=h<=j and s,
is proved equivalent to `UpperAdjacentMA45`. This assertion remains OPEN.
The proof multiplies by the positive common scale
F(s+j+3,h) F(s+j+4,h)^2 F(s+j+5,h).

`MarkovPolynomialCertificateMBEC.lean` constructs an explicit polynomial family
in two formal variables U,V over the integers. Its kernel is

    T(h,t,r) = w(r) product_(i<r) (U+h-i)
                       product_(i<h-r) (U+V+h+3+t-r-i).

Use the same four convolutions and subtraction as G to form `certificateGapMBEC h`.
Its evaluation at U=k,V=s is proved exactly G(h+k,s,h), for all natural h,k,s.
The displayed natural subtractions are exact in the ranges used by the proof.

`CertificatePositiveMBEC` asserts that every coefficient of these polynomials
is nonnegative for every h>=4. It is an explicit UNPROVED sufficient condition.
Lean proves its implication to ClearedCore and then to every horizontal
numerator-three correction-band inequality covered by the inherited transport.
Thus this route now has a proved expansion/evaluation bridge. It does not rely
on the still-unproved Schur expansion or on experimental coefficient signs.

## Actual weight determinants

`MarkovWeightDeterminantsMBEC.lean` defines the four-row Jacobi–Trudi matrix
with entries w(lambda_i-i+j), using integer indices, for lambda=(a,b,c,d).
For a>=b>=c>=d>=0 it proves:

* If c>=3, the determinant is zero.
* If b>=2 and c<=2, it is
  `16(a-b+1)(1 + [c=1] + [d=1])`.
* If a>=1 and b<=1, writing r=b+c+d, it is `4((2r+1)a-r)`.
* At the empty partition (0,0,0,0), it is 1.

Consequently it is always nonnegative and vanishes exactly when c>=3.
These universal formulas settle the determinant evaluations in the predecessor's
four-row Schur experiment. They do not establish its general expansion or the
signs of its surviving coefficients. No Schur-positivity shortcut is assumed.

## A rejected generalization

`MarkovWeightObstructionMBEC.lean` proves nonnegativity and zero-extended CrossLC
of weights [1,3,9,1]. At j=3,s=0 their weighted q polynomials have coefficients

    [1,36,30,20], [1,45,45,35], [1,54,63,56].

For A=q(0)q(2), B=q(1)^2, the values are A_3=3964, A_4=4986,
B_3=4120, B_4=5175, giving B_4 A_3-B_3 A_4=-28620.
The theorem formally refutes replacing the actual weights by arbitrary
nonnegative CrossLC weights. This is not a Markov source witness.

## Experimental checks

The separate source scan starts from the pinned frame recurrence: 50 fractions,
370 band rows, 25,161 coefficient comparisons, 11,363 retained zeros, and
208,455 polygon-valid raw triples across all three directions. No failures.

The representation check passed 6,880 reversed coefficient formulas, 6,880
integer-clearance formulas, 220 polynomial evaluations, 4,845 determinant
evaluations (including 4,060 forbidden-shape zeros), and 2,478 h=2 gap formulas.
These are independent finite computations, not theorem admission.

At h=2,...,12, the exact polynomial experiment found all 3,817 nonzero
coefficients positive; sparse division preserved positivity in the remaining
factors. The additional h=13,14,16,18,20 stress cases inspected 7,989 nonzero
coefficients, all positive; details are in `certificate-stress.json`.
No conclusion for unbounded h follows. The new polynomial representation,
rather than the experimental signs, is what Lean establishes universally.

An increasing-CrossLC-weight probe also failed, at j=9,s=0 and n=8,9,10.
Those rational-weight witnesses are experimental auxiliary obstructions only.

The [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was revisited. [Karp–Sitnik's primary paper](https://arxiv.org/abs/0902.3073)
was consulted for related rising-factorial coefficient inequalities. No theorem
from it was imported, and it supplies no asserted solution to the remaining
adjacent-ratio condition.
