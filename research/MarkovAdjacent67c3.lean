import MarkovTruncatedFiber65c4
/-! Machine-authored request 67c3f3f5. Exact comparisons between the first
two horizontal summands, uniformly in all parameters. No sum LC assumption. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem ratio_cross67 (a b c d N M D E : ℚ)
 (ha : 0 ≤ a) (hc : 0 ≤ c) (hD : 0 < D) (hE : 0 < E)
 (h1 : b*D=a*N) (h2 : d*E=c*M) (h : M*D ≤ N*E) : a*d ≤ b*c := by
 have he : (b*c-a*d)*(D*E)=a*c*(N*E-M*D) := by
   linear_combination c*E*h1-a*D*h2
 have hp : 0 ≤ (b*c-a*d)*(D*E) := by rw [he]; positivity
 have := (mul_nonneg_iff_of_pos_right (mul_pos hD hE)).mp hp
 linarith

theorem choose_upper_two67 (n k : ℕ) (hk : k ≤ n+1) :
 ((n+2).choose k : ℚ)*(n+2-k)*(n+1-k)=
   (n.choose k : ℚ)*(n+2)*(n+1) := by
 have h1 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.choose_mul_succ_eq n k)
 have h2 := congrArg (fun z : ℕ => (z:ℚ)) (Nat.choose_mul_succ_eq (n+1) k)
 push_cast [Nat.cast_sub hk,Nat.cast_sub (show k ≤ n+1+1 by omega)] at h1 h2
 linear_combination -(n+2:ℚ)*h1-(n+1-k:ℚ)*h2

theorem choose_lower_step67 (n k : ℕ) (hk : k ≤ n) :
 (n.choose (k+1) : ℚ)*(k+1)=(n.choose k : ℚ)*(n-k) := by
 have h := congrArg (fun z : ℕ => (z:ℚ)) (Nat.choose_succ_right_eq n k)
 simpa only [Nat.cast_mul,Nat.cast_add,Nat.cast_one,Nat.cast_sub hk] using h

