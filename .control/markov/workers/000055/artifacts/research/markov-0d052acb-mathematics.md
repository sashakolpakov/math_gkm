# Completing the second lower diagonal

Machine-authored live request 0d052acbcc6844ae8cbc5f5d5f8e5a55.
The pinned full Conjecture63 remains unresolved. Validation receipts determine
which statements below are accepted; this report is not an independent audit
or a historical novelty claim.

For a non-Pell source, split its path as true^n ++ false :: rest. Write
c=(frame rest).mid.b, r=(frame rest).mid.a, and q=max(2r-c,0). The inherited
secondExplicitE273(n,c,r,j) is twice the literal coefficient A(i,j) on
i+j=a+2. It is a 17-term shifted binomial formula, with the exceptional
2*[c=2 and j=2n+3] correction kept explicitly. We prove its adjacent
log-concavity for all n>=2, c>r>0, and all natural j; n=0,1 were already
handled by the inherited cubic and quintic formulas.

For n>=5 the earlier open-region shape inequalities cover starts
3<=j<=n-2 and n+3<=j<=2n. The seven remaining starts before the tail are
0,1,2,n-1,n,n+1,n+2. MarkovTransitionFormulasD052 derives the eleven
needed coefficient identities from the checked shifted-binomial identity
6*B(j,k)=(j-k+1)(j-k+2)(j-k+3) for k<=j+3, including its first three
zero positions. Other terms vanish by their explicit shift guards.

MarkovTransitionGapsD052 proves the seven adjacent gap inequalities by exact
polynomial identities. After n=t+5, r=u+1, c=u+v+2 each gap is a polynomial
with 75 nonnegative monomials. The final Lean certificates use Horner form
to reduce proof-checking cost; their identities and signs are checked, not
inferred from Python output. No q term appears at these indices.

MarkovSmallRunsD052 separately handles n=2,3,4 for arbitrary c>r>0. It
identifies every coefficient through j=2n+2 and proves the 5,7,9 remaining
pre-tail gaps respectively. These are universal polynomial theorems in c,r,
not finite numerical checks of sources.

MarkovSecondTailD052 proves that for every n>=2 the final three doubled
coefficients at j=2n+1,2n+2,2n+3 are exactly

    [32r(c+r)-48r+8c, 16r², 8q+2*[c=2]],

and every coefficient with j>=2n+4 is zero. These identities again come from
the exact 17-term formula, not a degree guessed from experiments. The final
nontrivial gap splits c=2 (forcing r=1), q=0, and 2r>c. In the last case,
substitute u=c-r-1 and v=2r-c-1; the cleared gap has 15 nonnegative monomials.
All later inequalities have a zero neighboring coefficient and follow from
nonnegativity of a square, without dividing by a coefficient.

MarkovSecondAllD052 assembles these cases into second_explicit_lcD052.
MarkovSecondSourceD052 transports it to literal raw coefficients. The
non-Pell transfer uses source_second_explicitE273 at all three positions
and cancels the common positive factor. All-true paths use the inherited
Pell diagonal theorem. Thus source_second_lower_diagonalD052 covers every
source path and every polygon triple on total degree a+2, without a slope
restriction or denominator bound.

MarkovInteriorD052 gives the exact equivalence Conjecture63 ↔ Interior63D052.
The remaining horizontal and vertical clauses are unchanged from the
inherited reduction. The diagonal clause now starts at total degree a+3,
with all original polygon guards and inherited upper-region restrictions.
This predicate is still infinite and unproved. A theorem about this one
diagonal does not establish either the pinned root or its negation.

No new numerical scan is used as proof evidence. Symbolic generator records
are in transitions.json and small-run-certificates.json. All rejected build
attempts, timeouts, sources and successful receipts are preserved separately.
Only ordinary pinned dependencies are used; separate kernel replay and axiom
closure results are in validation.json. Inherited compiled imports are reused,
so this is not a fresh whole-source rebuild or independent completion audit.
