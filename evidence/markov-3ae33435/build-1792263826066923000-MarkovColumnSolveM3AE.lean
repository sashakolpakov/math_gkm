import MarkovSeriesTransposeM3AE
/-! Machine-authored 3ae33435. Algebraic column extraction with explicit inverses. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 6000000

theorem column_solveM3AE {R : Type*} [CommRing R]
 (d a b n di ai : R) (hd : d*di=1) (ha : a*ai=1)
 (f : PowerSeries R) (he : C d*(C a-X*C b)*f=X^3*C n) :
 f=X^3*(C (n*di*ai)*geoM679 (b*ai)) := by
 have hfac : C d*(C a-X*C b)*C (di*ai)=1-C (b*ai)*X := by
  calc
   _ = C (d*di)*(C (a*ai)-C (b*ai)*X) := by simp only [map_mul]; ring
   _ = _ := by rw [hd,ha,map_one,one_mul]
 have hinv : (C (di*ai)*geoM679 (b*ai))*(C d*(C a-X*C b))=1 := by
  calc
   _ = geoM679 (b*ai)*(C d*(C a-X*C b)*C (di*ai)) := by ring
   _ = _ := by rw [hfac,geo_inverseM679]
 calc
  f = ((C (di*ai)*geoM679 (b*ai))*(C d*(C a-X*C b)))*f := by rw [hinv,one_mul]
  _ = (C (di*ai)*geoM679 (b*ai))*(C d*(C a-X*C b)*f) := by ring
  _ = (C (di*ai)*geoM679 (b*ai))*(X^3*C n) := by rw [he]
  _ = _ := by simp only [map_mul]; ring

theorem column_coeffM3AE {R : Type*} [CommRing R]
 (d a b n di ai : R) (hd : d*di=1) (ha : a*ai=1)
 (f : PowerSeries R) (he : C d*(C a-X*C b)*f=X^3*C n) (t : ℕ) :
 PowerSeries.coeff (t+3) f=n*di*ai*(b*ai)^t := by
 rw [column_solveM3AE d a b n di ai hd ha f he,
   PowerSeries.coeff_X_pow_mul,PowerSeries.coeff_C_mul]
 simp [geoM679]

def geoTwoM3AE {R : Type*} [CommRing R] (a : R) : PowerSeries R :=
 PowerSeries.expand 2 (by decide) (geoM679 a)

theorem geo_two_inverseM3AE {R : Type*} [CommRing R] (a : R) :
 (1-C a*X^2)*geoTwoM3AE a=1 := by
 have h := congrArg (PowerSeries.expand 2 (by decide) (R:=R)) (geo_inverseM679 a)
 simpa only [map_mul,map_sub,map_one,expand_C,expand_X,mul_comm,geoTwoM3AE] using h

theorem geo_inverse_leftM3AE {R : Type*} [CommRing R] (a : R) :
 (1-C a*X)*geoM679 a=1 := by rw [mul_comm,geo_inverseM679]

end
end MathGKM.Markov
