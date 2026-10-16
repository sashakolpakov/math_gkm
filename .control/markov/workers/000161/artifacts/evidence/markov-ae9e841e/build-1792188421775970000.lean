import MarkovColumn1MAE9
import MarkovColumn2MAE9
import MarkovLowSourceME9C
/-! Machine-authored ae9e841e. A failed auxiliary midpoint route, separated
from the actual source triple, which satisfies the required raw inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem lift_small_valuesMAE9 :
 liftTermMAE9 1 0 0=8 ∧ liftTermMAE9 1 2 1=6 ∧
 liftTermMAE9 1 1 1=5 ∧ liftTermMAE9 1 1 0=9 := by
 norm_num [liftTermMAE9,Nat.choose_succ_succ,Nat.choose_zero_succ]

theorem lift_midpoint_failureMAE9 :
 liftTermMAE9 1 1 1*liftTermMAE9 1 1 0 <
   liftTermMAE9 1 0 0*liftTermMAE9 1 2 1 := by
 obtain ⟨h0,h1,h2,h3⟩ := lift_small_valuesMAE9
 rw [h0,h1,h2,h3]
 norm_num

theorem lift_source_tripleMAE9 :
 threeRawM9E2 1 true 3 1=8 ∧ threeRawM9E2 1 true 4 1=14 ∧
   threeRawM9E2 1 true 5 1=6 := by
 have h0 := source_low_threeME9C 1 true (by omega) 1 (by omega)
 have h1 := source_column1MAE9 1 1 true (by omega)
 have h2 := source_column2MAE9 1 1 true (by omega)
 norm_num [sourceNME9C,lowThreeME9C,column1MAE9,column2MAE9] at h0 h1 h2
 exact ⟨by exact_mod_cast h0,by exact_mod_cast h1,by exact_mod_cast h2⟩

theorem lift_source_validMAE9 :
 InPolygon 3 4 3 1 ∧ InPolygon 3 4 4 1 ∧ InPolygon 3 4 5 1 ∧
 threeRawM9E2 1 true 3 1*threeRawM9E2 1 true 5 1 ≤ threeRawM9E2 1 true 4 1^2 := by
 obtain ⟨h0,h1,h2⟩ := lift_source_tripleMAE9
 rw [h0,h1,h2]
 norm_num [InPolygon]

end
end MathGKM.Markov
