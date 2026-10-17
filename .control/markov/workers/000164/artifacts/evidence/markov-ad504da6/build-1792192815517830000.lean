import MarkovSymmetricCutMAD5
import MarkovCutOuterMFEE
/-! Machine-authored ad504da6. Literal lift cuts are common-coordinate cuts
of the complete reversed kernel, with all shifts and zero tails explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem lift_cut_common_shiftMAD5 (j t h s H : ℕ) (hH : H+t=j+h) :
 X^j*liftCutM7E2 j (t+s) h=
 X^t*cutPolyMFEE H (X^s*ePolyM7E2 j (t+s)) := by
 ext k
 rw [coeff_X_pow_mul',coeff_X_pow_mul']
 by_cases hk : j+h ≤ k
 · rw [if_pos (by omega),if_pos (by omega),lift_cut_coeffM7E2,
     if_pos (by omega),lift_poly_coeffM7E2,cut_poly_coeffMFEE,if_pos (by omega),
     coeff_X_pow_mul']
   by_cases hs : t+s ≤ k
   · rw [if_pos (by omega)]
     by_cases htop : k ≤ j+t+s
     · rw [reverseLiftMAE9,if_pos (by omega),e_poly_coeffM7E2 _ _ _ (by omega)]
       congr 2
       omega
     · rw [reverseLiftMAE9,if_neg (by omega),e_poly_tailM7E2 _ _ _ (by omega)]
       simp
   · rw [if_neg (by omega),reverseLiftMAE9,if_pos (by omega),
       lift_term_tailM7E2 _ _ _ (by omega)]
     simp
 · by_cases hj : j ≤ k
   · rw [if_pos hj,lift_cut_coeffM7E2,if_neg (by omega)]
   · rw [if_neg hj]
   all_goals
     by_cases ht : t ≤ k
     · rw [if_pos ht,cut_poly_coeffMFEE,if_neg (by omega)]
     · rw [if_neg ht]

def ShiftedPairOrderMAD5 : Prop := ∀ j t,
 PairOrderMAD5 (ePolyM7E2 j t) (X*ePolyM7E2 j (t+1)) (X^2*ePolyM7E2 j (t+2))

theorem shifted_full_gapMAD5 (j t n : ℕ) :
 0 ≤ ((X*ePolyM7E2 j (t+1))^2-ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))).coeff n := by
 have he : (X*ePolyM7E2 j (t+1))^2-ePolyM7E2 j t*(X^2*ePolyM7E2 j (t+2))=
   X^2*(ePolyM7E2 j (t+1)^2-ePolyM7E2 j t*ePolyM7E2 j (t+2)) := by ring
 rw [he,coeff_X_pow_mul']
 split_ifs
 · exact e_gap_nonnegM7E2 j t _
 · exact le_rfl

theorem lift_middle_of_pair_orderMAD5 (ho : ShiftedPairOrderMAD5) : LiftMiddleMFEE := by
 intro j t h k hht htjh
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
 have hc := congrArg (fun P : ℝ[X] => P.coeff (2*j+k)) he
 rw [coeff_X_pow_mul',if_pos (by omega),show 2*j+k-2*j=k by omega,
   coeff_X_pow_mul'] at hc
 rw [hc]
 split_ifs
 · apply symmetric_cut_nonnegMAD5
   · exact e_coeff_nonnegMFEE j t
   · intro n
     rw [show X*ePolyM7E2 j (t+1)=X^1*ePolyM7E2 j (t+1) by simp,coeff_X_pow_mul']
     split_ifs
     · exact e_coeff_nonnegMFEE j (t+1) _
     · exact le_rfl
   · intro n
     rw [coeff_X_pow_mul']
     split_ifs
     · exact e_coeff_nonnegMFEE j (t+2) _
     · exact le_rfl
   · exact shifted_full_gapMAD5 j t
   · exact ho j t
 · exact le_rfl

end
end MathGKM.Markov
