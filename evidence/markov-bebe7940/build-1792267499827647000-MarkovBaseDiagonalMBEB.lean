import MarkovBaseCertificateMBEB
import MarkovBaseShapeMED6
/-! Machine-authored bebe7940. The missing parameter-zero case completes
the base-kernel diagonal inequality, with all unbounded indices and tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

theorem lower_zero_diagonalMBEB (j k : ℕ) :
 lowerDiagMF88 0 (j+2) k*lowerDiagMF88 2 j k ≤ lowerDiagMF88 1 (j+1) k^2 := by
 by_cases hu : k+3≤j
 · exact lower_zero_upper_diagonalM9F23 j k hu
 by_cases hl : j+2≤k
 · let h := k-j-2
   have hk : k=j+2+h := by dsimp [h]; omega
   have he := lower_lift_lcMBEB j h
   have heR : (liftOutputMAE9 h (j+2) 0:ℝ)*(liftOutputMAE9 (h+4) j 2:ℝ) ≤
       (liftOutputMAE9 (h+2) (j+1) 1:ℝ)^2 := by exact_mod_cast he
   rw [lower_liftMBEB 0 (j+2) k (by omega),
     lower_liftMBEB 2 j k (by omega),lower_liftMBEB 1 (j+1) k (by omega)]
   simpa only [show 0+k-(j+2)=h by omega,show 2+k-j=h+4 by omega,
     show 1+k-(j+1)=h+2 by omega] using heR
 have hr : k=j+1 ∨ k=j ∨ j=k+1 ∨ j=k+2 := by omega
 rcases hr with h|h|h|h
 · subst k
   rw [lower_shortMBEB 0 (j+2) (j+1) 4 (by omega),
     lower_shortMBEB 1 (j+1) (j+1) 4 (by omega),
     lower_shortMBEB 2 j (j+1) 4 (by omega)]
   have he := short_gap_transferMBEB 4 1 short_gap_certificatesMBEB.1 j
   simpa only [Nat.add_zero,Nat.zero_add,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using (show (shortValueMBEB 4 (j+1) 0:ℝ)*(shortValueMBEB 4 (j+1+2) 2:ℝ) ≤
     (shortValueMBEB 4 (j+1+1) 1:ℝ)^2 by exact_mod_cast he)
 · subst k
   rw [lower_shortMBEB 0 (j+2) j 5 (by omega),
     lower_shortMBEB 1 (j+1) j 5 (by omega),lower_shortMBEB 2 j j 5 (by omega)]
   have he := short_gap_transferMBEB 5 0 short_gap_certificatesMBEB.2.1 j
   simpa only [Nat.add_zero,Nat.zero_add,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using (show (shortValueMBEB 5 (j+0) 0:ℝ)*(shortValueMBEB 5 (j+0+2) 2:ℝ) ≤
     (shortValueMBEB 5 (j+0+1) 1:ℝ)^2 by exact_mod_cast he)
 · subst j
   rw [lower_shortMBEB 0 (k+1+2) k 6 (by omega),
     lower_shortMBEB 1 (k+1+1) k 6 (by omega),lower_shortMBEB 2 (k+1) k 6 (by omega)]
   have he := short_gap_transferMBEB 6 0 short_gap_certificatesMBEB.2.2.1 k
   simpa only [Nat.add_zero,Nat.zero_add,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using (show (shortValueMBEB 6 (k+0) 0:ℝ)*(shortValueMBEB 6 (k+0+2) 2:ℝ) ≤
     (shortValueMBEB 6 (k+0+1) 1:ℝ)^2 by exact_mod_cast he)
 · subst j
   rw [lower_shortMBEB 0 (k+2+2) k 7 (by omega),
     lower_shortMBEB 1 (k+2+1) k 7 (by omega),lower_shortMBEB 2 (k+2) k 7 (by omega)]
   have he := short_gap_transferMBEB 7 0 short_gap_certificatesMBEB.2.2.2 k
   simpa only [Nat.add_zero,Nat.zero_add,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm] using (show (shortValueMBEB 7 (k+0) 0:ℝ)*(shortValueMBEB 7 (k+0+2) 2:ℝ) ≤
     (shortValueMBEB 7 (k+0+1) 1:ℝ)^2 by exact_mod_cast he)

theorem lower_parameter_diagonalMBEB (t j k : ℕ) :
 lowerDiagMF88 t (j+2) k*lowerDiagMF88 (t+2) j k ≤ lowerDiagMF88 (t+1) (j+1) k^2 := by
 by_cases ht : t = 0
 · subst t; exact lower_zero_diagonalMBEB j k
 · exact lower_parameter_diagonalM9F23 t j k (by omega)

theorem base_diagonalMBEB (q i j : ℕ) (r : Bool) (hi : 3 ≤ i) :
 baseValueM13E q r i (j+2)*baseValueM13E q r (i+2) j ≤
 baseValueM13E q r (i+1) (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_parameter_diagonalMBEB (i-3) j (sourceNME9C q r-i-j)
   simp only [baseValueM13E,if_pos (show i+(j+2) ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+1+(j+1) ≤ sourceNME9C q r+2 by omega),
     if_pos (show i+2+j ≤ sourceNME9C q r+2 by omega)]
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega,
     show sourceNME9C q r+2-(i+1)-(j+1)=sourceNME9C q r-i-j by omega,
     show sourceNME9C q r+2-(i+2)-j=sourceNME9C q r-i-j by omega,
     show i+1-3=i-3+1 by omega,show i+2-3=i-3+2 by omega]
   exact h
 · have hz : baseValueM13E q r i (j+2)=0 := by
     simp only [baseValueM13E,if_neg (show ¬i+(j+2) ≤ sourceNME9C q r+2 by omega)]
   rw [hz,zero_mul]
   exact sq_nonneg _

end
end MathGKM.Markov
