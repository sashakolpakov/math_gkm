import MarkovSecondGapsMC3E
/-! Machine-authored c3e5369f. Complete second-correction horizontal row,
including exceptional parameters, all columns and zero tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem second_parameter_row_closedMC3E (d i : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r i (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r (i+2) (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r (i+1) (secondJMC3E d r)^2 := by
 by_cases hi : 7 ≤ i
 · exact source_second_highMC3E d i r hi
 by_cases hi2 : i ≤ 1
 · rw [source_second_lowMC3E d i r (by omega),if_neg (by omega),zero_mul]
   exact sq_nonneg _
 interval_cases i
 · exact source_second_horizontal2MC3E d r
 · exact source_second_horizontal3MC3E d r
 · exact source_second_horizontal4MC3E d r
 · exact source_second_horizontal5MC3E d r
 · exact source_second_horizontal6MC3E d r

theorem second_correction_closedMC3E (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+2)*threeRawM9E2 q r (i+2) (q+2) ≤
 threeRawM9E2 q r (i+1) (q+2)^2 := by
 by_cases hs : q ≤ 2
 · exact three_small_horizontalMAE9 q i (q+2) r hq (by omega)
 by_cases he : q=3
 · subst q
   exact three_horizontal_fifthMFFD 3 i r (by omega)
 have h := second_parameter_row_closedMC3E (secondExponentMC3E q r) i r
 have hq' : secondQMC3E (secondExponentMC3E q r) r=q := by
   cases r <;> simp [secondQMC3E,secondExponentMC3E] <;> omega
 have hj' : secondJMC3E (secondExponentMC3E q r) r=q+2 := by
   cases r <;> simp [secondJMC3E,secondExponentMC3E] <;> omega
 simpa only [hq',hj'] using h

theorem lower_and_two_correctionsMC3E (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ q+2) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases he : j=q+2
 · subst j; exact second_correction_closedMC3E q i r hq
 · exact lower_and_first_correctionMA64 q i j r hq (by omega)

theorem source_lower_second_pathMC3E (path : List Bool)
 (ha : (frame path).mid.a=3) (i j : ℕ) (hj : 3*j ≤ (frame path).mid.b+6) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j ≤ q+2 := by
   rw [hb] at hj
   split_ifs at hj <;> omega
 simp only [hp]
 exact lower_and_two_correctionsMC3E q i j r hq hjq

def ThreeBeyondSecondMC3E : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 → j≠q+1 → j≠q+2 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_beyond_secondMC3E : Conjecture63 ↔ ThreeBeyondSecondMC3E ∧ OtherFourM9E2 := by
 rw [root_iff_beyond_correctionMA64]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   exact ⟨fun i j h1 h2 h3 _ => (h q hq r).1 i j h1 h2 h3,(h q hq r).2⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hj h5 h1
   by_cases he : j=q+2
   · subst j; exact second_correction_closedMC3E q i r hq
   · exact (h q hq r).1 i j hj h5 h1 he

end
end MathGKM.Markov
