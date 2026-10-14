import MarkovThird774
import MarkovTopLC1998

/-! Machine-authored worker 5a7c193a. All source paths, first three upper
diagonals. No inequality for the other slices or directions is asserted. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem third_quotient_crossLC5a7 (path : List Bool) :
    CrossLC (CoeffSeq ((quotientSlice774 path 2).map (Int.castRingHom ℝ))) := by
  by_cases ha : 3 ≤ (frame path).mid.a
  · exact third_quotient_crossLC774 path ha
  obtain ⟨ha0,hab,_⟩ := frame_reduced path
  have hz : ThirdA (frame path).mid.a = 0 := by
    have hcases : (frame path).mid.a = 1 ∨ (frame path).mid.a = 2 := by omega
    rcases hcases with h | h <;> simp [h,ThirdA]
  have hB : 0 ≤ ThirdB (frame path).mid.a (frame path).mid.b := by
    have h := quotient_slice_nonneg774 path 2 1
    have he := congrArg (fun p : Polynomial ℝ => p.coeff 1)
      (quotient_quadratic_real774 path)
    simp [Quadratic] at he
    rw [← he]
    exact_mod_cast h
  have hC : 0 ≤ ThirdC (frame path).mid.b := by
    have h := quotient_slice_nonneg774 path 2 2
    have he := congrArg (fun p : Polynomial ℝ => p.coeff 2)
      (quotient_quadratic_real774 path)
    simp [Quadratic] at he
    rw [← he]
    exact_mod_cast h
  rw [quotient_quadratic_real774,coeffSeq_quadratic,hz]
  exact crossLC_quad le_rfl hB hC (by positivity)

/-- The small-a cases are included, with no polygon or positive-support filter. -/
theorem third_raw_logConcave5a7 (path : List Bool) (i j : ℕ)
    (hd : i+j+4=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  exact upper_raw_lc_of_quotient774 path 2 i j (by omega) (by omega)
    (third_quotient_crossLC5a7 path)

theorem word_linear5a7 {R : Type*} [CommRing R] (x : R) (w : List Bool) :
    (wordQuotient774 x w).coeff 1 = ((w.length : R)+1)*x+w.count true := by
  have h := rowJet_fold774 x 0 0 (1,1) (rowJet_initial774 x) w
  obtain ⟨_,h0,h1,_⟩ := h
  simp only [zero_add] at h1
  simp only [wordQuotient774,Polynomial.coeff_add,mul_assoc,
    Polynomial.coeff_C_mul,Polynomial.coeff_X_mul,h0,h1]
  ring

theorem quotient_linear5a7 (path : List Bool) :
    quotientSlice774 path 1 =
      ((frame path).mid.b-1 : Polynomial ℤ)*X+((frame path).mid.a-1) := by
  obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
  have hb : ((frame path).mid.b : Polynomial ℤ) = (w.length : Polynomial ℤ)+2 := by
    exact_mod_cast hl.symm
  have ha : ((frame path).mid.a : Polynomial ℤ) = (w.count true : Polynomial ℤ)+1 := by
    exact_mod_cast hc.symm
  unfold quotientSlice774
  rw [he,word_linear5a7,hb,ha]
  ring

theorem second_quotient_crossLC5a7 (path : List Bool) :
    CrossLC (CoeffSeq ((quotientSlice774 path 1).map (Int.castRingHom ℝ))) := by
  obtain ⟨ha,hab,_⟩ := frame_reduced path
  rw [quotient_linear5a7]
  simp only [Polynomial.map_add,Polynomial.map_mul,Polynomial.map_sub,
    Polynomial.map_natCast,Polynomial.map_one,Polynomial.map_X]
  have he : ((frame path).mid.b : Polynomial ℝ)-1 = C ((frame path).mid.b-1 : ℝ) := by
    simp
  have he' : ((frame path).mid.a : Polynomial ℝ)-1 = C ((frame path).mid.a-1 : ℝ) := by
    simp
  rw [he,he']
  have hq : C ((frame path).mid.b-1 : ℝ)*X+C ((frame path).mid.a-1 : ℝ) =
      Quadratic ((frame path).mid.a-1) ((frame path).mid.b-1) 0 := by
    simp [Quadratic,add_comm]
  rw [hq,coeffSeq_quadratic]
  apply crossLC_quad
  · have : (1 : ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha
    linarith
  · have : (1 : ℝ) ≤ (frame path).mid.b := by exact_mod_cast (show 1 ≤ (frame path).mid.b by omega)
    linarith
  · exact le_rfl
  · simp

theorem second_raw_logConcave5a7 (path : List Bool) (i j : ℕ)
    (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  exact upper_raw_lc_of_quotient774 path 1 i j (by omega) (by omega)
    (second_quotient_crossLC5a7 path)

theorem first_three_raw_logConcave5a7 (path : List Bool) (r i j : ℕ)
    (hr : r ≤ 2) (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  interval_cases r
  · exact top_raw_logConcave1998 path i j (by omega)
  · exact second_raw_logConcave5a7 path i j (by omega)
  · exact third_raw_logConcave5a7 path i j (by omega)

#print axioms third_quotient_crossLC5a7
#print axioms third_raw_logConcave5a7
#print axioms quotient_linear5a7
#print axioms second_raw_logConcave5a7
#print axioms first_three_raw_logConcave5a7
end
end MathGKM.Markov
