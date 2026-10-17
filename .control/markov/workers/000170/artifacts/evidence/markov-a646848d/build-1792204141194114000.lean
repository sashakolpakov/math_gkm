import MarkovQuantitativeCutMA64
/-! Machine-authored a646848d. Quantitative margin for every inherited lift cut. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem reversed_relative_marginMA64 (j t k : ℕ) :
 topGapMA64 j t*(ePolyM7E2 j (t+1)^2).coeff k ≤
 kernelScaleMA64 j t*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)).coeff k := by
 have hB : ePolyM7E2 j (t+1)^2=reflect (j+j) (completeLiftMA64 j (t+1)^2) := by
   unfold completeLiftMA64
   rw [pow_two,pow_two,reflect_mul _ _ (q_comp_degreeM7E2 j (t+1)) (q_comp_degreeM7E2 j (t+1))]
   rfl
 rw [e_gap_identityM7E2,hB,Polynomial.sub_comp,Polynomial.pow_comp,Polynomial.mul_comp,
   coeff_reflect,coeff_reflect]
 exact complete_relative_marginMA64 j t _

theorem shifted_relative_marginMA64 (j t k : ℕ) :
 topGapMA64 j t*((X*ePolyM7E2 j (t+1))^2).coeff k ≤
 kernelScaleMA64 j t*((X*ePolyM7E2 j (t+1))^2-
   ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))).coeff k := by
 have he : (X*ePolyM7E2 j (t+1))^2-ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))=
   X^2*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)) := by ring
 rw [he,mul_pow,coeff_X_pow_mul',coeff_X_pow_mul']
 split_ifs
 · exact reversed_relative_marginMA64 j t _
 · simp

theorem lift_cut_marginMA64 (j t h k : ℕ) (htj : t ≤ j) :
 topGapMA64 j t*(liftCutM7E2 j (t+1) h^2).coeff k ≤
 kernelScaleMA64 j t*(liftCutGapM7E2 j t h).coeff k := by
 let H := j+h-t
 have hH : H+t=j+h := by dsimp [H]; omega
 have h0 := lift_cut_common_shiftMAD5 j t h 0 H hH
 have h1 := lift_cut_common_shiftMAD5 j t h 1 H hH
 have h2 := lift_cut_common_shiftMAD5 j t h 2 H hH
 simp only [Nat.add_zero,pow_zero,one_mul,pow_one] at h0 h1
 have he : X^(2*j)*liftCutGapM7E2 j t h=
   X^(2*t)*((cutPolyMFEE H (X*ePolyM7E2 j (t+1)))^2-
     cutPolyMFEE H (ePolyM7E2 j t)*cutPolyMFEE H (X^2*ePolyM7E2 j (t+2))) := by
   rw [liftCutGapM7E2,show 2*j=j+j by omega,show 2*t=t+t by omega,pow_add,pow_add]
   calc
    _ = (X^j*liftCutM7E2 j (t+1) h)^2-
      (X^j*liftCutM7E2 j t h)*(X^j*liftCutM7E2 j (t+2) h) := by ring
    _ = _ := by rw [h0,h1,h2]; ring
 have heB : X^(2*j)*liftCutM7E2 j (t+1) h^2=
   X^(2*t)*(cutPolyMFEE H (X*ePolyM7E2 j (t+1)))^2 := by
   rw [show 2*j=j+j by omega,show 2*t=t+t by omega,pow_add,pow_add]
   calc
    _ = (X^j*liftCutM7E2 j (t+1) h)^2 := by ring
    _ = _ := by rw [h1]; ring
 have hv := congrArg (fun P : ℝ[X] => P.coeff (2*j+k)) he
 have hb := congrArg (fun P : ℝ[X] => P.coeff (2*j+k)) heB
 rw [coeff_X_pow_mul',if_pos (by omega),show 2*j+k-2*j=k by omega,
   coeff_X_pow_mul',if_pos (by omega)] at hv hb
 rw [hv,hb]
 apply quantitative_cutMA64
 · unfold kernelScaleMA64; positivity
 · exact e_coeff_nonnegMFEE j t
 · exact shifted_middle_nonnegMAD5 j t
 · exact shifted_right_nonnegMAD5 j t
 · exact shifted_order_of_kernel_stepsMAD5 (kernel_steps_of_rationalMAD5 rational_pair_stepM7A3) j t
 · exact shifted_relative_marginMA64 j t

theorem lift_border_lowerMA64 (j t h : ℕ) (hh : h ≤ t) (htj : t ≤ j) :
 topGapMA64 j t*(liftTermMAE9 j (t+1) 1:ℝ)*(liftTermMAE9 j (t+1) (t+1-h):ℝ) ≤
 kernelScaleMA64 j t*(liftCutGapM7E2 j t h).coeff (t+h) := by
 have hn (i : ℕ) : 0 ≤ (liftCutM7E2 j (t+1) h).coeff i := by
   rw [lift_cut_coeffM7E2]
   split_ifs
   · rw [lift_poly_coeffM7E2,reverseLiftMAE9]
     split_ifs
     · unfold liftTermMAE9; positivity
     · simp
   · exact le_rfl
 have hs : (liftCutM7E2 j (t+1) h).coeff t*(liftCutM7E2 j (t+1) h).coeff h ≤
   (liftCutM7E2 j (t+1) h^2).coeff (t+h) := by
   rw [pow_two,coeff_mul]
   exact single_le_sum (a:=(t,h)) (f:=fun p : ℕ×ℕ => (liftCutM7E2 j (t+1) h).coeff p.1*
     (liftCutM7E2 j (t+1) h).coeff p.2)
     (fun p _ => mul_nonneg (hn p.1) (hn p.2)) (mem_antidiagonal.mpr rfl)
 simp only [lift_cut_coeffM7E2,if_pos hh,if_pos (le_refl h),lift_poly_coeffM7E2,
   reverseLiftMAE9,if_pos (show t ≤ t+1 by omega),if_pos (show h ≤ t+1 by omega),
   show t+1-t=1 by omega] at hs
 have hm := mul_le_mul_of_nonneg_left hs (top_gap_nonnegMA64 j t)
 have hf := lift_cut_marginMA64 j t h (t+h) htj
 nlinarith only [hm,hf]

end
end MathGKM.Markov
