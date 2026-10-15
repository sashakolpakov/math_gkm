import MarkovInteriorSourceFDDA
/-! Machine-authored fd72158c: exact small-run coefficient identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def small2_0FD (c r q t u : ℤ) : ℤ :=
 -6 + 11*r + -6*r^2 + 1*r^3 + 33*c + -36*c*r + 9*c*r^2 + -54*c^2 + 27*c^2*r + 27*c^3
def small2_1FD (c r q t u : ℤ) : ℤ :=
 -18 + 87*r + -54*r^2 + 9*r^3 + 171*c + -267*c*r + 72*c*r^2 + -315*c^2 + 189*c^2*r + 162*c^3
def small2_2FD (c r q t u : ℤ) : ℤ :=
 -18 + 393*r + -246*r^2 + 39*r^3 + 432*c + -981*c*r + 273*c*r^2 + -846*c^2 + 612*c^2*r + 432*c^3
def small2_3FD (c r q t u : ℤ) : ℤ :=
 -6 + 1365*r + -774*r^2 + 111*r^3 + 546*c + -2412*c*r + 666*c*r^2 + -1248*c^2 + 1224*c^2*r + 648*c^3
def small2_4FD (c r q t u : ℤ) : ℤ :=
 2856*r + -1692*r^2 + 228*r^3 + 192*c + -3948*c*r + 1140*c*r^2 + -984*c^2 + 1632*c^2*r + 576*c^3
def small2_5FD (c r q t u : ℤ) : ℤ :=
 3456*r + -2556*r^2 + 348*r^3 + -360*c + -4080*c*r + 1392*c*r^2 + -264*c^2 + 1440*c^2*r + 288*c^3
def small2_6FD (c r q t u : ℤ) : ℤ :=
 2168*r + -2688*r^2 + 400*r^3 + -448*c + -2328*c*r + 1200*c*r^2 + 144*c^2 + 768*c^2*r + 64*c^3
def small2_7FD (c r q t u : ℤ) : ℤ :=
 -360*q + 456*r + 24*r*q + -1776*r^2 + 336*r^3 + -144*c + 72*c*q + -480*c*r + 672*c*r^2 + 96*c^2 + 192*c^2*r
def small2_8FD (c r q t u : ℤ) : ℤ :=
 -744*q + -120*r + 72*r*q + -576*r^2 + 192*r^3 + 24*c + 144*c*q + 96*c*r + 192*c*r^2
def small2_9FD (c r q t u : ℤ) : ℤ :=
 -576*q + 8*r + 96*r*q + 64*r^3 + 96*c*q
def small2_10FD (c r q t u : ℤ) : ℤ :=
 24*t + -144*q + 96*r*q
def small2_11FD (c r q t u : ℤ) : ℤ :=
 24*u
def smallCoeff2FD (c r q t u : ℤ) : ℕ → ℤ
 | 0 => small2_0FD c r q t u
 | 1 => small2_1FD c r q t u
 | 2 => small2_2FD c r q t u
 | 3 => small2_3FD c r q t u
 | 4 => small2_4FD c r q t u
 | 5 => small2_5FD c r q t u
 | 6 => small2_6FD c r q t u
 | 7 => small2_7FD c r q t u
 | 8 => small2_8FD c r q t u
 | 9 => small2_9FD c r q t u
 | 10 => small2_10FD c r q t u
 | 11 => small2_11FD c r q t u
 | _ => 0
def smallPoly2FD (c r q t u : ℤ) : ℤ[X] :=
 C (small2_0FD c r q t u)*X^0+C (small2_1FD c r q t u)*X^1+C (small2_2FD c r q t u)*X^2+C (small2_3FD c r q t u)*X^3+C (small2_4FD c r q t u)*X^4+C (small2_5FD c r q t u)*X^5+C (small2_6FD c r q t u)*X^6+C (small2_7FD c r q t u)*X^7+C (small2_8FD c r q t u)*X^8+C (small2_9FD c r q t u)*X^9+C (small2_10FD c r q t u)*X^10+C (small2_11FD c r q t u)*X^11
theorem small_factor2FD (c r q t u : ℤ) :
 (1-X)^6*smallPoly2FD c r q t u=
 normalBand0FDDA (2:ℤ[X]) c r q t u X+
 X^4*(normalTail1FDDA (2:ℤ[X]) c r q t u X+
 X^3*normalTail2FDDA (2:ℤ[X]) c r q t u X+
 X^6*normalTail3FDDA (2:ℤ[X]) c r q t u X) := by
 simp only [smallPoly2FD,normalBand0FDDA,normalTail1FDDA,normalTail2FDDA,normalTail3FDDA,
 small2_0FD,small2_1FD,small2_2FD,small2_3FD,small2_4FD,small2_5FD,small2_6FD,small2_7FD,small2_8FD,small2_9FD,small2_10FD,small2_11FD,map_add,map_mul,map_pow,map_neg,map_ofNat,Polynomial.C_eq_intCast]
 ring
theorem small_poly2FD (c r : ℕ) (hc : c ≠ 2) :
 thirdRunPolyADB2 2 c r=smallPoly2FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,small_factor2FD]
 rw [←low_band_polyFDDA (2:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 simp only [delayedRFDDA,hc,ite_false,add_zero,Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul]
 norm_num only [Int.cast_ofNat]
theorem small_coeff2FD (c r : ℕ) (hc : c ≠ 2) (j : ℕ) (hj : j ≤ 11) :
 (thirdRunPolyADB2 2 c r).coeff j=
 smallCoeff2FD c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) j := by
 rw [small_poly2FD c r hc]
 interval_cases j <;> simp [smallPoly2FD,smallCoeff2FD]
end
end MathGKM.Markov
