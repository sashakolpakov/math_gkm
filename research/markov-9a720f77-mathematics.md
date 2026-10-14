# Exact Pell sums and a directional pair-fiber conjecture

Machine-authored request 9a720f77696445aab32325da611c5097.
The full pinned Conjecture63 remains unresolved. This report makes no
historical novelty claim. Final formal status is in
evidence/markov-9a720f77/validation.json.

Write a=n+1 for the numerator of the source (n+1)/(n+2), and d=2a.
For every natural i,j with a<=i+j<=2a put r=2a-i-j. The new theorem proves

    A(i,j) = sum over 0<=k<=i and k<=r of
        choose(2a-2r,i-k) choose(a-r+k,k) choose(a-k-1,r-k).

Natural subtraction is used in Lean. Outside the degree strip the expression
is zero. The proof uses literal quotient coefficients and ordinary polynomial
multiplication, and proves the outside-strip zero cases separately. It retains
every raw coefficient and has no denominator cutoff. Together with the prior
diagonal theorem, WeakLC for the entire Pell family is equivalent to the two
horizontal/vertical inequalities for this explicit sum. Both remain unproved.

For positive excess degree i+j=a+s, s>=1, a reindexing gives

    A(i,j) = sum_q H(a,j,s,q),
    H(a,j,s,q) = choose(a-q,s) choose(s+q-1,q) choose(2s,j-q).

Terms with q>j are zero, as are the out-of-range binomial terms. The formal
horizontalTerm9a72 uses parameter s-1, avoiding negative natural upper indices.
right_horizontal_sum_fixed9a72 proves this identity with the fixed range
0<=q<=a, with all zero terms retained. horizontal_term_lc9a72 proves every
individual summand log-concave as s varies through positive integers. Its proof
uses fixed-upper binomial LC, upper-index binomial LC at stride one and stride
two, and multiplication of nonnegative LC triples. This does not prove the sum
LC; the missing closure is explicitly retained.

## New experimental candidate and its exact formal transfer

Let F_s(t)=sum_q H(a,j,s,q)t^q. The candidate is coefficientwise

    F_(s+1)(t)^2 - F_s(t) F_(s+2)(t) >= 0.

HorizontalFiberGoal9a72 states the corresponding precise bounded-parameter
claim. Evaluating at t=1 would give the raw horizontal inequality.
source_near_one_horizontal_of_fiber9a72 proves that implication for every
actual source path with b=a+1. The j=0 boundary is already proved and is handled
separately. For j>0 the polygon bounds ensure the positive-excess formulas
apply at all three positions. Thus the conditional transfer has no missing
coefficient or zero-support premise. The fiber goal itself is NOT proved.

The complete finite scan through a=50 tested both horizontal and vertical
analogues: 169,050 parameter triples and 2,266,833 nonzero endpoint fibers.
No horizontal failure occurred. The vertical analogue fails at a=10,i=10,
center excess s=1 and combined summand index 16: there are 84 endpoint pairs
but only 81 center pairs. The unrefined raw triple is 1,29,642 and satisfies
the pinned inequality. A further 1,200 deterministic horizontal trials with
a<=250 checked 50,506 nonzero fibers and found no failure. These are finite
experiments, not proofs. Inputs and outputs are saved under evidence/markov-9a720f77/.

There is a potentially useful formal-power-series expression behind H:

    sum_q choose(a-q,s) choose(s+q-1,q) x^q
      = [z^(a-s)] (1-z)^(-s-1) (1-x*z)^(-s).

This follows by the two negative-binomial expansions. It is a research
derivation, not a new Lean theorem. Combining it with (1+y)^(2s) recovers the
j-refinement. A possible next direction is proving coefficientwise LC through
this generating function or a planar path model; no such proof is asserted.

## Rejected stronger approaches

Termwise midpoint balancing and pairwise synchronization both fail for H.
The exact inequalities are checked in MarkovPellObstructions9a72. Those
failures do not rule out aggregate conservation of the combined index q+r.
The separate vertical decomposition fails even that aggregate condition.

For actual source 3/4, the vertical slice i=3 is [1,8,26,20]. The formal
normalization obstruction is 8^2<3*1*26; the raw inequalities still hold.
Exact rational Sturm experiments on 966 nonzero Pell horizontal/vertical
slices find non-real roots, including this cubic and a horizontal slice at
7/8. The Sturm implementation is experimental evidence, not a Lean theorem.

The interrupted predecessor was reconciled from its raw event log: its final
manifest and report were saved after all six successful replays. No prior
side effect was blindly repeated. Construction and Agoh were left untouched.
