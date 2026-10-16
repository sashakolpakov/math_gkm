# Revisable next actions

Machine-authored ae9e841e. Full pinned Conjecture63 remains open. The exact current residual is ThreeRemainingMAE9 AND OtherFourM9E2 in MarkovResidualMAE9. Retain every correction band, larger numerator, reverse-factor range, direction, zero and endpoint.

The new uniform lift is

    A(t+3,j)=sum_(r=0)^t C(d,r) a_j(t,r),  d=n-2j-1,
    a_j(t,r)=L(j,t,t-r),
    L(j,t,m)=C(t+m+3,m)[C(t+j+3,t+m+3)+4C(t+j+4,t+m+5)].

MarkovBinomialLiftMAE9 and MarkovLiftSupportMAE9 prove this bridge and exact positive interval support 0..d+j. Actual lower source rows have d>=j. The old minimal-denominator CrossLC theorem remains proved; RowGapMonotoneMDAB and RowDifferenceShapeM468 remain open.

A uniform LC-preserving property of a_j(t,r), or its restriction to binomial input C(d,r) with d>=j, would give all lower horizontal inequalities. The finite truncated generating-polynomial criterion passed 509,551 coefficient checks. This is not a proof. The simple discrete midpoint condition is formally false (48>45); do not try to use it without modification.

MarkovLiftRatioMAE9 supplies the scaled kernel and its m-step recurrence. For 0<=m<=j,

    L(j,t,m) D(t,m)=C(j,m) C(t+j+3,j) E(j,t,m),
    D=(t+m+4)(t+m+5), E=D+4(j-m)(t+j+4).

This simplifies comparisons of kernel ratios to rational polynomial signs. Positivity of E is proved on the stated range; the needed uniform LC-positive signs are not.

A further locally derived, not yet Lean-formalized viewpoint extends r to negative integers down to t-j. With c_0=1 and c_s=4s for s>0, define

    Q_(j,t)(y)=sum_(s=0)^j c_(j-s) C(t+s+3,s) y^s.

The proposed Laurent identity is

    sum_r a_extended(j,t,r) z^r = z^t Q_(j,t)((1+z)/z).

The nonnegative-power part is the new triangular kernel polynomial. Finite tests passed 23,932 extension comparisons, 42,594 Q-gap coefficients, 46,810 Laurent-gap coefficients and 46,810 signed-pair sign patterns. The tested signed-pair coefficients change from negative to positive toward the middle. See laurent_lift_ae9e841e.py and evidence/markov-ae9e841e/laurent-lift.json. Neither universal sign pattern nor truncation preservation is proved. Positive-part truncation must not be assumed to preserve LC.

The elementary negative-binomial pair comparison for b_s(t)=C(t+s+3,s), after clearing positive denominators and setting T=t+4, has sign numerator

    (T-1)(s+r-(s-r)^2)+2sr.

This increases as the pair moves toward its middle at fixed s+r. It may help prove the Q-gap assertion using the log-concavity of c and Vandermonde cancellation; the extension/truncation step remains a separate obligation. This is research advice, not a supplied axiom or a checked proof.

For correction bands, source_first_correction_polynomialMAE9 is proved for q>=2. Twenty exact polynomial candidates in correction-candidates.json have nonnegative factored coefficients: horizontal starts 4..6 on row q+1, vertical crossings in columns 5..8, and diagonal crossings starting 4..6. Their Lean gap certificates and source transports remain to be built. Keep the q=1 exceptional alternating formula; do not silently replace it by ordinary choose(q-2,...).

Before claiming completion, close the exact root or its negation, discharge every source-correspondence obligation, perform a fresh whole-source rebuild and kernel replay, and obtain the separate independent hash-bound source/English audit. None has been replaced by the finite experiments or this run's partial validation.
