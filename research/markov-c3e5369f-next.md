# Revisable next actions

Machine-authored c3e5369f. Full pinned Conjecture63 remains open.

The entire numerator-three second correction row is closed. Use
`MarkovSecondClosedMC3E.second_correction_closedMC3E` or its direct path
statement `source_lower_second_pathMC3E`. The exact remaining root is
`ThreeBeyondSecondMC3E ∧ OtherFourM9E2` by `root_iff_beyond_secondMC3E`.
Do not re-prove the first or second correction row.

The next third correction row has an exact source identity in
`MarkovThirdRowFormulaMC3E`: j=q+3, lowerRow plus
X²(1+X)^d(c0+c1 X+c2 X²), with

* false: q≥5, d=q−5, c0=72, c1=28q−44, c2=2q(q−1);
* true: q≥6, d=q−6, c0=96, c1=44q−108, c2=4(q−1)(q−2).

The current single-slot absorption cannot cover its edge: at t=d+1 the
choose(d,t) weight is zero but the correction is c2>0.
`MarkovThirdEdgeObstructionMC3E.third_no_single_slotMC3E` is the precise
source-based obstruction. It is not a source LC failure. Do not extrapolate
the second-row proof by postulating a finite scalar e_t at that edge.

One possible next representation is

    liftPoly(j,t) + (c0 max(d−t,0)/(t+1)+c1) X^t + c2 X^(t−1),

with the final term omitted at t=0. Its candidate cut gaps passed 28,716 exact
coefficient tests at 90 parameter triples (including t=d+1), plus 90 weighted
inequalities: evidence/markov-c3e5369f/two-slot-experiment.json. These are
experiments. Its universal source-weight bridge, cut-gap positivity, all small
columns and exceptional small q remain unproved. Generic bounds for linear
perturbations of the complete kernel and two cut-border coefficients may help.
The choice to pursue this route remains optional.

The current generic `perturb_all_cutsMC3E` applies to arbitrary nonnegative
last coefficients a,b,c, provided two explicit complete/border scalar margins
hold. The proof of those margins for the second row needed the degree-seven
binomial lower bound; the degree-five base failed as a sufficient certificate.
All actual denominators, clamps, and zero factors are retained in the source
transport. No larger-envelope substitution is licensed by the finite data.

Retain later horizontal rows, vertical and constant-i+j residuals, other
numerators, all zeros and both endpoints. A general band theorem or a different
representation may be more useful than proceeding row by row. All source
correspondence obligations, fresh rebuilding and an independent hash-bound
completion audit still govern closure. No pending external action requests.
