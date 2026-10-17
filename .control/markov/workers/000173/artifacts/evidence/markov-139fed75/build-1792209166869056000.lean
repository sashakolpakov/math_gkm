import MarkovBandBudgetCoeffsM139
import MarkovSecondJet8934
/-! Machine-authored 139fed75. Second-degree coefficient of the correction. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem fib_band_quadraticM139 (n j : ℕ) (hn : 2*j+1 ≤ n) :
 12*(fibBandM139 n j).coeff 2=
 ((j:ℤ)-1)*j*((j:ℤ)+1)*((n:ℤ)-j+1)*((n:ℤ)-j+2) := by
 have h := fib_band_coeffM139 n j 2 hn
 rw [coeff_mul_two8934,fib_band_constantM139] at h
 simp only [coeff_X_add_one_pow,Nat.choose_zero_right,Nat.choose_one_right,
   Nat.cast_one,one_mul] at h
 have hl := fib_band_linearM139 n j hn
 have hs : (2+j+1).choose j=(j+3).choose 3 := by
   rw [show 2+j+1=j+3 by omega,←Nat.choose_symm (show j ≤ j+3 by omega)]
   congr 1 <;> omega
 rw [hs] at h
 have hq := congrArg (fun z : ℤ => (z:ℚ)) h
 have hlq := congrArg (fun z : ℤ => (z:ℚ)) hl
 push_cast at hq hlq
 rw [choose_poly_natM0D3,binomial_poly_2M295,
   choose_poly_natM0D3,binomial_poly_2M295,
   choose_poly_natM0D3,binomial_poly_3M295] at hq
 push_cast [show 1 ≤ n-j by omega,show j ≤ n by omega,
   show 1 ≤ n-2*j by omega,show 2*j ≤ n by omega] at hq
 have he : (12:ℚ)*((fibBandM139 n j).coeff 2:ℚ)=
   ((j:ℚ)-1)*j*((j:ℚ)+1)*((n:ℚ)-j+1)*((n:ℚ)-j+2) := by
   linear_combination 12*hq-6*((n:ℚ)-2*j-1)*hlq
 exact_mod_cast he

def bandGainQuadraticM139 (q k : ℕ) (r : Bool) : ℤ :=
 let f (n j : ℤ) := (j-1)*j*(j+1)*(n-j+1)*(n-j+2)
 if r then f q k+f ((q:ℤ)+1) k+f q ((k:ℤ)-1)+
   6*((k:ℤ)-1)*k*((q:ℤ)-k+2)
 else f q ((k:ℤ)-1)+f ((q:ℤ)+1) k+f ((q:ℤ)+1) ((k:ℤ)-1)+
   6*((k:ℤ)-1)*k*((q:ℤ)-k+3)

theorem band_gain_quadraticM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 12*(bandGainM139 q r k).coeff 2=bandGainQuadraticM139 q k r := by
 cases k with
 | zero => cases r <;> norm_num [bandGainM139,bandGainQuadraticM139,coeff_one]
 | succ k =>
   have hqk : 2*(k+1)+1 ≤ q := by cases r <;> simp_all [sourceNME9C] <;> omega
   have h0 := fib_band_quadraticM139 q k (by omega)
   have h1 := fib_band_quadraticM139 q (k+1) hqk
   have h2 := fib_band_quadraticM139 (q+1) k (by omega)
   have h3 := fib_band_quadraticM139 (q+1) (k+1) (by omega)
   have l0 := fib_band_linearM139 q k (by omega)
   have l1 := fib_band_linearM139 (q+1) k (by omega)
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,coeff_add,
     coeff_mul_two8934]
     <;> norm_num [coeff_one] <;> simp only [bandGainQuadraticM139,Bool.false_eq_true,if_false,if_true]
     <;> push_cast at *
   · linear_combination h0+h3+h2+6*l1
   · linear_combination h1+h3+h0+6*l0

end
end MathGKM.Markov
