# Second-row ambient strengthening and a polarization obstruction

Machine-authored live request 34071a88f5e74d9bb6a7e4fa9173f2ff.
Full pinned Conjecture63 remains unresolved. Validation receipts, rather than
draft existence, determine which statements are accepted. No novelty claim.

For a source a/b with b≥5 write n=b−2, m=a−1, N=b−1. The inherited exact second-row
formula is 2[v²]P=u^m(1+u)^(n−3)Q(u), where
Q=[4t, 9m²+13m+6, 6m²+6mn+8m+6n+6, (m+n+2)(m+n+1)].
The source statistic obeys 0≤t≤2m, m≤n and either n≤2m or t=0.
These are source-derived restrictions; they do not hold for arbitrary weighted
transfer systems.

For 0≤h≤n, at i=m+h set k=h+1=i+2−a. Let F(k)=secondNorm340(k,N,m,t), explicitly the
quartic falling-factorial expression in the Lean module. The new checked coefficient
bridge establishes

    2 N(N−1)(N−2)(N−3) A(i,2) = choose(N,k) F(k).

For 1≤k and k+2≤N, the normalized gap G(t)=F(k+1)^2−F(k)F(k+2) is quadratic in t. Its exact
Bernstein identity is

    (2m)^2 G(t) = (2m−t)^2 G(0) + t(2m−t) B + t² G(2m),

where B=2F_1(0)F_1(2m)−F_0(0)F_2(2m)−F_0(2m)F_2(0).
G(0) has nonnegative polynomial coefficients after k=1, k=2, or k=x+3
and the appropriate nonnegative distance from the last index. For the other
two terms, homogenizing m over n/2≤m≤n introduces the nonnegative variables
2m−n and n−m; multiplying by n^4 yields polynomial certificates with
nonnegative coefficients. Lean checks their identities by ring arithmetic
and signs by order reasoning. This proves the algebraic normalized inequality
under the precise source restriction; it does not prove arbitrary-word closure.

The resulting source strengthening compares the unchanged raw coefficients:

    (k+2)(N−k) A(i,2) A(i+2,2)
       ≤ (k+1)(N−k−1) A(i+1,2)^2.

The source bridge retains zeros, uses the original polygon guard, and cancels
only strictly positive scalar/binomial factors in their established range.
The raw j=2 row was already known in inherited work; this is a stronger
inequality intended to support a global invariant, not a newly solved raw row.
MarkovSecondAll340 assembles every source denominator: the numerator-one family uses its inherited stronger theorem; the remaining denominators below five reduce to the actual 3/4 triple [8,26,15], or have no valid triple. Its final all-path statement compiled with permitted axioms.

## Why the most direct site polarization cannot prove the global invariant

Replace the common x in the positive ambient transfer at each site by a
separate variable. The new siteEval340 specializes exactly to the inherited
transfer when those variables coincide, with a universal source equality.
For the actual source 1/5 the central word is AAA; append the terminal B.
At y-degree one, the four-site multiaffine polynomial is

    a+d + 2ab+ac+bc+2ad+bd+2cd
        +3abc+3abd+3acd+3bcd+5abcd.

Homogenize it to degree four by z. Differentiate in a and z, and set d=0.
The resulting quadratic is Q=3z²+4zx+2zy+3xy. The polynomial identity
Q(1−17t,1+12t,1+24t)=12+99t² proves a strict continuous midpoint
log-concavity failure at t=±1/100, with all three coordinates positive.
Thus the site refinement is not completely log-concave. This does not rule
out log-concavity after site averaging, and it does not reverse a pinned raw
coefficient inequality. The Lean modules separately establish the site
specialization, coefficient identity, mixed-coefficient identity and explicit
quadratic failure; no external Lorentzian theorem is assumed.

## Experiments and source use

Exact finite checks of the new second-row coefficient formula and strengthened
inequality are recorded in second-source-probe.json. The all-word polarization
test and actual source test are separate files. A parameter-envelope scan for
m=1,t=1 at selected N up to 10000 remains finite evidence only.

The published target was reread at
[Evans–Veselov–Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Live searches also revisited [Chen–Sun](https://arxiv.org/html/2610.09312v1)
and [Kang–Lee–Lim](https://arxiv.org/html/2508.04396v2). Their coefficient
maps/specializations do not supply the required Markov bridge. No external
assertion was added as a Lean axiom; no literature completeness is claimed.

Final validation: all seven modules compiled with permitted printed axiom closures. Five completed direct kernel replay, including source_second_ambient_all340 via MarkovSecondAll340 (64.27 seconds on the sequential retry). The certificate and coefficient-helper direct replays remain unconfirmed after timeouts. No fresh whole-source rebuild or independent completion audit occurred.
