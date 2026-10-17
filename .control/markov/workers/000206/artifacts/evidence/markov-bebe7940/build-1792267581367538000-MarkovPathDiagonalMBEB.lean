import MarkovSourceDiagonalMBEB
/-! Machine-authored bebe7940. Exact all-path source transport. -/
namespace MathGKM.Markov
noncomputable section
theorem path_above_diagonalMBEB (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 3 ≤ i) (hc : (frame path).mid.b < i+j+(frame path).mid.b/3+2) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 exact source_above_diagonalMBEB q i j r hq hi hc

theorem path_support_column_diagonalMBEB (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 3 ≤ i) (hc : (frame path).mid.b ≤ i+2*((frame path).mid.b/3)) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have he : (frame path).mid.b/3=q := by rw [hb]; cases r <;> simp <;> omega
 rw [he,hb] at hc
 simp only [hp]
 apply source_support_column_diagonalMBEB q i j r hq hi
 omega

end
end MathGKM.Markov
