import MarkovColumnSolveM3AE
/-! Machine-authored 3ae33435. Universal column generating function of the
master summand, including all series indices. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 8000000

def masterColumnM3AE (t : ℕ) : PowerSeries (Polynomial ℤ) :=
 X^(t+1)*(1+C Polynomial.X*X^2)^2*geoTwoM3AE Polynomial.X^2*
 geoM679 Polynomial.X^(t+4)*geoM679 (1:Polynomial ℤ)^(t+1)

theorem master_columnM3AE (t : ℕ) :
 PowerSeries.coeff (t+3) (seriesTransposeM3AE gfMasterSeriesM13E)=masterColumnM3AE t := by
 let v : PowerSeries (Polynomial ℤ) := C Polynomial.X
 let z : PowerSeries (Polynomial ℤ) := X
 let a := (1-z)*(1-v*z)
 let d := (1-v*z^2)^2*(1-v*z)^3
 let ai := geoM679 (1:Polynomial ℤ)*geoM679 Polynomial.X
 let di := geoTwoM3AE Polynomial.X^2*geoM679 Polynomial.X^3
 have h0 : (1-z)*geoM679 (1:Polynomial ℤ)=1 := by simpa [z] using geo_inverse_leftM3AE (1:Polynomial ℤ)
 have h1 : (1-v*z)*geoM679 Polynomial.X=1 := geo_inverse_leftM3AE _
 have h2 : (1-v*z^2)*geoTwoM3AE Polynomial.X=1 := geo_two_inverseM3AE _
 have ha : a*ai=1 := by
  change ((1-z)*(1-v*z))*(geoM679 (1:Polynomial ℤ)*geoM679 Polynomial.X)=1
  calc
   _ = ((1-z)*geoM679 (1:Polynomial ℤ))*((1-v*z)*geoM679 Polynomial.X) := by ring
   _ = 1 := by rw [h0,h1,one_mul]
 have hd : d*di=1 := by
  change ((1-v*z^2)^2*(1-v*z)^3)*(geoTwoM3AE Polynomial.X^2*geoM679 Polynomial.X^3)=1
  calc
   _ = ((1-v*z^2)*geoTwoM3AE Polynomial.X)^2*((1-v*z)*geoM679 Polynomial.X)^3 := by ring
   _ = 1 := by rw [h2,h1]; norm_num
 have he : C d*(C a-X*C z)*seriesTransposeM3AE gfMasterSeriesM13E=
     X^3*C (z*(1+v*z^2)^2) := by
  have h := congrArg seriesTransposeM3AE gf_master_equationM13E
  simp only [gfMasterDenM13E,gfMasterNumM13E,map_mul,map_pow,map_sub,map_add,map_one,
    series_transpose_uM3AE,series_transpose_vM3AE,series_transpose_XM3AE] at h
  simpa only [d,a,v,z,map_mul,map_pow,map_sub,map_add,map_one] using h
 rw [column_coeffM3AE d a z _ di ai hd ha _ he t]
 simp only [masterColumnM3AE,di,ai,v,z,mul_pow,pow_add,pow_one]
 ring

theorem master_raw_columnM3AE (n t j : ℕ) :
 coeff (PowerSeries.coeff n gfMasterSeriesM13E) (t+3) j=
 (PowerSeries.coeff n (masterColumnM3AE t)).coeff j := by
 rw [←master_columnM3AE,series_transpose_coeffM3AE]
 rfl

end
end MathGKM.Markov
