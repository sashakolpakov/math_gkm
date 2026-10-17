import MarkovCorrectionRegionM418
/-! Machine-authored 418bcc64. Exact root residual, preserving every
unresolved numerator family, direction, row, zero and endpoint. -/
namespace MathGKM.Markov
noncomputable section

def ThreeBeyondCorrectionM418 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 → j≠q+1 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_correction_windowM418 :
 Conjecture63 ↔ FirstCorrectionWindowM418 ∧ ThreeBeyondCorrectionM418 ∧ OtherFourM9E2 := by
 constructor
 · intro H
   have hall := (root_iff_three_arithmeticM9E2.mp H).1
   have ho := root_iff_outside_lowerM7A3.mp H
   refine ⟨?_,?_,ho.2⟩
   · intro q hq r i _ _
     exact (hall q (by omega) r).1 i (q+1)
   · intro q hq r
     exact ⟨fun i j h1 h2 _ => (ho.1 q hq r).1 i j h1 h2,(ho.1 q hq r).2⟩
 · rintro ⟨hw,hb,h4⟩
   apply root_iff_outside_lowerM7A3.mpr
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(hb q hq r).2⟩
   intro i j hj h5
   by_cases he : j=q+1
   · subst j
     exact first_correction_all_iff_windowM418.mpr hw q hq r i
   · exact (hb q hq r).1 i j hj h5 he

end
end MathGKM.Markov
