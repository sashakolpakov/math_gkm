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
theorem jet3_11_a1N6604 :
 (runBooleanGaugeADB2 3 true true).a.coeff 1=(1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_a2N6604 :
 (runBooleanGaugeADB2 3 true true).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -53*X^5 + -46*X^6 + -26*X^7 + -10*X^8 + -2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_b2N6604 :
 (runBooleanGaugeADB2 3 true true).b.coeff 2=(4 + 11*X + 12*X^2 + 8*X^3 + 4*X^4 + 1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_b3N6604 :
 (runBooleanGaugeADB2 3 true true).b.coeff 3=(6 + 30*X + 63*X^2 + 72*X^3 + 48*X^4 + 18*X^5 + 3*X^6) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c1N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -48*X^5 + -34*X^6 + -14*X^7 + -2*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c2N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 2=(-4*X + -31*X^2 + -114*X^3 + -266*X^4 + -434*X^5 + -521*X^6 + -490*X^7 + -394*X^8 + -282*X^9 + -168*X^10 + -76*X^11 + -24*X^12 + -4*X^13) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c3N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 3=(-6*X + -56*X^2 + -245*X^3 + -680*X^4 + -1360*X^5 + -2098*X^6 + -2605*X^7 + -2684*X^8 + -2324*X^9 + -1658*X^10 + -924*X^11 + -372*X^12 + -96*X^13 + -12*X^14) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d1N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 1=(5 + 12*X + 12*X^2 + 8*X^3 + 4*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d2N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 2=(10 + 46*X + 92*X^2 + 110*X^3 + 98*X^4 + 76*X^5 + 50*X^6 + 26*X^7 + 10*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d3N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 3=(10 + 66*X + 195*X^2 + 350*X^3 + 450*X^4 + 468*X^5 + 409*X^6 + 282*X^7 + 138*X^8 + 42*X^9 + 6*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d4N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 4=(5 + 42*X + 161*X^2 + 378*X^3 + 623*X^4 + 790*X^5 + 813*X^6 + 676*X^7 + 428*X^8 + 188*X^9 + 50*X^10 + 6*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num only [Bool.false_eq_true,if_false,if_true,Nat.add_zero,Nat.reduceAdd]
 simp only [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num [runSumA27,Finset.sum_range_succ] <;> ring
end
end MathGKM.Markov
