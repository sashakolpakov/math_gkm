import MarkovTopBinomial58d2
/-! Machine-authored 7955df0c. Cubic binomial coefficient identities with zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem choose_three_real7955 (n : ℕ) :
 6*(n.choose 3 : ℝ)=(n:ℝ)*(n-1)*(n-2) := by
 by_cases hn : 2 ≤ n
 · have h := Nat.descFactorial_eq_factorial_mul_choose n 3
   simp only [Nat.descFactorial_succ,Nat.descFactorial_zero] at h
   have h1 : 1 ≤ n := by omega
   norm_num [Nat.factorial] at h
   have hc := congrArg (fun z : ℕ => (z:ℝ)) h
   push_cast [Nat.cast_sub hn,Nat.cast_sub h1] at hc
   nlinarith only [hc]
 · interval_cases n <;> norm_num [Nat.choose]

theorem fall_three7955 (n k : ℕ) (hk : 3 ≤ k) :
 (n:ℝ)*(n-1)*(n-2)*((n-3).choose (k-3) : ℝ)=
 (k:ℝ)*(k-1)*(k-2)*(n.choose k : ℝ) := by
 have h : (n.choose k : ℝ)*(k.choose 3 : ℝ)=
   (n.choose 3 : ℝ)*((n-3).choose (k-3) : ℝ) := by exact_mod_cast Nat.choose_mul hk
 have h1 := choose_three_real7955 n
 have h2 := choose_three_real7955 k
 nlinarith only [congrArg (fun z : ℝ => 6*z) h,
   congrArg (fun z : ℝ => z*(n.choose k : ℝ)) h2,
   congrArg (fun z : ℝ => z*((n-3).choose (k-3) : ℝ)) h1]

theorem next_coeff_three7955 (i j : ℕ) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*((1+(X:ℝ[X]))^(i+j-3)*X^3).coeff i=
 (i:ℝ)*(i-1)*(i-2)*((i+j).choose i : ℝ) := by
 rw [Polynomial.coeff_mul_X_pow']
 split_ifs with hi
 · rw [Polynomial.coeff_one_add_X_pow]
   simpa only [Nat.cast_add] using fall_three7955 (i+j) i hi
 · interval_cases i <;> norm_num

theorem next_coeff_zero7955 (i j : ℕ) (hd : 3 ≤ i+j) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*((1+(X:ℝ[X]))^(i+j-3)).coeff i=
 (j:ℝ)*(j-1)*(j-2)*((i+j).choose i : ℝ) := by
 rw [Polynomial.coeff_one_add_X_pow]
 by_cases hj : 3 ≤ j
 · have h := fall_three7955 (i+j) j hj
   rw [Nat.choose_symm_of_eq_add (n:=i+j-3) (a:=j-3) (b:=i) (by omega),
     ←Nat.choose_symm_add (a:=i) (b:=j)] at h
   simpa only [Nat.cast_add] using h
 · rw [Nat.choose_eq_zero_of_lt (by omega : i+j-3 < i)]
   interval_cases j <;> norm_num

theorem next_choose_one7955 (i j : ℕ) (hi : 1 ≤ i) (hj : 1 ≤ j) (hd : 3 ≤ i+j) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*((i+j-3).choose (i-1) : ℝ)=
 (i:ℝ)*j*(j-1)*((i+j).choose i : ℝ) := by
 have h := mixed_choose58 i (j-1) hi (by omega)
 have e : i+(j-1)=i+j-1 := by omega
 rw [e,show i+j-1-2=i+j-3 by omega] at h
 have hn : i+j-1+1=i+j := by omega
 have hq := Nat.choose_mul_succ_eq (i+j-1) i
 rw [hn,show i+j-i=j by omega] at hq
 have hqR : ((i+j-1).choose i : ℝ)*((i:ℝ)+j)=((i+j).choose i : ℝ)*j := by exact_mod_cast hq
 push_cast [Nat.cast_sub hj] at h
 linear_combination ((i:ℝ)+j)*h + (i:ℝ)*(j-1)*hqR

theorem next_coeff_one7955 (i j : ℕ) (hd : 3 ≤ i+j) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*((1+(X:ℝ[X]))^(i+j-3)*X).coeff i=
 (i:ℝ)*j*(j-1)*((i+j).choose i : ℝ) := by
 cases i with
 | zero => simp
 | succ i =>
   rw [Polynomial.coeff_mul_X,Polynomial.coeff_one_add_X_pow]
   by_cases hj : 1 ≤ j
   · simpa using next_choose_one7955 (i+1) j (by omega) hj hd
   · have hz : j=0 := by omega
     subst j
     rw [Nat.choose_eq_zero_of_lt (by omega : i+1+0-3 < i)]
     simp

theorem next_coeff_two7955 (i j : ℕ) (hd : 3 ≤ i+j) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*((1+(X:ℝ[X]))^(i+j-3)*X^2).coeff i=
 (i:ℝ)*(i-1)*j*((i+j).choose i : ℝ) := by
 rw [Polynomial.coeff_mul_X_pow']
 split_ifs with hi
 · rw [Polynomial.coeff_one_add_X_pow]
   by_cases hj : 1 ≤ j
   · have h := next_choose_one7955 j i hj (by omega) (by omega)
     rw [Nat.choose_symm_of_eq_add (n:=j+i-3) (a:=j-1) (b:=i-2) (by omega),
       Nat.choose_symm_add (a:=j) (b:=i)] at h
     convert h using 1 <;> ring_nf
   · have hz : j=0 := by omega
     subst j
     rw [Nat.choose_eq_zero_of_lt (by omega : i+0-3 < i-2)]
     simp
 · interval_cases i <;> norm_num

#print axioms next_coeff_zero7955
#print axioms next_coeff_one7955
#print axioms next_coeff_two7955
#print axioms next_coeff_three7955
end
end MathGKM.Markov
