import MarkovHorizontalFactor05ef
import MarkovPolygon18
/-! Machine-authored 05ef7fab. Source restriction for the second-row seed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def hscore05ef (d : Bool) (w : List Bool) : ℕ :=
 4*hbb05ef d w+(if d then 2 else 0)+(if hlast05ef d w then 2 else 0)

theorem hword_second_leading05ef (d : Bool) (w : List Bool)
 (hn : 3 ≤ (d::w).length) :
 ((hword46 (X : Polynomial ℤ) (d::w)).coeff 2).coeff ((d::w).count true) =
 (hscore05ef d w : ℤ) := by
 have h := congrArg (fun p : Polynomial ℤ => p.coeff ((d::w).count true))
   (hword_second_factor05ef d w hn)
 rw [mul_assoc] at h
 rw [Polynomial.coeff_X_pow_mul'] at h
 simp [hseed05ef,Polynomial.mul_coeff_zero,Polynomial.coeff_C,
   Polynomial.coeff_zero_eq_eval_zero,Polynomial.coeff_X,Polynomial.coeff_one] at h
 dsimp [hscore05ef]
 push_cast
 split_ifs at h ⊢ <;> norm_num at h ⊢ <;> omega

theorem source_hscore_zero05ef (path : List Bool) (d : Bool) (w : List Bool)
 (hl : (d::w).length+2=(frame path).mid.b)
 (hc : (d::w).count true+1=(frame path).mid.a)
 (he : Bivariate.swap (frame path).mid.p=hword46 (X : Polynomial ℤ) (d::w))
 (hn : 3 ≤ (d::w).length) (hm : 2*(d::w).count true < (d::w).length) :
 hscore05ef d w=0 := by
 have hp : ¬ InPolygon (frame path).mid.a (frame path).mid.b ((d::w).count true) 2 := by
   intro h
   have hh := h.1
   rw [← hl,← hc] at hh
   nlinarith
 have hz := raw_outside_polygon18 path ((d::w).count true) 2 hp
 have hlead := hword_second_leading05ef d w hn
 rw [← he,swap_coeff46,hz] at hlead
 exact_mod_cast hlead.symm

/-- The source restriction missing from the arbitrary-word cubic criterion. -/
theorem source_hseed_cross05ef (path : List Bool) (d : Bool) (w : List Bool)
 (hl : (d::w).length+2=(frame path).mid.b)
 (hc : (d::w).count true+1=(frame path).mid.a)
 (he : Bivariate.swap (frame path).mid.p=hword46 (X : Polynomial ℤ) (d::w))
 (hn : 3 ≤ (d::w).length) :
 CrossLC (CubicSeq5a7 (2*(hscore05ef d w))
   (hb05ef ((d::w).count true)) (hc05ef (d::w).length ((d::w).count true))
   (hd05ef (d::w).length ((d::w).count true))) := by
 apply hseed_cross05ef
 · positivity
 · exact_mod_cast (List.count_le_length (l:=d::w) (a:=true))
 · positivity
 · exact_mod_cast hscore_bound05ef d w
 · by_cases hm : 2*(d::w).count true < (d::w).length
   · left
     exact_mod_cast source_hscore_zero05ef path d w hl hc he hn hm
   · right
     exact_mod_cast (show (d::w).length ≤ 2*(d::w).count true by omega)

#print axioms hword_second_leading05ef
#print axioms source_hseed_cross05ef
end
end MathGKM.Markov
