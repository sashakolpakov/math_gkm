import MarkovAmbient77c2
import MarkovPellLowerFormula26ca
import MarkovLowSlices5a7
/-! Machine-authored 58d2f411. Zero-retaining coefficient identities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem choose_two_real58 (n : ℕ) :
 (n.choose 2 : ℝ)=(n:ℝ)*(n-1)/2 := by
 exact_mod_cast choose_two_rat26ca n

theorem fall_choose58 (n k : ℕ) (hk : 2 ≤ k) :
 (n:ℝ)*(n-1)*((n-2).choose (k-2) : ℝ)=
 (k:ℝ)*(k-1)*(n.choose k : ℝ) := by
 have h : (n.choose k : ℝ)*(k.choose 2 : ℝ)=
   (n.choose 2 : ℝ)*((n-2).choose (k-2) : ℝ) := by exact_mod_cast Nat.choose_mul hk
 rw [choose_two_real58,choose_two_real58] at h
 nlinarith only [h]

theorem mixed_choose58 (i j : ℕ) (hi : 1 ≤ i) (hd : 2 ≤ i+j) :
 ((i:ℝ)+j)*((i:ℝ)+j-1)*((i+j-2).choose (i-1) : ℝ)=
 (i:ℝ)*j*((i+j).choose i : ℝ) := by
 have h0 := Nat.choose_mul (n:=i+j) (k:=i) (s:=1) hi
 simp only [Nat.choose_one_right] at h0
 have h1 := Nat.choose_mul_succ_eq (i+j-2) (i-1)
 have e0 : i+j-2+1=i+j-1 := by omega
 have e1 : i+j-2+1-(i-1)=j := by omega
 rw [e0,e1] at h1
 have h0R : ((i+j).choose i : ℝ)*i=((i:ℝ)+j)*((i+j-1).choose (i-1) : ℝ) := by exact_mod_cast h0
 have h1R : ((i+j-2).choose (i-1) : ℝ)*((i:ℝ)+j-1)=
   ((i+j-1).choose (i-1) : ℝ)*j := by
   exact_mod_cast h1
 nlinarith only [congrArg (fun z : ℝ => z*j) h0R,
   congrArg (fun z : ℝ => z*((i:ℝ)+j)) h1R]

theorem top_coeff_zero58 (i j : ℕ) (hd : 2 ≤ i+j) :
 ((i:ℝ)+j)*((i:ℝ)+j-1)*((1+(X:Polynomial ℝ))^(i+j-2)).coeff i=
 (j:ℝ)*(j-1)*((i+j).choose i : ℝ) := by
 rw [Polynomial.coeff_one_add_X_pow]
 by_cases hj : 2 ≤ j
 · have h := fall_choose58 (i+j) j hj
   rw [Nat.choose_symm_of_eq_add (n:=i+j-2) (a:=j-2) (b:=i) (by omega),
     Nat.choose_symm_add] at h
   simpa only [Nat.cast_add] using h
 · have hz : (i+j-2).choose i=0 := Nat.choose_eq_zero_of_lt (by omega)
   rw [hz]; interval_cases j <;> norm_num

theorem top_coeff_one58 (i j : ℕ) (hd : 2 ≤ i+j) :
 ((i:ℝ)+j)*((i:ℝ)+j-1)*((1+(X:Polynomial ℝ))^(i+j-2)*X).coeff i=
 (i:ℝ)*j*((i+j).choose i : ℝ) := by
 cases i with
 | zero => simp
 | succ i =>
   rw [Polynomial.coeff_mul_X]
   rw [Polynomial.coeff_one_add_X_pow]
   simpa using mixed_choose58 (i+1) j (by omega) hd

theorem top_coeff_two58 (i j : ℕ) (hd : 2 ≤ i+j) :
 ((i:ℝ)+j)*((i:ℝ)+j-1)*((1+(X:Polynomial ℝ))^(i+j-2)*X^2).coeff i=
 (i:ℝ)*(i-1)*((i+j).choose i : ℝ) := by
 rw [Polynomial.coeff_mul_X_pow']
 split_ifs with hi
 · rw [Polynomial.coeff_one_add_X_pow]
   simpa only [Nat.cast_add] using fall_choose58 (i+j) i hi
 · interval_cases i <;> norm_num

theorem top_middle_binomial58 (i j : ℕ) :
 ((i:ℝ)+1)*((i+j).choose (i+1) : ℝ)=j*((i+j).choose i : ℝ) := by
 have h := Nat.choose_succ_right_eq (i+j) i
 rw [Nat.add_sub_cancel_left] at h
 have hh : ((i+j).choose (i+1) : ℝ)*(i+1)=((i+j).choose i : ℝ)*j := by exact_mod_cast h
 nlinarith only [hh]

theorem top_last_binomial58 (i j : ℕ) :
 ((i:ℝ)+1)*(i+2)*((i+j+2).choose (i+2) : ℝ)=
 ((i:ℝ)+j+1)*(i+j+2)*((i+j).choose i : ℝ) := by
 have h0 := Nat.add_one_mul_choose_eq (i+j) i
 have h1 := Nat.add_one_mul_choose_eq (i+j+1) (i+1)
 have h0R : ((i:ℝ)+j+1)*((i+j).choose i : ℝ)=
   ((i+j+1).choose (i+1) : ℝ)*(i+1) := by exact_mod_cast h0
 have h1R : ((i:ℝ)+j+2)*((i+j+1).choose (i+1) : ℝ)=
   ((i+j+2).choose (i+2) : ℝ)*(i+2) := by exact_mod_cast h1
 nlinarith only [congrArg (fun z : ℝ => z*((i:ℝ)+j+2)) h0R,
   congrArg (fun z : ℝ => z*((i:ℝ)+1)) h1R]

#print axioms top_coeff_zero58
#print axioms top_coeff_one58
#print axioms top_coeff_two58
end
end MathGKM.Markov
