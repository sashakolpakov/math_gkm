import MarkovRowNormalization77c2
/-! Machine-authored 77c26ca3. Exact conversion back to unnormalized
coefficients; integer scalars encode an auxiliary sufficient inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem choose_scaled_identity77 (n k : ℕ) (hk : k+2 ≤ n) :
 (k+2 : ℝ)*(n-k)*(n.choose k : ℝ)*(n.choose (k+2) : ℝ) =
 (k+1 : ℝ)*(n-k-1)*(n.choose (k+1) : ℝ)^2 := by
 have h0 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.choose_succ_right_eq n k)
 have h1 := congrArg (fun x : ℕ => (x:ℝ)) (Nat.choose_succ_right_eq n (k+1))
 simp only [Nat.cast_mul,Nat.cast_sub (show k ≤ n by omega),
   Nat.cast_sub (show k+1 ≤ n by omega),Nat.cast_add,Nat.cast_one] at h0 h1
 norm_num only [Nat.add_assoc,show 1+1=2 by omega] at h1
 linear_combination (n-k : ℝ)*(n.choose k : ℝ)*h1 -
   (n-k-1 : ℝ)*(n.choose (k+1) : ℝ)*h0

theorem normalized_to_scaled77 (n k : ℕ) (hk : k+2 ≤ n) (L M R : ℝ)
 (h : (L/(n.choose k : ℝ))*(R/(n.choose (k+2) : ℝ)) ≤
   (M/(n.choose (k+1) : ℝ))^2) :
 (k+2 : ℝ)*(n-k)*L*R ≤ (k+1 : ℝ)*(n-k-1)*M^2 := by
 have h0 : (0:ℝ)<n.choose k := by exact_mod_cast Nat.choose_pos (show k ≤ n by omega)
 have h1 : (0:ℝ)<n.choose (k+1) := by exact_mod_cast Nat.choose_pos (show k+1 ≤ n by omega)
 have h2 : (0:ℝ)<n.choose (k+2) := by exact_mod_cast Nat.choose_pos hk
 rw [div_mul_div_comm,div_pow] at h
 have hh := (div_le_div_iff₀ (mul_pos h0 h2) (sq_pos_of_pos h1)).mp h
 have ha : (0:ℝ) ≤ (k+2)*(n-k) := by
   have hn : (k:ℝ) ≤ n := by exact_mod_cast (show k ≤ n by omega)
   positivity
 have hm := mul_le_mul_of_nonneg_left hh ha
 have he := choose_scaled_identity77 n k hk
 have hf : ((k+2 : ℝ)*(n-k)*L*R)*(n.choose (k+1) : ℝ)^2 ≤
     ((k+1 : ℝ)*(n-k-1)*M^2)*(n.choose (k+1) : ℝ)^2 := by
   calc
     _ ≤ (k+2 : ℝ)*(n-k)*(M^2*((n.choose k : ℝ)*(n.choose (k+2) : ℝ))) := by nlinarith only [hm]
     _ = _ := by nlinarith only [congrArg (fun z : ℝ => M^2*z) he]
 exact (mul_le_mul_iff_left₀ (sq_pos_of_pos h1)).mp hf

#print axioms normalized_to_scaled77
end
end MathGKM.Markov
