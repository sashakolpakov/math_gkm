import MarkovAmbient77c2
/-! Machine-authored 77c26ca3. Exact binomial normalization of an affine
times binomial row; normalization is auxiliary, never a changed root. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def linearRow77 (n : ℕ) (A B : ℝ) : ℝ[X] := (1+X)^n*(C A+C B*X)

theorem choose_twostep_left77 (n k : ℕ) (hk : k ≤ n+1) :
 (n+2 : ℝ)*(n+1)*(n.choose k : ℝ) =
 ((n+2).choose (k+1) : ℝ)*(k+1)*(n+1-k) := by
 have h0 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.add_one_mul_choose_eq n k)
 have h1 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.choose_mul_succ_eq (n+1) (k+1))
 have hk' : k+1 ≤ n+1+1 := by omega
 simp only [Nat.cast_mul,Nat.cast_add,Nat.cast_one,Nat.cast_sub hk'] at h0 h1
 norm_num only [Nat.add_assoc,show 1+1=2 by omega] at h1
 linear_combination (n+2 : ℝ)*h0 + (k+1 : ℝ)*h1

theorem choose_twostep_right77 (n k : ℕ) :
 (n+2 : ℝ)*(n+1)*(n.choose k : ℝ) =
 ((n+2).choose (k+2) : ℝ)*(k+2)*(k+1) := by
 have h0 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.add_one_mul_choose_eq n k)
 have h1 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.add_one_mul_choose_eq (n+1) (k+1))
 simp only [Nat.cast_mul,Nat.cast_add,Nat.cast_one] at h0 h1
 norm_num only [Nat.add_assoc,show 1+1=2 by omega] at h1
 linear_combination (n+2 : ℝ)*h0 + (k+1 : ℝ)*h1

theorem linear_row_scaled77 (n k : ℕ) (hk : k ≤ n+1) (A B : ℝ) :
 (n+2 : ℝ)*(n+1)*(linearRow77 n A B).coeff k =
 ((n+2).choose (k+1) : ℝ)*(k+1)*(A*(n+1-k)+B*k) := by
 cases k with
 | zero => simp [linearRow77,Polynomial.mul_coeff_zero]; ring
 | succ k =>
   have hA := choose_twostep_left77 n (k+1) hk
   have hB := choose_twostep_right77 n k
   have he : (linearRow77 n A B).coeff (k+1) =
       (n.choose (k+1) : ℝ)*A+(n.choose k : ℝ)*B := by
     simp [linearRow77,mul_add,← mul_assoc,Polynomial.coeff_one_add_X_pow]
   rw [he]
   push_cast at hA ⊢
   linear_combination A*hA+B*hB

theorem linear_row_normalized77 (n k : ℕ) (hk : k ≤ n+1) (A B : ℝ) :
 (linearRow77 n A B).coeff k / ((n+2).choose (k+1) : ℝ) =
 (k+1)*(A*(n+1-k)+B*k)/((n+2)*(n+1)) := by
 have hc : (0:ℝ) < (n+2).choose (k+1) := by exact_mod_cast Nat.choose_pos (by omega : k+1 ≤ n+2)
 have hd : (0:ℝ) < (n+2)*(n+1) := by positivity
 apply (div_eq_div_iff (ne_of_gt hc) (ne_of_gt hd)).mpr
 nlinarith [linear_row_scaled77 n k hk A B]

theorem linear_row_normalized_lc77 (n k : ℕ) (hk : k+2 ≤ n+1)
 (A B : ℝ) (hA : 0 ≤ A) (hB : 0 ≤ B) :
 ((linearRow77 n A B).coeff k / ((n+2).choose (k+1) : ℝ))*
 ((linearRow77 n A B).coeff (k+2) / ((n+2).choose (k+3) : ℝ)) ≤
 ((linearRow77 n A B).coeff (k+1) / ((n+2).choose (k+2) : ℝ))^2 := by
 rw [linear_row_normalized77 n k (by omega),linear_row_normalized77 n (k+2) hk,
   linear_row_normalized77 n (k+1) (by omega)]
 have h0 : 0 ≤ A*(n+1-(k:ℝ))+B*k := by
   have : (0:ℝ) ≤ n+1-k := by exact_mod_cast (show k ≤ n+1 by omega)
   positivity
 have h2 : 0 ≤ A*(n+1-((k:ℝ)+2))+B*(k+2) := by
   have : (0:ℝ) ≤ n+1-(k+2) := by exact_mod_cast hk
   positivity
 have h := affine_times_index_lc77 (k+1) (A*(n+2)-B) (B-A)
   (by positivity) (by nlinarith [h0]) (by nlinarith [h2])
 have hd : (0:ℝ) < (n+2)*(n+1) := by positivity
 push_cast
 rw [div_mul_div_comm,div_pow]
 apply (div_le_div_iff_of_pos_right (sq_pos_of_pos hd)).mpr
 nlinarith only [h]

#print axioms linear_row_normalized77
#print axioms linear_row_normalized_lc77
end
end MathGKM.Markov
