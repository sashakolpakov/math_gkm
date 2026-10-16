# Revisable next actions

Machine-authored request 5703599b8b9a4638b67a688a6b77e4cb. Full pinned
Conjecture63 remains unresolved. Final validation.json determines checked
modules; source drafts or a successful Python run are not theorem admission.
The new exact residual is research/MarkovResidualHalfM570.lean. Its vertical
row-two clause requires b<2a; higher strips, horizontal rows and deep diagonals
remain. Its proposition is unproved.

Investigate the remaining vertical row-two strip for b<2a. The experiments
`probe_high_5703599b.py`, `probe_high_refine_5703599b.py`, and
`experiment_high_5703599b.py` record new candidates, not Lean theorems.

Put i=a-1+k, N=k+l=b-2, C=choose(N,k), with k>=0, l>=2, N>=7.
Let d_r be the coefficients of the second-row source seed
`[8q,9a²-5a+2,6a²+6ab-16a+4,(a+b-1)(a+b-2)]`.
Let e_r and f_r be the coefficients of h3seedM13D and h4seedM511 with their
actual source statistics. Define

    J = Σ(r=0..3) d_r falling(k,r) falling(l,3-r),
    H = Σ(r=0..5) e_r falling(k+1,r) falling(l-1,5-r),
    I = Σ(r=0..7) f_r falling(k+2,r) falling(l-2,7-r).

Candidate source identities, retaining zero binomials, are

    2 falling(N,3) A(i,2) = C J,
    6 falling(N,5)(k+1) A(i,3) = C l H,
    24 falling(N,7)(k+1)(k+2) A(i,4) = C l(l-1) I.

The resulting gap candidate is

    G = 4(N-5)(N-6)(k+2) l H²
        - 3(N-3)(N-4)(k+1)(l-1) J I.

Its proposed clearing factor is
`144 falling(N,5)^2 (N-5)(N-6)(k+1)^2(k+2)`; the right-hand side is
`C² l G`. These identities need Lean proofs, not numerical inference.

There are three statistic cones. The refined Python script uses a fresh
nonnegative parameter Q in each:

* 3a<=2b<=4a: a=(b+Q)/2; q=Q,t=b-a,u=0,v=0,w=Q,z=0.
* 4a<=3b and 2b<=3a: a=(2b+Q)/3; q=2a-b,t=b-a,u=Q,v=0,w=b-a,z=0.
* b<a*4/3: a=(3b+Q)/4; q=2a-b,t=b-a,u=3a-2b,v=0,w=b-a,z=Q.

The algebraic expansions use the same formula on boundary overlaps, where
the changing statistics vanish. The source cone inequalities must still be
proved when identifying those formulas. In all three cases the refined
covering charts have nonnegative rational coefficients:

* l=L+9,k=K+1, and l=L+9,k=0;
* l=2,...,8,k=K+max(7-l,1);
* l=7,k=0 and l=8,k=0.

Here K,L,Q>=0. The naive chart with k unshifted had negative coefficients;
that is a failed positivity representation, not a counterexample. Splitting
k=0 versus k>=1 repaired the observed symbolic certificates. The large charts
have 1,099 positive monomials; splitting by powers of Q as in the checked
M570 middle/next certificates may make Lean checking practical.

For a<b, the raw second row vanishes for i<a-1 by polygon support. The upper
outside region also has a zero factor. Small b<9 and a<3 cases need actual
source treatment before a universal assembly. Preserve all other residual
clauses, all zeros, endpoints, and all source-correspondence obligations.

Alternatively select a uniform row-order argument. A finite list of strips
does not itself provide such an induction or settle the full conjecture.
