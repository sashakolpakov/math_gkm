# Independent audit of the Markov core, log-concavity, and boundary modules

Markov.lean, MarkovLogConcavity.lean, MarkovBoundary.lean, MarkovExamples.lean,
and MarkovIndices.lean were copied and compiled independently against the pinned
dependencies. The four unchanged modules retain their previously verified builds;
the new Indices module was independently compiled here. All 48 named theorems
have only propext, Classical.choice, and
Quot.sound in their axiom closures. Exact snapshots, hashes, compilation output,
and axiom output are recorded in report.json. No active source was edited and
no mathematical proof hint was supplied to the proposer.

## Family and target definitions

BiPoly is a polynomial in u with integer-polynomial coefficients in v.
The coefficient function therefore returns the ordinary integer coefficient
of u^i v^j. The seeds and both recurrence orientations match the source
numerator recurrence specialized at w=1. The previous independent scan audit
separately verified the exact original Laurent mutation on its finite family.

InPolygon is the stated polygon in natural indices, with nonnegativity supplied
by their type. WeakLC covers every consecutive horizontal, vertical, and
constant-i+j triple without subtracting natural indices or omitting zeros.
Conjecture63 is explicitly a proposition definition, not a theorem. It contains
both endpoints and all finite generated middle labels. The 0/1 polygon reduces
to its singleton and the 1/1 polygon has only two lattice points, as intended.
General path/fraction completeness and recurrence/source identification are
not silently proved by these definitions.

## Strong sequence invariant and smoothing

CrossLC demands all cross inequalities f(i)f(j+1)<=f(i+1)f(j) for i<=j.
It is stronger than merely adjacent log-concavity for an arbitrary sequence.
The file does not assume that arbitrary adjacent inequalities imply CrossLC.
Instead it proves CrossLC for the nonnegative three-term seed under AC<=B^2.

The shift and forward-sum proofs preserve CrossLC. For distinct integer
indices, the proof uses the four appropriate cross inequalities, including
i+1<=j; the equal-index case is equality. There is no unjustified division by
coefficients and no suppressed positivity assumption. The resulting Smooth
operator f(k)+f(k-1), and any finite Pascal iteration, preserve CrossLC.
The adjacent conclusion then follows by the explicit specialization i=k-1,
j=k. Zero coefficients remain present throughout.

## Exact ordinary-polynomial coefficient bridge

CoeffSeq first tests whether its integer index is negative and returns zero
there. Only nonnegative indices are converted to natural indices. Ordinary
polynomial coefficients also vanish past the degree. This is the correct
zero extension, not an accidental truncation of negative indices to zero.

coeffSeq_smooth, coeffSeq_quadratic, and coeffSeq_binomial_mul identify the
abstract sequence with the actual coefficients of (1+X)^n times the stated
quadratic. Consequently quadratic_binomial_logConcave proves an ordinary raw
coefficient inequality, not a factorial-normalized substitute. Its assumptions
are A,B,C>=0 and AC<=B^2; no real-rootedness assertion is made or needed.

## Universal third-diagonal expression theorem

ThirdA=(a-1)(a-2)/2, ThirdB=ab-4a+2, and ThirdC=(b-1)(b-2)/2
are exactly the coefficients in the published factored third-diagonal
expression. third_gap_certificate is a checked exact polynomial identity.
third_parameters derives nonnegativity and the quadratic coefficient
inequality for real a>=3 and b>=a+1 by that identity and nonnegative terms.

third_diagonal_expression_logConcave therefore proves, for every pair of
natural numbers 3<=a<b and every integer k, the adjacent coefficient inequality
for

    (1+X)^(a+b-5) * (ThirdA a + ThirdB a b*X + ThirdC b*X^2).

The exponent is in its ordinary-polynomial range under these hypotheses;
natural subtraction causes no negative-exponent truncation. No gcd or ratio
restriction is necessary for this explicit-polynomial theorem. It does not
cover the a=1 and a=2 families. It proves at least weak log-concavity and does
not assert real-rootedness or a full two-dimensional inequality.

## Scope conclusion

No mathematical error or statement mismatch was found. The two important
bridges must remain distinct: the polynomial-to-Pascal coefficient bridge is
proved here; the recurrence-generated Markov numerator-to-third-diagonal
expression bridge remains a separate formal obligation. The theorem's own
comment states that restriction correctly. Full Conjecture 6.3 remains open.

The boundary result, added third-diagonal transfer, and completed examples
are covered below.


## Added third-diagonal expression and transfer

