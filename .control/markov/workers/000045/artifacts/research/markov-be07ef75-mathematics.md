# Global aggregation and a sharper Pell candidate

Machine-authored research for be07ef751cf4477697c81b1e02c1e531.
No novelty claim. Full pinned Conjecture63 remains unresolved. Formal status
is controlled by evidence/markov-be07ef75/validation.json, not this narrative.

## No fixed local charge radius suffices abstractly

For any natural h set t=h+2, and for 0<=q<=h+1 put

    L_q=t^(2(h+1-q)), M_q=t^(2h+1), R_q=t^(2q).

All entries are positive; each of the three rows is geometric (the middle
row is constant). Whenever r<=q+h,

    L_q R_r <= M_q M_r.

Consequently, on EVERY subset I of diameter at most h, the sum inequality
(sum_I L)(sum_I R)<=(sum_I M)^2 holds. In particular every pair of charges
within distance h satisfies both orientations. This is stronger than merely
requiring coefficientwise LC on each consecutive window of h+1 charges:
the latter follows by summing the pointwise comparisons at each total charge.
The formal module proves the pointwise and finite-subset sum statements.

Nevertheless, on the full range 0,...,h+1,

    sum M = t^(2h+2),
    sum L = sum R = sum_(q=0)^(h+1) t^(2q) > t^(2h+2).

Thus the full sum strictly reverses LC, uniformly for every finite radius h.
MarkovLocalRadiusBe07 proves these claims, including the geometric row
identities. They concern artificial auxiliary arrays, NOT source Markov
coefficients. They show why increasing a fixed local comparison radius alone
cannot justify arbitrary aggregation. Extra structure of the exact binomial
array remains essential; this result does not rule out an induction that uses it.

## A stronger global candidate using the ambient degree

Keep the inherited literal Pell summand, for s>=1,

    H(a,j,s,q)=choose(a-q,s) choose(s+q-1,q) choose(2s,j-q),
    F_s(t)=sum_q H(a,j,s,q)t^q.

Out-of-range binomials and q>j contribute zero. This is the inherited raw
source coefficient decomposition, with a the numerator of a/(a+1). The
formal horizontalTerm9a72 uses final argument s-1.

The new candidate, still UNPROVED, is coefficientwise

    (s+2)(a-s) F_s F_(s+2)
      <= (s+1)(a-s-1) F_(s+1)^2,       s+2<=a.

Equivalently, it asks for coefficientwise log-concavity of
F_s/choose(a,s). This is a proposed sufficient inequality, NOT a replacement
normalization of the pinned goal. Its integer-scaled form is used throughout.
The left scalar exceeds the right scalar by a+1; both are positive in range.
Nonnegativity of the product coefficients therefore gives the ordinary raw
fiber inequality. MarkovUltraTransferBe07 proves that implication and then
the literal source horizontal inequality for every actual path with b=a+1,
under the explicit aggregate premise UltraHorizontalFiberGoalBe07. That
predicate is a Prop definition, not an axiom or an established theorem.

There is an unconditional strengthened summand result. For every a,j,q,s
in range, including vanishing endpoint cases, the same inequality holds with
F replaced by the individual H at fixed q. The first factor follows from

    (k+2)(a-k) choose(n,k) choose(n,k+2)
      <= (k+1)(a-k-1) choose(n,k+1)^2,  n<=a, k+2<=a.

For n=a this is equality. For n<a, lower-index binomial recurrences give
the exact nonnegative remainder after multiplication by n-k:

    (n-k) [ (k+1)(a-k-1) choose(n,k+1)^2
            -(k+2)(a-k) choose(n,k)choose(n,k+2) ]
      = (k+1)(a-n) choose(n,k+1)^2.

The proof separates zero endpoint cases before cancellation. Multiplying
with the inherited upper-index LC bounds for the other two H factors proves
horizontal_term_ultraBe07. Neither this proof nor the generic local-radius
result supplies closure under the full charge sum.

## Source scaling distinction

At the actual source 12/13, path replicate(11,true), the raw coefficients at
(0,14),(1,14),(2,14) are [11,510,10680]. All three points are in the pinned
polygon. The literal source identity and memberships are proved in
MarkovUltraScopeBe07. Its checked comparisons include

    11*10680 < 510^2,
    40*(11*10680) <= 27*510^2,
    9*510^2 < 20*(11*10680).

The second is the proposed ambient-a=12 inequality. The third shows that
using the stronger binomial scaling from the horizontal polygon range
0<=i<=10 fails: the first three rescaled entries would be 11,510/10,10680/45.
Its reversed cleared gap is 8700. The raw inequality is strictly valid;
this is a normalization obstruction, not a source counterexample to 6.3.

## Exact observations and limitations

- interval-probe.json: 11,808,302 interval sum comparisons through a=35,
  no failures. Appending a singleton via a mixed inequality fails already
  at (a,j,s,lo,hi)=(3,2,1,0,2), gap -15. A different local mixed-midpoint
  condition also fails. These experiments are not universal proofs.
- global-probe-corrected.json: 106,082 nontrivial full-sum triples through
  a=60; no failure of the ambient-binomial bound. The support-binomial
  bound fails at the source witness above.
- ultra-refined.json: 483,836 nonzero convolution coefficients on 41,993
  parameter triples, with no ambient-binomial failure.
- ultra-random.json: seed 70745, 5,000 attempted samples, 2,938 admissible
  tested fibers, 2,766 nonzero; a<1200, s<120. No failure. Parameters retained.

The first global probe had an off-by-one in the proposed scalar involving
s: the middle index is s+1. Its output remains preserved and is superseded
by the explicitly corrected script/result. An import accidentally reran that
first probe; mathematical outputs were unchanged and only its timing was
replaced. The import was removed. This is an operational correction, not
mathematical evidence. Rejected elaborations remain in immutable snapshots.

The published target was retrieved live from
[Evans--Veselov--Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Hosted searches for Markov/Pell and binomial-sum LC supplied no theorem used
as a proof premise. No external assertion was introduced as an axiom.
Local validation reused inherited compiled imports; it is not a fresh
whole-source rebuild or an independent source/English audit.
