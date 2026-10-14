# A source switch bound and the next vertical strip

Machine-authored live request 7d80a785cc54418dbc60c87975360f76.
The exact pinned root remains unresolved. Final validation.json determines
which declarations compiled and which completed separate kernel replay;
drafts and symbolic experiments are not accepted mathematical results.

Write d=a+b−1, D=i+j=d−3, B=a−1, N=b−1, F=choose(D,i),
L=A(i,j), M=A(i,j+1), R=A(i,j+2). The compiled new vertical result is
L R ≤ M² for every source path with its first position in the pinned
polygon and i+j+3=d. The later two positions then also lie in the polygon.

The inherited fourth-layer expression T(s)=nextT7955(i,j,B,N,s) depends
on the actual number s of changes between consecutive letters in the
source central word. Its dependence is exactly

    T(0)−T(s) = 12 s i j(j−1).

For natural j this is nonnegative. The other two raw coefficients satisfy

    2D(j+1) M = F Q,
    (j+1)(j+2) R = (D+1) F [B(j+2)+Ni],

where Q=N(N−1)i(i−1)+2(BN+N−3B−1)i(j+1)+B(B−1)(j+1)j.
Together with 6D(D−1)(D−2)L=F T(s), these identities give

    12D²(D−1)(D−2)(j+1)²(j+2)(M²−LR) = F² G(s),
    G(s)=3(D−1)(D−2)(j+2)Q²
         −2D(D+1)(j+1)T(s)[B(j+2)+Ni].

Only the displayed strictly positive scalar is cancelled, and only when
D≥3. No coefficient or binomial coefficient is divided out. Zeros remain.

For i≥3, the same interval homogenization as in the previous horizontal
work gives a polynomial certificate with 365 nonnegative monomials, after
clearing (2(D+1))⁴ and introducing c=D+1−2B≥0. For i=0,1,2 and B≥3,
put B=t+3 and N=B+1+c; each direct gap certificate has 68 nonnegative
monomials. The generated Lean identities use ring normalization and their
sign proofs use positivity. The Python expansions alone are not proofs.

The small numerators require the actual source structure. A nonconstant
palindrome has at least two switches: a walk beginning and ending in the
same Boolean letter, and visiting its opposite, must change once to leave
and once to return. MarkovSwitchLower7d80 proves this directly from the
recursive switch count. The source central word is a palindrome, with
length b−2 and true count a−1. Thus 2≤a and a+2≤b imply s≥2.
The new source formula preserves this bound together with the exact
fourth-layer coefficient identity.

When a=2 or 3, the only problematic index for the zero-switch envelope is
i=1. At that index polygon membership forces a+2≤b. Using s=2 gives
nonnegative one-variable gap certificates. At i=0 or 2, s=0 suffices;
i≥3 uses the general certificate. For a=1 the inherited full Fibonacci
source theorem applies. The remaining low-degree possibilities with a≥2
would force the non-reduced pair (2,4), excluded by source coprimality.

MarkovInterior7d80 contains a compiled proof of an exact equivalence with the
pinned root, removing this vertical strip from the outstanding predicate.
Both horizontal and vertical remaining clauses then start at i+j+4≤d.
The diagonal residual, all polygon guards and both endpoint clauses are
retained through the inherited equivalence. The residual is still an
infinite unproved proposition.

The exact finite transfer experiment independently checks the new middle
and last coefficient identities, source switch bound and raw vertical
triples. Its bounds, counts and examples are in vertical-probe.json. It
does not establish universal coverage or any conjecture by enumeration.

Final source compilation established all nine new modules with only permitted
printed axiom closures. The separate kernel replay of MarkovNextVertical7d80
succeeded. Remaining separate replay status is recorded in validation.json;
timeouts are not upgraded to success. The stronger-scope theorem
source_other_direction_failure7d80 verifies raw [1,7,50] at the actual
source 1/9 in direction (1,−3). This lies outside the pinned directions,
as explained in markov-7d80a785-literature.md, and is not a root refutation.
