import MarkovSmallFactor3FD
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 65536
set_option maxHeartbeats 8000000
theorem small_poly3FD (c r : ℕ) (hc : c ≠ 2) :
 thirdRunPolyADB2 3 c r=smallPoly3FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,small_factor3FD]
 norm_num only [Nat.cast_ofNat]
 rw [←low_band_polyFDDA (3:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 simp only [delayedRFDDA,hc,ite_false,add_zero,Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul]
 norm_num only [Int.cast_ofNat]
theorem small_coeff3FD (c r : ℕ) (hc : c ≠ 2) (j : ℕ) (hj : j ≤ 14) :
 (thirdRunPolyADB2 3 c r).coeff j=
 smallCoeff3FD c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) j := by
 rw [small_poly3FD c r hc]
 interval_cases j <;> simp only [smallPoly3FD,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,smallCoeff3FD] <;> norm_num
end
end MathGKM.Markov
