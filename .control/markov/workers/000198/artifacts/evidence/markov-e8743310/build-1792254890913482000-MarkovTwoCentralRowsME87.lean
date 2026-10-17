import MarkovMiddleClosedME87
import MarkovTopFiveLCME87
/-! Machine-authored e8743310. Exact remaining numerator-three horizontal
scope: two central rows. Vertical, diagonal and other families retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

def ThreeCentralRowsME87 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 →
   2*j ≤ sourceNME9C q r+3 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem central_rows_iffME87 (b j : ℕ) :
 (b < 2*j+1 ∧ 2*j ≤ b+3) ↔ j=(b+1)/2 ∨ j=(b+1)/2+1 := by omega

theorem source_horizontal_outside_centralME87 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r+4 ≤ 2*j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hz : sourceNME9C q r+2 < j
 · have he : threeRawM9E2 q r i j=0 := by
     rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_rows_aboveMB3E q j r hq hz]
     simp
   rw [he,zero_mul]
   exact sq_nonneg _
 by_cases ht : sourceNME9C q r ≤ j+q
 · have he : j=sourceNME9C q r+2-(sourceNME9C q r+2-j) := by omega
   rw [he]
   exact source_top_completeME87 q (sourceNME9C q r+2-j) i r hq (by omega)
 · let k := sourceNME9C q r-(q+j+1)
   have hn : sourceNME9C q r ≤ 3*q+2 := by cases r <;> simp [sourceNME9C]
   have hk : k ≤ q := by dsimp [k]; omega
   have he : j=sourceNME9C q r+2-(q+3+k) := by dsimp [k]; omega
   rw [he]
   apply source_middle_allME87 q k i r hq hk
   dsimp [k]
   omega

theorem root_iff_two_central_rowsME87 :
 Conjecture63 ↔ ThreeCentralRowsME87 ∧ OtherFourM9E2 := by
 constructor
 · intro h
   obtain ⟨h,h4⟩ := root_iff_upper_residualM5BF.mp h
   refine ⟨?_,h4⟩
   intro q hq r
   exact ⟨fun i j h0 h1 h2 _ => (h q hq r).1 i j h0 h1 h2,(h q hq r).2⟩
 · rintro ⟨h,h4⟩
   apply root_iff_upper_residualM5BF.mpr
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2
   by_cases hc : 2*j ≤ sourceNME9C q r+3
   · exact (h q hq r).1 i j h0 h1 h2 hc
   · exact source_horizontal_outside_centralME87 q i j r hq (by omega)
end
end MathGKM.Markov
