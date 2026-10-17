import MarkovBorderDominanceMF8F
/-! Machine-authored a646848d. Coefficient bounds for the complete kernel.
These bounds are auxiliary and do not change the raw source coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem comp_binomial_upperMA64 (P : ℝ[X]) (j m : ℕ)
 (hp : ∀ k, 0 ≤ P.coeff k) (hd : P.natDegree ≤ j) :
 (P.comp (X+1)).coeff m ≤ (P.comp (X+1)).coeff 0 * (j.choose m:ℝ) := by
 conv_lhs => rw [P.as_sum_support]
 conv_rhs => rw [P.as_sum_support]
 simp only [Polynomial.sum_comp,Polynomial.monomial_comp,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow,
   Nat.choose_zero_right,Nat.cast_one,mul_one]
 rw [sum_mul]
 apply sum_le_sum
 intro k hk
 apply mul_le_mul_of_nonneg_left _ (hp k)
 exact_mod_cast Nat.choose_le_choose m ((Polynomial.le_natDegree_of_ne_zero
   (Polynomial.mem_support_iff.mp hk)).trans hd)

theorem comp_binomial_lowerMA64 (P : ℝ[X]) (j m : ℕ)
 (hp : ∀ k, 0 ≤ P.coeff k) :
 P.coeff j * (j.choose m:ℝ) ≤ (P.comp (X+1)).coeff m := by
 conv_rhs => rw [P.as_sum_support]
 simp only [Polynomial.sum_comp,Polynomial.monomial_comp,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_X_add_one_pow]
 by_cases hj : j ∈ P.support
 · exact single_le_sum (fun k _ => mul_nonneg (hp k) (by positivity)) hj
 · rw [Polynomial.not_mem_support_iff.mp hj,zero_mul]
   exact sum_nonneg (fun k _ => mul_nonneg (hp k) (by positivity))

theorem q_coeff_nonnegMA64 (j t k : ℕ) : 0 ≤ (qPolyM7E2 j t).coeff k := by
 rw [q_poly_coeffM7E2,qCoeffM7E2]
 exact mul_nonneg (q_weight_nonnegM7E2 _) (by unfold qBinM7E2; positivity)

theorem q_topMA64 (j t : ℕ) :
 (qPolyM7E2 j t).coeff j=((t+j+3).choose j:ℝ) := by
 simp [q_poly_coeffM7E2,qCoeffM7E2,qWeightM7E2,qBinM7E2]

theorem base_choose_fiveMA64 (j t : ℕ) (ht : 2 ≤ t) :
 ((j:ℚ)+1)*((j:ℚ)+2)*((j:ℚ)+3)*((j:ℚ)+4)*((j:ℚ)+5)/120 ≤
 ((t+j+3).choose j:ℚ) := by
 have hm := Nat.choose_le_choose j (by omega : j+5 ≤ t+j+3)
 have he := Nat.ascFactorial_eq_factorial_mul_choose j 5
 have heq : ((j:ℚ)+1)*((j:ℚ)+2)*((j:ℚ)+3)*((j:ℚ)+4)*((j:ℚ)+5)=
     120*((j+5).choose 5:ℚ) := by
   exact_mod_cast (by simpa [Nat.ascFactorial_succ, Nat.factorial,
     Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] using he)
 have hs : (j+5).choose 5=(j+5).choose j := by
   simpa using (Nat.choose_symm (show 5 ≤ j+5 by omega))
 rw [hs] at heq
 have hmq : ((j+5).choose j:ℚ) ≤ ((t+j+3).choose j:ℚ) := by exact_mod_cast hm
 linarith

end
end MathGKM.Markov
