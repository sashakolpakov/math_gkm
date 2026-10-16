import MarkovRowRationalMFFD
import MarkovFifthShapeMFFD
/-! Machine-authored ffd747f5. Exact identification of the fifth residual row. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000

theorem fifth_residual_rationalMFFD (d : ℚ) :
 rowHQMFFD (11+d) 5=fifthPolyMFFD d := by
 norm_num [rowHQMFFD,rowJQMFFD,Finset.sum_range_succ,
   binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,
   binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,
   fifthPolyMFFD,fifthCoeffMFFD,←Polynomial.C_add,←Polynomial.C_mul,
   ←Polynomial.C_pow,←Polynomial.C_sub]
 ring

theorem fifth_residual_mapMFFD (n : ℕ) (hn : 11 ≤ n) :
 (rowHMFFD n 5).map (Int.castRingHom ℝ)=fifthPolyMFFD ((n:ℝ)-11) := by
 have h := rowH_mapMFFD n 5 (by omega)
 have he : (n:ℚ)=11+((n:ℚ)-11) := by ring
 rw [he,fifth_residual_rationalMFFD] at h
 have hh := congrArg (Polynomial.map (Rat.castHom ℝ)) h
 rw [fifth_mapMFFD] at hh
 have hc : (Rat.castHom ℝ).comp (Int.castRingHom ℚ)=Int.castRingHom ℝ := by
   ext x
   simp
 simpa only [Polynomial.map_map,hc,Rat.cast_sub,Rat.cast_natCast,Rat.cast_ofNat] using hh

end
end MathGKM.Markov
