import MarkovTopTwoEdgesMEB6
/-! Machine-authored eb6a9001. Exact full-root residual after both proved
upper edges and the explicit denominator cutoff. No remaining clause assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2

def TopClosedRegionMEB6 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopFinishedRegionMEB6 q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ (i=3 ∨ i+2=t)

theorem source_top_closedMEB6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionMEB6 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,hi⟩
 · exact source_top_finishedMEB6 q i j r hq h
 · rcases hi with rfl|hi
   · exact (source_top_third_strictMEB6 q t r hq ht htq).le
   · have h := source_top_last_strictMEB6 q t r hq ht htq
     rw [show t-2=i by omega,show t-1=i+1 by omega,←hi] at h
     exact h.le

theorem source_top_small_depthsMEB6 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht1 : t ≤ 6) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 apply source_top_closedMEB6 q i _ r hq
 by_cases hi : i ≤ 2 ∨ t < i+2
 · exact Or.inl (Or.inl ⟨t,ht0,htq,rfl,hi⟩)
 · exact Or.inr ⟨t,ht0,htq,rfl,by omega⟩

def ThreeFrontierMEB6 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionMEB6 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierMEB6 : Conjecture63 ↔ ThreeFrontierMEB6 ∧ OtherFourM9E2 := by
 rw [root_iff_upper_residualM5BF]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 _ => (h q hq r).1 i j h0 h1 h2,(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2
   by_cases he : TopClosedRegionMEB6 q r i j
   · exact source_top_closedMEB6 q i j r hq he
   · exact (h q hq r).1 i j h0 h1 h2 he

end
end MathGKM.Markov
