import MarkovFibSecondRowMC3E
/-! Machine-authored 139fed75. Uniform Fibonacci row factorization in its
nonnegative-exponent range. All coefficients are ordinary integers. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

def fibBandM139 (n j : ℕ) : Polynomial ℤ :=
 ∑ s ∈ range (j+1), C (((j+1).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*
   X^s*(X+1)^(j-s)

theorem fib_band_coeffM139 (n j t : ℕ) (hn : 2*j+1 ≤ n) :
 ((X+1)^(n-2*j-1)*fibBandM139 n j).coeff t=
 ((n-j-1).choose t:ℤ)*((t+j+1).choose j:ℤ) := by
 have he : (X+1)^(n-2*j-1)*fibBandM139 n j=
   ∑ s ∈ range (j+1), C (((j+1).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*
     X^s*(X+1)^(n-j-1-s) := by
   unfold fibBandM139
   rw [Finset.mul_sum]
   apply Finset.sum_congr rfl
   intro s hs
   have hsj : s ≤ j := by have := Finset.mem_range.mp hs; omega
   rw [show n-j-1-s=(n-2*j-1)+(j-s) by omega,pow_add]
   ring
 rw [he]
 simpa only [Nat.add_assoc] using weighted_binomial_coeffMFFD (n-j-1) (j+1) j t

theorem fib_band_factorM139 (n j : ℕ) (hn : 2*j+1 ≤ n) :
 fibRowsMC3E n j=X*((X+1)^(n-2*j-1)*fibBandM139 n j) := by
 ext i
 rw [fib_rows_coeffMC3E]
 cases i with
 | zero => simp [fibRawM9E2,show j≠n by omega,coeff_X_mul]
 | succ i =>
   rw [coeff_X_mul,fib_band_coeffM139 n j i hn]
   unfold fibRawM9E2
   rw [if_neg (by omega)]
   by_cases h : i+1+j ≤ n
   · rw [if_pos h]
     simp only [Nat.add_sub_cancel]
     rw [show i+1+j=i+j+1 by omega]
   · rw [if_neg h,Nat.choose_eq_zero_of_lt (by omega : n-j-1 < i)]
     simp

theorem fib_band_zeroM139 (n : ℕ) : fibBandM139 n 0=1 := by
 simp [fibBandM139]

theorem fib_band_constantM139 (n j : ℕ) : (fibBandM139 n j).coeff 0=j+1 := by
 rw [fibBandM139,Polynomial.finsetSum_coeff,Finset.sum_eq_single 0]
 · simp [coeff_mul,coeff_X_add_one_pow,Nat.choose_succ_self_right]
 · intro s hs hne
   rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul']
   simp [show ¬s ≤ 0 by omega]
 · simp

end
end MathGKM.Markov
