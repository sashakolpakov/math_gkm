# Mathematical results

Machine-authored request 09fffb56626d410db28e496da5a3241c.
The full pinned Conjecture63 remains unresolved. No novelty claim is made.

## One of the two inherited premises is now closed

In `MarkovSharpScalarsClosedM09F.lean`, `MathGKM.Markov.sharp_top_scalarsM09F`
proves the exact inherited
proposition `SharpTopScalarsMBE3`, for every d,k,s and both residues, subject only
to its existing conditions 3<=s<=j. Here

    j = d+3k+c,       c=2 (false), c=3 (true),
    B_s = liftTermMAE9(j,s,0),
    E_m = correctionTermM657(k,s+1,m,r),
    U_s = E_0 max(d-s,0)/(s+1) + E_1,
    V_s = B_s+U_s.

The proved conclusion is V_s V_(s+2) <= B_(s+1)^2. The absorbed endpoint,
the clamp transition, k=0 and both residues are included. There is no finite
bound on any parameter.

Consequently the established transport now needs only
`SharpCompleteMarginMBE3` to prove all horizontal correction-band inequalities.
That complete convolution margin remains UNPROVED. No root residual clause is
removed. `ThreeBeyondBandM657` and `OtherFourM9E2` remain in full.

## Sharper universal correction budget

The key estimate, proved for all d,k,r and s>=3, is

    choose(s+9,4) U_s <= (s+3) B_s.

The predecessor's bound used 3(s+3) and required d<=s. The new proof treats
the weighted correction binomials together. With a=1 or 2, it proves by
induction on k>=1 that

    choose(s+9,4) [a choose(k+s+4,s+5)+(3-a) choose(k+s+3,s+5)]
      <= choose(3k+a+s+5,s+5).

The induction step is a positive polynomial identity after k=u+1, s=x+3.
Its weighted-binomial recurrence is derived from ordinary binomial identities.
This is not interpolation or finite checking.

For positive k, `MarkovAbsorbedBudgetM09F` controls the absorbed term using

    E_0 (j_0+1) <= E_1 (s+3)(s+1),       j_0=3k+c,
    B_s(d) (j_0+1) >= B_s(0) [j_0+1+d(s+3)].

The first follows from an explicit polynomial comparison and binomial ratios;
the second is a proved binomial growth lower bound. These show that the
absorbed linear correction is dominated by the growth already available in
the lower base. `MarkovZeroBandBudgetM09F` handles k=0 separately by a positive
binomial lower bound and the clamp split. No division by a possibly zero
source coefficient is used.

The sharp inherited coefficientwise comparison B_s K_s[h] <= V_s L_s[h]
then gives, including zero tails,

    choose(s+9,4) K_s[h] <= [choose(s+9,4)+(s+3)] L_s[h].

Weighting by the nonnegative choose(d,h) and using the existing exact source
identity proves the raw-source estimate

    choose(s+9,4) A_(s+3,q+k+1)
      <= [choose(s+9,4)+(s+3)] liftOutput(d,q+k+1,s)

for q>=2 throughout the nonnegative-exponent correction band, s>=3, with
d=bandExponent(q,k,r). There is no d<=s condition. This is a coefficient
bound, not an unconditional source log-concavity theorem.

## Quantitative base curvature closes the scalar

The exact binomial representation of B_s yields

    B_s B_(s+2) (s+7)(s+j+4)
       <= B_(s+1)^2 (s+6)(s+j+5).

Its residual numerator is the positive polynomial

    60+48j+8j^2+s(22+8j)+2s^2.

The budget factors satisfy

    (1+(s+3)/choose(s+9,4))(1+(s+5)/choose(s+11,4))
       <= (s+7)(s+j+4)/[(s+6)(s+j+5)]

when s>=3, j>=5 and s<=j. This is proved by explicit positive polynomial
certificates: s=3,4 separately, and s=x+5,j=s+u for all x,u>=0. Combining
the two inequalities closes the top scalar. The remaining j<5 possibilities
are clamped k=0 cases, already covered without strengthening assumptions.

## Geometry of the normalized complete coefficient

