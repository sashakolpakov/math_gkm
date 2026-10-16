import MarkovStripCoefficientsMB9D
/-! Machine-authored ce882be3. Exact correction for 2a <= b <= 3a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

def stripSeedMCE8 {R : Type*} [CommRing R] (a b t : R) : R[X] :=
 C (24*t)+X*stripCubicMB9D a b

theorem source_strip_threeMCE8 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) :
 6*(Bivariate.swap (frame path).mid.p).coeff 3=
 X^((frame path).mid.a-1)*(1+X)^((frame path).mid.b-7)*
 stripSeedMCE8 ((frame path).mid.a:ℤ) (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ) := by
 have h := horizontal_third_formulaM13D path ha hb
 dsimp only [HorizontalThirdFormulaM13D] at h
 have hq : 2*(frame path).mid.a-(frame path).mid.b=0 := by omega
 have hu : 3*(frame path).mid.a-2*(frame path).mid.b=0 := by omega
 have ht : min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b)=
   3*(frame path).mid.a-(frame path).mid.b := by omega
 rw [hq,hu,ht] at h
 norm_num only [Nat.cast_zero] at h
 have hf (a b t : ℤ) : h3seedM13D a b 0 t 0=X*stripSeedMCE8 a b t := by
   simp only [h3seedM13D,stripSeedMCE8,stripCubicMB9D,h3c0M13D,h3c1M13D,mul_zero,add_zero,map_zero]
   ring
 rw [hf] at h
 have he : (X:ℤ[X])^((frame path).mid.a-1)=X^((frame path).mid.a-2)*X := by
   rw [←pow_succ]; congr 1; omega
 rw [h,he]
 ring

theorem strip_seed_mapMCE8 (a b t : ℤ) :
 (stripSeedMCE8 a b t).map (Int.castRingHom ℝ)=stripSeedMCE8 (a:ℝ) b t := by
 simp [stripSeedMCE8,strip_cubic_mapMB9D,map_ofNat]

theorem strip_three_coeffMCE8 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (k : ℕ) :
 6*(coeff (frame path).mid.p ((frame path).mid.a+k) 3:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-7)*
 stripSeedMCE8 ((frame path).mid.a:ℝ) (frame path).mid.b (3*(frame path).mid.a-(frame path).mid.b:ℕ)).coeff (k+1) := by
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (source_strip_threeMCE8 path ha hb hs)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,strip_seed_mapMCE8,Int.cast_natCast] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+1+((frame path).mid.a-1))) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [show k+1+((frame path).mid.a-1)=(frame path).mid.a+k by omega,Int.coe_castRingHom] using hc
end
end MathGKM.Markov
