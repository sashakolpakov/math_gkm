import MarkovFibBandM139
/-! Machine-authored 139fed75. Uniform forcing factor, with exact exponent
restrictions. This signed-recurrence representation asserts no positivity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def bandExponentM139 (q k : ℕ) (r : Bool) : ℕ := sourceNME9C q r-2*(q+k+1)-1

def bandGainM139 (q : ℕ) (r : Bool) : ℕ → Polynomial ℤ
 | 0 => if r then 2 else 1
 | k+1 => if r then fibBandM139 q (k+1)+fibBandM139 (q+1) (k+1)+(X+1)*fibBandM139 q k
   else fibBandM139 q k+fibBandM139 (q+1) (k+1)+(X+1)*fibBandM139 (q+1) k

theorem band_exponent_falseM139 (q k : ℕ) :
 bandExponentM139 q k false=q-(2*k+1) := by
 simp only [bandExponentM139,sourceNME9C,Bool.false_eq_true,if_false]
 omega

theorem band_exponent_trueM139 (q k : ℕ) :
 bandExponentM139 q k true=q-(2*k+2) := by
 simp only [bandExponentM139,sourceNME9C,if_true]
 omega

theorem band_gain_factorM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 gainRowsMC3E q r k=X*(X+1)^(bandExponentM139 q k r+2)*bandGainM139 q r k := by
 cases k with
 | zero =>
   simp only [gainRowsMC3E,rowSMFFD,rowShiftMFFD,Nat.zero_le,if_true,Nat.sub_zero,
     show ¬1 ≤ (0:ℕ) by omega,if_false,pow_zero,pow_one,mul_zero,add_zero,zero_add]
   rw [fib_rows_zeroMC3E q (by omega),fib_rows_zeroMC3E (q+1) (by omega)]
   cases r
   · rw [band_exponent_falseM139]
     simp only [Bool.false_eq_true,if_false,bandGainM139]
     rw [show q+1-1=q by omega,show q-(2*0+1)+2=q+1 by omega,pow_succ]
     ring
   · rw [band_exponent_trueM139]
     simp only [if_true,bandGainM139]
     rw [show q+1-1=q by omega,show q-(2*0+2)+2=q by omega,
       show q=(q-1)+1 by omega,pow_succ]
     ring
 | succ k =>
   have hqk : 2*(k+1)+1 ≤ q := by cases r <;> simp_all [sourceNME9C] <;> omega
   simp only [gainRowsMC3E,rowSMFFD,rowShiftMFFD,Nat.zero_le,if_true,Nat.sub_zero,
     show 1 ≤ k+1 by omega,show k+1-1=k by omega,pow_zero,pow_one,one_mul]
   rw [fib_band_factorM139 q (k+1) hqk,
     fib_band_factorM139 (q+1) (k+1) (by omega),
     fib_band_factorM139 q k (by omega),fib_band_factorM139 (q+1) k (by omega)]
   cases r
   · rw [band_exponent_falseM139]
     simp only [Bool.false_eq_true,if_false,bandGainM139]
     have he : q+1-2*(k+1)-1+1=q-(2*(k+1)+1)+2 := by omega
     have hf : q-2*k-1=q-(2*(k+1)+1)+2 := by omega
     have hg : q+1-2*k-1=(q-(2*(k+1)+1)+2)+1 := by omega
     rw [hf,hg,pow_succ]
     have hp := pow_succ (X+1:Polynomial ℤ) (q+1-2*(k+1)-1)
     rw [he] at hp
     linear_combination -X*fibBandM139 (q+1) (k+1)*hp
   · rw [band_exponent_trueM139]
     simp only [if_true,bandGainM139]
     have hqt : 2*(k+1)+2 ≤ q := by simp only [sourceNME9C,if_true] at hn; omega
     have he : q-2*(k+1)-1+1=q-(2*(k+1)+2)+2 := by omega
     have hf : q+1-2*(k+1)-1=q-(2*(k+1)+2)+2 := by omega
     have hg : q-2*k-1=(q-(2*(k+1)+2)+2)+1 := by omega
     rw [hf,hg,pow_succ]
     have hp := pow_succ (X+1:Polynomial ℤ) (q-2*(k+1)-1)
     rw [he] at hp
     linear_combination -X*fibBandM139 q (k+1)*hp

end
end MathGKM.Markov
