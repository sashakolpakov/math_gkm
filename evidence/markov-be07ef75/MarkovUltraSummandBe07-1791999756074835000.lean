import MarkovThreeCharge863a
/-! Machine-authored be07ef75. A stronger scaled inequality for individual
exact Pell summands. Closure under their sum remains unproved. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem choose_ultra_ambientBe07 (n a k : ℕ) (hna : n ≤ a) (hka : k+2 ≤ a) :
 (k+2 : ℚ)*(a-k)*(n.choose k : ℚ)*(n.choose (k+2) : ℚ) ≤
 (k+1 : ℚ)*(a-k-1)*(n.choose (k+1) : ℚ)^2 := by
 by_cases hk : k+2 ≤ n
 · have h0 := choose_lower_step67 n k (by omega)
   have h1 := choose_lower_step67 n (k+1) (by omega)
   push_cast at h1
   have he : (k+1 : ℚ)*(n-k-1)*(n.choose (k+1) : ℚ)^2 =
       (k+2 : ℚ)*(n-k)*(n.choose k : ℚ)*(n.choose (k+2) : ℚ) := by
     linear_combination (n-k-1 : ℚ)*(n.choose (k+1) : ℚ)*h0-
       (n-k : ℚ)*(n.choose k : ℚ)*h1
   have hp : (0:ℚ) < n-k := by
     have hh : (k:ℚ)<n := by exact_mod_cast (show k<n by omega)
     linarith
   have hnaQ : (0:ℚ) ≤ a-n := by
     have hh : (n:ℚ)≤a := by exact_mod_cast hna
     linarith
   have hid : (n-k : ℚ)*((k+1)*(a-k-1)*(n.choose (k+1) : ℚ)^2-
       (k+2)*(a-k)*(n.choose k : ℚ)*(n.choose (k+2) : ℚ)) =
       (k+1 : ℚ)*(a-n)*(n.choose (k+1) : ℚ)^2 := by
     linear_combination (a-k : ℚ)*he
   have hh : 0 ≤ (n-k : ℚ)*((k+1)*(a-k-1)*(n.choose (k+1) : ℚ)^2-
       (k+2)*(a-k)*(n.choose k : ℚ)*(n.choose (k+2) : ℚ)) := by
     rw [hid]; positivity
   have := (mul_nonneg_iff_of_pos_left hp).mp hh
   linarith
 · rw [Nat.choose_eq_zero_of_lt (by omega : n<k+2)]
   have ha : (0:ℚ) ≤ a-k-1 := by
     have hh : (k:ℚ)+1 ≤ a := by exact_mod_cast (show k+1 ≤ a by omega)
     linarith
   norm_num only [Nat.cast_zero,mul_zero]
   positivity

theorem horizontal_term_ultraBe07 (a j q s : ℕ) (hs : s+3 ≤ a) :
 (s+3 : ℤ)*(a-s-1)*horizontalTerm9a72 a j q s*horizontalTerm9a72 a j q (s+2) ≤
 (s+2 : ℤ)*(a-s-2)*horizontalTerm9a72 a j q (s+1)^2 := by
 by_cases hj : q ≤ j
 · have hA := choose_ultra_ambientBe07 (a-q) a (s+1) (Nat.sub_le _ _) (by omega)
   push_cast at hA
   have hB := choose_upper_lc6 (s+q) q
   have hC := choose_upper_stride_two9a72 (2*s+2) (j-q)
   have hBC := lc_product6
     ((s+q).choose q) ((s+q+1).choose q) ((s+q+2).choose q)
     ((2*s+2).choose (j-q)) ((2*s+4).choose (j-q)) ((2*s+6).choose (j-q))
     (by positivity) (by positivity) (by positivity) hB (by simpa using hC)
   have hBCQ :
     (((s+q).choose q : ℚ)*((2*s+2).choose (j-q) : ℚ))*
       (((s+q+2).choose q : ℚ)*((2*s+6).choose (j-q) : ℚ)) ≤
     (((s+q+1).choose q : ℚ)*((2*s+4).choose (j-q) : ℚ))^2 := by exact_mod_cast hBC
   have hmul := mul_le_mul hA hBCQ (by positivity)
     (show (0:ℚ) ≤ (s+1+1)*(a-(s+1)-1)*((a-q).choose (s+1+1) : ℚ)^2 by
       have ha : (0:ℚ) ≤ a-(s+1)-1 := by
         have hh : (s:ℚ)+2 ≤ a := by exact_mod_cast (show s+2 ≤ a by omega)
         linarith
       positivity)
   have hQ :
     (s+3 : ℚ)*(a-s-1)*(horizontalTerm9a72 a j q s : ℚ)*horizontalTerm9a72 a j q (s+2) ≤
     (s+2 : ℚ)*(a-s-2)*(horizontalTerm9a72 a j q (s+1) : ℚ)^2 := by
     simp only [horizontalTerm9a72,if_pos hj,Int.cast_mul,Int.cast_natCast]
     convert hmul using 1 <;>
       (try simp only [show s+1+1=s+2 by omega,show s+1+2=s+3 by omega,
         show s+1+q=s+q+1 by omega,show s+2+q=s+q+2 by omega,
         show 2*(s+1)+2=2*s+4 by omega,show 2*(s+2)+2=2*s+6 by omega]) <;> ring
   exact_mod_cast hQ
 · simp [horizontalTerm9a72,hj]

#print axioms choose_ultra_ambientBe07
#print axioms horizontal_term_ultraBe07
end
end MathGKM.Markov
