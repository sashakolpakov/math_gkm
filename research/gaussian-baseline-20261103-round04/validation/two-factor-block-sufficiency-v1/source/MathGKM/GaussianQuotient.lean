import Mathlib.FieldTheory.RatFunc.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
Candidate definitions only; `FullPositivity` is a proposition, not a theorem.

Primary target: arXiv:2603.22226v1, Introduction, Conjecture 1.2,
equation (5), printed p. 2. Standard q-binomial conventions:
arXiv:2502.06032v3, printed p. 1, definitions preceding Conjecture 1.
The latter conjecture continues onto printed p. 2.

The full range is retained. Source discrepancies and translation boundaries
are recorded in research/definition-provenance.json for semantic review.
-/

noncomputable section

namespace MathGKM.GaussianQuotient

/-- The canonical map from rational polynomials to their fraction field. -/
def iota : Polynomial ℚ →+* RatFunc ℚ :=
  algebraMap (Polynomial ℚ) (RatFunc ℚ)

/-- The formal indeterminate, with no numerical specialization. -/
def q : RatFunc ℚ :=
  iota Polynomial.X

/-- `T m = ∏_{j=1}^m (1-q^j)`; the empty product is one. -/
def T (m : ℕ) : RatFunc ℚ :=
  ∏ i ∈ Finset.range m, (1 - q ^ (i + 1))

/-- The standard Gaussian binomial as a rational function, zero for `k > n`.
The subtraction occurs only in the `k ≤ n` branch. -/
def B (n k : ℕ) : RatFunc ℚ :=
  if k ≤ n then T n / (T k * T (n - k)) else 0

/-- Every rational coefficient is the image of a natural number. -/
def NatCoeffs (H : Polynomial ℚ) : Prop :=
  ∀ d : ℕ, ∃ a : ℕ, H.coeff d = (a : ℚ)

/-- The closed full quotient-positivity conjecture.
`H` is an arbitrary rational polynomial; the two premises express a defined
quotient and exact polynomiality in the fraction field. -/
def FullPositivity : Prop :=
  ∀ n k l : ℕ, ∀ H : Polynomial ℚ,
    B n l ≠ 0 →
    B n k = B n l * iota H →
    NatCoeffs H

end MathGKM.GaussianQuotient
