# Exact support, mechanical words, and strategy obstructions

Machine-authored request 3edac4bf4f1040d0b967711f6c52c66f. Validation status is
recorded by source hash in evidence/markov-3edac4bf/validation.json. None of
these results proves or refutes the full pinned Conjecture63.

## Saturation from exact prefix counts

Write a,b for a source middle label and W for its raw A/B word, of length b
with a copies of B. The inherited support-rigidity proof identified proper
central prefix counts. MarkovMechanical3eda extends this to the entire word:

    count_B(take j W) = floor(a*j/b),    0 <= j <= b.

The j=0,b-1,b endpoint cases are explicitly checked, using 0<a<b. The exact
raw-word/source polynomial identity is also recorded, without normalization.

For 0<j<b, split W=x r y with length(x)=j-1. The inherited positive matrix
path witness gives a positive coefficient at

    (count_B(y), length(x)+indicator(r=B)).

Its second coordinate is at most j. If q=count_B(take j W), then a=q+count_B(y)
and a*j < b*(q+1). At any polygon point (i,j), the inequality
a*b <= b*i+a*j therefore forces count_B(y)<=i. The inherited northeast
support propagation reaches (i,j), since i+j<=a+b-1. For j=0 use the positive
vertex (a,0); for j>=b use (0,b). This proves source_saturated3eda for every
finite path and every polygon lattice point, with no bound on a or b.

Combining it with the existing outside-zero theorem gives exactly

    0 < A_ij iff InPolygon(a,b,i,j),
    A_ij = 0 iff not InPolygon(a,b,i,j).

This is stronger than convex-hull equality or interval support: every polygon
lattice point has a nonzero raw coefficient. It does not compare coefficient
magnitudes. Saturation is already a known mathematical result; the primary
paper [Evans, Saturation of Markov Polynomials](https://arxiv.org/html/2604.18333v1)
was retrieved live. This run uses a checked matrix-word argument, not an external
theorem as an axiom, and makes no historical novelty claim.

## An explicit arithmetic root formulation

Define the length-b word by its kth letter:

    W(a,b)[k] = B if floor(a*k/b) < floor(a*(k+1)/b), else A.

MarkovMechanicalGoal3eda proves exact equality with each source word by taking
successive prefix-count differences. Conversely rational_coverage_098 supplies
an actual source path for every positive reduced a<b, with literal polynomial
equality to the raw matrix product of W(a,b).

root_iff_mechanical3eda equates the full pinned root with GlobalLC18 for all
these explicit words. There is no support condition or unknown family bridge
on this new target. Both sides remain unproved. The equivalence retains the
three raw directions, all indices and zeros, and uses the inherited vacuous
0/1 and 1/1 endpoint clauses through root_iff_raw_matrix18.

## All diagonal support and cross inequalities

For every n define D_n(k)=A_{k,n-k} when 0<=k<=n, and zero otherwise. Saturation
and the linear polygon inequalities give interval support for every D_n,
including lower diagonals. Together with nonnegativity, the inherited adjacent
to CrossLC theorem applies without a no-gap premise. MarkovCrossGoal3eda glues
this to the analogous horizontal and vertical results into a full-root
equivalence with CrossLC on every raw slice. Neither inequality side is proved.
This concerns raw slices; it does not claim log-concavity of quotient slices
or invert the smoothing transform.

## Obstructions explored and checked

1. The gas core ACAAAAACA is a balanced palindrome. Its raw scalar polynomial
has vertical coefficients 8,12,20 at (1,5),(1,6),(1,7), hence 144<160. Lean
checks both structural properties and the failure of GlobalLC18. The coefficient
at (1,5) violates the lower polygon bound for 3/8 (23<24), so the polynomial
cannot be that source. This is not a source-family counterexample. The short
enumerations and full words are in palindrome-scan.json and balanced-palindrome.json.

2. An exact source scan through b=35 tests primitive directions with components
bounded by 4, retaining polygon guards and zeros. It checks 3,445,704 triples
on 383 sources. It finds failures in additional directions; the three pinned
directions have no failure in this finite test. At 1/9, the direction (1,-3)
has coefficients 1,7,50 at (0,9),(1,6),(2,3), so 49<50. All three points are
inside the source polygon. MarkovDirectionObstruction3eda checks the exact
source recurrence coefficients, labels, polygon memberships and reversed
inequality. This excludes full arbitrary-direction concavity, not the pinned
weak concavity. The exact scan is directions-probe.json.

These are strategy exclusions, not root refutations. The [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
specifies only (1,0),(0,1),(1,-1); no failed additional direction is silently
included in its meaning.
