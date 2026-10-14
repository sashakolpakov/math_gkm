import MarkovHorizontalSource05ef
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

/-- Raw horizontal second-row inequality for every source denominator at least five. -/
theorem horizontal_two_raw05ef (path : List Bool) (hb : 5 ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p (i+2) 2 ≤
 coeff (frame path).mid.p (i+1) 2^2 := by
 obtain ⟨w,hl,hc,he⟩ := source_hword46 path
 cases w with
 | nil => simp at hl; omega
 | cons d w =>
   have hn : 3 ≤ (d::w).length := by omega
   have hs := source_hseed_cross05ef path d w hl hc he hn
   rw [← coeffSeq_cubic5a7] at hs
   have hh := crossLC_pascal hs ((d::w).length-3)
   rw [← coeffSeq_binomial_mul] at hh
   have hh' := crossLC_X_pow_mul46 _ hh ((d::w).count true)
   let row := ((hword46 (X : Polynomial ℤ) (d::w)).coeff 2).map (Int.castRingHom ℝ)
   have hfac : (2:Polynomial ℝ)*row =
     X^((d::w).count true)*((1+X)^((d::w).length-3)*
       CubicPoly5a7 (2*(hscore05ef d w)) (hb05ef ((d::w).count true))
       (hc05ef (d::w).length ((d::w).count true))
       (hd05ef (d::w).length ((d::w).count true))) := by
     have hf := congrArg (Polynomial.map (Int.castRingHom ℝ)) (hword_second_factor05ef d w hn)
     simp [hseed05ef,hscore05ef,Polynomial.map_mul,Polynomial.map_pow,
       Polynomial.map_add,Polynomial.map_sub,Polynomial.map_natCast,Polynomial.map_ofNat,
       Polynomial.map_X,Polynomial.map_one] at hf
     dsimp [row]
     rw [hf]
     simp [CubicPoly5a7,hb05ef,hc05ef,hd05ef,hscore05ef]
     push_cast
     split_ifs <;> ring
   rw [← hfac] at hh'
   have h := crossLC_adjacent hh' ((i:ℤ)+1)
   have h0 : ¬ (i:ℤ)<0 := by omega
   have h1 : ¬ (i:ℤ)+1<0 := by omega
   have h2 : ¬ (i:ℤ)+1+1<0 := by omega
   simp only [CoeffSeq,add_sub_cancel_right,h0,h1,h2,if_false,Int.toNat_natCast,
     Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,row] at h
   have hid (k : ℕ) : ((hword46 (X : Polynomial ℤ) (d::w)).coeff 2).coeff k =
     coeff (frame path).mid.p k 2 := by rw [← he,swap_coeff46]
   simp only [hid] at h
   have h' : (coeff (frame path).mid.p i 2:ℝ)*coeff (frame path).mid.p (i+2) 2 ≤
     (coeff (frame path).mid.p (i+1) 2:ℝ)^2 := by nlinarith
   exact_mod_cast h'

#print axioms horizontal_two_raw05ef
end
end MathGKM.Markov
