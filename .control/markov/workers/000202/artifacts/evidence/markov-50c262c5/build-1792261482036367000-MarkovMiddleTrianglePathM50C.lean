import MarkovMiddleTriangleResidualM50C
/-! Machine-authored 50c262c5. Exact path and polygon transport. Integer
division identifies q in both reduced numerator-three residue classes. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem path_triangle_verticalM50C (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : (frame path).mid.b/3 ≤ j+1)
 (hc : (frame path).mid.b < i+j+(frame path).mid.b/3)
 (hw : (frame path).mid.b+2 ≤ i+2*j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by
   rw [hb]; cases r <;> simp <;> omega
 rw [he] at hj hc
 have hb' : (frame path).mid.b=sourceNME9C q r := hb
 rw [hb'] at hc hw
 simp only [hp]
 exact source_triangle_verticalM50C q i j r hq hj hc hw

theorem path_triangle_diagonalM50C (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 4 ≤ i) (hj : (frame path).mid.b/3 ≤ j+1)
 (hc : (frame path).mid.b < i+j+(frame path).mid.b/3+2)
 (hw : (frame path).mid.b ≤ i+2*j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by
   rw [hb]; cases r <;> simp <;> omega
 rw [he] at hj hc
 have hb' : (frame path).mid.b=sourceNME9C q r := hb
 rw [hb'] at hc hw
 simp only [hp]
 exact source_triangle_diagonalM50C q i j r hq hi hj hc hw

theorem path_triangle_polygonM50C (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 4 ≤ i) (hj : (frame path).mid.b/3 ≤ j+1)
 (hc : (frame path).mid.b < i+j+(frame path).mid.b/3)
 (hw : (frame path).mid.b+2 ≤ i+2*j) :
 (InPolygon (frame path).mid.a (frame path).mid.b i j →
  InPolygon (frame path).mid.a (frame path).mid.b (i+1) j →
  InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
  coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
    coeff (frame path).mid.p (i+1) j^2) ∧
 (InPolygon (frame path).mid.a (frame path).mid.b i j →
  InPolygon (frame path).mid.a (frame path).mid.b i (j+1) →
  InPolygon (frame path).mid.a (frame path).mid.b i (j+2) →
  coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
    coeff (frame path).mid.p i (j+1)^2) ∧
 (InPolygon (frame path).mid.a (frame path).mid.b i (j+2) →
  InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1) →
  InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
  coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
    coeff (frame path).mid.p (i+1) (j+1)^2) := by
 exact ⟨fun _ _ _ => path_three_horizontalMF88 path ha i j,
   fun _ _ _ => path_triangle_verticalM50C path ha i j hj hc hw,
   fun _ _ _ => path_triangle_diagonalM50C path ha i j hi hj (by omega) (by omega)⟩

end
end MathGKM.Markov
