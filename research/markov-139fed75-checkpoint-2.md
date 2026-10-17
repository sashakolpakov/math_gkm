# Checkpoint 2

Machine-authored 139fed75. Five modules now compile: MarkovFibBandM139,
MarkovBandGainM139, MarkovBandRecurrenceM139, MarkovBandShapeM139 and
MarkovBandTransportM139. Kernel union replay and closure audit still pending.

The exact source factorization is proved uniformly for q≥2, k≥0, both residues
and 2(q+k+1)+1≤sourceN(q,r). It is no longer an assumed source identity in
this domain. Q_k has degree at most k; its constant coefficient is
2(k+1)^2(k+2) for false and 2(k+1)(k+2)^2 for true. Both assertions are proved.
The source transport into the inherited factored-row criterion is proved,
retaining nonnegativity, coefficient-budget and scalar-margin hypotheses.

The exact finite independent source experiment checks 211 rows, 11,860 raw
coefficients (5,320 zero), 11,438 horizontal triples (6,118 polygon-valid),
770 budget checks and 595 residual adjacent inequalities, without failure.
These are experiments only. A separate Newton-interpolation diagnostic found
nonnegative coefficients in 182 finite cases through k=12; no universal
Newton-positivity result follows. Evidence is in band-experiment.json and
newton-probe.json under evidence/markov-139fed75/.

The full root remains unresolved. No other family, direction, endpoint or
upper row has been silently removed. The exact inherited residual predicates
ThreeBeyondThirdM964 and OtherFourM9E2 are retained.
