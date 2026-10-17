import MarkovBandLeadingM139
/-! Machine-authored 139fed75. A parameter-shift recurrence for factored rows. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_band_shiftM139 (n k : ℕ) (hn : 2*(k+1) ≤ n) :
 fibBandM139 (n+2) (k+1)=fibBandM139 (n+1) (k+1)+
   (X+1)*fibBandM139 (n+1) k-fibBandM139 n k := by
 have he := fib_rows_recMC3E n (k+1)
 simp only [rowSMFFD,rowShiftMFFD,Nat.zero_le,if_true,Nat.sub_zero,
   show 1 ≤ k+1 by omega,show k+1-1=k by omega,pow_zero,pow_one,one_mul] at he
 rw [fib_band_factorM139 (n+2) (k+1) (by omega),
   fib_band_factorM139 (n+1) (k+1) (by omega),
   fib_band_factorM139 (n+1) k (by omega),fib_band_factorM139 n k (by omega)] at he
 let e := n+1-2*(k+1)-1
 have h1 : n+2-2*(k+1)-1=e+1 := by dsimp [e]; omega
 have h2 : n+1-2*k-1=e+2 := by dsimp [e]; omega
 have h3 : n-2*k-1=e+1 := by dsimp [e]; omega
 rw [h1,h2,h3] at he
 have hz : X*(X+1:Polynomial ℤ)^(e+1)≠0 := by
   apply mul_ne_zero X_ne_zero
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   norm_num at hh
 apply mul_left_cancel₀ hz
 simp only [pow_add,pow_one] at he ⊢
 linear_combination he

theorem band_gain_shiftM139 (q k : ℕ) (r : Bool) (hq : 2*(k+1) ≤ q) :
 bandGainM139 (q+2) r (k+1)=bandGainM139 (q+1) r (k+1)+
   (X+1)*bandGainM139 (q+1) r k-bandGainM139 q r k := by
 cases k with
 | zero =>
   have h0 := fib_band_shiftM139 q 0 (by omega)
   have h1 := fib_band_shiftM139 (q+1) 0 (by omega)
   simp only [fib_band_zeroM139] at h0 h1
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,fib_band_zeroM139]
   · linear_combination h1
   · linear_combination h0+h1
 | succ k =>
   have h0 := fib_band_shiftM139 q k (by omega)
   have h1 := fib_band_shiftM139 (q+1) k (by omega)
   have h2 := fib_band_shiftM139 q (k+1) (by omega)
   have h3 := fib_band_shiftM139 (q+1) (k+1) (by omega)
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true]
   · linear_combination h0+h3+(X+1)*h1
   · linear_combination h2+h3+(X+1)*h0

end
end MathGKM.Markov
