import MarkovDriftClosedM5BF
/-! Machine-authored 5bf6837d. The fixed quarter-drop shortcut is false.
The actual required drift is positive at this auxiliary witness. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000
set_option maxRecDepth 10000

theorem quarter_drop_beforeM5BF : reverseVarianceM1C6 22 5 21=2668474283/272959244 := by
 norm_num [reverseVarianceM1C6,reverseMomentM1C6,reverseConvMBEC,reverseKernelMBEC,
   qWeightM7E2,sum_range_succ,Nat.descFactorial_succ]

theorem quarter_drop_afterM5BF : reverseVarianceM1C6 22 5 22=4129805/433571 := by
 norm_num [reverseVarianceM1C6,reverseMomentM1C6,reverseConvMBEC,reverseKernelMBEC,
   qWeightM7E2,sum_range_succ,Nat.descFactorial_succ]

theorem quarter_drop_failsM5BF :
 reverseVarianceM1C6 22 5 22+1/4<reverseVarianceM1C6 22 5 21 := by
 rw [quarter_drop_afterM5BF,quarter_drop_beforeM5BF]
 norm_num

theorem quarter_drop_shortcut_falseM5BF : ¬(∀ j s h : ℕ, 1 ≤ h → h ≤ j →
 reverseVarianceM1C6 j s (h-1) ≤ reverseVarianceM1C6 j s h+1/4) := by
 intro H
 exact (not_le_of_gt quarter_drop_failsM5BF) (H 22 5 22 (by omega) (by omega))

theorem quarter_witness_driftM5BF :
 varianceDriftM1C6 22 5 22=281228064706395/29586803095081 := by
 norm_num only [varianceDriftM1C6,reverseCenterM1C6,Nat.reduceSub,
   quarter_drop_beforeM5BF,quarter_drop_afterM5BF]

theorem quarter_witness_required_inequalityM5BF : 0<varianceDriftM1C6 22 5 22 := by
 rw [quarter_witness_driftM5BF]
 norm_num

end
end MathGKM.Markov
