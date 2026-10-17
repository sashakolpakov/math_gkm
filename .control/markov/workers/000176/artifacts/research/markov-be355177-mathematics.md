# Mathematical progress

Machine-authored live request be35517714ad4fa2a3e9e4312d96ce0a.
The full pinned Conjecture63 remains unresolved. No novelty claim is made.

Use the predecessor's exact numerator-three band parameters

    q=d+2k+c, j=d+3k+c+1, c=1 (false) or 2 (true), d,k>=0.

The source denominator is 3q+3-c. Actual source applications require q>=2.
Write L_s=liftPolyM7E2(j,s) and K_s=bandKernelM657(d,k,s,r). Their binomial
weighting by choose(d,h) gives, respectively, the lower contribution and
the actual raw coefficient A_(s+3,j). This source identity was already proved.
All coefficient bounds below retain zeros; division is not used at zero slots.

## An exact optimal coefficientwise bound

Put B_s=L_s[s]=liftTermMAE9(j,s,0) and

    U_s = absorbedExtra(d,s,E(k,s+1,0)) + E(k,s+1,1),
    V_s = B_s + U_s = K_s[s].

Here E is the predecessor's correctionTermM657, and absorbedExtra includes
max(d-s,0)/(s+1). MarkovTransposedBoundsMBE3 proves

    B_s E(k,s+1,m+1) <= E(k,s+1,1) liftTerm(j,s,m)

for every m whenever k<=j. The proof separates the two terms of the lower
kernel and uses a universally proved binomial cross-ratio inequality. It
does not assume either log-concavity or a finite coefficient budget.

MarkovTransposedSharpMBE3 then proves, for every coefficient index h,

    B_s K_s[h] <= V_s L_s[h].

B_s is strictly positive. Equality holds at h=s. In particular, for every
real v, K_s[h]<=v L_s[h] for all h is equivalent to V_s<=v B_s. The relative
bound is therefore optimal among coefficientwise scalar bounds. The theorem
covers every natural d,k,s, both residues, all clamped cases and zero tails.

## A uniform bound independent of the band index

MarkovSeparatedChooseMBE3 proves, for every k>=1 and s>=0,

    choose(s+9,4) choose(k+s+4,s+5) <= choose(3k+s+6,s+5).

This is a universal induction, with the step proved by an explicit positive
polynomial identity. It is not interpolation. MarkovUniformCorrectionMBE3
extends the bound to shifted lower indices and proves

    choose(s+9,4) E(k,s+1,m+1) <= 3(s+3) liftTerm(j,s,m)

whenever j>=3k+2, including k=0. Hence, when d<=s so the absorbed term is zero,

    choose(s+9,4) K_s[h] <= (choose(s+9,4)+3(s+3)) L_s[h].

The same file transports this through the actual nonnegative binomial
weighting and source identity:

    choose(s+9,4) A_(s+3,j)
       <= (choose(s+9,4)+3(s+3)) liftOutput(d,j,s).

This is a new unconditional universal raw-source coefficient estimate in
the stated band region. It is not itself a log-concavity theorem.

## A sharper candidate and exact conditional reduction

Let P_s=completeLiftMA64(j,s), so P_s[m]=liftTerm(j,s,m) and P_s[0]=B_s.
SharpCompleteMarginMBE3 is the explicit, still UNPROVED assertion

    B_(s+1)^2 [P_s P_(s+2)]_n
       <= B_s B_(s+2) [P_(s+1)^2]_n

for every natural j,s,n. It replaces the old very conservative margin by
the exact normalized gap at coefficient zero. MarkovSharpMarginMBE3 proves
that this premise transports to every lower tail cut when s<=j, using the
already proved ordered-pair machinery and exact reflection/shift identities.

The other remaining premise, SharpTopScalarsMBE3, asserts

    V_s V_(s+2) <= B_(s+1)^2

for the source parameters and 3<=s<=j. MarkovSharpTransportMBE3 proves that
these two explicit hypotheses imply coefficientwise nonnegativity of

    cut_h(L_(s+1))^2 - cut_h(K_s) cut_h(K_(s+2)).

This deliberately discards the nonnegative middle correction. It implies
the original complete-kernel cut inequalities, then weighted-output LC,
BandMiddleM657, and every horizontal band inequality, including prefixes
and tails. Neither hypothesis is asserted as a theorem.

MarkovSharpScalarMBE3 proves an exact auxiliary equivalence: under the sharp
complete-margin premise, that stronger all-cut inequality is equivalent to
the single top scalar V_s V_(s+2)<=B_(s+1)^2. Necessity comes from coefficient
2s+2 of the cut at h=s. Thus no additional coefficientwise-budget loss remains
in this particular reduction. This is not an equivalence with the full root.

## Why the old margin and a pairwise shortcut do not suffice

At d=0,k=1,false,s=3, the exact top values are

    B=(2442,3652,5291), U=(24,28,32).

The old normalized margin certificate has exact deficit -2317213022124,
whereas the new top scalar gap is 210586. MarkovSharpObstructionsMBE3 proves
both values. The source is 3/11 on path [false,false,true,false]; the
polygon-valid raw triple at (6,5),(7,5),(8,5) is [8652,5280,1287], with gap
16743276. The actual path, labels, coefficients, polygon memberships and
positive gap are proved. This is not a root refutation.

The stronger termwise symmetric-pair version of SharpCompleteMarginMBE3 is
false: at j=6,s=0 and pair (0,6), its cleared difference is -1916804736.
The complete convolution's degree-six difference is nevertheless
52158473438400. Both are proved. Negative individual pairs cannot be dropped
or identified with the full coefficient condition.

## Experiments, separate from proofs

Exact integer/rational tests are reproducible from this request's scripts:

- Expanded original tail cuts: 4,632 triples, 9,809,279 coefficient checks,
  no failure; s up to 100, additional d,k up to 200 and varied extreme ratios.
- Stronger cuts with the middle correction discarded: 3,024 triples, no
  negative coefficient. No universal claim follows.
- Exact sharp relative bound: 187,200 checks, no failure. The old scalar
  margin failed 6,619 of 16,848 checks, so that route was not assumed valid.
- Sharp complete margin: 157,440 coefficients initially, no failure; 2,205,120
  symmetric-pair checks found 49,982 failures. The latter test is different.
- Larger candidates: 2,821 top scalars with d,k as large as 1,000,000 and both
  clamp regimes; 11,851 additional complete-margin coefficients, with j up
  to 300 and s up to 1000. No failures in these finite samples.
- Fresh source recurrence: 319 rows, 24,055 coefficients, 10,781 zeros,
  23,417 raw triples (12,636 polygon-valid), and 19,648 uniform bounds.
  No identity or inequality failure occurred.

The root equivalence ThreeBeyondBandM657 AND OtherFourM9E2 is unchanged.
No residual root clause was removed by these coefficient bounds or experiments.
