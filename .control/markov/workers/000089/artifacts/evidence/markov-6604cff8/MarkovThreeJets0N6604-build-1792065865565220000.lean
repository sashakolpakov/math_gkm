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
theorem jet3_00_a1N6604 :
 (runBooleanGaugeADB2 3 false false).a.coeff 1=(1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_a2N6604 :
 (runBooleanGaugeADB2 3 false false).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_b2N6604 :
 (runBooleanGaugeADB2 3 false false).b.coeff 2=(3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_b3N6604 :
 (runBooleanGaugeADB2 3 false false).b.coeff 3=(3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c1N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6 + 2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c2N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 2=(-3*X + -22*X^2 + -74*X^3 + -146*X^4 + -189*X^5 + -178*X^6 + -130*X^7 + -70*X^8 + -24*X^9 + -4*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c3N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 3=(-3*X + -26*X^2 + -106*X^3 + -268*X^4 + -469*X^5 + -602*X^6 + -580*X^7 + -412*X^8 + -202*X^9 + -60*X^10 + -8*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d1N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 1=(4 + 9*X + 8*X^2 + 4*X^3) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d2N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 2=(6 + 26*X + 48*X^2 + 54*X^3 + 44*X^4 + 26*X^5 + 10*X^6 + 2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d3N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 3=(4 + 25*X + 70*X^2 + 120*X^3 + 144*X^4 + 125*X^5 + 74*X^6 + 26*X^7 + 4*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d4N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 4=(1 + 8*X + 29*X^2 + 64*X^3 + 97*X^4 + 106*X^5 + 83*X^6 + 44*X^7 + 14*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
end
end MathGKM.Markov
