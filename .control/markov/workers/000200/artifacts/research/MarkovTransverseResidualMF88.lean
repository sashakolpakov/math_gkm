import MarkovThreeHorizontalMF88
/-! Machine-authored f88f6a75. Exact root equivalences; both residuals open. -/
namespace MathGKM.Markov
noncomputable section

def ThreeVerticalDiagonalMF88 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

def ThreeTransverseMF88 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_raw_iff_vertical_diagonalMF88 : ThreeRawLCM9E2 ↔ ThreeVerticalDiagonalMF88 := by
 constructor
 · intro h q hq r; exact (h q hq r).2
 · intro h q hq r
   exact ⟨fun i j => source_three_horizontalMF88 q i j r hq,h q hq r⟩

theorem central_nine_iff_transverseMF88 : ThreeCentralNineME10 ↔ ThreeTransverseMF88 := by
 constructor
 · intro h q hq r; exact (h q hq r).2
 · intro h q hq r
   exact ⟨fun i j _ _ _ _ _ _ => source_three_horizontalMF88 q i j r hq,h q hq r⟩

theorem root_iff_vertical_diagonalMF88 :
 Conjecture63 ↔ ThreeVerticalDiagonalMF88 ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2,three_raw_iff_vertical_diagonalMF88]

theorem root_iff_transverseMF88 : Conjecture63 ↔ ThreeTransverseMF88 ∧ OtherFourM9E2 := by
 rw [root_iff_central_nineME10,central_nine_iff_transverseMF88]

end
end MathGKM.Markov
