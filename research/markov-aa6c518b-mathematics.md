# Raw vertical bottom strip

Machine-authored live request aa6c518b255a4137a1bdbca51a6e9434.
The exact pinned Conjecture63 remains unresolved. No historical novelty claim.

The main new checked statement is `source_bottom_allMAA6` in
`research/MarkovBottomLCMAA6.lean`:

    for every path and natural i,
    coeff P i 0 * coeff P i 2 <= (coeff P i 1)^2,
    where P=(frame path).mid.p.

There is no denominator bound, polygon restriction, or deletion of zero
positions in this theorem. `root_iff_interiorMAA6` in
`research/MarkovResidualMAA6.lean` proves the exact pinned-root equivalence
with a smaller, still unproved residual. Relative to InteriorCore63MF8, its
only additional restriction is `1 <= j` in the vertical clause. Horizontal
rows, other vertical starting rows, and deeper diagonals remain obligations.

## Exact source statistic

For an A-core-B word, write the nonempty core as e::w, with length n and
B-count m. The inherited second-row formula uses

    s = bit(e) + bit(last(e::w)) + 2 * adjacent_BB(e::w).

An arbitrary word can have an excessively large s and fail a vertical
inequality, even though its second horizontal row is log-concave.
For an actual source, the central word is palindromic. Thus the two endpoint
bits agree, and s is twice the adjacent-BB count of the entire A-core-B word.
The inherited exact mechanical-source adjacency theorem gives

    s = 2 max(2a-b, 0).

`central_statMAA6` proves this equality in natural arithmetic, using the
actual source word and its palindrome theorem. `source_second_exactMAA6`
then specializes the inherited all-word second-row identity with n=b-2,
m=a-1 and this exact s. The statistic is not an added assumption.

## The vertex case

For b>=5 the literal raw coefficients at the first three positions above
the lower u vertex are

    A[a,0] = 1,
    A[a,1] = 3a-1,
    2 A[a,2] = 8 max(2a-b,0)(b-5) + 9a^2-5a+2.

The resulting twice-gap is

    9a^2-7a-8 max(2a-b,0)(b-5).

It is positive for 1<=a<b and b>=5. When 2a<=b the last term vanishes.
In the other case a>=3 and the identity obtained from
`(2b-2a-5)^2 >= 0` gives the required positive lower bound. The code uses
ordinary ordered-ring arithmetic. `source_vertex_verticalMAA6` includes
the smaller denominators through the inherited all-source first-four-column
theorem.

## All positions on the bottom strip

Put i=a+k, N=b-1=k+l, with k>=1 and l>=2. The latter bound means the top
member of the vertical triple has not passed the total-degree boundary.
Let C=choose(N,k), and let c_r=A[a+k,r]. Define

    T = (l-1)(3a-1) + k(a+N),
    D = 9(a-1)^2 + 13(a-1) + 6,
    E = 6(a-1)^2 + 6(a-1)(N-1) + 8(a-1) + 6(N-1) + 6,
    F = (a+N)(a+N-1),
    J = 4s(l-2)(l-3)(l-4)
        +(k+1)[D(l-2)(l-3)+Ek(l-2)+Fk(k-1)].

The new exact coefficient adapters prove

    c_0 = C,
    N(N-1)c_1 = C l T,
    2N(N-1)(N-2)(N-3)(k+1)c_2 = C l(l-1) J.

The first adapter uses the inherited first-row formula. The second uses the
exact source statistic above, the inherited cubic falling-factorial identity,
and a new binomial index-shift identity. All factorial clearing is common
scalar algebra; the conclusion remains the raw integer coefficient inequality.

The scalar gap is

    G = 2(k+1)(N-2)(N-3)l T^2 - N(N-1)(l-1) J.

Five nonnegative polynomial certificates cover its source parameter domain.
For s=0, use a=A+1 and either (k,l)=(K+2,2) or (K+1,L+3).
For l=3,4 the s term vanishes independently of s. For l>=5 and
r=2a-b>=0, use (k,l)=(K+1,L+5), a=(K+L+7+r)/2 and s=2r.
The final chart proves 4G>=0, clearing the rational substitution. Every chart
has nonnegative coefficients in nonnegative parameters. The expansions are
generated exactly in Python and independently checked with Lean `ring` and
`positivity`; their correctness is not assumed from Python output.

The coefficient equations imply the exact identity

    2(k+1)(N-2)(N-3)[N(N-1)]^2 (c_1^2-C c_2) = C^2 l G.

The left scalar is strictly positive for N>=4. This proves the raw inequality
without dividing by an individual coefficient. Positions i<a have c_0=0;
positions beyond the total-degree boundary have c_2=0. The vertex k=0 is
handled separately. For b<=4, either i<=3, the top coefficient vanishes, or
the triple is on the already proved top layer. Thus `source_bottom_allMAA6`
has genuinely universal path and natural-index scope.

## Reproducible experiments and rejected enlargements

`experiment_bottom_aa6c518b.py` computes the original subtractive source
recurrence, independently compares its polynomials to the positive word
recurrence, and tests the new formulas. For all 383 reduced interior fractions
with b<=35 it passed 383 whole-polynomial comparisons, 378 vertex formulas,
24,942 scaled coefficient identities and 14,778 bottom-strip inequalities.
It retained 6,458 triples containing zeros. These are finite checks, not proofs.

The preliminary horizontal scan tested 1,223 A-starting enlarged words.
All 341,255 ordinary adjacent comparisons passed, while 622 support-normalized
and 107 degree-normalized ultra-log-concavity comparisons failed. Hence those
stronger normalizations are not suitable unrestricted invariants. They are not
the pinned raw predicate and these failures are not source refutations.

The adjacent-run block enlargement tested 745 reduced-count words. It passed
846,839 horizontal and 846,839 vertical comparisons, but found six diagonal
failures in 861,467 comparisons. Its first failure is the inherited non-source
prefix with raw triple [10,14,20]. This does not establish the coordinate
enlargement universally, nor does it refute the source target.

All numerical and generated-data files are under `evidence/markov-aa6c518b/`.
Accepted mathematical evidence is exactly the source-bound inventory in
`validation.json`, including replay and axiom-audit receipts. The old clustered
obstruction draft was preserved unchanged and remains outside that inventory.
