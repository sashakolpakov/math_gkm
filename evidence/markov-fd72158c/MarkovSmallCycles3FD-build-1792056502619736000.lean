import MarkovSmallPoly3FD
import MarkovThirdAllCycles8BBB
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem small_poly_all3FD (c r : ℕ) :
 thirdRunPolyADB2 3 c r=smallPoly3FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)+
 (if c=2 then 6*firstRunPolyADB2 3 c r*X^9 else 0) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,mul_add,small_factor3FD]
 norm_num only [Nat.cast_ofNat]
 rw [←low_band_polyFDDA (3:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 unfold delayedRFDDA
 split_ifs <;> norm_num only [Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul,Int.cast_ofNat]
 <;> ring
theorem small_cycle3_21FD :
 correctedThirdRun8BBB 3 2 1=(336*X^0 + 2340*X^1 + 7308*X^2 + 13608*X^3 + 16968*X^4 + 15072*X^5 + 9840*X^6 + 4728*X^7 + 1608*X^8 + 348*X^9 + 36*X^10:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all3FD]
 norm_num [smallPoly3FD,small3_0FD,small3_1FD,small3_2FD,small3_3FD,small3_4FD,small3_5FD,small3_6FD,small3_7FD,small3_8FD,small3_9FD,small3_10FD,small3_11FD,small3_12FD,small3_13FD,small3_14FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle3_21FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 3 2 1).coeff j*(correctedThirdRun8BBB 3 2 1).coeff (j+2) ≤
 ((correctedThirdRun8BBB 3 2 1).coeff (j+1))^2 := by
 rw [small_cycle3_21FD]
 by_cases hj : j ≤ 8
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (336*X^0 + 2340*X^1 + 7308*X^2 + 13608*X^3 + 16968*X^4 + 15072*X^5 + 9840*X^6 + 4728*X^7 + 1608*X^8 + 348*X^9 + 36*X^10:ℤ[X]).coeff (j+2)=0 := by
    have h0 : j+2≠0 := by omega
    have h1 : j+2≠1 := by omega
    have h2 : j+2≠2 := by omega
    have h3 : j+2≠3 := by omega
    have h4 : j+2≠4 := by omega
    have h5 : j+2≠5 := by omega
    have h6 : j+2≠6 := by omega
    have h7 : j+2≠7 := by omega
    have h8 : j+2≠8 := by omega
    have h9 : j+2≠9 := by omega
    have h10 : j+2≠10 := by omega
    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
      h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem small_cycle3_31FD :
 correctedThirdRun8BBB 3 3 1=(1320*X^0 + 9150*X^1 + 28824*X^2 + 55164*X^3 + 72456*X^4 + 69936*X^5 + 51768*X^6 + 30240*X^7 + 14256*X^8 + 5520*X^9 + 1752*X^10 + 432*X^11 + 72*X^12 + 6*X^13:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all3FD]
 norm_num [smallPoly3FD,small3_0FD,small3_1FD,small3_2FD,small3_3FD,small3_4FD,small3_5FD,small3_6FD,small3_7FD,small3_8FD,small3_9FD,small3_10FD,small3_11FD,small3_12FD,small3_13FD,small3_14FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle3_31FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 3 3 1).coeff j*(correctedThirdRun8BBB 3 3 1).coeff (j+2) ≤
 ((correctedThirdRun8BBB 3 3 1).coeff (j+1))^2 := by
 rw [small_cycle3_31FD]
 by_cases hj : j ≤ 11
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (1320*X^0 + 9150*X^1 + 28824*X^2 + 55164*X^3 + 72456*X^4 + 69936*X^5 + 51768*X^6 + 30240*X^7 + 14256*X^8 + 5520*X^9 + 1752*X^10 + 432*X^11 + 72*X^12 + 6*X^13:ℤ[X]).coeff (j+2)=0 := by
    have h0 : j+2≠0 := by omega
    have h1 : j+2≠1 := by omega
    have h2 : j+2≠2 := by omega
    have h3 : j+2≠3 := by omega
    have h4 : j+2≠4 := by omega
    have h5 : j+2≠5 := by omega
    have h6 : j+2≠6 := by omega
    have h7 : j+2≠7 := by omega
    have h8 : j+2≠8 := by omega
    have h9 : j+2≠9 := by omega
    have h10 : j+2≠10 := by omega
    have h11 : j+2≠11 := by omega
    have h12 : j+2≠12 := by omega
    have h13 : j+2≠13 := by omega
    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
      h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem small_cycle3_32FD :
 correctedThirdRun8BBB 3 3 2=(1716*X^0 + 12144*X^1 + 39318*X^2 + 78096*X^3 + 107952*X^4 + 111696*X^5 + 90576*X^6 + 59280*X^7 + 31968*X^8 + 14448*X^9 + 5520*X^10 + 1752*X^11 + 432*X^12 + 72*X^13 + 6*X^14:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all3FD]
 norm_num [smallPoly3FD,small3_0FD,small3_1FD,small3_2FD,small3_3FD,small3_4FD,small3_5FD,small3_6FD,small3_7FD,small3_8FD,small3_9FD,small3_10FD,small3_11FD,small3_12FD,small3_13FD,small3_14FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle3_32FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 3 3 2).coeff j*(correctedThirdRun8BBB 3 3 2).coeff (j+2) ≤
 ((correctedThirdRun8BBB 3 3 2).coeff (j+1))^2 := by
 rw [small_cycle3_32FD]
 by_cases hj : j ≤ 12
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (1716*X^0 + 12144*X^1 + 39318*X^2 + 78096*X^3 + 107952*X^4 + 111696*X^5 + 90576*X^6 + 59280*X^7 + 31968*X^8 + 14448*X^9 + 5520*X^10 + 1752*X^11 + 432*X^12 + 72*X^13 + 6*X^14:ℤ[X]).coeff (j+2)=0 := by
    have h0 : j+2≠0 := by omega
    have h1 : j+2≠1 := by omega
    have h2 : j+2≠2 := by omega
    have h3 : j+2≠3 := by omega
    have h4 : j+2≠4 := by omega
    have h5 : j+2≠5 := by omega
    have h6 : j+2≠6 := by omega
    have h7 : j+2≠7 := by omega
    have h8 : j+2≠8 := by omega
    have h9 : j+2≠9 := by omega
    have h10 : j+2≠10 := by omega
    have h11 : j+2≠11 := by omega
    have h12 : j+2≠12 := by omega
    have h13 : j+2≠13 := by omega
    have h14 : j+2≠14 := by omega
    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
      h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem small_cycles_lc3FD (c r : ℕ) (hc : c<4) (hr : 0<r) (hrc : r<c) (j : ℕ) :
 (correctedThirdRun8BBB 3 c r).coeff j*(correctedThirdRun8BBB 3 c r).coeff (j+2) ≤
 ((correctedThirdRun8BBB 3 c r).coeff (j+1))^2 := by
 have hc' : 2 ≤ c := by omega
 interval_cases c <;> interval_cases r
 · exact small_cycle3_21FD_lc j
 · exact small_cycle3_31FD_lc j
 · exact small_cycle3_32FD_lc j
end
end MathGKM.Markov
