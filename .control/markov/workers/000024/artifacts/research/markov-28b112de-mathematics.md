# Source symmetry and polygon rigidity

Machine-authored research for request 28b112de527c4d3ea1fa665cec2dc394.
Full pinned Conjecture63 remains unresolved. Acceptance status for each Lean
module is recorded in evidence/markov-28b112de/validation.json; a draft or
rejected elaboration is not a theorem.

## Palindrome and positive squares

Let W be the exact A/B source word. The two word substitutions are
L(A)=A,L(B)=AB and R(A)=AB,R(B)=B. Naturality with the actual Farey pair
recursion proves W=A c B where c is the recursively defined central word.
If c is a palindrome, L(c)A and B R(c) are palindromes; induction proves this
for every finite source path. Expanding B to AC gives the exact gas core
L(c)A, again a palindrome. This is an exact source-word assertion, stronger
than merely exhibiting an unspecified word with the right counts.

For a gas word w with matrix M, define

    Q_w(x,y)=v*x²*M.a+u*v*x*y*M.b+x*y*M.c+u*y²*M.d.

Sandwiching w by the same letter transforms its boundary pair by

    h=v*x+u*y,
    (x,y) -> (h+t*x,h) for C, or (h,h+t*y) for A.

The empty core has Q=v*x²+u*y². A singleton has
Q=(v*x+u*y)²+t*v*x² for C, or Q=(v*x+u*y)²+t*u*y² for A.
These are polynomial identities over arbitrary commutative rings.
At t=1, palindrome induction and nonnegativity of all boundary updates prove
that every actual source raw numerator has one of these three forms:

    v*f²+u*g²,  f²+u*g²,  f²+v*g²,

where f,g are bivariate integer polynomials with nonnegative coefficients.
MarkovSquares28b1.source_positive_squares28 states exactly this existential
result. No log-concavity closure under addition or squaring is invoked.

The exact Python check agrees with all 627 source polynomials through b=45.
It also finds that the canonical half polynomial f can fail raw vertical LC:
at source 3/44 it has [12,14,18], so 196<216. This is an experimental
obstruction to requiring LC of every half factor; it is not a counterexample
to the source numerator, and this obstruction has not been formalized in Lean.

## Lower support determines the canonical word

For arbitrary positive raw matrix words the following monomials have strictly
positive coefficients. Write B-count as c and word length as l:

* In x r y: u^(c(y)) v^(l(x)+indicator(r=B)).
* In A x r y B: u^(c(x)+1) v^(l(y)+2).

The first path stays in the upper matrix state, exits at r, then stays in
the lower state. The second exits at the initial A, returns at r, and exits
again at the final B. MarkovWordWitness28b1 proves positivity directly from
the exact raw generators and coefficient convolution, not by tropical tests.

Let w=A x r y B have a B letters and length b, with 0<a<b and gcd(a,b)=1.
Suppose every positive coefficient satisfies a*b<=b*i+a*j. Put k=c(x),
l=l(x)+1. The suffix witness yields b*k<=a*l; the prefix-loop witness yields
a*l<=b*(k+1). Equality in the latter would force b|l by coprimality, impossible
for 0<l<b. Therefore k=floor(a*l/b). All proper prefix counts are forced.
The full core count is a-1, which also determines its final letter.

MarkovPolygonWord28b1 formalizes the floor constraint. MarkovWordRigidity28b1
uses equality of all prefix counts to prove uniqueness of a supported core.
Combining this with the inherited exact rational-coverage theorem identifies
every such reduced A--core--B word with an actual source path and its literal
raw numerator. Consult validation for completed versus draft status.

MarkovSupportedGoal28b1 states an exact equivalence between the pinned root
and raw GlobalLC for every reduced A--core--B word satisfying the lower
polygon support constraint. The forward direction uses the new source-word
characterization. The reverse uses each source's actual canonical word and
the inherited endpoint and outside-polygon-zero bridges. All three directions,
all natural coefficient indices and zeros remain present. Neither side of this
equivalence is proved; no extra support-to-LC assertion is silently introduced.

The tropical scan through b=23 tests 3,056,949 reduced A--core--B words and
finds exactly 171 supported words, one per reduced interior label, always the
lower mechanical word. This is finite evidence; the Lean argument instead
uses the two universal monomial witnesses. The scan's costs are minimum
b*i+a*j in the positive matrices, not new polynomial normalizations.

## Consequences and limits

These results provide global structural descriptions of the exact source
family. They do not establish any new universal interior log-concavity
inequality, and in particular do not prove that positive squares or polygon
containment imply LC for arbitrary polynomials. The supported-word theorem
restricts to the precise two raw generators, endpoints A/B and coprime counts.
Removing those hypotheses is not justified.

The previous worker's sixth-diagonal proof was already complete. Its attempted
second-horizontal-row argument duplicated MarkovSecondHorizontal8934, which
had already proved that result. The present run preserves both histories and
abandons the duplicate instead of claiming it as new progress.
