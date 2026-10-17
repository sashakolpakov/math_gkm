import MarkovCentralHighME10
import MarkovCentralAxesME10
/-! Machine-authored e108e0e2. Exact root reduction; two central rows have
only eleven starting columns left, with unbounded denominator. All other
directions, families, endpoints and zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def ThreeCentralFiniteME10 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3 < j → sourceNME9C q r < 2*j+1 → j≠5 →
   2*j ≤ sourceNME9C q r+3 → 2 ≤ i → i < 13 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem central_finite_iffME10 : ThreeCentralRowsME87 ↔ ThreeCentralFiniteME10 := by
 constructor
 · intro h q hq r
   exact ⟨fun i j h0 h1 h2 h3 _ _ => (h q hq r).1 i j h0 h1 h2 h3,(h q hq r).2⟩
 · intro h q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j h0 h1 h2 h3
   by_cases hi0 : i ≤ 1
   · exact source_central_lowME10 q i j r hq hi0 h0 h3
   by_cases hi : i < 13
   · exact (h q hq r).1 i j h0 h1 h2 h3 (by omega) hi
   · exact source_central_highME10 q i j r hq h0 ⟨h1,h3⟩ (by omega)

theorem root_iff_central_finiteME10 :
 Conjecture63 ↔ ThreeCentralFiniteME10 ∧ OtherFourM9E2 := by
 rw [root_iff_two_central_rowsME87,central_finite_iffME10]

theorem source_horizontal_highME10 (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hi : 13 ≤ i) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hl : 2*j+1 ≤ sourceNME9C q r
 · exact source_lower_halfM5BF q i j r hq hl
 by_cases hj : j ≤ q+3
 · exact lower_and_three_correctionsM964 q i j r hq hj
 by_cases hcentral : 2*j ≤ sourceNME9C q r+3
 · exact source_central_highME10 q i j r hq (by omega) ⟨by omega,hcentral⟩ hi
 · exact source_horizontal_outside_centralME87 q i j r hq (by omega)

theorem path_horizontal_highME10 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 13 ≤ i) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_horizontal_highME10 q i j r hq hi

end
end MathGKM.Markov
