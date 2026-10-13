# Machine-authored Agoh exercise and English/Lean audit

Primary source retrieved with the hosted web tool on 2026-10-13:
https://math.colgate.edu/~integers/aa9/aa9.pdf (9 pages).
Raw tool response: evidence/round2/agoh-hosted-retrieval.json. This is a
bootstrap retrieval record, not a protected supervisor attestation or a theorem.
No predecessor mathematical result or strategy was an input.

Statement inventory (formula labels refer to the primary paper):

* (1.1): binomial identity for n >= 0 and x != 0.
* (1.2): G_n = sum_i (-1)^i choose(n,i)/(x^i+a), a real, a != -1.
  At an evaluated point, every denominator must be nonzero.
* (1.3): H_n = sum_i (-1)^i choose(n,i) product_{k != i}(x^k+a).
  This polynomial exists also where G_n is undefined; its equality to G_n
  times the denominator is a rational identity, or a pointwise identity with
  all denominator conditions. It is not automatically a reduced numerator.
* Theorem 1.1: (X-1)^n divides the numerator for every n >= 0. Three proofs
  are offered: induction, elementary symmetric polynomials, geometric series.
  Formalization of this n-fold assertion is STILL OPEN here.
* Theorem 3.1: analogous n-fold claim for Q_n=sum_i (-1)^i choose(n,i)/f(x^i),
  with nonconstant real-rooted f, all roots simple and different from 1.
  The presentation normalizes f to monic. STILL OPEN here.
* Section 4: repeated real roots are permitted, f monic of positive degree,
  f(1) != 0; the discussion claims at least one factor X-1. Its vanishing
  calculation needs n>0. This is the SELECTED universal exercise.
* Final conjecture: n-fold numerator divisibility characterized by f being
  a monomial or having only simple roots different from 1. The quantification
  over n needs explicit treatment before attempting a formal refutation.
  It is not resolved by our first-order theorem or finite experiments.

Chosen scope and exact Lean meaning:

MathGKM/AgohExercise.lean defines numerator n f over R[X] with precisely the
binomial weights and excluded-index products. first_order_factor proves
(X-C(1)) divides this polynomial for EVERY n != 0 and EVERY real polynomial f.
The proof evaluates at 1, counts the n factors in each erased product, applies
the alternating binomial-sum identity, then applies the polynomial factor
criterion. Real-rootedness and monicity are not needed for this particular
claim; the stronger conclusion is explicit rather than a changed interpretation
of the paper. clears_denominators proves its exact pointwise connection to
Q_n, assuming each f(x^i) != 0. denominator_at_one proves the common denominator
is nonzero at 1 when f(1) != 0. We have NOT formalized reduced rational-function
numerators or cancellation through a gcd, so the formal theorem is stated as
cleared-numerator divisibility, with that last reduced-numerator bridge open.

Missing-condition checks: zero_order and missing_positive_n show that n=0
has numerator 1 and cannot satisfy the first-order claim. singular_counterexample
uses n=1, f=X-1, x=2: the cleared numerator is 1 but the common denominator is 0.
Thus denominator nonvanishing cannot simply be omitted from pointwise clearing.

Independent reading within this proposer turn found a defect in the third
proof's convergence region: a=3, x=7/5 satisfy a>2 and |x-1|<1/2, but for i=4,
|x^i/a|=2401/1875>1. geometric_region_counterexample checks those exact
inequalities over the reals. The engine's rational experiment motivated the
algebraic approach (research-run/response-0001.json). This shows that the
stated bounds do not justify that geometric-series expansion uniformly in i;
it does not refute Theorem 1.1. A neighborhood depending on n could repair it.
The Section 4 displayed degree also warrants checking: powers j in every factor
change the generic leading degree by a factor j. That observation is not
formalized here. The printed T_j notation has index inconsistencies; our
numerator follows the explicitly displayed excluded-index product.

Status: chosen first-order polynomial scope and explicit conditions have Lean
proofs; independent English/Lean audit and protected admission remain pending.
The main n-fold Agoh exercise and final conjecture are unfinished. Markov has
not been researched or started.
