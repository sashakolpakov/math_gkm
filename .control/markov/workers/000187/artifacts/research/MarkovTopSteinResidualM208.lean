import MarkovTopSteinSourceM208
/-! Machine-authored 20825094. Exact residual after both linear wedges.
All unbounded families, middle rows, other directions and endpoints remain. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

def TopWedgeStripM208 : Prop := ∀ d i r : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 0 ≤ tailGapMDCB i d r

theorem top_linear_iff_wedge_stripM208 : TopLinearStripMCA9 ↔ TopWedgeStripM208 := by
 constructor
 · intro H d i r hi hr hd hb _
   exact H d i r hi hr hd hb
 · intro H d i r hi hr hd hb
   by_cases hw : i+1 < 4*r
   · exact H d i r hi hr hd hb hw
   · exact (tail_gap_wedge_positiveM208 d i r hd (by omega) (by omega)).le

theorem top_moment_iff_wedge_stripM208 : TopMomentBoundM55C ↔ TopWedgeStripM208 :=
 top_moment_iff_linear_stripMCA9.trans top_linear_iff_wedge_stripM208

def TopClosedRegionM208 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionMCA9 q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ 3 ≤ i ∧ i+1 ≤ t ∧ 4*t+2 ≤ 5*i

theorem source_top_closedM208 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionM208 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,hi,hit,hw⟩
 · exact source_top_closedMCA9 q i j r hq h
 · exact (source_top_wedge_columnM208 q t i r hq ht htq hi hit hw).le

def ThreeFrontierM208 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionM208 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierM208 : Conjecture63 ↔ ThreeFrontierM208 ∧ OtherFourM9E2 := by
 rw [root_iff_frontierMCA9]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he =>
     (h q hq r).1 i j h0 h1 h2 (fun hh => he (Or.inl hh)),(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hc : TopClosedRegionM208 q r i j
   · exact source_top_closedM208 q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
