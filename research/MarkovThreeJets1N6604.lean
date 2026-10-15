import MarkovFourthRunMomentBE
import MarkovSmallPoly3FD
import MarkovGaugeCoeff6604
/-! Machine-authored 6604cff8, derived from preserved 062809ba draft. Exact local fourth moment for run three. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem jet3_01_a1N6604 :
 (runBooleanGaugeADB2 3 false true).a.coeff 1=(1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_a2N6604 :
 (runBooleanGaugeADB2 3 false true).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -53*X^5 + -46*X^6 + -26*X^7 + -10*X^8 + -2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_b2N6604 :
 (runBooleanGaugeADB2 3 false true).b.coeff 2=(4 + 11*X + 12*X^2 + 8*X^3 + 4*X^4 + 1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_b3N6604 :
 (runBooleanGaugeADB2 3 false true).b.coeff 3=(6 + 30*X + 63*X^2 + 72*X^3 + 48*X^4 + 18*X^5 + 3*X^6) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c1N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -48*X^5 + -34*X^6 + -14*X^7 + -2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c2N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 2=(-4*X + -31*X^2 + -114*X^3 + -266*X^4 + -432*X^5 + -509*X^6 + -454*X^7 + -318*X^8 + -176*X^9 + -76*X^10 + -24*X^11 + -4*X^12) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c3N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 3=(-6*X + -56*X^2 + -245*X^3 + -680*X^4 + -1354*X^5 + -2050*X^6 + -2425*X^7 + -2264*X^8 + -1658*X^9 + -926*X^10 + -372*X^11 + -96*X^12 + -12*X^13) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d1N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 1=(5 + 12*X + 12*X^2 + 8*X^3 + 2*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d2N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 2=(10 + 46*X + 92*X^2 + 110*X^3 + 90*X^4 + 54*X^5 + 26*X^6 + 10*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d3N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 3=(10 + 66*X + 195*X^2 + 350*X^3 + 438*X^4 + 408*X^5 + 283*X^6 + 138*X^7 + 42*X^8 + 6*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d4N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 4=(5 + 42*X + 161*X^2 + 378*X^3 + 615*X^4 + 736*X^5 + 657*X^6 + 426*X^7 + 188*X^8 + 50*X^9 + 6*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
end
end MathGKM.Markov
