import MarkovVarianceDriftM1C6
/-! Machine-authored 1c65a306. The monotone-in-h variance shortcut is false
for the actual auxiliary kernel. This is not a source-family refutation. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000
set_option maxRecDepth 10000

theorem variance_witness_beforeM1C6 : reverseVarianceM1C6 15 2 14=152528/25937 := by
 norm_num [reverseVarianceM1C6,reverseMomentM1C6,reverseConvMBEC,reverseKernelMBEC,
   qWeightM7E2,sum_range_succ,Nat.descFactorial_succ]

theorem variance_witness_afterM1C6 : reverseVarianceM1C6 15 2 15=75573/12884 := by
 norm_num [reverseVarianceM1C6,reverseMomentM1C6,reverseConvMBEC,reverseKernelMBEC,
   qWeightM7E2,sum_range_succ,Nat.descFactorial_succ]

theorem variance_decreases_in_hM1C6 : reverseVarianceM1C6 15 2 15 < reverseVarianceM1C6 15 2 14 := by
 rw [variance_witness_beforeM1C6,variance_witness_afterM1C6]
 norm_num

theorem variance_monotone_h_falseM1C6 : ¬ (∀ j s h : ℕ, 1 ≤ h → h ≤ j →
 reverseVarianceM1C6 j s (h-1) ≤ reverseVarianceM1C6 j s h) := by
 intro H
 have hh := H 15 2 15 (by omega) (by omega)
 exact (not_le_of_gt variance_decreases_in_hM1C6) hh

theorem witness_drift_positiveM1C6 : 0 < varianceDriftM1C6 15 2 15 := by
 norm_num only [varianceDriftM1C6,reverseCenterM1C6,Nat.reduceSub,
   variance_witness_beforeM1C6,variance_witness_afterM1C6]
 norm_num

theorem witness_adjacent_holdsM1C6 :
 (qPolyM7E2 15 3^2).coeff 15*(qPolyM7E2 15 2*qPolyM7E2 15 4).coeff 16 ≤
 (qPolyM7E2 15 3^2).coeff 16*(qPolyM7E2 15 2*qPolyM7E2 15 4).coeff 15 := by
 have H := (reverse_adjacent_drift_iffM1C6 15 2 15 (by omega) (by omega)).mpr
   witness_drift_positiveM1C6.le
 exact (reverse_adjacent_iffMBEC 15 2 15 (by omega) (by omega)).mpr H

end
end MathGKM.Markov
