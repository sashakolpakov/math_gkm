import MarkovSharpTransportMBE3
/-! Machine-authored be355177. Failures of sufficient auxiliary shortcuts,
contrasted with positive full margins and an actual raw source triple. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000
set_option maxRecDepth 4096

theorem old_margin_negativeMBE3 :
 bandBaseMBE3 0 1 3 false*bandBaseMBE3 0 1 5 false*kernelScaleMA64 5 3-
 bandTopMBE3 0 1 3 false*bandTopMBE3 0 1 5 false*
   (kernelScaleMA64 5 3-topGapMA64 5 3) = -2317213022124 := by
 norm_num [bandBaseMBE3,bandTopMBE3,bandJMBE3,transposedBudgetMBE3,
   absorbedExtraM418,correctionTermM657,kernelScaleMA64,complete_coeffMA64,
   topGapMA64,liftTermMAE9,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.choose_zero_right]

theorem sharp_top_positiveMBE3 :
 bandBaseMBE3 0 1 4 false^2-bandTopMBE3 0 1 3 false*bandTopMBE3 0 1 5 false=210586 := by
 norm_num [bandBaseMBE3,bandTopMBE3,bandJMBE3,transposedBudgetMBE3,
   absorbedExtraM418,correctionTermM657,liftTermMAE9,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.choose_zero_right]

theorem normalized_pair_negativeMBE3 :
 2*(liftTermMAE9 6 0 0:ℝ)*liftTermMAE9 6 2 0*liftTermMAE9 6 1 0*liftTermMAE9 6 1 6-
 (liftTermMAE9 6 1 0:ℝ)^2*
   ((liftTermMAE9 6 0 0:ℝ)*liftTermMAE9 6 2 6+(liftTermMAE9 6 0 6:ℝ)*liftTermMAE9 6 2 0)
 = -1916804736 := by
 norm_num [liftTermMAE9,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.choose_zero_right]

theorem normalized_complete_positiveMBE3 :
 (liftTermMAE9 6 0 0:ℝ)*liftTermMAE9 6 2 0*(completeLiftMA64 6 1^2).coeff 6-
 (liftTermMAE9 6 1 0:ℝ)^2*(completeLiftMA64 6 0*completeLiftMA64 6 2).coeff 6
 = 52158473438400 := by
 simp only [pow_two,coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
   complete_coeffMA64]
 norm_num [sum_range_succ,liftTermMAE9,Nat.choose_succ_succ,
   Nat.choose_zero_succ,Nat.choose_zero_right]

theorem source_three_eleven_valuesMBE3 :
 threeRawM9E2 3 false 6 5=8652 ∧ threeRawM9E2 3 false 7 5=5280 ∧
 threeRawM9E2 3 false 8 5=1287 := by
 have hv (s : ℕ) := source_band_outputM657 0 1 s false (by norm_num)
 norm_num at hv
 rw [show (6:ℕ)=3+3 by rfl,hv 3,show (7:ℕ)=4+3 by rfl,hv 4,
   show (8:ℕ)=5+3 by rfl,hv 5]
 norm_num [bandOutputM657,liftOutputMAE9,correctionLiftM657,liftTermMAE9,
   sum_range_succ,Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.choose_zero_right]

theorem source_three_eleven_polygonMBE3 :
 InPolygon 3 11 6 5 ∧ InPolygon 3 11 7 5 ∧ InPolygon 3 11 8 5 := by
 norm_num [InPolygon]

theorem source_three_eleven_gapMBE3 :
 threeRawM9E2 3 false 7 5^2-threeRawM9E2 3 false 6 5*threeRawM9E2 3 false 8 5=16743276 := by
 rcases source_three_eleven_valuesMBE3 with ⟨h0,h1,h2⟩
 rw [h0,h1,h2]
 norm_num

theorem source_three_eleven_pathMBE3 :
 (frame (threePathM9E2 2 false)).mid.a=3 ∧
 (frame (threePathM9E2 2 false)).mid.b=11 ∧
 coeff (frame (threePathM9E2 2 false)).mid.p 6 5=8652 ∧
 coeff (frame (threePathM9E2 2 false)).mid.p 7 5=5280 ∧
 coeff (frame (threePathM9E2 2 false)).mid.p 8 5=1287 := by
 have hl := three_path_labelsM9E2 2 false
 have hp := three_path_polynomialM9E2 2 false
 norm_num only [Nat.reduceAdd,Nat.reduceMul,Bool.false_eq_true,if_false] at hl hp
 refine ⟨hl.1,hl.2,?_⟩
 rw [hp]
 simpa only [three_raw_formulaM9E2] using source_three_eleven_valuesMBE3

end
end MathGKM.Markov
