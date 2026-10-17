# Total-gap certificates and the remaining middle region

Machine-authored live request 6c0f2afda19a4b5cbd7130331ec09bc2.
The pinned Conjecture63 and its negation remain open. Final local validation
is controlled by evidence/markov-6c0f2afd/validation.json, not this narrative.

Write b=3q+epsilon, with epsilon=1 for r=true and 2 for false. In the
admissible middle strip, t=q+3+k, 2t<=b, k<=q and q>=1. The exact integer
parameterization is q=x+2k+B, B=5/4 respectively. Let R_c be the actual raw
coefficient at physical column c+3 and row j=b+2-t. The inherited identity is

    R_c = topShortSum(x,x+3k+B,c) + correctionShort(x+B-2,k,c,r).

No correction or negative mixed gap is dropped.

## Exact dense representation

MarkovDenseCertificateM6C0 proves evaluation compatibility for recursive list
addition and multiplication and for a two-variable rational expression tree.
It proves that a dense array with nonnegative entries evaluates nonnegatively
for nonnegative variables. MarkovMiddleExpressionM6C0 constructs the exact
binomial expressions and proves that evaluating the expression gives
R_(c+1)^2-R_c R_(c+2), with the displayed integer depth shift retained.
The natural-parameter bridge removes all rational casts in the conclusion.

The expression tree has only rational constants, two variables, addition and
multiplication. Descending-binomial factors are represented by their exact
recursive formula. Computation of a concrete array sign is checked with
ordinary `decide +kernel`; no native evaluator or external assertion enters
the proof. This is a finite symbolic identity proving an unbounded-parameter
inequality, not interpolation or a finite scan of denominators.

## New universal columns

MarkovMiddleDenseC6M6C0 proves middleGapMD02 r 3 x k >= 0 for every x,k,r.
MarkovMiddleCachedC7M6C0 proves the same at index 4. Its six intermediate
arrays are each equated to the exact expression by kernel reduction before
the final multiplication/sign calculation. This avoids repeated expansion.
The latter method succeeded where the direct column-seven build timed out.

MarkovMiddleRemainingM6C0 transports both results to raw source inequalities
starting at physical columns six and seven, for every admissible middle row.
Its path theorem covers every path with numerator label three. Its polygon
theorem explicitly assumes c+2<=q+3+k and proves all three memberships.
The coefficient inequality itself also retains exterior zero cases.

## Third middle row: partial, not complete

At k=2 the row is j=b-q-3. MarkovMiddleFixedDepthM6C0 uses the exact support
shift max(0,c+2-(6+B)). Below this threshold the right-hand raw neighbor
vanishes; the non-strict inequality follows from a square being nonnegative.
Above it, exact substitution reduces the remaining question to a univariate
polynomial sign, for all nonnegative denominator parameters.

MarkovMiddleThirdBatch6M6C0 checks this sign for c=6,7,8,9 and both residues.
MarkovMiddleThirdPartialM6C0 combines these with inherited small-column
results and proves every starting physical column 0<=c<=12 on this row
throughout the admissible strip (q>=8 for false and q>=9 for true). It does
not prove the complete row, nor the small-q cases outside that strip.
The strip's remaining third-row columns are explicit below.

## Exact root decomposition

The inherited high-column theorem gives nonnegative middle gaps whenever
the internal column c satisfies c>=4k+9 for true or c>=4k+7 for false.
MarkovMiddleSixResidualM6C0 proves this arithmetic reparameterization.

The final MiddleRemainingM6C0 retains exactly the still-needed middle cases:

    c>=5, k>=2,
    c<4k+(if r then 9 else 7),
    and k=2 implies c>=10,

with x arbitrary natural and both residues retained. The exact theorem is

    Conjecture63 iff
      MiddleRemainingM6C0 and ThreeOutsideMiddleMD02 and OtherFourM9E2.

All three conjuncts remain unproved. For k=2 this leaves internal columns
10..16 (true) and 10..14 (false), with unbounded x. This is a research
reduction, not a finite replacement for the root. Every other horizontal row,
vertical and constant-i+j direction, source family and endpoint remains in
the other explicit conjuncts.

## Experiments and unaccepted work

The direct source experiment passed 8,240 coefficient comparisons, retaining
214 zeros, 8,240 middle triples, and 586,233 polygon-valid triples across all
directions. A separate topMass scan passed 29,106 tests. These are experiments.

Exact support-shifted polynomial probes at c=13,16,20 and both residues found
no negative monomial coefficients. The two c=20 expansions each contain 4,560
nonzero terms. No uniform-in-c positivity theorem is proved.

Column-eight/nine direct and intermediate-array attempts timed out and remain
unaccepted. Larger generated dense-column drafts and third-row batches for
c=10..16 were not built. The third-row candidate data have nonnegative
coefficients in all 22 generated cases, but only the c=6..9 batch is selected
for local validation. Source snapshots and failed receipts are preserved.
