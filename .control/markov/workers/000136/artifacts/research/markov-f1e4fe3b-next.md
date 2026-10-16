# Revisable next actions

Machine-authored request f1e4fe3b99d84d70bd218f29dcffcb3c.
Read validation.json for checked status; completion remains null.

The present route proves a uniform middle region for each of the three
directions, rather than a finite list of rows. The remaining exact predicate
is in MarkovResidualMF1E.lean after successful validation. It retains all
previous guards and excludes only the proved middle regions. Its complements
near the ends of the seed/binomial convolution remain unproved.

One quantitative improvement is available for investigation. The polygon
suggests the sharper horizontal lower residual support

    l = a - floor(a*j/b)

and vertical support l=b-floor(b*i/a), in the respective forward ranges.
The elementary arithmetic follows from b*k+a*j<ab when
k<a-floor(a*j/b), using the quotient/remainder identity and remainder<b.
Combining that with the already proved coefficientwise smoothing bound
would improve the interval width in the mixed-gap theorem. This improvement
is not formalized in this run and does not resolve the end regions.

More fundamentally, source-specific seed information could control the
remaining signed mixed terms near the boundaries. Arbitrary nonnegative
seed LC does not hold there: [1,0,100] at binomial exponent 2 fails.
Do not replace that missing source argument by an unrestricted mixture claim,
arbitrary-word vertical/diagonal LC, or reverse-smoothing cancellation.

The general MF25 falling-factorial criterion remains usable and unproved
outside regions now supplied with an actual sign theorem. Every source
correspondence obligation remains necessary before exact-root completion.
