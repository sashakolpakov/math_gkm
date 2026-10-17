# Uniform correction suppression and an open curvature route

Machine-authored live request 9c28b628c1484db6806fcccfa00538d5.
Consult evidence/markov-9c28b628/validation.json for actual final validation.
The full pinned Conjecture63 remains OPEN.

Write B=3q+delta, delta=1 or 2, epsilon=3-delta. For i=t+3>=3 the
inherited exact source formula is A(i,j)=D(i,j)+E(i,j). D and E are the
guarded baseValueM13E and correctionValueM13E. No coefficient normalization
occurs. The new unconditional theorem is

    2(i+1) E(i,j) <= D(i,j).

It holds for every natural q,i,j with i>=3, including zero tails. For q>=1,
raw_excess_suppressedM9C28 expresses E as the actual raw source coefficient
minus D. This comparison is not an inference that sums preserve LC.

On the correction support put J=j-q-1 and K=B-q-i-j. Both are nonnegative,
and q=J+K+t+epsilon+1. The base kernel at the same coefficient is

    D_t(2J+K+t+epsilon+2, J+2K+t+epsilon+3),

where

    D_t(j,k) = sum_{s=0}^{min(j,k)} w(s)
       binom(j-s+t+3,t+3) binom(k-s+t,t),
    w(0)=1, w(s)=4s for s>0.

The full correction is

    4 sum_{s=0}^{min(J,K)} (3s+epsilon)
       binom(J-s+t+2,t+2) binom(K-s+t+1,t+1).

Map its summation index s injectively to 3s+epsilon in the base sum. This
index is positive and in range. The weights match exactly. With u=J-s and
v=K-s, the remaining comparison is the universally proved inequality

    2(t+4) binom(u+t+2,t+2) binom(v+t+1,t+1)
      <= binom(2u+v+2t+5,t+3) binom(u+2v+2t+3,t).

The t=0 case is a cubic inequality; its proof splits v>u and v<=u before
expansion, retaining the discrete integer boundary. The induction uses
choose(n+2,k+1)(k+1) >= 2m choose(n,k) whenever 2m<=n+2, followed by the
ordinary binomial successor identities. Summing over the injective image
and using nonnegativity of the remaining base terms proves the bound.
The Lean chain is MarkovSuppressionBinomialM9C28, MarkovSuppressionSumM9C28,
and MarkovSuppressionSourceM9C28. Every sum and support guard is explicit.

This yields a simpler sufficient condition for every numerator-three
diagonal starting at i>=3. The OPEN proposition BaseCurvatureM9C28 is

    (t+5) D_t(j+2,k) D_{t+2}(j,k)
      <= (t+4) D_{t+1}(j+1,k)^2

for all natural t,j,k. It strengthens ordinary base log-concavity.
The 18,491 exact tests t<=10, j,k<=40 passed; that is not a proof.

To see why it suffices, write m=i+1. The curvature premise gives
m(D1^2-D0D2)>=D0D2. Suppression at the two neighbors gives
2m E0<=D0 and 2m E2<=D2, the latter by weakening the stronger bound at
column i+2. Hence m(D0E2+D2E0)<=D0D2. The correction's inherited diagonal
LC and nonnegativity then prove the total raw inequality. Degree tails
are handled separately. MarkovCurvatureRouteM9C28 formalizes this conditional
argument; it does NOT assert BaseCurvatureM9C28.

This replaces the diagonal mixed-gap challenge by a single stronger base
inequality independent of q and the residue. It is only a sufficient route.
The small diagonal starts 1 and 2, vertical columns >=5 in the residual
support, and OtherFourM9E2 remain separate open obligations. No root proof
or negation, or independent completion audit, is claimed.

The quantitative experiment also rejected an attempted stronger pointwise
constant 16(c+2), and found further failures of unsigned vertical absorption.
Those failures concern proposed shortcuts, not Conjecture63. The proved
suppression bound and the conditional curvature route keep their exact
constants and directions.
