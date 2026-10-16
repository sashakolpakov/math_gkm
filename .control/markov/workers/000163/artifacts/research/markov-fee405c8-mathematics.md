# Weighting transport and the two truncation edges

Machine-authored request fee405c8897249a786084298201a14aa. Full pinned Conjecture63 remains unresolved.

The inherited kernel is

    L(j,t,m)=C(t+m+3,m)[C(t+j+3,t+m+3)+4C(t+j+4,t+m+5)],
    A(j,t)(X)=sum_{r=0}^t L(j,t,t-r) X^r.

The cut A(j,t)^[h] retains exactly coefficients with index at least h. Let

    G(j,t,h)=A(j,t+1)^[h]^2-A(j,t)^[h] A(j,t+2)^[h].

All formulas here use ordinary raw coefficients. Neither auxiliary ratios nor binomial weights redefine the source target.

## General weighting theorem

`MarkovRankWeightMFEE.lean` proves the finite identity underlying summation by parts: if a signed sum has nonnegative totals on every upper rank cut, then multiplying its terms by a nonnegative increasing function of rank preserves nonnegativity. The proof is exact telescoping and finite-sum interchange; signs of individual summands are unrestricted.

`MarkovPolynomialWeightMFEE.lean` applies this on each antidiagonal i+j=n, with rank min(i,j). For a nonnegative CrossLC sequence f on all integers, the product f(i)f(n-i) increases as i moves toward the center. Consequently, if ALL coefficientwise cut gaps of a polynomial triple are nonnegative, coefficientwise multiplication of all three polynomials by f preserves their coefficientwise gap. Evaluation at 1 gives log-concavity of the weighted totals. The proof retains zero weights and never divides by a coefficient. Adjacent LC is not substituted for CrossLC.

`MarkovLiftTransportMFEE.lean` proves the exact weighting and source bridges. The weight f(k)=C(d,k), zero-extended on integers, is CrossLC. Thus LiftBoundaryM7E2 implies

    liftOutput(d,j,t) liftOutput(d,j,t+2) <= liftOutput(d,j,t+1)^2

for every natural d,j,t. In the actual numerator-three family, d=n-2j-1 and j<=q, with n=3q+1 or 3q+2. The inherited coefficient identity gives every lower horizontal raw inequality, including columns i<3 (zero) and all trailing zeros. This implication was previously missing. Its truncation premise remains unproved.

## First truncation edge h=t

`MarkovCutShiftMFEE.lean` proves an exact cut-shift identity for all j,h,v:

    A(j,h+v)^[h] = X^h sum_{k=0}^v L(j,h+v,v-k) X^k.

For h=t, the gap is X^(2t) times the quadratic with coefficients

    L(j,t+1,1)^2-L(j,t,0)L(j,t+2,2),
    2 L(j,t+1,1)L(j,t+1,0)-L(j,t,0)L(j,t+2,1),
    L(j,t+1,0)^2-L(j,t,0)L(j,t+2,0).

All three coefficients are now proved nonnegative. For j>=2, the first two use exact denominator-cleared polynomial certificates after j=s+2, with nonnegative coefficients in s,t. The rational normalization, positive denominators, binomial parameter steps, and source-kernel values are separately proved; generated algebra is checked by Lean ring proofs. The last coefficient follows from the inherited complete Q-kernel gap. The cases j=0,1 are proved separately.

Correction to the predecessor's next-step prose: the literal formula is L(1,t,1)=t+4, while L(1,t+1,1)=t+5. `lift_one_valuesMFEE` proves L(1,t,0)=t+8 and L(1,t,1)=t+4. No inherited source was edited.

## Opposite edge t+1=j+h

Write E(j,t)=reflect_j(Q(j,t)(1+X)), as in the inherited work. `MarkovCutOuterMFEE.lean` proves

    X A(j,t)^[h] = X^h [E(j,t)-C(coeff_0 E(j,t))],
    A(j,t+1)^[h] = X^h E(j,t+1),
    A(j,t+2)^[h] = X^(h+1) E(j,t+2)

when t+1=j+h. These identities include h=0; no negative polynomial power is used. Cancelling multiplication by X yields

    G(j,t,h) = X^(2h) [E(j,t+1)^2-E(j,t)E(j,t+2)
                       +C(coeff_0 E(j,t)) E(j,t+2)].

Both summands in brackets have nonnegative coefficients: the first is the inherited full-kernel theorem, and the second is a product of nonnegative coefficients. Thus the entire opposite edge is proved uniformly.

Combining both edges with the inherited zero and untruncated regions proves the exact auxiliary equivalence

    LiftLCPositiveM7E2 iff LiftMiddleMFEE,
    LiftMiddleMFEE := forall j,t,h,k, h<t -> t+1<j+h -> coeff_k G(j,t,h)>=0.

The remaining domain is t=h+v, 1<=v<=j-2, hence j>=3. All cuts for j<=2 are proved. LiftMiddleMFEE itself remains unproved.

## Remaining source obligations

`MarkovLiftRootMFEE.lean` proves the exact root equivalence

    Conjecture63 iff LowerHorizontalMFEE AND ThreeOutsideLowerMFEE AND OtherFourM9E2.

LowerHorizontalMFEE is the complete numerator-three lower horizontal claim. ThreeOutsideLowerMFEE retains the other horizontal rows (except the already proved row 5), every previously unresolved vertical and diagonal clause, and all correction bands. OtherFourM9E2 is unchanged. LiftMiddleMFEE is only sufficient for LowerHorizontalMFEE; no equivalence of that auxiliary premise with the root is claimed. The conditional source-path theorem explicitly uses the inherited numerator-three classification.

`MarkovNormalizedCutMFEE.lean` also proves a finite normalized-sum criterion: positive denominators, ordered cross-ratio inequalities, and a nonnegative full total imply nonnegative upper cuts. This supplies a possible next bridge for inward-pair monotonicity. Its strict-positive-denominator hypotheses are NOT established for the full kernel domain; outer terms with zero current factors still require separate treatment.

`MarkovRatioObstructionMFEE.lean` proves the exact separate-ratio convexity failure at j=13,t=2: the second difference is -18761/44990946. It also proves polygon membership and raw horizontal LC for the corresponding numerator-three lower-region triple at columns 4,5,6 and row 13. The auxiliary failure is not a source counterexample.

The 20,813-term positive symbolic numerator discussed in the next-step note remains an unvalidated candidate: the Lean ring_nf/positivity attempt timed out at 120 seconds. It is excluded from the admitted module list. A successful GAP computation alone has no theorem status.
