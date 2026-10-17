import MarkovBandBoundaryReductionM139
/-! Machine-authored 831d426f. Closed ordinary coefficients of the Fibonacci
forcing factor. No source log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem choose_splitM831 (j m s : ℕ) (hm : m ≤ j) (hs : s ≤ m) :
 (j+1).choose (j-s)*(j-s).choose (m-s)=
 (j+1).choose (m+1)*(m+1).choose (m-s) := by
 have h := Nat.choose_mul (n:=j+1) (k:=j-s) (s:=j-m) (by omega)
 rw [←Nat.choose_symm (show m-s ≤ j-s by omega)]
 rw [show j-s-(m-s)=j-m by omega,h]
 rw [←Nat.choose_symm (show j-m ≤ j+1 by omega)]
 congr 2 <;> omega

theorem fib_band_closed_coeffM831 (n j m : ℕ) :
 (fibBandM139 n j).coeff m=
 ((j+1).choose (m+1):ℤ)*((n-j-1+m+1).choose m:ℤ) := by
 by_cases hm : m ≤ j
 · rw [fibBandM139,finsetSum_coeff]
   have ht : ∑ s ∈ range (j+1),
       (C (((j+1).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*X^s*(X+1)^(j-s)).coeff m =
       ∑ s ∈ range (m+1),
       (C (((j+1).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*X^s*(X+1)^(j-s)).coeff m := by
     symm
     apply sum_subset (range_mono (by omega))
     intro s hs hsm
     have hms : m < s := by simp only [mem_range] at hsm; omega
     rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul']
     simp [show ¬s ≤ m by omega]
   rw [ht]
   have he : ∑ s ∈ range (m+1),
       (C (((j+1).choose (j-s):ℤ)*((n-j-1).choose s:ℤ))*X^s*(X+1)^(j-s)).coeff m =
       ((j+1).choose (m+1):ℤ)*
       ∑ s ∈ range (m+1), ((n-j-1).choose s:ℤ)*((m+1).choose (m-s):ℤ) := by
     rw [mul_sum]
     apply sum_congr rfl
     intro s hs
     have hsm : s ≤ m := by have := mem_range.mp hs; omega
     rw [mul_assoc,coeff_C_mul,coeff_X_pow_mul',if_pos hsm,coeff_X_add_one_pow]
     have hh : ((j+1).choose (j-s):ℤ)*((j-s).choose (m-s):ℤ)=
         ((j+1).choose (m+1):ℤ)*((m+1).choose (m-s):ℤ) := by
       exact_mod_cast choose_splitM831 j m s hm hsm
     linear_combination ((n-j-1).choose s:ℤ)*hh
   rw [he]
   congr 1
   have hv := Nat.add_choose_eq (n-j-1) (m+1) m
   rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at hv
   exact_mod_cast (show ∑ s ∈ range (m+1), (n-j-1).choose s*(m+1).choose (m-s)=
      (n-j-1+m+1).choose m by simpa [Nat.add_assoc] using hv.symm)
 · rw [coeff_eq_zero_of_natDegree_lt ((fib_band_degreeM139 n j).trans_lt (by omega)),
     Nat.choose_eq_zero_of_lt (by omega : j+1 < m+1)]
   simp

end
end MathGKM.Markov
