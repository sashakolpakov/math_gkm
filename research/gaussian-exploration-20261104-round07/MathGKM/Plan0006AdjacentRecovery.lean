import MathGKM.Plan0004QIntegerDivision
import MathGKM.Plan0001FullIntegrality

/-! Adjacent Gaussian quotients: exact transport followed by single-factor signs. -/

set_option autoImplicit false
noncomputable section

namespace MathGKM.Plan0006AdjacentRecovery

open Polynomial MathGKM.GaussianQuotient
open MathGKM.Plan0000UnitLeadingTransport MathGKM.Plan0004QIntegerDivision

def fact (m : ℕ) : Polynomial ℚ := (intT m).map (Int.castRingHom ℚ)

theorem fact_ne_zero (m : ℕ) : fact m ≠ 0 := by
  intro hz
  exact intT_ne_zero m (Polynomial.map_injective (Int.castRingHom ℚ)
    Int.cast_injective (by simpa [fact] using hz))

theorem fact_succ (m : ℕ) : fact (m+1) = fact m * (1-X^(m+1)) := by
  simp [fact, intT, Finset.prod_range_succ]

theorem adjacent_qinteger_identity (n l : ℕ) (H : Polynomial ℚ)
    (hl : l < n) (he : B n (l+1) = B n l * iota H) :
    qInt (n-l) = qInt (l+1) * H := by
  have hc := quotient_cross_multiply n (l+1) l H (by omega) (by omega) he
  have hc' : fact l * fact (n-l) = (fact (l+1) * fact (n-(l+1))) * H := by
    apply iota_injective
    simpa only [fact, Polynomial.map_mul, map_mul] using hc
  have hs : n-l = (n-(l+1))+1 := by omega
  have hf : fact (n-l) = fact (n-(l+1)) * (1-X^(n-l)) := by
    conv_lhs => rw [hs, fact_succ]
    rw [← hs]
  rw [hf, fact_succ] at hc'
  have hp : (1-X^(n-l) : Polynomial ℚ) = (1-X^(l+1)) * H := by
    apply mul_left_cancel₀ (mul_ne_zero (fact_ne_zero l) (fact_ne_zero (n-(l+1))))
    calc
      (fact l * fact (n-(l+1))) * (1-X^(n-l)) =
          fact l * (fact (n-(l+1)) * (1-X^(n-l))) := by ring
      _ = (fact l * (1-X^(l+1)) * fact (n-(l+1))) * H := hc'
      _ = (fact l * fact (n-(l+1))) * ((1-X^(l+1)) * H) := by ring
  have hx : (1-X : Polynomial ℚ) ≠ 0 := by
    intro hz
    have hh := congrArg (fun p : Polynomial ℚ => p.coeff 0) hz
    norm_num at hh
  apply mul_left_cancel₀ hx
  rw [qInt_mul_one_sub, ← mul_assoc, qInt_mul_one_sub]
  exact hp

theorem qInt_nonnegative (b d : ℕ) : (0 : ℚ) ≤ (qInt b).coeff d := by
  rw [coeff_qInt]
  split_ifs <;> norm_num

theorem qInt_reflect (b : ℕ) (hb : 0 < b) :
    reflect (qInt b).natDegree (qInt b) = qInt b :=
  reverse_qInt b hb

theorem qInt_ascent (b d : ℕ) (hd : 2*d < (qInt b).natDegree) :
    (qInt b).coeff d ≤ (qInt b).coeff (d+1) := by
  by_cases hb : 0 < b
  · rw [natDegree_qInt b hb] at hd
    rw [coeff_qInt, coeff_qInt, if_pos (by omega), if_pos (by omega)]
  · have hz : b = 0 := by omega
    simp [hz, qInt] at hd

theorem adjacent_positivity :
    ∀ (n l : ℕ) (H : Polynomial ℚ),
      B n l ≠ 0 → B n (l + 1) = B n l * iota H → NatCoeffs H := by
  intro n l H hl he
  have hln : l ≤ n := (B_ne_zero_iff n l).1 hl
  by_cases hlt : l < n
  · have hid := adjacent_qinteger_identity n l H hlt he
    have hn : ∀ d : ℕ, (0 : ℚ) ≤ H.coeff d :=
      symmetric_unimodal_qinteger_division (l+1) (qInt (n-l)) H (by omega)
        (qInt_nonnegative (n-l)) (qInt_reflect (n-l) (by omega))
        (qInt_ascent (n-l)) hid
    intro d
    obtain ⟨z, hz⟩ := MathGKM.Plan0001FullIntegrality.full_integrality n (l+1) l H hl he d
    have hzn : (0 : ℤ) ≤ z := by
      have hq := hn d
      rw [hz] at hq
      exact_mod_cast hq
    refine ⟨z.toNat, ?_⟩
    rw [hz]
    exact_mod_cast (Int.toNat_of_nonneg hzn).symm
  · have hn : n = l := by omega
    have hz : B n (l+1) = 0 := by simp [B, hn]
    have hi : iota H = 0 := (mul_eq_zero.mp (he.symm.trans hz)).resolve_left hl
    have hH : H = 0 := iota_injective (by simpa using hi)
    intro d
    exact ⟨0, by simp [hH]⟩

end MathGKM.Plan0006AdjacentRecovery
