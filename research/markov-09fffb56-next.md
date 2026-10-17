# Revisable next actions

Machine-authored 09fffb56. Full pinned Conjecture63 remains unresolved.

The inherited SharpTopScalarsMBE3 is CLOSED by sharp_top_scalarsM09F in
MarkovSharpScalarsClosedM09F. Do not keep it as an unproved premise.
The universal correction budget now has factor s+3 rather than 3(s+3), and
includes all d, both clamp regimes, k=0 and both residues.

Investigate SharpCompleteMarginMBE3, or the new sufficient
UnshiftedAdjacentM09F in MarkovAdjacentConvolutionM09F. The latter compares
successive coefficient ratios of qPoly(j,s+1)^2 and qPoly(j,s)qPoly(j,s+2)
for 0<=n<2j. Interval positivity and zero tails are proved, so it is exactly
equivalent to the all-cross-index UnshiftedRatioM09F. A proved finite-sum
covariance argument transports that ratio ordering through X+1 to the sharp
complete margin, which now suffices alone for all horizontal band LC.

The unshifted polynomials have simple coefficients

    w(j-i) choose(s+i+3,i),
    w(0)=1, w(h)=4h for h>0, w(h)=0 for h<0.

The adjacent ratio condition passed 259,200 finite tests but remains unproved.
For n<j the convolution has no upper-support cutoff and the weights are
quadratic in the summation index; a binomial convolution representation may
help. For n>=j, retain both endpoint weights 1 and all truncated terms.
This is a proposed direction, not an asserted identity or prescribed recipe.

Do not infer this ratio property merely from log-concavity of arbitrary
weights. q-ratio-probe.json contains an explicit positive log-concave weight
list with a negative ratio-step gap; it is an experimental auxiliary witness,
not a source-family refutation. The simpler additive concavity of normalized
complete coefficients is formally false at (j,s,m)=(6,0,6). Their individual
log-concavity is proved but does not settle the convolution. The predecessor's
termwise symmetric-pair shortcut remains formally false.

Retain ThreeBeyondBandM657 and OtherFourM9E2 completely. No root residual
clause was removed. Full closure still requires every source/English bridge,
fresh whole-source rebuild and the independent hash-bound audit.
