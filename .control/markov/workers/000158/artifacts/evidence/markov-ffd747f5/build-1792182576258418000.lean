import MarkovLowerUniformME9C
/-! Machine-authored ffd747f5. Exact weighted-binomial row factorization.
No log-concavity assertion or experiment is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def rowJMFFD (n j : ℕ) : Polynomial ℤ :=
 ∑ s ∈ range (j+1), C (((j+3).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*
   X^s*(X+1)^(j-s)

theorem weighted_binomial_coeffMFFD (N c j t : ℕ) :
 (∑ s ∈ range (j+1), C ((c.choose (j-s):ℤ)*(N.choose s:ℤ))*
   X^s*(X+1)^(N-s)).coeff t =
 (N.choose t:ℤ)*((t+c).choose j:ℤ) := by
 rw [Polynomial.finset_sum_coeff]
 have hv : ((t+c).choose j:ℤ)=
   ∑ s ∈ range (j+1), (t.choose s:ℤ)*(c.choose (j-s):ℤ) := by
   rw [Nat.add_choose_eq,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   push_cast
   rfl
 rw [hv,Finset.mul_sum]
 apply Finset.sum_congr rfl
 intro s hs
 rw [mul_assoc,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul',Polynomial.coeff_X_add_one_pow]
 by_cases hst : s ≤ t
 · rw [if_pos hst]
   have he : (N.choose t:ℤ)*(t.choose s:ℤ)=
     (N.choose s:ℤ)*((N-s).choose (t-s):ℤ) := by
     exact_mod_cast Nat.choose_mul hst
   linear_combination (c.choose (j-s):ℤ)*he
 · rw [if_neg hst,Nat.choose_eq_zero_of_lt (by omega : t<s)]
   simp

theorem rowJ_factor_coeffMFFD (n j t : ℕ) (hn : 2*j+1 ≤ n) :
 ((X+1)^(n-2*j-1)*rowJMFFD n j).coeff t=
 ((n-j-1).choose t:ℤ)*((t+j+3).choose j:ℤ) := by
 have he : (X+1)^(n-2*j-1)*rowJMFFD n j=
   ∑ s ∈ range (j+1), C (((j+3).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*
     X^s*(X+1)^(n-j-1-s) := by
   unfold rowJMFFD
   rw [Finset.mul_sum]
   apply Finset.sum_congr rfl
   intro s hs
   have hsj : s ≤ j := by simpa only [Finset.mem_range] using hs
   rw [show n-j-1-s=(n-2*j-1)+(j-s) by omega,pow_add]
   ring
 rw [he]
 simpa only [Nat.add_assoc] using weighted_binomial_coeffMFFD (n-j-1) (j+3) j t

theorem delta_row_coeffMFFD (n j i : ℕ) (hn : 2*j+1 ≤ n) :
 (X^3*((X+1)^(n-2*j-1)*rowJMFFD n j)).coeff i=fibDeltaME9C n i j := by
 rcases i with _|_|_|i
 · rw [Polynomial.coeff_X_pow_mul']
   simp only [show ¬3 ≤ 0 by omega,if_false]
   exact (fib_delta_axisME9C n j (by omega)).symm
 · rw [Polynomial.coeff_X_pow_mul']
   simp only [show ¬3 ≤ 1 by omega,if_false]
   exact (fib_delta_oneME9C n j (by omega)).symm
 · rw [Polynomial.coeff_X_pow_mul']
   simp only [show ¬3 ≤ 2 by omega,if_false]
   exact (fib_delta_twoME9C n j (by omega)).symm
 · rw [show i+1+1+1=i+3 by omega,Polynomial.coeff_X_pow_mul']
   simp only [show 3 ≤ i+3 by omega,if_true,Nat.add_sub_cancel]
   rw [rowJ_factor_coeffMFFD n j i hn,fib_delta_highME9C n i j (by omega)]
   rw [show i+j+3=i+3+j by omega,Nat.choose_symm_add]

end
end MathGKM.Markov
