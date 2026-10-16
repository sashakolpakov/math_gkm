import MarkovHorizontalFourthLCM511
/-! Machine-authored request 9e104e0c. Numerator-two fourth-row seed and
monomial-cleared source identity; raw coefficients throughout. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem h4two_goodM9E1 (x : ℝ) (hx : 0 ≤ x) :
 H4GoodM511 2 (9+x) 0 0 0 0 0 0 := by
 unfold H4GoodM511 H4BoundsM511
 refine ⟨⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩,?_,?_⟩
 all_goals first
 | (simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,
       h4c5M511,h4c6M511,h4c7M511]; ring_nf; positivity)
 | (apply sub_nonneg.mp
    simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,
       h4c5M511,h4c6M511,h4c7M511]
    ring_nf; positivity)

theorem h4two_crossM9E1 (b : ℕ) (hb : 9 ≤ b) :
 CrossLC (CoeffSeq (h4sourceSeedM511 2 b : ℝ[X])) := by
 have h := h4two_goodM9E1 (b-9) (by exact_mod_cast hb)
 have eb : (9:ℝ)+(b-9)=b := by ring
 rw [eb] at h
 have eq : 2*2-b=0 := by omega
 have et : min (b-2) (3*2-b)=0 := by omega
 have eu : 3*2-2*b=0 := by omega
 have ev : h4vM511 2 b=0 := by simp [h4vM511]; omega
 have ew : h4wM511 2 b=0 := by simp [h4wM511]; omega
 have ez : h4zM511 2 b=0 := by unfold h4zM511; omega
 obtain ⟨⟨h0,h1,h2,h3,h4,h5,h6,h7,g0,g1,g2,g3,g4,g5⟩,h01,h12⟩ := h
 rw [h4sourceSeedM511,eq,et,eu,ev,ew,ez,h4seedM511]
 norm_num only [Nat.cast_zero,Nat.cast_ofNat,pow_one]
 rw [eight_coeffM511]
 exact eight_crossM511 _ _ _ _ _ _ _ _ h0 h1 h2 h3 h4 h5 h6 h7 h01 h12 g0 g1 g2 g3 g4 g5

theorem horizontal_fourth_shiftedM9E1 (path : List Bool)
 (hb : 9 ≤ (frame path).mid.b) :
 24*X^3*((Bivariate.swap (frame path).mid.p).coeff 4).map (Int.castRingHom ℝ)=
 X^((frame path).mid.a)*(1+X)^((frame path).mid.b-9)*
   h4sourceSeedM511 (frame path).mid.a (frame path).mid.b := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let p := (Bivariate.swap (frame path).mid.p).coeff 4
 let Q := (h4sourceSeedM511 a b : ℝ[X])
 have hclear : 24*X^3*(1+X)^9*p.map (Int.castRingHom ℝ)=X^a*(1+X)^b*Q := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have h := hfourth_eval_clearedM511 path (by omega) x hx
   dsimp only at h
   rw [hrowEval_coeffM13D] at h
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_add,
     Polynomial.eval_map,p,a,b,Q,add_comm] using h
 have hz : ((1+X:ℝ[X])^9)≠0 := by
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 have eb : (1+X:ℝ[X])^b=(1+X)^9*(1+X)^(b-9) := by
   rw [←pow_add]; congr 1; dsimp [b]; omega
 rw [eb] at hclear
 apply mul_left_cancel₀ hz
 change (1+X)^9*(24*X^3*p.map (Int.castRingHom ℝ))=
   (1+X)^9*(X^a*(1+X)^(b-9)*Q)
 linear_combination hclear

theorem horizontal_fourth_twoM9E1 (path : List Bool)
 (ha : (frame path).mid.a=2) (hb : 9 ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 4*coeff (frame path).mid.p (i+2) 4 ≤
 coeff (frame path).mid.p (i+1) 4^2 := by
 have h := h4two_crossM9E1 _ hb
 rw [←ha] at h
 have hs := crossLC_pascal h ((frame path).mid.b-9)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame path).mid.a)
 have hm := horizontal_fourth_shiftedM9E1 path hb
 rw [mul_assoc] at hm
 rw [←hm] at ht
 have hh := crossLC_adjacent ht ((i:ℤ)+4)
 have h0 : ¬(i:ℤ)+4-1<0 := by omega
 have h1 : ¬(i:ℤ)+4<0 := by omega
 have h2 : ¬(i:ℤ)+4+1<0 := by omega
 simp only [CoeffSeq,h0,h1,h2,if_false] at hh
 rw [show ((i:ℤ)+4-1).toNat=i+3 by omega,
   show ((i:ℤ)+4).toNat=(i+1)+3 by omega,
   show ((i:ℤ)+4+1).toNat=(i+2)+3 by omega] at hh
 simp only [mul_assoc,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow_mul,
   Polynomial.coeff_map,swap_coeff46] at hh
 change 24*(coeff (frame path).mid.p i 4:ℝ)*(24*(coeff (frame path).mid.p (i+2) 4:ℝ)) ≤
   (24*(coeff (frame path).mid.p (i+1) 4:ℝ))^2 at hh
 have hr : (coeff (frame path).mid.p i 4:ℝ)*coeff (frame path).mid.p (i+2) 4 ≤
   (coeff (frame path).mid.p (i+1) 4:ℝ)^2 := by nlinarith
 exact_mod_cast hr

end
end MathGKM.Markov
