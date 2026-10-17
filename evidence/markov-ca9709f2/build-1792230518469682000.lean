import MarkovTopWeightedBetaMeanMCA9
import MarkovTopEndGroupsMCA9
/-! Machine-authored ca9709f2. A failed auxiliary p-tilt shortcut inside
the parameter sector, alongside positivity of the actual terminal group.
This is not a source-family counterexample to Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem beta_p_tilt_valueMCA9 :
 betaWeightedSumMCA9 3 98 0 65 = -1340117822782233600 := by
 have h := beta_weighted_sum_clearedMCA9 3 98 0 65
 rw [beta_massMDCB] at h
 norm_num [betaWeightedPolynomialMCA9] at h
 omega

theorem beta_p_tilt_obstructionMCA9 :
 betaWeightedSumMCA9 3 98 0 65 < 0 ∧ 0 < betaGroupMCA9 50 3 49 98 := by
 constructor
 · rw [beta_p_tilt_valueMCA9]
   norm_num
 · exact beta_group_last_positiveMCA9 50 3 49 (by norm_num)

theorem beta_p_tilt_sectorMCA9 :
 (3:ℕ)+49 ≤ 50+2 ∧ (50:ℕ)+1 < 3+4*49 ∧ (3:ℕ)+1=4 ∧ (50:ℕ)+2*3+9=65 := by
 norm_num

end
end MathGKM.Markov
