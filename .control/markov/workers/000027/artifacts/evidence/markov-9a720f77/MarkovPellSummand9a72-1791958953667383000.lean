import MarkovPellMatching0618
/-! Machine-authored request 9a720f77. Horizontal positive-sum constituents.
Their individual inequalities do not establish the inequality of the sum. -/
namespace MathGKM.Markov
noncomputable section

theorem choose_upper_stride_two9a72 (n k : ℕ) :
 (n.choose k : ℤ)*(n+4).choose k ≤ ((n+2).choose k : ℤ)^2 := by
 by_cases hk : n<k
 · rw [Nat.choose_eq_zero_of_lt hk,Int.natCast_zero,zero_mul]
   exact sq_nonneg _
 · have hc : (0:ℤ)<(n+2).choose k := by
     exact_mod_cast Nat.choose_pos (show k ≤ n+2 by omega)
   have h0 := choose_upper_lc6 n k
   have h1 := choose_upper_lc6 (n+1) k
   have h2 := choose_upper_lc6 (n+2) k
   have h1' : ((n+1).choose k : ℤ)*(n+3).choose k ≤ ((n+2).choose k : ℤ)^2 := by
     simpa [Nat.add_assoc] using h1
   have h2' : ((n+2).choose k : ℤ)*(n+4).choose k ≤ ((n+3).choose k : ℤ)^2 := by
     simpa [Nat.add_assoc] using h2
   have hprod := mul_le_mul h0 h2' (by positivity) (by positivity)
   have hsq := mul_self_le_mul_self (by positivity : (0:ℤ) ≤
     ((n+1).choose k : ℤ)*(n+3).choose k) h1'
   have hmain : ((n.choose k : ℤ)*(n+4).choose k)*((n+2).choose k : ℤ)^2 ≤
     ((n+2).choose k : ℤ)^2*((n+2).choose k : ℤ)^2 := by
     nlinarith [hprod,hsq]
   exact (mul_le_mul_right (sq_pos_of_pos hc)).mp hmain

def horizontalTerm9a72 (n j q s : ℕ) : ℤ :=
 if q ≤ j then
   ((n-q).choose (s+1) : ℤ)*((s+q).choose q : ℤ)*
     ((2*s+2).choose (j-q) : ℤ)
 else 0

theorem horizontal_term_lc9a72 (n j q s : ℕ) :
 horizontalTerm9a72 n j q s*horizontalTerm9a72 n j q (s+2) ≤
   horizontalTerm9a72 n j q (s+1)^2 := by
 by_cases hq : q ≤ j
 · simp only [horizontalTerm9a72,if_pos hq]
   have h0 := choose_raw_lc1998 (n-q) (s+1)
   have h1 := choose_upper_lc6 (s+q) q
   have h2 := choose_upper_stride_two9a72 (2*s+2) (j-q)
   have h := lc_product6
     ((n-q).choose (s+1)) ((n-q).choose (s+2)) ((n-q).choose (s+3))
     ((s+q).choose q) ((s+q+1).choose q) ((s+q+2).choose q)
     (by positivity) (by positivity) (by positivity)
     (by simpa [Nat.add_assoc] using h0) h1
   have hh := lc_product6 _ _ _
     ((2*s+2).choose (j-q)) ((2*s+4).choose (j-q)) ((2*s+6).choose (j-q))
     (by positivity) (by positivity) (by positivity) h
     (by simpa [Nat.add_assoc] using h2)
   convert hh using 1 <;> congr 3 <;> omega
 · simp [horizontalTerm9a72,hq]

#print axioms choose_upper_stride_two9a72
#print axioms horizontal_term_lc9a72
end
end MathGKM.Markov
