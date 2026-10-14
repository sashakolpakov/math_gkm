# Second horizontal row

Machine-authored research, 2026-10-14; request 8934af1772f94a59862d7005ebd43159.
Full Conjecture 6.3 remains open. This is not an independent completion audit.

For an arbitrary word A w B, let n=length(w), m=count_B(w). When w is
nonempty, let f and r indicate that its first and last letters are B, and
let k count adjacent BB pairs inside w. Put s=f+r+2k. The exact formula for
n>=3 is

    2 [v²]P = u^m (1+u)^(n-3) Q(u),
    Q(u) = 4s + (9m²+13m+6)u
         + (6m²+6mn+8m+6n+6)u²
         + (m+n+2)(m+n+1)u³.

There is also a denominator-cleared identity valid for every nonempty core:
multiply the second coefficient by 2(1+u)^3 and the cubic by u^m(1+u)^n.
The formula is proved by a second-order coefficient invariant of the literal
positive matrix recurrence, over arbitrary commutative rings. In particular,
the order-dependent constant is not replaced by a conjectured count formula.
An induction proves 0<=s<=2m.

For actual source words, a=m+1 and b=n+2. If n>2m, the exponent (m,2)
lies below the source polygon. The inherited support theorem therefore makes
its raw coefficient zero. Extracting coefficient m from the displayed formula
forces s=0. This uses an actual source theorem, not an assumed balanced-word
identification. If n<=2m, the elementary bound s<=2m suffices instead.

Write the cubic coefficients as A,B,C,D. The polynomial certificates establish
A,C,B,D>=0, AC<=B², BD<=C² and AD<=BC for m<=n and
(n<=2m or s=0). They yield the zero-extended CrossLC property of Q. The already
checked binomial smoothing and shift adapters yield CrossLC of the literal
source row. Seven core words of length at most two are evaluated separately;
their rows are shifted nonnegative quadratics with checked coefficient gaps.
The final target theorem is horizontal_two_raw8934, in
research/MarkovSecondHorizontal8934.lean. Consult the validation manifest for
actual accepted build/replay status, rather than treating this prose as a receipt.

This argument does not establish the stronger arbitrary-word horizontal
conjecture. The cubic before binomial smoothing can fail LC for long words
with B at a core endpoint, so merely applying residual LC to every word would
be unjustified. General higher horizontal rows remain open here.

## Experiments and searches

matrix-invariants.json records 1,023 products beginning with A through length
10. All four entries passed the horizontal adjacent checks. Three simple
same-row synchronization predicates failed, so that induction route was not
used. This is finite evidence only, not a proof of horizontal LC.

polygon-words-14.json records 8,191 A--core--B words through length 14. Of
these, 253 have their entire coefficient support in the polygon specified by
their counts; 63 of those have coprime counts. No directional LC failure was
found among the 253. No family-identification or universal theorem follows
from this scan. Earlier arbitrary-word failures do not automatically survive
this stronger support requirement.

Hosted searches on 2026-10-14 retrieved these primary sources:

* [Evans–Veselov–Winn, published target](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html):
  exact target and known special-line results; no general proof retrieved.
* [Evans, Saturation of Markov Polynomials](https://arxiv.org/abs/2604.18333):
  the abstract reports a constructive saturation proof using snake graphs.
  Saturation is distinct from the raw log-concavity inequalities.
* [Kang–Lee–Lim, Unimodality and Cluster Algebras from Surfaces](https://arxiv.org/abs/2508.04396):
  the abstract reports unimodality and states a log-concavity conjecture for a
  different specialization. No theorem from this paper was imported into Lean.

The search supplied no universal proof of this pinned root. No historical
novelty claim is made for the second-row identity or inequality.

second-formula-check.json verifies the exact second-row formula on 2,040
words of lengths 5 through 12. It also records the non-source word A B A^16 B
with coprime counts 2/19: its residual is [0,2,14,112,190], so 196<224.
The actual source word is different; this is not a root refutation.
