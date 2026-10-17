import MarkovMiddleTriangleLCM50C
import MarkovMiddleZeroDiagonalM50C
/-! Machine-authored 50c262c5. Exact reduction; both residual propositions
remain open, with every other numerator, zero and crossing triple retained. -/
namespace MathGKM.Markov
noncomputable section

def ThreeTriangleResidualM50C : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   ¬(sourceNME9C q r < i+j+q ∧ sourceNME9C q r+2 ≤ i+2*j) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, 1 ≤ i → q < j+2 → j+q < sourceNME9C q r →
   ¬(4 ≤ i ∧ sourceNME9C q r < i+j+q+2 ∧ sourceNME9C q r ≤ i+2*j) →
   ¬(i=3 ∧ sourceNME9C q r ≤ 2*j ∧ sourceNME9C q r < i+j+q+2) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem middle_iff_triangleM50C : ThreeMiddleOnlyM9F23 ↔ ThreeTriangleResidualM50C := by
 constructor
 · intro h q hq r
   exact ⟨fun i j hi hj ht he _ => (h q hq r).1 i j hi hj ht he,
     fun i j _ hj ht _ _ => (h q hq r).2 i j hj ht⟩
 · intro h q hq r
   constructor
   · intro i j hi hj ht he
     by_cases hc : sourceNME9C q r < i+j+q ∧ sourceNME9C q r+2 ≤ i+2*j
     · exact source_triangle_verticalM50C q i j r hq (by omega) hc.1 hc.2
     · exact (h q hq r).1 i j hi hj ht he hc
   · intro i j hj ht
     by_cases hi : i=0
     · subst i; exact source_zero_diagonalM50C q j r hq
     by_cases hc : 4 ≤ i ∧ sourceNME9C q r < i+j+q+2 ∧ sourceNME9C q r ≤ i+2*j
     · exact source_triangle_diagonalM50C q i j r hq hc.1 (by omega) hc.2.1 hc.2.2
     by_cases he : i=3 ∧ sourceNME9C q r ≤ 2*j ∧ sourceNME9C q r < i+j+q+2
     · exact source_high_diagonalM50C q i j r hq (by omega) he.2.1 he.2.2
     · exact (h q hq r).2 i j (by omega) hj ht hc he

theorem root_iff_triangleM50C : Conjecture63 ↔ ThreeTriangleResidualM50C ∧ OtherFourM9E2 := by
 rw [root_iff_middle_onlyM9F23,middle_iff_triangleM50C]

end
end MathGKM.Markov
