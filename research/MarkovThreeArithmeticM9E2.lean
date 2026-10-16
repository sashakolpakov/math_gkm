import MarkovThreeRawM9E2
/-! Machine-authored 9e205206. Exact arithmetic residual; it is unproved. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRawLCM9E2 : Prop := ∀ q : ℕ, 1≤q → ∀ r,
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤
   threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_three_arithmeticM9E2 : Conjecture63 ↔ ThreeRawLCM9E2 ∧ OtherFourM9E2 := by
 rw [root_iff_three_and_fourM9E2]
 unfold ThreeGoalM9E2 ThreeRawLCM9E2 GlobalLC18
 simp only [three_raw_formulaM9E2]

end
end MathGKM.Markov
