import MarkovLiftCutM7E2
/-! Machine-authored fee405c8. Exact shifted cut with arbitrary natural
parameters. The zero extension is kept on both sides. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem lift_cut_shiftMFEE (j h v : ℕ) :
 liftCutM7E2 j (h+v) h = X^h *
   ∑ k ∈ range (v+1), monomial k (liftTermMAE9 j (h+v) (v-k):ℝ) := by
 classical
 ext k
 rw [lift_cut_coeffM7E2,lift_poly_coeffM7E2,coeff_X_pow_mul']
 by_cases hk : h ≤ k
 · rw [if_pos hk,if_pos hk]
   simp only [finsetSum_coeff,coeff_monomial,sum_ite_eq',reverseLiftMAE9]
   by_cases hkv : k ≤ h+v
   · rw [if_pos hkv,if_pos (by simp only [mem_range]; omega)]
     congr 2
     omega
   · rw [if_neg hkv,if_neg (by simp only [mem_range]; omega)]
     simp
 · rw [if_neg hk,if_neg hk]

theorem lift_zero_column_lcMFEE (j t : ℕ) :
 liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 0 ≤ liftTermMAE9 j (t+1) 0^2 := by
 have h := comp_positiveM7E2 _ (q_gap_nonnegM7E2 j t) 0
 rw [sub_comp,pow_comp,mul_comp,coeff_sub,pow_two,coeff_mul,coeff_mul] at h
 simp only [Finset.Nat.antidiagonal_zero,Finset.sum_singleton,q_comp_liftM7E2] at h
 have hh := sub_nonneg.mp h
 simpa only [pow_two] using (show liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 0 ≤
   liftTermMAE9 j (t+1) 0*liftTermMAE9 j (t+1) 0 by exact_mod_cast hh)

theorem lift_cut_boundary_identityMFEE (j t : ℕ) :
 liftCutGapM7E2 j t t = X^(2*t)*(
   C ((liftTermMAE9 j (t+1) 1:ℝ)^2-(liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 2:ℝ))+
   C (2*(liftTermMAE9 j (t+1) 1:ℝ)*(liftTermMAE9 j (t+1) 0:ℝ)-
     (liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 1:ℝ))*X+
   C ((liftTermMAE9 j (t+1) 0:ℝ)^2-(liftTermMAE9 j t 0:ℝ)*(liftTermMAE9 j (t+2) 0:ℝ))*X^2) := by
 have h0 := lift_cut_shiftMFEE j t 0
 have h1 := lift_cut_shiftMFEE j t 1
 have h2 := lift_cut_shiftMFEE j t 2
 simp only [Nat.add_zero] at h0
 rw [liftCutGapM7E2,h0,h1,h2]
 simp only [sum_range_succ,sum_range_zero,Nat.sub_zero,Nat.sub_self,
   show 2-1=1 by rfl,monomial_zero_right,zero_add]
 simp only [←Polynomial.C_mul_X_pow_eq_monomial,pow_zero,pow_one,mul_one,
   Polynomial.C_sub,Polynomial.C_pow,Polynomial.C_mul]
 rw [show 2*t=t+t by omega,pow_add]
 norm_num only [map_ofNat]
 ring

end
end MathGKM.Markov
