import MarkovTwoCentralRowsME87
/-! Machine-authored e8743310. Every numerator-three horizontal row except
two explicit central rows, with no bound on columns or denominator. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_horizontal_two_exceptionsME87 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : j≠(sourceNME9C q r+1)/2 ∧ j≠(sourceNME9C q r+1)/2+1) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hl : 2*j+1 ≤ sourceNME9C q r
 · exact source_lower_halfM5BF q i j r hq hl
 · apply source_horizontal_outside_centralME87 q i j r hq
   by_contra hh
   have he := (central_rows_iffME87 (sourceNME9C q r) j).mp ⟨by omega,by omega⟩
   exact he.elim hj.1 hj.2

theorem path_horizontal_two_exceptionsME87 (path : List Bool)
 (ha : (frame path).mid.a=3) (i j : ℕ)
 (hj : j≠((frame path).mid.b+1)/2 ∧ j≠((frame path).mid.b+1)/2+1) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_horizontal_two_exceptionsME87 q i j r hq (by simpa only [hb,sourceNME9C] using hj)

theorem path_top_completeME87 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ t i, t ≤ q+2 →
 coeff (frame path).mid.p i ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p (i+2) ((frame path).mid.b+2-t) ≤
 coeff (frame path).mid.p (i+1) ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro t i ht
 simp only [hp,hb]
 exact source_top_completeME87 q t i r hq ht
end
end MathGKM.Markov
