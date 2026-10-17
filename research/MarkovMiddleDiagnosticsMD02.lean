import MarkovMiddleCrossObstructionMD02
/-! Machine-authored d0292f14. Exact actual-source diagnostics. All raw
inequalities here hold; the reversed inequalities concern auxiliary claims. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem middle_example_26MD02 :
 threeRawM9E2 8 false 3 15=44136 ∧
 threeRawM9E2 8 false 4 15=824160 ∧
 threeRawM9E2 8 false 5 15=7921380 := by
 have h0 := source_middle_integerMD02 0 2 0 false
 have h1 := source_middle_integerMD02 0 2 1 false
 have h2 := source_middle_integerMD02 0 2 2 false
 norm_num [middleBaseMD02,sourceNME9C,middleRawMD02,topShortSumMEB6,
   correctionShortMD02,middleKernelMD02,sum_range_succ,Nat.choose] at h0 h1 h2
 exact ⟨h0,h1,h2⟩

theorem middle_example_crossMD02 :
 middleCrossGapMD02 0 2 false 0= -887194560 ∧
 middleGapMD02 false 0 0 2=329621677920 := by
 norm_num [middleCrossGapMD02,middleTemplateMD02,middleCorrMD02,middleGapMD02,
   middleBaseMD02,middleRawMD02,topShortSumMEB6,correctionShortMD02,middleKernelMD02,
   sum_range_succ,Nat.choose]

theorem actual_path_26MD02 :
 (frame (threePathM9E2 7 false)).mid.a=3 ∧
 (frame (threePathM9E2 7 false)).mid.b=26 ∧
 InPolygon 3 26 3 15 ∧ InPolygon 3 26 4 15 ∧ InPolygon 3 26 5 15 ∧
 coeff (frame (threePathM9E2 7 false)).mid.p 4 15^2-
 coeff (frame (threePathM9E2 7 false)).mid.p 3 15*
 coeff (frame (threePathM9E2 7 false)).mid.p 5 15=329621677920 := by
 have hl := three_path_labelsM9E2 7 false
 norm_num at hl
 refine ⟨hl.1,hl.2,by norm_num [InPolygon],by norm_num [InPolygon],by norm_num [InPolygon],?_⟩
 rw [three_path_polynomialM9E2]
 simp only [three_raw_formulaM9E2]
 obtain ⟨h0,h1,h2⟩ := middle_example_26MD02
 rw [h0,h1,h2]
 norm_num

theorem middle_example_20MD02 :
 threeRawM9E2 6 false 3 12=15463 ∧
 threeRawM9E2 6 false 4 12=161860 ∧
 threeRawM9E2 6 false 5 12=854028 := by
 have h0 := source_middle_integerMD02 0 1 0 false
 have h1 := source_middle_integerMD02 0 1 1 false
 have h2 := source_middle_integerMD02 0 1 2 false
 norm_num [middleBaseMD02,sourceNME9C,middleRawMD02,topShortSumMEB6,
   correctionShortMD02,middleKernelMD02,sum_range_succ,Nat.choose] at h0 h1 h2
 exact ⟨h0,h1,h2⟩

theorem factorial_shortcut_failureMD02 :
 threeRawM9E2 6 false 4 12^2-threeRawM9E2 6 false 3 12*threeRawM9E2 6 false 5 12=
 12992824636 ∧
 threeRawM9E2 6 false 4 12^2-2*threeRawM9E2 6 false 3 12*threeRawM9E2 6 false 5 12=
 -213010328 := by
 obtain ⟨h0,h1,h2⟩ := middle_example_20MD02
 rw [h0,h1,h2]
 norm_num

end
end MathGKM.Markov
