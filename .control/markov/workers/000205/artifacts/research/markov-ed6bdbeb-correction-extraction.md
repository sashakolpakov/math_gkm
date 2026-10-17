# Exact correction extraction and its consequences

Machine-authored live request ed6bdbeb853b47bca338e8b2e6f2cdcd.
The full pinned Conjecture63 remains open. This report describes partial results;
the exact validation receipts are in evidence/markov-ed6bdbeb/validation.json.

Let B=3q+delta, with delta=1 for the true residue and delta=2 for the false
residue, and epsilon=3-delta. For i>=3 define k=B+2-i-j and

    D(i,j,k) = sum_s w(s) binom(j-s+i,i) binom(k-s+i-3,i-3),
    w(0)=1, w(s)=4s for s>0.

The summation range is 0<=s<=min(j,k); D is zero if k<0. Define

    J=j-q-1, K=B-q-i-j,
    E(q,r,i,j) = 4 sum_s (3s+epsilon)
                     binom(J-s+i-1,i-1) binom(K-s+i-2,i-2),

where E=0 if J<0 or K<0, and otherwise 0<=s<=min(J,K).
No coefficient normalization occurs in these formulas.

The theorem correction_kernel_extractionMED6 proves the inherited proposition
CorrectionKernelExtractionM13E, for every q>=1, both residues, every i>=3 and
every j. The stronger correction_formulaMED6 allows q=0 as a series identity.
Combining this with the inherited proved master extraction gives

    actual raw source coefficient A(i,j) = D(i,j,B+2-i-j)+E(q,r,i,j).

This is source_two_kernelMED6. source_path_two_kernelMED6 identifies these
coefficients with every actual numerator-three path. The first three columns
i=0,1,2 are expressly outside this formula; kernelRawMED6 retains their original
source coefficients. The formula includes zero coefficients and degree tails.

## Formal extraction

The preceding worker proved the first, column-wise extraction of the correction
series. Its compilation was successful but its enlarged replay timed out. This
run rebuilt that unchanged source in the new evidence directory and replayed it
together with the new extraction modules.

Put i=t+3, d=t+2+rbit, where rbit is 0 or 1. The exact column series is

    4 v * rescale_v H,
    H = z^d (epsilon+(3-epsilon)v z^2)/(1-v z^2)^2
            * (1-z)^(-(t+2)) * (1-vz)^(-(t+3)).

Rescaling sends z to vz. It multiplies the qth coefficient by v^q, so extraction
of v^j becomes extraction of v^(j-q-1) from H, with an explicit zero guard
j>=q+1. MarkovCorrectionGeoMED6 proves this identity from the predecessor's
column formula, including the geometric-series rescaling laws.

MarkovCorrectionSumMED6 transposes the two extractions. The quotient
(epsilon+(3-epsilon)x)/(1-x)^2 has coefficients 3s+epsilon. After extracting
v^J, the remaining ordinary series has terms

    z^(d+J+s) (3s+epsilon) binom(t+2+J-s,t+2) (1-z)^(-(t+2)).

Its qth coefficient is the zero-extended negative-binomial sequence with
integer argument q-d-J-s. The guarded natural coordinate q-d-J equals
B-q-i-j. The proof uses finite sums and the inherited sum-extension theorem,
not an analytic interchange or a truncation of negative indices to zero.
MarkovCorrectionExtractionMED6 proves the complete guard and index identities.

## Correction shape and signed gaps

The inherited correction_verticalM13E is now attached to the actual source
excess A-D by source_excess_verticalMED6. New affine-kernel parameter theorems
also prove correction_diagonalMED6, for every q,j and i>=3, with zero guards.
source_excess_diagonalMED6 attaches that inequality to A-D.

For the affine kernel, the new simultaneous-parameter shape holds for arbitrary
real epsilon>=1 and integer a,b>=1, not just epsilon=1,2. Its proof uses weighted
negative-binomial prefix comparisons. Exact ratio formulas reduce the increment
comparison to scalar inequalities; MarkovAffineScalarMED6 supplies explicit
polynomial nonnegativity certificates. Prefix minors and rectangle sums then
give parameter log-concavity and its diagonal form. Every denominator cancelled
in this argument has a proved positivity hypothesis.

These results do NOT infer log-concavity of D+E from separate log-concavity.
The signed mixed contribution

    M = 2 D1 E1 - D0 E2 - D2 E0

can be negative. The full gap is

    (D1^2-D0 D2) + M + (E1^2-E0 E2).

MarkovMixedAbsorptionMED6 proves that nonnegativity of the first two terms
is a sufficient hypothesis for the raw source inequality, in both vertical
and diagonal directions. That hypothesis remains unproved universally.
The finite scan through q=65, with 3<=i<=q+4 and max(0,q-2)<=j<=2q+3,
found no failure of this sufficient condition on its polygon-valid triples.
It found many negative mixed terms, which must not be discarded.

An even stronger proposed bound, omitting the positive term 2 D1 E1, is false.
At source 3/20, vertical starting position (3,8), D=[3333,5368,8254] and
E=[96,196,176]. The base gap minus both unsigned endpoint losses is -74150,
while the actual raw gap is 2051626. MarkovUnsignedObstructionMED6 proves
these exact values and polygon membership. This refutes only that shortcut.

## Enlarged raw source region

The correction is positive exactly when j>=q+1 and i+j+q<=B. In particular,
it vanishes for every row once i>=q+delta. Its complement now gives raw results
without the extra half-plane restriction previously needed to attach D:

* Every vertical triple with B<i+j+q satisfies the raw inequality.
* Every diagonal triple starting at i>=4 with B<i+j+q+2 satisfies it.
* Every column i>=q+delta satisfies all vertical inequalities.
* Every diagonal starting column i>=max(4,q+delta) satisfies all diagonal
  inequalities.

All these are unbounded in q,i,j. The statements include degree tails and all
zero-boundary cases. They follow from the global guarded base shape and exact
vanishing of E. MarkovCorrectionSupportPathMED6 transports them to actual paths;
since the inequalities hold for all these indices, polygon restriction is a
specialization, not an additional assumption.

The new exact reduction is root_iff_correction_supportMED6:

    Conjecture63 iff ThreeCorrectionSupportMED6 and OtherFourM9E2.

ThreeCorrectionSupportMED6 retains the unresolved middle vertical triangle
inside i<q+delta and i+j+q<=B, the middle diagonal triangle for i>=4 inside
i<q+delta and i+j+q+2<=B, and the inherited unresolved small-column diagonals
i=1,2,3. Its definition retains the inherited boundary and exceptional guards.
OtherFourM9E2 still quantifies over every path whose numerator is at least four.
Both residuals remain open. No normalization, family bound or direction has
been substituted for the pinned root.