theorem choose_adjacent_first67 (n s : ℕ) :
 ((n+1).choose s : ℚ)*(n.choose (s+2) : ℚ)  ≤ 
   ((n+1).choose (s+1) : ℚ)*(n.choose (s+1) : ℚ) := by
 by_cases hs : s+2 ≤ n
 · apply ratio_cross67 _ _ _ _ (n+1-s) (n-(s+1)) (s+1) (s+2)
   · positivity
   · positivity
   · positivity
   · positivity
   · simpa only [Nat.cast_add,Nat.cast_one] using choose_lower_step67 (n+1) s (by omega)
   · convert choose_lower_step67 n (s+1) (by omega) using 1 <;> push_cast <;> ring
   · have hn : (s:ℚ)+2 ≤ n := by exact_mod_cast hs
     have hz : (0:ℚ) ≤ s := by positivity
     nlinarith
 · rw [Nat.choose_eq_zero_of_lt (by omega : n<s+2)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

theorem choose_adjacent_second67 (n s : ℕ) :
 (n.choose s : ℚ)*((n+1).choose (s+2) : ℚ)  ≤ 
   (n.choose (s+1) : ℚ)*((n+1).choose (s+1) : ℚ) := by
 by_cases hs : s+1 ≤ n
 · apply ratio_cross67 _ _ _ _ (n-s) (n-s) (s+1) (s+2)
   · positivity
   · positivity
   · positivity
   · positivity
   · exact choose_lower_step67 n s (by omega)
   · convert choose_lower_step67 (n+1) (s+1) (by omega) using 1 <;> push_cast <;> ring
   · have hn : (s:ℚ)+1 ≤ n := by exact_mod_cast hs
     nlinarith
 · rw [Nat.choose_eq_zero_of_lt (by omega : n+1<s+2)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

theorem stride_first_certificate67 (s h : ℚ) (hs : 1 ≤ s) (hh : 0 ≤ h)
 (hr : h+1 ≤ 2*s) :
 (s+2)*(2*s+4)*(2*s+3)*(2*s+1-h)*(2*s-h)  ≤ 
 (2*s+2)*(2*s+1)*(s+1)*(2*s+4-h)*(2*s+3-h) := by
 let r := 2*s-h-1
 have hr0 : 0 ≤ r := by dsimp [r]; linarith
 have he : s=(h+r+1)/2 := by dsimp [r]; ring
 have hid :
 (2*s+2)*(2*s+1)*(s+1)*(2*s+4-h)*(2*s+3-h)-
 (s+2)*(2*s+4)*(2*s+3)*(2*s+1-h)*(2*s-h)=
 80+76*r+22*r^2+2*r^3+145*h+129*h*r+35*h*r^2+3*h*r^3+
 66*h^2+42*h^2*r+6*h^2*r^2+9*h^3+3*h^3*r := by rw [he]; ring
 have hp : 0 ≤ 80+76*r+22*r^2+2*r^3+145*h+129*h*r+35*h*r^2+3*h*r^3+
 66*h^2+42*h^2*r+6*h^2*r^2+9*h^3+3*h^3*r := by positivity
 linarith

theorem stride_second_certificate67 (s h : ℚ) (hs : 1 ≤ s) (hh : 0 ≤ h)
 (hr : h ≤ 2*s) :
 (2*s+4)*(2*s+3)*s*(2*s+2-h)*(2*s+1-h)  ≤ 
 (s+1)*(2*s+2)*(2*s+1)*(2*s+3-h)*(2*s+2-h) := by
 have hid :
 (s+1)*(2*s+2)*(2*s+1)*(2*s+3-h)*(2*s+2-h)-
 (2*s+4)*(2*s+3)*s*(2*s+2-h)*(2*s+1-h)=
 2*(2*s+2-h)*((2*s^2+2*s-1)*(h+1)+2*s^2+6*s+4) := by ring
 have hp : 0 ≤ 2*(2*s+2-h)*((2*s^2+2*s-1)*(h+1)+2*s^2+6*s+4) := by
   apply mul_nonneg
   · nlinarith
   · have : 0 ≤ 2*s^2+2*s-1 := by nlinarith [sq_nonneg s]
     have hs0 : 0 ≤ s := by linarith
     positivity
 linarith

theorem stride_adjacent_first67 (s h : ℕ) (hs : 1 ≤ s) :
 ((2*s).choose (h+1) : ℚ)*((s+2)*( (2*s+4).choose h : ℚ))  ≤ 
 ((2*s+2).choose (h+1) : ℚ)*((s+1)*((2*s+2).choose h : ℚ)) := by
 by_cases hh : h+1 ≤ 2*s
 · apply ratio_cross67 _ _ _ _ ((2*s+2)*(2*s+1))
     ((s+2)*(2*s+4)*(2*s+3)) ((2*s+1-h)*(2*s-h))
     ((s+1)*(2*s+4-h)*(2*s+3-h))
   · positivity
   · positivity
   · have : (h:ℚ)+1 ≤ 2*s := by exact_mod_cast hh
     apply mul_pos <;> linarith
   · have : (h:ℚ)+1 ≤ 2*s := by exact_mod_cast hh
     apply mul_pos
     · apply mul_pos <;> linarith
     · linarith
   · convert choose_upper_two67 (2*s) (h+1) (by omega) using 1 <;> push_cast <;> ring
   · have he := choose_upper_two67 (2*s+2) h (by omega)
     push_cast at he
     linear_combination (s+1:ℚ)*(s+2)*he
   · simpa only [mul_assoc] using stride_first_certificate67 s h (by exact_mod_cast hs) (by positivity)
       (by exact_mod_cast hh)
 · rw [Nat.choose_eq_zero_of_lt (by omega : 2*s<h+1)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

theorem stride_adjacent_second67 (s h : ℕ) (hs : 1 ≤ s) :
 ((s:ℚ)*((2*s).choose h : ℚ))*((2*s+4).choose (h+1) : ℚ)  ≤ 
 ((s+1)*((2*s+2).choose h : ℚ))*((2*s+2).choose (h+1) : ℚ) := by
 by_cases hh : h ≤ 2*s
 · apply ratio_cross67 _ _ _ _ ((s+1)*(2*s+2)*(2*s+1))
     ((2*s+4)*(2*s+3)) (s*(2*s+2-h)*(2*s+1-h))
     ((2*s+3-h)*(2*s+2-h))
   · positivity
   · positivity
   · have ht : (h:ℚ) ≤ 2*s := by exact_mod_cast hh
     have hp : (0:ℚ)<s := by exact_mod_cast (show 0 < s by omega)
     apply mul_pos
     · exact mul_pos hp (by linarith)
     · linarith
   · have : (h:ℚ) ≤ 2*s := by exact_mod_cast hh
     apply mul_pos <;> linarith
   · have he := choose_upper_two67 (2*s) h (by omega)
     push_cast at he
     linear_combination (s:ℚ)*(s+1)*he
   · convert choose_upper_two67 (2*s+2) (h+1) (by omega) using 1 <;> push_cast <;> ring
   · simpa only [mul_assoc] using stride_second_certificate67 s h (by exact_mod_cast hs) (by positivity)
       (by exact_mod_cast hh)
 · rw [Nat.choose_eq_zero_of_lt (by omega : 2*s<h)]
   norm_num only [Nat.cast_zero,mul_zero,zero_mul]
   positivity

#print axioms stride_adjacent_first67
#print axioms stride_adjacent_second67
end
end MathGKM.Markov
