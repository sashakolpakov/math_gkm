import MarkovThreeRawM9E2
/-! Machine-authored 9e205206. Auxiliary summation obstructions, not root
refutations. The concrete source triple satisfies its raw inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000

theorem three_five_valuesM9E2 :
 coeff (frame [true,false]).mid.p 0 5=1 ∧
 coeff (frame [true,false]).mid.p 1 5=14 ∧
 coeff (frame [true,false]).mid.p 2 5=21 := by
 change coeff (frame (threePathM9E2 0 false)).mid.p 0 5=1 ∧
   coeff (frame (threePathM9E2 0 false)).mid.p 1 5=14 ∧
   coeff (frame (threePathM9E2 0 false)).mid.p 2 5=21
 rw [three_path_polynomialM9E2]
 simp only [three_raw_formulaM9E2]
 decide

theorem three_five_valid_lcM9E2 :
 InPolygon 3 5 0 5 ∧ InPolygon 3 5 1 5 ∧ InPolygon 3 5 2 5 ∧
 coeff (frame [true,false]).mid.p 0 5*coeff (frame [true,false]).mid.p 2 5 ≤
 coeff (frame [true,false]).mid.p 1 5^2 := by
 rw [three_five_valuesM9E2.1,three_five_valuesM9E2.2.1,three_five_valuesM9E2.2.2]
 norm_num [InPolygon]

theorem three_mixed_valuesM9E2 :
 addSRawM9E2 (threeProductRawM9E2 2 2 2) 0 5=0 ∧
 addSRawM9E2 (threeProductRawM9E2 2 2 2) 1 5=9 ∧
 addSRawM9E2 (threeProductRawM9E2 2 2 2) 2 5=21 ∧
 shiftRawM9E2 0 2 (threeProductRawM9E2 1 1 1) 0 5=1 ∧
 shiftRawM9E2 0 2 (threeProductRawM9E2 1 1 1) 1 5=0 ∧
 shiftRawM9E2 0 2 (threeProductRawM9E2 1 1 1) 2 5=0 := by
 decide

theorem three_mixed_failureM9E2 :
 let f := addSRawM9E2 (threeProductRawM9E2 2 2 2)
 let g := shiftRawM9E2 0 2 (threeProductRawM9E2 1 1 1)
 2*f 1 5*g 1 5 < f 0 5*g 2 5+g 0 5*f 2 5 := by
 dsimp only
 obtain ⟨h0,h1,h2,h3,h4,h5⟩ := three_mixed_valuesM9E2
 rw [h0,h1,h2,h3,h4,h5]
 norm_num

end
end MathGKM.Markov
