import MarkovMiddlePositiveM99A
/-! Machine-authored 99a0f3b8. Positive correction and exact source support
in the nonnegative-exponent middle strip; no additional LC assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem source_middle_majorizesM99A (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : 2*k+2 ≤ q) :
 (topTemplateMB3E (sourceNME9C q r) (q+3+k)).coeff c ≤
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k)) := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_middle_formulaM99A q k r hq (by omega),coeff_add]
 have := middle_correction_nonnegM99A q k c r hk
 omega

theorem source_middle_high_positiveM99A (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r)
 (hc : 3 ≤ c) (hct : c ≤ q+3+k) :
 0 < threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k)) := by
 have hk : 2*k+2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have h := source_middle_majorizesM99A q k c r hq hk
 have hp := (top_positive_supportMB3E (sourceNME9C q r) (q+3+k) (c-3) hn).mpr (by omega)
 rw [←top_positive_formulaMB3E (sourceNME9C q r) (q+3+k) (c-3) hn,
   show c-3+3=c by omega] at hp
 omega

theorem source_middle_second_positiveM99A (q k : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 0 < threeRawM9E2 q r 2 (sourceNME9C q r+2-(q+3+k)) := by
 have hk : 2*k+2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have h := source_middle_majorizesM99A q k 2 r hq hk
 rw [(top_edge_coeffsMB3E (sourceNME9C q r) (q+3+k) hn (by omega)).2.2] at h
 have hc : (0:ℤ)<(sourceNME9C q r-2*(q+3+k)+6).choose 2 := by
   exact_mod_cast Nat.choose_pos (show 2 ≤ sourceNME9C q r-2*(q+3+k)+6 by omega)
 have ht : (0:ℤ)<((q+3+k:ℕ):ℤ)-2 := by omega
 have hp : (0:ℤ)<4*(((q+3+k:ℕ):ℤ)-2)*
   ((sourceNME9C q r-2*(q+3+k)+6).choose 2:ℤ) := by positivity
 omega

end
end MathGKM.Markov
