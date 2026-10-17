import MarkovBandQuadraticM139
/-! Machine-authored 139fed75. A proposed universal budget is false.
This is not a negation of the published log-concavity conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

def bandQuadraticM139 (q k : ℕ) (r : Bool) : ℤ :=
 (k:ℤ)*((k:ℤ)-1)*((k:ℤ)+1)*((k:ℤ)+2)*
 (if r then (84+63*(k:ℤ))*q^2+(252-105*(k:ℤ)-168*(k:ℤ)^2)*q+
   120-298*(k:ℤ)-4*(k:ℤ)^2+114*(k:ℤ)^3
 else (-21+63*(k:ℤ))*q^2+(21+273*(k:ℤ)-168*(k:ℤ)^2)*q+
   120+136*(k:ℤ)-326*(k:ℤ)^2+114*(k:ℤ)^3)

theorem band_Q_quadraticM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 1260*(bandQM139 q r k).coeff 2=bandQuadraticM139 q k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · rw [band_Q_tailM139 q 0 2 r (by omega)]
     simp [bandQuadraticM139]
   · rw [band_Q_tailM139 q 1 2 r (by omega)]
     simp [bandQuadraticM139]
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have hg := band_gain_quadraticM139 q (k+2) r hq hn
     have l0 := band_Q_linearM139 q k r hq (by omega)
     have l1 := band_Q_linearM139 q (k+1) r hq (by omega)
     have hc := band_Q_constantM139 q k r
     rw [bandQM139]
     simp only [coeff_sub,coeff_add,coeff_ofNat_mul,coeff_mul_two8934,mul_coeff_one,mul_coeff_zero,pow_two]
     norm_num only [coeff_add,coeff_sub,coeff_mul_two8934,mul_coeff_one,mul_coeff_zero,
       coeff_one,coeff_X,ite_true,ite_false,zero_ne_one,one_ne_zero,OfNat.ofNat_ne_zero,
       zero_mul,mul_zero,one_mul,mul_one,add_zero,zero_add,sub_zero]
     cases r <;> simp only [bandQuadraticM139,bandGainQuadraticM139,bandLinearM139,
       Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at *
       <;> linear_combination 420*hg+2*h1-h0-84*l1-84*l0-1260*hc

theorem budget_witness_linearM139 : (bandQM139 73 false 36).coeff 1=21714264 := by
 have h := band_Q_linearM139 73 36 false (by omega) (by norm_num [sourceNME9C])
 norm_num [bandLinearM139] at h
 omega

theorem budget_witness_quadraticM139 : (bandQM139 73 false 36).coeff 2=2390762400 := by
 have h := band_Q_quadraticM139 73 36 false (by omega) (by norm_num [sourceNME9C])
 norm_num [bandQuadraticM139] at h
 omega

theorem budget_witness_strictM139 :
 (bandQM139 73 false 36).coeff 1*(110:ℤ)<(bandQM139 73 false 36).coeff 2 := by
 rw [budget_witness_linearM139,budget_witness_quadraticM139]
 norm_num

theorem proposed_band_budget_falseM139 :
 ¬(∀ q k r, 2 ≤ q → 2*(q+k+1)+1 ≤ sourceNME9C q r →
   ∀ m, (bandQM139 q r k).coeff (m+1) ≤
     (bandQM139 q r k).coeff 1*((q+k+1).choose m:ℤ)) := by
 intro h
 have he := h 73 36 false (by omega) (by norm_num [sourceNME9C]) 1
 norm_num only [Nat.choose_one_right,Nat.reduceAdd] at he
 exact (not_le_of_gt budget_witness_strictM139) he

theorem budget_witness_source_factorM139 :
 rawRowMC3E (threePolyM9E2 73 false) 110=
 lowerRowMFFD 221 110+X^2*bandQM139 73 false 36 := by
 have h := source_band_factorM139 73 36 false (by omega) (by norm_num [sourceNME9C])
 simpa only [bandCorrectionM139,bandExponentM139,sourceNME9C,Bool.false_eq_true,if_false,
   Nat.reduceMul,Nat.reduceAdd,Nat.reduceSub,pow_zero,mul_one] using h

end
end MathGKM.Markov