SourceThird gives the source's literal three-term polynomial expression, with
parameter n=a+b-5. sourceThird_factor proves that it equals the quadratic-times-
binomial form previously audited. DiagonalSeq extends the actual raw diagonal
coefficient list by zero outside 0<=k<=d; it tests those bounds before natural
subtraction, so negative indices do not collapse onto coefficient zero.

ThirdDiagonalFormula is a proposition definition asserting equality of the
actual diagonal sequence and the source expression. It is not an axiom or an
established universal identity. third_diagonal_of_formula derives the raw
inequality from this explicit hypothesis for 3<=a<b. The new code therefore
exposes the remaining identification obligation instead of silently treating
it as discharged. All exponents are in their ordinary-polynomial range under
the transfer theorem's hypotheses.

## Fully connected j=0 boundary result

edgeEval sets the inner polynomial variable v to zero and casts integer
coefficients to real coefficients. The new theorem edgeEval_coeff explicitly
proves that its ith coefficient is the real cast of coeff P i 0. Thus no
coefficient specialization, orientation, or normalization bridge is missing.

EdgeFormula records both denominator-label positivity and the equality
edgeEval P = X^a (X+1)^(b-1). Its initial cases are proved. Its recurrence step
uses positive b to kill the V^b subtraction term at v=0 and correctly combines
the remaining exponents. Induction covers every finite left/right path of the
actual defined recurrence. No finite denominator bound is used and no boundary
coefficient identity is taken as an external assumption.

The coefficient sequence of X^a(1+X)^n is proved CrossLC using the audited
smoothing and shift lemmas. boundary_logConcave applies this to the generated
boundary, and boundary_raw_logConcave transports it to the literal integer
raw coefficients used by WeakLC:

    A(i,0) A(i+2,0) <= A(i+1,0)^2

for every natural i and every finite path. This is stronger than restricting
to polygon triples along that boundary. Positivity of label denominators makes
the natural exponent b-1 legitimate. No truncated-index artifact is used.

This is an unconditional universal theorem for the generated j=0 boundary.
It re-establishes a known boundary result in the source; it is not a solution
of all interior lines or all directions of Conjecture 6.3. No mathematical
error or misleading scope claim was found in the accepted modules.


## Completed examples and missing-condition distinctions

The left child is explicitly expanded as the 1/3 numerator. Its raw vertical
coefficients at (1,0),(1,1),(1,2) are proved equal to 1,2,3. The corresponding
raw inequality is strictly satisfied, and division by the correct multinomial
factors 3,6,3 gives a strictly reversed inequality. Thus the normalized failure
belongs to the actual generated family and does not refute its raw target.

Both three-term sequences [1,2,1] and [0,2,0] satisfy CrossLC, while their
nonnegative difference [1,0,1] fails. This correctly disproves unrestricted
subtraction preservation. It does not disprove the specific Markov recurrence.

The parameter pair (3,4) gives the seed 1+2X+3X^2. Both the negative
quadratic discriminant and its coefficient inequality are proved; the separate
strict-positivity theorem at every real x confirms there is no real root.
This rules out a real-rootedness requirement for the present coefficient result,
without ruling out coefficient log-concavity.

The two endpoint WeakLC assertions are vacuous because no three-point line fits
inside their polygons. At the initial 1/2 label the only relevant three-point
line has coefficients [1,2,1]; the code correctly proves that case while the
other directions are vacuous. No support positions are silently removed.

All accepted example statements match these interpretations. The final six
index theorems are additionally audited below.


## Final index invariant and reduced-label theorem

FrameIndices records that the middle is the mediant of the two endpoints,
the oriented determinant is one, the endpoint denominators are positive,
the upper endpoint has positive numerator, and the endpoints lie within the
stated bounds of [0,1]. These are true initially and are proved preserved by
both actual recurrence branches; fold induction covers every finite path.

coprime_of_det correctly derives coprimality from c*b=a*d+1: the gcd of a,b
divides both products, hence divides 1. frame_reduced applies this to the
middle and upper labels. Its exact conclusion is 0<a<b and gcd(a,b)=1 for
every generated middle label. This is a soundness-of-labeling theorem. It
asserts neither injectivity of path labeling nor surjectivity onto all reduced
fractions. The new documentation explicitly retains general coverage as a
formal obligation. No circular assumption about coverage or log-concavity
enters the invariant proof.

Final mathematical source hashes all agree with the independently checked
snapshots. Documentation equivalence is reviewed in DOCUMENTATION_REVIEW.md.
No error or misleading mathematical scope claim was found in the final
accepted five-module, 48-theorem construction.
