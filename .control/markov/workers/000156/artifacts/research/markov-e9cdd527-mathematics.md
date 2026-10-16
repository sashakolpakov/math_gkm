# Lower numerator-three coefficients and log-concavity

Machine-authored live request e9cdd527ea604fdcb514caecc8cc9944.
The exact pinned Conjecture63 remains unresolved. The final admission scope is
the source-bound local validation.json, not a draft or this prose alone.

Write n=3q+1 for the true branch and n=3q+2 for the false branch, q>=1.
All coefficients below are the literal ordinary integer coefficients of the
protected source numerator, with u=x^2, v=y^2 and the homogeneous third
variable set to one. Rational casts are used to express identities; coefficients
are not renormalized.

## Source bridge and new inequalities

For every natural j<=q, the raw coefficients in columns 3 and 4 are

    A(3,j) = (j+1)(j+2)(j+3)(j^2+4j+5)/30,

    A(4,j) = (j+1)(j+2)(j+3)(j+4)/2520 *
      [7(n-1)(2j^2+10j+15)-j(18j^2+100j+155)].

MarkovLowSourceME9C proves these identities through the boundary j=q. This
discharges the previously missing lower fourth-column identification rather
than relying on interpolation or extrapolating the strict j<q argument.

MarkovLowLCME9C identifies the fourth expression with lowerCandidateM96A,
then strengthens the inherited nonnegative gap certificate to a positive
gap. It concludes strict raw vertical log-concavity whenever j+2<=q. The
root only asks for the non-strict consequence. No denominator bound occurs.
MarkovLowResidualME9C proves the exact root equivalence

    Conjecture63 <-> ThreeRemainingME9C and OtherFourM9E2.

ThreeRemaining retains every horizontal and constant-sum diagonal inequality,
and every vertical inequality except column 4 with j+2<=q. All higher source
numerators, previously inherited reverse-factor ranges, endpoints and zeros
remain. The residual predicates are unproved. low_gain_unboundedME9C gives a
polygon-valid new family for every natural j, using q=j+2 in both branches.

## Proof mechanism

Let F_n be the inherited Fibonacci numerator and D=(u+v+1)^2-4v. Define
delta(n,i,j) as the second forward n difference of its raw coefficient.
For j<n, MarkovLowDifferenceME9C proves delta=0 in columns 0,1,2 and

    delta(n,i+3,j)=C(n-j-1,i) C(i+3+j,i+3).

The proof extends the guarded binomial formula across its upper zero tail;
it does not assume i+j<=n. Pascal identities establish the second difference.

The inherited source identity D P=S^2 Delta^2 F_n + 4u v^(q+1) G implies
that the final forcing term is exactly zero at every j<=q. Expanding S^2
gives explicit low forcing in columns 3 and 4. Source polygon containment
proves the first three columns vanish in this region. The remaining equations
are second differences in j. Initial rows 0 and 1 are proved separately,
and a finite-interval uniqueness theorem gives every j<=q. Polynomial
identities are checked by Lean ring, with no computational oracle.

## Limitations and failed strengthening

MarkovLowLimitME9C proves that the lower expression cannot be used outside
its bound: source 3/4 at (4,2) has coefficient 15, whereas the expression is
7. The actual polygon-valid vertical triple is [3,14,15] and satisfies LC.
This is a source-identification obstruction, not a root refutation.

A natural attempted lower kernel H_i(j,d)=A_{i,j} for q=j+d fails the
nonnegative adjacent-minor condition used successfully in the numerator-two
campaign. MarkovLowKernelLimitME9C proves for every d>=1 and both branches

    H_4(0,d) H_4(1,d+1)-H_4(1,d) H_4(0,d+1)=-42.

These four entries belong to different source polynomials. The failure does
not reverse any one-source log-concavity inequality.

MarkovLowerDomainME9C proves K_4(3,0)=-29 outside the proposed wedge, while
the polygon-valid 3/5 source coefficient at (4,3) is 35. This also shows why
the lower-kernel source bridge cannot be used beyond j<=q. A finite arithmetic
table is generated experimentally, but Lean proves each cell from the
discriminant equation; the experiment is not trusted as an oracle.

## Further representation under investigation

The sparse forcing without its shifted correction defines a triangular
solution L(n,i,j). The proposed alternative kernel is

    K_i(j,k)=L(i+j+k-2,i,j).

MarkovLowerUniformME9C proves L(n,i,j)=A(i,j) when j<=q, for every column.
MarkovLowerShapeME9C and MarkovLowerReductionME9C prove a conditional
transfer using positivity and coordinate LC/minors only on the wedge
2j+3<=i+k, with stronger bounds where neighboring entries require them.
Unlike the naive q=j+d coordinates, finite tests of these conditions did not
fail. The exact root equivalence separates LowerVerticalThreeME9C,
OutsideLowerThreeME9C and OtherFourM9E2. All three are unproved. Shape is a
sufficient hypothesis for the first one, not an equivalent replacement for
the whole root. No uniform shape claim is proved here.

## Experiments

low-experiments.json records direct protected-recurrence coefficient checks,
lower expressions including j=q, and entire fourth-column triples with zeros.
Outside-bound mismatches are deliberately retained. These finite checks do
not prove the upper part of the fourth column.

row-experiments.json records 460 exact lower-row factorizations of the form
u^3(1+u)^(n-2j-1) H_j(n,u), with nonnegative LC residual coefficients. This
factorization and its residual LC have not been formalized universally.
No all-direction implication is claimed from this one-direction observation.

shape-experiments.json rejects the naive coordinates. The alternate probe
tests i,j,k<=24, with every wedge condition checked explicitly; positivity,
row/column LC and minors passed their finite tests. All these are experiments.
