import MarkovVerticalAllRunFactorMDE6
/-! Machine-authored de6168c6. Exact raw second-column transport. The uniform
seed CrossLC hypothesis is explicit and remains unproved for general runs. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame

theorem vertical_second_of_seedMDE6 (n : ℕ) (rest : List Bool)
 (ha : 5 ≤ (frame rest).mid.b)
 (h : let path := List.replicate n false++true::rest
      let a := (frame path).mid.a
      let r := (frame rest).mid.b-(frame rest).mid.a
      CrossLC (CoeffSeq ((vNseedMDE6 n a r (2*r-a)).map (Int.castRingHom ℝ))))
 (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only at h ⊢
 let path := List.replicate n false++true::rest
 have hs := crossLC_pascal h ((frame path).mid.a-5)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame path).mid.b-(2*n+4))
 have hm := congrArg (Polynomial.map (Int.castRingHom ℝ))
   (vertical_second_all_run_factorMDE6 n rest ha)
 dsimp only at hm
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
 change 2*(coeff (frame path).mid.p 2 j:ℝ)*(2*(coeff (frame path).mid.p 2 (j+2):ℝ)) ≤
   (2*(coeff (frame path).mid.p 2 (j+1):ℝ))^2 at hh
 have hr : (coeff (frame path).mid.p 2 j:ℝ)*coeff (frame path).mid.p 2 (j+2) ≤
   (coeff (frame path).mid.p 2 (j+1):ℝ)^2 := by nlinarith
 exact_mod_cast hr

end
end MathGKM.Markov
