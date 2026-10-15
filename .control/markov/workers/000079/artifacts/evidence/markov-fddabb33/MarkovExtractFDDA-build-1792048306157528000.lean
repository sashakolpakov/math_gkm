import MarkovShapeBinomialBDEE
import Mathlib.RingTheory.PowerSeries.WellKnown
/-! Machine-authored fddabb33. Exact ordinary coefficient extraction,
with delayed bands removed only below their proved exponent. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def inverseSixFDDA : PowerSeries ℤ := (PowerSeries.invOneSubPow ℤ 6).val

theorem inverseSix_mulFDDA :
 inverseSixFDDA * (1-PowerSeries.X)^6 = 1 := by
 exact PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one ℤ 5

theorem inverseSix_coeffFDDA (j : ℕ) :
 PowerSeries.coeff j inverseSixFDDA = ((j+5).choose 5 : ℤ) := by
 simp [inverseSixFDDA,PowerSeries.invOneSubPow,PowerSeries.coeff_mk,Nat.add_comm]

theorem extract_delayedFDDA (P K R : ℤ[X]) (N j : ℕ)
 (h : (1-X)^6*P=K+X^N*R) (hj : j<N) :
 P.coeff j=PowerSeries.coeff j (inverseSixFDDA*(K:PowerSeries ℤ)) := by
 have he : (P:PowerSeries ℤ)=inverseSixFDDA*((K:PowerSeries ℤ)+PowerSeries.X^N*(R:PowerSeries ℤ)) := by
  have hh := congrArg (fun p : ℤ[X] => (p:PowerSeries ℤ)) h
  simp only [Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_sub,
    Polynomial.coe_one,Polynomial.coe_X,Polynomial.coe_add] at hh
  rw [←hh,←mul_assoc,inverseSix_mulFDDA,one_mul]
 have hc := congrArg (PowerSeries.coeff j) he
 rw [Polynomial.coeff_coe] at hc
 rw [mul_add,map_add] at hc
 have hz : PowerSeries.coeff j (inverseSixFDDA*(PowerSeries.X^N*(R:PowerSeries ℤ)))=0 := by
  rw [show inverseSixFDDA*(PowerSeries.X^N*(R:PowerSeries ℤ))=
    PowerSeries.X^N*(inverseSixFDDA*(R:PowerSeries ℤ)) by ring]
  rw [PowerSeries.coeff_X_pow_mul',if_neg (by omega)]
 simpa [hz] using hc

theorem extract_monomialFDDA (a : ℤ) (l j : ℕ) (hl : l≤j+5) :
 PowerSeries.coeff j (inverseSixFDDA*((C a*X^l:ℤ[X]):PowerSeries ℤ))=
 a*((j+5-l).choose 5 : ℤ) := by
 simp only [Polynomial.coe_mul,Polynomial.coe_C,Polynomial.coe_pow,Polynomial.coe_X]
 rw [show inverseSixFDDA*(PowerSeries.C a*PowerSeries.X^l)=
   PowerSeries.C a*(PowerSeries.X^l*inverseSixFDDA) by ring]
 rw [PowerSeries.coeff_C_mul,PowerSeries.coeff_X_pow_mul']
 split_ifs with h
 · rw [inverseSix_coeffFDDA]
   rw [show j-l+5=j+5-l by omega]
 · rw [Nat.choose_eq_zero_of_lt (by omega : j+5-l<5)]
   simp

end
end MathGKM.Markov
