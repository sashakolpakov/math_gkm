import MarkovTwoKernelSourceMED6
/-! Machine-authored ed6bdbeb. The base gap cannot absorb both unsigned
vertical endpoint losses, even though the actual source satisfies LC here. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000

theorem unsigned_model_valuesMED6 :
 baseValueM13E 6 false 3 8=3333 ∧ baseValueM13E 6 false 3 9=5368 ∧
 baseValueM13E 6 false 3 10=8254 ∧ correctionValueM13E 6 false 3 8=96 ∧
 correctionValueM13E 6 false 3 9=196 ∧ correctionValueM13E 6 false 3 10=176 := by
 norm_num [baseValueM13E,correctionValueM13E,sourceNME9C,correctionEpsilonM13E,
   lowerDiagMF88,affineKernelM13E,diagSumMDB9,nbSeqMDB9,chooseSeqMDB9,
   rampWeightMF88,affineWeightM13E,sum_range_succ,Nat.choose,Int.toNat]

theorem unsigned_vertical_failureMED6 :
 baseValueM13E 6 false 3 9^2-baseValueM13E 6 false 3 8*baseValueM13E 6 false 3 10-
   baseValueM13E 6 false 3 8*correctionValueM13E 6 false 3 10-
   baseValueM13E 6 false 3 10*correctionValueM13E 6 false 3 8= -74150 := by
 obtain ⟨a,b,c,d,e,f⟩ := unsigned_model_valuesMED6
 rw [a,b,c,d,f]
 norm_num

theorem unsigned_source_witnessMED6 :
 InPolygon 3 20 3 8 ∧ InPolygon 3 20 3 9 ∧ InPolygon 3 20 3 10 ∧
 (threeRawM9E2 6 false 3 8:ℝ)=3429 ∧ (threeRawM9E2 6 false 3 9:ℝ)=5564 ∧
 (threeRawM9E2 6 false 3 10:ℝ)=8430 ∧
 (threeRawM9E2 6 false 3 9:ℝ)^2-
   (threeRawM9E2 6 false 3 8:ℝ)*(threeRawM9E2 6 false 3 10:ℝ)=2051626 := by
 obtain ⟨a,b,c,d,e,f⟩ := unsigned_model_valuesMED6
 rw [source_two_kernelMED6 6 3 8 false (by norm_num) (by norm_num),
   source_two_kernelMED6 6 3 9 false (by norm_num) (by norm_num),
   source_two_kernelMED6 6 3 10 false (by norm_num) (by norm_num),a,b,c,d,e,f]
 norm_num [InPolygon]

end
end MathGKM.Markov
