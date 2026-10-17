import MarkovTransverseResidualMF88
import MarkovLowerVerticalMF88
/-! Machine-authored f88f6a75. Exact root reduction retaining every
upper vertical and unresolved diagonal inequality and every other family. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem source_first_four_verticalMF88 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : i ≤ 3) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := vertical_first_fourMF8 (threePathM9E2 n r) i j hi
 rw [three_path_polynomialM9E2] at h
 simpa only [three_raw_formulaM9E2] using h

def ThreeUpperVerticalDiagonalMF88 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → ¬(i=4 ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem transverse_iff_upper_verticalMF88 : ThreeTransverseMF88 ↔ ThreeUpperVerticalDiagonalMF88 := by
 constructor
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hi hj he
   apply (h q hq r).1 i j
   omega
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j he
   by_cases hi : i ≤ 3
   · exact source_first_four_verticalMF88 q i j r hq hi
   by_cases hj : j+2 ≤ q
   · exact source_lower_verticalMF88 q i j r hj
   · apply (h q hq r).1 i j (by omega) (by omega)
     omega

theorem root_iff_upper_vertical_diagonalMF88 :
 Conjecture63 ↔ ThreeUpperVerticalDiagonalMF88 ∧ OtherFourM9E2 := by
 rw [root_iff_transverseMF88,transverse_iff_upper_verticalMF88]

end
end MathGKM.Markov
