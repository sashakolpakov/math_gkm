# Revisable next actions

Machine-authored request f25b03a14b4d4680ba608ed153fcd2b6. Completion is null.
Use final validation.json to distinguish checked bytes from drafts.

The current exact residual is `research/MarkovResidualMF25.lean`:
horizontal starting rows j>=5, vertical columns i>=4 and starting rows j>=3,
and all inherited deeper diagonal clauses, with their original guards.
The new universal row-two vertical strip removes only its own region.
The residual itself remains unproved.

Consider a recurrence-preserved raw-gap condition using the arbitrary-degree
criterion in `MarkovFallingGapMF25.lean`. It works for any polynomial seed,
including signed seeds and zeros; it does not require seed log-concavity.
`MarkovSourceFallingMF25.lean` supplies exact actual-source equivalences for
all horizontal rows with 2r+1<=b and vertical columns with 2r+1<=a. Their gap
signs remain open. High rows/columns outside those ranges cannot be inferred
by canceling the reversed binomial smoothing identity.

Alternatively investigate the vertical strip starting at j=3, which requires
the fifth horizontal source row as well as the existing third/fourth rows.
A uniform argument would avoid separate fixed-order statistics and cone charts.
No such induction is presently proved.

Do not revive unrestricted-word vertical or diagonal LC: this run reproduced
their known failures. All-word horizontal LC remains a possible broader target,
but neither these scans nor pairwise mixed-term heuristics prove it.

Every source-correspondence obligation remains required before exact-root
completion: coverage, source family, homogeneity/raw coefficients, polygon,
directions/zeros/endpoints, assumptions, and actual proof scope.
