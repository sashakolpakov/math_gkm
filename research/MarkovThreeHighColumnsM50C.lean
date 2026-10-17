import MarkovMiddleTriangleLCM50C
/-! Machine-authored 50c262c5. Complete vertical and diagonal columns
beyond denominator-dependent thresholds; denominator and column remain unbounded. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem source_high_column_verticalM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : q+(if r then 1 else 2)+4 ≤ i) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 by_cases hj : j+2 ≤ q
 · exact source_lower_verticalMF88 q i j r hj
 · apply source_triangle_verticalM50C q i j r hq (by omega)
   · cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at * <;> omega
   · cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at * <;> omega

theorem source_high_column_diagonalM50C (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : q+(if r then 1 else 2)+2 ≤ i) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hj : j+2 ≤ q
 · exact source_lower_diagonalM9F23 q i j r hj
 · apply source_triangle_diagonalM50C q i j r hq
   · cases r <;> simp at hi <;> omega
   · omega
   · cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at * <;> omega
   · cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] at * <;> omega

theorem path_high_column_verticalM50C (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : (frame path).mid.b+4 ≤ i+2*((frame path).mid.b/3)) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hi
 simp only [hp]
 apply source_high_column_verticalM50C q i j r hq
 omega

theorem path_high_column_diagonalM50C (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : (frame path).mid.b+2 ≤ i+2*((frame path).mid.b/3)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hi
 simp only [hp]
 apply source_high_column_diagonalM50C q i j r hq
 omega

end
end MathGKM.Markov
