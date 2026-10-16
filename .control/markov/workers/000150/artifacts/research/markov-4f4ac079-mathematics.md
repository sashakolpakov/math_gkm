# Results and unresolved mathematics

Machine-authored request 4f4ac079ee56466da7d21ce9055918ab.
Full pinned Conjecture63 remains unresolved. No historical novelty claim.

The main representation result is the common kernel

    K_i(j,m)=C(j+i,i)C(m,i-2)
      +2 sum_(k<min(j,m)) C(j-k-1+i,i)C(m-k-1,i-2).

Every subtraction inside this finite sum is justified by its range. For every
actual source 2/(2q+1), every i>=3 and j<=2q,

    A_q(i,j)=K_i(j,2q-j).

For i>=3,j>2q the original raw coefficient is zero. These are universal
Lean theorems, not an interpolation or a bounded-denominator assertion.
They use no normalization. The proof derives and sums exact first-difference
identities for the inherited lower and upper binomial formulas, then reverses
finite sums. See MarkovLowerDifferenceM4F4, MarkovUpperDifferenceM4F4 and
MarkovTwoKernelM4F4. The prefix formulas themselves also cover i=2; the unified
source adapter explicitly uses i>=3 at the upper N=0 edge.

The kernel is nonnegative. It is positive exactly when m>=i-2: both
directions are proved as zero/positive theorems, with the first summand
already strictly positive in the latter case.

KernelShapeM4F4 asks for row LC, column LC, and nonnegative adjacent 2x2
minors. MarkovKernelShapeM4F4 proves these imply kernel anti-diagonal LC
by a multiplication-and-cancellation argument that separately handles zero
support. Under the actual-source adapter this is source VERTICAL LC.
The same module proves a conditional exact-root implication retaining
OtherVerticalCoreM0D3. The KernelShape premise remains unproved. The
mathematical convolution/Toeplitz route toward it is detailed in
markov-4f4ac079-prefix-derivation.md; its remaining formal bridges are explicit.

A second result makes the inherited Newton approach finite for each column.
MarkovNewtonFiniteM4F4 proves a general cutoff theorem: an integer-valued
two-variable function represented separately by rational polynomials of
degrees at most m,n has zero mixed forward difference at (0,0) whenever
r>m or s>n. It proves commutation of the two difference operators, compatible
natural/rational/integer casts, and the exact finite sign equivalence.

MarkovRegionDegreeM4F4 proves separate degrees at most 2i,i for both exact
raw-coefficient polynomials. MarkovGapDegreeM4F4 transports these bounds to
the original integer gap definitions with their original shifts. Therefore
NewtonVerticalM295(i) is equivalent, for i>=1, to checking only

    0<=r<=4i, 0<=s<=2i  (lower and upper gaps),
    0<=r<=4i, s=0       (each crossing gap).

FiniteNewtonVerticalM4F4 is still a condition, not an asserted sign theorem.
The universal quantifier over i remains unbounded in root_of_finite_newtonM4F4.
The previously checked i=8 case need not be reproved in that implication.
No finite table, continuous-offset positivity assumption, or omitted direction
is used to infer root resolution.

Experiments are separately recorded: 40,480 actual raw coefficient identities
and 40,480 vertical triples (14,454 containing zero), 16 direct path-recurrence
comparisons, 13,225 lower/upper kernel identities, 70,656 kernel shape tests,
23,552 kernel anti-diagonal triples, 5,520 continuation comparisons and 276
positive-correction comparisons. Bounds and exact scripts accompany their
JSON outputs. These are finite computational observations only.

All prior residual clauses remain in MarkovResidualM295. The unproved kernel
shape condition concerns numerator-two vertical LC. The source diagonal and
all remaining other-numerator obligations must still be solved, followed by
every independent source/English completion bridge.
