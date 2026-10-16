import MarkovFibonacciFormula6ade
import MarkovFibJets3556
/-! Machine-authored 3a11314d. Low coefficients below the Fibonacci axis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem fib_low_oneM3A1 (n j : ℕ) (hj : j<n) :
 coeff (fib6 n) 1 j=(j:ℤ)+1 := by
 have h := fib_formula_aux6 n 0 j (n-j-1) (by omega)
 simpa using h

theorem fib_low_twoM3A1 (n j : ℕ) (hj : j<n) :
 2*coeff (fib6 n) 2 j=((n:ℤ)-j-1)*(j+1)*(j+2) := by
 by_cases hs : j+2≤n
 · have h := fib_formula_aux6 n 1 j (n-j-2) (by omega)
   rw [h]
   have he : 1+(n-j-2)=n-j-1 := by omega
   rw [he,Nat.choose_one_right,show 1+1+j=j+2 by omega,
     Nat.choose_symm (by omega : j≤j+2)]
   norm_num [Nat.choose_two_right]
   have hn : ((n-j-1:ℕ):ℤ)=(n:ℤ)-j-1 := by omega
   rw [hn]
   have hc := Nat.choose_mul_factorial_mul_factorial (by omega : 2≤j+2)
   have hch : (2:ℤ)*((j+2).choose 2:ℤ)=(j+2)*(j+1) := by
     have ht := Nat.descFactorial_eq_factorial_mul_choose (j+2) 2
     simp [Nat.descFactorial_succ] at ht
     exact_mod_cast ht.symm
   omega
 · have hz : coeff (fib6 n) 2 j=0 :=
     (fib_degree6 n) 2 j (by omega)
   rw [hz]
   have hn : (n:ℤ)-j-1=0 := by omega
   rw [hn]; ring

theorem fib_low_threeM3A1 (n j : ℕ) (hj : j<n) :
 12*coeff (fib6 n) 3 j=
 ((n:ℤ)-j-1)*(n-j-2)*(j+1)*(j+2)*(j+3) := by
 by_cases hs : j+3≤n
 · have h := fib_formula_aux6 n 2 j (n-j-3) (by omega)
   rw [h]
   have he : 2+(n-j-3)=n-j-1 := by omega
   rw [he,show 2+1+j=j+3 by omega,Nat.choose_symm (by omega : j≤j+3)]
   have h2 := Nat.descFactorial_eq_factorial_mul_choose (n-j-1) 2
   have h3 := Nat.descFactorial_eq_factorial_mul_choose (j+3) 3
   simp only [Nat.descFactorial_succ,Nat.descFactorial_zero,Nat.factorial_succ,
     Nat.factorial_zero,Nat.mul_one] at h2 h3
   have h2z : (2:ℤ)*((n-j-1).choose 2:ℤ)=((n:ℤ)-j-1)*(n-j-2) := by
     have ht : ((n-j-1:ℕ):ℤ)=(n:ℤ)-j-1 := by omega
     have hu : ((n-j-1-1:ℕ):ℤ)=(n:ℤ)-j-2 := by omega
     exact_mod_cast h2.symm
   have h3z : (6:ℤ)*((j+3).choose 3:ℤ)=(j+1)*(j+2)*(j+3) := by
     norm_num at h3
     exact_mod_cast h3.symm
   nlinarith [mul_nonneg (sq_nonneg (0:ℤ)) (sq_nonneg (0:ℤ))]
 · have hz : coeff (fib6 n) 3 j=0 := (fib_degree6 n) 3 j (by omega)
   rw [hz]
   have hn : (n:ℤ)-j-1=0 ∨ (n:ℤ)-j-2=0 := by omega
   rcases hn with hn|hn <;> rw [hn] <;> ring

end
end MathGKM.Markov
