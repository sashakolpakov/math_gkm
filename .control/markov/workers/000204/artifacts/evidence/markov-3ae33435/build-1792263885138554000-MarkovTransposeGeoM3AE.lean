import MarkovColumnSolveM3AE
/-! Machine-authored 3ae33435. Exact geometric-series transpositions. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 4000000

theorem series_transpose_geoM3AE :
 seriesTransposeM3AE (geoM679 (Polynomial.X:Polynomial ℤ))=geoM679 (X:PowerSeries ℤ) := by
 apply PowerSeries.ext; intro i
 apply PowerSeries.ext; intro n
 simp [series_transpose_coeffM3AE,geoM679,Polynomial.coeff_X_pow,coeff_X_pow,eq_comm]

theorem series_transpose_geo_twoM3AE :
 seriesTransposeM3AE (geoTwoM3AE (Polynomial.X:Polynomial ℤ))=geoM679 ((X:PowerSeries ℤ)^2) := by
 apply PowerSeries.ext; intro i
 apply PowerSeries.ext; intro n
 simp only [series_transpose_coeffM3AE,geoTwoM3AE,PowerSeries.coeff_expand,geoM679,
   coeff_mk,←pow_mul,coeff_X_pow]
 by_cases hn : 2 ∣ n
 · rw [if_pos hn,Polynomial.coeff_X_pow]
   have he : i=n/2 ↔ n=2*i := by omega
   simp only [he]
 · rw [if_neg hn,Polynomial.coeff_zero]
   rw [if_neg (by omega)]

theorem series_transpose_geo_oneM3AE :
 seriesTransposeM3AE (geoM679 (1:Polynomial ℤ))=C (geoM679 (1:ℤ)) := by
 apply PowerSeries.ext; intro i
 apply PowerSeries.ext; intro n
 simp only [series_transpose_coeffM3AE,geoM679,coeff_mk,one_pow,Polynomial.coeff_one,
   coeff_C]
 split_ifs <;> simp_all

theorem series_transpose_innerXM3AE :
 seriesTransposeM3AE (C (Polynomial.X:Polynomial ℤ))=(X:PowerSeries (PowerSeries ℤ)) := by
 rw [series_transpose_CM3AE]
 simp

end
end MathGKM.Markov
