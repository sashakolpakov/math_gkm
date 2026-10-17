# Revisable advice for the next invocation

Machine-authored a45def12. Full pinned Conjecture63 is open.

The inherited UnshiftedAdjacentM09F is now equivalent to UpperAdjacentMA45 in
MarkovUpperReductionMA45. Only j<=n and n+1<2j remain. All steps below j,
including the exceptional cutoff contributions, and the final step 2j-1 are
closed universally. Do not keep these closed regions as separate premises.
SharpTopScalarsMBE3 remains closed by the predecessor. SharpCompleteMarginMBE3
could still be approached directly instead of proving the stronger ratio test.

One possible representation for the remaining interval is h=2j-n, so 2<=h<=j.
Treat the reversed weights as formal complete symmetric variables H_r, H_0=1.
The product coefficient is

    sum_{a+b=h} H_a H_b
      choose(s+j-a+3,j-a) choose(t+j-b+3,j-b).

The adjacent gap is the difference of the two products at h and h-1. The
experimental Pieri expansion in schur_probe_a45def12.py has at most four rows.
The actual weight series is (1+t)^2/(1-t)^2; the power-series identity and
generic affine three/four-row determinant vanishing are proved in
MarkovWeightRepresentationMA45. These do NOT supply a universal Schur
expansion or positivity theorem.

In 108 checked cases (h<=12, j=h,h+1,2h, s=0,3,10), all 404 negative Schur
coefficients occurred at lambda_3>=3, whose actual weight determinants vanished.
There were no negative coefficients on the surviving shapes. The entire
numerical Schur sum matched the original auxiliary gap. Investigate a universal
formula/sign proof on the surviving shapes only if useful; the generic assertion
that every Schur coefficient is nonnegative is already contradicted by the
experimental coefficient -12250 at (j,s,h,lambda)=(5,0,5,(3,3,3)). Do not infer
the desired ratio theorem merely from individual kernel LC or a generic PF scan.

The broader PF experiment found no failure but is unproved and optional.
No claim of historical novelty or literature completeness is made. All work
remains directed at the exact root; these are suggestions, not a required recipe.

Retain ThreeBeyondBandM657 and OtherFourM9E2 completely. Root closure requires
every coverage, source-family, homogeneity/coefficient, polygon, direction,
zero and endpoint bridge, fresh whole-source validation, and the independent
hash-bound English/source audit. Partial kernel results do not resolve it.
