import MarkovTopLinearSourceMCA9
/-! Machine-authored ca9709f2. Exact remaining upper scalar strip and root
residual; all universal families and remaining directions are retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

def TopLinearStripMCA9 : Prop := ∀ d i r : ℕ,
 1 ≤ i → 5 ≤ r → i+r ≤ d+2 → d+1 < i+4*r → 0 ≤ tailGapMDCB i d r

theorem top_tail_iff_linear_stripMCA9 : TopTailResidualMDCB ↔ TopLinearStripMCA9 := by
 constructor
 · intro H d i r hi hr hd _
   exact H d i r hi hr hd
 · intro H d i r hi hr hd
   by_cases hb : d+1 < i+4*r
   · exact H d i r hi hr hd hb
   · exact (tail_gap_linear_positiveMCA9 d i r (by omega) (by omega)).le

theorem top_moment_iff_linear_stripMCA9 : TopMomentBoundM55C ↔ TopLinearStripMCA9 :=
 top_moment_iff_tail_residualMDCB.trans top_tail_iff_linear_stripMCA9

def TopClosedRegionMCA9 (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 TopClosedRegionMDCB q r i j ∨ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧
 j=sourceNME9C q r+2-t ∧ (6*t ≤ sourceNME9C q r+16 ∨
   (3 ≤ i ∧ i+1 ≤ t ∧ 6*t ≤ sourceNME9C q r+3*i+4))

theorem source_top_closedMCA9 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopClosedRegionMCA9 q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with h|⟨t,ht,htq,rfl,h⟩
 · exact source_top_closedMDCB q i j r hq h
 · rcases h with hd|⟨hi,hit,hd⟩
   · exact source_top_linear_allMCA9 q t r hq ht htq hd i
   · exact (source_top_linear_columnMCA9 q t i r hq ht htq hi hit hd).le

def ThreeFrontierMCA9 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopClosedRegionMCA9 q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_frontierMCA9 : Conjecture63 ↔ ThreeFrontierMCA9 ∧ OtherFourM9E2 := by
 rw [root_iff_frontierMDCB]
 constructor
 · rintro ⟨h,h4⟩
   exact ⟨fun q hq r => ⟨fun i j h0 h1 h2 he =>
     (h q hq r).1 i j h0 h1 h2 (fun hh => he (Or.inl hh)),(h q hq r).2⟩,h4⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 he
   by_cases hc : TopClosedRegionMCA9 q r i j
   · exact source_top_closedMCA9 q i j r hq hc
   · exact (h q hq r).1 i j h0 h1 h2 hc

end
end MathGKM.Markov
