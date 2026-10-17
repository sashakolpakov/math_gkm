import MarkovBandShapeM139
/-! Machine-authored 139fed75. Exact first-degree coefficient, with integer
denominators cleared. All exponent hypotheses remain explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_band_linearM139 (n j : ℕ) (hn : 2*j+1 ≤ n) :
 2*(fibBandM139 n j).coeff 1=(j:ℤ)*((j:ℤ)+1)*((n:ℤ)-j+1) := by
 have h := fib_band_coeffM139 n j 1 hn
 rw [mul_coeff_one,fib_band_constantM139] at h
 simp only [coeff_X_add_one_pow,Nat.choose_zero_right,Nat.choose_one_right,
   Nat.cast_one,one_mul] at h
 have hc : (2:ℤ)*((j+2).choose j:ℤ)=((j:ℤ)+2)*((j:ℤ)+1) := by
   have hs : (j+2).choose j=(j+2).choose 2 := by
     rw [←Nat.choose_symm (show j ≤ j+2 by omega)]
     congr 1 <;> omega
   rw [hs]
   have hq : (2:ℚ)*((j+2).choose 2:ℚ)=((j:ℚ)+2)*((j:ℚ)+1) := by
     rw [choose_poly_natM0D3,binomial_poly_2M295]
     push_cast
     ring
   exact_mod_cast hq
 rw [show 1+j+1=j+2 by omega] at h
 push_cast [show 1 ≤ n-j by omega,show j ≤ n by omega,show 1 ≤ n-2*j by omega,
   show 2*j ≤ n by omega] at h
 nlinarith

theorem band_gain_linearM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 2*(bandGainM139 q r k).coeff 1=
 if r then (k:ℤ)*((3*(k:ℤ)+1)*q-3*(k:ℤ)^2+4*(k:ℤ)+3)
 else (k:ℤ)*((3*(k:ℤ)-1)*q-3*(k:ℤ)^2+8*(k:ℤ)-1) := by
 cases k with
 | zero => cases r <;> norm_num [bandGainM139]
 | succ k =>
   have hqk : 2*(k+1)+1 ≤ q := by cases r <;> simp_all [sourceNME9C] <;> omega
   have h0 := fib_band_linearM139 q k (by omega)
   have h1 := fib_band_linearM139 q (k+1) hqk
   have h2 := fib_band_linearM139 (q+1) k (by omega)
   have h3 := fib_band_linearM139 (q+1) (k+1) (by omega)
   cases r <;> simp [bandGainM139,mul_coeff_one,fib_band_constantM139]
     <;> push_cast at *
   · linear_combination h0+h3+h2
   · linear_combination h1+h3+h0

end
end MathGKM.Markov
