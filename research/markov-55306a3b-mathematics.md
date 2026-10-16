# Linear moment certificates and their limitations

Machine-authored live request 55306a3b34a648a9ba6d7e685f9d40d6.
Full Conjecture63 is unresolved. Successful source-hash-bound validation,
when present, is recorded in evidence/markov-55306a3b/validation.json.

Write H=n+2, W=sum q, U=sum q*x, V=sum q*x^2 for the inherited all-index
binomial weights q_r=P[r] choose(H,k+2-r), x_r=k+2-r. For any real A,B set
S=sum q(x-A)(B-x). The exact identities are

    S=(A+B)U-ABW-V,
    F=(H-1)U^2-H(A+B-1)WU+HABW^2+HWS,
    4(H-1)F=[2(H-1)U-H(A+B-1)W]^2
      +HW[4(H-1)S-(H(A+B-1)^2-4(H-1)AB)W].

Here F is exactly the inherited moment gap, not a normalized replacement
for the raw coefficient inequality. These equalities allow signed seeds and
every integer index, including negative indices and vanishing weights.
For nonnegative seeds, nonnegativity of the bracket suffices for F>=0.
No support assumption is needed for this conditional implication.

Crucially the bracket depends only on C=A+B, not on the width B-A:

    L_C=4(H-1)(CU-V)-H(C-1)^2 W.

This is a linear functional of the residual coefficients when C is fixed.
MarkovMomentSlackM553 proves its weighted-sum expression and its sufficient
raw LC implication. MarkovSourceLinearM553 supplies the exact horizontal,
vertical and diagonal source adapters, with all forward-factor hypotheses.
No source-wide lower bound for L_C has been proved.

MarkovLinearCenterM553 identifies the moments with the raw triple l,m,r:

    W=l+2m+r, U=H(l+m), V=H(Hl+m).

Thus this representation does not magically add information to the original
gap. It exposes a family of linear inequalities that might be approachable
through the positive source transfer. MarkovOptimalCenterM553 proves that
C*=1+2(H-1)U/(HW) optimizes the certificate when W is nonzero, and that its
sign is equivalent to the moment-gap sign. The all-zero case is explicitly
proved separately. Choosing this optimal center alone is not a sign proof.

## Fixed grids cannot cover the source family

At n=0 the certificate is exactly

    L_C=-8l+8(C-1)(l+m)-2(C-1)^2(l+2m+r).

If l>0, m>=0, d>0 and r>=4d(l+m), then L_(z/d)<0 for every integer z.
The proof separates C<=1 from C>=1+1/d and keeps all signs explicit.

For natural d>=1 choose the actual source path false^(16d+3), with label
1/(16d+5), row s=8d+2 and horizontal indices 1,2,3. The inherited source
Fibonacci formula gives

    l=s+1,
    2m=s(s+1)(s+2),
    12r=s(s-1)(s+1)(s+2)(s+3).

The growth inequality follows from the positive polynomial identity

    12[r-4d(l+m)]
      =120+1472d+9024d^2+29696d^3+49152d^4+32768d^5.

MarkovSourceGridM553 proves these literal source identities, all three
polygon memberships, the original raw LC inequality, and failure of every
center z/d for the actual residual moment expression. Here b-2s-1=0,
so the residual is the raw row. Every fixed rational grid fails on an
unbounded source family. This is a strategy obstruction, not a refutation
of Conjecture63. The raw LC assertion for this numerator-one family is
inherited; it is not credited as a new source inequality.

The concrete source 2/11 has the raw horizontal triple [91,728,2340] at
(2,5),(3,5),(4,5). Its certificate at C=3/2 is 1209/2>0, while every
integer center fails. MarkovSourceCenterWitnessM553 checks the actual source
coefficients, polygon memberships, all inherited horizontal residual guards,
and both certificate claims. This finite witness is not universal coverage.

## Finite exploration and inherited duplication

The slack probe compares independent source recurrence and matrix-word
evaluators on all 383 reduced interior fractions with b<=35. It checks
511611 forward-factor triples, retaining 178193 zero-containing triples.
No raw inequality fails. The support-midpoint center succeeds on 44150 of
174782 triples satisfying the coded residual guards; optimizing over integer
centers succeeds on 163244. Neither choice succeeds universally even in this
scan. Explicit failures in all three directions are saved. The grid witness
check separately compares eight exact source polynomials with the formulas.

A 9191-prefix scan through denominator 55 tested 49096424 individual-state
and 24548212 mixed comparisons. It reproduced auxiliary F failure at the
2/23 prefix and mixed failure at a 5/17 prefix. The former is already proved
universally in MarkovSourcePrefixM10D; the earlier 10d15751 report also records
mixed-prefix failures. No novelty or new obstruction is claimed for this
reproduction. H-state inequalities had no failure in this finite scan, but
remain unproved. This route was abandoned without replaying old edits.

The exact infinite residual remains InteriorCore63M37B, unchanged. None of
the center identities, experiments, or restricted-certificate obstructions
establish its remaining sign clauses or justify reversing binomial smoothing.
