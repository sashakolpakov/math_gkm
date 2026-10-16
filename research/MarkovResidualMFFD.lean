import MarkovFifthSourceMFFD
import MarkovResidualM1BB
/-! Machine-authored ffd747f5. Exact residual after the proved horizontal row.
Every other clause remains; this proposition is not proved. -/
namespace MathGKM.Markov
noncomputable section

def ThreeRemainingMFFD : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, j≠5 → threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬((i=3 ∨ i=4) ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem three_remaining_iffMFFD : ThreeRemainingM1BB ↔ ThreeRemainingMFFD := by
 constructor
 · intro h q hq r
   exact ⟨fun i j _ => (h q hq r).1 i j,(h q hq r).2⟩
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j
   by_cases hj : j=5
   · subst j
     exact three_horizontal_fifthMFFD q i r hq
   · exact (h q hq r).1 i j hj

theorem root_iff_remainingMFFD : Conjecture63 ↔ ThreeRemainingMFFD ∧ OtherFourM9E2 := by
 rw [root_iff_remainingM1BB,three_remaining_iffMFFD]

theorem fifth_gain_polygonMFFD (q : ℕ) (r : Bool) (hq : 5 ≤ q) :
 InPolygon 3 (sourceNME9C q r) 3 5 ∧
 InPolygon 3 (sourceNME9C q r) 4 5 ∧
 InPolygon 3 (sourceNME9C q r) 5 5 := by
 unfold InPolygon sourceNME9C
 split_ifs <;> omega

end
end MathGKM.Markov
