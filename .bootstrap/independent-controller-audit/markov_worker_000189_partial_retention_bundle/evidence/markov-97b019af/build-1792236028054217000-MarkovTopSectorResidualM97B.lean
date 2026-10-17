import MarkovTopSectorClosedM97B
/-! Machine-authored 97b019af. Exact full-root residual after closing all
numerator-three upper-sector horizontal columns. Other directions retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def UpperClosedRegionM97B (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionM731 q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧ j=sourceNME9C q r+2-t

theorem source_upper_closedM97B (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : UpperClosedRegionM97B q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl⟩
 · exact source_top_closedM731 q i j r hq h
 · exact source_top_allM97B q t i r hq ht htq

def ThreeAfterUpperM97B : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬UpperClosedRegionM97B q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_after_upperM97B : Conjecture63 ↔ ThreeAfterUpperM97B ∧ OtherFourM9E2 := by
 rw [root_iff_frontierM731]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he =>
     (h q hq r).1 i j h0 h1 h2 (fun hh => he (Or.inl hh)),(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hc : UpperClosedRegionM97B q r i j
   · exact source_upper_closedM97B q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
