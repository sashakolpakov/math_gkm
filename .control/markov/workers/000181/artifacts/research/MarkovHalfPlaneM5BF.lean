import MarkovFullBandRegionM5BF
/-! Machine-authored 5bf6837d. Horizontal raw inequalities on the lower half
of every numerator-three source, and a more transparent exact residual. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_lower_halfM5BF (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : 2*j+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hl : j ≤ q+3
 · exact lower_and_three_correctionsM964 q i j r hq hl
 have hq2 : 2 ≤ q := by
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at hj <;> omega
 exact source_full_band_regionM5BF q i j r ⟨hq2,by omega,hj⟩

theorem source_lower_half_pathM5BF (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 2*j+1 ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 apply source_lower_halfM5BF q i j r hq
 simpa only [hb,sourceNME9C] using hj

def ThreeUpperResidualM5BF : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q+3<j → sourceNME9C q r<2*j+1 → j≠5 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_upper_residualM5BF :
 Conjecture63 ↔ ThreeUpperResidualM5BF ∧ OtherFourM9E2 := by
 rw [root_iff_beyond_thirdM964]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hj hn h5
   exact (h q hq r).1 i j (by omega) h5 (by omega) (by omega) (by omega)
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hj h5 h1 h2 h3
   by_cases hn : 2*j+1 ≤ sourceNME9C q r
   · exact source_lower_halfM5BF q i j r hq hn
   · exact (h q hq r).1 i j (by omega) (by omega) h5

end
end MathGKM.Markov
