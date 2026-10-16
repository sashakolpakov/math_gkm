import MarkovStripGeneralSourceMCE8
import MarkovHorizontalFourthSourceM511
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem high_second_coeffM81F (path : List Bool) (hb : 5 ≤ (frame path).mid.b) (k : ℕ) :
 2*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 2:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-5)*stripSecondSeedMCE8 ((frame path).mid.a:ℝ)
 (frame path).mid.b (2*(frame path).mid.a-(frame path).mid.b:ℕ)).coeff k := by
 have ha := (frame_reduced path).1
 have hm (a b q : ℤ) : (stripSecondSeedMCE8 a b q).map (Int.castRingHom ℝ)=stripSecondSeedMCE8 (a:ℝ) b q := by
   simp [stripSecondSeedMCE8,strip_quad_mapMB9D,map_ofNat]
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (source_second_generalMCE8 path hb)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,hm,Int.cast_natCast] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+((frame path).mid.a-1))) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [show k+((frame path).mid.a-1)=(frame path).mid.a+k by omega,Int.coe_castRingHom] using hc

theorem high_third_coeffM81F (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (k : ℕ) :
 6*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 3:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-7)*h3seedM13D ((frame path).mid.a:ℝ) (frame path).mid.b
 (2*(frame path).mid.a-(frame path).mid.b:ℕ)
 (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
 (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)).coeff (k+1) := by
 have hm (a b q t u : ℤ) : (h3seedM13D a b q t u).map (Int.castRingHom ℝ)=h3seedM13D (a:ℝ) b q t u := by
   simp [h3seedM13D,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,map_ofNat]
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (horizontal_third_formulaM13D path ha hb)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,hm,Int.cast_natCast] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+1+((frame path).mid.a-2))) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [show k+1+((frame path).mid.a-2)=(frame path).mid.a+k by omega,Int.coe_castRingHom] using hc
theorem high_fourth_coeffM81F (path : List Bool) (ha : 3 ≤ (frame path).mid.a)
 (hb : 9 ≤ (frame path).mid.b) (k : ℕ) :
 24*(coeff (frame path).mid.p ((frame path).mid.a-1+k) 4:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-9)*h4sourceSeedM511
 (frame path).mid.a (frame path).mid.b).coeff (k+2) := by
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (horizontal_fourth_formulaM511 path ha hb)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,h4source_seed_mapM511] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+2+((frame path).mid.a-3))) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [show k+2+((frame path).mid.a-3)=(frame path).mid.a-1+k by omega,Int.coe_castRingHom] using hc
end
end MathGKM.Markov
