# Mathematical results — 97b019af

Machine-authored live research. The final validation.json controls local
acceptance. Full pinned Conjecture63 remains unresolved.

The principal new result is closure of TopMomentBoundM55C and TopSectorLCM55C
in MarkovTopSectorClosedM97B. The latter says that for all natural n,t with
2t<=n, 5<=t and 3t<=n+5, every adjacent raw coefficient triple of the exact
upper template is weakly log-concave. Depth, denominator and column are
universally quantified; this is not a fixed-depth or eventual-denominator result.

For every numerator-three source with b=3q+1 or b=3q+2, q>=1, and
5<=t<=q+2, put j=b+2-t. The raw theorem proves, for every natural c,

    A(c,j)*A(c+2,j) <= A(c+1,j)^2.

There is direct transport to every path whose middle numerator is three.
The polygon version explicitly proves all three memberships for
1<=c and c+2<=t. Exterior zeros are retained in the unrestricted row theorem.
No coefficient normalization remains in the conclusion.

The proof closes the inherited upper moment condition as follows. The exact
sixth-moment two-generator certificate gives strict antidiagonal group positivity
for every i>=6, 2<=m<=2r, i+r<=d+2. It uses the actual q likelihood and cut,
not the previously refuted q-free shortcut. Generic summation by parts supplies
both generator signs. The beta-binomial sixth central moment is exact for all
totals, and radial covariance supplies its actual-weight upper bound. The scalar
certificate has an all-positive expansion for a=i+1>=7. Details and exact
formulas are in markov-97b019af-sixth-route.md.

Fixed columns i=2,3,4,5 are closed by ring-checked positive polynomials from
the inherited exact short binomial sum, for all d>=0,T>=i+2. These four
unbounded strips, together with the inherited i=0,1 and short-tail results,
close all remaining upper parameters. Finite testing is not used in this proof.

Earlier in this invocation the full fourth-moment attachment was also completed.
It gives strict topMass/tailGap inequalities for i>=2,r>=1,i+r<=d+2 and
8(r-1)<=(i-2)^2, with raw source and polygon transport. The later sixth-moment
result subsumes the need for this restriction in the full upper-sector proof.
Both derivations and their exact residuals are preserved.

MarkovTopSectorResidualM97B proves the exact equivalence

    Conjecture63 <-> ThreeAfterUpperM97B AND OtherFourM9E2.

Both right-hand propositions remain open. ThreeAfterUpperM97B retains the
middle horizontal rows, the previous vertical and constant-i+j diagonal clauses,
and all universal parameter quantifiers. OtherFourM9E2 is unchanged. Neither
the full root nor its negation is proved, and no source-correspondence obligation
is silently discharged by these partial results.

Finite experiments passed 26,288 coefficient comparisons, retaining 4,956 zeros,
and 538,256 polygon-valid raw triples across all three directions on 63 labels.
The fourth-moment experiment passed 900 cases, including 108 zero masses.
The sixth experiment passed 720 moment/identity cases and 1,440 generator checks.
These are reproducible operational computations, not universal proof evidence.
