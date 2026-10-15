import MarkovSmallPoly2FD
import MarkovThirdAllCycles8BBB
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem small_poly_all2FD (c r : ℕ) :
 thirdRunPolyADB2 2 c r=smallPoly2FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)+
 (if c=2 then 6*firstRunPolyADB2 2 c r*X^7 else 0) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,mul_add,small_factor2FD]
 norm_num only [Nat.cast_ofNat]
 rw [←low_band_polyFDDA (2:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 unfold delayedRFDDA
 split_ifs <;> norm_num only [Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul,Int.cast_ofNat]
 <;> ring
theorem small_cycle2_21FD :
 correctedThirdRun8BBB 2 2 1=(120*X^0 + 768*X^1 + 2136*X^2 + 3384*X^3 + 3360*X^4 + 2160*X^5 + 888*X^6 + 216*X^7 + 24*X^8:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all2FD]
 norm_num [smallPoly2FD,small2_0FD,small2_1FD,small2_2FD,small2_3FD,small2_4FD,small2_5FD,small2_6FD,small2_7FD,small2_8FD,small2_9FD,small2_10FD,small2_11FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle2_21FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 2 2 1).coeff j*(correctedThirdRun8BBB 2 2 1).coeff (j+2) ≤
 ((correctedThirdRun8BBB 2 2 1).coeff (j+1))^2 := by
 rw [small_cycle2_21FD]
 by_cases hj : j ≤ 6
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (120*X^0 + 768*X^1 + 2136*X^2 + 3384*X^3 + 3360*X^4 + 2160*X^5 + 888*X^6 + 216*X^7 + 24*X^8:ℤ[X]).coeff (j+2)=0 := by
    have h0 : j+2≠0 := by omega
    have h1 : j+2≠1 := by omega
    have h2 : j+2≠2 := by omega
    have h3 : j+2≠3 := by omega
    have h4 : j+2≠4 := by omega
    have h5 : j+2≠5 := by omega
    have h6 : j+2≠6 := by omega
    have h7 : j+2≠7 := by omega
    have h8 : j+2≠8 := by omega
    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
      h0,h1,h2,h3,h4,h5,h6,h7,h8,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem small_cycle2_31FD :
 correctedThirdRun8BBB 2 3 1=(504*X^0 + 3192*X^1 + 8898*X^2 + 14376*X^3 + 14928*X^4 + 10464*X^5 + 5088*X^6 + 1752*X^7 + 432*X^8 + 72*X^9 + 6*X^10:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all2FD]
 norm_num [smallPoly2FD,small2_0FD,small2_1FD,small2_2FD,small2_3FD,small2_4FD,small2_5FD,small2_6FD,small2_7FD,small2_8FD,small2_9FD,small2_10FD,small2_11FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle2_31FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 2 3 1).coeff j*(correctedThirdRun8BBB 2 3 1).coeff (j+2) ≤
 ((correctedThirdRun8BBB 2 3 1).coeff (j+1))^2 := by
 rw [small_cycle2_31FD]
 by_cases hj : j ≤ 8
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (504*X^0 + 3192*X^1 + 8898*X^2 + 14376*X^3 + 14928*X^4 + 10464*X^5 + 5088*X^6 + 1752*X^7 + 432*X^8 + 72*X^9 + 6*X^10:ℤ[X]).coeff (j+2)=0 := by
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
theorem small_cycle2_32FD :
 correctedThirdRun8BBB 2 3 2=(720*X^0 + 4728*X^1 + 13848*X^2 + 23970*X^3 + 27408*X^4 + 21936*X^5 + 12720*X^6 + 5472*X^7 + 1776*X^8 + 432*X^9 + 72*X^10 + 6*X^11:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all2FD]
 norm_num [smallPoly2FD,small2_0FD,small2_1FD,small2_2FD,small2_3FD,small2_4FD,small2_5FD,small2_6FD,small2_7FD,small2_8FD,small2_9FD,small2_10FD,small2_11FD,
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem small_cycle2_32FD_lc (j : ℕ) :
 (correctedThirdRun8BBB 2 3 2).coeff j*(correctedThirdRun8BBB 2 3 2).coeff (j+2) ≤
 ((correctedThirdRun8BBB 2 3 2).coeff (j+1))^2 := by
 rw [small_cycle2_32FD]
 by_cases hj : j ≤ 9
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : (720*X^0 + 4728*X^1 + 13848*X^2 + 23970*X^3 + 27408*X^4 + 21936*X^5 + 12720*X^6 + 5472*X^7 + 1776*X^8 + 432*X^9 + 72*X^10 + 6*X^11:ℤ[X]).coeff (j+2)=0 := by
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
    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
      h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem small_cycles_lc2FD (c r : ℕ) (hc : c<4) (hr : 0<r) (hrc : r<c) (j : ℕ) :
 (correctedThirdRun8BBB 2 c r).coeff j*(correctedThirdRun8BBB 2 c r).coeff (j+2) ≤
 ((correctedThirdRun8BBB 2 c r).coeff (j+1))^2 := by
 have hc' : 2 ≤ c := by omega
 interval_cases c <;> interval_cases r
 · exact small_cycle2_21FD_lc j
 · exact small_cycle2_31FD_lc j
 · exact small_cycle2_32FD_lc j
end
end MathGKM.Markov
