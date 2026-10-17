import MarkovMiddleThirdStripM9DB
import MarkovMiddleThirdExceptionsM9DB
/-! Machine-authored 9db2326d. Entire third middle horizontal row of every
numerator-three source; no strip restriction and no finite denominator bound. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
attribute [local irreducible] threeRawM9E2

theorem source_middle_third_allM9DB (q c : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+5))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+5)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 by_cases hn : 2*(q+5) ≤ sourceNME9C q r
 · exact source_middle_third_stripM9DB q c r hq hn
 by_cases hj : sourceNME9C q r+2-(q+5) ≤ q+3
 · exact lower_and_three_correctionsM964 q c _ r hq hj
 have he : (q=5 ∧ r=false) ∨ (q=6 ∧ r=false) ∨ (q=7 ∧ r=false) ∨
   (q=6 ∧ r=true) ∨ (q=7 ∧ r=true) ∨ (q=8 ∧ r=true) := by
   cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega
 by_cases hc : c ≤ q+5
 · exact third_exceptions_boundedM9DB q c r he hc
 · rw [three_raw_degreeME9C q c _ r hq ?_,zero_mul]
   · exact sq_nonneg _
   · cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega

theorem source_middle_third_pathM9DB (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ c, coeff (frame path).mid.p c (sourceNME9C q r+2-(q+5))*
 coeff (frame path).mid.p (c+2) (sourceNME9C q r+2-(q+5)) ≤
 coeff (frame path).mid.p (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro c
 simp only [hp]
 exact source_middle_third_allM9DB q c r hq

theorem source_middle_third_polygonM9DB (q c : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hc : 3 ≤ c) (hct : c+2 ≤ q+5) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+5)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+5)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+5)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+5))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+5)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 have hp (i : ℕ) (hi : 3 ≤ i) (hit : i ≤ q+5) :=
   middle_polygonM99A q 2 i r (by omega) hq hi (by omega)
 simp only [show q+3+2=q+5 by omega] at hp
 exact ⟨hp c hc (by omega),hp (c+1) (by omega) (by omega),
   hp (c+2) (by omega) hct,source_middle_third_allM9DB q c r (by omega)⟩

end
end MathGKM.Markov
