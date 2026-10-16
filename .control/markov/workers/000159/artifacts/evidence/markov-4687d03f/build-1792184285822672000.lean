import MarkovRowDegreeMFFD
/-! Machine-authored 4687d03f. Exact coefficients of the binomial forcing row.
No residual shape assertion is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem rowJ_coeffM468 (n j k : ℕ) (hk : k ≤ j) :
 (rowJMFFD n j).coeff k =
 ((j+3).choose (j-k):ℤ)*((n-j-1+k+3).choose k:ℤ) := by
 unfold rowJMFFD
 rw [Polynomial.finsetSum_coeff]
 have hv : ((n-j-1+k+3).choose k:ℤ)=
   ∑ s ∈ range (k+1), ((n-j-1).choose s:ℤ)*((k+3).choose (k-s):ℤ) := by
   rw [show n-j-1+k+3=(n-j-1)+(k+3) by omega,
     Nat.add_choose_eq,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   push_cast
   rfl
 rw [hv,Finset.mul_sum]
 rw [← Finset.sum_subset (show range (k+1) ⊆ range (j+1) by
   intro s hs; simp only [mem_range] at *; omega) ?_]
 · apply Finset.sum_congr rfl
   intro s hs
   have hsk : s ≤ k := by have := mem_range.mp hs; omega
   rw [mul_assoc,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul',
     if_pos hsk,Polynomial.coeff_X_add_one_pow]
   have hc : ((j+3).choose (j-s):ℤ)*((j-s).choose (k-s):ℤ)=
     ((j+3).choose (j-k):ℤ)*((k+3).choose (k-s):ℤ) := by
     have h := Nat.choose_mul (n:=j+3) (k:=j-s) (s:=j-k) (by omega)
     rw [← Nat.choose_symm (by omega : j-k ≤ j-s)] at h
     rw [show j-s-(j-k)=k-s by omega,show j+3-(j-k)=k+3 by omega] at h
     exact_mod_cast h
   linear_combination ((n-j-1).choose s:ℤ)*hc
 · intro s hs hnot
   have hks : k<s := by simp only [mem_range] at *; omega
   rw [mul_assoc,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow_mul',if_neg (by omega)]
   ring

theorem rowJ_coeff_tailM468 (n j k : ℕ) (hk : j<k) : (rowJMFFD n j).coeff k=0 :=
 Polynomial.coeff_eq_zero_of_natDegree_lt ((rowJ_degreeMFFD n j).trans_lt hk)

theorem rowJ_coeff_allM468 (n j k : ℕ) :
 (rowJMFFD n j).coeff k =
 ((j+3).choose (k+3):ℤ)*((n-j-1+k+3).choose k:ℤ) := by
 by_cases hk : k ≤ j
 · rw [rowJ_coeffM468 n j k hk,← Nat.choose_symm (by omega : j-k ≤ j+3),
     show j+3-(j-k)=k+3 by omega]
 · rw [rowJ_coeff_tailM468 n j k (by omega),Nat.choose_eq_zero_of_lt (by omega : j+3<k+3)]
   simp

theorem rowJ_parameterM468 (n j : ℕ) (hn : j+1 ≤ n) :
 rowJMFFD (n+2) (j+1)+rowJMFFD n j =
 rowJMFFD (n+1) (j+1)+(X+1)*rowJMFFD (n+1) j := by
 ext k
 simp only [Polynomial.coeff_add,add_mul,one_mul]
 cases k with
 | zero => simp [rowJ_coeff_allM468]
 | succ k =>
   simp only [Polynomial.coeff_add,Polynomial.coeff_X_mul, rowJ_coeff_allM468]
   have e1 : n+2-(j+1)-1+(k+1)+3=(n-j+k+3)+1 := by omega
   have e2 : n-j-1+(k+1)+3=n-j+k+3 := by omega
   have e3 : n+1-(j+1)-1+(k+1)+3=n-j+k+3 := by omega
   have e4 : n+1-j-1+k+3=n-j+k+3 := by omega
   have e5 : n+1-j-1+(k+1)+3=(n-j+k+3)+1 := by omega
   rw [e1,e2,e3,e4,e5]
   have h1 : ((j+1+3).choose (k+1+3):ℤ)=
     ((j+3).choose (k+3):ℤ)+((j+3).choose (k+1+3):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (j+3) (k+3)
   have h2 : (((n-j+k+3)+1).choose (k+1):ℤ)=
     ((n-j+k+3).choose k:ℤ)+((n-j+k+3).choose (k+1):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (n-j+k+3) k
   rw [h1,h2]
   ring

end
end MathGKM.Markov
