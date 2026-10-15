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

def lowNumeratorPolyFDDA (n c r : ℤ) : ℤ[X] :=
 C (lowNumerator0BDEE n c r)*X^0 + C (lowNumerator1BDEE n c r)*X^1 + C (lowNumerator2BDEE n c r)*X^2 + C (lowNumerator3BDEE n c r)*X^3 + C (lowNumerator4BDEE n c r)*X^4 + C (lowNumerator5BDEE n c r)*X^5 + C (lowNumerator6BDEE n c r)*X^6 + C (lowNumerator7BDEE n c r)*X^7 + C (lowNumerator8BDEE n c r)*X^8 + C (lowNumerator9BDEE n c r)*X^9

theorem extract_lowFDDA (n c r : ℤ) (j : ℕ) (hj : 4≤j) :
 15*PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))=thirdShapeBDEE n c r j := by
 rw [thirdShape_chooseBDEE n c r j hj]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add]
 rw [extract_monomialFDDA _ 0 j (by omega)]
 rw [extract_monomialFDDA _ 1 j (by omega)]
 rw [extract_monomialFDDA _ 2 j (by omega)]
 rw [extract_monomialFDDA _ 3 j (by omega)]
 rw [extract_monomialFDDA _ 4 j (by omega)]
 rw [extract_monomialFDDA _ 5 j (by omega)]
 rw [extract_monomialFDDA _ 6 j (by omega)]
 rw [extract_monomialFDDA _ 7 j (by omega)]
 rw [extract_monomialFDDA _ 8 j (by omega)]
 rw [extract_monomialFDDA _ 9 j (by omega)]

theorem extract_shapeFDDA (P R : ℤ[X]) (n c r : ℤ) (N j : ℕ)
 (h : (1-X)^6*P=lowNumeratorPolyFDDA n c r+X^N*R)
 (hj : 4≤j) (hN : j<N) :
 15*P.coeff j=thirdShapeBDEE n c r j := by
 rw [extract_delayedFDDA P _ R N j h hN]
 exact extract_lowFDDA n c r j hj

end
end MathGKM.Markov
