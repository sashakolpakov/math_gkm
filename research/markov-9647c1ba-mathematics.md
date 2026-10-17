# Mathematical results

Machine-authored live request 9647c1ba01484705bdaa6edb4d3c7d32.
Full pinned Conjecture63 remains unresolved. No historical novelty is claimed.

## Complete third correction row

`MarkovThirdClosedM964.third_correction_closedM964` proves, for every q≥1,
both residues r and every natural starting column i,

    threeRaw(q,r,i,q+3) * threeRaw(q,r,i+2,q+3)
      ≤ threeRaw(q,r,i+1,q+3)^2.

The direct source theorem `source_lower_third_pathM964` proves the horizontal
raw inequality for every actual path with numerator three, every i, and every
row j with 3j≤b+9. It combines the new row with inherited lower, first and
second correction results. There is no denominator bound or zero filtering.

`root_iff_beyond_thirdM964` proves exactly

    Conjecture63 ↔ ThreeBeyondThirdM964 ∧ OtherFourM9E2.

Both residual predicates remain unproved. They retain all remaining horizontal,
vertical and constant-i+j requirements, all other numerator families, zeros,
and the original endpoint scope. The equivalence is not root closure.

## Exact two-slot representation

The inherited third-row identity is lowerRow plus

    X²(1+X)^d(c0+c1 X+c2 X²).

For false residue q=d+5, j=d+8 and
c0=72, c1=28d+96, c2=2(d+5)(d+4).
For true residue q=d+6, j=d+9 and
c0=96, c1=44d+156, c2=4(d+5)(d+4).
These are the actual raw source parameters, not fitted replacements.

At source column s+3, s≥1, the auxiliary polynomial is

    L_s + a_s X^s + c2 X^(s−1),
    a_s = c0 max(d−s,0)/(s+1) + c1.

Binomial coefficient weighting by choose(d,k), followed by evaluation at 1,
is proved to equal the source coefficient. In the Lean two-slot API t=s−1.
At s=d+1 the final term contributes c2, whereas the single-slot weight is
zero. Thus the previously proved obstruction is respected and repaired by
the representation; no endpoint contribution is dropped.

## Uniform robustness, avoiding separate borders

`robust_cutM964` is a general polynomial theorem. Suppose the unperturbed
triple A,B,C has the coefficientwise quantitative cut margin

    N [cut(B)^2]_k ≤ M [cut(B)^2−cut(A)cut(C)]_k,

where M>0. Let A',B',C' satisfy x A'≤y A, x C'≤y C coefficientwise,
B≤B', with x>0 and the stated nonnegativity conditions. If

    y² M ≤ x² M + y² N,

then every coefficient of every cut gap for A',B',C' is nonnegative.
The proof multiplies coefficient inequalities and the quantitative margin;
it divides by neither source coefficients nor possibly zero binomial weights.

For the lift kernel, its complete binomial expansion proves

    liftTerm(j,s,m) ≥ choose(s+j+3,j) choose(j,m).

Consequently the second terminal slot has an additional factor j available.
Set B=choose(s+j+3,j) and U=c0*d/(s+1)+c1. The source bounds are
a_s,a_(s+2)≤U and c2≤U*j. These imply coefficientwise domination with
x=B and y=B+U. The middle perturbation only needs nonnegativity.

For s≥7 and s≤d+1, a sufficient scalar condition is proved:

    (2BU+U²) M ≤ B² N,

where M=liftTerm(j,s+1,0)^2 and
N=choose(s+1+j+3,j)^2−choose(s+j+3,j)choose(s+2+j+3,j).
The proof uses B≥choose(j+10,10). After s=7+x, d=s−1+g and
B=choose(j+10,10)+z, both residue numerators have 514 nonnegative rational
terms. Ordinary Lean `ring` and `positivity` check the exact identities.
Two weaker degree-seven certificate attempts had negative coefficients and
were rejected; their complete generators and diagnostics are preserved.

This closes source starting columns i≥10. Columns 2 through 9 are closed
by exact rational polynomial identities and nonnegative gap polynomials,
universally in d≥0. Columns 0 and 1 vanish in these exponent ranges.
The remaining q≤5 cases use inherited small-row results, ordinary kernel
reduction on the finite support, and a universal zero-tail theorem.

## General factored-row criterion

`MarkovLiftBudgetM964` permits arbitrary perturbation polynomials R, not only
two terminal slots. Its budget is

    0≤R_k≤U choose(j,s−k) for k≤s, and R_k=0 for k>s.

Under the same scalar margin, every cut and every nonnegative CrossLC weighting
has the desired inequality. This is a theorem with explicit hypotheses.

`MarkovCorrectionBudgetM964` constructs the exact kernel for any Q∈ℝ[X]:

    R_(d,s)(X) = a_s X^s + Σ_(k=0)^s Q_(s−k+1) X^k,
    a_s = Q_0 max(d−s,0)/(s+1).

Its binomial-weighted value is exactly [(1+X)^d Q]_(s+1), including s=0,
all zero tails, and corrections whose degree exceeds s. If Q is nonnegative
and Q_(m+1)≤c choose(j,m), its budget is Q_0*d/(s+1)+c.
`MarkovFactoredRowM964.factored_value_lcM964` supplies the resulting inequality;
`source_factored_row_lcM964` transports it to literal integer source coefficients
under an explicit source-identity hypothesis. No universal factorization,
budget or scalar margin for all later source rows has been assumed or proved.

## Experiments, separately classified

The direct recurrence check used q=1,…,12,16,24,32,48,64, both residues:
1,895 coefficients including 860 zeros; 1,827 triples, of which 967 were
polygon-valid; 1,735 third-row formula comparisons; 1,635 exact two-slot values;
267 scalar bounds and 25 final nonzero endpoint checks. No failure occurred.
See evidence/markov-9647c1ba/source-experiment.json.

A broader correction-band probe covered 162 rows at q=8,10,12,16,20,24,32,40.
It found no failures of division by X²(1+X)^d, residual nonnegativity, the
degree bound k−1, candidate constant/linear formulas, or 960 coefficient-budget
checks. The corrected scalar diagnostic passed 1,450 instances and failed 251,
all at s≤7. Eleven failures occur at s=7, so the third-row threshold must not
be extrapolated unchanged. These are sufficient-criterion failures, not raw
LC failures. See band-experiment.json and the next-action report.
The first probe used the wrong auxiliary scale; its code and output are retained,
and only the corrected diagnostic above is used. No experiment is a proof.
