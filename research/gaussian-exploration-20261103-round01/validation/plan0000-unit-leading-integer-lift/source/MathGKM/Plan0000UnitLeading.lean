import Mathlib.Algebra.Polynomial.Div
import Mathlib.Tactic

/-! Reusable arithmetic descent. Separate from Gaussian-specific and sign work. -/

noncomputable section

namespace MathGKM.Plan0000UnitLeading

open Polynomial

theorem monic_integer_lift (P Q : Polynomial ℤ) (H : Polynomial ℚ)
    (hQ : Q.Monic)
    (h : P.map (Int.castRingHom ℚ) = Q.map (Int.castRingHom ℚ) * H) :
    ∃ K : Polynomial ℤ, H = K.map (Int.castRingHom ℚ) := by
  refine ⟨P /ₘ Q, ?_⟩
  rw [Polynomial.map_divByMonic _ hQ, h,
    Polynomial.mul_divByMonic_cancel_left H (hQ.map _)]

theorem unit_leading_integer_lift :
    ∀ (P Q : Polynomial ℤ) (H : Polynomial ℚ),
      (Q.leadingCoeff = (1 : ℤ) ∨ Q.leadingCoeff = (-1 : ℤ)) →
      P.map (Int.castRingHom ℚ) = Q.map (Int.castRingHom ℚ) * H →
      ∃ K : Polynomial ℤ, H = K.map (Int.castRingHom ℚ) := by
  intro P Q H hQ h
  rcases hQ with hQ | hQ
  · exact monic_integer_lift P Q H hQ h
  · apply monic_integer_lift (-P) (-Q) H
    · simp [Polynomial.Monic, hQ]
    · simpa using congrArg Neg.neg h

end MathGKM.Plan0000UnitLeading
