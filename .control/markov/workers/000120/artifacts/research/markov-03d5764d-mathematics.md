# An unbounded-run third-column region

Machine-authored experimental research, request 03d5764d3c1945eba3e1fffb38c57904.
The full pinned Conjecture63 remains unresolved. Acceptance status is determined
by evidence/markov-03d5764d/validation.json, not by candidate filenames.

The inherited exact coefficient formula writes 120 times the integral third
seed coefficient as E(L,T,C,D,F,q,j). Here L and T are the denominator and
numerator of the actual predecessor source; C,D,F are its prescribed truncated
counts. This work proves the coefficient inequalities for the cone
3*T+4 <= L, with T>=1, for every integer q>=5 and every integer j. It also
proves positivity at positions 3 through 3*q+6 and keeps positions 1 and 2
nonnegative, using the inherited source nonnegativity theorem. Negative and
exterior indices remain zero; no zero is removed.

The cone is parameterized by L=7+y+3*x,T=1+x with x,y>=0. Twenty index chambers
cover all required indices. For two large middle chambers, the coefficient
expressions are cubic in x,y. MarkovCubicCertificateM03 proves a general
coefficientwise nonnegative expansion of B(x,y)^2-A(x,y)C(x,y). Separate
definitions, three exact cubic identities, and 28 two-variable coefficient
inequalities verify each application. Ring proofs check the coefficient
tables against the inherited universal formula; Python is not a premise.

MarkovThirdBoundsTransportM03 establishes the exact conditional bridge from
the all-run bounds predicate to source seed CrossLC and raw third-column LC.
It handles q<=4 by the earlier checked source theorems. For q>=5 it uses
explicit support, nonnegativity, and the all-integer adjacent bounds with
crossLC_two_prefixM115. It does not infer CrossLC from adjacent inequalities
without the support argument. Integer-to-real casts are explicit.

The source assembly in MarkovThirdLowSourceM03 uses the actual run
decomposition a=L, b=L*(n+1)+(L-T). Since 0<T<L, the remainder b mod a is L-T.
Thus the new condition is exactly 2*a+4 <= 3*(b mod a). The intended theorem
vertical_third_remainderM03 states, for every path with a>=7 satisfying this
condition and every natural j,

    coeff P 3 j * coeff P 3 (j+2) <= coeff P 3 (j+1)^2.

The run length and denominator are unbounded. vertical_third_regionM03
combines this region with the inherited b<5*a result. The exact residual in
MarkovResidualLowM03 retains all original directions and guards. Its remaining
third-column cases include small numerators and, for a>=7, b>=5*a with
3*(b mod a)<2*a+4. The residual is not proved.

The finite experiment used 70 actual reduced fractions, a=7..15,
q in {5,8,17,41,97}, restricted to the new cone. It compared 29,615 literal
raw coefficients with the exact seed factorization and checked 29,475 adjacent
inequalities, retaining 21,804 zeros. No failure occurred. This is finite
experimental evidence, separately recorded in experiments.json.
