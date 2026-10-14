# Exact positive lower-excess model for the whole Pell family

Machine-authored research for request 00b360ee01fe4f14ac8183ef8da6b5c9.
The full pinned Conjecture63 remains unresolved. No historical novelty claim.

Write P_a for the literal source numerator at a/(a+1), a>=1. Define the
ordinary nested formal series over the integers

    E_s(x,y) = (x+y)^(2s) / ((1-x)^(s+1) (1-y)^s), s>=0.

The new checked theorem `source_excess_coeff00b3` proves

    A_a(i,j) = [x^i y^j] E_s(x,y) whenever i+j=a+s.

There is no bound on a,s,i,j, no interior-coordinate restriction, and no
assumed identification premise apart from the explicit source subfamily b=a+1.
The theorem covers s=0, including the monomial at (a,0) and every other zero
on that strip, and all s above the source's degree, where both sides vanish.
Below s=0 every raw coefficient is zero, proved separately. The source family
is reduced to the actual right spine using the inherited path classification.

The proof of the formerly missing formal-series bridge has three parts.
First, reindex the inherited exact horizontal sum without discarding endpoint
terms. For s>=0 (representing positive excess s+1), this gives

    sum_(k=0)^(2s+2) 1_(k<=j)
      choose(i+k-(s+1),s+1) choose(s+j-k,s) choose(2s+2,k).

Here subtraction and choose are natural-number operations. If the first
subtraction truncates, its upper argument becomes zero while its lower
argument is positive, so the term vanishes. The explicit k<=j guard prevents
spurious terms from the second subtraction. The formula is valid on boundary
coordinates as well as in the interior. Second, prove it is precisely the
iterated coefficient of the nested power series, using finite binomial
expansion and the proved negative-binomial series identity in pinned Mathlib.
Third, handle the zero-excess source coefficients by the actual boundary
formula and outside-polygon theorem.

`lower_series_denominator00b3` proves the displayed rational interpretation
after multiplying by its denominator, for all positive excess. No division
of individual coefficients or factorial normalization occurs.

The positive transfer is now a checked equality, including its initial strip:

    E_0=1/(1-x),
    E_(s+1)=K E_s,
    K=(x+y)^2/((1-x)(1-y)).

`excess_generating00b3` proves the ordinary generating equation

    (1-t K) sum_s E_s t^s = 1/(1-x).

`pell_iff_excess00b3` is an exact equivalence between WeakLC for every Pell
source and the two remaining cross-strip inequalities. They compare

    E_s(i,j) E_(s+2)(i+2,j) <= E_(s+1)(i+1,j)^2,
    E_s(i,j) E_(s+2)(i,j+2) <= E_(s+1)(i,j+1)^2,

for every n,i,j,s with i+j=n+1+s. The inherited all-Pell diagonal theorem
supplies the third direction. These two predicates are definitions, not proved
theorems or new axioms. Positivity of K does not prove either inequality.

## Research tests and limits

The new exact summation probe tested a stronger coefficientwise inequality
for the base polynomials sum_q choose(a-q,s) choose(s+q-1,q)t^q and revisited
the full refined horizontal fibers. It also tested accumulating symmetrized
pair contributions from the outside inward. That last proposed positivity
criterion fails already at a=3,j=2,center excess=2,combined index=2: its first
partial sum is -15. This is the same small obstruction underlying the
inherited pairwise synchronization failure; no new root counterexample is
claimed. The final finite counts and bounds are in refinement-probe.json.
No new proof of HorizontalFiberGoal9a72 was obtained.

Live searches revisited the [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
and [Zhu's Riordan-array paper](https://www.cambridge.org/core/journals/proceedings-of-the-royal-society-of-edinburgh-section-a-mathematics/article/logconcavity-and-strong-qlogconvexity-for-riordan-arrays-and-recursive-matrices/2121C9E7369DEC3D5C05B2C6735165E3).
No matching summation theorem with verified hypotheses was found in the
retrieved material. [Bergeron's 2026 overview](https://arxiv.org/html/2608.30979v1)
uses a different Markov deformation in its section 12; its statements were
not imported into this campaign. A Springer DOI retrieval failed. Literature
retrieval supplies no Lean axioms and this was not an exhaustive survey.
