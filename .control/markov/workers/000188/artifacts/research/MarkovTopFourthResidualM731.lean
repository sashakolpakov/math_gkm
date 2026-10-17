import MarkovTopFourthSourceM731
import MarkovTopIntegerResidualM731
/-! Machine-authored 73199834. Exact reduced upper residual and full-root
frontier. The retained frontier and OtherFour remain unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

def TopInteriorWedgeM731 : Prop := ∀ d i r : ℕ,
 2 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 0 ≤ tailGapMDCB i d r

theorem top_wedge_iff_interiorM731 : TopWedgeStripM208 ↔ TopInteriorWedgeM731 := by
 constructor
 · intro H d i r hi hr hd hb hw
   exact H d i r (by omega) hr hd hb hw
 · intro H d i r hi hr hd hb hw
   by_cases hi2 : 2 ≤ i
   · exact H d i r hi2 hr hd hb hw
   · have he : i=1 := by omega
     subst i
     exact (tail_gap_column_one_positiveM731 d r (by omega)).le

theorem top_moment_iff_interiorM731 : TopMomentBoundM55C ↔ TopInteriorWedgeM731 :=
 top_moment_iff_wedge_stripM208.trans top_wedge_iff_interiorM731

def TopInteriorIntegerM731 : Prop := ∀ d i r : ℕ,
 2 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → i+1 < 4*r →
 0 ≤ betaIntegerTotalM731 d i r

theorem top_interior_iff_integerM731 : TopInteriorWedgeM731 ↔ TopInteriorIntegerM731 := by
 constructor
 · intro H d i r hi hr hd hb hw
   exact (beta_integer_total_nonneg_iffM731 d i r).mpr (H d i r hi hr hd hb hw)
 · intro H d i r hi hr hd hb hw
   exact (beta_integer_total_nonneg_iffM731 d i r).mp (H d i r hi hr hd hb hw)

def TopClosedRegionM731 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionM208 q r i j ∨ ∃ t, 6 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ i=4

theorem source_top_closedM731 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionM731 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,rfl⟩
 · exact source_top_closedM208 q i j r hq h
 · exact (source_top_fourth_strictM731 q t r hq ht htq).le

def ThreeFrontierM731 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionM731 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierM731 : Conjecture63 ↔ ThreeFrontierM731 ∧ OtherFourM9E2 := by
 rw [root_iff_frontierM208]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he =>
     (h q hq r).1 i j h0 h1 h2 (fun hh => he (Or.inl hh)),(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hc : TopClosedRegionM731 q r i j
   · exact source_top_closedM731 q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
