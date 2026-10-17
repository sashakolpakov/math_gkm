import MarkovRobustCutM964
/-! Machine-authored 9647c1ba. Two adjacent terminal coefficients, with
quantitative domination by the unperturbed complete binomial kernel. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def twinLiftM964 (j t : ℕ) (a v : ℝ) : ℝ[X] :=
 liftPolyM7E2 j (t+1)+C a*X^(t+1)+C v*X^t

theorem lift_binomial_lowerM964 (j t m : ℕ) :
 ((t+j+3).choose j:ℝ)*(j.choose m:ℝ) ≤ (liftTermMAE9 j t m:ℝ) := by
 have h := comp_binomial_lowerMA64 (qPolyM7E2 j t) j m (q_coeff_nonnegMA64 j t)
 rw [q_topMA64,q_comp_liftM7E2] at h
 exact h

theorem lift_nonnegM964 (j t k : ℕ) : 0 ≤ (liftPolyM7E2 j t).coeff k := by
 rw [lift_poly_coeffM7E2,reverseLiftMAE9]
 split_ifs <;> simp only [liftTermMAE9] <;> positivity

theorem twin_nonnegM964 (j t k : ℕ) (a v : ℝ) (ha : 0 ≤ a) (hv : 0 ≤ v) :
 0 ≤ (twinLiftM964 j t a v).coeff k := by
 rw [twinLiftM964,coeff_add,coeff_add,coeff_C_mul,coeff_C_mul,coeff_X_pow,coeff_X_pow]
 have h := lift_nonnegM964 j (t+1) k
 split_ifs <;> nlinarith

theorem twin_ge_liftM964 (j t k : ℕ) (a v : ℝ) (ha : 0 ≤ a) (hv : 0 ≤ v) :
 (liftPolyM7E2 j (t+1)).coeff k ≤ (twinLiftM964 j t a v).coeff k := by
 rw [twinLiftM964,coeff_add,coeff_add,coeff_C_mul,coeff_C_mul,coeff_X_pow,coeff_X_pow]
 split_ifs <;> nlinarith

theorem twin_scaledM964 (j t k : ℕ) (a v B U : ℝ) (hj : 1 ≤ j)
 (hB : 0 ≤ B) (hU : 0 ≤ U) (ha : a ≤ U) (hv : v ≤ U*j)
 (hbase : B ≤ ((t+1+j+3).choose j:ℝ)) :
 B*(twinLiftM964 j t a v).coeff k ≤ (B+U)*(liftPolyM7E2 j (t+1)).coeff k := by
 have h0 : B ≤ (liftPolyM7E2 j (t+1)).coeff (t+1) := by
   rw [lift_poly_coeffM7E2,reverseLiftMAE9,if_pos le_rfl,Nat.sub_self]
   have h := lift_binomial_lowerM964 j (t+1) 0
   simp only [Nat.choose_zero_right,Nat.cast_one,mul_one] at h
   exact hbase.trans h
 have h1 : B*j ≤ (liftPolyM7E2 j (t+1)).coeff t := by
   rw [lift_poly_coeffM7E2,reverseLiftMAE9,if_pos (by omega),show t+1-t=1 by omega]
   have h := lift_binomial_lowerM964 j (t+1) 1
   simp only [Nat.choose_one_right] at h
   exact (mul_le_mul_of_nonneg_right hbase (Nat.cast_nonneg j)).trans h
 rw [twinLiftM964,coeff_add,coeff_add,coeff_C_mul,coeff_C_mul,coeff_X_pow,coeff_X_pow]
 by_cases hk : k=t+1
 · subst k
   simp only [ite_true,if_neg (show t+1≠t by omega),mul_one,mul_zero,add_zero]
   have H := mul_le_mul ha h0 hB hU
   nlinarith only [H]
 · by_cases hk' : k=t
   · subst k
     simp only [if_neg (show t≠t+1 by omega),ite_true,mul_zero,mul_one,add_zero]
     have H := mul_le_mul_of_nonneg_left hv hB
     have H' := mul_le_mul_of_nonneg_left h1 hU
     nlinarith only [H,H']
   · simp only [if_neg hk,if_neg hk',mul_zero,add_zero]
     have H := mul_nonneg hU (lift_nonnegM964 j (t+1) k)
     nlinarith only [H]

theorem twin_all_cutsM964 (j t : ℕ) (a b c v B U : ℝ)
 (hj : t+1 ≤ j) (hB : 0 < B) (hU : 0 ≤ U)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hv : 0 ≤ v)
 (hau : a ≤ U) (hcu : c ≤ U) (hvu : v ≤ U*j)
 (hbase : B ≤ ((t+1+j+3).choose j:ℝ))
 (hmargin : (B+U)^2*kernelScaleMA64 j (t+1) ≤
   B^2*kernelScaleMA64 j (t+1)+(B+U)^2*topGapMA64 j (t+1))
 (h k : ℕ) :
 0 ≤ ((cutPolyMFEE h (twinLiftM964 j (t+1) b v))^2-
   cutPolyMFEE h (twinLiftM964 j t a v)*cutPolyMFEE h (twinLiftM964 j (t+2) c v)).coeff k := by
 have hM : 0 < kernelScaleMA64 j (t+1) := by
   unfold kernelScaleMA64
   rw [complete_coeffMA64]
   have hp : (0:ℝ) < liftTermMAE9 j (t+1+1) 0 := by
     exact_mod_cast lift_term_positiveMAD5 j (t+1+1) 0 (by omega)
   positivity
 apply robust_cutM964 (liftPolyM7E2 j (t+1)) (liftPolyM7E2 j (t+2))
   (liftPolyM7E2 j (t+3)) _ _ _ (kernelScaleMA64 j (t+1)) (topGapMA64 j (t+1)) B (B+U)
   hM hB (by linarith)
 · exact fun k => twin_nonnegM964 j t k a v ha hv
 · exact lift_nonnegM964 j (t+2)
 · exact lift_nonnegM964 j (t+3)
 · exact fun k => twin_scaledM964 j t k a v B U (by omega) hB.le hU hau hvu hbase
 · exact fun k => twin_ge_liftM964 j (t+1) k b v hb hv
 · intro k
   apply twin_scaledM964 j (t+2) k c v B U (by omega) hB.le hU hcu hvu
   exact hbase.trans (by exact_mod_cast Nat.choose_le_choose j (show t+1+j+3 ≤ t+2+1+j+3 by omega))
 · exact hmargin
 · intro h k
   simpa only [cut_lift_identityMFEE,liftCutGapM7E2,Nat.add_assoc] using
     lift_cut_marginMA64 j (t+1) h k hj

end
end MathGKM.Markov
