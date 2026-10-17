# Shifted central-row formulas and inequalities

Machine-authored live research for e108e0e26f6d456c97155a7914deaabe.
The full pinned Conjecture63 and its exact negation remain unresolved. Final
accepted local status is controlled by evidence/markov-e108e0e2/validation.json.

The interrupted predecessor's saved builds, isolated replay and permitted
axiom audit matched all 13 planned sources. Its complete middle-strip and
top-row results are therefore usable inherited local proof evidence, although
its final report/manifest were never emitted. Reconciliation did not rerun
the prior finalizer or edit historical evidence.

## Exact central parameterization

Write epsilon=1 for the true residue b=3q+1 and epsilon=0 for the false
residue b=3q+2. Set q=2k+h+epsilon, T=q+k, and j=b-q-k-1. The nonnegative
parameter h represents the previous signed offset x=h-4. All still-open central
rows satisfy h<=3; the residual guard q+3<j is equivalent here to k+h>=3.
The old natural subtraction x=q-(2k+B) cannot encode these rows.

The new coefficient formula for every c>=0 is

  A(c+3,j)=S(h,T,c)+D(h+epsilon,k,c,residue),

where

  S(h,T,c)=sum_l C(c+l,c) C(h+2c+4,c+3-l)
                    [C(T,c+l)+4 C(T+1,c+l+2)], 0<=l<=c+3.

D is correctionShortME10, a positive combination of the inherited binomial
kernel middleKernelMD02. The full formula is in MarkovCentralSourceME10.
Its source, path and polygon attachments are explicit. Every argument and
zero in these ordinary binomial sums is retained.

The essential algebraic change was to prove the existing recurrence identities
under weaker, sufficient hypotheses: k<=q for correction parameter identities
and t<=n+2 for template parameter identities. The correction can then be
summed along q=e+2k for every e>=0, including e=0,1. The template is summed
along n=2T+h+2, t=T+3, using the exact t=3,4 initial rows. This proves the
shifted formula directly without extrapolating a natural-parameter theorem.

## Uniform high-column estimate

The shifted kernel is C(s,c) C(h+s+c+4,c+3), with spectral value s(s+h+5).
The new moment recurrences and deficit covariance inequalities are attached
to these actual weights, including their modified endpoint mass. The centered
variance identity retains the squared displacement of the mean.

The scalar certificate now assumes H>=r+2c+5 instead of H>=r+2c+9. Its exact
expansion after c=10+x, r=3+y, H=r+2c+5+z has 64 positive coefficients.
Ordinary Lean ring/positivity checks establish the bound for all natural
h, c>=10 and T>=c+3:

  (8(c+4)+1) S_c S_(c+2) <= 8(c+4) S_(c+1)^2.

The entire correction satisfies

  0<=D_c,       3^(c+2) D_c <=24 S_c.

The constant24 accounts for the near-center binomial term: the original
factor21 derivation used an inequality whose hypotheses fail at h=0,1.
choose_near_stepME10 proves the needed factor2 comparison one step past the
center; no unfavorable term is discarded. Positive perturbation then proves
the total raw gap for every c>=10. A separate exact 70-term positive scalar
certificate covers the last supported triple T=c+2. Exact zero support covers
T<c+2. Thus every physical starting column i>=13 is proved, without denominator,
depth or row bounds. The inherited row results extend this to every horizontal
row in every numerator-three source polynomial.

The remaining central columns0,1 vanish by the actual Newton-polygon theorem.
Consequently root_iff_central_finiteME10 is the exact equivalence

  Conjecture63 iff ThreeCentralFiniteME10 and OtherFourM9E2.

ThreeCentralFiniteME10 keeps only physical horizontal starts2..12 in the two
central rows, and keeps the inherited vertical and diagonal residuals intact.
Both root residuals remain open. Further optional certificate results, if
accepted, are recorded in the final checkpoint; draft positivity is not proof.

## Additional exact representation and experiments

MarkovCentralRationalME10 identifies the new integer formula with ordinary
rational binomial polynomials, preserving integer-zero cases. It is not a
nonintegral source-family claim. MarkovCentralSecondME10 also derives the
physical-column-two template coefficient 4(T+1) C(h+2,2) and adds the exact
source correction jet.

central-experiment.json contains 7,016 actual-source coefficient comparisons,
645 retained zeros, 6,586 raw gaps, 7,016 relative bounds, 3,789 weak margins,
and 590,991 polygon-valid triples in all directions on 79 source polynomials.
No failure occurred. central-low-probe.json records 80 exact univariate gap
polynomials for c=0..9, h=0..3 and both residues, shifted to the first needed
integer depth. Their power coefficients were nonnegative. These are finite
symbolic experiments; only matching Lean receipts can turn particular
certificates into universal statements.
## Final additional column closures

The physical-column-two gap was proved by eight positive univariate polynomial
certificates and transported to the actual source in MarkovCentralSecondSourceME10.
The shifted c=0 gap, physical start3, also compiled after correcting numeral
cast rewrites. MarkovCentralNineME10 combines these with the high-column result;
its acceptance is recorded by final validation. Its exact residual keeps
physical starts4..12 in the two central rows, with all vertical/diagonal
residuals and OtherFourM9E2 unchanged. The c=1 and c=2 attempts are unaccepted,
and c=3..9 generated sources have not been built.

