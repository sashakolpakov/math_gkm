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
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_a2N6604 :
 (runBooleanGaugeADB2 3 false false).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_b2N6604 :
 (runBooleanGaugeADB2 3 false false).b.coeff 2=(3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_b3N6604 :
 (runBooleanGaugeADB2 3 false false).b.coeff 3=(3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c1N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6 + 2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c2N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 2=(-3*X + -22*X^2 + -74*X^3 + -146*X^4 + -189*X^5 + -178*X^6 + -130*X^7 + -70*X^8 + -24*X^9 + -4*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_c3N6604 :
 (runBooleanGaugeADB2 3 false false).c.coeff 3=(-3*X + -26*X^2 + -106*X^3 + -268*X^4 + -469*X^5 + -602*X^6 + -580*X^7 + -412*X^8 + -202*X^9 + -60*X^10 + -8*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d1N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 1=(4 + 9*X + 8*X^2 + 4*X^3) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d2N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 2=(6 + 26*X + 48*X^2 + 54*X^3 + 44*X^4 + 26*X^5 + 10*X^6 + 2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d3N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 3=(4 + 25*X + 70*X^2 + 120*X^3 + 144*X^4 + 125*X^5 + 74*X^6 + 26*X^7 + 4*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_00_d4N6604 :
 (runBooleanGaugeADB2 3 false false).d.coeff 4=(1 + 8*X + 29*X^2 + 64*X^3 + 97*X^4 + 106*X^5 + 83*X^6 + 44*X^7 + 14*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_a1N6604 :
 (runBooleanGaugeADB2 3 false true).a.coeff 1=(1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_a2N6604 :
 (runBooleanGaugeADB2 3 false true).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -53*X^5 + -46*X^6 + -26*X^7 + -10*X^8 + -2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_b2N6604 :
 (runBooleanGaugeADB2 3 false true).b.coeff 2=(4 + 11*X + 12*X^2 + 8*X^3 + 4*X^4 + 1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_b3N6604 :
 (runBooleanGaugeADB2 3 false true).b.coeff 3=(6 + 30*X + 63*X^2 + 72*X^3 + 48*X^4 + 18*X^5 + 3*X^6) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c1N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -48*X^5 + -34*X^6 + -14*X^7 + -2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c2N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 2=(-4*X + -31*X^2 + -114*X^3 + -266*X^4 + -432*X^5 + -509*X^6 + -454*X^7 + -318*X^8 + -176*X^9 + -76*X^10 + -24*X^11 + -4*X^12) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_c3N6604 :
 (runBooleanGaugeADB2 3 false true).c.coeff 3=(-6*X + -56*X^2 + -245*X^3 + -680*X^4 + -1354*X^5 + -2050*X^6 + -2425*X^7 + -2264*X^8 + -1658*X^9 + -926*X^10 + -372*X^11 + -96*X^12 + -12*X^13) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d1N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 1=(5 + 12*X + 12*X^2 + 8*X^3 + 2*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d2N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 2=(10 + 46*X + 92*X^2 + 110*X^3 + 90*X^4 + 54*X^5 + 26*X^6 + 10*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d3N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 3=(10 + 66*X + 195*X^2 + 350*X^3 + 438*X^4 + 408*X^5 + 283*X^6 + 138*X^7 + 42*X^8 + 6*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_01_d4N6604 :
 (runBooleanGaugeADB2 3 false true).d.coeff 4=(5 + 42*X + 161*X^2 + 378*X^3 + 615*X^4 + 736*X^5 + 657*X^6 + 426*X^7 + 188*X^8 + 50*X^9 + 6*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_a1N6604 :
 (runBooleanGaugeADB2 3 true false).a.coeff 1=(1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_a2N6604 :
 (runBooleanGaugeADB2 3 true false).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_b2N6604 :
 (runBooleanGaugeADB2 3 true false).b.coeff 2=(3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_b3N6604 :
 (runBooleanGaugeADB2 3 true false).b.coeff 3=(3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c1N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6 + 2*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c2N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 2=(-3*X + -22*X^2 + -74*X^3 + -146*X^4 + -191*X^5 + -190*X^6 + -166*X^7 + -126*X^8 + -70*X^9 + -24*X^10 + -4*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_c3N6604 :
 (runBooleanGaugeADB2 3 true false).c.coeff 3=(-3*X + -26*X^2 + -106*X^3 + -268*X^4 + -473*X^5 + -632*X^6 + -680*X^7 + -600*X^8 + -414*X^9 + -202*X^10 + -60*X^11 + -8*X^12) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d1N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 1=(4 + 9*X + 8*X^2 + 4*X^3 + 2*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d2N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 2=(6 + 26*X + 48*X^2 + 54*X^3 + 50*X^4 + 42*X^5 + 26*X^6 + 10*X^7 + 2*X^8) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d3N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 3=(4 + 25*X + 70*X^2 + 120*X^3 + 150*X^4 + 153*X^5 + 126*X^6 + 74*X^7 + 26*X^8 + 4*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_10_d4N6604 :
 (runBooleanGaugeADB2 3 true false).d.coeff 4=(1 + 8*X + 29*X^2 + 64*X^3 + 99*X^4 + 118*X^5 + 113*X^6 + 84*X^7 + 44*X^8 + 14*X^9 + 2*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_a1N6604 :
 (runBooleanGaugeADB2 3 true true).a.coeff 1=(1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_a2N6604 :
 (runBooleanGaugeADB2 3 true true).a.coeff 2=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -53*X^5 + -46*X^6 + -26*X^7 + -10*X^8 + -2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_a6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_b2N6604 :
 (runBooleanGaugeADB2 3 true true).b.coeff 2=(4 + 11*X + 12*X^2 + 8*X^3 + 4*X^4 + 1*X^5) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_b3N6604 :
 (runBooleanGaugeADB2 3 true true).b.coeff 3=(6 + 30*X + 63*X^2 + 72*X^3 + 48*X^4 + 18*X^5 + 3*X^6) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_b6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c1N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 1=(-1*X + -6*X^2 + -18*X^3 + -38*X^4 + -48*X^5 + -34*X^6 + -14*X^7 + -2*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c2N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 2=(-4*X + -31*X^2 + -114*X^3 + -266*X^4 + -434*X^5 + -521*X^6 + -490*X^7 + -394*X^8 + -282*X^9 + -168*X^10 + -76*X^11 + -24*X^12 + -4*X^13) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_c3N6604 :
 (runBooleanGaugeADB2 3 true true).c.coeff 3=(-6*X + -56*X^2 + -245*X^3 + -680*X^4 + -1360*X^5 + -2098*X^6 + -2605*X^7 + -2684*X^8 + -2324*X^9 + -1658*X^10 + -924*X^11 + -372*X^12 + -96*X^13 + -12*X^14) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_c6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d1N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 1=(5 + 12*X + 12*X^2 + 8*X^3 + 4*X^4) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d2N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 2=(10 + 46*X + 92*X^2 + 110*X^3 + 98*X^4 + 76*X^5 + 50*X^6 + 26*X^7 + 10*X^8 + 2*X^9) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d3N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 3=(10 + 66*X + 195*X^2 + 350*X^3 + 450*X^4 + 468*X^5 + 409*X^6 + 282*X^7 + 138*X^8 + 42*X^9 + 6*X^10) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
theorem jet3_11_d4N6604 :
 (runBooleanGaugeADB2 3 true true).d.coeff 4=(5 + 42*X + 161*X^2 + 378*X^3 + 623*X^4 + 790*X^5 + 813*X^6 + 676*X^7 + 428*X^8 + 188*X^9 + 50*X^10 + 6*X^11) := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604]
 norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring
def threeLocalFourN6604 : Bool → Bool → Bool → Bool → ℤ[X]
 | false, false, false, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -87552*X^6 + -47904*X^7 + 32256*X^8 + 92736*X^9 + 91776*X^10 + 48672*X^11 + 10752*X^12 + -2016*X^13 + -1536*X^14 + 96*X^15
 | false, false, false, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -87552*X^6 + -47904*X^7 + 32256*X^8 + 92736*X^9 + 91728*X^10 + 48384*X^11 + 9888*X^12 + -3168*X^13 + -2208*X^14 + 96*X^16
 | false, false, true, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -86976*X^6 + -43008*X^7 + 52992*X^8 + 142560*X^9 + 165504*X^10 + 119424*X^11 + 53472*X^12 + 11328*X^13 + -1824*X^14 + -1728*X^15 + -288*X^16
 | false, false, true, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39150*X^4 + -74016*X^5 + -86976*X^6 + -43008*X^7 + 52992*X^8 + 142560*X^9 + 165504*X^10 + 119376*X^11 + 53184*X^12 + 10464*X^13 + -2976*X^14 + -2400*X^15 + -384*X^16 + 96*X^17
 | false, true, false, false => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88248*X^4 + -238368*X^5 + -475872*X^6 + -719184*X^7 + -834768*X^8 + -745344*X^9 + -505440*X^10 + -251136*X^11 + -83616*X^12 + -13632*X^13 + 1824*X^14 + 1344*X^15 + 192*X^16
 | false, true, false, true => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88248*X^4 + -238368*X^5 + -475872*X^6 + -719184*X^7 + -834768*X^8 + -745344*X^9 + -505488*X^10 + -251424*X^11 + -84480*X^12 + -15456*X^13 + -480*X^14 + -288*X^15 + -480*X^16 + -96*X^17
 | false, true, true, false => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88248*X^4 + -238368*X^5 + -475296*X^6 + -714288*X^7 + -814032*X^8 + -685440*X^9 + -383376*X^10 + -75216*X^11 + 100224*X^12 + 127968*X^13 + 81024*X^14 + 31968*X^15 + 7392*X^16 + 672*X^17
 | false, true, true, true => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88248*X^4 + -238368*X^5 + -475296*X^6 + -714288*X^7 + -814032*X^8 + -685440*X^9 + -383376*X^10 + -75264*X^11 + 99936*X^12 + 127104*X^13 + 79200*X^14 + 29664*X^15 + 5760*X^16 + -96*X^18
 | true, false, false, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39198*X^4 + -74016*X^5 + -86496*X^6 + -42768*X^7 + 48336*X^8 + 126624*X^9 + 139920*X^10 + 96384*X^11 + 42528*X^12 + 10656*X^13 + 672*X^14 + -384*X^15
 | true, false, false, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39198*X^4 + -74016*X^5 + -86496*X^6 + -42768*X^7 + 48336*X^8 + 126624*X^9 + 139872*X^10 + 96096*X^11 + 41664*X^12 + 9504*X^13 + -480*X^15 + 96*X^16 + 96*X^17
 | true, false, true, false => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39198*X^4 + -74016*X^5 + -85920*X^6 + -37872*X^7 + 69072*X^8 + 176448*X^9 + 213648*X^10 + 167136*X^11 + 85248*X^12 + 22176*X^13 + -3744*X^14 + -6048*X^15 + -2592*X^16 + -480*X^17
 | true, false, true, true => -24 + -360*X + -2796*X^2 + -13272*X^3 + -39198*X^4 + -74016*X^5 + -85920*X^6 + -37872*X^7 + 69072*X^8 + 176448*X^9 + 213648*X^10 + 167088*X^11 + 84960*X^12 + 21312*X^13 + -4896*X^14 + -6720*X^15 + -2688*X^16 + -384*X^17 + 96*X^18
 | true, true, false, false => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88296*X^4 + -238368*X^5 + -474816*X^6 + -714048*X^7 + -818688*X^8 + -705120*X^9 + -428112*X^10 + -140352*X^11 + 36864*X^12 + 86688*X^13 + 64032*X^14 + 28896*X^15 + 8256*X^16 + 1056*X^17 + -192*X^18
 | true, true, false, true => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88296*X^4 + -238368*X^5 + -474816*X^6 + -714048*X^7 + -818688*X^8 + -705120*X^9 + -428160*X^10 + -140640*X^11 + 36000*X^12 + 84864*X^13 + 61728*X^14 + 27264*X^15 + 7584*X^16 + 960*X^17 + -96*X^18
 | true, true, true, false => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88296*X^4 + -238368*X^5 + -474240*X^6 + -709152*X^7 + -797952*X^8 + -645216*X^9 + -306048*X^10 + 35568*X^11 + 220704*X^12 + 228288*X^13 + 141216*X^14 + 54816*X^15 + 10848*X^16 + -1344*X^17 + -1440*X^18
 | true, true, true, true => -30 + -504*X + -4332*X^2 + -23496*X^3 + -88296*X^4 + -238368*X^5 + -474240*X^6 + -709152*X^7 + -797952*X^8 + -645216*X^9 + -306048*X^10 + 35520*X^11 + 220416*X^12 + 227424*X^13 + 139392*X^14 + 52512*X^15 + 9216*X^16 + -2016*X^17 + -1536*X^18 + 96*X^19
theorem runLocalFour_threeN6604 (p q r s : Bool) :
 runLocalFourBE 3 p q r s=threeLocalFourN6604 p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,threeLocalFourN6604,
jet3_00_a1N6604,jet3_00_a2N6604,jet3_00_b2N6604,jet3_00_b3N6604,jet3_00_c1N6604,jet3_00_c2N6604,jet3_00_c3N6604,jet3_00_d1N6604,jet3_00_d2N6604,jet3_00_d3N6604,jet3_00_d4N6604,jet3_01_a1N6604,jet3_01_a2N6604,jet3_01_b2N6604,jet3_01_b3N6604,jet3_01_c1N6604,jet3_01_c2N6604,jet3_01_c3N6604,jet3_01_d1N6604,jet3_01_d2N6604,jet3_01_d3N6604,jet3_01_d4N6604,jet3_10_a1N6604,jet3_10_a2N6604,jet3_10_b2N6604,jet3_10_b3N6604,jet3_10_c1N6604,jet3_10_c2N6604,jet3_10_c3N6604,jet3_10_d1N6604,jet3_10_d2N6604,jet3_10_d3N6604,jet3_10_d4N6604,jet3_11_a1N6604,jet3_11_a2N6604,jet3_11_b2N6604,jet3_11_b3N6604,jet3_11_c1N6604,jet3_11_c2N6604,jet3_11_c3N6604,jet3_11_d1N6604,jet3_11_d2N6604,jet3_11_d3N6604,jet3_11_d4N6604] <;> ring
end
end MathGKM.Markov
