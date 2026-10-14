import MarkovWords774
import MarkovTransfer774

/-! Machine-authored worker 774eaadc. The third upper diagonal of every source
path with a >= 3. This remains only one family of parallel slices. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem quotient_quadratic_twice774 (path : List Bool) :
    let a : Polynomial ℤ := (frame path).mid.a
    let b : Polynomial ℤ := (frame path).mid.b
    2*quotientSlice774 path 2 =
      (b-1)*(b-2)*X^2+2*(a*b-4*a+2)*X+(a-1)*(a-2) := by
  obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
  have h := word_quadratic774 (X : Polynomial ℤ) w
  have hb : ((frame path).mid.b : Polynomial ℤ) = (w.length : Polynomial ℤ)+2 := by
    exact_mod_cast hl.symm
  have ha : ((frame path).mid.a : Polynomial ℤ) = (w.count true : Polynomial ℤ)+1 := by
    exact_mod_cast hc.symm
  dsimp only
  unfold quotientSlice774
  rw [he,hb,ha]
  dsimp only at h
  linear_combination h

theorem quotient_quadratic_real774 (path : List Bool) :
    (quotientSlice774 path 2).map (Int.castRingHom ℝ) =
      Quadratic (ThirdA (frame path).mid.a)
        (ThirdB (frame path).mid.a (frame path).mid.b) (ThirdC (frame path).mid.b) := by
  have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) (quotient_quadratic_twice774 path)
  simp only [Polynomial.map_mul,Polynomial.map_add,Polynomial.map_sub,
    Polynomial.map_pow,Polynomial.map_X,Polynomial.map_one,Polynomial.map_ofNat,Polynomial.map_natCast] at hm
  apply mul_left_cancel₀ (show (2 : Polynomial ℝ) ≠ 0 by norm_num)
  rw [hm]
  have hA (a : ℝ) : (2 : Polynomial ℝ)*C (ThirdA a) = (C a-1)*(C a-2) := by
    rw [show (2 : Polynomial ℝ)=C (2 : ℝ) by rw [_root_.map_ofNat], ← map_mul]
    have he : 2*ThirdA a=(a-1)*(a-2) := by unfold ThirdA; ring
    rw [he]
    simp [_root_.map_ofNat]
  have hC (b : ℝ) : (2 : Polynomial ℝ)*C (ThirdC b) = (C b-1)*(C b-2) := hA b
  have hB (a b : ℝ) : C (ThirdB a b)=C a*C b-4*C a+2 := by simp [ThirdB,_root_.map_ofNat]
  simp only [Quadratic,mul_add,← mul_assoc,hA,hC,hB,_root_.map_natCast]
  ring

theorem third_quotient_crossLC774 (path : List Bool) (ha : 3 ≤ (frame path).mid.a) :
    CrossLC (CoeffSeq ((quotientSlice774 path 2).map (Int.castRingHom ℝ))) := by
  obtain ⟨_,hab,_⟩ := frame_reduced path
  have ha' : (3 : ℝ) ≤ (frame path).mid.a := by exact_mod_cast ha
  have hb' : ((frame path).mid.a : ℝ)+1 ≤ (frame path).mid.b := by
    exact_mod_cast Nat.succ_le_of_lt hab
  obtain ⟨hA,hB,hC,hgap⟩ := third_parameters ha' hb'
  rw [quotient_quadratic_real774,coeffSeq_quadratic]
  exact crossLC_quad hA hB hC hgap

/-- Unconditional raw third-upper-diagonal LC for every source a >= 3. -/
theorem third_raw_logConcave774 (path : List Bool) (ha : 3 ≤ (frame path).mid.a)
    (i j : ℕ) (hd : i+j+4=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  obtain ⟨_,hab,_⟩ := frame_reduced path
  apply upper_raw_lc_of_quotient774 path 2 i j (by omega) (by omega)
  exact third_quotient_crossLC774 path ha

#print axioms quotient_quadratic_twice774
#print axioms quotient_quadratic_real774
#print axioms third_raw_logConcave774
end
end MathGKM.Markov
