# Uniform correction control and all large middle columns

Machine-authored live research request 41b38611ad354bc493dae65a2634a3d2.
The full pinned Conjecture63 and its negation remain unresolved.
Final accepted sources and receipts are recorded in
evidence/markov-41b38611/validation.json.

Write B=5 for r=true and B=4 for false. In the inherited exact numerator-three
middle parameterization q=x+2k+B, the physical row is j=b-q-k-1, and physical
starting column is c+3. Write A_c=topShortSumMEB6(x,x+3k+B,c) and
C_c=correctionShortMD02(x+B-2,k,c,r). The raw coefficient is R_c=A_c+C_c.
These are exact integer formulas for source coefficients, including zeros.

## Uniform correction bound

MarkovCorrectionDominationM41B proves for every natural x,k,c and both residues

    3^(c+2) C_c <= 21 A_c.

The proof uses m^n binom(k,n)<=binom(mk,n), proved from descending factorials.
The same-index correction kernels are bounded by one copy of the positive
top-sum mass; shifted-index kernels are bounded by six copies after reindexing.
The top sum contains four times this mass. Both residue cases are combined
without dropping any correction term. The constant 21 is a conservative bound.

For c>=5, 3^(c+2)>=84(c+5), so 4(c+5)C_c<=A_c. A generic integer perturbation
lemma proves that

    (c+4) A_(c+1)^2 >= (c+5) A_c A_(c+2)

is sufficient for the entire raw middle gap. It retains the negative mixed
contributions and the correction self-product; no claim that these terms are
separately nonnegative is needed. MarkovMiddleRelativeSourceM41B transports
the unconditional bound to actual path coefficients, giving A_c<=R_c and
3^(c+2)R_c<=(3^(c+2)+21)A_c. The scaling is removed for the raw LC conclusion.

## Actual-weight deficit argument

For the top template let i=c, T=i+r, H=T+i+d+9, and lambda_s=s(s+d+9).
Its exact weights are (endpoint weight 1, interior weight 4(T-s)) times
binom(s,i) binom(d+s+i+8,i+3). Let M be their mass, E their lambda excess
over lambda_i, and V=M times their second lambda moment minus the first
moment squared. MarkovTemplateStrongMomentM41B proves the quantitative
template inequality equivalent to

    E^2 + (i+1)(2i+d+10) M E - (i+1)V >= 0.

This is an exact identity with positive scales, not an external variance theorem.

Let F,G be their unnormalized first and second moments of t=T-s. The actual
weights satisfy

    (i+3) F <= (2T-i+1) M,
    (i+3)(i+4) G <= (6T^2-6Ti+i^2+6T-5i) M.

MarkovBinomialDeficitM41B proves exact triangular-binomial moment identities.
MarkovWeightedDeficitM41B proves a weighted antitone comparison: the second
binomial factor is increasing in s, whereas t and t^2 are decreasing. This
attaches the moment bounds to the actual weights, including the modified
endpoint. No arbitrary-weight preservation principle is assumed.

The spectral identities give

    E >= r H M - (H+r)F,
    V <= (H+r)^2 M G.

Set L=(i+1)(r-1)H-r(2r+i+1) and S=i(i+1)+6r(i+1)+6r^2. The polynomial

    L^2(i+4)+(H-r+1)L(i+1)(i+3)(i+4)
      -(H+r)^2 S(i+1)(i+3)

has a strictly positive 64-term expansion after i=27+x, r=3+y,
H=r+2i+9+z. The expansion and positivity are proved by ordinary Lean ring
reasoning. A separate positive expansion proves L>0. The scalar control
lemma combines all four actual moment bounds. MarkovDeficitAttachmentM41B
therefore proves the strong drift nonnegative for every d>=0,i>=27,r>=3.
The attachment is completed in this invocation; it is not a pending premise.

## Source consequence and exact remaining root

MarkovMiddleLargeColumnM41B transports this to the raw middle source and
proves polygon membership for each of the three positions in its supported
region. MarkovMiddleFiniteColumnsM41B adds the last supported triple using
the inherited all-parameter top_mass_last_strictMEB6 theorem. Its correction
vanishes by exact support. If the right neighbor is beyond support, its zero
coefficient proves the non-strict inequality directly.

Thus every starting column c+3>=30 is closed on every admissible numerator-three
middle row, with x,k unbounded and both residues, including all zero tails.
The path theorem covers every generated path with numerator label three.

The final exact equivalence is

    Conjecture63 iff MiddleFiniteColumnsM41B
      and ThreeOutsideMiddleMD02 and OtherFourM9E2.

MiddleFiniteColumnsM41B retains 5<=c<27, k>=3, x arbitrary, both residues,
and the inherited cone guard. There are 22 column indices, but infinitely
many parameters. The physical starting columns are 8 through 29. This is
not a finite verification of the conjecture. The other two root residuals
are unchanged and open; all other families and directions remain.

## Experiments and failures

The exact source experiment passed 21,392 coefficient comparisons and 21,392
relative-bound checks, retaining 1,628 zero coefficients. It also passed
751,190 polygon-valid triples across all three directions, with endpoints
and additional non-numerator-three paths present. Separate finite domination
and strong-gap probes passed 24,962 cases, including depth k=1000. These are
experiments, not proofs of universal statements.

The crude deficit scalar condition fails at r=2 even at large i; this is an
auxiliary failure, not a source counterexample. That slice is closed above
using the inherited exact tail theorem. Polynomial sign probes at shifts
i=20 through 26 had a negative coefficient; the positive shifted certificate
starts at 27. No optimality of this threshold is claimed.
