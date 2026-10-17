import MarkovCentralSecondGapME10
import MarkovCentralResidualME10
/-! Machine-authored e108e0e2. Source attachment of the physical-column-two
gap, and exact residual retaining every other direction/family. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem source_central_secondME10 (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q+3 < j) (hc : sourceNME9C q r < 2*j+1 ∧ 2*j ≤ sourceNME9C q r+3) :
 threeRawM9E2 q r 2 j*threeRawM9E2 q r 4 j ≤ threeRawM9E2 q r 3 j^2 := by
 obtain ⟨h,k,hh,hq',hj'⟩ := central_parametersME10 q j r hq hj hc
 subst q
 have hk3 : 3 ≤ k+h := by
   rw [hj'] at hj
   cases r <;> simp only [sourceNME9C,centralQME10,Bool.false_eq_true,if_false,if_true] at hj <;> omega
 rw [hj']
 have gap := central_second_gapME10 h k r hh hk3
 have h2 := central_source_secondME10 h k r hq
 have h3 := central_source_formulaME10 h k 0 r hq
 have h4 := central_source_formulaME10 h k 1 r hq
 norm_num only [Nat.reduceAdd] at h3 h4
 have he :
   (threeRawM9E2 (centralQME10 h k r) r 2 (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k)):ℚ)*
   (threeRawM9E2 (centralQME10 h k r) r 4 (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k)):ℚ) ≤
   (threeRawM9E2 (centralQME10 h k r) r 3 (sourceNME9C (centralQME10 h k r) r+2-(centralQME10 h k r+3+k)):ℚ)^2 := by
   rw [h2,h3,h4,central_raw_castME10,central_raw_castME10]
   exact gap
 exact_mod_cast he

def ThreeCentralTenME10 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   2*j ≤ sourceNME9C q r+3 → 3 ≤ i → i < 13 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem central_ten_iffME10 : ThreeCentralFiniteME10 ↔ ThreeCentralTenME10 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j h0 h1 h2 h3 hi htop => (h q hq r).1 i j h0 h1 h2 h3 (by omega) htop,(h q hq r).2⟩
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 h3 hi htop
   by_cases he : i=2
   · subst i; exact source_central_secondME10 q j r hq h0 ⟨h1,h3⟩
   · exact (h q hq r).1 i j h0 h1 h2 h3 (by omega) htop

theorem root_iff_central_tenME10 : Conjecture63 ↔ ThreeCentralTenME10 ∧ OtherFourM9E2 := by
 rw [root_iff_central_finiteME10,central_ten_iffME10]

end
end MathGKM.Markov
