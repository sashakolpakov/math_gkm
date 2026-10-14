# Complete first lower band for Pell sources

Machine-authored request 654a72ea. Full pinned Conjecture63 remains open.

For every source a/(a+1), write A(i,j) for its literal raw numerator
coefficient. The new theorem `source_near_one_lower_band654a` proves,
for every natural i,j with i+j=a+1,

    A(i,j) A(i+2,j) <= A(i+1,j)^2,
    A(i,j) A(i,j+2) <= A(i,j+1)^2.

Thus both comparisons crossing the first three positive-excess strips are
unconditional, including all corners, boundary coordinates and zero cases.
This is an unbounded subfamily result, not a bound on the denominator and
not a full theorem for that subfamily. Deeper bands and other rational
families are not covered by this theorem.

The interrupted predecessor supplied exact interior polynomial formulas
for the three strips. Its final inequality proof failed at a conversion
between `0 <= B^2-AC` and `AC <= B^2`. A new copy corrects that conversion;
the old file and failed receipt are preserved. Positive-coefficient gap
polynomials prove the interior cases after translating the coordinates to
their lower bounds.

To remove the coordinate restrictions, `right_sum_j654a` gives the exact
finite sum with q=0,...,j, under j<=n+1. Expanding it at the finitely many
missing row coordinates proves polynomial inequalities in an unbounded
remaining coordinate. This is symbolic Lean ring arithmetic, not numerical
sampling. The i=0 horizontal corner follows from exact column formulas:
at n>=4 the raw triple at j=n+2 is

    1, 7n-3, (49n^2-137n+108)/2.

The small corner cases are checked by ordinary kernel polynomial arithmetic.
The i=0 vertical triple is 1,n,choose(n,2). Inherited whole-row theorems
cover j=0,1,2 horizontally and i=1,2 vertically. These cases assemble into
the theorem above. The degree-small cases have a zero right endpoint by
the inherited exact outside-polygon theorem.

`MarkovPellGenerating654a.lean` independently proves the ordinary formal
generating equation for the whole Pell family, with P_0=1:

    (1-(u+v)(1+u+v)z+uvz^2) sum_a P_a z^a = 1-vz.

The positive lower-excess regrading and its remaining bridge are described
in markov-654a72ea-generating.md. Its transfer kernel compares different
excess indices in the requested directions, so ordinary fixed-slice
convolution log-concavity does not solve the remaining problem.

Live source searches revisited the [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
and found [Zhu's transformation paper](https://arxiv.org/abs/1605.00257), whose
abstract discusses strong coefficientwise log-concavity under binomial
transforms. No identification of its hypotheses with the present three-factor
Pell sum was established, and no external result enters the Lean proofs.
These searches are neither an exhaustive novelty audit nor evidence of root
resolution.
