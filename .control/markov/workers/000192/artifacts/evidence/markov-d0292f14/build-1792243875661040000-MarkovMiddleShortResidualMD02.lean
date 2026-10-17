import MarkovMiddleDiscreteMD02
/-! Machine-authored d0292f14. Exact root decomposition. Both displayed
residuals and the binomial gap sign condition remain unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def MiddleRowMD02 (q : ℕ) (r : Bool) (j : ℕ) : Prop :=
 ∃ k, k ≤ q ∧ 2*(q+3+k) ≤ sourceNME9C q r ∧
 j=sourceNME9C q r+2-(q+3+k)

def ThreeOutsideMiddleMD02 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   ¬UpperClosedRegionM97B q r i j → ¬MiddleClosedM99A q r i j →
   ¬MiddleJetClosedM80F q r i j → ¬MiddleRowMD02 q r j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_middle_shortMD02 :
 Conjecture63 ↔ MiddleShortLCMD02 ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 constructor
 · intro H
   obtain ⟨h,h4⟩ := root_iff_after_jetsM80F.mp H
   refine ⟨root_implies_middle_shortMD02 H,?_,h4⟩
   intro q hq r
   exact ⟨fun i j h0 h1 h2 he hm hj _ => (h q hq r).1 i j h0 h1 h2 he hm hj,
     (h q hq r).2⟩
 · rintro ⟨hs,h,h4⟩
   apply root_iff_after_jetsM80F.mpr
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he hm hj
   by_cases hrow : MiddleRowMD02 q r j
   · obtain ⟨k,hk,hn,rfl⟩ := hrow
     exact middle_short_sourceMD02 hs q k i r hq hk hn
   · exact (h q hq r).1 i j h0 h1 h2 he hm hj hrow

theorem root_of_middle_newtonMD02 (hs : MiddleNewtonMD02)
 (h : ThreeOutsideMiddleMD02) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_iff_middle_shortMD02.mpr ⟨middle_newton_sufficientMD02 hs,h,h4⟩

end
end MathGKM.Markov
