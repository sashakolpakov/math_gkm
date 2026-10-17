import MarkovMiddleTriangleModelM50C
import MarkovMiddleHighTransverseM50C
/-! Machine-authored 50c262c5. Exact transverse inequalities throughout an
unbounded triangular part of the middle strip, including boundary crossings. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_triangle_verticalM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : q ≤ j+1) (hc : sourceNME9C q r < i+j+q)
 (hw : sourceNME9C q r+2 ≤ i+2*j) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 by_cases hi : i ≤ 3
 · exact source_first_four_verticalMF88 q i j r hq hi
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_model_antidiagonalM9F23 (i-3) j (sourceNME9C q r-i-j)
   have h0 := source_triangle_modelM50C q i j r hq (by omega) hj hc (by omega) hw
   have h1 := source_triangle_modelM50C q i (j+1) r hq (by omega) (by omega) (by omega) (by omega) (by omega)
   have h2 := source_triangle_modelM50C q i (j+2) r hq (by omega) (by omega) (by omega) (by omega) (by omega)
   rw [show sourceNME9C q r+2-i-j=sourceNME9C q r-i-j+2 by omega] at h0
   rw [show sourceNME9C q r+2-i-(j+1)=sourceNME9C q r-i-j+1 by omega] at h1
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega] at h2
   rw [←h0,←h1,←h2] at h
   exact_mod_cast h
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),mul_zero]
   exact sq_nonneg _

theorem source_triangle_diagonalM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 4 ≤ i) (hj : q ≤ j+1) (hc : sourceNME9C q r < i+j+q+2)
 (hw : sourceNME9C q r ≤ i+2*j) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have h := lower_parameter_diagonalM9F23 (i-3) j (sourceNME9C q r-i-j) (by omega)
   have h0 := source_triangle_modelM50C q i (j+2) r hq (by omega) (by omega) (by omega) (by omega) (by omega)
   have h1 := source_triangle_modelM50C q (i+1) (j+1) r hq (by omega) (by omega) (by omega) (by omega) (by omega)
   have h2 := source_triangle_modelM50C q (i+2) j r hq (by omega) hj (by omega) (by omega) (by omega)
   rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega] at h0
   rw [show sourceNME9C q r+2-(i+1)-(j+1)=sourceNME9C q r-i-j by omega,
     show i+1-3=i-3+1 by omega] at h1
   rw [show sourceNME9C q r+2-(i+2)-j=sourceNME9C q r-i-j by omega,
     show i+2-3=i-3+2 by omega] at h2
   rw [←h0,←h1,←h2] at h
   exact_mod_cast h
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

end
end MathGKM.Markov
