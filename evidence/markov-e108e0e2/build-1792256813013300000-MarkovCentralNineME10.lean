import MarkovCentralSecondSourceME10
import MarkovCentralLow0ME10
/-! Machine-authored e108e0e2. Exact nine-column central residual. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

theorem source_central_thirdME10 (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q+3 < j) (hc : sourceNME9C q r < 2*j+1 ∧ 2*j ≤ sourceNME9C q r+3) :
 threeRawM9E2 q r 3 j*threeRawM9E2 q r 5 j ≤ threeRawM9E2 q r 4 j^2 := by
 obtain ⟨h,k,hh,hq',hj'⟩ := central_parametersME10 q j r hq hj hc
 subst q
 have hk3 : 3 ≤ k+h := by
   rw [hj'] at hj
   cases r <;> simp only [sourceNME9C,centralQME10,Bool.false_eq_true,if_false,if_true] at hj <;> omega
 rw [hj']
 have h3 := central_source_formulaME10 h k 0 r hq
 have h4 := central_source_formulaME10 h k 1 r hq
 have h5 := central_source_formulaME10 h k 2 r hq
 norm_num only [Nat.reduceAdd] at h3 h4 h5
 rw [h3,h4,h5]
 exact central_low_0ME10 h k r hh hk3

def ThreeCentralNineME10 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   2*j ≤ sourceNME9C q r+3 → 4 ≤ i → i < 13 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem central_nine_iffME10 : ThreeCentralTenME10 ↔ ThreeCentralNineME10 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j h0 h1 h2 h3 hi htop => (h q hq r).1 i j h0 h1 h2 h3 (by omega) htop,(h q hq r).2⟩
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 h3 hi htop
   by_cases he : i=3
   · subst i; exact source_central_thirdME10 q j r hq h0 ⟨h1,h3⟩
   · exact (h q hq r).1 i j h0 h1 h2 h3 (by omega) htop

theorem root_iff_central_nineME10 : Conjecture63 ↔ ThreeCentralNineME10 ∧ OtherFourM9E2 := by
 rw [root_iff_central_tenME10,central_nine_iffME10]

end
end MathGKM.Markov
