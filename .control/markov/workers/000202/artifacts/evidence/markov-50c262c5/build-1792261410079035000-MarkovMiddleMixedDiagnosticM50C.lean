import MarkovMiddleModelM50C
/-! Machine-authored 50c262c5. Actual-source negative mixed terms in a proposed
sum argument. The full source inequalities remain strictly satisfied. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem source_small_valuesM50C :
 threeRawM9E2 2 false 3 1=8 ∧ threeRawM9E2 2 false 3 2=34 ∧
 threeRawM9E2 2 false 3 3=108 ∧ threeRawM9E2 2 false 4 2=179 ∧
 threeRawM9E2 2 false 5 1=130 := by
 norm_num [threeRawM9E2,threeProductRawM9E2,biConvM9E2,fibRawM9E2,
   addSRawM9E2,shiftRawM9E2,sum_range_succ,Nat.choose]

theorem model_small_valuesM50C :
 lowerDiagMF88 0 1 6=8 ∧ lowerDiagMF88 0 2 5=34 ∧
 lowerDiagMF88 0 3 4=104 ∧ lowerDiagMF88 1 2 4=179 ∧ lowerDiagMF88 2 1 4=130 := by
 norm_num [lowerDiagMF88,diagSumMDB9,nbSeqMDB9,chooseSeqMDB9,rampWeightMF88,
   sum_range_succ,Nat.choose,Int.toNat]

def sourceModelM50C (q : ℕ) (r : Bool) (i j : ℕ) : ℝ :=
 if 3 ≤ i ∧ i+j ≤ sourceNME9C q r+2 then
   lowerDiagMF88 (i-3) j (sourceNME9C q r+2-i-j) else 0
def sourceExcessM50C (q : ℕ) (r : Bool) (i j : ℕ) : ℝ :=
 (threeRawM9E2 q r i j:ℝ)-sourceModelM50C q r i j

theorem source_mixed_vertical_negativeM50C :
 2*sourceModelM50C 2 false 3 2*sourceExcessM50C 2 false 3 2-
 sourceModelM50C 2 false 3 1*sourceExcessM50C 2 false 3 3-
 sourceModelM50C 2 false 3 3*sourceExcessM50C 2 false 3 1= -32 := by
 obtain ⟨a,b,c,d,e⟩ := source_small_valuesM50C
 obtain ⟨A,B,C,D,E⟩ := model_small_valuesM50C
 norm_num [sourceExcessM50C,sourceModelM50C,sourceNME9C,a,b,c,A,B,C]

theorem source_mixed_diagonal_negativeM50C :
 2*sourceModelM50C 2 false 4 2*sourceExcessM50C 2 false 4 2-
 sourceModelM50C 2 false 3 3*sourceExcessM50C 2 false 5 1-
 sourceModelM50C 2 false 5 1*sourceExcessM50C 2 false 3 3= -520 := by
 obtain ⟨a,b,c,d,e⟩ := source_small_valuesM50C
 obtain ⟨A,B,C,D,E⟩ := model_small_valuesM50C
 norm_num [sourceExcessM50C,sourceModelM50C,sourceNME9C,c,d,e,C,D,E]

theorem source_mixed_example_validM50C :
 (frame (threePathM9E2 1 false)).mid.a=3 ∧
 (frame (threePathM9E2 1 false)).mid.b=8 ∧
 InPolygon 3 8 3 1 ∧ InPolygon 3 8 3 2 ∧ InPolygon 3 8 3 3 ∧
 InPolygon 3 8 4 2 ∧ InPolygon 3 8 5 1 ∧
 coeff (frame (threePathM9E2 1 false)).mid.p 3 2^2-
   coeff (frame (threePathM9E2 1 false)).mid.p 3 1*
   coeff (frame (threePathM9E2 1 false)).mid.p 3 3=292 ∧
 coeff (frame (threePathM9E2 1 false)).mid.p 4 2^2-
   coeff (frame (threePathM9E2 1 false)).mid.p 3 3*
   coeff (frame (threePathM9E2 1 false)).mid.p 5 1=18001 := by
 obtain ⟨a,b,c,d,e⟩ := source_small_valuesM50C
 rw [(three_path_labelsM9E2 1 false).1,(three_path_labelsM9E2 1 false).2,
   three_path_polynomialM9E2]
 norm_num [three_raw_formulaM9E2,InPolygon,a,b,c,d,e]

end
end MathGKM.Markov
