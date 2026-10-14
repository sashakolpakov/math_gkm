# Distance two and aggregation of three charge classes

Machine-authored research, request 863a748264774e87895cba827a773f3c.
No novelty claim. Full pinned Conjecture63 remains unresolved.
Local validation receipts, including rejected attempts, are under
`evidence/markov-863a7482/`; the final validation manifest controls formal status.

Use the inherited, source-connected summand

    H(a,j,s,q) = choose(a-q,s) choose(s+q-1,q) choose(2s,j-q), s>=1.

Negative lower indices and out-of-range binomials contribute zero. In Lean,
horizontalTerm9a72 uses final argument s-1 and explicitly guards q<=j.
The sum is the literal raw source coefficient at i+j=a+s for a/(a+1).
The auxiliary charge variable does not normalize those coefficients.

## Two orientations at distance two

The new universal comparisons are

    H(a,j,s,q) H(a,j,s+2,q+2) <= H(a,j,s+1,q+1)^2,
    H(a,j,s,q+2) H(a,j,s+2,q) <= H(a,j,s+1,q+1)^2.

All natural parameters, including vanished endpoint cases, are covered.
The proofs separate three binomial factors. The descending/ascending first
factors satisfy the respective skew binomial inequalities. For the other
two factors, scalars compensate a possible failure of individual log-concavity.

In the reverse orientation their bounds have scalars (s+1,s) and (s,s+1).
In the forward orientation they have scalars (s+1,s+2) and (s+2,s+1).
The positive scalar products cancel. Binomial recurrences provide exact
denominator-cleared identities; explicit nonnegative polynomial certificates
prove the remaining scalar comparisons. Rational numbers occur only in these
proofs, and the final summand statements are integer inequalities.

This does not extend to arbitrary charge separation. The inherited distance-three
counterexample to individual midpoint domination remains intact.

## An aggregate consequence

Write L_i=H(a,j,s,q+i), M_i=H(a,j,s+1,q+i), R_i=H(a,j,s+2,q+i).
The neighboring and distance-two inequalities imply

    L_0 R_2 + L_1 R_1 + L_2 R_0 <= M_1^2 + 2 M_0 M_2.

This is stronger than merely adding the two distance-two bounds, which would
spend the middle-square contribution twice. Here is the algebraic argument.
Put x=L_0 R_2, y=L_2 R_0, z=L_1 R_1, b=M_0 M_2, c=M_1^2.
We have x,y,z<=c, xy<=b^2, xz<=bc, yz<=bc, and b>=0.
If x,y<=b the conclusion is immediate. Otherwise suppose x>b (the other
case is symmetric). Then x>0 and

    (x-b)(b+c-x) >= 0,
    x(x+y+z) <= x^2+b^2+bc <= x(c+2b).

Canceling x proves the claim. The product hypotheses come from the inherited
same-charge and adjacent-charge comparisons, together with the new distance-two
comparisons. No summation closure is assumed.

Consequently any three consecutive charge classes form a coefficientwise
log-concave polynomial sequence. Its five potentially nonzero gap coefficients
use, in order, same-charge, adjacent-charge, the displayed aggregate inequality,
adjacent-charge, and same-charge comparisons. All other coefficients are zero.
The quadratic coefficient of the *full* refined gap is therefore nonnegative
for every n,j,s: it only uses charges 0,1,2. The finite range cutoff is removed
by a proved support-zero lemma, not by assuming indices fit the range.

The moving-cutoff theorem `truncated_three_boundary863` proves nonnegativity
at coefficient 2r+2 for every cutoff r. Its convolution has only the three
surviving indices r,r+1,r+2; all omitted terms are proved zero. This remains
only one coefficient of each truncated gap.

## Experiments and sources

The exact finite probe tested 1,814,428 three-charge middle gaps through a=44
without failure. It also tested symmetrized midpoint comparisons at distances
3 through 6 for a<=30 without failure. These are experiments, not universal
statements. The largest observed distance-two endpoint sum divided by the
middle square was 23569504/17068095 at (a,j,s,q)=(44,24,20,9); thus a naive
bound by one middle square is already false in this scan.

The published target was retrieved live from the
[publisher](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
No external theorem was added as a Lean axiom. SymPy and NumPy are unavailable;
Sage was not found on PATH; GAP was found but was unnecessary. Exact symbolic
discovery used Python standard-library rational arithmetic.

The full sum over arbitrary charges, all other source rationals, and the
remaining directions still require proof. Local checks reuse inherited
compiled imports and are not independent source-correspondence certification.
