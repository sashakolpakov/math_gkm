import MathGKM.GaussianQuotient
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Tactic

/-! A sign obstruction outside the Gaussian family; separate from arithmetic descent. -/

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0001ReciprocalSign

open Polynomial MathGKM.GaussianQuotient

def P : Polynomial ℚ := 1 + X ^ 3
def Q : Polynomial ℚ := 1 + X
def R : Polynomial ℚ := X ^ 2 - X + 1

theorem factorization : P = Q * R := by unfold P Q R; ring

theorem P_nat : NatCoeffs P := by
  intro d
  by_cases h0 : d = 0
  · subst d; exact ⟨1, by norm_num [P, Polynomial.coeff_one]⟩
  · by_cases h3 : d = 3
    · subst d; exact ⟨1, by norm_num [P, Polynomial.coeff_one]⟩
    · exact ⟨0, by simp [P, Polynomial.coeff_X_pow, Polynomial.coeff_one, h0, h3]⟩

theorem Q_nat : NatCoeffs Q := by
  intro d
  by_cases h0 : d = 0
  · subst d; exact ⟨1, by norm_num [Q, Polynomial.coeff_one]⟩
  · by_cases h1 : d = 1
    · subst d; exact ⟨1, by norm_num [Q, Polynomial.coeff_one]⟩
    · exact ⟨0, by simp [Q, Polynomial.coeff_X, Polynomial.coeff_one, h0, Ne.symm h1]⟩

theorem Q_monic : Q.Monic := by
  simpa [Q, add_comm] using (Polynomial.monic_X_add_C (1 : ℚ))

theorem P_reciprocal : Polynomial.reflect 3 P = P := by
  simp [P, Polynomial.reflect_add, Polynomial.reflect_one,
    Polynomial.reflect_monomial, Polynomial.revAt]
  <;> ring

theorem Q_reciprocal : Polynomial.reflect 1 Q = Q := by
  simpa [Q, Polynomial.reflect_add, Polynomial.reflect_one,
    Polynomial.reflect_one_X, add_comm]

theorem R_coeff_one : R.coeff 1 = (-1 : ℚ) := by
  norm_num [R, Polynomial.coeff_one]

theorem R_not_nat : ¬NatCoeffs R := by
  intro h
  obtain ⟨a, ha⟩ := h 1
  have hn : (0 : ℚ) ≤ a := Nat.cast_nonneg a
  rw [R_coeff_one] at ha
  linarith

theorem sign_discriminator :
    P = Q * R ∧ NatCoeffs P ∧ NatCoeffs Q ∧ Q.Monic ∧
    Polynomial.reflect 3 P = P ∧ Polynomial.reflect 1 Q = Q ∧
    R.coeff 1 = (-1 : ℚ) ∧ ¬NatCoeffs R :=
  ⟨factorization, P_nat, Q_nat, Q_monic, P_reciprocal, Q_reciprocal,
    R_coeff_one, R_not_nat⟩

end MathGKM.Plan0001ReciprocalSign
