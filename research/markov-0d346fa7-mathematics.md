# Fourth vertical column and a uniform arithmetic question

Machine-authored live request 0d346fa78677421eb796b0c79e5057fa.
Full pinned Conjecture63 remains unresolved. No historical novelty is claimed.

Write A_q(i,j) for the raw coefficient of the source 2/(2q+1), q≥1.
The inherited source classification and square identity identify its polynomial
with F_(q+1)^2+v F_q^2, without normalization. This worker proves

    A_q(4,j) A_q(4,j+2) ≤ A_q(4,j+1)^2

for every q≥1 and every natural j, including zeros. The source theorem
source_two_vertical_fourM0D3 quantifies over every actual path with numerator
two, not just the canonical paths or a finite denominator range.

## Four exact regions

Use the inherited lower and upper coefficient formulas L_i(j,d) and U_i(N,d):

    L_i(j,d) = Σ_(h=0)^(i-2) C(2d,h) C(2i-2-h,i)
               [C(j+i+1,2i-1-h)+C(j+i,2i-1-h)],
    U_i(N,d) = Σ_(h=0)^i C(2d+h-1,h) C(2i-2-h,i-h)
               [C(N+i-h+1,2i-1-h)+C(N+i-h,2i-1-h)].

For i≥4 these give A_q(i,j)=L_i(j,q-j) when j≤q, and
A_q(i,j)=U_i(2q-j,j-q) when q<j<2q. All summation zeros remain.
The Lean upper formula has an explicit i=0 case and natural subtraction;
the displayed expression here is only used with i≥4 and positive d.

MarkovVerticalRegionsM0D3 and MarkovVerticalEquivalenceM0D3 prove that the
entire vertical column i≥4 is equivalent to these four families:

1. L_i(j,d+2)L_i(j+2,d) ≤ L_i(j+1,d+1)^2, all j,d≥0.
2. U_i(N+2,d+1)U_i(N,d+3) ≤ U_i(N+1,d+2)^2,
   all d≥0 and N+2≥i.
3. L_i(q-1,1)U_i(q-1,1) ≤ L_i(q,0)^2, all q+1≥i.
4. L_i(q,0)U_i(q-2,2) ≤ U_i(q-1,1)^2, all q≥i.

The forward source proof first tests the last point's polygon membership.
If it fails, its raw coefficient is exactly zero and the inequality follows
from square nonnegativity. Otherwise the upper degree bound forces all
parameters into the stated valid ranges. The last two families are precisely
the crossing triples j=q-1 and j=q. The converse uses an actual canonical
source path for each parameter choice. Thus no gap or endpoint is omitted.

## Polynomial certificates

Define choosePoly(x,k)=x(x-1)...(x-k+1)/k!. The pinned Pochhammer theorem
identifies it with the ordinary natural binomial coefficient at every natural
x, including x<k. No natural zero is replaced by a nonzero rational value.
MarkovVerticalPolyM0D3 proves the generic rational polynomial identities for
L_i and U_i, with the latter's positivity and index guards explicit.

For i=4 the four gaps, evaluated respectively at

    (j,d)=(x,y), (N,d)=(x+2,y), q=x+3, q=x+4,

have nonnegative ordinary monomial coefficients in x,y. The lower and upper
gap certificates contain 55 and 81 terms, and each crossing certificate has
13 terms. These counts describe the certificates, not a measure of research
value. The explicit identities are checked by Lean's ring normalization;
positivity then proves the sign for x,y≥0. Rational casts transfer the result
back to the original integer inequalities. Generated Python expressions are
untrusted until these checks succeed.

The residual theorem root_iff_interiorM0D3 removes exactly the clause a=2,i=4
from the inherited vertical residual. All other clauses and reverse-factor
ranges are retained. The unbounded witness family is source 2/(2n+13),
column 4, start row n+6. MarkovFourGainM0D3 proves every previous residual
guard and the newly proved inequality for every n. At n=0 its raw triple is
[6750,6716,5370], with gap 8,857,156 (the values here are finite computations).

MarkovUniformVerticalM0D3 also proves the exact factorization

    Conjecture63 ↔ UniformVerticalRemainingM0D3 ∧ OtherVerticalCoreM0D3.

The first factor is all four arithmetic regions for every i≥5. The second
retains the other-numerator vertical residual and all inherited horizontal
and diagonal residual clauses. Both factors remain unproved.

## A possible uniform approach, and its limits

For each i define the full gap polynomial in each region, using the shifts
N=x+i-2, q=x+i-1, q=x+i. Expand it in the Newton basis

    G_i(x,y)=Σ_(r,s) c_i(r,s) C(x,r) C(y,s),
    c_i(r,s)=Δ_x^r Δ_y^s G_i(0,0).

The proposed next question is whether every c_i(r,s) is nonnegative.
This is stronger than the required integer-domain sign, and is unproved.
Exact finite probes tested i=2,...,24, four regions, and both vertical and
diagonal gaps: 184 cases, with no negative Newton coefficient found.
Coarse degree bounds from the displayed formulas are below the interpolation
rectangle 0≤r≤4i+6, 0≤s≤2i+4 (crossing cases are univariate).
The diagonal formulas and their complete source-region reduction have not
been formalized in this worker. A probe is not a universal theorem.

Ordinary monomial positivity fails at i=8. More decisively, the rational
continuation of the lower gap at i=8,x=0,y=1/4 equals -19/131072.
MarkovContinuousObstructionM0D3 checks this value and refutes a universal
nonnegative-real-offset strengthening. The source parameter would be
q=x+y+2=9/4, so this is not an actual source index or a root refutation.
The Newton basis is appropriate specifically because its values are
nonnegative at natural indices; it need not be nonnegative between integers.

Earlier in the worker, midpoint experiments failed even when both rounding
orientations were permitted. For F_4 the coefficient pair (1,3),(2,1) has
product 24, while either candidate rounded product is 18. The square-sum
convolution midpoint test also fails on exact finite summands. These are
strategy obstructions, not failed raw source inequalities.

Source comparisons checked 51,864 coefficients and 3,160 fourth-column triples,
including 415 zero-containing triples; another 91,480 vertical/diagonal triples
include 53,600 zero-containing triples. Sixteen sources also matched direct
recurrence construction. Bounds, failures, and scripts are preserved in
evidence/markov-0d346fa7/. All such computations remain experiments.
