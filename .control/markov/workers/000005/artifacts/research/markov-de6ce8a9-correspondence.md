# Integral residual-factor certificate and remaining scope

Machine-authored live worker de6ce8a9416947d1b06f5290592fd125.
This is a local mathematical scope argument, not an independent completion audit.
Build/replay receipts, including failed attempts, are in evidence/markov-de6ce8a9/.
Consult the final validation manifest before treating a candidate as checked.

The source is [Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
retrieved live during this run. We use its numerator recurrence already connected
to the pinned frame in MarkovSource4b5. No external theorem becomes a Lean axiom.

## Mathematical argument

Write d=a+b-1. Substitute v=s-u and w=s²t in the homogeneous numerator.
The three seed values become 1, s²(1+ut), and s. Suppose the retained endpoint
X, middle Y and opposite endpoint Z have degree parameters dx,dy,dz. The
label identities give dy=dx+dz+1 and aX+bX=dx+1. If the three substituted
polynomials are s^dx qx, s^dy qy and s^dz qz, the new polynomial is exactly

    s^(dx+dy+1) ((1+st) qx qy - u^aX (s-u)^bX t^(aX+bX) qz).

This identity holds in every commutative ring, even with zero divisors. It
uses neither division nor positivity. Fold induction therefore supplies the
factor s^d for every finite path, in both orientations, including endpoint
seeds. evalTriDe6 is the literal nested polynomial evaluation homomorphism;
the images of its three variables are separately proved.

For extraction put u=x and s=1+x in Z[x][t]. Let D(t)=P(x,1,t), with
D_r(x) its coefficient of t^r. Then the certificate gives

    (1+x)^d | D((1+x)²t).

Extracting t^r gives (1+x)^d | D_r(x)(1+x)^(2r). Cancellation in the integral
domain Z[x], with 1+x nonzero, gives

    (1+x)^max(d-2r,0) | D_r(x).

For 2r>d the exponent is zero and the divisibility statement is trivial.
Zero slices remain included. The coefficient calculation does not remove
leading, trailing, or internal zeros, and the divisibility is over Z[x].
This proves existence of the prescribed integral quotient, not maximality
of the power and not any coefficient sign or inequality for that quotient.

By homogeneous degree d, the ordinary mathematical meaning of D_r is
sum_i A_(i,d-r-i) x^i (zero if r>d). The new formal theorem defines D_r by
literal polynomial evaluation and extraction. A separate explicit Lean
equality with the earlier DiagonalSeq definition is not claimed in this run.
The inherited homogeneous coefficient theorem supports the interpretation;
the remaining syntactic adapter is recorded instead of silently presumed.

## Correspondence obligations

* Coverage: the result quantifies over every finite path; inherited rational
  coverage/uniqueness remains applicable without any bound.
* Source family: the original numerator4b5 and its checked literal source
  seeds/recurrence are used. No arbitrary-matrix-word enlargement occurs.
* Homogeneity/coefficients: all coefficients are ordinary integers. This is
  integral factor removal, never factorial or multinomial normalization.
  Explicit transport to the earlier DiagonalSeq remains to be formalized.
* Polygon: no new Newton-polygon equality is proved. Lower support containment
  and the full convex-hull identification remain formal obligations.
* Directions/zeros/endpoints: no target inequality is altered. All slices,
  including zeros, are retained; the certificate includes all three seeds.
  Only the constant-i+j residual strategy is advanced. Horizontal and vertical
  interior inequalities are untouched.
* Assumptions: successful new modules use inherited compiled project imports
  and pinned read-only Mathlib. This is not a complete fresh dependency rebuild
  or independent validation. Printed axiom closures must be the permitted set.
* Proof scope: residual divisibility does not imply residual nonnegativity,
  adjacent LC, no internal gaps, or CrossLC. The independent residual audit's
  adjacent-versus-cross distinction remains essential. Neither Conjecture63
  nor its negation is proved, and completion remains null.
