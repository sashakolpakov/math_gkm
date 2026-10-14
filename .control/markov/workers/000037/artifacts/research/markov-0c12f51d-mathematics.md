# Moving fibers, midpoint obstruction, and actual source triples

Machine-authored request 0c12f51d13954e288fe0129642b586e0. No novelty claim.
The pinned full Conjecture63 remains unresolved. Validation status belongs to
the final manifest; formulas below were derived algebraically during this run.

Use the inherited exact source horizontal summands, with center excess s:

    H(a,j,s,q)=choose(a-q,s) choose(s+q-1,q) choose(2s,j-q).

For s>0, out-of-range factors are zero. Lean horizontalTerm9a72 takes s-1
as its final argument. The sum over q is the raw source coefficient at
i+j=a+s for the right-spine source a/(a+1).

## A uniform obstruction to a discrete midpoint proof

Set j=a+3, center s=4 and total q charge k=2a-9, with a>=7. Let

    E = H(a,j,3,a-3) H(a,j,5,a-6)
      = 60 choose(a-1,2) choose(a-2,4),
    M = H(a,j,4,a-5) H(a,j,4,a-4)
      = 40 choose(a-2,3) choose(a-1,3).

The q indices of E have balanced floor/ceiling midpoints a-5,a-4.
Writing B=(a-1)(a-2)^2(a-3)(a-4), direct algebra yields

    36(E-M)=5B(a-21),
    36(2M-E)=5B(7a-3).

Thus the pointwise discrete midpoint comparison fails for EVERY a>=22,
while the aggregate comparison remains strictly positive for every a>=7.
The first exact diagnostic found a=22: E=61047000, M=60648000.
This does not refute any raw source inequality.

Since the middle fiber has support only at a-5,a-4, M is also the maximum
over ALL individual middle products with total charge 2a-9. Thus for a>=22
no choice of a single charge-preserving middle pair can dominate E.
MarkovPairObstruction0c12 formalizes this stronger obstruction. It does not
rule out injections between the underlying counted objects that split a
summand across several middle pairs; the aggregate gap is positive.

## Complete cutoff comparison for this moving fiber

At this j, the s=3 summand has support only q=a-3. The s=4 summand has
support q=a-5,a-4. The s=5 support is q=a-7,a-6,a-5.
Consequently the coefficient of t^(2a-9) in the truncated gap is exactly

    2M * 1[r<=a-5] - E * 1[r<=a-6].

This is nonnegative for EVERY cutoff r. The q positions and total charge
are unbounded as a grows; nevertheless s=4 and j=a+3 are restricted.
The formal moving_fiber_identity0c12 proves the whole finite convolution
identity, including vanished summands, rather than assuming the regrouping.
All four modules compiled and completed kernel replay; their source hashes,
receipts and permitted printed axiom closures are recorded in
evidence/markov-0c12f51d/validation.json. These checks reuse inherited compiled
imports and are not a fresh whole-source rebuild or an independent audit.

## Literal source comparison

For a=m+7, the raw coefficients at (0,a+3),(1,a+3),(2,a+3) are

    L = choose(m+6,2),
    Z = 5 choose(m+5,3) + 8 choose(m+6,3),
    R = 21 choose(m+4,4) + 60 choose(m+5,4) + 45 choose(m+6,4).

The exact identity

    72(Z^2-LR) = 149m^6+4491m^5+55919m^4+367965m^3
                  +1349732m^2+2618064m+2099520

has positive right side for every natural m. All three points lie in the
original polygon. The factor 72 only clears proof denominators; the
inequality itself uses the original integer coefficients with no normalization.
The source bridge uses right_coeff_sum9a72 and its zero cases, not an
experimental identification of a polynomial with a source.

## Sources and execution

The primary published target was retrieved live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
Wang--Yeh's framework explains why sums of centered layers can work when
pointwise comparisons fail: https://arxiv.org/html/math/0504164v7 .
No retrieved assertion is introduced as an axiom, and no theorem in either
paper is claimed to supply the unresolved universal tail inequality.

The exact initial midpoint probe and polynomial computations are experiments,
not proofs. SymPy import failed; rational polynomial arithmetic used Python's
standard library. Rejected Lean elaborations are retained and excluded from
accepted theorem evidence. No external actions remain pending.
