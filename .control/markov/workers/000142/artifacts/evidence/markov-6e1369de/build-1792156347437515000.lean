import MarkovSourceRowM6E1
/-! Machine-authored 6e1369de. Exact support of the central source row;
the zero coefficients outside the polygon are explicitly retained. -/
namespace MathGKM.Markov
noncomputable section

theorem central_positiveM6E1 (q k : ℕ) :
 0 < centralValM6E1 q k ↔ k ≤ q := by
 constructor
 · intro h
   by_contra hn
   rw [central_zeroM6E1 q k (by omega)] at h
   omega
 · intro hk
   have h0 : 0 < ((2*k+2).choose k:ℤ) := by
     exact_mod_cast Nat.choose_pos (by omega : k ≤ 2*k+2)
   have h1 : 0 < ((q+k+3).choose (2*k+3):ℤ) := by
     exact_mod_cast Nat.choose_pos (by omega : 2*k+3 ≤ q+k+3)
   have h2 : 0 ≤ ((q+k+2).choose (2*k+3):ℤ) := by positivity
   unfold centralValM6E1
   exact mul_pos h0 (lt_of_lt_of_le h1 (le_add_of_nonneg_right h2))

theorem central_polygonM6E1 (q i : ℕ) :
 InPolygon 2 (2*q+1) i q ↔ 2 ≤ i ∧ i ≤ q+2 := by
 unfold InPolygon
 constructor
 · intro h
   constructor
   · by_contra hi
     have hh : i ≤ 1 := by omega
     have hm := Nat.mul_le_mul_left (2*q+1) hh
     nlinarith
   · omega
 · rintro ⟨hi,hq⟩
   have hm := Nat.mul_le_mul_left (2*q+1) hi
   constructor <;> nlinarith

theorem source_two_row_lowM6E1 (path : List Bool) (j i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) (hi : i ≤ 1) :
 coeff (frame path).mid.p i j=0 := by
 obtain ⟨q,hq,hb',hp⟩ := source_two_squares3556 path ha
 have he : q=j := by omega
 subst q
 obtain ⟨r,rfl⟩ : ∃ r, j=r+1 := ⟨j-1,by omega⟩
 rw [hp]
 simpa only [Nat.add_assoc] using central_two_lowM6E1 r i hi

theorem source_two_row_supportM6E1 (path : List Bool) (j i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1) :
 0 < coeff (frame path).mid.p i j ↔ InPolygon (frame path).mid.a (frame path).mid.b i j := by
 rw [ha,hb,central_polygonM6E1]
 by_cases hi : i ≤ 1
 · rw [source_two_row_lowM6E1 path j i ha hb hi]
   omega
 · obtain ⟨k,rfl⟩ : ∃ k, i=k+2 := ⟨i-2,by omega⟩
   rw [source_two_row_formulaM6E1 path j k ha hb,central_positiveM6E1]
   omega

theorem source_two_row_zeroM6E1 (path : List Bool) (j i : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*j+1)
 (hout : ¬InPolygon (frame path).mid.a (frame path).mid.b i j) :
 coeff (frame path).mid.p i j=0 := by
 by_cases hi : i ≤ 1
 · exact source_two_row_lowM6E1 path j i ha hb hi
 · obtain ⟨k,rfl⟩ : ∃ k, i=k+2 := ⟨i-2,by omega⟩
   rw [ha,hb,central_polygonM6E1] at hout
   rw [source_two_row_formulaM6E1 path j k ha hb,central_zeroM6E1 j k (by omega)]

end
end MathGKM.Markov
