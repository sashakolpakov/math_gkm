import MarkovDistanceTwo863a
/-! Machine-authored request 863a7482. Exact source-summand transport of a
distance-two midpoint comparison, with all zero cases retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem binomial_reverse_pair863 (n s q h : ℕ) (hs : 1 ≤ s) :
 ((n.choose s : ℚ)*((s+q+1).choose (q+2) : ℚ)*((2*s).choose h : ℚ))*
 (((n+2).choose (s+2) : ℚ)*((s+q+1).choose q : ℚ)*((2*s+4).choose (h+2) : ℚ)) ≤
 (((n+1).choose (s+1) : ℚ)*((s+q+1).choose (q+1) : ℚ)*
   ((2*s+2).choose (h+1) : ℚ))^2 := by
 have hb := rising_reverse863 s q
 have hc := stride_reverse863 s h hs
 have hp : (0:ℚ)<s*(s+1) := by
   have : (0:ℚ)<s := by exact_mod_cast (show 0<s by omega)
   positivity
 have hk :
 (((s+q+1).choose (q+2) : ℚ)*((2*s).choose h : ℚ))*
 (((s+q+1).choose q : ℚ)*((2*s+4).choose (h+2) : ℚ)) ≤
 (((s+q+1).choose (q+1) : ℚ)*((2*s+2).choose (h+1) : ℚ))^2 := by
   apply (mul_le_mul_iff_of_pos_left hp).mp
   have hh := mul_le_mul hb hc (by positivity) (by positivity)
   convert hh using 1 <;> ring
 have hh := mul_le_mul (choose_skew_lc863 n s) hk (by positivity) (sq_nonneg _)
 trace_state
 convert hh using 1 <;> ring

theorem horizontal_reverse_two863 (a j q s : ℕ) :
 horizontalTerm9a72 a j (q+2) s*horizontalTerm9a72 a j q (s+2) ≤
 horizontalTerm9a72 a j (q+1) (s+1)^2 := by
 by_cases hj : q+2 ≤ j
 · by_cases ha : q+2 ≤ a
   · have ht := binomial_reverse_pair863 (a-q-2) (s+1) q (j-q-2) (by omega)
     have hh :
       (horizontalTerm9a72 a j (q+2) s : ℚ)*horizontalTerm9a72 a j q (s+2) ≤
       (horizontalTerm9a72 a j (q+1) (s+1) : ℚ)^2 := by
       simp only [horizontalTerm9a72,if_pos hj,if_pos (show q ≤ j by omega),
         if_pos (show q+1 ≤ j by omega),Int.cast_mul,Int.cast_natCast]
       convert ht using 1 <;> congr 4 <;> norm_cast <;>
         first | omega | (congr 1 <;> omega)
     exact_mod_cast hh
   · have hz : horizontalTerm9a72 a j (q+2) s=0 := by
       simp [horizontalTerm9a72,hj,show a-(q+2)=0 by omega]
     rw [hz,zero_mul]; exact sq_nonneg _
 · have hz : horizontalTerm9a72 a j (q+2) s=0 := by simp [horizontalTerm9a72,hj]
   rw [hz,zero_mul]; exact sq_nonneg _

#print axioms binomial_reverse_pair863
#print axioms horizontal_reverse_two863
end
end MathGKM.Markov
