import MarkovTopSteinBalanceM208
/-! Machine-authored 20825094. The unrestricted untruncated-q shortcut fails;
the actual cut group at the same sector parameters is positive. Not a source
counterexample to Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000
set_option maxRecDepth 10000

theorem stein_unrestricted_base_negativeM208 :
 (∑ k ∈ range 8, steinPairM208 4 1 7 k*betaGroupScalarMCA9 4 1 7 k)<0 := by
 norm_num [sum_range_succ,steinPairM208,steinDensityM208,betaGroupScalarMCA9,
   betaScalarMCA9,betaQSeqMDCB,Nat.choose_eq_descFactorial_div_factorial,
   Nat.descFactorial,Nat.factorial]

theorem stein_actual_group_positiveM208 : 0 < betaGroupMCA9 4 1 5 7 := by
 norm_num [betaGroupMCA9,sum_range_succ,betaBaseWeightMCA9,betaPairLikelihoodMCA9,
   betaLikelihoodMDCB,betaWeightMDCB,betaGroupScalarMCA9,betaScalarMCA9,
   betaQSeqMDCB,Nat.choose_eq_descFactorial_div_factorial,Nat.descFactorial,Nat.factorial]

theorem stein_obstruction_sectorM208 :
 (1:ℕ)+5 ≤ 4+2 ∧ (4:ℕ)+1 < 1+4*5 ∧ (5:ℕ) ≤ 7 ∧ (7:ℕ)+2 ≤ 2*5 := by norm_num

end
end MathGKM.Markov
