import MarkovSmallHorizontalM9E1
import MarkovHorizontalFourthTwoM9E1
import MarkovHorizontalThirdSourceM13D
import MarkovRemaining6ade
import MarkovSecondHorizontal8934
/-! Machine-authored request 9e104e0c. Complete raw horizontal rows zero
through four for every source path, all natural indices and all zeros. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 3000000

theorem small_horizontal_allM9E1 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 8) (i j : ℕ) (hj : j=3 ∨ j=4) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 by_cases hi : i ≤ (frame path).mid.a+(frame path).mid.b-1
 · exact small_horizontalM9E1 path ha hb i j hj hi
 · have hz := raw_outside_polygon18 path i j (by unfold InPolygon; omega)
   rw [hz,zero_mul]; exact sq_nonneg _

theorem horizontal_third_allM9E1 (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 3*coeff (frame path).mid.p (i+2) 3 ≤
 coeff (frame path).mid.p (i+1) 3^2 := by
 by_cases ha : (frame path).mid.a=1
 · exact (source_one_global6 path ha).1 i 3
 have ha2 : 2 ≤ (frame path).mid.a := by have hp := (frame_reduced path).1; omega
 by_cases hb : 7 ≤ (frame path).mid.b
 · exact horizontal_third_rawM13D path ha2 hb i
 · exact small_horizontal_allM9E1 path ha2 (by omega) i 3 (Or.inl rfl)

theorem horizontal_fourth_allM9E1 (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 4*coeff (frame path).mid.p (i+2) 4 ≤
 coeff (frame path).mid.p (i+1) 4^2 := by
 by_cases ha : (frame path).mid.a=1
 · exact (source_one_global6 path ha).1 i 4
 have ha2 : 2 ≤ (frame path).mid.a := by have hp := (frame_reduced path).1; omega
 by_cases hb : 9 ≤ (frame path).mid.b
 · by_cases he : (frame path).mid.a=2
   · exact horizontal_fourth_twoM9E1 path he hb i
   · exact horizontal_fourth_rawM511 path (by omega) hb i
 · exact small_horizontal_allM9E1 path ha2 (by omega) i 4 (Or.inr rfl)

theorem horizontal_first_fiveM9E1 (path : List Bool) (i j : ℕ) (hj : j ≤ 4) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) j^2 := by
 interval_cases j
 · exact boundary_raw_logConcave path i
 · exact horizontal_one_raw46 path i
 · exact horizontal_two_raw8934 path i
 · exact horizontal_third_allM9E1 path i
 · exact horizontal_fourth_allM9E1 path i

end
end MathGKM.Markov
