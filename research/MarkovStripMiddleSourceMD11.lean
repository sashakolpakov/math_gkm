import MarkovStripSourceMD11
/-! Machine-authored d11e335e. Exact source correction for 3a<=b<=4a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem strip_middle_seedMD11 (a b : ℕ) (hs : 3*a ≤ b) (hu : b ≤ 4*a) :
 (h4sourceSeedM511 a b : ℝ[X])=
 X^2*(C (96*(4*a-b:ℕ):ℝ)+X*stripQuarticMD11 (a:ℝ) b) := by
 have hq : 2*a-b=0 := by omega
 have ht : 3*a-b=0 := by omega
 have hv : h4vM511 a b=4*a-b := by
   simp only [h4vM511,if_pos (show 2*a ≤ b by omega)]
   omega
 have hw : h4wM511 a b=0 := by simp [h4wM511,show 2*a ≤ b by omega]
 have hz : h4zM511 a b=0 := by unfold h4zM511; omega
 have hu0 : 3*a-2*b=0 := by omega
 simp only [h4sourceSeedM511,hq,ht,hu0,hv,hw,hz,Nat.min_zero,Nat.cast_zero]
 simp only [h4seedM511,stripQuarticMD11,h4c0M511,h4c1M511,h4c2M511,
   h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,
   map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_zero,map_one]
 ring

theorem source_strip_middle_fourMD11 (path : List Bool) (hb : 9 ≤ (frame path).mid.b)
 (hs : 3*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 4*(frame path).mid.a) :
 24*((Bivariate.swap (frame path).mid.p).coeff 4).map (Int.castRingHom ℝ)=
 X^((frame path).mid.a-1)*(1+X)^((frame path).mid.b-9)*
 (C (96*(4*(frame path).mid.a-(frame path).mid.b:ℕ):ℝ)+
   X*stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b) := by
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let p := (Bivariate.swap (frame path).mid.p).coeff 4
 have hclear : 24*X^3*(1+X)^9*p.map (Int.castRingHom ℝ)=
   X^a*(1+X)^b*(h4sourceSeedM511 a b : ℝ[X]) := by
   apply Polynomial.eq_of_infinite_eval_eq
   apply (Set.Ioi_infinite (0:ℝ)).mono
   intro x hx
   have h := hfourth_eval_clearedM511 path (by omega) x hx
   dsimp only at h
   rw [hrowEval_coeffM13D] at h
   simpa [Polynomial.eval_mul,Polynomial.eval_pow,Polynomial.eval_add,
     Polynomial.eval_map,p,a,b,add_comm] using h
 rw [strip_middle_seedMD11 a b hs hu] at hclear
 have hz : (X^3*(1+X)^9 : ℝ[X])≠0 := by
   apply mul_ne_zero (pow_ne_zero _ Polynomial.X_ne_zero)
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 have ha : 1 ≤ a := (frame_reduced path).1
 have ea : (X:ℝ[X])^a=X*X^(a-1) := by rw [←pow_succ']; congr 1; omega
 have eb : (1+X:ℝ[X])^b=(1+X)^9*(1+X)^(b-9) := by
   rw [←pow_add]; congr 1; dsimp [b]; omega
 rw [ea,eb] at hclear
 apply mul_left_cancel₀ hz
 change X^3*(1+X)^9*(24*p.map (Int.castRingHom ℝ))=
   X^3*(1+X)^9*(X^(a-1)*(1+X)^(b-9)*
     (C (96*(4*a-b:ℕ):ℝ)+X*stripQuarticMD11 (a:ℝ) b))
 linear_combination hclear

theorem strip_middle_four_coeffMD11 (path : List Bool) (hb : 9 ≤ (frame path).mid.b)
 (hs : 3*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 4*(frame path).mid.a) (k : ℕ) :
 24*(coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-9)*
 stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b).coeff k+
 96*(4*(frame path).mid.a-(frame path).mid.b:ℕ)*
 (((frame path).mid.b-9).choose (k+1):ℝ) := by
 have ha := (frame_reduced path).1
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+1+((frame path).mid.a-1)))
   (source_strip_middle_fourMD11 path hb hs hu)
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 have he : k+1+((frame path).mid.a-1)=(frame path).mid.a+k := by omega
 rw [he] at hc
 simp only [mul_add,Polynomial.coeff_add,Polynomial.coeff_mul_C] at hc
 rw [show (1+(X:ℝ[X]))^((frame path).mid.b-9)*
   (X*stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b)=
   ((1+X)^((frame path).mid.b-9)*stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b)*X by ring,
   Polynomial.coeff_mul_X,Polynomial.coeff_one_add_X_pow] at hc
 simpa only [Int.coe_castRingHom,add_comm,mul_comm] using hc
end
end MathGKM.Markov
