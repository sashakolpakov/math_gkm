import MarkovTopQuadraticSourceM97B
/-! Machine-authored 97b019af. Exact residual after removing the proved
quadratic region. Neither this residual nor the full pinned root is asserted. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

def TopQuadraticResidualM97B : Prop := ∀ d i r : ℕ,
 2 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 (i-2)^2 < 8*(r-1) → 0 ≤ tailGapMDCB i d r

theorem top_interior_iff_quadraticM97B : TopInteriorWedgeM731 ↔ TopQuadraticResidualM97B := by
 constructor
 · intro H d i r hi hr hd hb hw hq
   exact H d i r hi hr hd hb hw
 · intro H d i r hi hr hd hb hw
   by_cases hq : 8*(r-1) ≤ (i-2)^2
   · exact (fourth_tail_gap_positiveM97B d i r hi (by omega) hd hq).le
   · exact H d i r hi hr hd hb hw (by omega)

theorem top_moment_iff_quadraticM97B : TopMomentBoundM55C ↔ TopQuadraticResidualM97B :=
 top_moment_iff_interiorM731.trans top_interior_iff_quadraticM97B

def TopClosedRegionM97B (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionM731 q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ 5 ≤ i ∧ i+1 ≤ t ∧ 8*(t-i-1) ≤ (i-5)^2

theorem source_top_closedM97B (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionM97B q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,hi,hit,hw⟩
 · exact source_top_closedM731 q i j r hq h
 · exact (source_top_quadratic_columnM97B q t i r hq ht htq hi hit hw).le

def ThreeFrontierM97B : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionM97B q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierM97B : Conjecture63 ↔ ThreeFrontierM97B ∧ OtherFourM9E2 := by
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
   by_cases hc : TopClosedRegionM97B q r i j
   · exact source_top_closedM97B q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
