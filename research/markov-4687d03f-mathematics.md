# Mathematical record

Machine-authored request 4687d03ffe8948abad1b235a519bed69.
Build, replay and axiom receipts determine which artifacts are checked.
Full pinned Conjecture63 remains unresolved.

Write a=1+u. The new forcing-row identity is

    [u^k] J_j(n,u) = binomial(j+3,k+3) binomial(n-j-1+k+3,k).

It holds for all natural n,j,k with the stated natural subtraction, including
k>j where the first binomial and the actual polynomial coefficient vanish.
Vandermonde and the exact multiplication identity for binomial coefficients
prove it; no tested values enter the proof. It implies the parameter recurrence

    J_(j+1)(n+2)+J_j(n)
      =J_(j+1)(n+1)+(1+u)J_j(n+1),   n>=j+1.

The same recurrence is proved for H using its inherited row recurrence.
Define formal power series over Z[u], with t the series variable,

    F_N(t)=sum_j H_j(N+j+1,u)t^j.

The parameter recurrence gives
(1-at) F_(N+1)=(1-t) F_N. The inherited signed row recurrence, after
clearing two copies of 1-at and using the analogous J series, yields

    (1-at)^(N+4) (1-2t+at^2)^2 F_N
      = (1-t)^N (1-at^2)^2.

Every denominator has constant coefficient one. Formal inversion therefore
defines a unique series; no analytic convergence or nonvanishing real value
is assumed. MarkovResolventSourceM468 connects its coefficient at t^j back
to H_j(n,u) for n>=j+1 and to the actual lower source rows for j<=q.
The old shape premise is equivalent to CrossLC of these coefficients for
N>=j. That premise is still unproved. The Euler-transformed six-term
alternating coefficient formula from the inherited report is not formally
identified by this result; its additional substitution bridge remains open.

A separate raw-column calculation gives

    A(5,j)=(j+1)(j+2)(j+3)(j+4)(j+5) / 30240 *
      [n^2(12j^2+72j+126)
       -n(30j^3+234j^2+576j+378)
       +19j^4+183j^3+596j^2+714j+252]

for every numerator-three source n=3q+1 or 3q+2 and j<=q. Its derivation
uses the exact discriminant equation, the proved columns 3 and 4, a
polynomial forcing identity, and uniqueness of a second-difference solution.
Interpolation proposed the polynomial; Lean checks its equation and source
identification independently of interpolation.

The new compiled source inequalities are horizontal across columns 3,4,5
for j<=q, vertical in column 5 for j+2<=q, and diagonal through
(3,j+2),(4,j+1),(5,j) for j+2<=q. Exact gap polynomials in j and the
nonnegative slack n-3j-1 or n-3j-7 have nonnegative coefficients; the latter
two gaps are strictly positive. MarkovResidualM468 removes
only these clauses from the inherited exact residual. No correction-band
or larger-numerator obligation is dropped. The final validation receipt
records compilation, replay and theorem-axiom outcomes separately.

Experiments: the larger shape scan evaluates the still-conjectural signed
coefficient formula; the parameter identity probes evaluate H directly.
The direct source scan separately constructs 60 exact source polynomials
and checks 2,970 column formulas and 2,730 triples (8,190 polygon memberships).
No failure occurred. These tests prove no universal claim.

The stronger binomial-normalized residual LC condition fails: at n=7,j=2,
the residual is [34,68,36], so dividing by [1,2,1] gives [34,34,36],
with 34^2<34*36. This is an auxiliary obstruction, not a raw-source
counterexample. Finite tests found no failure of the tested synchronization
or denominator-ratio inequalities; both remain unproved in general.

The exact denominator difference is u times a sum of smaller residual rows
(MarkovRowDifferenceM468). The multipliers are nonnegative; positivity of
all summands is not asserted here. A conditional theorem reduces uniform
CrossLC to minimal-denominator CrossLC and an explicit difference/mixed-cross
invariant. Both premises remain unproved. A finite probe of 2,070 differences
passed nonnegativity, 25,520 adjacent tests and 51,040 synchronization tests.
Those tests do not establish the required all-index cross inequalities.
