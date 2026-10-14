import MarkovAmbientScaling77c2
import MarkovFibonacciLC6ade
/-! Machine-authored 77c26ca3. Full horizontal ambient-binomial bound for
the numerator-one source family. All other numerators remain unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem fib_normalized77 (n i j k : ℕ) (hn : i+1+j+k=n) :
 (coeff (fib6 n) (i+1) j : ℝ)/((n-1).choose (i+j) : ℝ) =
 ((i+j).choose j : ℝ)*((i+j+1).choose j : ℝ)/((n-1).choose j : ℝ) := by
 rw [fib_coeff_at6 n i j k hn]
 have hs : i+j ≤ n-1 := by omega
 have hj : j ≤ n-1 := by omega
 have hc0 : (0:ℝ) < (n-1).choose (i+j) := by exact_mod_cast Nat.choose_pos hs
 have hc1 : (0:ℝ) < (n-1).choose j := by exact_mod_cast Nat.choose_pos hj
 have he := congrArg (fun x : ℕ => (x:ℝ))
   (Nat.choose_mul (n:=n-1) (k:=i+j) (s:=j) (by omega))
 rw [show n-1-j=i+k by omega,show i+j-j=i by omega] at he
 push_cast at he ⊢
 apply (div_eq_div_iff (ne_of_gt hc0) (ne_of_gt hc1)).mpr
 have he' : (i+1+j).choose j=(i+j+1).choose j := by congr 1; omega
 rw [he']
 linear_combination -((i+j+1).choose j : ℝ)*he

theorem fib_horizontal_normalized77 (i j k : ℕ) :
 let n := i+3+j+k
 (coeff (fib6 n) (i+1) j : ℝ)/((n-1).choose (i+j) : ℝ)*
 ((coeff (fib6 n) (i+3) j : ℝ)/((n-1).choose (i+j+2) : ℝ)) ≤
 ((coeff (fib6 n) (i+2) j : ℝ)/((n-1).choose (i+j+1) : ℝ))^2 := by
 dsimp only
 rw [show i+3=(i+2)+1 by omega,show i+j+2=i+2+j by omega,
   show i+2=(i+1)+1 by omega,show i+j+1=i+1+j by omega,
   fib_normalized77 _ i j (k+2) (by omega),
   fib_normalized77 _ (i+2) j k (by omega),
   fib_normalized77 _ (i+1) j (k+1) (by omega)]
 have h := lc_product6
   ((i+j).choose j) ((i+j+1).choose j) ((i+j+2).choose j)
   ((i+j+1).choose j) ((i+j+2).choose j) ((i+j+3).choose j)
   (by positivity) (by positivity) (by positivity)
   (choose_upper_lc6 (i+j) j) (by simpa [Nat.add_assoc] using choose_upper_lc6 (i+j+1) j)
 have hR : (((i+j).choose j : ℝ)*(i+j+1).choose j)*
   (((i+j+2).choose j : ℝ)*(i+j+3).choose j) ≤
   (((i+j+1).choose j : ℝ)*(i+j+2).choose j)^2 := by exact_mod_cast h
 have hc : (0:ℝ) < (i+3+j+k-1).choose j := by
   exact_mod_cast Nat.choose_pos (show j ≤ i+3+j+k-1 by omega)
 rw [div_mul_div_comm,div_pow,← sq]
 apply (div_le_div_iff_of_pos_right (sq_pos_of_pos hc)).mpr
 convert hR using 1 <;> congr 4 <;> omega

theorem fib_horizontal_ambient77 (i j k : ℕ) :
 let n := i+3+j+k
 (i+j+2 : ℤ)*(k+2)*coeff (fib6 n) (i+1) j*coeff (fib6 n) (i+3) j ≤
 (i+j+1 : ℤ)*(k+1)*coeff (fib6 n) (i+2) j^2 := by
 have h := normalized_to_scaled77 (i+3+j+k-1) (i+j) (by omega)
   (coeff (fib6 (i+3+j+k)) (i+1) j)
   (coeff (fib6 (i+3+j+k)) (i+2) j)
   (coeff (fib6 (i+3+j+k)) (i+3) j) (fib_horizontal_normalized77 i j k)
 have he : (i+3+j+k-1 : ℕ)=i+j+k+2 := by omega
 rw [he] at h
 push_cast at h
 have h' : (i+j+2 : ℝ)*(k+2)*(coeff (fib6 (i+3+j+k)) (i+1) j : ℝ)*
   coeff (fib6 (i+3+j+k)) (i+3) j ≤
   (i+j+1 : ℝ)*(k+1)*(coeff (fib6 (i+3+j+k)) (i+2) j : ℝ)^2 := by
   nlinarith only [h]
 exact_mod_cast h'

#print axioms fib_horizontal_ambient77
end
end MathGKM.Markov