Define W(j,s,m)=(s+m+4)(s+m+5)+4(j-m)(s+j+4) and

    R(j,s,m)=(s+4)(s+5) W(j,s,m)
                /[(s+m+4)(s+m+5) W(j,s,0)].

The exact formal identity is

    liftTerm(j,s,m)/liftTerm(j,s,0) = choose(j,m) R(j,s,m),  m<=j.

The source target is not renormalized: this is solely an auxiliary analysis
of the complete kernel. `MarkovNormalizedKernelM09F` proves R is increasing
and log-concave in s, even for rational 0<=m<=j and s>=0. Positive denominator
proofs and exact 75-term and 498-term polynomial certificates justify the
claims. `MarkovNormalizedCoefficientsM09F` attaches them to the complete
coefficients, including m>j zero tails.

Individual normalized log-concavity does not establish the complete convolution
margin. The stronger additive-concavity shortcut is false at j=6,s=0,m=6:
its second difference is -4/35035. This is an auxiliary obstruction, not a
reversed raw-source inequality.

## Reproducible experiments

`experiment_09fffb56.py` starts from the actual recurrence and checks 449 rows,
36,521 coefficients, 16,284 zeros, 35,623 raw triples (19,339 polygon-valid),
and 33,827 improved bounds. Its separate budget scan tests 14,608 cases,
including 5,500 with positive absorption, and 12,666 top scalars. No failures.
These are finite experiments, separate from the universal Lean proofs.

`convolution_probe_09fffb56.py` finds no failure in 105,298 remaining-margin
coefficients, 103,930 successive convolution ratios or 1,497,618 balanced
partial pair sums. It does find negative individual additive second
differences. Neither positive scan establishes the remaining premise.

## Exact alternative reduction and exploratory low-degree formula

`MarkovOrderedConvolutionM09F` proves a finite weighted-covariance theorem
and its polynomial translation consequence. If every cross-index ratio of
the coefficients of qPoly(j,s+1)^2 to qPoly(j,s)qPoly(j,s+2) is ordered, then
translation by X+1 gives SharpCompleteMarginMBE3. This is a proved implication
from the explicit, still UNPROVED `UnshiftedRatioM09F`.

`MarkovAdjacentConvolutionM09F` proves both products strictly positive on
0..2j and zero beyond that interval. It then proves UnshiftedRatioM09F is
equivalent to the adjacent comparisons `UnshiftedAdjacentM09F`, with n<2j.
This uses positivity to chain adjacent ratios and explicitly treats zero
tails; it does not infer CrossLC from arbitrary adjacent inequalities with
gaps. Either candidate condition suffices for horizontal source-band LC.

The actual unshifted weights are w(0)=1, w(h)=4h for h>0, zero for h<0.
The finite q-ratio scan checks 259,200 adjacent comparisons with no failure.
An arbitrary positive log-concave weight list fails the analogous condition
with exact step gap -502664921623766. Its list and computations are preserved
in q-ratio-probe.json. That counterexample is experimental auxiliary evidence;
there is no claimed source-family witness or Lean refutation of the root.

For possible further analysis, write A_n=[q_s q_(s+2)]_n and
B_n=[q_(s+1)^2]_n. The following proposed identities have been checked exactly
on 181,800 interior coefficients and 3,600 boundary coefficients but are NOT
yet Lean theorems. For n<j, set T=2s+n+9:

    A_n = 16[j(j-n) choose(T,n)+(s+4)(s+6) choose(T,n-2)],
    B_n = 16[j(j-n) choose(T,n)+(s+5)^2 choose(T,n-2)].

Here choose(T,n-2) is zero for integer n<2, not natural truncated subtraction.
These formulas are suggested by multiplying the infinite negative-binomial
series [j-(j+s+4)X](1-X)^(-s-5), since the cutoff is not met at n<j.
At n=j, the endpoint weight is 1 rather than 0 and must be restored:

    A_j = 16(s+4)(s+6) choose(2s+j+9,j-2)
          +4j[choose(s+j+3,j)+choose(s+j+5,j)],
    B_j = 16(s+5)^2 choose(2s+j+9,j-2)+8j choose(s+j+4,j).

No n>j formula is claimed, and none of this finite evidence closes the
unshifted ratio condition. The script is q_low_formula_09fffb56.py.
