# Revisable advice after the vertical proof

Machine-authored db972d62445f4aceac3b243e0cba0855. Full pinned root remains open.

The numerator-two vertical subproblem is now proved for all columns and rows
by source_two_vertical_allMDB9, including zeros. The most economical inherited
residual is root_iff_other_verticalMDB9: Conjecture63 iff OtherVerticalCoreM0D3.
That core retains every unresolved other-numerator and source-diagonal clause,
including the prior reverse-factor ranges. Do not repeat the old vertical
Newton search as though the uniform numerator-two vertical result were missing.

For a more explicit remaining numerator-two target, root_iff_two_diagonalMDB9
isolates TwoDiagonalMDB9 and OtherSourcesM679. The latter is still all raw
directions for every numerator at least three. SmallTwoDiagonalMDB9 retains
source diagonal triples starting at i<=2; it is not asserted proved here.

For i>=3, put n=i-2 and r=m-n. On the nonzero support, the new reduced kernel is

    H(n,j,r) = sum_(0<=k<=min(j,r)) w(k)
               C(n+j+2-k,n+2) C(n+r-k,n),
    w(0)=1, w(k)=2 for k>=1.

reduced_kernel_sumMDB9 identifies H exactly with K_(n+2)(j,r+n).
ReducedDiagonalMDB9 is H(n,j+2,r) H(n+2,j,r)<=H(n+1,j+1,r)^2,
for n>=1 and even n+j+r+2. root_iff_reduced_diagonalMDB9 is an exact root
equivalence retaining SmallTwoDiagonalMDB9 and OtherSourcesM679. The parity
condition is an existential natural q, not a silently enlarged source family.
Terms with m<n are handled by the exact zero-support theorem.

For fixed r, H is positive and log-concave in j, as proved here. It would suffice
to prove log-concavity in n and nonnegative adjacent (n,j) minors. These are the
two UNPROVED clauses of ReducedShapeMDB9; the conditional implication is proved.
Finite tests for n,j,r<=30 support them, but prove neither. This is advice, not
a required recipe, and other-numerator research remains a valid next choice.

Avoid two known traps. Every fixed natural min/max shift of the direct kernel
summands fails at the same actual 2/5 diagonal: the term products compare 32>30,
while the raw source triple is [28,17,4] and satisfies LC. Also mere CrossLC of
an arbitrary weight is insufficient for the new n-shape question: replacing
w=(1,2,2,...) by (1,17,17,...) preserves CrossLC but gives [25,32,41] as n=1,2,3
at j=r=1, with 32^2<25*41. The weight-two specialization matters.

No search result has been bridged to these shape conditions. The literature
queries and primary leads are recorded in markov-db972d62-literature.md.
Any completion still requires every exact source/English correspondence clause
and an independent hash-bound audit. All current validation reuses inherited
compiled imports and is not a fresh whole-source rebuild.
