import MarkovTransposedSharpMBE3
/-! Machine-authored be355177. The exact coefficient-zero relative margin is
an explicit unproved candidate. Its transport to every lower tail cut is proved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def SharpCompleteMarginMBE3 : Prop := ∀ j s n : ℕ,
 (liftTermMAE9 j (s+1) 0:ℝ)^2*
   (completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff n ≤
 (liftTermMAE9 j s 0:ℝ)*(liftTermMAE9 j (s+2) 0:ℝ)*
   (completeLiftMA64 j (s+1)^2).coeff n

def sharpGapMBE3 (j s : ℕ) : ℝ := (liftTermMAE9 j (s+1) 0:ℝ)^2-
 (liftTermMAE9 j s 0:ℝ)*(liftTermMAE9 j (s+2) 0:ℝ)

theorem sharp_complete_marginMBE3 (H : SharpCompleteMarginMBE3) (j s n : ℕ) :
 sharpGapMBE3 j s*(completeLiftMA64 j (s+1)^2).coeff n ≤
 kernelScaleMA64 j s*(completeLiftMA64 j (s+1)^2-
   completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff n := by
 have h := H j s n
 rw [kernelScaleMA64,complete_coeffMA64,sharpGapMBE3,coeff_sub]
 nlinarith only [h]

theorem sharp_reversed_marginMBE3 (H : SharpCompleteMarginMBE3) (j t k : ℕ) :
 sharpGapMBE3 j t*(ePolyM7E2 j (t+1)^2).coeff k ≤
 kernelScaleMA64 j t*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)).coeff k := by
 have hB : ePolyM7E2 j (t+1)^2=reflect (j+j) (completeLiftMA64 j (t+1)^2) := by
   unfold completeLiftMA64
   rw [pow_two,pow_two,reflect_mul _ _ (q_comp_degreeM7E2 j (t+1)) (q_comp_degreeM7E2 j (t+1))]
   rfl
 rw [e_gap_identityM7E2,hB,Polynomial.sub_comp,Polynomial.pow_comp,Polynomial.mul_comp,
   coeff_reflect,coeff_reflect]
 exact sharp_complete_marginMBE3 H j t _

theorem sharp_shifted_marginMBE3 (H : SharpCompleteMarginMBE3) (j t k : ℕ) :
 sharpGapMBE3 j t*((X*ePolyM7E2 j (t+1))^2).coeff k ≤
 kernelScaleMA64 j t*((X*ePolyM7E2 j (t+1))^2-
   ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))).coeff k := by
 have he : (X*ePolyM7E2 j (t+1))^2-ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))=
   X^2*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)) := by ring
 rw [he,mul_pow,coeff_X_pow_mul',coeff_X_pow_mul']
 split_ifs
 · exact sharp_reversed_marginMBE3 H j t _
 · simp

theorem sharp_cut_marginMBE3 (H : SharpCompleteMarginMBE3) (j t h k : ℕ) (htj : t ≤ j) :
 sharpGapMBE3 j t*(liftCutM7E2 j (t+1) h^2).coeff k ≤
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
 · exact sharp_shifted_marginMBE3 H j t


end
end MathGKM.Markov
