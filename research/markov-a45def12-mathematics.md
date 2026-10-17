# Mathematical progress

Machine-authored request a45def12b7c24d888741ec0c6895391b.
Full pinned MathGKM.Markov.Conjecture63 remains unresolved. No novelty claim.

Write q(j,s)=qPolyM7E2 j s and

    A_n = [X^n] q(j,s)q(j,s+2),   B_n = [X^n] q(j,s+1)^2.

The auxiliary ordered-ratio condition asks B_n A_(n+1) <= B_(n+1) A_n.
This is not itself a raw-source log-concavity statement. The inherited exact
translation and source transport explain its sufficiency for the horizontal
numerator-three correction band.

## Closed regions and exact remaining condition

`q_below_cutoffMA45` proves that inequality for every j,s,n with n<j,
including the cutoff step n=j-1. `q_last_adjacentMA45` proves the final step
n=2j-1 for every j>=1. The exceptional j=1 first step is proved separately;
j=0 imposes no adjacent condition. All parameters are unbounded.

`MarkovUpperReductionMA45.lean` defines the still UNPROVED
`UpperAdjacentMA45`: the same inequalities for j<=n and n+1<2j.
`upper_adjacent_iffMA45` proves exact equivalence to the inherited
`UnshiftedAdjacentM09F`; `upper_ratio_iffMA45` proves equivalence to its full
cross-index formulation. Interval positivity and zero tails are supplied by
the inherited bridge, not assumed from adjacent inequalities.

`sharp_margin_of_upperMA45` and `source_band_of_upperMA45` retain that premise
explicitly. No ThreeBeyondBandM657 or OtherFourM9E2 clause is removed, and no
unconditional full correction-band theorem is claimed.

## Exact lower convolution formula

The q coefficients are w(j-i) choose(s+i+3,i), where w(0)=1,
w(h)=4h for h>0, and w(h)=0 for h<0. Below the cutoff n<j all convolution
indices have positive j-i. A power-series proof of the negative-binomial
second moment gives, with T=2s+n+9,

    A_n = 16[j(j-n) choose(T,n)+(s+4)(s+6) choose(T,n-2)],
    B_n = 16[j(j-n) choose(T,n)+(s+5)^2 choose(T,n-2)].

The displayed choose(T,n-2) is zero for integer n<2. Lean avoids natural
truncation by using the coefficient of X^2 times the appropriate power series.
`second_moment_scaleMA45` also proves the equivalent denominator-free identity.
The proof uses ordinary formal power series and binomial recurrences; no
analytic convergence, interpolation or experiment is assumed.

Put D=(2s+10)(2s+11), C_n=choose(2s+n+9,n). For n+1<j the exact gap is

    D^2 [B_(n+1)A_n-B_n A_(n+1)]
      =256 C_n C_(n+1) D j n (2j-n-1).

Every factor on the right is nonnegative in the stated range.

## Both cutoff endpoints restored

At n=j the linear continuation gives weight zero at i=j, whereas the actual
weight is 1. `q_product_cutoffMA45` restores both endpoint contributions:

    [q(j,s)q(j,t)]_j
      =16(s+4)(t+4) choose(s+t+j+7,j-2)
         +4j[choose(s+j+3,j)+choose(t+j+3,j)],   j>0.

Again the shifted coefficient is formalized without negative natural indices.
The cutoff inequality uses the universal bound

    (k+1)(k+2) choose(s+k+5,k) <= 4 choose(2s+k+11,k),

proved by induction in `MarkovDoubleChooseMA45.lean`. Two Pascal identities
control the endpoint corrections exactly. The final scalar comparison has
the positive certificate

    (3k^2+13k+12)s^2+(32k^2+136k+126)s+85k^2+355k+330.

`q_cutoff_adjacent_succMA45` combines these facts for j=k+2. It includes k=0
and s=0; there is no asymptotic or parameter-size assumption.

## Last adjacent step

Reflection identifies the top two coefficients of each product without
dropping zero tails. Set E_t=choose(t+j+3,j) and x=s+j+3. The exact final gap
satisfies

    x(x+1)(x+2) [B_(2j) A_(2j-1)-B_(2j-1) A_(2j)]
      =8j E_s E_(s+1)^2 E_(s+2),   j>=1.

The proof uses binomial coefficient recurrences and positive multiplication;
it does not divide by a possibly zero coefficient.

## Experiments and a possible representation for the remaining interval

`convolution-experiment.json` checks 77,760 low coefficient formulas, 1,920
cutoff formulas, 37,920 lower steps, 960 cutoff steps, 960 last steps, 38,520
still-open upper steps, and 948 binomial bounds. No failures. The upper checks
include 600 deterministic random cases with j<=500 and s<=300. These are
finite experiments, not universal evidence admission.

`source-experiment.json` independently starts from the actual pinned recurrence
on 36 numerator-three labels. It checks 9,666 correction-band coefficients,
retaining 4,491 zeros, and 77,571 polygon-valid raw triples in all three
directions. No failures. This does not enlarge the proved source scope.

`MarkovWeightRepresentationMA45.lean` proves the formal weight-series identity

    sum w(h) t^h = (1+t)^2/(1-t)^2.

The Lean statement uses multiplication by (1-t)^2 and its explicitly verified
formal-series inverse, not analytic division. It also proves that a three-row
matrix whose entries are row-constant plus column-constant has determinant zero,
and the corresponding four-row assertion with an arbitrary fourth row. The
specific weight determinant for shape (3,3,3) is proved zero. These elementary
identities do not prove the general Schur expansion or its coefficient signs.

An exploratory Schur-basis expansion of the remaining adjacent determinant
found 404 negative coefficients among 5,301 inspected coefficients. All
occurred at shapes whose third row has length at least 3; their determinant
evaluations at the actual weight sequence were zero. All 108 numerical
expansions reproduced the direct exact gap. At (j,s,n)=(5,0,5), the coefficient
of shape (3,3,3) is -12250, its weight determinant is zero, and the actual
auxiliary gap is 631276800. This is not a source-family refutation.

The general Schur expansion, coefficient signs on the surviving shapes, and
their implication for every remaining upper step are NOT proved. The Python
Pieri implementation is experimental. Do not silently promote the scan to a
Schur positivity theorem. A separate 400-family, 12,800-case probe of weights
generated from nonnegative linear and geometric factors found no ratio failure;
that generalization is also unproved and is not needed for the closed lemmas.

The [published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was revisited. [Karp's author slides](https://math.nist.gov/~DLozier/SF21/SF21slides/Karp.pdf)
discuss related rising-factorial coefficient inequalities. No external theorem
was imported, and no bridge from those statements to the remaining ratio
condition is claimed.
