import MarkovTopFiveFormulaME87
import MarkovTopFiveGapsME87
import MarkovFiniteRowLCME87
/-! Machine-authored e8743310. All coefficients of the top five rows,
including zeros and both support endpoints. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem top_five_lcME87 (n t i : ℕ) (hn : 4 ≤ n) (ht : t ≤ 4)
 (h4 : t=4 → 7 ≤ n) :
 (topTemplateMB3E n t).coeff i*(topTemplateMB3E n t).coeff (i+2) ≤
 (topTemplateMB3E n t).coeff (i+1)^2 := by
 obtain ⟨h0,h1,h2,h3,h4'⟩ := top_five_formulaME87 n (by omega)
 have hg := top_small_gapsME87 n hn
 interval_cases t
 · rw [h0]
   simpa using quartic_lcME87 1 0 0 0 0 (by norm_num) (by norm_num) (by norm_num) i
 · rw [h1]
   simpa using quartic_lcME87 2 (n+2) 0 0 0 (by positivity) (by norm_num) (by norm_num) i
 · rw [h2]
   simpa using quartic_lcME87 1 (3*(n:ℤ)-1) ((n+2).choose 2) 0 0
     (by simpa using hg.1) (by simp <;> positivity) (by simp <;> positivity) i
 · rw [h3]
   simpa using quartic_lcME87 0 (4*((n:ℤ)-3)) (4*(n.choose 2:ℤ)) ((n+2).choose 3) 0
     (by simp <;> positivity) hg.2 (by simp <;> positivity) i
 · rw [h4']
   have hgg := top_four_gapsME87 n (h4 rfl)
   simpa using quartic_lcME87 0 (4*((n:ℤ)-6)) (8*((n-2).choose 2:ℤ))
     (((n+1).choose 3:ℤ)+4*(n.choose 3:ℤ)) ((n+2).choose 4)
     (by simp <;> positivity) hgg.1 hgg.2 i

theorem source_top_fiveME87 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht : t ≤ 4) (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq htq,source_top_coeffMB3E q t (i+2) r hq htq,
   source_top_coeffMB3E q t (i+1) r hq htq]
 exact top_five_lcME87 _ _ _
   (by cases r <;> simp [sourceNME9C] <;> omega) ht
   (by intro h; cases r <;> simp [sourceNME9C] <;> omega)

theorem source_top_completeME87 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (htq : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 by_cases ht : t ≤ 4
 · exact source_top_fiveME87 q t i r hq ht htq
 · exact source_top_allM97B q t i r hq (by omega) htq
end
end MathGKM.Markov
