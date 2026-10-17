import MarkovNormalizedKernelM09F
/-! Machine-authored 09fffb56. Exact connection to the existing complete
kernel; normalization is auxiliary, never a change to the source target. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def normalizedCoeffM09F (j t m : ℕ) : ℚ :=
 (liftTermMAE9 j t m:ℚ)/(liftTermMAE9 j t 0:ℚ)

theorem normalized_coeff_formulaM09F (j t m : ℕ) (hm : m ≤ j) :
 normalizedCoeffM09F j t m=(j.choose m:ℚ)*normKernelM09F j t m := by
 have hb : (0:ℚ)<(t+j+3).choose j := by
   exact_mod_cast Nat.choose_pos (by omega : j ≤ t+j+3)
 have hw := lift_weight_positiveMAE9 (j:ℚ) t 0 (by positivity) (by norm_num) (by positivity)
 unfold normalizedCoeffM09F
 rw [lift_normalizedMFEE j t m hm,lift_normalizedMFEE j t 0 (by omega)]
 simp only [Nat.choose_zero_right,Nat.cast_one,Nat.cast_zero,mul_one]
 unfold normKernelM09F normNumerM09F normDenomM09F liftDenMAE9
 field_simp
 <;> ring

theorem normalized_coeff_tailM09F (j t m : ℕ) (hm : j < m) :
 normalizedCoeffM09F j t m=0 := by
 unfold normalizedCoeffM09F liftTermMAE9
 rw [Nat.choose_eq_zero_of_lt (by omega : t+j+3 < t+m+3),
   Nat.choose_eq_zero_of_lt (by omega : t+j+4 < t+m+5)]
 simp

theorem normalized_coeff_nonnegM09F (j t m : ℕ) :
 0 ≤ normalizedCoeffM09F j t m := by
 unfold normalizedCoeffM09F liftTermMAE9
 positivity

theorem normalized_coeff_monoM09F (j t m : ℕ) :
 normalizedCoeffM09F j t m ≤ normalizedCoeffM09F j (t+1) m := by
 by_cases hm : m ≤ j
 · rw [normalized_coeff_formulaM09F j t m hm,normalized_coeff_formulaM09F j (t+1) m hm]
   push_cast
   exact mul_le_mul_of_nonneg_left (norm_stepM09F j t m (by positivity) (by positivity)
     (by exact_mod_cast hm)) (by positivity)
 · rw [normalized_coeff_tailM09F j t m (by omega),normalized_coeff_tailM09F j (t+1) m (by omega)]

theorem normalized_coeff_lcM09F (j t m : ℕ) :
 normalizedCoeffM09F j t m*normalizedCoeffM09F j (t+2) m ≤
 normalizedCoeffM09F j (t+1) m^2 := by
 by_cases hm : m ≤ j
 · rw [normalized_coeff_formulaM09F j t m hm,normalized_coeff_formulaM09F j (t+1) m hm,
     normalized_coeff_formulaM09F j (t+2) m hm]
   push_cast
   have h := mul_le_mul_of_nonneg_left (norm_lcM09F j t m (by positivity) (by positivity)
     (by exact_mod_cast hm)) (sq_nonneg (j.choose m:ℚ))
   nlinarith only [h]
 · rw [normalized_coeff_tailM09F j t m (by omega),normalized_coeff_tailM09F j (t+1) m (by omega),
     normalized_coeff_tailM09F j (t+2) m (by omega)]
   norm_num

theorem normalized_coeff_crossM09F (j t m : ℕ) :
 (liftTermMAE9 j (t+1) 0:ℝ)^2*(liftTermMAE9 j t m:ℝ)*(liftTermMAE9 j (t+2) m:ℝ) ≤
 (liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 0:ℝ)*(liftTermMAE9 j (t+1) m:ℝ)^2 := by
 have h := normalized_coeff_lcM09F j t m
 have hp (s : ℕ) : (0:ℚ)<liftTermMAE9 j s 0 := by
   exact_mod_cast lift_term_positiveMAD5 j s 0 (by omega)
 unfold normalizedCoeffM09F at h
 rw [div_mul_div_comm,div_pow] at h
 have hh := (div_le_div_iff₀ (mul_pos (hp t) (hp (t+2))) (sq_pos_of_pos (hp (t+1)))).mp h
 have hr := (Rat.cast_le (K:=ℝ)).mpr hh
 push_cast at hr
 nlinarith only [hr]

end
end MathGKM.Markov
