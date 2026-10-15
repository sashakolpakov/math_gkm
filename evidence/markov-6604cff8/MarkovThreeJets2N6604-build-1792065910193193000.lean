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
theorem jet3_10_a1N6604 :
 (runBooleanGaugeADB2 3 true false).a.coeff 1=(1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_a2N6604 :
 (runBooleanGaugeADB2 3 true false).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_b2N6604 :
 (runBooleanGaugeADB2 3 true false).b.coeff 2=(3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_b3N6604 :
 (runBooleanGaugeADB2 3 true false).b.coeff 3=(3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c1N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6 + 2*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c2N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 2=(-3*X + -22*X^2 + -74*X^3 + -146*X^4 + -191*X^5 + -190*X^6 + -166*X^7 + -126*X^8 + -70*X^9 + -24*X^10 + -4*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c3N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 3=(-3*X + -26*X^2 + -106*X^3 + -268*X^4 + -473*X^5 + -632*X^6 + -680*X^7 + -600*X^8 + -414*X^9 + -202*X^10 + -60*X^11 + -8*X^12) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d1N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 1=(4 + 9*X + 8*X^2 + 4*X^3 + 2*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d2N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 2=(6 + 26*X + 48*X^2 + 54*X^3 + 50*X^4 + 42*X^5 + 26*X^6 + 10*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d3N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 3=(4 + 25*X + 70*X^2 + 120*X^3 + 150*X^4 + 153*X^5 + 126*X^6 + 74*X^7 + 26*X^8 + 4*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d4N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 4=(1 + 8*X + 29*X^2 + 64*X^3 + 99*X^4 + 118*X^5 + 113*X^6 + 84*X^7 + 44*X^8 + 14*X^9 + 2*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
end
end MathGKM.Markov
