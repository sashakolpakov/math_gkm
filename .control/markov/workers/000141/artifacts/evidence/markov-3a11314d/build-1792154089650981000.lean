import MarkovFibLowM3A1
import MarkovCentralSumsM3A1
/-! Machine-authored 3a11314d. Exact central coefficients of Fibonacci squares. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem bicoeff_mulM3A1 (P Q : BiPoly) (i j : ℕ) :
 coeff (P*Q) i j=∑ t∈Finset.range (j+1), ∑ s∈Finset.range (i+1),
   coeff P s t*coeff Q (i-s) (j-t) := by
 unfold coeff
 simp only [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,
   finset_sum_coeff]
 rw [Finset.sum_comm]

theorem fib_low_zeroM3A1 (n j : ℕ) (hj : j<n) :
 coeff (fib6 n) 0 j=0 := by
 change ((fib6 n).coeff 0).coeff j=0
 rw [fib_zero_jet3556,Polynomial.coeff_X_pow]
 simp [show n≠j by omega]

theorem central_square_sum2M3A1 (n : ℕ) :
 coeff (fib6 (n+1)^2) 2 n=
 ∑ t∈Finset.range (n+1), centralTerm2M3A1 (n+1) t := by
 rw [pow_two,bicoeff_mulM3A1]
 apply Finset.sum_congr rfl
 intro t ht
 have ht0 : t<n+1 := Finset.mem_range.mp ht
 have ht1 : n-t<n+1 := by omega
 norm_num [Finset.sum_range_succ,fib_low_zeroM3A1 _ _ ht0,
   fib_low_zeroM3A1 _ _ ht1,fib_low_oneM3A1 _ _ ht0,
   fib_low_oneM3A1 _ _ ht1]
 have hnt : ((n-t:ℕ):ℤ)=(n:ℤ)-t := by omega
 rw [hnt]
 unfold centralTerm2M3A1
 push_cast
 ring

theorem central_square_sum3M3A1 (n : ℕ) :
 2*coeff (fib6 (n+1)^2) 3 n=
 ∑ t∈Finset.range (n+1), centralTerm3M3A1 (n+1) t := by
 rw [pow_two,bicoeff_mulM3A1,Finset.mul_sum]
 apply Finset.sum_congr rfl
 intro t ht
 have ht0 : t<n+1 := Finset.mem_range.mp ht
 have ht1 : n-t<n+1 := by omega
 norm_num [Finset.sum_range_succ,fib_low_zeroM3A1 _ _ ht0,
   fib_low_zeroM3A1 _ _ ht1,fib_low_oneM3A1 _ _ ht0,
   fib_low_oneM3A1 _ _ ht1]
 have hnt : ((n-t:ℕ):ℤ)=(n:ℤ)-t := by omega
 have h0 := fib_low_twoM3A1 (n+1) t ht0
 have h1 := fib_low_twoM3A1 (n+1) (n-t) ht1
 rw [hnt] at h1 ⊢
 push_cast at h0 h1
 unfold centralTerm3M3A1
 push_cast
 linear_combination ((n:ℤ)+1-t)*h0+((t:ℤ)+1)*h1

theorem central_square_sum4M3A1 (n : ℕ) :
 12*coeff (fib6 (n+1)^2) 4 n=
 ∑ t∈Finset.range (n+1), centralTerm4M3A1 (n+1) t := by
 rw [pow_two,bicoeff_mulM3A1,Finset.mul_sum]
 apply Finset.sum_congr rfl
 intro t ht
 have ht0 : t<n+1 := Finset.mem_range.mp ht
 have ht1 : n-t<n+1 := by omega
 norm_num [Finset.sum_range_succ,fib_low_zeroM3A1 _ _ ht0,
   fib_low_zeroM3A1 _ _ ht1,fib_low_oneM3A1 _ _ ht0,
   fib_low_oneM3A1 _ _ ht1]
 have hnt : ((n-t:ℕ):ℤ)=(n:ℤ)-t := by omega
 have h0 := fib_low_twoM3A1 (n+1) t ht0
 have h1 := fib_low_twoM3A1 (n+1) (n-t) ht1
 have h2 := fib_low_threeM3A1 (n+1) t ht0
 have h3 := fib_low_threeM3A1 (n+1) (n-t) ht1
 rw [hnt] at h1 h3 ⊢
 push_cast at h0 h1 h2 h3
 have hp := congrArg₂ (fun x y : ℤ => x*y) h0 h1
 unfold centralTerm4M3A1
 push_cast
 linear_combination ((n:ℤ)+1-t)*h2+((t:ℤ)+1)*h3+3*hp

theorem central_square_valuesM3A1 (n : ℕ) :
 6*coeff (fib6 (n+1)^2) 2 n=((n:ℤ)+1)*(n+2)*(n+3) ∧
 30*coeff (fib6 (n+1)^2) 3 n=(n:ℤ)*(n+1)*(n+2)*(n+3)*(n+4) ∧
 336*coeff (fib6 (n+1)^2) 4 n=(n:ℤ)*(n-1)*(n+1)*(n+2)*(n+3)*(n+4)*(n+5) := by
 constructor
 · rw [central_square_sum2M3A1]; exact central_sum2M3A1 n
 constructor
 · have h := central_square_sum3M3A1 n
   have hs := central_sum3M3A1 n
   linear_combination 15*h+hs
 · have h := central_square_sum4M3A1 n
   have hs := central_sum4M3A1 n
   linear_combination 28*h+hs

end
end MathGKM.Markov
