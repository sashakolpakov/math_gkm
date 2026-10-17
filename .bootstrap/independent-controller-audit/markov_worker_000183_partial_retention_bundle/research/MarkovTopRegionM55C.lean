import MarkovTopSectorM55C
/-! Machine-authored 55cf20d2. Exact root residual after the additional
upper-sector triple. All other directions and all other sources remain. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

def TopFinishedRegionM55C (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧ j=sourceNME9C q r+2-t ∧ (i ≤ 2 ∨ t < i+2)

theorem source_top_finished_regionM55C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopFinishedRegionM55C q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with ⟨t,ht0,ht,rfl,hi⟩
 rcases hi with hi|hi
 · rcases (show i ≤ 1 ∨ i=2 by omega) with he|rfl
   · exact source_top_edge_regionMB3E q i _ r hq ⟨he,t,ht0,ht,rfl⟩
   · exact le_of_lt (source_top_second_strictM55C q t r hq ht0 ht)
 · rw [source_top_zero_tailMB3E q t (i+2) r hq ht0 ht (Or.inr hi),mul_zero]
   exact sq_nonneg _

def ThreeRemainingM55C : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopFinishedRegionM55C q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_remainingM55C : Conjecture63 ↔ ThreeRemainingM55C ∧ OtherFourM9E2 := by
 rw [root_iff_upper_residualM5BF]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   exact ⟨fun i j h0 h1 h2 _ => (h q hq r).1 i j h0 h1 h2,(h q hq r).2⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2
   by_cases he : TopFinishedRegionM55C q r i j
   · exact source_top_finished_regionM55C q i j r hq he
   · exact (h q hq r).1 i j h0 h1 h2 he

end
end MathGKM.Markov
