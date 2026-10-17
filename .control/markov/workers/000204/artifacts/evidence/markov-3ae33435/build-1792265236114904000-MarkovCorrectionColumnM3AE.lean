import MarkovColumnSolveM3AE
/-! Machine-authored 3ae33435. Exact correction-column series. Its final
guarded affine-binomial kernel extraction is a separate obligation. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 1500000
attribute [local irreducible] gfESeriesM13E
attribute [local irreducible] geoTwoM3AE geoM679

def correctionColumnM3AE (t : ℕ) (r : Bool) : PowerSeries (Polynomial ℤ) :=
 let v : PowerSeries (Polynomial ℤ) := C Polynomial.X
 let n := if r then 4*v^4*X^3*(2+v^3*X^2) else 4*v^3*X^2*(1+2*v^3*X^2)
 let ai := geoM679 Polynomial.X*geoM679 (Polynomial.X^2:Polynomial ℤ)
 let di := geoTwoM3AE (Polynomial.X^3:Polynomial ℤ)^2*
   geoM679 Polynomial.X*geoM679 (Polynomial.X^2:Polynomial ℤ)^2
 n*di*ai*(v*X*ai)^t

theorem correction_columnM3AE (t : ℕ) (r : Bool) :
 PowerSeries.coeff (t+3) (seriesTransposeM3AE (gfESeriesM13E r))=correctionColumnM3AE t r := by
 let v : PowerSeries (Polynomial ℤ) := C Polynomial.X
 let z : PowerSeries (Polynomial ℤ) := X
 let a := (1-v*z)*(1-v^2*z)
 let d := (1-v^3*z^2)^2*(1-v*z)*(1-v^2*z)^2
 let ai := geoM679 (Polynomial.X:Polynomial ℤ)*geoM679 (Polynomial.X^2:Polynomial ℤ)
 let di := geoTwoM3AE (Polynomial.X^3:Polynomial ℤ)^2*
   geoM679 Polynomial.X*geoM679 (Polynomial.X^2:Polynomial ℤ)^2
 let n := if r then 4*v^4*z^3*(2+v^3*z^2) else 4*v^3*z^2*(1+2*v^3*z^2)
 have h1 : (1-v*z)*geoM679 Polynomial.X=1 := geo_inverse_leftM3AE _
 have h2 : (1-v^2*z)*geoM679 (Polynomial.X^2:Polynomial ℤ)=1 := by
   simpa only [v,z,map_pow] using geo_inverse_leftM3AE (Polynomial.X^2:Polynomial ℤ)
 have h3 : (1-v^3*z^2)*geoTwoM3AE (Polynomial.X^3:Polynomial ℤ)=1 := by
   simpa only [v,z,map_pow] using geo_two_inverseM3AE (Polynomial.X^3:Polynomial ℤ)
 have ha : a*ai=1 := by
  change ((1-v*z)*(1-v^2*z))*(geoM679 Polynomial.X*geoM679 (Polynomial.X^2:Polynomial ℤ))=1
  calc
   _ = ((1-v*z)*geoM679 Polynomial.X)*((1-v^2*z)*geoM679 (Polynomial.X^2:Polynomial ℤ)) := by ring
   _ = 1 := by rw [h1,h2,one_mul]
 have hd : d*di=1 := by
  change ((1-v^3*z^2)^2*(1-v*z)*(1-v^2*z)^2)*
    (geoTwoM3AE (Polynomial.X^3:Polynomial ℤ)^2*geoM679 Polynomial.X*geoM679 (Polynomial.X^2:Polynomial ℤ)^2)=1
  calc
   _ = ((1-v^3*z^2)*geoTwoM3AE (Polynomial.X^3:Polynomial ℤ))^2*
     ((1-v*z)*geoM679 Polynomial.X)*((1-v^2*z)*geoM679 (Polynomial.X^2:Polynomial ℤ))^2 := by ring
   _ = 1 := by rw [h3,h1,h2]; norm_num
 have he : C d*(C a-X*C (v*z))*seriesTransposeM3AE (gfESeriesM13E r)=X^3*C n := by
  have h := congrArg seriesTransposeM3AE (gf_e_equationM13E r)
  cases r <;>
   simp only [gfEDenomM13E,gfRampM13E,gfLowerM13E,gfSmallM13E,gfENumM13E,
     Bool.false_eq_true,if_false,if_true,map_mul,map_pow,map_sub,map_add,map_one,map_ofNat,
     series_transpose_uM3AE,series_transpose_vM3AE,series_transpose_XM3AE] at h <;>
   dsimp only [d,a,n,v,z] <;>
   simp only [Bool.false_eq_true,if_false,if_true,map_mul,map_pow,map_sub,map_add,map_one,map_ofNat] <;>
   linear_combination h
 exact column_coeffM3AE d a (v*z) n di ai hd ha _ he t

theorem correction_raw_columnM3AE (q t j : ℕ) (r : Bool) :
 coeff (PowerSeries.coeff q (gfESeriesM13E r)) (t+3) j=
 (PowerSeries.coeff q (correctionColumnM3AE t r)).coeff j := by
 rw [←correction_columnM3AE,series_transpose_coeffM3AE]
 rfl

end
end MathGKM.Markov
