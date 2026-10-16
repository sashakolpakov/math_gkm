# Expanded unbounded-run third-column region

Machine-authored request ae257c53. The full pinned Conjecture63 is unresolved.
The final inventory records the exact validation boundary.

The source theorem vertical_third_half_remainderMAE2 states that for every
finite path whose middle label satisfies a>=7 and a<=2*(b mod a), and every
natural j,

    coeff P 3 j * coeff P 3 (j+2) <= coeff P 3 (j+1)^2.

This includes zero coefficients and has no denominator, run-length, or index
bound. vertical_third_half_regionMAE2 also includes the inherited region b<5*a.
The weaker intermediate vertical_third_remainderMAE2 replaces the preceding
worker's 2*a+4<=3*(b mod a) by 2*a<=3*(b mod a).

The new coefficient certificates prove the inherited all-run bounds predicate
for predecessor denominator L>=7 and numerator T>=1 with 2*T<=L. For 3*T<=L,
three translated cones cover all integer parameters. For 2*T<=L<3*T, put
x=L-2*T and y=3*T-L. Then x>=0, y>=1, L=3*x+2*y, and T=x+y. The three
charts (x>=0,y>=4), (x>=1,y>=2), (x>=2,y>=1) cover L>=7. Thus no fourth
midlow chart is necessary for this half-cone.

Each source chart is partitioned into twenty run/index chambers. The two
largest chambers use the inherited cubic coefficient certificate, exact
polynomial identifications, and separate nonnegative gap coefficients.
Ordinary Lean compilation checks every used chamber; Python is not a premise.
The inherited support argument converts the actual seed's adjacent inequalities
to CrossLC. Forward Pascal smoothing and monomial shifts then give the raw
third-column inequality.

The actual source indices are a=L, b=L*(n+1)+(L-T), with 0<T<L. Hence
b mod a=L-T and 2*T<=L is precisely a<=2*(b mod a).

root_iff_interiorHalfMAE2 proves Conjecture63 iff InteriorCore63HalfMAE2.
The remaining third-column clause includes a<=6, or a>=7 with b>=5*a and
2*(b mod a)<a. All previously unresolved higher rows, columns, and deeper
diagonals remain in that exact residual. The residual itself is not proved.

The finite half-cone experiment compared 61,374 literal coefficients and
checked 61,074 adjacent inequalities across 150 source fractions, retaining
44,739 zeros. It is separate finite evidence, not a universal proof.

Source/quotient modules were replayed over compiled imports. Separate replay
of every new coefficient-certificate dependency was not completed; large replay
groups timed out. There was no whole-source rebuild or independent completion
audit. See validation.json, compiled-inventory.json, and final-check.json.
