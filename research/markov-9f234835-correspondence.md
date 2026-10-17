# Partial source correspondence and scope

Machine-authored request 9f234835b0cf47d395d489f5776d690b. This is not an
independent source/English completion audit. Completion is null.

The unchanged root is MathGKM.Markov.Conjecture63 in MathGKM/Markov.lean,
SHA256 8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe.
The canonical pinned contract hash is
6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc.

The publication is [Evans–Veselov–Winn, Arithmetic and Geometry of Markov
polynomials](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html).
Hosted retrieval succeeded during this run. The source identifies the rational
representatives, homogeneous squared-variable numerators and their recurrence;
Definitions 6.1–6.2 and Conjecture 6.3 specify the three-direction raw coefficient
inequality. This run also read the independent target-definition, residual-scope
and mathematical-review audits. No retrieved theorem is introduced as a Lean axiom.

## Coverage

The root remains universal over all finite paths and both separately stated
endpoints. The inherited coverage chain is reused, not independently rebuilt.
source_three_rawM9E2 identifies every numerator-three path with q>=1 and one
of b=3q+1,b=3q+2. The new inequalities have no denominator, column or depth
bound. The lower region requires j+2<=q; the upper region requires b<=j+q.
The middle region is explicitly retained, as is OtherFourM9E2. The numerator-three
family is not asserted to cover the entire root.

## Source family

The new upper identity is derived from the inherited actual-source theorem
source_top_coeffMB3E and top_shift_massME10, then proved equal to the finite
ramp convolution. The lower identity is the inherited lower source bridge on
its proved wedge. The positive convolution is never substituted for the signed
lowerKernel outside that wedge. The middle correction is not dropped.
Every claimed source inequality is transported back to threeRawM9E2 and then
to coeff (frame path).mid.p. Auxiliary minor failures are not source witnesses.

## Homogeneity and raw coefficients

The pinned representation extracts unscaled integer coefficients in u=x^2 and
v=y^2 after w=z^2 is set to one. The inherited fixed-degree interpretation
recovers the omitted exponent. The new model uses k=b+2-i-j only after support
bounds make it nonnegative. Rational casts and denominator clearing occur
inside exact proved identities; they do not change the target coefficients.
The three finite symbolic sign checks prove inequalities for unbounded
nonnegative parameters via checked polynomial identities, not sampling.

## Polygon

The target polygon definition is unchanged. The new raw inequalities hold for
all natural columns in their row domains, so they imply the polygon-guarded
versions. MarkovOuterPathM9F23 explicitly provides all three guarded clauses.
No new proof identifying the polygon with the published Newton polygon is
claimed here; the inherited correspondence obligations remain part of any
eventual root completion review.

## Directions, zeros and endpoints

Horizontal triples are (i,j),(i+1,j),(i+2,j), inherited as proved for all
numerator-three rows. Vertical triples and constant-i+j triples retain exactly
the root ordering. The diagonal is (i,j+2),(i+1,j+1),(i+2,j), not an increasing
i+j direction. Every inequality is non-strict. Negative-index binomial sequences
are zero-extended; actual degree tails and low columns are handled explicitly.
No potentially zero source coefficient is divided by. Positive auxiliary
binomial denominators and model values are proved positive before cancellation.

The exact path domains are 3(j+2)<=b for the lower region and 2b+1<=3j for
the upper region. The latter includes j=2q+1 when b=3q+1 and j=2q+2 when
b=3q+2. Earlier intermediate wrappers with 2b+2<=3j remain valid but stronger;
path_upper_transverse_exactM9F23 is the complete wrapper. Endpoints are retained
through the unchanged root iff chain, not omitted by the new residual.

## Assumptions

Pinned Lean 4.32.2 and read-only inherited Mathlib/imports are used. Selected
theorem closures are audited for only propext, Classical.choice and Quot.sound.
No sorry, admit, custom axiom or native_decide occurs in the submitted modules.
Finite certificates use ordinary kernel reduction. ReplayIsolatedM9F23 is an
operational checker, not a mathematical axiom or proof of its own implementation.
Inherited compiled imports are reused. This is not a fresh whole-source rebuild.

## Proof scope

The strongest exact reduction is root_iff_middle_onlyM9F23:

    Conjecture63 iff ThreeMiddleOnlyM9F23 and OtherFourM9E2.

Both right-hand propositions remain open. The new work closes all lower
diagonal inequalities and all upper vertical and diagonal inequalities for
numerator three; it does not close the middle transverse strip or any additional
numerator-at-least-four family. Experiments and local validation cannot discharge
those universal obligations. No independent hash-bound completion audit occurred.
