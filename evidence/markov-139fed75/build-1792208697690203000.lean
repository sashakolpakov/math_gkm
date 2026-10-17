import MarkovBandLinearM139
/-! Machine-authored 139fed75. Exact linear coefficient of the arbitrary
correction factor. The formula is denominator-cleared over the integers. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def bandLinearM139 (q k : ℕ) (r : Bool) : ℤ :=
 if r then (k:ℤ)*((k:ℤ)+1)*((k:ℤ)+2)*
   (5*(3*(k:ℤ)+5)*q-(3*(k:ℤ)-1)*(7*(k:ℤ)+13))
 else (k:ℤ)*((k:ℤ)+1)*((k:ℤ)+2)*
   (5*(3*(k:ℤ)+1)*q-((k:ℤ)-1)*(21*(k:ℤ)+13))

theorem band_Q_linearM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 30*(bandQM139 q r k).coeff 1=bandLinearM139 q k r := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · cases r <;> norm_num [bandQM139,bandGainM139,bandLinearM139,coeff_one]
   · have hg := band_gain_linearM139 q 1 r hq hn
     have h0 := band_Q_constantM139 q 0 r
     have hz : (bandQM139 q r 0).coeff 1=0 := band_Q_tailM139 q 0 1 r (by omega)
     rw [bandQM139]
     simp only [coeff_add,coeff_ofNat_mul,mul_coeff_one,mul_coeff_zero]
     simp only [coeff_sub,coeff_one,coeff_X,if_true,if_false,one_ne_zero,zero_ne_one,sub_zero,
       show (1:ℕ)≠0 by omega,show (0:ℕ)≠1 by omega,hz,h0]
     cases r <;> simp [bandLinearM139] at hg ⊢ <;> linear_combination 60*hg
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have hg := band_gain_linearM139 q (k+2) r hq hn
     have hc0 := band_Q_constantM139 q k r
     have hc1 := band_Q_constantM139 q (k+1) r
     rw [bandQM139]
     simp only [coeff_sub,coeff_add,coeff_ofNat_mul,mul_coeff_one,mul_coeff_zero,pow_two]
     simp only [coeff_add,mul_coeff_one,mul_coeff_zero,coeff_sub,coeff_one,coeff_X,
       if_true,if_false,one_ne_zero,zero_ne_one,show (1:ℕ)≠0 by omega,show (0:ℕ)≠1 by omega]
     cases r <;> simp only [bandLinearM139,Bool.false_eq_true,if_false,if_true,
       Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at *
       <;> linear_combination 60*hg+2*h1-h0-60*hc1-60*hc0

theorem band_Q_linear_positive_formM139 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 30*(bandQM139 (d+2*k+(if r then 2 else 1)) r k).coeff 1=
 (k:ℤ)*((k:ℤ)+1)*((k:ℤ)+2)*
   (5*(3*(k:ℤ)+(if r then 5 else 1))*d+
     3*(3*(k:ℤ)+(if r then 7 else 2))*((k:ℤ)+3)) := by
 rw [band_Q_linearM139 _ k r hq (by cases r <;> simp [sourceNME9C] <;> omega)]
 cases r <;> simp [bandLinearM139] <;> ring

theorem band_Q_linear_nonnegM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 ≤ (bandQM139 q r k).coeff 1 := by
 have hq' : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 have h := band_Q_linear_positive_formM139 (bandExponentM139 q k r) k r (by omega)
 rw [hq'] at h
 have hp : 0 ≤ (k:ℤ)*((k:ℤ)+1)*((k:ℤ)+2)*
   (5*(3*(k:ℤ)+(if r then 5 else 1))*bandExponentM139 q k r+
     3*(3*(k:ℤ)+(if r then 7 else 2))*((k:ℤ)+3)) := by
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity
 omega

end
end MathGKM.Markov
