import MarkovThirdHighM964
import MarkovThirdSmallM964
import MarkovThirdGap2M964
import MarkovThirdGap3M964
import MarkovThirdGap4M964
import MarkovThirdGap5M964
import MarkovThirdGap6M964
import MarkovThirdGap7M964
import MarkovThirdGap8M964
import MarkovThirdGap9M964
/-! Machine-authored 9647c1ba. Complete third correction row and exact root
residual. Every natural column and small parameter is retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem third_parameter_row_closedM964 (d i : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r i (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r (i+2) (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r (i+1) (thirdJM964 d r)^2 := by
 by_cases hi : 10 ≤ i
 · exact source_third_highM964 d i r hi
 by_cases hi2 : i ≤ 1
 · rw [source_third_lowM964 d i r (by omega),if_neg (by omega),zero_mul]
   exact sq_nonneg _
 interval_cases i
 · exact source_third_horizontal2M964 d r
 · exact source_third_horizontal3M964 d r
 · exact source_third_horizontal4M964 d r
 · exact source_third_horizontal5M964 d r
 · exact source_third_horizontal6M964 d r
 · exact source_third_horizontal7M964 d r
 · exact source_third_horizontal8M964 d r
 · exact source_third_horizontal9M964 d r

theorem third_correction_closedM964 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i (q+3)*threeRawM9E2 q r (i+2) (q+3) ≤
 threeRawM9E2 q r (i+1) (q+3)^2 := by
 by_cases hs : q ≤ 5
 · exact third_small_allM964 q i r hq hs
 have h := third_parameter_row_closedM964 (thirdExponentMC3E q r) i r
 have hq' : thirdQM964 (thirdExponentMC3E q r) r=q := by
   cases r <;> simp [thirdQM964,thirdExponentMC3E] <;> omega
 have hj' : thirdJM964 (thirdExponentMC3E q r) r=q+3 := by
   cases r <;> simp [thirdJM964,thirdExponentMC3E] <;> omega
 simpa only [hq',hj'] using h

theorem lower_and_three_correctionsM964 (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ q+3) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases he : j=q+3
 · subst j; exact third_correction_closedM964 q i r hq
 · exact lower_and_two_correctionsMC3E q i j r hq (by omega)

theorem source_lower_third_pathM964 (path : List Bool)
 (ha : (frame path).mid.a=3) (i j : ℕ) (hj : 3*j ≤ (frame path).mid.b+9) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j ≤ q+3 := by rw [hb] at hj; split_ifs at hj <;> omega
 simp only [hp]
 exact lower_and_three_correctionsM964 q i j r hq hjq

def ThreeBeyondThirdM964 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, q<j → j≠5 → j≠q+1 → j≠q+2 → j≠q+3 →
   threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2) ∧
 (∀ i j, ¬(((i=3 ∨ i=4) ∧ j+1 ≤ q) ∨ (5 ≤ i ∧ i ≤ 8 ∧ j+2 ≤ q)) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, ¬(3 ≤ i ∧ i ≤ 6 ∧ j+2 ≤ q) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
     threeRawM9E2 q r (i+1) (j+1)^2)

theorem root_iff_beyond_thirdM964 : Conjecture63 ↔ ThreeBeyondThirdM964 ∧ OtherFourM9E2 := by
 rw [root_iff_beyond_secondMC3E]
 constructor
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   exact ⟨fun i j h1 h2 h3 h4 _ => (h q hq r).1 i j h1 h2 h3 h4,(h q hq r).2⟩
 · rintro ⟨h,h4⟩
   refine ⟨?_,h4⟩
   intro q hq r
   refine ⟨?_,(h q hq r).2⟩
   intro i j hj h5 h1 h2
   by_cases he : j=q+3
   · subst j; exact third_correction_closedM964 q i r hq
   · exact (h q hq r).1 i j hj h5 h1 h2 he

end
end MathGKM.Markov
