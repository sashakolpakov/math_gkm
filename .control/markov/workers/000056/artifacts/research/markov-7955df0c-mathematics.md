# Horizontal comparisons through the fourth upper layer

Machine-authored live request 7955df0c4dc1407e99579ba90e1017ab.
The full pinned Conjecture63 remains unresolved. Final validation.json records
the actual compilation and separate kernel-replay status; drafts are not results.
No historical novelty claim is made.

Put d=a+b−1, N=b−1, B=a−1, D=i+j=d−3, and F=choose(D,i).
The three raw horizontal coefficients are L=A(i,j), M=A(i+1,j),
R=A(i+2,j). The existing fourth-upper-layer formula has a nonnegative
integer switch count s. Write

    C=BN+N−3B−1,
    Q=N(N−1)(i+1)i+2C(i+1)j+B(B−1)j(j−1),
    T(s)=N(N−1)(N−2)i(i−1)(i−2)
       +3[2(N−1)(N−2)+B(N−2)(N−5)]i(i−1)j
       +3[2(N−2)+3B−5B²+(N−1)B+(N−1)B²−4s]ij(j−1)
       +B(B−1)(B−2)j(j−1)(j−2).

The new coefficient bridge establishes, for every source and D≥3,

    6D(D−1)(D−2)L=F T(s),
    2D(i+1)M=F Q,
    (i+1)(i+2)R=(D+1)F [N(i+2)+Bj].

These are identities for literal integer coefficients cast to reals. They
follow from the inherited first four upper-layer polynomial identities and
new cubic falling-factorial/binomial identities, including their zero cases.
No coefficient normalization is substituted for the target.

Because s≥0 and j is a natural index, T(s)≤T(0). Since N+B=D+2 and
N≥B+1, one has 0≤2B≤D+1. The exact algebraic certificate concerns

    G=3(D−1)(D−2)(i+2)Q²
       −2D(D+1)(i+1)T(0)[N(i+2)+Bj].

After multiplication by (2(D+1))⁴, G is a polynomial with nonnegative
coefficients in i−3, j, 2B, and D+1−2B for i≥3. The three cases
i=2,1,0 instead use j−1,j−2,j−3. The four certificates contain
355,45,45,45 monomials. They are expressed in Horner form in Lean;
ring normalization checks each equality and positivity checks each sign.
Python's symbolic expansion is not itself the proof.

Multiplying M²−LR by

    12D²(D−1)(D−2)(i+1)²(i+2)

gives F² times the same G with T(s) in place of T(0), hence a nonnegative
quantity. Only the displayed strictly positive scalar factor is cancelled.
Neither F nor a raw coefficient is divided out. The small-degree polygon
cases force a=1 (the apparent a=2,b=4 exception is not reduced), and use
the inherited universal numerator-one theorem.

The compiled theorem source_next_horizontal7955 covers
every source path and every horizontal polygon triple with i+j+3=d.
Together with the previous top-face result, the horizontal part of the exact
remaining-root predicate starts at i+j+4≤d. The vertical and diagonal
clauses are left unchanged. This is still an infinite unproved predicate.

The analogous switch-zero vertical envelope fails already at D=3,B=1,
i=1,j=2, with cleared gap −13824. This is a failure of the auxiliary
envelope, not a source triple reversing the pinned inequality. All source
tests and any further envelope failures are recorded separately.

The initial ambient-transfer exploration found that the inherited reports
already contain the gap-partition representation, its exact recursion, and
counterexamples to simple component synchronization. Those results were not
replayed or credited as new. The next-top comparison was selected as a new
source-connected inequality that can be checked within this invocation.

A follow-up candidate for the vertical comparison is recorded in vertical-envelope.json. With a≥4, the three small-i cases of the switch-zero gap each have 68 nonnegative monomials after B=t+3 and N=B+1+c. The large-i vertical certificate also has nonnegative coefficients. The envelope with s=2 had no failure in the finite guarded parameter test. Connecting a lower switch-count bound for the remaining small numerators, or handling those families directly, remains unproved. These candidate certificates are advice, not new Lean vertical theorems.
