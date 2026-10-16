import MarkovLowerShapeME9C
/-! Machine-authored e9cdd527. The entire lower-region reduction is exact;
the proposed shape hypothesis is only sufficient and remains unproved. -/
namespace MathGKM.Markov
noncomputable section

def LowerVerticalThreeME9C : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r i j, j+2 ≤ q →
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2

def OutsideLowerThreeME9C : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, q < j+2 → threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤
   threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_lower_regionsME9C :
 Conjecture63 ↔ LowerVerticalThreeME9C ∧ OutsideLowerThreeME9C ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,?_,h4⟩
   · intro q hq r i j _
     exact (h q hq r).2.1 i j
   · intro q hq r
     exact ⟨(h q hq r).1,fun i j _ => (h q hq r).2.1 i j,(h q hq r).2.2⟩
 · rintro ⟨hl,ho,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨(ho q hq r).1,?_,(ho q hq r).2.2⟩
   intro i j
   by_cases hj : j+2 ≤ q
   · exact hl q hq r i j hj
   · exact (ho q hq r).2.1 i j (by omega)

theorem root_of_lower_shapeME9C
 (hs : ∀ i : ℕ, 3 ≤ i → LowerShapeME9C i)
 (ho : OutsideLowerThreeME9C) (h4 : OtherFourM9E2) : Conjecture63 := by
 apply root_iff_lower_regionsME9C.mpr
 exact ⟨fun q _ r i j hj => source_lower_vertical_of_shapeME9C hs q i j r hj,ho,h4⟩

end
end MathGKM.Markov
