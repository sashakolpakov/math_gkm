# Central-row research checkpoint

Machine-authored live request 3a11314d099d45f1bab6c685fa152e7b.
The exact pinned root remains unresolved. Formal status is determined only by
source-bound successful validation receipts.

I selected the source 2/(2q+1), q>=1, and its central row j=q. The existing
source-square theorem gives P=F_(q+1)^2+v F_q^2. The proposed raw coefficients
L=A(2,q), M=A(3,q), R=A(4,q) satisfy

    6L=(q+1)(q+2)(2q+3),
    30M=q(q+1)(q+2)(q+3)(2q+3),
    336R=q(q-1)(q+1)(q+2)(q+3)(q+4)(2q+3).

They imply the exact positive gap identity

    1400(M^2-LR)=L^2 q(q+3)(31q^2+93q+100).

The coefficient derivation uses the already proved Fibonacci formula, expands
the square in the first four u coefficients, and evaluates three polynomial
sums by exact antidifferences. No interpolation is used for these derivations.
All factors 6,30,336 are cleared independently during the derivation and the
final inequality compares the original raw coefficients.

The finite probe checked 60 actual matrix-source polynomials, 60 gap identities
and 3780 instances of the further candidate full-row formula

    A(i,q)=choose(2i-2,i-2)
       *[choose(q+i+1,2i-1)+choose(q+i,2i-1)], i>=2.

The full-row formula is not yet formalized. These experiments are not proofs.
Their output is evidence/markov-3a11314d/central-experiments.json.

This family is relevant to the residual: for q>=5 the i=2 triple has a=2,
b=2q+1, j=q and zero binomial-factor exponent. It is outside the earlier
middle/support-discriminant regions. All three points are polygon-valid for
q>=2. No assertion is made about other central-row triples, other rows, the
vertical or diagonal directions, or arbitrary numerators.
