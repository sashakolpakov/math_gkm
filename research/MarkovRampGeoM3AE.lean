import MarkovTransposeGeoM3AE
/-! Machine-authored 3ae33435. Exact ramp coefficients over any commutative ring. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 5000000

def rampGeoM3AE {R : Type*} [CommRing R] (a : R) : PowerSeries R :=
 (1+C a*X)^2*geoM679 a^2

theorem ramp_geo_expandM3AE {R : Type*} [CommRing R] (a : R) :
 rampGeoM3AE a=1+4*C a*X*geoM679 a^2 := by
 have h := congrArg (fun f : PowerSeries R => f^2) (geo_inverseM679 a)
 simp only [one_pow] at h
 unfold rampGeoM3AE
 linear_combination h

theorem ramp_geo_coeffM3AE {R : Type*} [CommRing R] (a : R) (s : ℕ) :
 PowerSeries.coeff s (rampGeoM3AE a)=a^s*(if s=0 then 1 else (4*s:R)) := by
 rw [ramp_geo_expandM3AE]
 cases s with
 | zero => simp
 | succ s =>
  have h : 4*C a*X*geoM679 a^2=X*(C (4*a)*(geoM679 a^(1+1))) := by simp only [map_mul,map_ofNat]; ring
  rw [h,map_add,coeff_one,if_neg (by omega),zero_add,coeff_succ_X_mul,coeff_C_mul,geo_pow_coeffM679]
  simp only [show s+1≠0 by omega,if_false,Nat.choose_one_right,Nat.cast_add,Nat.cast_one,pow_succ]
  ring

end
end MathGKM.Markov
