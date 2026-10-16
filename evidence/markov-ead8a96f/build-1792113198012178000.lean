import MarkovThirdSourceMEA
import MarkovVerticalSeedTransportMDE6
/-! Machine-authored ead8a96f. Third-column seed positivity and conditional LC.
CrossLC is not assumed anywhere in the unconditional source identities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vThirdSeed_nonnegMEA (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b) (j : ℕ) :
 0 ≤ (vThirdSeedMEA (X:ℤ[X]) n rest).coeff j := by
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-3*(n+2)
 have hf := vertical_third_seed_factorMEA n rest ha
 dsimp only at hf
 have hc := congrArg (fun p : ℤ[X] => p.coeff (j+m)) hf
 change (6*vresidualM9E1 path 3).coeff (j+m)=
   (X^m*vThirdSeedMEA (X:ℤ[X]) n rest).coeff (j+m) at hc
 rw [Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow_mul] at hc
 rw [←hc]
 exact mul_nonneg (by norm_num) (vresidual_coeff_nonnegM9E1 path 3 (j+m))

theorem vertical_third_of_seedMEA (n : ℕ) (rest : List Bool)
 (ha : 7 ≤ (frame rest).mid.b)
 (h : CrossLC (CoeffSeq ((vThirdSeedMEA (X:ℤ[X]) n rest).map (Int.castRingHom ℝ))))
 (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hs := crossLC_pascal h ((frame path).mid.a-7)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame path).mid.b-3*(n+2))
 have hm := congrArg (Polynomial.map (Int.castRingHom ℝ))
   (vertical_third_all_run_factorMEA n rest ha)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,Polynomial.map_ofNat,mul_assoc] at hm
 rw [←hm] at ht
 have hh := crossLC_adjacent ht ((j:ℤ)+1)
 have h0 : ¬(j:ℤ)<0 := by omega
 have h1 : ¬(j:ℤ)+1<0 := by omega
 have h2 : ¬(j:ℤ)+1+1<0 := by omega
 simp only [CoeffSeq,add_sub_cancel_right,h0,h1,h2,if_false,Int.toNat_natCast,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_map] at hh
 rw [show ((j:ℤ)+1).toNat=j+1 by omega,show ((j:ℤ)+1+1).toNat=j+2 by omega] at hh
 change 6*(coeff (frame path).mid.p 3 j:ℝ)*(6*(coeff (frame path).mid.p 3 (j+2):ℝ)) ≤
   (6*(coeff (frame path).mid.p 3 (j+1):ℝ))^2 at hh
 have hr : (coeff (frame path).mid.p 3 j:ℝ)*coeff (frame path).mid.p 3 (j+2) ≤
   (coeff (frame path).mid.p 3 (j+1):ℝ)^2 := by nlinarith
 exact_mod_cast hr
end
end MathGKM.Markov
