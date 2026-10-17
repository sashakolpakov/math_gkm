# Mathematical report

Machine-authored live request 7a3441816890468e98c10c97d76927c6.
Full pinned Conjecture63 remains unresolved. The final source-bound validation
selection in evidence/markov-7a344181/validation.json governs which modules are
validated; a generated filename alone is not evidence of a theorem.

## Positive certificate and lower source region

The predecessor's four-variable candidate now has a different proof route.
For natural-coefficient polynomials P,Q, if both values at 1 are less than B>1,
equality P(B)=Q(B) implies polynomial equality. Coefficients are bounded by their
sum, so none can carry. Finite coefficient lists are padded to a common length
inside the proof, retaining zero coefficients and trailing zeros.

The multivariate theorem flattens exponent support through an explicitly
support-injective map, using Finsupp.mapDomain. For the actual four-variable
candidate in order (x,g,z,T), the encoding is

    e0 + 23 e1 + 460 e2 + 5980 e3.

It is injective under e0<23, e1<20, e2<13; the final exponent e3 requires no
bound. The equality is transported to ordinary multivariate polynomial equality
and hence to arbitrary rational variable values. Outside the box, x^23 and g
collide; that obstruction is formally proved and the bound is not omitted.

An executable positive-expression language has a proved interpretation and
compositional degree bounds. All 38 factor expressions are proved equal to the
inherited pf0MAD5 through pf37MAD5. The proposed positive gap is a natural
expression in Horner form with 20,813 nonzero coefficients. With B=2^80, the two
expressions

    product0 + product1
    product2 + product3 + positiveGap

have checked degree and mass bounds and equal packed evaluations. The equality
itself is checked by ordinary Lean kernel reduction (`decide +kernel`), not by
Python or native_decide. No concrete multivariate product expansion is trusted.
MarkovExpressionClosedM7A3 consequently proves ReducedPairPositiveMAD5, including
the stronger rational-variable nonnegativity statement for all T,x,g,z>=0.

MarkovLowerClosedM7A3 uses the inherited exact denominator, normalized-pair,
centered-cut, truncation, weighting, and source-coefficient bridges. It proves
LiftMiddleMFEE, LiftLCPositiveM7E2, LiftBoundaryM7E2 and LowerHorizontalMFEE.
In direct source indices, for every finite path with middle numerator a=3,
every i,j in the naturals with 3*j<=b satisfies

    A(i,j) A(i+2,j) <= A(i+1,j)^2.

This includes all columns and zero coefficients, both residue classes
b=3q+1 and b=3q+2, and every lower row j<=q. No finite denominator bound is used.
The exact residual equivalence is

    Conjecture63 <-> ThreeOutsideLowerMFEE and OtherFourM9E2.

Both residual predicates remain open. In particular, this does not infer
LowerRowShapeMFFD for the unsmoothed residual rowHMFFD, and does not establish
the numerator-three correction region or the remaining vertical/diagonal cases.

MarkovLowerCrossM7A3 additionally proves CrossLC of the complete zero-extended
coefficient sequence of lowerRowMFFD(n,j) for every n>=2j+1. The proof establishes
the interval support before using adjacent inequalities to derive CrossLC. It
concerns the smoothed polynomial X^3(1+X)^(n-2j-1)rowHMFFD(n,j), not its residual.

## Correction-kernel experiment

For an augmented lift A0=c and A(t+1)=liftPoly(j,t)+c X^(t+1), the natural
attempt to require every coefficient of A(t+1)^2-A(t)A(t+2) to be nonnegative
fails at j=3,t=1,c=4. The three polynomials have coefficient lists

    [104,4], [265,147,4], [252,384,200,4].

Their gap is 44017+36966 X+1393 X^2-40 X^3. This is an auxiliary obstruction,
not a source counterexample. The associated actual 3/8 source row has the
polygon-valid triple [108,412,636] at (3,3),(4,3),(5,3), whose gap is 101056>0.
Formal status of the obstruction is recorded in the final validation selection.

The first finite auxiliary probe used upper cuts. A separate repetition uses
the inherited lower-cut convention (retain indices >=h); it finds the same
full-gap obstruction at h=0. Both scripts and raw outputs are retained.

MarkovAugmentedSourceM7A3 records the next exact source representation: at
q>=2,j=q+1 and the inherited d,c, column t+2 equals A(t), where A(0)=c and
A(t+1)=liftOutputMAE9(d,j,t)+c*choose(d,t+1). It identifies the actual weighted
output instead of imposing the false coefficientwise strengthening. Its adjacent
inequality remains unproved. The further finite test d<=50, 3<=j<=30 and c=4,8
passes 132,804 adjacent triples, including 14,280 zero-containing triples. This
is auxiliary evidence only, with no inference outside the checked finite range.

## Finite source check

An independent computation from the original path recurrence, q=1,...,32 in
both residue classes, passed 81,328 coefficient comparisons, including 19,808
zeros, and 79,088 lower-horizontal triples (59,280 polygon-valid triples).
See evidence/markov-7a344181/source-experiment.json. These checks are experiments;
the universal lower-region result comes from the formal certificate chain.
