import Mathlib

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0004QIntegerDivision

open Polynomial

def qInt (b : ℕ) : Polynomial ℚ := ∑ j ∈ Finset.range b, X ^ j

theorem coeff_qInt (b d : ℕ) : (qInt b).coeff d = if d < b then 1 else 0 := by
  simp [qInt, finsetSum_coeff, coeff_X_pow, Finset.mem_range]

theorem qInt_ne_zero (b : ℕ) (hb : 0 < b) : qInt b ≠ 0 := by
  intro hz
  have h := coeff_qInt b 0
  simp [hz, hb] at h

theorem natDegree_qInt (b : ℕ) (hb : 0 < b) : (qInt b).natDegree = b - 1 := by
  apply natDegree_eq_of_le_of_coeff_ne_zero
  · apply natDegree_le_iff_coeff_eq_zero.mpr
    intro d hd
    rw [coeff_qInt, if_neg (by omega)]
  · rw [coeff_qInt, if_pos (by omega)]
    norm_num

theorem reverse_qInt (b : ℕ) (hb : 0 < b) : (qInt b).reverse = qInt b := by
  ext d
  rw [reverse, coeff_reflect, natDegree_qInt b hb, coeff_qInt, coeff_qInt]
  by_cases hd : d ≤ b - 1
  · rw [revAt_le hd, if_pos (by omega), if_pos (by omega)]
  · rw [revAt_eq_self_of_lt (by omega)]

theorem qInt_mul_one_sub (b : ℕ) :
    (1 - X : Polynomial ℚ) * qInt b = 1 - X ^ b := by
  induction b with
  | zero => simp [qInt]
  | succ b ih =>
    have hs : qInt (b+1) = qInt b + X ^ b := by simp [qInt, Finset.sum_range_succ]
    rw [hs, mul_add, ih, pow_succ]
    ring

theorem quotient_reverse (b : ℕ) (P H : Polynomial ℚ) (hb : 0 < b)
    (hs : reflect P.natDegree P = P) (he : P = qInt b * H) :
    H.reverse = H := by
  have hp : P.reverse = P := hs
  rw [he, reverse_mul_of_domain, reverse_qInt b hb] at hp
  exact mul_left_cancel₀ (qInt_ne_zero b hb) hp

theorem first_half_nonnegative (b : ℕ) (P H : Polynomial ℚ) (hb : 0 < b)
    (hn : ∀ d : ℕ, (0 : ℚ) ≤ P.coeff d)
    (hu : ∀ d : ℕ, 2 * d < P.natDegree → P.coeff d ≤ P.coeff (d+1))
    (he : P = qInt b * H) :
    ∀ d : ℕ, 2*d ≤ P.natDegree → (0 : ℚ) ≤ H.coeff d := by
  have hid : (1-X) * P = (1-X^b) * H := by
    rw [he, ← mul_assoc, qInt_mul_one_sub]
  intro d
  induction d using Nat.strong_induction_on with
  | h d ih =>
    intro hd
    cases d with
    | zero =>
      have hc := congrArg (fun f : Polynomial ℚ => f.coeff 0) he
      simp [mul_coeff_zero, coeff_qInt, hb] at hc
      linarith [hn 0]
    | succ d =>
      have hc := congrArg (fun f : Polynomial ℚ => f.coeff (d+1)) hid
      simp only [sub_mul, one_mul, coeff_sub, coeff_X_mul, coeff_X_pow_mul'] at hc
      have hm := hu d (by omega)
      by_cases hbd : b ≤ d+1
      · have hi := ih (d+1-b) (by omega) (by omega)
        simp [hbd] at hc
        linarith
      · simp [hbd] at hc
        linarith

theorem symmetric_unimodal_qinteger_division :
    ∀ (b : ℕ) (P H : Polynomial ℚ), 0 < b →
      (∀ d : ℕ, (0 : ℚ) ≤ P.coeff d) →
      Polynomial.reflect P.natDegree P = P →
      (∀ d : ℕ, 2 * d < P.natDegree → P.coeff d ≤ P.coeff (d + 1)) →
      P = (∑ j ∈ Finset.range b, (Polynomial.X : Polynomial ℚ) ^ j) * H →
      ∀ d : ℕ, (0 : ℚ) ≤ H.coeff d := by
  intro b P H hb hn hs hu he d
  change P = qInt b * H at he
  by_cases hH : H = 0
  · simp [hH]
  have hdeg : P.natDegree = b-1 + H.natDegree := by
    rw [he, natDegree_mul (qInt_ne_zero b hb) hH, natDegree_qInt b hb]
  by_cases hd : H.natDegree < d
  · rw [coeff_eq_zero_of_natDegree_lt hd]
  · have hd' : d ≤ H.natDegree := by omega
    by_cases hhalf : 2*d ≤ P.natDegree
    · exact first_half_nonnegative b P H hb hn hu he d hhalf
    · have hr := quotient_reverse b P H hb hs he
      have hc := congrArg (fun f : Polynomial ℚ => f.coeff d) hr
      rw [reverse, coeff_reflect, revAt_le hd'] at hc
      rw [← hc]
      apply first_half_nonnegative b P H hb hn hu he
      omega

end MathGKM.Plan0004QIntegerDivision
