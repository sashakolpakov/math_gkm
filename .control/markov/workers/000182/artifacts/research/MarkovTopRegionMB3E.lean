import MarkovTopEdgeSourceMB3E
/-! Machine-authored b3eed364. Exact residual after removing the newly
proved upper edge region. Every other direction and source is retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

def TopEdgeRegionMB3E (q : ℕ) (r : Bool) (i j : ℕ) : Prop :=
 i ≤ 1 ∧ ∃ t, 5 ≤ t ∧ t ≤ q+2 ∧ j=sourceNME9C q r+2-t

theorem source_top_zeroMB3E (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r 0 (sourceNME9C q r+2-t)=0 := by
 rw [source_top_coeffMB3E q t 0 r hq ht]
 apply (top_edge_coeffsMB3E (sourceNME9C q r) t ?_ (by omega)).1
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_edge_regionMB3E (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (h : TopEdgeRegionMB3E q r i j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 rcases h with ⟨hi,t,ht0,ht,rfl⟩
 rcases (show i=0 ∨ i=1 by omega) with rfl|rfl
 · rw [source_top_zeroMB3E q t r hq ht0 ht,zero_mul]
   exact sq_nonneg _
 · exact le_of_lt (source_top_first_strictMB3E q t r hq ht0 ht)

theorem source_top_positive_formulaMB3E (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r (i+3) (sourceNME9C q r+2-t)=topPositiveMB3E (sourceNME9C q r) t i := by
 rw [source_top_coeffMB3E q t (i+3) r hq ht]
 apply top_positive_formulaMB3E
 cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_high_supportMB3E (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 0 < threeRawM9E2 q r (i+3) (sourceNME9C q r+2-t) ↔ i+3 ≤ t := by
 rw [source_top_positive_formulaMB3E q t i r hq ht0 ht]
 apply top_positive_supportMB3E
 cases r <;> simp [sourceNME9C] <;> omega

def ThreeRemainingMB3E : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 → ¬TopEdgeRegionMB3E q r i j →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_remainingMB3E : Conjecture63 ↔ ThreeRemainingMB3E ∧ OtherFourM9E2 := by
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
   by_cases he : TopEdgeRegionMB3E q r i j
   · exact source_top_edge_regionMB3E q i j r hq he
   · exact (h q hq r).1 i j h0 h1 h2 he

end
end MathGKM.Markov
