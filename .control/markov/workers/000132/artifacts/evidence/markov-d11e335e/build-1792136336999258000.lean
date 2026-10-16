import MarkovStripGapMD11
import MarkovHorizontalFourthSourceM511
import MarkovStripSourceMB9D
/-! Machine-authored d11e335e. Actual-source low-cone fourth-row bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem strip_four_seedMD11 (a b : ℕ) (hs : 4*a ≤ b) :
 (h4sourceSeedM511 a b : ℝ[X])=X^3*stripQuarticMD11 (a:ℝ) b := by
 have hq : 2*a-b=0 := by omega
 have ht : 3*a-b=0 := by omega
 have hu : 3*a-2*b=0 := by omega
 have hv : h4vM511 a b=0 := by simp [h4vM511,show 2*a ≤ b by omega,show 4*a-b=0 by omega]
 have hw : h4wM511 a b=0 := by simp [h4wM511,show 2*a ≤ b by omega]
 have hz : h4zM511 a b=0 := by unfold h4zM511; omega
 simp only [h4sourceSeedM511,hq,ht,hu,hv,hw,hz,Nat.min_zero,Nat.cast_zero]
 simp only [h4seedM511,stripQuarticMD11,h4c0M511,h4c1M511,h4c2M511,
   mul_zero,add_zero,sub_zero,zero_add,zero_pow (by decide : 2≠0),map_zero]
 ring

theorem source_strip_fourMD11 (path : List Bool) (hb : 9 ≤ (frame path).mid.b)
 (hs : 4*(frame path).mid.a ≤ (frame path).mid.b) :
 24*((Bivariate.swap (frame path).mid.p).coeff 4).map (Int.castRingHom ℝ)=
 X^(frame path).mid.a*(1+X)^((frame path).mid.b-9)*
 stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b := by
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
 rw [strip_four_seedMD11 a b hs] at hclear
 have hz : (X^3*(1+X)^9 : ℝ[X])≠0 := by
   apply mul_ne_zero (pow_ne_zero _ Polynomial.X_ne_zero)
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : ℝ[X] => p.coeff 0) h
   norm_num [Polynomial.coeff_one] at hh
 have eb : (1+X:ℝ[X])^b=(1+X)^9*(1+X)^(b-9) := by
   rw [←pow_add]; congr 1; dsimp [b]; omega
 rw [eb] at hclear
 apply mul_left_cancel₀ hz
 change X^3*(1+X)^9*(24*p.map (Int.castRingHom ℝ))=
   X^3*(1+X)^9*(X^a*(1+X)^(b-9)*stripQuarticMD11 (a:ℝ) b)
 linear_combination hclear

theorem strip_four_coeffMD11 (path : List Bool) (hb : 9 ≤ (frame path).mid.b)
 (hs : 4*(frame path).mid.a ≤ (frame path).mid.b) (k : ℕ) :
 24*(coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-9)*
 stripQuarticMD11 ((frame path).mid.a:ℝ) (frame path).mid.b).coeff k := by
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+(frame path).mid.a))
   (source_strip_fourMD11 path hb hs)
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [Nat.add_comm,Int.coe_castRingHom] using hc
end
end MathGKM.Markov
