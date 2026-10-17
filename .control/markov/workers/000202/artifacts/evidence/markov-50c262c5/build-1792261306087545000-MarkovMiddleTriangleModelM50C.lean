import MarkovTemplateDiagonalM50C
import MarkovMiddleCrossingDegreeM50C
/-! Machine-authored 50c262c5. The source/model bridge through both
middle boundary crossings, precisely outside the correction support. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem source_triangle_templateM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q ≤ j+1) (hi : sourceNME9C q r < i+j+q)
 (hd : i+j ≤ sourceNME9C q r+2) :
 threeRawM9E2 q r i j=
 (topTemplateMB3E (sourceNME9C q r) (sourceNME9C q r+2-j)).coeff i := by
 by_cases ht : sourceNME9C q r ≤ j+q
 · have h := source_top_coeffMB3E q (sourceNME9C q r+2-j) i r hq (by omega)
   rwa [show sourceNME9C q r+2-(sourceNME9C q r+2-j)=j by omega] at h
 · let k := sourceNME9C q r-q-j-1
   have hn : sourceNME9C q r=3*q+(if r then 1 else 2) := rfl
   have hk : k ≤ q+(if r then 1 else 2) := by dsimp [k]; omega
   have he : q+3+k=sourceNME9C q r+2-j := by dsimp [k]; omega
   have hc : k+1 < i := by dsimp [k]; omega
   have h := source_middle_crossing_highM50C q k i r hq hk hc
   rwa [he,show sourceNME9C q r+2-(sourceNME9C q r+2-j)=j by omega] at h

theorem source_triangle_modelM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 3 ≤ i) (hj : q ≤ j+1) (hc : sourceNME9C q r < i+j+q)
 (hd : i+j ≤ sourceNME9C q r+2) (hw : sourceNME9C q r+2 ≤ i+2*j) :
 (threeRawM9E2 q r i j:ℝ)=lowerDiagMF88 (i-3) j (sourceNME9C q r+2-i-j) := by
 rw [source_triangle_templateM50C q i j r hq hj hc hd]
 exact top_template_modelM50C _ i j hi hd hw

end
end MathGKM.Markov
