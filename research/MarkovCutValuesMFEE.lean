import MarkovCutRationalMFEE
/-! Machine-authored fee405c8. Exact source-kernel normalization, including
all parameter steps used in the first truncation band. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem lift_normalizedMFEE (j t m : ℕ) (hm : m ≤ j) :
 (liftTermMAE9 j t m:ℚ)=((t+j+3).choose j:ℚ)*(j.choose m:ℚ)*
   liftWeightMAE9 j t m/liftDenMAE9 t m := by
 have hd : liftDenMAE9 t m≠0 := by unfold liftDenMAE9; positivity
 apply (eq_div_iff hd).mpr
 have h := lift_scaledMAE9 j t m hm
 linear_combination h

theorem base_choose_stepMFEE (j t : ℕ) :
 ((t+1+j+3).choose j:ℚ)=((t+j+3).choose j:ℚ)*(t+j+4)/(t+4) := by
 have h := Nat.choose_mul_succ_eq (t+j+3) j
 rw [show t+j+3+1-j=t+4 by omega] at h
 have hh : ((t+1+j+3).choose j:ℚ)*(t+4)=((t+j+3).choose j:ℚ)*(t+j+4) := by
   exact_mod_cast (by simpa only [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using h.symm)
 exact (eq_div_iff (by positivity : (t:ℚ)+4≠0)).mpr hh

theorem base_choose_twoMFEE (j t : ℕ) :
 ((t+2+j+3).choose j:ℚ)=((t+j+3).choose j:ℚ)*(t+j+4)*(t+j+5)/((t+4)*(t+5)) := by
 have h := base_choose_stepMFEE j (t+1)
 rw [show t+1+1=t+2 by omega,base_choose_stepMFEE j t] at h
 push_cast at h
 rw [h]
 simp only [div_eq_mul_inv,mul_inv_rev]
 ring

theorem cut_kernel_valuesMFEE (j t : ℕ) (hj : 2 ≤ j) :
 (liftTermMAE9 j t 0:ℚ)=((t+j+3).choose j:ℚ)*cutBaseMFEE j t ∧
 (liftTermMAE9 j (t+1) 0:ℚ)=((t+j+3).choose j:ℚ)*cutNext0MFEE j t ∧
 (liftTermMAE9 j (t+1) 1:ℚ)=((t+j+3).choose j:ℚ)*cutNext1MFEE j t ∧
 (liftTermMAE9 j (t+2) 1:ℚ)=((t+j+3).choose j:ℚ)*cutLast1MFEE j t ∧
 (liftTermMAE9 j (t+2) 2:ℚ)=((t+j+3).choose j:ℚ)*cutLast2MFEE j t := by
 have h0 := lift_normalizedMFEE j t 0 (by omega)
 have h10 := lift_normalizedMFEE j (t+1) 0 (by omega)
 have h11 := lift_normalizedMFEE j (t+1) 1 (by omega)
 have h21 := lift_normalizedMFEE j (t+2) 1 (by omega)
 have h22 := lift_normalizedMFEE j (t+2) 2 hj
 rw [base_choose_stepMFEE] at h10 h11
 rw [base_choose_twoMFEE] at h21 h22
 simp only [Nat.choose_zero_right,Nat.choose_one_right,Nat.cast_one,Nat.cast_zero,
   Nat.cast_choose_two,Nat.cast_add,Nat.cast_ofNat] at h0 h10 h11 h21 h22
 refine ⟨?_,?_,?_,?_,?_⟩
 · rw [h0]; unfold cutBaseMFEE; simp only [div_eq_mul_inv,mul_inv_rev]; ring
 · rw [h10]; unfold cutNext0MFEE; simp only [div_eq_mul_inv,mul_inv_rev]; ring
 · rw [h11]; unfold cutNext1MFEE; simp only [div_eq_mul_inv,mul_inv_rev]; ring
 · rw [h21]; unfold cutLast1MFEE; simp only [div_eq_mul_inv,mul_inv_rev]; ring
 · rw [h22]; unfold cutLast2MFEE; simp only [div_eq_mul_inv,mul_inv_rev]; ring

theorem cut_kernel_zeroMFEE (j t : ℕ) (hj : 2 ≤ j) :
 liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 2 ≤ liftTermMAE9 j (t+1) 1^2 := by
 have hs : (0:ℚ) ≤ (j:ℚ)-2 := by
   have hq : (2:ℚ) ≤ j := by exact_mod_cast hj
   linarith
 have h := cut_rational_zeroMFEE t ((j:ℚ)-2) (by positivity) hs
 rw [show (j:ℚ)-2+2=j by ring] at h
 have hh := mul_le_mul_of_nonneg_left h (sq_nonneg (((t+j+3).choose j:ℚ)))
 rcases cut_kernel_valuesMFEE j t hj with ⟨h0,h10,h11,h21,h22⟩
 have he : (liftTermMAE9 j t 0:ℚ)*(liftTermMAE9 j (t+2) 2:ℚ) ≤
   (liftTermMAE9 j (t+1) 1:ℚ)^2 := by rw [h0,h11,h22]; nlinarith only [hh]
 exact_mod_cast he

theorem cut_kernel_oneMFEE (j t : ℕ) (hj : 2 ≤ j) :
 liftTermMAE9 j t 0*liftTermMAE9 j (t+2) 1 ≤
   2*liftTermMAE9 j (t+1) 1*liftTermMAE9 j (t+1) 0 := by
 have hs : (0:ℚ) ≤ (j:ℚ)-2 := by
   have hq : (2:ℚ) ≤ j := by exact_mod_cast hj
   linarith
 have h := cut_rational_oneMFEE t ((j:ℚ)-2) (by positivity) hs
 rw [show (j:ℚ)-2+2=j by ring] at h
 have hh := mul_le_mul_of_nonneg_left h (sq_nonneg (((t+j+3).choose j:ℚ)))
 rcases cut_kernel_valuesMFEE j t hj with ⟨h0,h10,h11,h21,h22⟩
 have he : (liftTermMAE9 j t 0:ℚ)*(liftTermMAE9 j (t+2) 1:ℚ) ≤
   2*(liftTermMAE9 j (t+1) 1:ℚ)*(liftTermMAE9 j (t+1) 0:ℚ) := by
   rw [h0,h10,h11,h21]; nlinarith only [hh]
 exact_mod_cast he

end
end MathGKM.Markov
