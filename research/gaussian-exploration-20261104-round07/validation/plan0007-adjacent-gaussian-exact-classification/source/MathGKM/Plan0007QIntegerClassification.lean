import MathGKM.Plan0004QIntegerDivision

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0007QIntegerClassification

open Polynomial
open MathGKM.Plan0004QIntegerDivision

theorem qInt_add (m n : ℕ) :
    qInt (m+n) = qInt m + X^m * qInt n := by
  simp [qInt, Finset.sum_range_add, pow_add, Finset.mul_sum]

theorem qInt_blocks (b t : ℕ) :
    qInt (b*t) = qInt b * ∑ j ∈ Finset.range t, (X : Polynomial ℚ)^(b*j) := by
  induction t with
  | zero => simp [qInt]
  | succ t ih =>
    rw [Nat.mul_succ, qInt_add, ih, Finset.sum_range_succ]
    ring

theorem qinteger_classification :
    ∀ (a b : ℕ) (H : Polynomial ℚ), 0 < b →
      (∑ j ∈ Finset.range a, (Polynomial.X : Polynomial ℚ) ^ j) =
        (∑ j ∈ Finset.range b, (Polynomial.X : Polynomial ℚ) ^ j) * H →
      b ∣ a ∧ H = ∑ j ∈ Finset.range (a / b),
        (Polynomial.X : Polynomial ℚ) ^ (b * j) := by
  intro a b H hb he
  change qInt a = qInt b * H at he
  by_cases ha : a = 0
  · subst a
    have hz : H = 0 := (mul_eq_zero.mp (by simpa [qInt] using he.symm)).resolve_left
      (qInt_ne_zero b hb)
    simp [hz]
  by_cases hb1 : b = 1
  · subst b
    have hh : H = qInt a := by simpa [qInt] using he.symm
    simpa [qInt] using hh
  have hsplit : qInt a = qInt (a%b) +
      X^(a%b) * (qInt b * ∑ j ∈ Finset.range (a/b), (X : Polynomial ℚ)^(b*j)) := by
    conv_lhs => rw [← Nat.mod_add_div a b]
    rw [qInt_add, qInt_blocks]
  have hrem : qInt b ∣ qInt (a%b) := by
    refine ⟨H - X^(a%b) * ∑ j ∈ Finset.range (a/b), (X : Polynomial ℚ)^(b*j), ?_⟩
    calc
      qInt (a%b) = qInt a - X^(a%b) *
          (qInt b * ∑ j ∈ Finset.range (a/b), (X : Polynomial ℚ)^(b*j)) := by
        rw [hsplit]
        ring
      _ = _ := by rw [he]; ring
  have hr : a%b = 0 := by
    by_contra hn
    have hrpos : 0 < a%b := Nat.pos_of_ne_zero hn
    have hd := natDegree_le_of_dvd hrem (qInt_ne_zero (a%b) hrpos)
    rw [natDegree_qInt b hb, natDegree_qInt (a%b) hrpos] at hd
    have hlt := Nat.mod_lt a hb
    omega
  refine ⟨Nat.dvd_of_mod_eq_zero hr, ?_⟩
  apply mul_left_cancel₀ (qInt_ne_zero b hb)
  rw [← he, ← qInt_blocks]
  congr 1
  exact (Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero hr)).symm.trans (Nat.mul_comm _ _)

end MathGKM.Plan0007QIntegerClassification
