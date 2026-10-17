import MarkovMiddleSecondSourceMF8D
import MarkovMiddleSecondExceptionsMF8D
/-! Machine-authored f8d0715b. Entire second middle row, all source parameters,
including cases outside the polynomial strip, all columns and all zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
attribute [local irreducible] threeRawM9E2

theorem source_middle_second_allMF8D (q c : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+4))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+4)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+4))^2 := by
 by_cases hn : 2*(q+4) ≤ sourceNME9C q r
 · exact source_middle_second_stripMF8D q c r hq hn
 by_cases hj : sourceNME9C q r+2-(q+4) ≤ q+3
 · exact lower_and_three_correctionsM964 q c _ r hq hj
 have he : (q=4 ∧ r=false) ∨ (q=5 ∧ r=false) ∨
   (q=5 ∧ r=true) ∨ (q=6 ∧ r=true) := by
   cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega
 by_cases hc : c ≤ q+4
 · exact second_exceptions_boundedMF8D q c r he hc
 · rw [three_raw_degreeME9C q c _ r hq ?_,zero_mul]
   · exact sq_nonneg _
   · cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega

theorem source_middle_second_pathMF8D (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ c, coeff (frame path).mid.p c (sourceNME9C q r+2-(q+4))*
 coeff (frame path).mid.p (c+2) (sourceNME9C q r+2-(q+4)) ≤
 coeff (frame path).mid.p (c+1) (sourceNME9C q r+2-(q+4))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro c
 simp only [hp]
 exact source_middle_second_allMF8D q c r hq

theorem source_middle_second_polygonMF8D (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hc : 3 ≤ c) (hct : c+2 ≤ q+4) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+4)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+4)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+4)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+4))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+4)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+4))^2 := by
 have hp (i : ℕ) (hi : 3 ≤ i) (hit : i ≤ q+4) :=
   middle_polygonM99A q 1 i r hq hq hi (by omega)
 simp only [show q+3+1=q+4 by omega] at hp
 exact ⟨hp c hc (by omega),hp (c+1) (by omega) (by omega),
   hp (c+2) (by omega) hct,source_middle_second_allMF8D q c r hq⟩

end
end MathGKM.Markov
