import MarkovCorrectionSupportLCMED6
/-! Machine-authored ed6bdbeb. Exact path transport of the enlarged raw-LC region. -/
namespace MathGKM.Markov
noncomputable section

theorem path_above_verticalMED6 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hc : (frame path).mid.b < i+j+(frame path).mid.b/3) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 exact source_above_verticalMED6 q i j r hq hc

theorem path_above_diagonalMED6 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 4 ≤ i) (hc : (frame path).mid.b < i+j+(frame path).mid.b/3+2) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 exact source_above_diagonalMED6 q i j r hq hi hc

theorem path_support_column_verticalMED6 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hc : (frame path).mid.b ≤ i+2*((frame path).mid.b/3)) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
 coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 apply source_support_column_verticalMED6 q i j r hq
 omega

theorem path_support_column_diagonalMED6 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 4 ≤ i) (hc : (frame path).mid.b ≤ i+2*((frame path).mid.b/3)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 apply source_support_column_diagonalMED6 q i j r hq hi
 omega

end
end MathGKM.Markov
