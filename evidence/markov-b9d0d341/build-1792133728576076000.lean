import MarkovBottomCoefficientsMAA6
import MarkovHorizontalThirdSourceM13D
/-! Machine-authored b9d0d341. Exact source formulas in the low-slope cone. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

def stripQuadMB9D {R : Type*} [CommRing R] (a b : R) : R[X] :=
 C (9*a^2-5*a+2)+C (6*a^2+6*a*b-16*a+4)*X+C ((a+b-1)*(a+b-2))*X^2
def stripCubicMB9D {R : Type*} [CommRing R] (a b : R) : R[X] :=
 C (h3c2M13D a b 0)+C (h3c3M13D a b)*X+C (h3c4M13D a b)*X^2+C (h3c5M13D a b)*X^3

theorem source_strip_twoMB9D (path : List Bool) (hb : 5 ≤ (frame path).mid.b)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) :
 2*(Bivariate.swap (frame path).mid.p).coeff 2=
 X^(frame path).mid.a*(1+X)^((frame path).mid.b-5)*
 stripQuadMB9D ((frame path).mid.a:ℤ) (frame path).mid.b := by
 obtain ⟨n,m,s,hn,hm,hn3,hstat,he⟩ := source_second_exactMAA6 path hb
 have hz : s=0 := by omega
 have hf : secondExpr8934 (X:ℤ[X]) n m s=
   X*stripQuadMB9D ((frame path).mid.a:ℤ) (frame path).mid.b := by
   have hmR : (m:ℤ)+1=(frame path).mid.a := by exact_mod_cast hm
   have hnR : (n:ℤ)+2=(frame path).mid.b := by exact_mod_cast hn
   rw [hz,←hmR,←hnR]
   simp only [secondExpr8934,stripQuadMB9D,map_add,map_mul,map_pow,map_natCast,map_ofNat,map_one,map_sub]
   ring
 rw [he,hf,show n-3=(frame path).mid.b-5 by omega]
 rw [←hm,pow_succ]
 ring


theorem source_strip_threeMB9D (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (hs : 3*(frame path).mid.a ≤ (frame path).mid.b) :
 6*(Bivariate.swap (frame path).mid.p).coeff 3=
 X^(frame path).mid.a*(1+X)^((frame path).mid.b-7)*
 stripCubicMB9D ((frame path).mid.a:ℤ) (frame path).mid.b := by
 have h := horizontal_third_formulaM13D path ha hb
 dsimp only [HorizontalThirdFormulaM13D] at h
 have hq : 2*(frame path).mid.a-(frame path).mid.b=0 := by omega
 have ht : 3*(frame path).mid.a-(frame path).mid.b=0 := by omega
 have hu : 3*(frame path).mid.a-2*(frame path).mid.b=0 := by omega
 rw [hq,ht,hu,Nat.min_zero] at h
 have hf (a b : ℤ) : h3seedM13D a b 0 0 0=X^2*stripCubicMB9D a b := by
   simp only [h3seedM13D,stripCubicMB9D,h3c0M13D,h3c1M13D,mul_zero,add_zero,map_zero]
   ring
 norm_num only [Nat.cast_zero] at h
 rw [hf] at h
 have he : (X:ℤ[X])^(frame path).mid.a=X^((frame path).mid.a-2)*X^2 := by
   rw [←pow_add,Nat.sub_add_cancel ha]
 rw [h,he]
 ring


theorem strip_quad_mapMB9D (a b : ℤ) :
 (stripQuadMB9D a b).map (Int.castRingHom ℝ)=stripQuadMB9D (a:ℝ) b := by
 simp [stripQuadMB9D]

theorem strip_cubic_mapMB9D (a b : ℤ) :
 (stripCubicMB9D a b).map (Int.castRingHom ℝ)=stripCubicMB9D (a:ℝ) b := by
 simp [stripCubicMB9D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D]

theorem strip_two_coeffMB9D (path : List Bool) (hb : 5 ≤ (frame path).mid.b)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (k : ℕ) :
 2*(coeff (frame path).mid.p ((frame path).mid.a+k) 2:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-5)*
 stripQuadMB9D ((frame path).mid.a:ℝ) (frame path).mid.b).coeff k := by
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (source_strip_twoMB9D path hb hs)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,strip_quad_mapMB9D,Int.cast_natCast] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+(frame path).mid.a)) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [Nat.add_comm] using hc


theorem strip_three_coeffMB9D (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (hs : 3*(frame path).mid.a ≤ (frame path).mid.b) (k : ℕ) :
 6*(coeff (frame path).mid.p ((frame path).mid.a+k) 3:ℝ)=
 ((1+(X:ℝ[X]))^((frame path).mid.b-7)*
 stripCubicMB9D ((frame path).mid.a:ℝ) (frame path).mid.b).coeff k := by
 have h := congrArg (Polynomial.map (Int.castRingHom ℝ)) (source_strip_threeMB9D path ha hb hs)
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,strip_cubic_mapMB9D,Int.cast_natCast] at h
 have hc := congrArg (fun p : ℝ[X] => p.coeff (k+(frame path).mid.a)) h
 rw [mul_assoc,Polynomial.coeff_X_pow_mul,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_map,swap_coeff46] at hc
 simpa only [Nat.add_comm] using hc
end
end MathGKM.Markov
