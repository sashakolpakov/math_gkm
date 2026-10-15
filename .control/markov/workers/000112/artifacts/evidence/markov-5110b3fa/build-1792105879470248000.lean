import MarkovHorizontalFourthSourceM511
import MarkovHorizontalFourthBoundsM511
import MarkovEightLCM511
/-! Machine-authored request 5110b3fa. Actual-source fourth horizontal row
log-concavity at every natural index, with zero coefficients retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem h4seed_crossM511 (a b : ℕ) (ha : 3 ≤ a) (hb : 9 ≤ b) (hab : a<b) :
 CrossLC (CoeffSeq (h4sourceSeedM511 a b : ℝ[X])) := by
 obtain ⟨⟨h0,h1,h2,h3,h4,h5,h6,h7,g0,g1,g2,g3,g4,g5⟩,h01,h12⟩ :=
   h4boundsM511 a b ha hb hab
 rw [h4sourceSeedM511,h4seedM511]
 simp only [pow_one]
 rw [eight_coeffM511]
 exact eight_crossM511 _ _ _ _ _ _ _ _ h0 h1 h2 h3 h4 h5 h6 h7 h01 h12 g0 g1 g2 g3 g4 g5

theorem horizontal_fourth_rawM511 (path : List Bool)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 4*coeff (frame path).mid.p (i+2) 4 ≤
 coeff (frame path).mid.p (i+1) 4^2 := by
 have h := h4seed_crossM511 _ _ ha hb (frame_reduced path).2.1
 have hs := crossLC_pascal h ((frame path).mid.b-9)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame path).mid.a-3)
 have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) (horizontal_fourth_formulaM511 path ha hb)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,
   Polynomial.map_X,Polynomial.map_add,Polynomial.map_one,h4source_seed_mapM511] at hm
 rw [mul_assoc] at hm
 rw [←hm] at ht
 have hh := crossLC_adjacent ht ((i:ℤ)+1)
 have h0 : ¬(i:ℤ)<0 := by omega
 have h1 : ¬(i:ℤ)+1<0 := by omega
 have h2 : ¬(i:ℤ)+1+1<0 := by omega
 simp only [CoeffSeq,add_sub_cancel_right,h0,h1,h2,if_false,Int.toNat_natCast,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,swap_coeff46] at hh
 rw [show ((i:ℤ)+1).toNat=i+1 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] at hh
 change 24*(coeff (frame path).mid.p i 4:ℝ)*(24*(coeff (frame path).mid.p (i+2) 4:ℝ)) ≤
   (24*(coeff (frame path).mid.p (i+1) 4:ℝ))^2 at hh
 have hreal : (coeff (frame path).mid.p i 4:ℝ)*coeff (frame path).mid.p (i+2) 4 ≤
   (coeff (frame path).mid.p (i+1) 4:ℝ)^2 := by nlinarith
 exact_mod_cast hreal

end
end MathGKM.Markov
