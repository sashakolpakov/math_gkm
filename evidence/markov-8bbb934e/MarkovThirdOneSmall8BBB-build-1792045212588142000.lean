import MarkovThirdOneBridge8BBB
import MarkovThirdAllCycles8BBB
/-! Machine-authored request 8bbb934e. All coefficient positions for the
three exceptional run-one predecessor labels; zeros are not filtered. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
theorem corrected_one_218BBB :
 correctedThirdRun8BBB 1 2 1=(24 + 132*X^1 + 300*X^2 + 360*X^3 + 240*X^4 + 84*X^5 + 12*X^6:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [thirdRun_one_two8BBB]
 norm_num [thirdOnePoly8BBB,thirdOneSeq8BBB,firstRunPolyADB2,lowerH487,
   runSumA27,Finset.sum_range_succ]
 <;> ring
theorem corrected_one_lc_218BBB (j : ℕ) :
 (correctedThirdRun8BBB 1 2 1).coeff j*(correctedThirdRun8BBB 1 2 1).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 2 1).coeff (j+1))^2 := by
 rw [corrected_one_218BBB]
 by_cases hj : j<5
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_ofNat]
 · have hz : (24 + 132*X^1 + 300*X^2 + 360*X^3 + 240*X^4 + 84*X^5 + 12*X^6:ℤ[X]).coeff (j+2)=0 := by
     have h0 : j+2≠0 := by omega
     have h1 : j+2≠1 := by omega
     have h2 : j+2≠2 := by omega
     have h3 : j+2≠3 := by omega
     have h4 : j+2≠4 := by omega
     have h5 : j+2≠5 := by omega
     have h6 : j+2≠6 := by omega
     simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
       Polynomial.coeff_ofNat,h0,h1,h2,h3,h4,h5,h6,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem corrected_one_318BBB :
 correctedThirdRun8BBB 1 3 1=(120 + 636*X^1 + 1392*X^2 + 1614*X^3 + 1056*X^4 + 384*X^5 + 72*X^6 + 6*X^7:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [thirdRun_one_expand8BBB 3 1 (by decide)]
 norm_num [thirdOnePoly8BBB,thirdOneSeq8BBB,firstRunPolyADB2,lowerH487,
   runSumA27,Finset.sum_range_succ]
 <;> ring
theorem corrected_one_lc_318BBB (j : ℕ) :
 (correctedThirdRun8BBB 1 3 1).coeff j*(correctedThirdRun8BBB 1 3 1).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 3 1).coeff (j+1))^2 := by
 rw [corrected_one_318BBB]
 by_cases hj : j<6
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_ofNat]
 · have hz : (120 + 636*X^1 + 1392*X^2 + 1614*X^3 + 1056*X^4 + 384*X^5 + 72*X^6 + 6*X^7:ℤ[X]).coeff (j+2)=0 := by
     have h0 : j+2≠0 := by omega
     have h1 : j+2≠1 := by omega
     have h2 : j+2≠2 := by omega
     have h3 : j+2≠3 := by omega
     have h4 : j+2≠4 := by omega
     have h5 : j+2≠5 := by omega
     have h6 : j+2≠6 := by omega
     have h7 : j+2≠7 := by omega
     simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
       Polynomial.coeff_ofNat,h0,h1,h2,h3,h4,h5,h6,h7,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
theorem corrected_one_328BBB :
 correctedThirdRun8BBB 1 3 2=(210 + 1200*X^1 + 2904*X^2 + 3864*X^3 + 3072*X^4 + 1488*X^5 + 432*X^6 + 72*X^7 + 6*X^8:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [thirdRun_one_expand8BBB 3 2 (by decide)]
 norm_num [thirdOnePoly8BBB,thirdOneSeq8BBB,firstRunPolyADB2,lowerH487,
   runSumA27,Finset.sum_range_succ]
 <;> ring
theorem corrected_one_lc_328BBB (j : ℕ) :
 (correctedThirdRun8BBB 1 3 2).coeff j*(correctedThirdRun8BBB 1 3 2).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 3 2).coeff (j+1))^2 := by
 rw [corrected_one_328BBB]
 by_cases hj : j<7
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_ofNat]
 · have hz : (210 + 1200*X^1 + 2904*X^2 + 3864*X^3 + 3072*X^4 + 1488*X^5 + 432*X^6 + 72*X^7 + 6*X^8:ℤ[X]).coeff (j+2)=0 := by
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
       Polynomial.coeff_ofNat,h0,h1,h2,h3,h4,h5,h6,h7,h8,if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _

theorem corrected_one_small_lc8BBB (c r : ℕ) (hc : c<4) (hr : 0<r) (hrc : r<c) (j : ℕ) :
 (correctedThirdRun8BBB 1 c r).coeff j*(correctedThirdRun8BBB 1 c r).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 c r).coeff (j+1))^2 := by
 have h : c=2 ∧ r=1 ∨ c=3 ∧ r=1 ∨ c=3 ∧ r=2 := by omega
 rcases h with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
 · exact corrected_one_lc_218BBB j
 · exact corrected_one_lc_318BBB j
 · exact corrected_one_lc_328BBB j
#print axioms corrected_one_small_lc8BBB
end
end MathGKM.Markov
