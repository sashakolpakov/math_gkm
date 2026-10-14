# Numerator-two squares and the second vertical column

Machine-authored request 3556cd95416f4d45a52269fa60ee7779. Full published
Conjecture 6.3 remains unresolved. The following arguments use raw coefficients.

Let F_n be the actual numerator-one polynomials, as connected to the source
recurrence by the inherited fib6/source_fib6 bridge. The checked recurrence is
F_(n+2)=(u+v+1)F_(n+1)-v F_n. Induction gives Cassini

    F_q F_(q+2)-F_(q+1)^2 = u v^q.

Combining this with the inherited classification of every a=2 path gives

    P_(2/(2q+1)) = F_(q+1)^2+v F_q^2, q>=1.

The subtraction in the inherited product identity is eliminated exactly; this
does not invoke any log-concavity closure under products or sums.

Write A_n=[u]F_n, B_n=[u^2]F_n and D=1-v. MarkovFibJets3556 proves

    D^2 A_n = 1-(n+1)v^n+n v^(n+1),
    2D^4 B_n = 2(n-1)-2(n+2)v+(n+1)(n+2)v^n
                -2(n-1)(n+2)v^(n+1)+n(n-1)v^(n+2).

The formulas include n=0,1 and follow by two-step induction on the actual
source recurrence. After the sum-of-squares substitution, if R_q=[u^2]P,

    D^4 R_q = (1+v)-8v^(q+1)(1+v)+v^(2q+1)T_q(v),

where T_q is the explicit cubic columnTail3556. Multiplication by the exact
formal power series (1-v)^(-4), whose coefficients are choose(j+3,3), yields
for every 0<=j<=2q

    [v^j]R_q = B(j)-8B(j-q-1),
    B(j)=(j+1)(j+2)(2j+3)/6 for j>=0, and B(j)=0 for j<0.

This is a proved source formula, not an interpolation assumption. Formal power
series require no convergence premise. The Lean statement clears the factor 6;
it never changes the normalization of the final raw inequality.

For triples contained in j<=q, the cubic B is log-concave by a positive
quartic gap identity. For a center j>=q, write t=j-q and h=2q-j-1. Both are
nonnegative for an interior triple. The scaled gap is

    684+3060t+3528t^2+2016t^3+576t^4
    +1314h+4824ht+3456ht^2+576ht^3
    +870h^2+2160h^2t+864h^2t^2+216h^3+288h^3t+12h^4.

The two formulas overlap at j=q-1,q because the polynomial B vanishes at
-2 and -1. The source support bound handles all triples extending past 2q.
Thus source_two_vertical_two3556 proves

    A_(2,j) A_(2,j+2) <= A_(2,j+1)^2

for every source path with numerator two and every natural j. This is one
vertical line of that subfamily. It is not all a=2 lines or all source paths.

The experiments additionally reject pairwise weak synchronization of the
individual convolution summands in all three directions. The failures are
recorded in slice-strategies.json; they do not refute log-concavity of the sum.
Exact Sturm calculations find nonreal roots of some numerator-two diagonals.
The smallest tested example is the 2/7 slice i+j=4,
u^2(14+28u+15u^2). Its coefficients remain log-concave. Absence of failures in
the stronger normalized adjacent test did not imply real-rootedness.

MarkovDiagonalExample3556 now proves the exact raw slice identity and exhibits
the nonreal zero (-14+i sqrt(14))/15 of that source slice. This obstruction
refutes a universal real-rootedness strategy, not the pinned inequality.

The hosted publisher source and literature searches were consulted during this
worker. No external theorem was imported as a Lean assumption. Searches did
not supply a full proof; they are not an exhaustive novelty audit.
