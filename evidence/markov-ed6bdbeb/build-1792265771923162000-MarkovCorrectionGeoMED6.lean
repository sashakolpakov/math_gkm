import MarkovMasterSumM3AE
import MarkovCorrectionColumnM3AE
/-! Machine-authored ed6bdbeb. Exact affine weights and rescaling. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 3000000

def affineGeoMED6 {R : Type*} [CommRing R] (a : R) (e : ℤ) : PowerSeries R :=
 (C (e:R)+C ((3-e:R))*C a*X)*geoM679 a^2

theorem affine_geo_expandMED6 {R : Type*} [CommRing R] (a : R) (e : ℤ) :
 affineGeoMED6 a e=C (e:R)*geoM679 a+3*C a*X*geoM679 a^2 := by
 have h := geo_inverseM679 a
 unfold affineGeoMED6
 simp only [map_sub,map_ofNat]
 linear_combination (C (e:R)*geoM679 a)*h

theorem affine_geo_coeffMED6 {R : Type*} [CommRing R] (a : R) (e : ℤ) (s : ℕ) :
 PowerSeries.coeff s (affineGeoMED6 a e)=a^s*(3*(s:R)+(e:R)) := by
 rw [affine_geo_expandMED6]
 cases s with
 | zero => simp [geoM679]
 | succ s =>
   have h : 3*C a*X*geoM679 a^2=X*(C (3*a)*(geoM679 a^(1+1))) := by
     simp only [map_mul,map_ofNat]; ring
   rw [h,map_add,coeff_C_mul,show PowerSeries.coeff (s+1) (geoM679 a)=a^(s+1) from coeff_mk _ _,
     coeff_succ_X_mul,coeff_C_mul,geo_pow_coeffM679]
   simp only [Nat.choose_one_right,Nat.cast_add,Nat.cast_one,pow_succ]
   ring

theorem rescale_geoMED6 {R : Type*} [CommRing R] (a b : R) :
 rescale b (geoM679 a)=geoM679 (b*a) := by
 ext n
 simp [coeff_rescale,geoM679,mul_pow]

theorem rescale_constMED6 {R : Type*} [CommRing R] (a b : R) :
 rescale b (C a)=C a := by
 apply PowerSeries.ext; intro n
 simp only [coeff_rescale,coeff_C]
 split_ifs with h
 · simp [h]
 · simp

theorem rescale_geo_twoMED6 {R : Type*} [CommRing R] (a b : R) :
 rescale b (geoTwoM3AE a)=geoTwoM3AE (b^2*a) := by
 apply PowerSeries.ext; intro n
 simp only [coeff_rescale,geoTwoM3AE,coeff_expand,geoM679,coeff_mk]
 split_ifs with h
 · have he : 2*(n/2)=n := Nat.mul_div_cancel' h
   rw [mul_pow,←pow_mul,he]
 · simp

def correctionCoreMED6 (t d : ℕ) (e : ℤ) : PowerSeries (Polynomial ℤ) :=
 X^d*((C (e:Polynomial ℤ)+C ((3-e:Polynomial ℤ))*C Polynomial.X*X^2)*
   geoTwoM3AE (Polynomial.X:Polynomial ℤ)^2)*
   geoM679 (1:Polynomial ℤ)^(t+2)*geoM679 Polynomial.X^(t+3)

theorem correction_column_rescaleMED6 (t : ℕ) (r : Bool) :
 correctionColumnM3AE t r=4*C Polynomial.X*rescale Polynomial.X
   (correctionCoreMED6 t (t+2+(if r then 1 else 0)) (if r then 2 else 1)) := by
 simp only [correctionCoreMED6,map_mul,map_pow,map_add,map_sub,map_ofNat,
   rescale_constMED6,rescale_X,rescale_geoMED6,rescale_geo_twoMED6,mul_one,
   ←pow_succ,show (Polynomial.X:Polynomial ℤ)^2*Polynomial.X=Polynomial.X^3 by ring]
 cases r <;>
   simp only [correctionColumnM3AE,Bool.false_eq_true,if_false,if_true,Nat.add_zero,
     Int.cast_ofNat,Int.cast_sub,Int.cast_one,map_ofNat,map_sub,map_one] <;>
   simp only [pow_add,mul_pow,map_pow] <;> ring

end
end MathGKM.Markov
