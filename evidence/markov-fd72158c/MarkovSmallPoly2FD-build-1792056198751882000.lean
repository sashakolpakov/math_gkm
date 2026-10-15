import MarkovSmallFactor2FD
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 65536
set_option maxHeartbeats 8000000
theorem small_poly2FD (c r : ℕ) (hc : c ≠ 2) :
 thirdRunPolyADB2 2 c r=smallPoly2FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 trace "start"
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 trace "have nonzero"
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 trace "cancel applied"
 rw [source_denominatorFDDA,small_factor2FD]
 trace "denominator rewrite"
 norm_num only [Nat.cast_ofNat]
 trace "cast normalization"
 rw [←low_band_polyFDDA (2:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 trace "band rewrite"
 simp only [delayedRFDDA,hc,ite_false,add_zero,Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul]
 trace "delayed unfold"
 norm_num only [Int.cast_ofNat]
 trace "done"
theorem small_coeff2FD (c r : ℕ) (hc : c ≠ 2) (j : ℕ) (hj : j ≤ 11) :
 (thirdRunPolyADB2 2 c r).coeff j=
 smallCoeff2FD c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) j := by
 rw [small_poly2FD c r hc]
 interval_cases j <;> simp only [smallPoly2FD,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,smallCoeff2FD] <;> norm_num
end
end MathGKM.Markov
