# Revisable next actions

Machine-authored a646848d. Full pinned Conjecture63 remains open.

The first-correction row is now closed: use
MarkovCorrectionClosedMA64.first_correction_closedMA64, or the direct
source_lower_first_pathMA64 statement. The exact root residual is
ThreeBeyondCorrectionM418 ∧ OtherFourM9E2 by root_iff_beyond_correctionMA64.
Do not spend another worker proving AbsorbedUncutMF8F,
AbsorbedBorderMarginMF8F or AbsorbedMiddleM418; all are now proved.
BorderDominanceMF8F and the large relaxed edge expression were bypassed.

One promising next action is the second correction row j=q+2. Read
research/markov-1bb0aa1e-correction-band.md and the new next-row-experiment.json.
First prove the exact source identity with the nonnegative exponent ranges:

* false: d=q−3,c0=24,c1=4q;
* true: d=q−4,c0=36,c1=8q−8;
* correction c0 X²(1+X)^d+c1 X³(1+X)^d.

At output index t+3, this suggests an absorbed last coefficient
c0(d-t)/(t+1)+c1 for t≤d; at t>d the binomial weight kills the constant
term, so clamp handling and t=d must be proved explicitly. Exceptional
small q and small columns remain separate obligations. The 184 tested
complete and border margins passed with the actual source constants.
The crude larger envelope 36(j-t-5)/(t+1)+8j fails at small parameters;
do not silently use it or regard that failure as a source refutation.

The new generic ingredients are comp_binomial_lowerMA64,
complete_perturb_nonnegMA64, quantitative_cutMA64, lift_cut_marginMA64 and
lift_right_upperMA64. They may also support a more global correction-band
argument; the next action need not follow successive rows.

Retain all later horizontal rows, vertical and constant-i+j residuals, other
numerators, zeros, endpoints and universal rational scope. All source
correspondence obligations and a separate independent hash-bound audit still
govern completion. No full root theorem, fresh whole-source rebuild, or
independent completion audit occurred in this worker.
