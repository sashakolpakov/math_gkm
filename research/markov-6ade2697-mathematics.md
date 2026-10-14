# Numerator-one family and next-subfamily obstruction

Machine-authored request 6ade2697ecb948b480f5d51ccf815ce8. The full pinned
Conjecture63 remains unresolved. All formulas below use literal raw coefficients.

Write F_b=P_(1/b)(u,v,1), with F_0=1 as a recurrence auxiliary. The new
source bridge identifies F_(n+2) with frame(replicate n false).mid.p, including
the exact label b=n+2. The checked recurrence is

    F_(b+2) = (u+v+1) F_(b+1) - v F_b.

The coefficient formula, proved from that recurrence, is

    [u^(i+1) v^j] F_(i+1+j+k) = choose(i+k,i) choose(i+1+j,j).

The proof uses strong induction on total degree. Boundary j=0 is the checked
source edge formula; k=0 is the checked top face. The i=0 axis is a single
monomial v^b. The interior recurrence reduces to two Pascal identities. Thus
there is no presumed recurrence-to-binomial bridge. This is the formula from
the paper's Theorem 5.2 with nonnegative indices; the exceptional axis is
handled separately rather than assigning an implicit negative-upper binomial.

Besides ordinary binomial-row LC, choose_upper_lc6 proves

    choose(n,k) choose(n+2,k) <= choose(n+1,k)^2.

Its proof clears positive factors in the two elementary binomial identities;
the zero case k>n is separate. Pointwise products of nonnegative LC triples
remain LC. In each of the three directions the coefficient formula is such a
product: horizontal uses fixed-upper and fixed-lower binomials, vertical uses
two fixed-lower binomials in opposite orders, and diagonal uses fixed-lower
and fixed-upper binomials. Polygon triples touching i=0 are either impossible
or belong to the top face, which is separately checked. This proves
source_one_weakLC6, and support containment gives source_one_global6 on all
natural indices, retaining zeros.

This is a checked reconstruction of the known Theorem 6.4, not a novelty claim.
The exact equivalence root_iff_numerator_ge_two6 removes the proved a=1 family
while preserving every path with a>=2, every index, and all three directions.
It proves neither the root nor its negation.

For a=2 the new source classification is path=replicate n false++[true].
Putting q=n+1 gives the checked identity

    P_(2/(2q+1)) = (u+v+1) F_q F_(q+1) - u v^q,  q>=1.

The removed monomial is strictly outside the pinned source polygon:
(2q+1)*1+2*q=4q+1 < 2*(2q+1). Therefore LC of the consecutive product
(u+v+1)F_q F_(q+1) would imply source LC for all a=2; the conditional theorem
source_two_of_product6 states this with the hypothesis visible. That product
LC is unproved. Exact scans q<=30 found no failure, but establish no theorem.

Arbitrary product closure is false. The checked product F_1 F_4 has coefficients
2,3,5 at (1,2),(1,3),(1,4), and 9<10. Both factors satisfy their full source
WeakLC predicates. The product is not claimed to be a source polynomial.
The 272-product experiment found 169 products failing at least one direction;
all failures in that scan have denominator gap at least three. Consecutive
products may require the exact neighbor relation. No empirical pattern here
is used as a Lean premise.

Primary source consulted: Evans–Veselov–Winn, equations (5), (16), Definitions
6.1–6.2 and Theorems 5.2, 6.4,
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
